# hypneum-lab

**Executable formal frameworks for cognitive AI.**

A small research lab running an open-science programme on knowledge consolidation in artificial cognitive systems. Based in Grandris, Beaujolais, Auvergne-Rhône-Alpes, France. 100 % open-source. Code : MIT (most repos) / Apache-2.0 (`micro-kiki`, inherited from Qwen). Docs : CC-BY-4.0.

---

## What we work on

The lab builds executable formal frameworks that bridge cognitive-neuroscience theory and machine-learning practice. The flagship programme axiomatises **dream-based knowledge consolidation** and instantiates it on two structurally divergent substrates : an MLX gradient-based language model (`kiki-oniric`) and a numpy-LIF thalamocortical spiking network (`esnn-thalamocortical`). Communication between heterogeneous modules is formalised as a substrate-agnostic **Nerve Protocol** with a measured polymorphism envelope.

Open-science discipline is public-by-default :

- Pre-registered hypotheses on OSF — [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (locked 2026-04-19).
- Bit-exact reproducibility contract **R1** : every experimental claim resolves to a deterministic `run_id` keyed on `(c_version, profile, seed, commit_sha, benchmark_version)`.
- Dual-axis versioning (**DualVer**) : the formal-consistency axis (FC) and the empirical-consistency axis (EC) bump independently.
- No AI co-authorship trailer. Byline credits *project contributors* ; individual authors are credited in §Acknowledgments per publication.

---

## Repositories

### Flagship — formal framework

- [**dream-of-kiki**](https://github.com/hypneum-lab/dream-of-kiki) — substrate-agnostic formal framework for dream-based knowledge consolidation.
  Axioms **DR-0..DR-4**, executable Conformance Criterion, 8 typed primitives, 4 canonical operations (replay, downscale, restructure, recombine), a 5-tuple Dream-Episode ontology, and two substrates already conformant (MLX `kiki-oniric` + E-SNN `thalamocortical`, gate **G7 LOCKED**).
  *Current paper* : Paper 1 **v0.2** (2026-04-20) — primary submission target **PLOS Computational Biology** ; arXiv preprint pending.
  Python 3.12+, MLX on Apple Silicon. Tag `v0.6.0`. MIT + CC-BY-4.0.

### Upstream — numerical engine

- [**kiki-flow-research**](https://github.com/hypneum-lab/kiki-flow-research) — Wasserstein-gradient-flow engine for LLM consolidation, grounded in the Levelt-Baddeley model of language production.
  Four species (ρ\_phono / ρ\_lex / ρ\_syntax / ρ\_sem) evolve under a JKO-regularised flow on commodity Apple Silicon. Three parallel tracks : `track1_perf` (offline consolidation over LoRA stack tensors), `track2_paper` (Langevin × JKO rigorous proxy, 5-seed paper figures), `track3_deploy` (pure-numpy streaming surrogate, p50 ≈ 0.04 ms). 93 tests, 95 % coverage. MIT.

### Reference cross-substrate measurement

- [**nerve-wml**](https://github.com/hypneum-lab/nerve-wml) — substrate-agnostic Nerve Protocol for inter-WML communication. Discrete neuroletters, γ/θ multiplexing, sparse learned topology.
  **11 gates passed** (protocol, polymorphism, merge, scaling to N=32, interpretation, neuromorphic INT8 export, dream bridge, adaptive alphabet, LLM advisor). Two concrete substrates (`MlpWML` + `LifWML`) + a third structural variant share the same protocol. Measured polymorphism gap 0 % on linearly separable tasks, 12.1 % on XOR-projected harder tasks, scaling-law plateau ≈ 2-3 % at N=32. Mutual information MI($c_\mathrm{MLP}$;$c_\mathrm{LIF}$)/H($c_\mathrm{MLP}$) = **0.91** across 5 seeds.
  **Zenodo-GitHub integration live** — every release auto-mints a DOI (latest : [10.5281/zenodo.19656354](https://doi.org/10.5281/zenodo.19656354) for v1.1.2 ; paper draft v0.9 drafted). Cited in the flagship Paper 1 §7.4 as independent corroboration of the substrate-agnosticism claim. MIT.

### Deployable artefact

- [**micro-kiki**](https://github.com/hypneum-lab/micro-kiki) — 34 domain-expert LoRA adapters + cognitive layer on **Qwen3.6-35B-A3B** (native MoE, 256 experts, 3 B active).
  Triple-hybrid architecture (Quantum VQC + SNN + Classical) validated ; 800+ tests ; adapter health validator passes on all 35 post-pivot stacks. MetaRouter emits 35 sigmoid outputs (domains co-activate, not mutually exclusive). Sequential per-domain training via MLX on Mac Studio M3 Ultra 512 GB. Q4_K_M inference on RTX-4090-class GPU. Aeon memory (SIMD vector Atlas + neuro-symbolic graph Trace), CAMP negotiator, KnowBias double-filter. Apache-2.0 (inherited from Qwen base).
  *Training + datasets live in the sibling operational repo* [`L-electron-Rare/KIKI-Mac_tunner`](https://github.com/L-electron-Rare/KIKI-Mac_tunner) *(out-of-scope for research lab).*

### Private

- `micro-kiki-quantum` — true-quantum research (Quantum-PEFT on QPU, QMoE routing, IonQ / IBM Quantum experiments).

---

## Architecture map

```
      ┌────────────────────────────────────┐
      │  kiki-flow-research                │  upstream numerical engine
      │  Wasserstein JKO + species         │  (ρ_phono, ρ_lex, ρ_syntax, ρ_sem)
      └──────────────┬─────────────────────┘
                     │
                     ▼  numerical primitives
      ┌────────────────────────────────────────────────────────┐
      │  dream-of-kiki  (flagship, formal framework)           │
      │  Axioms DR-0..DR-4, Conformance Criterion              │
      │  Substrates : MLX kiki-oniric + E-SNN thalamocortical  │
      │  Paper 1 v0.2 → PLOS Comp Bio    Paper 2 → NeurIPS     │
      └──────┬──────────────────────────┬──────────────────────┘
             │                          │
   cites §7.4│                          │ε-trace bridge (gate-dream-passed)
             ▼                          ▼
   ┌──────────────────────┐   ┌──────────────────────┐
   │  nerve-wml           │   │  micro-kiki          │
   │  11 gates, v1.1.x    │   │  34 domain experts   │
   │  Zenodo auto-DOI     │   │  Qwen3.6-35B-A3B     │
   │  MlpWML + LifWML +1  │   │  MoE-LoRA + Aeon mem │
   └──────────────────────┘   └──────────────────────┘
             ▲
             │ gate-llm-advisor-passed (NerveWmlAdvisor)
             └─── integration back into micro-kiki runtime
```

See each repo's `docs/ARCHITECTURE.md` / design spec for the detailed interface contracts.

---

## Open-science stack

- **Pre-registration** — [OSF project dreamOfkiki](https://osf.io/v7a2j) · DOI [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (locked) · Wiki page `Amendments` with filing procedure.
- **Code archives** — Zenodo-GitHub integration active ; `nerve-wml` already minted 3+ DOIs ; `dream-of-kiki` + `kiki-flow-research` + `micro-kiki` to follow.
- **Preprints** — arXiv (Paper 1 v0.2 bundle ready) · HAL FR (mirror post-arXiv-announcement).
- **Models** — HuggingFace `clemsail/kiki-oniric-*` (posted when **S8 PUBLICATION-READY** gate is achieved).
- **Data** — Zenodo DOI for raw runs at S20-S22 (experiments start S5).


---

## People

- **Clément Saillant** — founder, corresponding author, maintainer.
  [GitHub](https://github.com/electron-rare) · [L'Electron Rare](https://lelectronrare.fr) · `clement@saillant.cc`
  Embedded Systems & AI Architect, Grandris (69), Auvergne-Rhône-Alpes, France.
- Visiting contributors and co-authors credited per publication.

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

*Last updated : 2026-04-20. Snapshot of repo state : dream-of-kiki `v0.6.0` (193 commits), kiki-flow-research `track1-v0.1` + `track2-v0.1` + `track3-v0.1` (134 commits), nerve-wml `v1.1.4` (148 commits, 11 gates), micro-kiki `v0.3-rc1` (436 commits).*
