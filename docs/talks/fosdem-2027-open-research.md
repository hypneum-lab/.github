# FOSDEM 2027 — devroom Open Research — proposition de talk (brouillon 2026-10-31)

Soumission : https://pretalx.fosdem.org/fosdem-2027/cfp → track « Open Research ».
Deadline 16 nov. 2026 AoE. Format : 20 min + 10 min questions (ou lightning 10 + 5).
Langue : anglais. Présence physique à Bruxelles le samedi 30 janvier 2027.
Enregistrement CC-BY. Rien n'est soumis ; le PI colle et signe.

## Champs pretalx

**Title**
Freeze, guard, null, amend: pre-registered machine-learning experiments in a one-person lab

**Session type**
Talk (20 + 10). Repli : Lightning talk (10 + 5) avec les sections 1–3 seulement.

**Abstract** (court, ≤ 500 caractères conseillé)
How do you keep yourself honest when you are the PI, the engineer and the reviewer? Hypneum Lab is a one-person open-science lab working on cognitive AI with Apple-Silicon-class compute. Since April 2026 every confirmatory run follows four moves: freeze (git tag + Software Heritage snapshot + a pre-registered protocol, on OSF or in-repo), guard (pre-committed GO/NO-GO rules and calibrated nulls), null (null results reported at the same rank as positives), amend (dated amendments before any compute). This talk shows what the method caught, what it cost, and what it still missed.

**Description** (long)
Most reproducibility tooling assumes a team: a second pair of eyes, a lab notebook someone else reads, a reviewer who was not in the room. A one-person lab has none of that, and the incentives to quietly re-run an experiment "once more" are the same as everywhere else.

This talk is a field report from seven public repositories (Apache-2.0 / MIT, Zenodo DOIs, one OSF pre-registration and in-repo frozen protocols) run by a single researcher on a Mac Studio, a Mac mini and one consumer GPU. The method is four verbs:

1. **Freeze.** An annotated git tag, a Software Heritage snapshot (SWHID in the paper) and a pre-registered protocol (one study on OSF, the others as frozen in-repo documents, 22 freeze or pre-registration tags so far) are produced before the first confirmatory cell runs. Anything computed before the tag is a pilot and is labelled as such.
2. **Guard.** GO/NO-GO rules, learning gates and paired, calibrated null distributions are committed with the freeze. A control that cannot fail is removed, not reported.
3. **Null.** Three studies ended in null or compatible-with-null results (cross-modal plasticity under lesion; emergent specialisation in a transport-based continual learner; forgetting measured at 0.361 ± 0.010 where none was hoped for), and a fourth verdict is being amended after a large-n re-test contradicted the first reading. They are published with the same README real estate, the same DOI practice and the same model cards as the positives.
4. **Amend.** When a result or a claim is wrong, a dated amendment or an erratum entry (E-YYYY-MM-DD-NN) is pushed before any new compute. Examples: a sign inversion ("25/25 rejected" that meant the opposite) caught by an independent critic pass; a router accuracy of 70.7 % quoted without artefact, replaced by the measured 46.4 %; a partial ANN→SNN conversion that had never been evaluated, documented as such.

What the audience gets:
- a checklist that runs in under an hour per study and needs only git, a free OSF account and the Software Heritage save-code-now API;
- the honest cost sheet (hours, delays, compute spent on nulls);
- the failure list: pilots run before the freeze, a declared protocol deviation, errata that slipped through two reviews;
- how LLM coding assistants fit (and do not fit) in this loop: they wrote tests and drafts, every number was re-read at the source, and that fact is stated in each repository.

No new model, no benchmark win. The claim is narrower: with four cheap moves, a lab of one can publish results that someone else can check, including the results that failed.

**Notes to organisers** (privé)
Speaker is an independent researcher and embedded-systems engineer (L'Électron Rare, France), ORCID 0000-0002-8414-185X, GitHub org hypneum-lab. All material is public. Travel self-funded. Happy to take a lightning slot if the schedule is full. Slides and checklist will be released CC-BY-4.0 before the talk.

**Speaker bio** (≤ 100 mots)
Clément Saillant is an embedded-systems engineer (L'Électron Rare, Grandris, France) and principal investigator of Hypneum Lab, a one-person open-science lab in cognitive AI. He pre-registers studies on OSF, archives every frozen campaign on Software Heritage, publishes null results and errata alongside positives, and contributes upstream to MLX (Apple) and Procgen. Earlier work: hardware/firmware for stage and interactive installations.

## Points à vérifier par le PI avant de coller
- Confirmer le déplacement à Bruxelles le 30/01/2027 (présence physique obligatoire, frais à votre charge) et la compatibilité avec le plafond 10 h/semaine.
- Nuls cités : B-2, « no emergent specialization » kiki-flow, oubli 0,361 ± 0,010 ; B-3 est présenté comme « en amendement » (grille historique compatible p = 0,17, grand n du 31/10 en excès). ⚠️ Le doc v3 section 2 dit « 4 nuls, 1 échec M5 » : « M5 FAILED 50/60 » n'existe dans aucun fichier (50 configurations sur 96 couvertes, verdict en attente) → faire corriger le doc v3 par la session e9 avant envoi.
- Seule dream-of-kiki H1–H4 est enregistrée sur OSF (Q6JYN) ; ne pas écrire « OSF » au pluriel ailleurs.
- Les chiffres cités (70,7 → 46,4 ; 25/25) sont ceux de la revue du 24-25/10 ; les relire dans docs/ERRATA.md et le rapport .github avant d'envoyer.
- Choisir : talk 20 min ou lightning. Ma recommandation : talk, en cochant « lightning acceptable » dans les notes.
- Repli HPC/Big Data/Data Science (29/11) : même texte, abstract recentré sur « reproductibilité sur un seul poste » ; ne soumettre aux deux que si le règlement pretalx l'autorise (vérifier « one proposal per track »).
