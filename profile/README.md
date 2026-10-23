# hypneum-lab

**Executable formal frameworks for cognitive AI.**

A small research lab running an open-science programme on knowledge consolidation in artificial cognitive systems. Based in Grandris, Beaujolais, Auvergne-Rhône-Alpes, France. 100 % open-source. Code : MIT (most repos) / Apache-2.0 (`micro-kiki`, inherited from Qwen). Docs : CC-BY-4.0.

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

## What we work on

The lab builds executable formal frameworks that bridge cognitive-neuroscience theory and machine-learning practice. The flagship programme axiomatises **dream-based knowledge consolidation** and instantiates it on two structurally divergent substrates — an MLX gradient-based language model (`kiki-oniric`) and a numpy-LIF thalamocortical spiking network (`esnn-thalamocortical`). Communication between heterogeneous modules is formalised as a substrate-agnostic **Nerve Protocol** with a measured polymorphism envelope. A behavioural benchmark (`bouba_sens`) stress-tests the same machinery on cross-modal plasticity.

Open-science discipline is public-by-default :

- Pre-registered hypotheses on OSF — [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (locked 2026-04-19).
- Bit-exact reproducibility contract **R1** : every experimental claim resolves to a deterministic `run_id` keyed on `(c_version, profile, seed, commit_sha, benchmark_version)`.
- Dual-axis versioning (**DualVer**) : the formal-consistency axis (FC) and the empirical-consistency axis (EC) bump independently.
- No AI co-authorship trailer. Byline credits *project contributors* ; individual authors are credited in §Acknowledgments per publication.
- **Internal critical-validation before external review.** Every pre-registered finding passes through null-model controls, bootstrap confidence intervals, multi-estimator robustness checks, and an independent critic-agent review before publication. Two proof-of-concept episodes : (a) 2026-04-21 — the `bouba_sens` v0.3 findings were **retracted by the lab** (v0.5.0, ADR-0006) when Sprint 7–8 critical tests downgraded all three to null. (b) **2026-05-11 — `bouba_sens` §5.5 Q3+ FINAL Retract** (v0.5.9, ADR-0019) : the qualitative +0.0125 Sprint-10 peak collapsed to noise once the Jonckheere test was replaced with the correct quadratic regression and the seed count was raised from 5 to 10 (sign p=0.62, paired t p=0.28). TMLR submission is BLOCKED until §5.5 is reformulated. Same night, `dream-of-kiki` Paper 1 §5.8 was rewritten to honest per-substrate FP framing (Cat C heterogeneity 1 % / 6 % / 80 %, no overstatement), the Conformance Criterion was strengthened to **C+** (now mandates C2 substrate-specific axiom property tests), and `nerve-wml` shipped six critic-driven fixes including an ablation void → cosine plasticity rewrite. The Popperian guardrails fire **inside** the lab.

---

## Repositories

### Flagship — formal framework

- [**dream-of-kiki**](https://github.com/hypneum-lab/dream-of-kiki) — substrate-agnostic formal framework for dream-based knowledge consolidation.
  Axioms **DR-0..DR-4**, executable Conformance Criterion (C1 signature typing, C2 axiom property tests, C3 blocking invariants), 8 typed primitives, 4 canonical operations (replay, downscale, restructure, recombine), 5-tuple Dream-Episode ontology. **Two substrates pass all three conformance conditions** : MLX `kiki-oniric` (cycle-1 canonical) and E-SNN `thalamocortical` (numpy LIF spike-rate skeleton, synthetic substitute — no Loihi-2 hardware). **Gates G1, G7, G8, G9 LOCKED** (cycle 2 closed) ; **G10 deferred to Paper 2** per the 2026-04-20 PLOS CB pivot.
  *Current paper* : **Paper 1 v0.2** (frozen 2026-04-20, 22 p) — primary submission target **PLOS Computational Biology** (retargeted today from Nature Human Behaviour). arXiv deposit ready (`cs.LG` primary, `q-bio.NC` + `cs.AI` cross-list), pending only the web-UI walkthrough. OSF DOI mint PENDING (gated on arXiv-ID lock). Paper 2 scaling-law observations (`p_max` between 1.5B and 7B) are in backlog ; any confirmatory rejection is gated on a 3rd scale point, bootstrap CI on per-seed p-values, numerical-precision audit, and log-probability arithmetic if underflow is detected — same critical-validation discipline that triggered the `bouba_sens v0.5.0` null-results retraction (ADR-0006).
  Python 3.12+, MLX on Apple Silicon. Latest release `v0.9.2`, `pyproject` `0.23.0`, 621 commits on `main`. MIT + CC-BY-4.0.

### Upstream — numerical engine

- [**kiki-flow-research**](https://github.com/hypneum-lab/kiki-flow-research) — Wasserstein-gradient-flow engine for LLM consolidation, grounded in the Levelt-Baddeley model of language production.
  Four psycholinguistic species (ρ\_phono, ρ\_lex, ρ\_syntax, ρ\_sem) evolve under a JKO-regularised flow on commodity Apple Silicon. Three parallel tracks :
  - `track1_perf` — nightly offline consolidation over the LoRA stack tensor (40 hybrid species, ~30 min on Studio M3 Ultra). Tag `track1-v0.1`.
  - `track2_paper` — N-particle Langevin × JKO rigorous proxy, 4 Levelt-Baddeley species, 5-seed paper figures. Tag `track2-v0.1`, paper draft advanced to `paper-v0.7-draft` ; **`phase1-pilot10k-done`** reached, scale-50k prep (T22–T23) complete.
  - `track3_deploy` — pure-NumPy streaming surrogate, MiniLM query encoder, advisory-only routing (p50 ≈ 0.04 ms on M5). Tag `track3-v0.1` ; **v0.3 text-bridge surrogate** just merged (PR #6) with query-conditioned free energy + g_JEPA phase-A pre-training + 4-species simplex init fix.
  186 commits on `main`, latest tag `paper-v0.11-draft` (the packaged v0.5 arXiv bundle is stale and must be regenerated before submission), strict ruff + mypy. **Zenodo-GitHub integration live** — concept DOI [10.5281/zenodo.19666755](https://doi.org/10.5281/zenodo.19666755), latest-version DOI [10.5281/zenodo.19666756](https://doi.org/10.5281/zenodo.19666756) for `paper-v0.8-draft`. MIT.

### Reference cross-substrate measurement

- [**nerve-wml**](https://github.com/hypneum-lab/nerve-wml) — substrate-agnostic Nerve Protocol for inter-WML communication. Discrete neuroletters, γ/θ multiplexing, sparse learned topology.
  **10 gates passed** (protocol, polymorphism, merge, scaling to N=32, interpretation, neuromorphic INT8 export, adaptive alphabet, LLM advisor, realism, temporal MI ; `gate-dream` is *partial — awaits `kiki-oniric` v0.5+*). **Three substrates share the Protocol** : `MlpWML` (dense), `LifWML` (surrogate-gradient SNN), and **`TransformerWML`** (attention-based, added in v1.2). `GammaThetaMultiplexer` finalised with Q1–Q5 arbitrated (issue #1 closed).
  **v1.2 "realism" axis delivered** : HardFlow MLP↔LIF polymorphism gap decays **N=2 10.71 % → N=16 6.71 % → N=32 2.39 % → N=64 2.73 % plateau**, MNIST gap **1.03 %**, 16-token temporal streaming MI/H = 0.72, mutual information MI($c_\mathrm{MLP}$;$c_\mathrm{LIF}$)/H($c_\mathrm{MLP}$) **= 0.91–0.96** across seeds. *The 12.1 % XOR-projected gap previously reported was traced to a decoder asymmetry bug, not a substrate limit.*
  Latest release **`v1.8.1`** (2026-05-10), 416 commits on `master`. **Paper v0.9 draft** (`paper-v0.9-draft`, built PDF at `papers/paper1/main.pdf`) cited in flagship Paper 1 §7.4 as independent corroboration of substrate-agnosticism. Zenodo concept DOI [10.5281/zenodo.19656342](https://doi.org/10.5281/zenodo.19656342), next-version DOI `10.5281/zenodo.19666405` reserved for v1.3.0. MIT.

### Deployable artefact

- [**micro-kiki**](https://github.com/hypneum-lab/micro-kiki) — *deployable 34-LoRA + cognitive-layer runtime* on **Qwen3.6-35B-A3B** (Apache 2.0 base, 262 K context, native MoE, 256 experts, 3 B active).
  Router emits **35 sigmoid outputs** (34 domain niches + base slot ; domains co-activate, not mutually exclusive). **10 SFT adapters trained** (kicad-dsl, spice-sim, emc, stm32, embedded, freecad, platformio, power, dsp, electronics ; final losses 0.38–0.55) ; V4 SOTA training *in progress* (32L, rank=α=16, chat-fr val_loss 0.849, reasoning 0.638 at iter 100). Sequential per-domain MLX training on Mac Studio M3 Ultra (peak ~107 GB, BF16) ; Q4_K_M inference on RTX 4090.
  Cognitive layer : **Aeon** memory (SIMD-vector Atlas + neuro-symbolic Trace graph), **CAMP** negotiator with Catfish dissent, **KnowBias** double-filter (RBD + DeFrame). New `kiki-flow` serving bridge merged at HEAD (v0.3 advisory-routing integration).
  *Adjacent research artefact* — triple-hybrid **Quantum VQC + SNN + Classical** routing documented in `docs/paper-outline-triple-hybrid.md` (Paper B, ICONS / Frontiers target). **Validated as PoC, not in the production runtime.**
  Latest release `v0.3.0`, 580 commits on `main`, **extensive test suite (971+ test functions across 126 files)**. Zenodo concept DOI [10.5281/zenodo.19666759](https://doi.org/10.5281/zenodo.19666759), v0.3.0 DOI [10.5281/zenodo.19666760](https://doi.org/10.5281/zenodo.19666760). Apache-2.0 (inherited).
  *Training datasets + adapter-mixing experiments live in the shared fine-tuning infrastructure* [`ailiance/ailiance-mac-tuner`](https://github.com/ailiance/ailiance-mac-tuner) — *a joint MLX pipeline (Mac Studio M3 Ultra / M4 Pro) used to train both FineFab industrial models and Hypneum research substrates ; models and hyperparameter search are versioned separately per programme.*

### Behavioural benchmark

- [**bouba_sens**](https://github.com/hypneum-lab/bouba_sens) — cross-modal plasticity benchmark.
  A 5-modality agent (audio, vision, tactile, gravity, force) undergoes a two-arm lesion protocol — **congenital (T1, pre-training)** vs **late-acquired (T2, post-convergence)** — combined with progressive SNR degradation. Three pre-registered invariants evaluated against fixed thresholds on every grid run :
  - **B-1 Congenital gap** — `Me7 > 0.05`
  - **B-2 MI migration** — `Me3_delta > 0.10 bit`
  - **B-3 Perceptive/proprioceptive asymmetry** — `Me6 max-abs off-diag > 0.02` — **passes on magnitude only** ; the architectural reading is withdrawn (ADR-0014, ADR-0015)
  Built on top of `nerve-wml` (shared neuroletter codebook, γ/θ multiplexing) with adaptive gating, adaptive codebook expansion, and learnable cross-modal transducers.
  **State (v0.5.9, 164 commits)** — Sprint 8 closed; §5.5 further retracted (ADR-0019, see the dated milestone above). **Critical validation overturned the original reading of all three pre-registered findings** (B-3 survives on magnitude only) — the programme is now a *methodology-first* contribution with an active paper draft. **F1 B-3** passes on magnitude (5–6× threshold) but is not an architectural perceptive/proprioceptive property : that reading is withdrawn (ADR-0014, ADR-0015) ; the magnitude behaves as a per-modality entropy proxy, and a null-model partition control puts the pre-registered partition at the 44–72th percentile of random 3+2 alternatives. **F2 B-1** sign flip is sampling noise (bootstrap 95 % CIs straddle 0 across all three worlds). **F3 B-2** decay is a Kraskov-k-NN artefact at n=16 probe batch (binning + MINE both return median 0). Paper 1 v0.1 draft (`papers/paper1/main.md`, ~9 pages) reframes the programme around three methodological recommendations: probe batch size ≥ 128 for MI estimators, bootstrap CIs mandatory for sub-threshold effects, null-model partition controls for group-asymmetry claims. The Popperian guardrails fired before external review — this is the lab's first null-results publication, tagged `v0.5.0`. Target venue TMLR or NeurIPS D&B. *Update 2026-10-23 :* the §5.5 retraction is landed in the manuscript ; N12 subgroup replication outcome **LOST 0/2** ; TMLR submission remains BLOCKED pending the critic-review gate and the N≥30 decision.

### Private

- `micro-kiki-quantum` — QPU-backed R&D satellite of `micro-kiki`. Three research tracks : **Quantum-PEFT** (Pauli parameterisation, arxiv 2503.05431), **QMoE interference-based routing** (arxiv 2507.05190 / 2512.22296), **Hybrid Quantum Transformer (HyQuT)** (arxiv 2511.10653). Hardware targets : IonQ Aria 25 q via AWS Braket (primary), IBM Eagle 127 q via IBM Quantum Network (secondary), Qiskit Aer simulation offline. Hard budget cap **$250/experiment** with $200 hard-abort checkpoint, total envelope ~$2.5–5 k. **Archived / dormant since 2026-05-10** (tag `v0.0.1-archived`, 12 commits). Apache-2.0. Results back-port to `micro-kiki/quantum-inspired` only if classical simulation validates them.

### Embodied — World-Model Learners

- `baby-brain` *(private)* — ontogenetic harness for substrate-agnostic **World-Model Learners (WML)**. The most active repo in the lab (642 commits, `master`), milestones tagged `sp{1,1.5,2}-*-shipped` rather than semver; on-device CoreML STT and an embodied 3D/games learning track.
- `BabyBrain` *(private)* — macOS SwiftUI cockpit for the `baby-brain` harness (embeds `BabyBrainAvatarKit`), monitoring all subsystems against the live `monitor_server`.
- `whisperx-server` *(private)* — WebSocket-streaming speech-to-text (whisper.cpp + CoreML on the ANE) feeding the Speaker-Identity subsystem (`macM1:9500`).
- `moshivis` *(public)* — fork of Kyutai's vision-speech model (*"Kyutai with an eye"*), reference substrate for multimodal grounding.

---

## Architecture map

```
      ┌────────────────────────────────────┐
      │  kiki-flow-research                │  upstream numerical engine
      │  Wasserstein JKO + species         │  (ρ_phono, ρ_lex, ρ_syntax, ρ_sem)
      │  186 commits · Zenodo DOI live     │  paper-v0.11-draft + pilot10k-done
      └──────────────┬─────────────────────┘
                     │
                     ▼  numerical primitives
      ┌────────────────────────────────────────────────────────┐
      │  dream-of-kiki  (flagship, formal framework)           │
      │  Axioms DR-0..DR-4, Conformance Criterion C+ (C2)      │
      │  Substrates : MLX kiki-oniric + E-SNN thalamocortical  │
      │  Release v0.9.2 · 621 cmt · pyproject 0.23.0          │
      │  Paper 1 v0.2 → PLOS Comp Bio                          │
      │  Paper 2 → TMLR (N8/N9 OK) ; NeurIPS gated N10/N11     │
      └──────┬──────────────────────────┬──────────────────────┘
             │                          │
   cites §7.4│                          │ε-trace bridge (gate-dream DEFERRED
             │                          │  — kiki-oniric v0.5+ dormant)
             ▼                          ▼
   ┌──────────────────────┐   ┌──────────────────────┐
   │  nerve-wml  v1.8.1   │   │  micro-kiki  v0.3.0  │
   │  GTM tied-stable ·   │   │  Qwen3.6-35B-A3B MoE │
   │  416 cmt · 7 N-verd. │   │  35 sigmoid auto-rtr │
   │  4 scaling pre-regs  │   │  (34 niches + base)  │
   │  Zenodo auto-DOI     │   │  Aeon · CAMP ·       │
   │                      │   │  KnowBias · 10 SFT   │
   │                      │   │  kiki-flow v0.3      │
   │                      │   │  bridge surrogate    │
   │                      │   │  971 tests · auto-DOI│
   └──────────┬───────────┘   └──────────┬───────────┘
              │ shared codebook           │ gate-llm-advisor-passed
              ▼ (γ/θ multiplexer)         │ (NerveWmlAdvisor)
   ┌──────────────────────┐               │
   │  bouba_sens v0.5.9   │               │
   │  §5.5 FINAL Retract  │               │
   │  TMLR BLOCKED        │               │
   │  N12 LOST 0/2 ; pool-│               │
   │  v2 subgroup discov. │               │
   │  ADRs 0004→0019 ✓    │               │
   └──────────────────────┘               │
                                          ▼
                               (integration back into micro-kiki runtime)
```

See each repo's `docs/ARCHITECTURE.md` / design spec for the detailed interface contracts.

---

## Open-science stack

- **Pre-registration** — [OSF project dreamOfkiki](https://osf.io/v7a2j) · DOI [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (locked) · Wiki page `Amendments` with filing procedure.
- **Code archives** — Zenodo-GitHub integration **live on three repos** :
  - `nerve-wml` — concept [10.5281/zenodo.19656342](https://doi.org/10.5281/zenodo.19656342)
  - `kiki-flow-research` — concept [10.5281/zenodo.19666755](https://doi.org/10.5281/zenodo.19666755)
  - `micro-kiki` — concept [10.5281/zenodo.19666759](https://doi.org/10.5281/zenodo.19666759)

  `dream-of-kiki` DOI mint is **pending** the arXiv-ID lock ; `bouba_sens` mints when mirrored on OSF.
- **Preprints** — arXiv (Paper 1 v0.2 bundle ready, awaiting web-UI deposit ; `cs.LG` primary + `q-bio.NC` / `cs.AI` cross-list) · HAL FR (mirror post-arXiv-announcement).
- **Models** — HuggingFace `clemsail/kiki-oniric-*` (posted when **S8 PUBLICATION-READY** gate is achieved).
- **Data** — Zenodo DOIs for raw runs at milestones S20 – S22 (experiments start S5).

---

## People

- **Clément Saillant** — founder, corresponding author, maintainer.
  [GitHub](https://github.com/electron-rare) · [L'Électron Rare](https://www.lelectronrare.fr/) · [Blog](https://blog.saillant.cc) · `clement@saillant.cc`
  Founder of L'Électron Rare — custom electronic systems (design, consulting, training): electronics, automation, energy. 10 years of field experience. Open-source contributor (KiCad, KXKM). Research at Hypneum Lab is conducted alongside this consulting activity, guided by intuition and a disciplined use of AI as a scientific research tool; the verifiability of artefacts (pre-registration, null-milestone, reproducibility) is the chosen counterpart of a non-traditional path.
  Grandris (69), Auvergne-Rhône-Alpes, France.
- Future visiting collaborators and co-authors would be credited per publication.

---

## Contributing

Research-first discipline. Pull requests welcome, especially on :

- Formal proofs for the DR-0..DR-4 axiom family (freeness / universal property of the operation semigroup is explicitly open).
- Conformance Criterion stress tests against alternative substrates (transformer-based, analog neuromorphic, JEPA-class).
- Reproducibility tooling — shared `run_registry`, invariants harness, benchmark integrity.
- Translations and accessibility improvements.

Policy :

- Every experimental claim must resolve to a registered `run_id` or a proof file (contract R1).
- No AI attribution in author lists, acknowledgments, or bibliographies. LLM assistance is flagged in PR descriptions.
- Byline per publication : `<repo> project contributors` with Clément Saillant as corresponding author.

See [`CONTRIBUTING.md`](https://github.com/hypneum-lab/dream-of-kiki/blob/main/CONTRIBUTING.md) in the flagship repository and each repo's `CONTRIBUTORS.md` for detailed policies.

---

## Contact

Research / collaboration inquiries : `clement@saillant.cc`

For L'Électron Rare business (custom electronic systems design and consulting — electronics, automation, energy · training · FineFab platform · AURA regional partnerships) see [www.lelectronrare.fr](https://www.lelectronrare.fr/). The sovereign-AI stack (gateway, ISAAC agent, fine-tuning infrastructure `ailiance-mac-tuner`) lives on the separate [ailiance](https://github.com/ailiance) organisation ; the MLX toolkit is used to train both industrial and Hypneum research models, with separate data and run_registry keys per programme.

---

*Repository snapshot — 2026-06-09 (live GitHub state). `dream-of-kiki` release `v0.9.2`, `pyproject` `0.23.0`, 621 commits on `main` (Paper 1 → PLOS Comp Bio). `nerve-wml` release `v1.8.1`, 416 commits on `master` (GTM tied-stable, BioFieldWML substrate track). `bouba_sens` release `v0.5.9`, 164 commits (§5.5 FINAL Retract, ADR-0019, TMLR blocked pending reformulation). `kiki-flow-research` 186 commits, latest release `paper-v0.9-draft` (Zenodo DOI live). `micro-kiki` release `v0.3.0`, 580 commits (35-LoRA + Aeon/CAMP/KnowBias on Qwen3.6-35B-A3B). `micro-kiki-quantum` archived (`v0.0.1-archived`). New embodied track: `baby-brain` (642 commits, World-Model Learners), `BabyBrain` (macOS cockpit), `whisperx-server` (on-device STT), `moshivis` (vision-speech fork). The dated milestone sections above (2026-05-11 N8→N14, 2026-05-19 biophysical framing) are preserved as historical journal entries.*

*Update 2026-10-23 : the `kiki-flow-research` latest tag is `paper-v0.11-draft` (not `paper-v0.9-draft`) ; other figures above are the 2026-06-09 snapshot and have not been re-counted.*
