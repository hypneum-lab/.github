# hypneum-lab

**Executable formal frameworks for cognitive AI.**

A one-person research lab running an open-science programme on knowledge consolidation in artificial cognitive systems — the **GENIAL** framework (`dream-of-kiki`), a substrate-agnostic **Nerve Protocol** (`nerve-wml`), a Wasserstein-gradient-flow engine (`kiki-flow-research`), a cross-modal plasticity benchmark (`bouba_sens`) and a deployable multi-LoRA runtime (`micro-kiki`). Based in Grandris, Beaujolais, France. 100 % open-source : code MIT (Apache-2.0 for `micro-kiki`, inherited from Qwen), docs CC-BY-4.0.

*State of the programme on 2026-10-25. Dated milestone entries from 2026 are kept in [`docs/profile-journal-2026.md`](https://github.com/hypneum-lab/.github/blob/main/docs/profile-journal-2026.md).*

---

## Where the programme stands

**Six months in, the lab has formulated 180 hypotheses or claims and built the discipline to test them** — pre-registration, five seeds minimum, Bonferroni, public errata. A full review of those claims was carried out on 2026-10-24 and revised on 2026-10-25 after two independent critiques ([`docs/research/2026-10-24-revue-hypotheses/`](https://github.com/hypneum-lab/.github/blob/main/docs/research/2026-10-24-revue-hypotheses/README.md), in French). Per its master table : 55 confirmed with ≥ 5 seeds or a calibrated null, 46 negative (refuted, retracted or null), 24 inconclusive, 19 amended, 12 pending, 19 never tested, 5 unverifiable. What holds is mostly *negative or methodological* : the retractions were made by the lab itself, before external review.

That review feeds the **2026-27 roadmap** ([`docs/ROADMAP.md`](https://github.com/hypneum-lab/.github/blob/main/docs/ROADMAP.md), [`docs/PROJECT-MANAGEMENT.md`](https://github.com/hypneum-lab/.github/blob/main/docs/PROJECT-MANAGEMENT.md)), tracked issue by issue on an internal GitHub Project of the organisation (47 issues, milestones M0–M3, ~10 h of research time per week) :

| Phase | Weeks | Goal | Milestone |
|---|---|---|---|
| **0 — Truth** | 26 Oct → 8 Nov 2026 | Retract and correct what is false ; secure priority ; freeze N10-C-bis | M0 |
| **1 — Falsifiable** | 9 → 29 Nov | Make DR-3, test 6, DR-0 and the `bouba_sens` pre-regs measurable ; evaluate N10-C | M1 |
| **2 — Ten hypotheses** | 30 Nov → 3 Jan 2027 | Run the ten tests that decide the most for the least ; start the « matter » and WML-JEPA pilots | M2 |
| **3 — Write** | 4 → 24 Jan | Methodological note (calibrated nulls + errata) submitted ; N10-C report ; GO/NO-GO on the matter axis | M3 |

Principles : truth before novelty ; falsifiable before tested ; one pre-reg, one test, one verdict ; no new repo, no QPU, no wet-lab, no hardware purchase in 2026-27.

---

## Repositories

### Flagship — formal framework

- [**dream-of-kiki**](https://github.com/hypneum-lab/dream-of-kiki) — substrate-agnostic formal framework for dream-based knowledge consolidation. Framework hypotheses **DR-0..DR-4**, executable Conformance Criterion **C+** (C1 signature typing, C2 axiom property tests, C3 blocking invariants), 8 typed primitives, 4 canonical operations (replay, downscale, restructure, recombine). Two substrates pass all three conformance conditions : MLX `kiki-oniric` and a numpy-LIF thalamocortical E-SNN. Paper 1 v0.2 (22 p) frozen ; arXiv deposit scheduled in phase 3 (January 2027) together with the DR-0/DR-1/DR-3 reformulations the review asks for. Draft PR [#41](https://github.com/hypneum-lab/dream-of-kiki/pull/41) : three new pre-registrations (H12–H14) and a G4 erratum.
  `main`, 692 commits ; release `v0.9.2` (2026-04-22), `pyproject` 0.23.0, DualVer `C-v0.24.0+PARTIAL`. Zenodo concept DOI [10.5281/zenodo.19701355](https://doi.org/10.5281/zenodo.19701355). MIT + CC-BY-4.0.

### Upstream — numerical engine

- [**kiki-flow-research**](https://github.com/hypneum-lab/kiki-flow-research) — Wasserstein-gradient-flow engine for LLM consolidation, grounded in the Levelt–Baddeley model of language production. Four psycholinguistic species evolve under a JKO-regularised flow on commodity Apple Silicon ; three tracks (nightly consolidation of a LoRA stack, N-particle Langevin × JKO paper proxy, pure-NumPy streaming surrogate for advisory routing).
  `main`, 227 commits ; latest release **`paper-v0.13-draft`** (2026-10-25) — Zenodo [10.5281/zenodo.23636477](https://doi.org/10.5281/zenodo.23636477), concept DOI [10.5281/zenodo.19666755](https://doi.org/10.5281/zenodo.19666755). October 2026 : two reproducibility bugs found and documented as errata (MLX `prox_w2`, solver `max_iter` ; the second changes no reported number, impact ≤ 1.7e-5), CI pinned (`uv --locked`), rigorous specialisation measure. MIT.

### Reference cross-substrate measurement

- [**nerve-wml**](https://github.com/hypneum-lab/nerve-wml) — substrate-agnostic Nerve Protocol for inter-WML communication : discrete neuroletters, γ/θ multiplexing, sparse learned topology. Three substrates share the protocol (`MlpWML`, `LifWML`, `TransformerWML`) ; polymorphism gap MLP↔LIF decays with N (10.7 % at N=2 → 2.4 % at N=32). The GammaThetaMultiplexer verdicts are *tied* / *tied-stable* across N8/N9.
  **N10-C** (Procgen multi-agent, 6 seeds, pre-registered) was frozen on 2026-10-24 (annotated tag `n10c-freeze-20261024`, archived on Software Heritage) and launched on two hosts ; the first attempt was halted on 2026-10-25 — the image trunk collapsed before 1 M steps and the team reward proved too sparse. Diagnosis and re-run presets in draft PR [#72](https://github.com/hypneum-lab/nerve-wml/pull/72) ; control-arm addendum **N10-C-bis** in draft PR [#61](https://github.com/hypneum-lab/nerve-wml/pull/61). Non-determinism of MLX conv backward (Metal ~1e-7, CUDA ~1e-5 rel.) is declared in the pre-reg.
  **NH-01** (dreaming Hopfield kernel vs uniform synaptic shrink, Fachechi–Agliari–Barra 2019) : three pre-registered runs (pilot, confirmatory N = 1 000, correlated patterns) ; confirmed at m ∈ {0, 0.15}, m = 0.30 registered C1 confirmed but post-analysis inconclusive. A ReScience C submission package, [`rescience-nh01`](https://github.com/hypneum-lab/rescience-nh01), was assembled on 2026-10-31 and went through two independent automated review passes (published in its `review/` folder) ; submission pending the PI's proofread.
  `master` ; release `v1.10.0` (2026-10-31, first published since `v1.8.1`). Zenodo concept DOI [10.5281/zenodo.19656342](https://doi.org/10.5281/zenodo.19656342). MIT.

### Behavioural benchmark

- [**bouba_sens**](https://github.com/hypneum-lab/bouba_sens) — cross-modal plasticity benchmark. A 5-modality agent (audio, vision, tactile, gravity, force) undergoes congenital vs late-acquired lesions under progressive SNR degradation ; three pre-registered invariants B-1 / B-2 / B-3.
  **The lab's first null-results programme.** All three original readings were overturned by its own critical validation (ADR-0006 v0.5.0 retraction ; §5.5 FINAL Retract ADR-0019 ; N12 subgroup replication **LOST 0/2** at Bonferroni α=0.025). B-3 survives on magnitude only, and the review of 2026-10-24 asks for a calibrated extreme-value null on Me6 before any further claim. TMLR submission stays **blocked** until B-1/B-2 are reported as equivalence tests (TOST) and the Me6 null is calibrated. Draft pre-regs v0.7–v0.9 in PR [#9](https://github.com/hypneum-lab/bouba_sens/pull/9) ; Me6 null-calibration work merged 2026-10-25 ([#19](https://github.com/hypneum-lab/bouba_sens/pull/19)).
  `main`, 211 commits ; release `v0.5.9` (2026-05-10). Zenodo concept DOI [10.5281/zenodo.19701353](https://doi.org/10.5281/zenodo.19701353). MIT.

### Deployable artefact

- [**micro-kiki**](https://github.com/hypneum-lab/micro-kiki) — multi-LoRA runtime with a cognitive layer on **Qwen3.6-35B-A3B** (native MoE, 256 experts, 3 B active, 262 K context) : 35 domain-expert V4 adapters (rank 16, scale 20), sigmoid router (top-1 70.7 %, top-3 89.5 %), **Aeon** episodic memory, **CAMP** negotiator, **KnowBias** double filter, `kiki-flow` advisory-routing bridge. October 2026 : MLX prompt-cache reuse fixed ([#6](https://github.com/hypneum-lab/micro-kiki/pull/6)). The Mac Studio that served it is powered down ; adapters and datasets are preserved, and the review lists a RAG-vs-Aeon baseline (NH-85) for phase 2.
  `main`, 598 commits ; release `v0.3.0` (2026-04-20). Zenodo concept DOI [10.5281/zenodo.19666759](https://doi.org/10.5281/zenodo.19666759). Apache-2.0.

### Embodied — World-Model Learners *(private)*

- `baby-brain` — ontogenetic harness for substrate-agnostic **World-Model Learners** (649 commits ; milestones `sp1`, `sp1.5-coreml`, `sp2-training` shipped). Phase 0 of the roadmap removes the « PASS » claims that have no artefact ; phase 2 pilots a latent world model (JEPA-class) as substrate (NH-77).
- `BabyBrain` — macOS SwiftUI cockpit for the harness.
- `whisperx-server` — streaming speech-to-text (whisper.cpp + CoreML) feeding the Speaker-Identity subsystem.
- [`moshivis`](https://github.com/hypneum-lab/moshivis) *(public fork)* — Kyutai's vision-speech model, reference substrate for multimodal grounding.
- `micro-kiki-quantum` — QPU-backed satellite, **archived** since 2026-05-10 (`v0.0.1-archived`). No QPU work in 2026-27.

---

## Architecture map

```
      ┌─────────────────────────────────────┐
      │  kiki-flow-research                 │  upstream numerical engine
      │  Wasserstein JKO + 4 species        │  paper-v0.13-draft · Zenodo
      └──────────────┬──────────────────────┘
                     │ numerical primitives
                     ▼
      ┌─────────────────────────────────────────────────────┐
      │  dream-of-kiki  (flagship, GENIAL framework)        │
      │  DR-0..DR-4 · Conformance Criterion C+              │
      │  substrates : MLX kiki-oniric + E-SNN thalamocortical│
      │  Paper 1 v0.2 → arXiv (phase 3) · Zenodo            │
      └──────┬───────────────────────────┬──────────────────┘
             │ cites §7.4                │ ε-trace bridge (gate-dream deferred)
             ▼                           ▼
   ┌──────────────────────┐   ┌──────────────────────┐
   │  nerve-wml  v1.9     │   │  micro-kiki  v0.3    │
   │  GTM tied-stable     │   │  Qwen3.6-35B-A3B     │
   │  N10-C → N10-C-bis   │   │  35 LoRA · Aeon ·    │
   │  Zenodo              │   │  CAMP · KnowBias     │
   └──────────┬───────────┘   └──────────────────────┘
              │ shared codebook (γ/θ)
              ▼
   ┌──────────────────────┐   ┌──────────────────────┐
   │  bouba_sens  v0.5.9  │   │  baby-brain (private)│
   │  null results · TMLR │   │  World-Model Learners│
   │  blocked → TOST+Me6  │   │  → WML-JEPA pilot    │
   └──────────────────────┘   └──────────────────────┘
```

---

## How we work

- **Pre-registration before evidence.** OSF project [dreamOfkiki](https://osf.io/v7a2j) — DOI [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (H1–H4, locked 2026-04-19) plus the Bonferroni amendment ; local pre-regs are frozen by annotated git tag + Software Heritage before OSF filing. Levels L0 draft / L1 tag + SWHID / L2 time-stamped deposit / L3 OSF or Octopus.
- **Bit-exact reproducibility (R1).** Every experimental claim resolves to a deterministic `run_id` keyed on `(c_version, profile, seed, commit_sha, benchmark_version)` ; declared exceptions (MLX conv backward) are stated in the pre-reg.
- **Multi-seed first class.** Five seeds minimum ; the `bouba_sens` 5 → 10-seed collapse is the canonical case study.
- **Internal critical validation before external review.** Null-model controls, bootstrap CIs, multi-estimator robustness checks and an independent critic review ; the Popperian guardrails fire inside the lab, which is why this page lists retractions.
- **Dual-axis versioning (DualVer)** : the formal-consistency axis (FC) and the empirical-consistency axis (EC) bump independently.
- **No AI co-authorship.** Byline credits *project contributors* ; LLM assistance is flagged in PR descriptions ; the researcher decides, runs, validates and signs.
- **Compute** : a Mac mini M1 (MLX), a shared RTX 4090 node and a small CPU server ; no cloud GPU. The Mac Studio used in spring 2026 is powered down.

Code archives on Zenodo (concept DOIs, latest version resolves) : `dream-of-kiki` [19701355](https://doi.org/10.5281/zenodo.19701355) · `nerve-wml` [19656342](https://doi.org/10.5281/zenodo.19656342) · `bouba_sens` [19701353](https://doi.org/10.5281/zenodo.19701353) · `kiki-flow-research` [19666755](https://doi.org/10.5281/zenodo.19666755) · `micro-kiki` [19666759](https://doi.org/10.5281/zenodo.19666759). Preprints : arXiv (Paper 1, phase 3) then HAL.

---

## People

- **Clément Saillant** — founder, corresponding author, maintainer. [GitHub](https://github.com/electron-rare) · [L'Électron Rare](https://www.lelectronrare.fr/) · `clement@saillant.cc`
  Founder of L'Électron Rare — custom electronic systems (design, consulting, training) : electronics, automation, energy. Ten years of field experience, open-source contributor (KiCad, KXKM). Research at Hypneum Lab is conducted alongside this activity, with a disciplined use of AI agents as research tools ; the verifiability of artefacts (pre-registration, calibrated nulls, public errata, reproducibility) is the chosen counterpart of a non-traditional path. Grandris (69), Auvergne-Rhône-Alpes, France.
- Visiting collaborators and co-authors are credited per publication.

---

## Contributing

Research-first discipline. Pull requests welcome, especially on :

- Formal proofs for the DR-0..DR-4 family (freeness / universal property of the operation semigroup is explicitly open).
- Conformance Criterion stress tests against alternative substrates (transformer-based, analog neuromorphic, JEPA-class).
- Calibrated nulls and equivalence tests for the `bouba_sens` invariants.
- Reproducibility tooling — shared `run_registry`, invariants harness, benchmark integrity.
- Translations and accessibility improvements.

Policy : every experimental claim must resolve to a registered `run_id` or a proof file (contract R1) ; no AI attribution in author lists, acknowledgments or bibliographies, LLM assistance flagged in PR descriptions ; byline per publication `<repo> project contributors` with Clément Saillant as corresponding author. Issues follow the org-wide templates (hypothesis, correction) and carry the `a-valider-pi` label until the PI validates them. See [`CONTRIBUTING.md`](https://github.com/hypneum-lab/dream-of-kiki/blob/main/CONTRIBUTING.md) in the flagship repository.

---

## Contact

Research / collaboration inquiries : `clement@saillant.cc`. For L'Électron Rare business (custom electronic systems, consulting, training) see [www.lelectronrare.fr](https://www.lelectronrare.fr/).

*Page rewritten 2026-10-25 from live GitHub and Zenodo state ; the dated milestone sections it replaces are in [`docs/profile-journal-2026.md`](https://github.com/hypneum-lab/.github/blob/main/docs/profile-journal-2026.md).*
