# Profile journal 2026

Dated milestone entries and snapshot notes formerly kept on the organisation profile page (`profile/README.md`). Moved here on 2026-10-25 when the profile was rewritten as a current-state page ; the text is preserved as written, including the 2026-10-23 correction notes.

---

## 2026-05-11 portfolio milestones — N8 → N14 sprints

Six-sprint push closed tonight across the three active scientific
repos (`nerve-wml`, `dream-of-kiki`, `bouba_sens`) :

- **12 OSF-style pre-registrations** cumulative across the programme
  (N1 → N14), all locked before evidence collection.
- **7 verdicts shipped** on the GammaThetaMultiplexer + plasticity
  axis :
  - N8 Q1 GTM benchmark on HardFlowProxyTask N=2 → **tied**
  - N9 Q1+ scaling N=16 → **tied-stable**
  - N9 Q1++ FlowProxyTask 4-class → **tied-stable-cross-task**
  - N8 Q2 15 adversarial substrates Cat A/B/C → **`ge_3_FP_reformulate`**, Conformance Criterion strengthened to **C+** (now requires C2 axiom property tests)
  - N9 Q2+ Cat D / E / F (10 more) → **25 / 25 cumulative FP**
  - N9 Q3 INTERIM Retract (Jonckheere wrong test) →
  - **N9 Q3+ FINAL Retract** on `bouba_sens` §5.5 (quadratic regression, sign p=0.62, t-test p=0.28). TMLR submission BLOCKED until reformulation.
- **5 pre-regs deferred** to future scaling sprints (N10-A ImageNet
  + ResNet50 + GTM bottleneck β-VAE β=1.0, N10-C Procgen multi-agent,
  N11-A I-JEPA + GTM predictor, N11-C Dreamer V3 + GTM dynamics on
  Atari-100k, N13 OFAT + N14 Latin Hypercube — all locked tonight,
  implementations gated on hardware capacity).
- **N12 subgroup replication RUNNING** on `root@kx6tm-23` (Hypneum
  compute node bootstrapped 2026-05-11), tactile-floor +
  force-plus10 candidates from `bouba_sens` pooled-v2 discovery,
  N=20 seeds, ETA ~07:30 morning.
  *Correction 2026-10-23 :* the N12 replication is complete — outcome
  **LOST 0/2** at Bonferroni α=0.025 (ADR-0019), see `bouba_sens`.
- **6 critic-driven fixes shipped** : ablation void → cosine
  plasticity ; degenerate metrics handled ; Cat C honest framing
  (1 % / 6 % / 80 % per-substrate, no overstatement) ;
  Jonckheere → quadratic regression ; β-VAE β=1.0 confound fixed ;
  paper / JSON count mismatch reconciled.
- **Methodology rule promoted portfolio-wide** :
  multi-seed-first-class. The Q3 5-seed → 10-seed collapse is the
  canonical case study ; single-seed (or under-seeded) claims are
  now a hard pre-publication gate.

Tonight's snapshot of the three active repos :

| Repo | HEAD | Commits | Version | Headline |
|---|---|---|---|---|
| `nerve-wml` (master) | `e720d5f` | 295+ | **v1.8.1** | GTM tied-stable on N=2 / N=16 / cross-task ; 4 scaling pre-regs locked (ImageNet, Procgen, I-JEPA, Atari) |
| `dream-of-kiki` (main) | `3260355` | 479+ | **v0.10.0** | Paper 1 v0.2 §5.8 honest per-substrate FP framing ; Conformance Criterion C → **C+** |
| `bouba_sens` (main) | `3fbeee7` | 156 | **v0.5.9** | §5.5 FINAL Retract (ADR-0019) ; TMLR BLOCKED ; N12 sweep running |

---

## 2026-05-19 portfolio update — related-work consolidation + (i)+(ii) biophysical framing

**Related-work consolidation across Paper 1** (both `nerve-wml` and `dream-of-kiki`).
Four PRs closed in a single session. On the `nerve-wml` side, §Related Work grew from 5 to 6 threads with a new "Adjacent abstraction layers" thread positioning nerve-wml against NIR (model IR) and AER (transport) ; the GTM rationale was re-grounded on Bastos 2020 predictive routing + Friston 2025 + Ruffini 2025 laminar Comparator ; Liu et al. 2024 HNN review was cited in the "Surrogate-gradient SNN" thread to anchor nerve-wml in the *weak-coupling* corner. On the `dream-of-kiki` side, Paper 1 §8.4 "Comparison with prior art" gained 4 new rows (DVNC, NIR, AER, Liu 2024 HNN) and a closing paragraph engaging the two 2026 PRH critiques (`platoscave2026`, `aristotelianprh2026`) ; DR-3 substrate-agnosticism is anchored to the *local* form of PRH the 2026 evidence supports.

**The (i)+(ii) biophysical framing** is the architectural decision of the session.
(i) `BioFieldWML` is ONE conformant substrate alongside MLX, LIF, and Transformer — DR-3 substrate-agnosticism is preserved as a universal quantifier, not weakened. (ii) A new biophysical sub-theory (`docs/specs/2026-05-20-biophysical-stratification.md`, 280 lines) stratifies a *family* of bio-grounded substrates across 5 strata (coupled-field, theta-gamma, multimodal efficient+predictive, embodied grounding, critical dynamics) — a scaffold beside framework-C, not a revision of axioms DR-0..DR-4 / N-1..N-5 / W-1..W-4. PRs #15 and #19 cross-reference each other and both carry an explicit non-revision contract.

| Repo | New artefact | PR |
|---|---|---|
| `nerve-wml` | Paper 1 §Related Work expanded (6 threads) ; GTM re-grounded on Bastos 2020 / Friston 2025 / Ruffini 2025 ; HNN weak-coupling positioning (Liu 2024) ; §Information Transmission Test gains "Global vs Local alignment" para engaging 2026 PRH critiques | #14 |
| `nerve-wml` | `BioFieldWML` plan versioned (4th conformant substrate alongside MLX/LIF/Transformer) + deep-research integration 2026-05-19 : Tomé 2024 STDP triplet, Pignatelli 2025 IE plasticity, Lee et al. 2024 SNN-PC variational message passing (Frontiers Comput. Neurosci.), Bellitto 2024 internal wake/sleep scheduler, Tucker-Friston 2025 E/I balance | #15 |
| `dream-of-kiki` | Paper 1 §8.4 gains 4 prior-art rows (DVNC, NIR, AER, Liu 2024 HNN) + 2026 PRH critique paragraph (DR-3 anchored to local form of PRH) | #18 |
| `dream-of-kiki` | NEW `docs/specs/2026-05-20-biophysical-stratification.md` — (i)+(ii) sub-theory, 5 strata, explicit non-revision contract (DR-0..DR-4 / N-1..N-5 / W-1..W-4 unchanged) | #19 |

**DR-3 (substrate-agnosticism) is preserved as a universal quantifier** : BioFieldWML and the biophysical stratification spec are empirical scaffolding, not axiom revisions.

> **Critic-saver** — The mandatory internal critic review (per `feedback_critic_before_ship.md`) caught one MAJOR finding before the PR #15 merge : a missing bidirectional cross-reference between PR #15 (`BioFieldWML` plan) and PR #19 (stratification spec). Fixed in-session before merge.

**Open follow-up issues created** :
- `nerve-wml#16` — `friston2025pivot` bibliographic metadata to complete pre-submission.
- `dream-of-kiki#20` — `paper1-fr/` EN→FR sync of PR #18 changes.

> **Correction notes (2026-10-23)** — the 2026-05-19 text above is kept as written ; three present-tense claims in it no longer match the repos :
> - **"Friston 2025"** (GTM re-grounding) : that entry was removed on 2026-05-20 as unverifiable and replaced by Gabhart et al. 2025 ; the GTM rationale now rests on Bastos 2020 / Gabhart et al. 2025 / Ruffini 2025. `nerve-wml#16` (`friston2025pivot` metadata) is closed as superseded.
> - **DR-3 "local form of PRH"** : after `dream-of-kiki` PR #40 the related-work and discussion prose reads *relational structure, not metric geometry* (per You et al.). No axiom, proof or reported number changed.
> - **`nerve-wml` Related Work** : the six-thread passage had been accidentally dropped from `main.tex` by the 2026-06-04 merge of Gitea PR #53 ; restored in PR #50 (2026-10-23).

**Three Open Question defaults** documented in PR bodies (reviewable) :
- OQ-1 (DR-0 boundary) : `BioFieldWML.step()` performs ONE synchronous Up-Down cycle per call.
- OQ-2 (STDP scope) : STDP triplet scoped to `BioFieldWML` exclusively ; surrogate-gradient YAGNI bounded, not revoked.
- OQ-3 (stratification spec scope) : Paper 2 appendix scaffolding by default.

---

## 2026-10-23 update — repo state sync

- Literature-update PRs (branch `docs/sota-2026-10`, covering 2026-04-23 → 2026-10-23) merged across 10 repos : [`baby-brain` #282](https://github.com/hypneum-lab/baby-brain/pull/282), [`BabyBrain` #47](https://github.com/hypneum-lab/BabyBrain/pull/47), [`bouba_sens` #8](https://github.com/hypneum-lab/bouba_sens/pull/8), [`dream-of-kiki` #40](https://github.com/hypneum-lab/dream-of-kiki/pull/40), [`kiki-flow-research` #10](https://github.com/hypneum-lab/kiki-flow-research/pull/10), [`micro-kiki` #7](https://github.com/hypneum-lab/micro-kiki/pull/7), [`micro-kiki-quantum` #1](https://github.com/hypneum-lab/micro-kiki-quantum/pull/1), [`moshivis` #1](https://github.com/hypneum-lab/moshivis/pull/1), [`nerve-wml` #50](https://github.com/hypneum-lab/nerve-wml/pull/50), [`whisperx-server` #1](https://github.com/hypneum-lab/whisperx-server/pull/1).
- `micro-kiki` PR #6 : fixed MLX prompt-cache reuse in `src/serving/full_pipeline_server.py` (a prefix hit now prefills only the new suffix).
- Draft OSF pre-registration amendments / new pre-registrations are open as draft PRs : `nerve-wml` #51, `dream-of-kiki` #41, `bouba_sens` #9.
- Corrections to earlier present-tense claims on this page : `bouba_sens` B-3 (magnitude only, N12 LOST 0/2), `kiki-flow-research` tag (`paper-v0.11-draft`), the "Friston 2025" citation and DR-3 PRH wording (see the correction notes in the 2026-05-11 and 2026-05-19 sections).

---


## Snapshot footer (2026-06-09, with 2026-10-23 note)

*Repository snapshot — 2026-06-09 (live GitHub state). `dream-of-kiki` release `v0.9.2`, `pyproject` `0.23.0`, 621 commits on `main` (Paper 1 → PLOS Comp Bio). `nerve-wml` release `v1.8.1`, 416 commits on `master` (GTM tied-stable, BioFieldWML substrate track). `bouba_sens` release `v0.5.9`, 164 commits (§5.5 FINAL Retract, ADR-0019, TMLR blocked pending reformulation). `kiki-flow-research` 186 commits, latest release `paper-v0.9-draft` (Zenodo DOI live). `micro-kiki` release `v0.3.0`, 580 commits (35-LoRA + Aeon/CAMP/KnowBias on Qwen3.6-35B-A3B). `micro-kiki-quantum` archived (`v0.0.1-archived`). New embodied track: `baby-brain` (642 commits, World-Model Learners), `BabyBrain` (macOS cockpit), `whisperx-server` (on-device STT), `moshivis` (vision-speech fork). The dated milestone sections above (2026-05-11 N8→N14, 2026-05-19 biophysical framing) are preserved as historical journal entries.*

*Update 2026-10-23 : the `kiki-flow-research` latest tag is `paper-v0.11-draft` (not `paper-v0.9-draft`) ; other figures above are the 2026-06-09 snapshot and have not been re-counted.*
