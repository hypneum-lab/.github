# Related work and upstream — what the lab builds on, compares against and gives back

*State on 2026-10-31. Facts are read from the repositories of the organisation; a line without a link is a statement of absence.*

The programme is built almost entirely on open components released by large industrial laboratories. This page records three relations with that work, kept separate on purpose: what the lab **uses** as a substrate, what it **targets or compares against** in its pre-registered studies, and what it has **contributed upstream** so far. A fourth section states which of their models are used as **tools** on the lab's own work.

## 1. Substrates in use

| Component | Origin | Where | Role |
|---|---|---|---|
| **MLX** | Apple | `dream-of-kiki`, `baby-brain` (`mlx>=0.31,<0.32`), `micro-kiki` (`mlx>=0.26`, `mlx-lm>=0.30`), `kiki-flow-research` (`mlx>=0.20`) | numerical engine of all experiments on Apple Silicon; declared exception on bit-exactness (MLX conv backward, Metal ≈ 1e-7 rel.) in every pre-registration |
| **PyTorch** | Meta (Linux Foundation) | `nerve-wml` (`torch>=2.3`), `bouba_sens` (`>=2.5`), `micro-kiki` (`>=2.4`), `baby-brain` (`>=2.2`) | deterministic cross-architecture path; CUDA on the RTX 4090 node |
| **Procgen** 0.10.7 | OpenAI | `nerve-wml/experiments/procgen_multiagent_gtm_comm/` | environment of the N10-C campaign (CoinRun-coop); arm64 build patch kept in the repository (`bench/procgen-0.10.7-arm64-build.patch`) |
| **Gymnasium / MiniGrid** | Farama Foundation | `baby-brain` (`gymnasium>=1.0,<2.0`) | ontogenetic harness environments |
| **DINOv2 ViT-S/14** (`facebook/dinov2-small`) | Meta | `baby-brain` (encoder SP1, frozen) | visual encoder of the World-Model Learners |
| **Mimi** (`kyutai/mimi`) | Kyutai | `baby-brain` | audio codec of the WML harness |
| **Qwen3.6-35B-A3B**, **Qwen3.5** | Alibaba | `micro-kiki`, `dream-of-kiki` | base of the 35 domain-expert LoRAs and of the cognitive layer |
| **Transformers / PEFT / sentence-transformers** | Hugging Face | `micro-kiki` (`transformers>=4.46`, `peft>=0.13`, `sentence-transformers>=3.0`), `baby-brain` (`transformers>=4.40`), `micro-kiki-quantum` (`sentence-transformers>=5.0`) | model loading, LoRA, embeddings |
| **moshivis** (fork) | Kyutai | `hypneum-lab/moshivis` | fork kept for the audio-vision line; no pull request sent to Kyutai |

## 2. Targets and comparators in pre-registered studies

| Study | Big-lab work | Status |
|---|---|---|
| **N11-A** I-JEPA + GTM predictor on ImageNet self-supervised | **I-JEPA** (Meta FAIR) | pre-registration locked 2026-05-11, amendment drafted 2026-10-23 (estimation reframing, frozen design options), **deferred** |
| **N11-C** DreamerV3 + GTM dynamics on Atari-100k | **DreamerV3** (Google DeepMind, Hafner et al.); port via `dreamerv3-torch` | pre-registration locked, amendment drafted 2026-10-23 (ITC comparator, DreamerV3 rationale); compute option pending a throughput measurement; **deferred**; the dev kickoff (CartPole port) has no result |
| **N10-A** ImageNet-100 + ResNet-50 + GTM bottleneck | ImageNet, ResNet (Microsoft Research), β-VAE (DeepMind) | pre-registration locked, amendment drafted 2026-10-23, **deferred** behind N10-C |
| **N10-C** Procgen multi-agent GTM communication | **Procgen** (OpenAI) as environment; `google-deepmind/emergent_communication_at_scale` noted as a possible JAX comparator (not adopted) | **running** (run 2, macM1 + RTX 4090), frozen tag `n10c-freeze-20261024` |
| World-model veille (`.github/docs/research/`) | **JEPA-WMs**, **EB-JEPA**, **V-JEPA 2** (Meta FAIR, LeCun et al.), `facebook/jepa-wms` (CC-BY-NC-4.0), DINO-WM | watched as candidate comparators for N11-A; no run |
| Memory / consolidation veille | Letta MemFS; Anthropic notes on model welfare and on "dreaming" logs (2025–2026); Gurnee et al. (Anthropic) on a global workspace inside an LLM | cited in the hypotheses review of 2026-10-24 and the état des lieux of 2026-10-30 as positioning, not as baselines |

The October 2026 veille found no announced continual-learning system in production from OpenAI, Anthropic or Google DeepMind; the lab's niche (consolidation measured on commodity hardware, pre-registered, with calibrated nulls) is stated against that absence, not against a competing result.

## 3. Contributions upstream

| Target | What | State |
|---|---|---|
| [`ml-explore/mlx#3568`](https://github.com/ml-explore/mlx/issues/3568) | `mx.random.normal` is not bit-exact between Apple M1 (applegpu_g13s) and M3/M5 (g15+); minimal reproduction and cross-architecture table from `nerve-wml` | issue filed 2026-05-20 by the lab; **open**, 2 comments; the lab's own rule (claims tested on ≥ 2 Apple Silicon architectures) derives from it |
| OpenAI Procgen, arm64 build | patch `procgen-0.10.7-arm64-build.patch` (removes `-Werror`, Qt 5 on Apple Silicon) | kept in `nerve-wml`, **not sent upstream** |
| ReScience C | `rescience-nh01`: pre-registered partial replication of Fachechi, Agliari & Barra (2019) | package assembled and reviewed 2026-10-31, submission pending |
| Hugging Face `hypneum-lab` | models and datasets of the programme | organisation populated 2026-10-25 |

Nothing else: no pull request or issue from the lab on `facebookresearch/*`, `google-deepmind/*`, `openai/*`, `anthropics/*` or `huggingface/*` repositories as of this date. Candidate contributions are listed in [`docs/upstream-contributions-plan-2026-10-31.md`](upstream-contributions-plan-2026-10-31.md); none is sent without the PI's decision.

## 4. Their models as tools on our work

| Tool | Provider | Use | Where it is declared |
|---|---|---|---|
| Codex CLI (`gpt-6.1-sol`, `gpt-6-astra`) | OpenAI | independent review passes before a release, a pre-registration or a submission; blind pass then cross pass; every finding verified in the sources before any change | reports published next to the reviewed material (`rescience-nh01/review/`, `.github/docs/research/2026-10-24-revue-hypotheses/`, `2026-10-30-etat-des-lieux/`) |
| Claude Code | Anthropic | code, documentation, operations and literature search in sessions driven by the PI | "AI assistance (transparency)" section of each repository README (added 2026-10-31) |

No model is a co-author of a publication or of a commit; the authorship policy is in `CONTRIBUTORS.md` of `nerve-wml` and `dream-of-kiki`.
