# hypneum-lab

**Executable formal frameworks for cognitive AI.**

A small research lab running an open-science programme on knowledge consolidation in artificial cognitive systems. Based in Grandris, Beaujolais, Auvergne-Rhône-Alpes, France. 100 % open-source. Code : MIT (most repos) / Apache-2.0 (`micro-kiki`, inherited from Qwen). Docs : CC-BY-4.0.

---

## What we work on

The lab builds executable formal frameworks that bridge cognitive-neuroscience theory and machine-learning practice. The flagship programme axiomatises **dream-based knowledge consolidation** and instantiates it on two structurally divergent substrates — an MLX gradient-based language model (`kiki-oniric`) and a numpy-LIF thalamocortical spiking network (`esnn-thalamocortical`). Communication between heterogeneous modules is formalised as a substrate-agnostic **Nerve Protocol** with a measured polymorphism envelope. A behavioural benchmark (`bouba_sens`) stress-tests the same machinery on cross-modal plasticity.

Open-science discipline is public-by-default :

- Pre-registered hypotheses on OSF — [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (locked 2026-04-19).
- Bit-exact reproducibility contract **R1** : every experimental claim resolves to a deterministic `run_id` keyed on `(c_version, profile, seed, commit_sha, benchmark_version)`.
- Dual-axis versioning (**DualVer**) : the formal-consistency axis (FC) and the empirical-consistency axis (EC) bump independently.
- No AI co-authorship trailer. Byline credits *project contributors* ; individual authors are credited in §Acknowledgments per publication.
- **Internal critical-validation before external review.** Every pre-registered finding passes through null-model controls, bootstrap confidence intervals, and multi-estimator robustness checks before publication. 2026-04-21 proof-of-concept: the `bouba_sens` v0.3 findings were **retracted by the lab** (v0.5.0, ADR-0006) when Sprint 7-8 critical tests downgraded all three to null results. See `bouba_sens/papers/paper1/main.md` for the methodology write-up.

---

## Repositories

### Flagship — formal framework

- [**dream-of-kiki**](https://github.com/hypneum-lab/dream-of-kiki) — substrate-agnostic formal framework for dream-based knowledge consolidation.
  Axioms **DR-0..DR-4**, executable Conformance Criterion (C1 signature typing, C2 axiom property tests, C3 blocking invariants), 8 typed primitives, 4 canonical operations (replay, downscale, restructure, recombine), 5-tuple Dream-Episode ontology. **Two substrates pass all three conformance conditions** : MLX `kiki-oniric` (cycle-1 canonical) and E-SNN `thalamocortical` (numpy LIF spike-rate skeleton, synthetic substitute — no Loihi-2 hardware). **Gates G1, G7, G8, G9 LOCKED** (cycle 2 closed) ; **G10 deferred to Paper 2** per the 2026-04-20 PLOS CB pivot.
  *Current paper* : **Paper 1 v0.2** (frozen 2026-04-20, 22 p) — primary submission target **PLOS Computational Biology** (retargeted today from Nature Human Behaviour). arXiv deposit ready (`cs.LG` primary, `q-bio.NC` + `cs.AI` cross-list), pending only the web-UI walkthrough. OSF DOI mint PENDING (gated on arXiv-ID lock). Paper 2 scaling-law observations (`p_max` between 1.5B and 7B) are in backlog ; any confirmatory rejection is gated on a 3rd scale point, bootstrap CI on per-seed p-values, numerical-precision audit, and log-probability arithmetic if underflow is detected — same critical-validation discipline that triggered the `bouba_sens v0.5.0` null-results retraction (ADR-0006).
  Python 3.12+, MLX on Apple Silicon. Internal **DualVer `C-v0.7.0+PARTIAL`** (git tag `v0.6.0`, 201 commits, 277 tests / 91.17 % coverage). MIT + CC-BY-4.0.

### Upstream — numerical engine

- [**kiki-flow-research**](https://github.com/hypneum-lab/kiki-flow-research) — Wasserstein-gradient-flow engine for LLM consolidation, grounded in the Levelt-Baddeley model of language production.
  Four psycholinguistic species (ρ\_phono, ρ\_lex, ρ\_syntax, ρ\_sem) evolve under a JKO-regularised flow on commodity Apple Silicon. Three parallel tracks :
  - `track1_perf` — nightly offline consolidation over the LoRA stack tensor (40 hybrid species, ~30 min on Studio M3 Ultra). Tag `track1-v0.1`.
  - `track2_paper` — N-particle Langevin × JKO rigorous proxy, 4 Levelt-Baddeley species, 5-seed paper figures. Tag `track2-v0.1`, paper draft advanced to `paper-v0.7-draft` ; **`phase1-pilot10k-done`** reached, scale-50k prep (T22–T23) complete.
  - `track3_deploy` — pure-NumPy streaming surrogate, MiniLM query encoder, advisory-only routing (p50 ≈ 0.04 ms on M5). Tag `track3-v0.1` ; **v0.3 text-bridge surrogate** just merged (PR #6) with query-conditioned free energy + g_JEPA phase-A pre-training + 4-species simplex init fix.
  153 commits, 93 tests, 95 % coverage, strict ruff + mypy. **Zenodo-GitHub integration live** — concept DOI [10.5281/zenodo.19666755](https://doi.org/10.5281/zenodo.19666755), latest-version DOI [10.5281/zenodo.19666756](https://doi.org/10.5281/zenodo.19666756) for `paper-v0.8-draft`. MIT.

### Reference cross-substrate measurement

- [**nerve-wml**](https://github.com/hypneum-lab/nerve-wml) — substrate-agnostic Nerve Protocol for inter-WML communication. Discrete neuroletters, γ/θ multiplexing, sparse learned topology.
  **10 gates passed** (protocol, polymorphism, merge, scaling to N=32, interpretation, neuromorphic INT8 export, adaptive alphabet, LLM advisor, realism, temporal MI ; `gate-dream` is *partial — awaits `kiki-oniric` v0.5+*). **Three substrates share the Protocol** : `MlpWML` (dense), `LifWML` (surrogate-gradient SNN), and **`TransformerWML`** (attention-based, added in v1.2). `GammaThetaMultiplexer` finalised with Q1–Q5 arbitrated (issue #1 closed).
  **v1.2 "realism" axis delivered** : HardFlow MLP↔LIF polymorphism gap decays **N=2 10.71 % → N=16 6.71 % → N=32 2.39 % → N=64 2.73 % plateau**, MNIST gap **1.03 %**, 16-token temporal streaming MI/H = 0.72, mutual information MI($c_\mathrm{MLP}$;$c_\mathrm{LIF}$)/H($c_\mathrm{MLP}$) **= 0.91–0.96** across seeds. *The 12.1 % XOR-projected gap previously reported was traced to a decoder asymmetry bug, not a substrate limit.*
  Latest tag **`v1.2.3`** (2026-04-20), 184 commits on `master`. **Paper v0.9 draft** (`paper-v0.9-draft`, built PDF at `papers/paper1/main.pdf`) cited in flagship Paper 1 §7.4 as independent corroboration of substrate-agnosticism. Zenodo concept DOI [10.5281/zenodo.19656342](https://doi.org/10.5281/zenodo.19656342), next-version DOI `10.5281/zenodo.19666405` reserved for v1.3.0. MIT.

### Deployable artefact

- [**micro-kiki**](https://github.com/hypneum-lab/micro-kiki) — *deployable 34-LoRA + cognitive-layer runtime* on **Qwen3.6-35B-A3B** (Apache 2.0 base, 262 K context, native MoE, 256 experts, 3 B active).
  Router emits **35 sigmoid outputs** (34 domain niches + base slot ; domains co-activate, not mutually exclusive). **10 SFT adapters trained** (kicad-dsl, spice-sim, emc, stm32, embedded, freecad, platformio, power, dsp, electronics ; final losses 0.38–0.55) ; V4 SOTA training *in progress* (32L, rank=α=16, chat-fr val_loss 0.849, reasoning 0.638 at iter 100). Sequential per-domain MLX training on Mac Studio M3 Ultra (peak ~107 GB, BF16) ; Q4_K_M inference on RTX 4090.
  Cognitive layer : **Aeon** memory (SIMD-vector Atlas + neuro-symbolic Trace graph), **CAMP** negotiator with Catfish dissent, **KnowBias** double-filter (RBD + DeFrame). New `kiki-flow` serving bridge merged at HEAD (v0.3 advisory-routing integration).
  *Adjacent research artefact* — triple-hybrid **Quantum VQC + SNN + Classical** routing documented in `docs/paper-outline-triple-hybrid.md` (Paper B, ICONS / Frontiers target). **Validated as PoC, not in the production runtime.**
  Latest tag `v0.3-rc1`, 437 commits on `bridge-surrogate-v0.3`, **971 test functions across 126 test files**. Zenodo concept DOI [10.5281/zenodo.19666759](https://doi.org/10.5281/zenodo.19666759), v0.3.0 DOI [10.5281/zenodo.19666760](https://doi.org/10.5281/zenodo.19666760). Apache-2.0 (inherited).
  *Training datasets + adapter-mixing experiments live in the sibling operational repo* [`L-electron-Rare/KIKI-Mac_tunner`](https://github.com/L-electron-Rare/KIKI-Mac_tunner) *(out-of-scope for the research lab).*

### Behavioural benchmark

- [**bouba_sens**](https://github.com/hypneum-lab/bouba_sens) — cross-modal plasticity benchmark.
  A 5-modality agent (audio, vision, tactile, gravity, force) undergoes a two-arm lesion protocol — **congenital (T1, pre-training)** vs **late-acquired (T2, post-convergence)** — combined with progressive SNR degradation. Three pre-registered invariants evaluated against fixed thresholds on every grid run :
  - **B-1 Congenital gap** — `Me7 > 0.05`
  - **B-2 MI migration** — `Me3_delta > 0.10 bit`
  - **B-3 Perceptive/proprioceptive asymmetry** — `Me6 max-abs off-diag > 0.02`
  Built on top of `nerve-wml` (shared neuroletter codebook, γ/θ multiplexing) with adaptive gating, adaptive codebook expansion, and learnable cross-modal transducers.
  **State (2026-04-21, v0.5.0)** — Sprint 8 closed. **All three pre-registered findings have failed critical validation** — the programme is now a *methodology-first* contribution with an active paper draft. **F1 B-3** is a 3+2-partition tautology (pre-reg at 12.5th percentile of an n=8 null-model distribution, `docs/adr/0006-critical-validation.md`). **F2 B-1** sign flip is sampling noise (bootstrap 95 % CIs straddle 0 across all three worlds). **F3 B-2** decay is a Kraskov-k-NN artefact at n=16 probe batch (binning + MINE both return median 0). Paper 1 v0.1 draft (`papers/paper1/main.md`, ~9 pages) reframes the programme around three methodological recommendations: probe batch size ≥ 128 for MI estimators, bootstrap CIs mandatory for sub-threshold effects, null-model partition controls for group-asymmetry claims. The Popperian guardrails fired before external review — this is the lab's first null-results publication, tagged `v0.5.0`. Target venue TMLR or NeurIPS D&B.

### Private

- `micro-kiki-quantum` — QPU-backed R&D satellite of `micro-kiki`. Three research tracks : **Quantum-PEFT** (Pauli parameterisation, arxiv 2503.05431), **QMoE interference-based routing** (arxiv 2507.05190 / 2512.22296), **Hybrid Quantum Transformer (HyQuT)** (arxiv 2511.10653). Hardware targets : IonQ Aria 25 q via AWS Braket (primary), IBM Eagle 127 q via IBM Quantum Network (secondary), Qiskit Aer simulation offline. Hard budget cap **$250/experiment** with $200 hard-abort checkpoint, total envelope ~$2.5–5 k. Scaffold stage (3 commits, no tag, first experiments pending). Apache-2.0. Results back-port to `micro-kiki/quantum-inspired` only if classical simulation validates them.

---

## Architecture map

```
      ┌────────────────────────────────────┐
      │  kiki-flow-research                │  upstream numerical engine
      │  Wasserstein JKO + species         │  (ρ_phono, ρ_lex, ρ_syntax, ρ_sem)
      │  153 commits · Zenodo DOI live     │  paper-v0.7-draft + pilot10k-done
      └──────────────┬─────────────────────┘
                     │
                     ▼  numerical primitives
      ┌────────────────────────────────────────────────────────┐
      │  dream-of-kiki  (flagship, formal framework)           │
      │  Axioms DR-0..DR-4, Conformance Criterion              │
      │  Substrates : MLX kiki-oniric + E-SNN thalamocortical  │
      │  DualVer C-v0.7.0+PARTIAL · 277 tests / 91 % cov       │
      │  Paper 1 v0.2 → PLOS Comp Bio    Paper 2 → NeurIPS     │
      └──────┬──────────────────────────┬──────────────────────┘
             │                          │
   cites §7.4│                          │ε-trace bridge (gate-dream partial)
             ▼                          ▼
   ┌──────────────────────┐   ┌──────────────────────┐
   │  nerve-wml  v1.2.3   │   │  micro-kiki          │
   │  10 gates · 184 cmt  │   │  34 niches + base    │
   │  MlpWML · LifWML ·   │   │  Qwen3.6-35B-A3B     │
   │  TransformerWML      │   │  971 tests · Aeon    │
   │  Zenodo auto-DOI     │   │  Zenodo auto-DOI     │
   └──────────┬───────────┘   └──────────┬───────────┘
              │ shared codebook           │ gate-llm-advisor-passed
              ▼ (γ/θ multiplexer)         │ (NerveWmlAdvisor)
   ┌──────────────────────┐               │
   │  bouba_sens v0.5.0   │               │
   │  5-modality lesion   │               │
   │  B-3 PASS 3/3 worlds │               │
   │  ADRs 0003→0005      │               │
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
  [GitHub](https://github.com/electron-rare) · [L'Electron Rare](https://lelectronrare.fr) · `clement@saillant.cc`
  Embedded Systems & AI Architect, Grandris (69), Auvergne-Rhône-Alpes, France.
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

For L'Electron Rare business (embedded systems consulting, FineFab platform, Kill_LIFE / Mascarade products, AURA regional partnerships) see [lelectronrare.fr](https://lelectronrare.fr) — that activity runs on the separate [L-electron-Rare](https://github.com/L-electron-Rare) GitHub organisation.

---

*Last updated : 2026-04-20 21:05 CEST (deep-refresh from live repo state, post Sprint 5 + Sprint 6 opening). Snapshot : dream-of-kiki `v0.6.0` / DualVer `C-v0.7.0+PARTIAL` (201 commits, 277 tests / 91 % cov, Paper 1 v0.2 PLOS CB pivot, scaling-law `p_max` 1.5B→7B observation flagged for critical-validation gating per bouba_sens ADR-0006), kiki-flow-research 153 commits + `paper-v0.7-draft` + `phase1-pilot10k-done` (Zenodo DOI live), nerve-wml `v1.2.3` (184 commits, 10 gates, 3 substrates MlpWML+LifWML+TransformerWML, MNIST 1.03 % gap, Zenodo DOI live), micro-kiki `v0.3-rc1` HEAD `44b1a01` (437 commits, 971 tests, kiki-flow bridge merged, Zenodo DOI live), **bouba_sens `v0.5.0`** (Sprint 8 closed, 6 ADRs, paper v0.1 draft) — **3/3 pre-registered findings DOWNGRADED via null-model + bootstrap + multi-estimator validation**. The programme's Popperian guardrails fired before external review ; paper reframes as methodology-first with three reusable recommendations (probe batch, bootstrap CIs, partition controls). Null results are the scientific contribution.*
