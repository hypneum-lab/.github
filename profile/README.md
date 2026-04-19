# G.E.N.I.A.L.

**General Enhanced Neural Intelligence Artificial Learning** — a small research lab exploring formal frameworks for cognitive artificial intelligence.

Based in Grandris (Auvergne-Rhône-Alpes), France · 100 % open-source · MIT + CC-BY-4.0

---

## What we work on

We build executable formal frameworks for cognitive AI, with a focus on
substrate-agnostic primitives that bridge cognitive neuroscience theory
and machine learning practice. Our current cycle (2026) axiomatizes
**dream-based knowledge consolidation** in artificial cognitive
systems, with Paper 1 (theory + formal framework) targeting *PLOS
Computational Biology* and Paper 2 (empirical ablation, cycle 2)
targeting *NeurIPS / ICML / TMLR*.

Our research discipline is public-by-default:

- Pre-registered hypotheses on OSF ([10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN))
- Bit-exact reproducibility contract (R1) — every experimental claim
  resolves to a deterministic run identifier
- Dual-axis versioning (DualVer) — formal and empirical bumps are
  tracked independently
- No AI co-authorship trailer — byline credits project contributors

---

## Repositories

### Flagship

- [**dream-of-kiki**](https://github.com/genial-lab/dream-of-kiki) — Substrate-agnostic formal framework for dream-based knowledge consolidation in artificial cognitive systems. Axioms DR-0..DR-4, Conformance Criterion, 8 primitives, 4 canonical operations, 5-tuple Dream Episode ontology. Python 3.12+, MLX on Apple Silicon. **Paper 1 v0.2** (2026-04-19, PLOS CB submission target).

### Upstream / foundational

- [**kiki-flow-research**](https://github.com/genial-lab/kiki-flow-research) — Wasserstein-gradient-flow engine for self-organization on continual-learning substrates. Provides the numerical routines (species ontology, flow integrators, divergence estimators) that downstream substrates depend on. Grounded in the Levelt-Baddeley model of language production.
- [**nerve-wml**](https://github.com/genial-lab/nerve-wml) — Substrate-agnostic Nerve Protocol for inter-WML (World Model Language) communication. Two concrete substrates (MlpWML dense, LifWML surrogate-gradient SNN) share the same Protocol ; polymorphism gap measured at 0 % on linearly separable FlowProxyTask and 12.1 % on HardFlowProxyTask (Gate M merge retains 1.000 of mock-baseline accuracy). Reference cross-substrate validation cited in dream-of-kiki Paper 1 v0.2 §7.4.

### Implementation substrates

- [**micro-kiki**](https://github.com/genial-lab/micro-kiki) — 35 domain-expert MoE-LoRA adapters on Qwen3.5 MoE base. Sequential per-domain training via MLX on Apple Silicon ; Q4_K_M inference on consumer GPUs (RTX 4090 class). Router of 35 sigmoid outputs — domains are not mutually exclusive.
- **micro-kiki-quantum** (private) — True-quantum research : Quantum-PEFT, QMoE routing, IonQ / IBM Quantum experiments.

### Architecture map

```
dream-of-kiki (flagship, formal framework)
    │
    ├── depends on → kiki-flow-research (Wasserstein solver, species ontology)
    │
    ├── cites       → nerve-wml (cross-substrate portability evidence §7.4)
    │
    └── sibling     → micro-kiki (deployable MoE-LoRA instance)
```

See [dream-of-kiki/docs/ARCHITECTURE.md](https://github.com/genial-lab/dream-of-kiki/blob/main/docs/ARCHITECTURE.md) for the detailed cross-repo integration map.

---

## People

- **Clément Saillant** (founder, corresponding author) — Embedded Systems & AI Architect.
  [GitHub](https://github.com/electron-rare) · [Site](https://lelectronrare.fr) · clement@saillant.cc
- *Visiting contributors and co-authors credited per paper.*

---

## Contributing

Research-first discipline. Pull requests are welcome, especially on:

- Formal proofs for the DR-0..DR-4 axiom family
- Conformance Criterion stress tests against alternative substrates
- Reproducibility tooling (harness, run_registry, invariants)
- Translations and accessibility improvements

See [`CONTRIBUTING.md`](https://github.com/genial-lab/dream-of-kiki/blob/main/CONTRIBUTING.md) in the flagship repository.

Authorship policy: every experimental claim must resolve to a
registered `run_id`. No AI attribution in author lists, acknowledgments,
or bibliographies.

---

## Open science stack

- **Pre-registration** — [OSF project dreamOfkiki](https://osf.io/v7a2j) · DOI [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN)
- **Preprint** — arXiv (forthcoming, cycle 1 tag `arxiv-v0.2`)
- **Code** — GitHub (this organization), MIT licence
- **Models** — HuggingFace (forthcoming) under `clemsail/kiki-oniric-*`
- **Raw runs** — Zenodo DOI (at cycle-1 release)
- **National archive** — HAL FR (forthcoming, mirror of arXiv)

---

## Contact

Research / collaboration inquiries : clement@saillant.cc

---

*Last updated : 2026-04-19 (Paper 1 v0.2 release, org profile aligned with sibling-repo integration map).*
