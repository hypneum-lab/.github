# FOSDEM 2027 — devroom Open Research — proposition de talk (soumise le 2026-10-31, révisée le 2026-11-15)

Soumission : https://pretalx.fosdem.org/fosdem-2027/cfp → track « Open Research », code PYVZXW.
Soumise le 31/10/2026 ; modifiable jusqu'au 16/11/2026 AoE ; réponse de la devroom annoncée le 1er décembre.
Format : 20 min + 10 min questions (ou lightning 10 + 5). Langue : anglais.
Présence physique à Bruxelles le samedi 30 janvier 2027. Enregistrement CC-BY.
Révision du 15/11 (issue hypneum-lab/.github#47) : formulation Q3 (a) v3, B-1/B-2
de bouba_sens rapportés comme non-test / non mesurable et non comme nuls
(décision du 07/11, bouba_sens#24), exemples d'errata alignés sur les dépôts,
NH-01 aligné sur la v2 ReScience (branche `v2-diagonal` de rescience-nh01).
Le texte de pretalx est recollé le 15/11 depuis cette version.

## Champs pretalx

**Title**
Freeze, guard, null, amend: pre-registered machine-learning experiments in a one-person lab

**Session type**
Talk (20 + 10). Repli : Lightning talk (10 + 5) avec les sections 1–3 seulement.

**Abstract** (court, ≤ 500 caractères conseillé ; pretalx FOSDEM n'a qu'un champ, où le texte court et le texte long sont collés à la suite)
How do you keep yourself honest when you design the study, run it and review it? Hypneum Lab is a one-person open-science lab working on cognitive AI with Apple-Silicon-class compute. Since April 2026 every confirmatory run follows four moves: freeze (git tag + Software Heritage snapshot + a pre-registered protocol, on OSF or in-repo), guard (pre-committed GO/NO-GO rules and calibrated nulls), null (null and inconclusive results reported at the same rank as positives), amend (dated amendments before any compute). This talk shows what the method caught, what it cost, and what it still missed.

**Description** (long)
Most reproducibility tooling assumes a team: a second pair of eyes, a lab notebook someone else reads, a reviewer who was not in the room. A one-person lab has none of that, and the incentives to quietly re-run an experiment "once more" are the same as everywhere else.

This talk is a field report from the public repositories of https://github.com/hypneum-lab (Apache-2.0 / MIT code, CC BY 4.0 documentation, Zenodo DOIs, one OSF pre-registration with its amendment and in-repo frozen protocols), run by a single researcher on a Mac mini, one consumer GPU and a small CPU server (a Mac Studio was also used in spring 2026). The method is four verbs:

1. **Freeze.** An annotated git tag, a Software Heritage snapshot (SWHID cited in the write-up) and a pre-registered protocol (one study on OSF, https://osf.io/q6jyn, amended at https://osf.io/tpm5s; the others as frozen in-repo documents; 33 annotated freeze or pre-registration tags across five repositories on 15 November 2026, re-freezes included) are produced before the first confirmatory cell runs. Anything computed before the tag is a pilot and is labelled as such.
2. **Guard.** GO/NO-GO rules, learning gates and paired, calibrated null distributions are committed with the freeze. A control that cannot fail is reported as a non-test, not as evidence.
3. **Null.** Results against the hypothesis are published with the same README real estate, the same DOI practice and the same model cards as the positives: no added benefit of a "recombine" consolidation step on 4 benchmarks × 4 substrates; forgetting of 0.361 ± 0.010 where none was hoped for; a withdrawn emergent-specialisation claim in a transport-based continual learner. Some tests never reached a null: in a cross-modal plasticity benchmark the network did not learn the task, so two lesion tests (B-1, B-2) are reported as non-test / non-measurable; a third (B-3) stays inconclusive because its paired null proved uncalibrated at large n, and a network-level null is being pre-registered before any new run.
4. **Amend.** When a result or a claim is wrong, a dated amendment or an erratum entry (for example E-2026-10-25-03 in micro-kiki, numbered sections of kiki-flow-research's ERRATUM, erratum ADRs in bouba_sens) is pushed before any new compute. Examples: a sign inversion in our own review ("25/25 rejected" that meant the opposite) caught by an independent critic pass; a router accuracy of 70.7 % quoted without artefact, replaced by the measured 46.4 %; a partial ReScience C replication (ReScience/submissions#147): in a pre-registered post-freeze ablation, keeping the self-coupling moves the capacity peak to t = 1 and the headline ratio from 3.9 to 1.9.

What the audience gets:
- a checklist that runs in under an hour per study and needs only git, a free OSF account and the Software Heritage save-code-now API;
- the honest cost sheet (hours, delays, compute spent on nulls);
- the failure list: pilots run before the freeze, a dated exception to our own reading gate, an erratum that itself needed correcting (a partial ANN→SNN conversion first said never to have run);
- how LLM coding assistants fit (and do not fit) in this loop: they wrote code, tests and drafts and ran published review passes; the researcher took every verdict, and each repository says so.

No new model, no benchmark win. The claim is narrower: with four cheap moves, a lab of one can publish results that someone else can check, including the results that failed.

**Notes to organisers** (privé)
Speaker is an independent researcher and embedded-systems engineer (Hypneum Lab / L'Électron Rare, Grandris, France), ORCID 0000-0002-8414-185X, GitHub org hypneum-lab, OSF lab page https://osf.io/52nf7 (DOI 10.17605/OSF.IO/52NF7). All material is public. Travel self-funded. Happy to take a lightning slot if the schedule is full. Slides and checklist will be released CC BY 4.0 before the talk. The abstract was revised on 2026-11-15 to align its examples with the published errata and verdicts.

**Speaker bio** (≤ 100 mots)
Clément Saillant is an embedded-systems engineer (L'Électron Rare, Grandris, France) and an independent researcher who runs Hypneum Lab, a one-person open-science lab in cognitive AI. He pre-registers studies on OSF or as frozen in-repo protocols, archives frozen campaigns on Software Heritage, publishes null results, non-tests and errata alongside positives, and contributes upstream to MLX (Apple). Earlier work: hardware/firmware for stage and interactive installations.

## Points vérifiés le 15/11 (avant de recoller)
- B-1/B-2 (bouba_sens) : non-test / non mesurable, sans TOST (catalogue v3, lignes BS-B1 et BS-B2 ; décision du 07/11, bouba_sens#24). Toutes les lectures B-1/B-2/B-3 viennent d'un régime où le réseau n'apprend pas (bouba_sens `docs/adr/0024-erratum-default-regime-does-not-learn.md`).
- B-3 : verdict v3 « amendé » ; nul apparié non calibré à n ≥ 256, lecture Me6 non concluante ; nul à l'échelle du réseau préenregistré en brouillon (bouba_sens PR #66, ouverte), aucun run avant le tag.
- Spécialisation émergente (kiki-flow) : retirée par l'ERRATUM §13 ; classée non concluante (non-test : négatif attendu par construction) dans le catalogue v3. Elle n'est donc plus présentée comme un nul.
- Errata cités : 70,7 → 46,4 % = micro-kiki `docs/ERRATA.md`, E-2026-10-25-03 ; conversion ANN→SNN = micro-kiki E-2026-10-25-01, addendum du 31/10 (et non nerve-wml) ; « 25/25 » = inversion dans la revue du 24/10 de ce dépôt, relevée par la critique croisée du 25/10 (point bloquant B1), sans identifiant E-….
- NH-01 : formulation Q3 (a) ; chiffres de la v2 ReScience (branche `v2-diagonal`, tableau « Self-coupling convention »).
- OSF : Q6JYN (préenregistrement du 19/04), TPM5S (amendement du 21/04), page du labo 52NF7 (créée le 15/11).
- 33 étiquettes annotées `*freeze*` ou `*prereg*` dans les cinq dépôts archivés sur Zenodo (`git for-each-ref refs/tags`), au 15/11.

## Points restant à vérifier
- Confirmer le déplacement à Bruxelles le 30/01/2027 (présence physique obligatoire, frais à la charge du conférencier).
- « every confirmatory run since April 2026 » et « under an hour per study » : non audités ligne à ligne.
- Repli HPC/Big Data/Data Science (29/11) : même texte, abstract recentré sur « reproductibilité sur un seul poste » ; ne soumettre aux deux que si le règlement pretalx l'autorise (vérifier « one proposal per track »).
