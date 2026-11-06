#!/usr/bin/env python3
"""One-level citation snowball (stdlib only).

Usage: citation_snowball.py --ids arXiv:2201.00032,DOI:10.xxx --depth 1 --out snowball.tsv
TSV columns: direction(amont|aval) id year title first_author source_api
amont = references of the seed; aval = papers citing the seed.
Semantic Scholar first (batch POST via the s2.py skill script when present, else
direct POST graph/v1/paper/batch), OpenAlex as fallback. Depth > 1 is not
supported: depth 1 only (larger values are clamped with a warning).
"""
import argparse
import importlib.util
import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

UA = "hypneum-lab reading-gate"
S2 = "https://api.semanticscholar.org/graph/v1"
S2_SCRIPT = "/Users/electron/.claude/skills/semantic-scholar/scripts/s2.py"
FIELDS = ("title,year,externalIds,"
          "references.title,references.year,references.externalIds,references.authors,"
          "citations.title,citations.year,citations.externalIds,citations.authors")


def load_s2():
    if not os.path.exists(S2_SCRIPT):
        return None
    try:
        spec = importlib.util.spec_from_file_location("s2mod", S2_SCRIPT)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        return mod
    except Exception as e:
        print(f"s2.py inutilisable: {e}", file=sys.stderr)
        return None


def s2_fetch(ids):
    mod = load_s2()
    if mod:
        return mod.s2_batch(ids, FIELDS)
    req = urllib.request.Request(f"{S2}/paper/batch?fields={urllib.parse.quote(FIELDS)}",
                                 data=json.dumps({"ids": ids}).encode(),
                                 headers={"User-Agent": UA, "Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return dict(zip(ids, json.load(r)))


def pid(p):
    e = p.get("externalIds") or {}
    if e.get("ArXiv"):
        return "arXiv:" + e["ArXiv"]
    if e.get("DOI"):
        return "DOI:" + e["DOI"]
    return "S2:" + (p.get("paperId") or "?")


def rows_s2(rec):
    out = []
    for key, direction in (("references", "amont"), ("citations", "aval")):
        for p in rec.get(key) or []:
            if not p or not p.get("title"):
                continue
            au = (p.get("authors") or [{}])[0].get("name", "")
            out.append((direction, pid(p), str(p.get("year") or ""), p["title"], au, "s2"))
    return out


def oa_get(url):
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.load(r)


def oa_row(direction, w):
    ids = w.get("ids") or {}
    doi = (ids.get("doi") or "").replace("https://doi.org/", "")
    ident = ("DOI:" + doi) if doi else w.get("id", "")
    au = ((w.get("authorships") or [{}])[0].get("author") or {}).get("display_name", "")
    return (direction, ident, str(w.get("publication_year") or ""), w.get("title") or "", au, "openalex")


def rows_openalex(seed):
    if seed.lower().startswith("arxiv:"):
        a = seed.split(":", 1)[1]
        url = "https://api.openalex.org/works/doi:10.48550/arXiv." + a
    else:
        url = "https://api.openalex.org/works/doi:" + seed.split(":", 1)[1]
    w = oa_get(url)
    out = []
    refs = w.get("referenced_works") or []
    for i in range(0, len(refs), 50):
        chunk = "|".join(r.rsplit("/", 1)[1] for r in refs[i:i + 50])
        d = oa_get("https://api.openalex.org/works?per-page=50&filter=openalex_id:" + chunk)
        out += [oa_row("amont", x) for x in d.get("results", [])]
        time.sleep(0.2)
    cite = w.get("cited_by_api_url")
    if cite:
        cur = "*"
        for _ in range(4):  # up to 800 citing works
            d = oa_get(f"{cite}&per-page=200&cursor={cur}")
            out += [oa_row("aval", x) for x in d.get("results", [])]
            cur = (d.get("meta") or {}).get("next_cursor")
            if not cur:
                break
            time.sleep(0.2)
    return out


def norm(s):
    s = s.strip()
    if s.lower().startswith("doi:"):
        return "DOI:" + s[4:]
    if s.lower().startswith("arxiv:"):
        return "arXiv:" + s[6:]
    return s


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--ids", required=True)
    ap.add_argument("--depth", type=int, default=1)
    ap.add_argument("--out", required=True)
    a = ap.parse_args()
    if a.depth != 1:
        print("depth > 1 non supporté, depth=1 utilisé", file=sys.stderr)
    seeds = [norm(s) for s in a.ids.split(",") if s.strip()]
    rows, seen = [], set()
    try:
        res = s2_fetch(seeds)
    except Exception as e:
        print(f"S2 indisponible ({e}); repli OpenAlex", file=sys.stderr)
        res = {}
    for s in seeds:
        r = rows_s2(res[s]) if res.get(s) else []
        if not r:
            try:
                r = rows_openalex(s)
                print(f"{s}: OpenAlex", file=sys.stderr)
            except Exception as e:
                print(f"{s}: non vérifié ({e})", file=sys.stderr)
        for row in r:
            k = (row[0], row[1], row[3])
            if k not in seen:
                seen.add(k); rows.append(row)
    with open(a.out, "w", encoding="utf-8") as f:
        for row in rows:
            f.write("\t".join(x.replace("\t", " ").replace("\n", " ") for x in row) + "\n")
    print(f"{len(rows)} lignes -> {a.out}", file=sys.stderr)


if __name__ == "__main__":
    main()
