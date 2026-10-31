# Upstream plan v3 — from one-off contributions to recognised contributor or member (2026-10-31)

*Decided by the PI on 2026-10-31. Budget: **2 h/week in addition to the 10 h/week Hypneum ceiling**, so 12 h/week of lab time in total; merged contributions count as deliveries of the three-year plan. Processes below were read on 2026-10-31 and are recorded with their verification status in [`upstream-membership-factsheet-2026-10-31.md`](upstream-membership-factsheet-2026-10-31.md). The v2 plan (one-off contributions, items 1–8) stays in force; this page adds the standing presence.*

## What "member" can mean, and what is reachable

| Kind | Examples | Reachable from outside? |
|---|---|---|
| GitHub organisation of a large laboratory | `ml-explore` (Apple), `facebookresearch`, `google-deepmind`, `openai`, `anthropics` | No: employees only. Reachable status = **contributor** (merged pull requests, known to the maintainers). |
| Community adjacent to a large laboratory with a documented ladder | `modelcontextprotocol` (Member after 2–3 months, ≥ 1 merged PR and two sponsors, giving org membership and triage rights; Maintainer after 6+ months), `mlx-community` on Hugging Face (request-to-join button, admin approval) | **Yes**, documented. |
| Open research community | EleutherAI (Discord, no membership process), Farama Foundation (open Discord/GitHub; 12 core members; no documented path to maintainer found), ML Collective (open, no tier), Cohere Labs Open Science Community (application reviewed weekly) | Yes, but "member" is informal except Cohere Labs. |
| Recognised role in a reproducibility venue | ReScience C reviewer (comment on `ReScience/ReScience#27`), JOSS reviewer (sign-up form, editors pick reviewers), Software Heritage Ambassador (contact form, listed by name) | **Yes**, by application. |

## Targets chosen by the PI, with the status each can realistically yield

| # | Target | Lab asset that justifies it | Status aimed at | 3-month milestone (end of January 2027) | 6-month milestone (end of April 2027) |
|---|---|---|---|---|---|
| A | **Apple MLX** (`ml-explore/mlx`, `mlx-lm`) + **`mlx-community`** | every experiment runs on MLX; `mlx#3568` filed and followed up; LoRA training experience from `micro-kiki` | contributor to `mlx` (≥ 1 merged PR); member of `mlx-community` | join request sent to `mlx-community` and one conversion published there with a sourced card; the `mlx#3568` docstring PR opened if the maintainers accept option (b); one `mlx-lm` bug report with reproducer | ≥ 1 PR merged in `mlx` or `mlx-lm`; two conversions on `mlx-community`; the lab named in the `mlx` contributors list |
| B | **EleutherAI `lm-evaluation-harness`** | `iact-bench` (31 domains, ~46 validators, NDJSON audit trail) | contributor (merged task); present on the EleutherAI Discord | one `iact-bench` domain ported as a YAML task with versioning and `tasks/README.md` entry, PR opened | task merged; a second task or a fix merged |
| C | **Farama Foundation** (Gymnasium, MiniGrid) | `baby-brain` harness uses `gymnasium>=1.0` and MiniGrid | contributor; maintainer only if Farama opens a path (none documented today) | one issue with reproducer or one PR from the `baby-brain` work; present on the Farama Discord | ≥ 1 PR merged; ask the core team explicitly whether MiniGrid needs a co-maintainer |
| D | **Recognised reviewer roles** | ReScience C submission `rescience-nh01`; `paper-methodo-2026`; Software Heritage archives of every freeze | ReScience C reviewer; JOSS reviewer; Software Heritage Ambassador | the three applications sent by the PI (ReScience issue #27 comment, JOSS reviewer form, SWH ambassadors form) | first review completed for one of the venues; listed on the ReScience reviewers page or the SWH ambassadors page |

Optional, not selected yet: **`modelcontextprotocol`**, the only organisation in the list with a written ladder to membership, matched by the lab's MCP servers (`kicad-mcp-pro`, 49 tools, in production for `iact-bench`). A first PR there in Q1 2027 would start the 2–3-month clock. Decision pending.

## Rules of the standing presence

1. **Rotation.** One contribution a month, rotating A → B → C; D is applications, done once. The 2 h/week are spent on one target at a time.
2. **Same quality bar as v2.** Reproducer, tests, versions, hardware named; verified before sending; read and sent by the PI; AI assistance declared as in the repositories' note.
3. **Presence without noise.** No "+1" comments, no drive-by reviews. On Discord, answer questions in the lab's own area (MLX on Apple Silicon reproducibility, evaluation harnesses, pre-registration) and nothing else.
4. **Compute.** Contributions never run on a campaign host; pilots on macM3 or electron-server.
5. **Stop rule.** A target with no maintainer reply after two contributions over four months is paused and the time goes to the others.

## Tracking

Each contribution: one line in `docs/profile-journal-2026.md` and the row of `docs/related-work-upstream.md` §3. Monthly check at the roadmap check-in: contributions sent, replies, merges, memberships obtained. The 3- and 6-month milestones above are reviewed on 2027-01-31 and 2027-04-30.
