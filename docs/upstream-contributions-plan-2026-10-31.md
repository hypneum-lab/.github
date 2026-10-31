# Upstream contributions — plan (v2, 2026-10-31)

*Goal set by the PI on 2026-10-31: make the lab visible to the large laboratories whose work it builds on through technical contributions that are modest and real. Status of every item: **proposed, nothing sent**, unless the line says otherwise. Each item is sent by the PI, one at a time, after a human read.*

## Principles

1. **Only what the lab's work already produced.** Bug reports with a reproducer, test reports on an open pull request, reproducibility data, documentation fixes. No feature a study did not need.
2. **One contribution a month**, inside the 10 h/week ceiling of the roadmap. A merged pull request or a maintainer reply counts as one of the two monthly deliveries of the three-year plan.
3. **Traceable.** Every contribution is linked from `docs/related-work-upstream.md` and the yearly journal with its date, target and outcome.
4. **Verified before sending.** A table is re-run on the day it is posted; a patch is tested on a clean clone; a test report names the hardware, OS and versions.
5. **No drive-by.** No pull request to a repository the lab does not use; no AI-written text sent without the PI having read and edited it; the AI-assistance note of the repositories applies.
6. **Targets = dependencies.** Apple MLX, OpenAI Procgen, Hugging Face Hub, `dreamerv3-torch`, Meta JEPA-WMs, ReScience C, `elliottower/reproducible-science`, OSF.

## State on 2026-10-31

| Target | Lab's existing footprint | Fact checked today |
|---|---|---|
| [`ml-explore/mlx#3568`](https://github.com/ml-explore/mlx/issues/3568) | issue filed 2026-05-20 with a 4-host table at MLX 0.31.2 and a root-cause trace (`erfinv` FMA chain); labels `enhancement`, `low priority`; no maintainer reply | re-run at **MLX 0.32.4** (2026-10-14) on M3 Pro, M3 Ultra and M5: all 19 probes bit-identical across the three, hashes unchanged since May; release notes 0.32.0–0.32.4 mention nothing on `erfinv` or `random.normal`; the M1 side is not re-tested yet (macM1 carries N10-C) |
| [`openai/procgen#107`](https://github.com/openai/procgen/pull/107) | the lab keeps its own arm64 build patch in `nerve-wml` | a pull request fixing the Apple Silicon build already exists (opened 2026-07-07, 1 commit, 0 reviews, 2 comments); the lab's patch is redundant with it |
| Hugging Face `hypneum-lab` | 6 models published 2026-10-25 with `license: apache-2.0` and a README card each (revisions of 2026-10-25); no dataset | the earlier "no licence, no card" reading came from the list endpoint, which omits card data; six rewritten card drafts exist locally with open questions for the PI (CITATION.cff says MIT vs Apache-2.0 elsewhere; `reasoning` adapter missing on the Hub; two Qwen3.5 bases unconfirmed; spikingkiki public despite the 2026-10-25 erratum) |
| [`elliottower/reproducible-science#256`](https://github.com/elliottower/reproducible-science/issues/256) | proposal filed by the PI on 2026-10-31 (tag-aware freezes, Software Heritage record, opt-in gate) | 0 comments; wait for the maintainer |
| `dreamerv3-torch`, `facebookresearch/jepa-wms` | targets of N11-C and N11-A | both studies deferred; nothing to send |
| ReScience C | `rescience-nh01` reviewed and ready | submission this week after the PI's proofread of the PDF |

## Pipeline

| # | When | Target | Contribution | Cost | Done when |
|---|---|---|---|---|---|
| 1 | **sent 2026-10-31** ([comment](https://github.com/ml-explore/mlx/issues/3568#issuecomment-6543235348)) | `ml-explore/mlx#3568` | comment: the 0.32.4 re-test table (M1 added once macM1 is free), the hashes stable since 0.31.2, and a question to the maintainers: a portable code path for `erfinv`, or a documentation note on cross-architecture non-determinism of `random.normal`; offer to write the docs PR | half a day | maintainer reply, or docs PR merged |
| 2 | **sent 2026-10-31** ([report](https://github.com/openai/procgen/pull/107#issuecomment-6543235775)); nerve-wml pointer pending merge | `openai/procgen#107` | test the open PR on a clean clone (M1 Max macOS 27, M3 Pro) and post a test report in the PR; replace the lab's patch in `nerve-wml` by a pointer to #107 once it is merged | half a day | report posted; #107 merged or answered |
| 3 | Nov, week 2 | Hugging Face `hypneum-lab` | model cards for the 6 models: licence, Zenodo DOI, base model, training data pointer, evaluation pointer, the AI-assistance note; dataset cards when datasets are pushed | one day + PI token | cards live, licence field set |
| 4 | Nov | ReScience C | submission of `rescience-nh01` | PI proofread | issue opened on ReScience/submissions |
| 5 | Dec | `elliottower/reproducible-science#256` | if welcomed: pull request with the opt-in gate and the Software Heritage record, tests included | two days | PR open |
| 6 | 2027, with N11-C | `dreamerv3-torch` | bug fixes and RSSM interface hooks found during the port | conditional | — |
| 7 | 2027, with N11-A | `facebookresearch/jepa-wms` | reproducibility issue only if found (CC-BY-NC-4.0, no code) | conditional | — |
| 8 | opportunistic | `ml-explore/mlx-lm` | bug reports with reproducer from the `micro-kiki` LoRA training when hit | as it comes | — |

Suggested order: 1, 2, 3 in November; 4 is the PI's; 5 waits for a reply; 6–8 wait for their studies.

## What we do not do

No pull request to `facebookresearch/ijepa`, `google-deepmind/*` or `anthropics/*`: the lab has nothing to add there today. No contribution sent during a frozen campaign if it touches the campaign's code. No contribution made to be seen; the visibility comes from the maintainers' replies, not from the sending.

## Tracking

A line per contribution in `docs/profile-journal-2026.md` (date, target, link, outcome) and a row update in `docs/related-work-upstream.md` §3. Review at the monthly roadmap check-in: contributions sent, replies received, merged.
