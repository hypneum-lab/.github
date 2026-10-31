# Membership fact sheet (all pages read 2026-10-31)

## 1. Hugging Face org mlx-community
- Process: org page shows a "Request to join this org" button (https://huggingface.co/mlx-community); HF docs: if "Allow requests to join from the organization page" is enabled, org admins approve/reject on the Members page (https://huggingface.co/docs/hub/organizations-managing). Discord/form: none org-specific found.
- Eligibility, delay: unverified. Approver: org admins (names unverified).
- Status: org membership (role unverified).
- Publishing: README says use `mlx_lm.convert ... --upload-repo mlx-community/<name>` (https://huggingface.co/spaces/mlx-community/README). Naming pattern (e.g. `-4bit`) is only inferred from examples. Written rules on README/licences: unverified.

## 2. ml-explore/mlx and mlx-lm
- Docs: https://github.com/ml-explore/mlx/blob/main/CONTRIBUTING.md ; https://github.com/ml-explore/mlx-lm/blob/main/CONTRIBUTING.md
- mlx: issue first for features ("Please do not start with a pull request"); `pre-commit run --all`; tests required (`python3 python/tests/run.py`); maintainers approve each CI run; AI use allowed, contributor responsible. No CLA mentioned; repo MIT (Apple Inc.).
- mlx-lm: new-model PRs use `new_model.md`; tests in tests/test_models.py; AI disclosure; licence = repo LICENSE. No CLA mentioned.
- Docs-PR review process and any role beyond contributors list: unverified (none stated).

## 3. EleutherAI lm-evaluation-harness
- New task: fork, branch, YAML in lm_eval/tasks/<dataset>, `metadata: version: 0`, task name mandatory, validity checklist, PR to `main`, add entry to lm_eval/tasks/README.md (https://github.com/EleutherAI/lm-evaluation-harness/blob/main/docs/new_task_guide.md).
- Review: reviewer counts/rules not stated; questions in `#lm-thunderdome` on Discord (https://discord.gg/eleutherai).
- Joining: public Discord; no membership process stated (https://eleuther.ai/community). "EleutherAI member" meaning: unverified. Status: contributor (PR author); delay unverified.

## 4. Farama Foundation (Gymnasium, MiniGrid)
- https://farama.org/about: "led by 12 core members"; community "open to anyone", organised on Discord and GitHub; no formal joining process, no governance text.
- https://farama.org/team: no path to core member/maintainer stated; MiniGrid maintainer listed: Marek Wydmuch (only one).
- MiniGrid README: public Discord (https://discord.gg/bnJ6kubTg6) also used for development; no call for maintainers found. CONTRIBUTING for MiniGrid and Gymnasium: 404/not retrieved, unverified.
- Status obtained: unverified beyond contributor.

## 5. ReScience C
- Reviewer: comment on https://github.com/ReScience/ReScience/issues/27 (https://rescience.github.io/board/); reviewers are volunteers, listed publicly (~100, field, languages, ORCID) separately from the Editorial Board (Editors-in-Chief, Associate Editors). Board entry criteria: unverified.
- Submission: an issue in ReScience/submissions with article PDF URL, YAML metadata URL, code URL (mandatory), optional data and editor/reviewer suggestions (https://github.com/ReScience/submissions). Editor from the Board assigned if expertise exists, public review by reviewers and editor (https://rescience.github.io/faq/). Delays: not stated.

## 6. JOSS reviewer
- Sign-up: https://reviewers.joss.theoj.org (GitHub login). Editors select reviewers; unsolicited offers in review threads generally not accepted (https://joss.readthedocs.io/en/latest/reviewer_guidelines.html).
- Criteria: no formal qualifications stated; conflict-of-interest rules (collaborators within 4 years, same employer within 1 year, etc.). Timing: first pass ~2-4 weeks, review 4-6 weeks.
- Public listing: reviews are public, non-anonymous on GitHub issues (https://joss.theoj.org/about); listing on published paper pages: unverified.

## 7. Software Heritage Ambassadors
- Process: choose area (academia, cultural heritage, industry, public administration) and submit the contact form "tell us a bit about yourself and your interest in the mission" at https://www.softwareheritage.org/ambassadors/ ; charter: https://www.softwareheritage.org/ambassadors-charter/ (text not retrieved: obligations, delay, formal eligibility unverified).
- Stated activities: present SWH, share on lists/social media, identify platforms to archive, feed back. SWH offers material, team access, name+affiliation acknowledged, promotional items. Individuals and organisations may volunteer.
- Status: listed ambassador (name/affiliation on page). Plenary meeting/unpaid: from search summary only, unverified.

## 8. modelcontextprotocol organisation
- Governance: https://modelcontextprotocol.io/community/governance ; ladder: https://modelcontextprotocol.io/community/contributor-ladder (SEP-2148); WG/IG: SEP-2149.
- Ladder: Contributor (no requirements) > Member (2-3 months, >=1 merged PR, 2FA, sponsored by 2 Members/Maintainers from different orgs or 1 Core/Lead; 7-day review; gets org membership, triage rights, roster listing) > Maintainer (6+ months as Member, sponsor + Core Maintainer approval, MAINTAINERS.md) > Core. Self-nomination allowed via nomination issue. WG Lead/IG Facilitator need Member status.
- Contribution guide: Node 24+, SEP process for spec changes, AI disclosure. CLA: none mentioned; contributions Apache-2.0 (docs CC-BY 4.0) (https://github.com/modelcontextprotocol/modelcontextprotocol/blob/main/CONTRIBUTING.md).

## 9. openai/gpt-oss and openai/harmony
- gpt-oss README: "Outside of bug fixes we do not intend to accept new feature contributions"; no CONTRIBUTING file seen; no CLA mentioned (https://github.com/openai/gpt-oss). Answer: YES, limited. External merged example: #251 "Harden YouComBackend search response parsing" by tyler5673 (merged Oct 2026 per PR list; list dates not strictly ordered) (https://github.com/openai/gpt-oss/pulls?q=is%3Apr+is%3Amerged).
- harmony: no CONTRIBUTING/CLA statement found (https://github.com/openai/harmony). Recent merged PRs: only OpenAI-affiliated (likely) in 2026 (#112 Apr 2026); external ones (bbrowning #83, Nov 2025) are older than 3 months. Answer: policy unverified; no external merge in last 3 months seen.

## 10. ML Collective and Cohere Labs
- ML Collective (https://mlcollective.org/): no application process or membership tier stated; open to anyone regardless of affiliation; get involved via events, Open Collab Discord, reading group, or email hello@mlcollective.org. Status: none formal (unverified).
- Cohere Labs Open Science Community: apply at https://cohere.com/research/open-science/application ("Join us"; applications reviewed weekly; page body itself not retrievable). No formal eligibility stated. Gives: subgroups, events/talks, collaboration, community blog feature (https://cohere.com/research/open-science). Compute access claim from /research page, unverified.
