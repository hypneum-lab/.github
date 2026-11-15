# Hypneum Lab

*Spin, here, is a quantum number, not a communication strategy.*

Hypneum Lab is a research programme led by Clément Saillant, an independent researcher based in Grandris (Beaujolais, France), associated with L'Électron Rare. It studies knowledge consolidation and communication in artificial cognitive systems through five public software repositories. Since October 2026, studies are frozen before their confirmatory runs; null results and non-tests are published alongside positive ones, and errata are kept in each repository. A hypothesis catalogue (in French) records the status of the lab's claims, including those made before this practice was in force.

## Repositories

Code under MIT (Apache-2.0 for `micro-kiki`), documentation under CC BY 4.0. Zenodo concept DOIs resolve to the latest archived version.

- [**dream-of-kiki**](https://github.com/hypneum-lab/dream-of-kiki) — GENIAL, a substrate-agnostic formal framework for dream-based knowledge consolidation: axioms DR-0 to DR-4, eight typed primitives, four canonical operations (replay, downscale, restructure, recombine), an executable conformance criterion. MIT. [10.5281/zenodo.19701355](https://doi.org/10.5281/zenodo.19701355)
- [**nerve-wml**](https://github.com/hypneum-lab/nerve-wml) — substrate-agnostic protocol for communication between heterogeneous neural modules (World Model Languages, WMLs): discrete neuroletters, γ/θ multiplexing, sparse learned topology. Also hosts the lab's associative-memory (Hopfield) studies. MIT. [10.5281/zenodo.19656342](https://doi.org/10.5281/zenodo.19656342)
- [**bouba_sens**](https://github.com/hypneum-lab/bouba_sens) — cross-modal plasticity benchmark: a five-modality agent loses or degrades one sensory channel, congenitally or late, under three pre-registered invariants (B-1, B-2, B-3). MIT. [10.5281/zenodo.19701353](https://doi.org/10.5281/zenodo.19701353)
- [**kiki-flow-research**](https://github.com/hypneum-lab/kiki-flow-research) — numerical engine for consolidation in language models, built on four psycholinguistic activation densities (Levelt–Baddeley). Its `ERRATUM.md` requalifies the quantitative results of the paper draft and is to be read before citing any number. MIT. [10.5281/zenodo.19666755](https://doi.org/10.5281/zenodo.19666755)
- [**micro-kiki**](https://github.com/hypneum-lab/micro-kiki) — multi-LoRA runtime: domain-expert LoRA adapters with a cognitive layer (Aeon memory) on Qwen3.6-35B-A3B. Corrected figures are listed in `docs/ERRATA.md`. Apache-2.0. [10.5281/zenodo.19666759](https://doi.org/10.5281/zenodo.19666759)

Auxiliary public repositories: [`rescience-nh01`](https://github.com/hypneum-lab/rescience-nh01) (ReScience C submission package), [`paper-methodo-2026`](https://github.com/hypneum-lab/paper-methodo-2026) (working repository of the methods note, not yet published) and [`moshivis`](https://github.com/hypneum-lab/moshivis) (fork of Kyutai's vision-speech model). Some auxiliary repositories are private, among them `library` (manuscripts, cited references, review reports and operational planning).

## Method

- **Freeze.** Since October 2026, a study is frozen by a merged pull request, a freeze manifest and an annotated git tag archived on Software Heritage (level L1); a restricted-access Zenodo deposit adds a third-party date (L2); a public registration on OSF Registries or Octopus is level L3. Runs started before the freeze tag are not confirmatory.
- **Reading gate.** Since November 2026, heavy campaigns and L3 registrations must first pass a reading gate: a reading note on the primary sources, a report by an independent AI reviewer given the repositories but not the lab's conclusions (the blind contradictor), and dated literature-watch rounds. Campaigns frozen before the rule were not resubmitted to it; dated exceptions are recorded in the repository concerned.
- **Nulls and non-tests.** Null and inconclusive results are reported at the same rank as positive ones. A test that cannot inform the hypothesis, because the network did not learn the task or because a control could not fail, is reported as a non-test, not as evidence either way.
- **Amend.** Deviations and amendments are declared and dated in each repository; errata stay next to the claims they correct.
- **Scope.** Claims made before October 2026 were not all pre-registered. The [hypothesis catalogue](https://github.com/hypneum-lab/.github/blob/main/docs/research/2026-11-06-refresh-hypotheses/catalogue-v3.md) (catalogue v3, 2026-11-11, in French) records the status of each one.

The six programme principles, beginning with "truth before novelty" and "falsifiable before tested", are public (in French) in [`docs/PROJECT-MANAGEMENT.md`](https://github.com/hypneum-lab/.github/blob/main/docs/PROJECT-MANAGEMENT.md) §0.

## Where it stands (2026-11-15)

- **NH-01, ReScience C.** A replication of the dreaming Hopfield kernel of Fachechi, Agliari and Barra (2019) was submitted on 2026-10-31 ([ReScience/submissions#147](https://github.com/ReScience/submissions/issues/147), open on 2026-11-15). The replication is partial: in a pre-registered post-freeze ablation, declared to the editors on 2026-11-04, keeping the self-coupling moves the capacity peak to t = 1 and the headline ratio from 3.9 to 1.9 (draft version 2, branch `v2-diagonal` of `rescience-nh01`).
- **bouba_sens.** B-1 and B-2 are reported as non-test / non-measurable, since the network did not learn the task in the regime where they were measured (decision of 2026-11-07, [bouba_sens#24](https://github.com/hypneum-lab/bouba_sens/issues/24)). B-3 is inconclusive: its paired null is not calibrated at large n (catalogue v3, row BS-B3).
- **RECOMBINE.** In `dream-of-kiki`, the recombine operation shows no added benefit across 4 benchmarks × 4 substrates. This is a non-rejection, with a minimum detectable effect of d ≈ 0.86, reported as a null (catalogue v3, row DOK-H6C).
- **FOSDEM 2027.** A talk proposal, "Freeze, guard, null, amend", was submitted to the Open Research devroom on 2026-10-31.
- **OSF.** A landing page for the lab, [osf.io/52nf7](https://osf.io/52nf7), was created on 2026-11-15. It is not a study pre-registration.

## This quarter

- **Method:** a methods note, "Freeze, guard, null, amend" (`paper-methodo-2026`).
- **Calibration of decision models:** Zuse-2 (private repository), the only heavy campaign of the quarter, to be frozen and launched only after the methods note and its reading gate.
- **Associative memory:** version 2 of the NH-01 ReScience C submission, and a dose-response control of the downscale operation (NH-114).

## Durable pointers

- Researcher: Clément Saillant, ORCID [0000-0002-8414-185X](https://orcid.org/0000-0002-8414-185X)
- Lab page on OSF: [osf.io/52nf7](https://osf.io/52nf7), DOI [10.17605/OSF.IO/52NF7](https://doi.org/10.17605/OSF.IO/52NF7), CC BY 4.0
- OSF registrations, cycle 1 (2026): [10.17605/OSF.IO/Q6JYN](https://doi.org/10.17605/OSF.IO/Q6JYN) (dreamOfkiki pre-registration, 2026-04-19); [10.17605/OSF.IO/TPM5S](https://doi.org/10.17605/OSF.IO/TPM5S) (Amendment 1, restructuring of the Bonferroni testing family, 2026-04-21)
- Software archives: Zenodo concept DOIs of the five repositories, listed above
- Hypothesis catalogue (in French): [`hypneum-lab/.github`, `docs/research/2026-11-06-refresh-hypotheses/catalogue-v3.md`](https://github.com/hypneum-lab/.github/blob/main/docs/research/2026-11-06-refresh-hypotheses/catalogue-v3.md)
- Upstream components and contributions: [`docs/related-work-upstream.md`](https://github.com/hypneum-lab/.github/blob/main/docs/related-work-upstream.md); documentation pull request [ml-explore/mlx#4810](https://github.com/ml-explore/mlx/pull/4810), merged on 2026-11-03

## AI assistance (transparency)

AI assistants are used as tools, never as authors. Claude Code (Anthropic) assists with code, documentation, operations and literature search in sessions driven by the researcher; Codex CLI (OpenAI) runs independent review passes whose reports are published next to the reviewed material. Clément Saillant takes every claim, verdict and pre-registration decision and is responsible for all decisions, errors and retractions. No model is listed as a co-author of a publication or a commit. Each repository README carries an "AI assistance (transparency)" section with the details for that repository.

## Contributing

Issues and pull requests are welcome. The organisation provides issue templates for a new hypothesis and for a correction.

## Contact

Research and collaboration: clement@lelectronrare.fr. L'Électron Rare (electronic systems design, consulting, training): [www.lelectronrare.fr](https://www.lelectronrare.fr/).

*Page rewritten on 2026-11-15 from the state of the repositories, Zenodo and OSF on that date.*
