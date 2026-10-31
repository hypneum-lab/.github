# Upstream contributions — candidate plan (2026-10-31)

*Status of every line: **proposed, nothing sent.** Each item is sent only on the PI's explicit decision, one at a time, after a human read of the patch or text.*

Ranking criterion: value for the host project divided by the lab's cost, with the constraint that nothing is sent during a frozen campaign if it touches the campaign's code.

| # | Target | Contribution | Cost | Prerequisite | Why it is worth it |
|---|---|---|---|---|---|
| 1 | [`ml-explore/mlx#3568`](https://github.com/ml-explore/mlx/issues/3568) (Apple) | follow-up comment with the current cross-architecture table (M1 g13s, M3 Pro g15s, M3 Ultra, M5 g17g) and the exact MLX versions; offer a documentation PR, "determinism across Apple Silicon GPUs", if maintainers want one | half a day | re-run the `nerve-wml` bit-exact tests on macM1 and macM3 with the pinned MLX | the issue has been open five months with two comments; a table is what moves it; it is also the lab's declared exception in every pre-registration |
| 2 | [`openai/procgen`](https://github.com/openai/procgen) | PR with `procgen-0.10.7-arm64-build.patch` (Apple Silicon build) and the Python 3.10 lock | one day | check that the repository still accepts PRs (last push 2026-03-27); strip lab-specific paths | the only known arm64 recipe; benefits every Apple Silicon user of Procgen |
| 3 | [`NM512/dreamerv3-torch`](https://github.com/NM512/dreamerv3-torch) | bug fixes and the RSSM interface hooks found during the N11-C port | conditional | N11-C port resumed (deferred) | only if the port goes ahead; otherwise nothing |
| 4 | [`facebookresearch/jepa-wms`](https://github.com/facebookresearch/jepa-wms) | issue report only, if the N11-A comparator evaluation finds a reproducibility defect; no code (CC-BY-NC-4.0 licence) | conditional | N11-A resumed (deferred) | comparator use only |
| 5 | ReScience C | submission of `rescience-nh01` | PI proofread of the PDF | nothing else | already in flight; the review passes are published with the package |
| 6 | Hugging Face `hypneum-lab` | model cards and dataset cards aligned with the Zenodo records (DOIs, licences, provenance) | one day | none | the organisation exists since 2026-10-25; cards are the missing piece |
| 7 | OSF | file the four drafted amendments (N10-A, N10-C, N11-A, N11-C) | half a day | PI decisions on the open points | closes the pre-registration loop declared on the profile page |

Not proposed: pull requests to `facebookresearch/ijepa`, `google-deepmind/*` or `anthropics/*`. The lab has nothing to add there today, and a contribution made to be seen is not a contribution.

Suggested order if the PI goes ahead: 1, then 6, then 2; 5 and 7 are already on the PI's list; 3 and 4 wait for their studies.
