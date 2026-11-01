#!/usr/bin/env python3
"""Resolve every arXiv id and DOI found in a Markdown file (stdlib only).

Usage: resolve_ids.py <file.md>
Output (stdout): id<TAB>status(ok|ko)<TAB>title[<TAB>first author]
Exit code: number of ko lines.
arXiv: https://arxiv.org/abs/<id> (neutral User-Agent, 3 s between calls).
DOI: https://api.crossref.org/works/<doi>.
"""
import html
import json
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

UA = "hypneum-lab reading-gate"
ARXIV_RE = re.compile(r"(?:arxiv[:\s/]+(?:abs/|pdf/)?|arxiv\.org/(?:abs|pdf)/)(\d{4}\.\d{4,5})(?:v\d+)?", re.I)
DOI_RE = re.compile(r"\b(10\.\d{4,9}/[^\s\"<>)\]]+)")
_last_arxiv = 0.0


def _get(url, timeout=30):
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return r.read().decode("utf-8", "replace")


def resolve_arxiv(aid):
    """Return (ok, title, first_author)."""
    global _last_arxiv
    wait = 3.0 - (time.time() - _last_arxiv)
    if wait > 0:
        time.sleep(wait)
    _last_arxiv = time.time()
    try:
        page = _get(f"https://arxiv.org/abs/{aid}")
    except urllib.error.HTTPError as e:
        return False, f"HTTP {e.code}", ""
    except Exception as e:  # network error: unverified
        return False, f"erreur: {e}", ""
    m = re.search(r'<meta name="citation_title" content="([^"]*)"', page)
    if not m:
        return False, "titre introuvable", ""
    a = re.search(r'<meta name="citation_author" content="([^"]*)"', page)
    return True, html.unescape(m.group(1)).strip(), html.unescape(a.group(1)) if a else ""


def resolve_doi(doi):
    try:
        data = json.loads(_get("https://api.crossref.org/works/" + urllib.parse.quote(doi)))
    except urllib.error.HTTPError as e:
        return False, f"HTTP {e.code}", ""
    except Exception as e:
        return False, f"erreur: {e}", ""
    msg = data.get("message", {})
    title = (msg.get("title") or [""])[0]
    auth = (msg.get("author") or [{}])[0]
    first = " ".join(x for x in (auth.get("given"), auth.get("family")) if x)
    return bool(title), re.sub(r"\s+", " ", html.unescape(title)).strip() or "titre introuvable", first


def extract(text):
    ids, seen = [], set()
    for m in ARXIV_RE.finditer(text):
        k = ("arXiv:" + m.group(1), "arxiv", m.group(1))
        if k[0] not in seen:
            seen.add(k[0]); ids.append(k)
    for m in DOI_RE.finditer(text):
        doi = m.group(1).rstrip(".,;:")
        if doi.lower().startswith("10.48550/arxiv."):
            continue
        k = (doi, "doi", doi)
        if k[0] not in seen:
            seen.add(k[0]); ids.append(k)
    return ids


def main(argv):
    if len(argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2
    text = open(argv[1], encoding="utf-8").read()
    ko = 0
    for label, kind, raw in extract(text):
        ok, title, first = resolve_arxiv(raw) if kind == "arxiv" else resolve_doi(raw)
        ko += 0 if ok else 1
        print(f"{label}\t{'ok' if ok else 'ko'}\t{title}" + (f"\t{first}" if first else ""))
        sys.stdout.flush()
    return ko


if __name__ == "__main__":
    sys.exit(main(sys.argv))
