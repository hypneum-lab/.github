# Catalogue v3 — delta sur le catalogue v2 (refresh du 2026-11-06, soir)

Statut : proposition de la synthèse, à trancher par le PI. **Le catalogue v2 n'est pas modifié** (`.github` main `c8967a2`, `docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`, abrégé `cat`). Aucune ligne n'a passé le verrou de lecture ; rien ici n'est confirmatoire.

## Lecture

- **Périmètre.** Une ligne de la table ci-dessous regroupe une ou plusieurs lignes du catalogue v2 qui reçoivent la même proposition ; le nombre de lignes v2 est donné entre crochets. Les lignes v2 non citées ne sont pas touchées par les six entrées du 06/11, ce qui ne vaut pas validation (`cat:14`).
- **Sources (qui l'a établi).** `iNW` = `inventory/nerve-wml.md` ; `iDOK` = `inventory/dream-of-kiki.md` ; `iBS` = `inventory/bouba_sens.md` ; `iKFR` = `inventory/kiki-flow-research.md` ; `iMKBB` = `inventory/micro-kiki-baby-brain-methodo.md` ; `iVEI` = `veille/veille-delta-2026-11-06.md`. La preuve principale est citée telle que l'inventaire l'a relue à la source ; le numéro de ligne de l'inventaire permet de retrouver le contexte.
- **Règle de classement de la synthèse** (appliquée à toutes les lignes, ce qui change parfois le mot de l'inventaire, signalé « inv. : garder ») :
  - **fermer** = la ligne n'a plus d'hypothèse à tester, avec une preuve (erratum, non-test établi, négatif analysé selon la préreg, lecture exploratoire faite selon la préreg) ;
  - **reformuler** = l'identifiant reste, l'énoncé, la portée, la nature ou une précondition change ;
  - **garder** = énoncé et précondition inchangés ; ajout d'une source, d'une note de lecture, d'un héritage, ou alignement d'étiquette ;
  - **rouvrir** = une ligne close redevient testable. **Aucun inventaire ne propose de rouvrir une ligne.**
- **Effet sur le trimestre** : heures humaines (h), calcul (CPU/GPU), verrou (ROADMAP v2.1, principe 6 : `.github:docs/ROADMAP.md:15`).

## Table delta (ordre : dépôt, puis table C, A, B)

| Identifiant (`cat:` l.) [n] | Dépôt | Statut v2 (étiquette) | Proposition v3 | Nouvel énoncé (si reformulé) | Preuve principale | Établi par | Effet sur le trimestre |
|---|---|---|---|---|---|---|---|
| N10-D (C l.39) [1] | nerve-wml | préreg PR #100 ; « passe le verrou en premier » | **reformuler** (nature) | N10-D est un contrôle de chaîne et d'apprentissage PPO sur le jeu de Lewis asym (K = 16, C = 4, A = 16) où la nécessité du message est fixée par construction ; la question scientifique (usage causal du canal appris) devient NWML-N1. | `nerve-wml P100:docs/prereg/n10d/protocol.md:52-62` ; contraste oracle 0,75 / 0 (`VER:14`) | iNW l.22 | verrou N10-D : tour 2 et trois tests restent (`ROADMAP.md:87,91`) ; si NWML-N1 devient primaire, k et la règle sont à refaire avant le gel S6 |
| NWML-N10C (A l.165) [1] | nerve-wml | inchangé (en attente, en cours) | **fermer** — non-test | — | arrêt définitif à la graine 0, « No verdict » (`nerve-wml:docs/milestones/n10c-procgen-multiagent-gtm-comm-closure-2026-11-05.md:43-45`) ; tâche sans besoin de message (`:53`) | iNW l.24, l.89 | 0 calcul ; rapport descriptif #63 reste à écrire (S12) |
| NH-32 (B l.274) [1] | nerve-wml | inchangé (PRÊT) | **reformuler** (substrat, précondition) | Volet « contenu contre présence » de NWML-N1 : sur les paires `learned` de N10-D qui passent la porte, effet(canal à zéro) contre effet(message dérangé entre épisodes). | `CL:43-45,58-61` ; `RN:244-248` ; `P100:protocol.md:89-97` | iNW l.25 ; iVEI l.90 (contrôle par randomisation conditionnelle) | ≈ 0 GPU (évaluation sur runs budgétés) |
| NH-31 (B l.273) [1] | nerve-wml | inchangé (PILOTE/SPÉC) | **reformuler** (précondition) → reporté après M3 | Précondition : policies où `eng − nocomm` ≥ 0,20 (porte A+ passée) ou paires N10-D ; le jeu à un pas ne permet pas de tester une cadence. | `P100:protocol.md:260` | iNW l.26 | rien ce trimestre |
| NH-33 (B l.275) [1] | nerve-wml | inchangé (PILOTE/PRÊT) | **reformuler** (portée) → reporté après M3 | Sonde cross-play jamais tournée ; « le cross-play s'effondre » ne vaut que pour des paires (intelligibilité mutuelle qui croît avec la population). | `CL:19` ; arXiv:2606.10582 [résumé] | iNW l.27 | rien ce trimestre |
| NH-37 (B l.279) [1] | nerve-wml | inchangé (PILOTE) | **reformuler** (précondition) | Hypothèse réservée au cas C de N10-D (D̂ < 0,10) : un canal branché sur l'entrée de politique relève-t-il D ? | `P100:protocol.md:220` | iNW l.28 | conditionnelle au verdict N10-D (S10 au plus tôt) |
| NWML-PRH (A l.140), mKNN (C l.37), NH-45 (B l.287) [3] | nerve-wml | artefact plausible ; utile, sous verrou | **reformuler** (portée) | Alignement mKNN entre l'état MLP et une projection **affine** de l'entrée du LIF (aucun pas impulsionnel) ; bras non entraîné et plancher k/(n−1) codés (PR #117), aucun chiffre produit. | `nerve-wml MK:docs/research-notes/mknn-floor-untrained-arm.md:69-76` ; `papers/paper1/main.tex:104` | iNW l.30 ; iVEI l.53 (nul apparié en perte unimodale, VEI-1) | minutes CPU macM1, sous verrou seulement ; texte de Paper 1 à trancher |
| NH-35 (B l.277) [1] | nerve-wml | utile, sous verrou | **reformuler** (précondition) | Embeddings LIF pris après la dynamique impulsionnelle, sinon le test porte sur une fonction affine de x. | `MK:69-76` | iNW l.31 ; iVEI l.54-55 (local/global, séparable ≠ alignable) | aucun avant M3 |
| Claim B (C l.36), NWML-B (A l.133), NWML-FE (A l.143) [3] | nerve-wml | artefact plausible | **garder** ; test causal attendu = NWML-N2 | — | `V1:263` (aucun substrat impulsionnel dans la littérature lue) | iNW l.29 | aucun |
| NH-28 (B l.270) [1] | nerve-wml | reporté après M3 | **garder** ; source ajoutée | — | arXiv:2410.18806 (un ou deux symboles suffisent, [résumé]) | iNW l.33 (l'inventaire écrit à tort « PILOTE, inchangé ») | aucun |
| DOK-H14 (A l.97), H14 E1-small (C l.33) [2] | dream-of-kiki | exploratoire ; « réplication de l'ordre des phases » | **fermer** — lecture exploratoire faite selon la préreg (H14-A, H14-C) ; H14-B après PR #92 (07-08/11) ; retirer l'étiquette « réplication de l'ordre des phases » | — | `dok:docs/results/2026-11-06-e1-small-analysis.md:164-235` ; ordre fixe, RECOMBINE no-op (`dok:scripts/e1_harness.py:214-223`) | iDOK l.30-33, l.115 | ≈ 3 h de lecture de #92 (S2-S3) ; GPU KXKM déjà engagé 28-49 h (#92) |
| DOK-E1 (A l.93) [1] | dream-of-kiki | inchangé (en attente) | **fermer** — étude 35B abandonnée (non testée) | — | `dok:docs/osf-amendment-e1-small-2026-10-30.md:82-90` (§2bis) | iDOK l.34 | 0 h |
| DOK-DR2 (A l.59), DR-2/DR-4 (C l.34) [2] | dream-of-kiki | reformulé (propriété sous [P]) | **reformuler** (précondition sur l'état) | Pour tout mot dont chaque préfixe laisse l'état dans le domaine de l'opération suivante [P_S], (C), (B), (F) tiennent par définition ; [P] est le cas MLX de [P_S]. Définition + test de conformité, pas théorème. | `dok:docs/proofs/dr2-compositionality.md:23-38,118-135` | iDOK l.35 | 1 h de texte (Paper 1, Q2) ; correctif de code [P] toujours dû (déjà M4) |
| DOK-DR4 (A l.62) [1] | dream-of-kiki | reformulé (garantie d'espace) | **reformuler** (trois préconditions écrites) | DR-4.L vaut si (a) P_min satisfait les invariants, (b) métrique monotone en capacité, (c) le profil riche peut désactiver ses opérations ; (c) est faux pour les profils figés. | `dok:docs/proofs/dr4-profile-inclusion.md:62-82` ; `dok:scripts/e1_profiles.py:139-141` | iDOK l.37 | 1 h de texte ; DOK-N2 après M3 |
| `recombine` = séparation de mélanges (C l.32) [1] | dream-of-kiki | réplication inter-substrats | **reformuler** (nature → non-test) | dream-of-kiki n'a jamais montré de séparation de mélanges : RECOMBINE est un no-op sur E1 et un canal vide sur G4-quater…septimo. | `dok:scripts/e1_harness.py:215` ; O2IGIHRtWc non résolu (ne tranche rien) | iDOK l.38 | 0 h ; DOK-N4 après M3 |
| DOK-G4qC, G4quC, G4s, H6C (A l.75, 77, 78, 79) [4] | dream-of-kiki | inchangé (nul) | **garder** ; note « non-test de la séparation de mélanges » | — | idem | iDOK l.39 | 0 h |
| NH-91 (B l.333), « quand dormir » (C l.35) [2] | dream-of-kiki | utile, sous verrou ; section de note | **garder** comme section de la note ; absorbe NH-13 ; PEAM ajouté comme antériorité partielle (côté agent) | — | 3gCeBuNNyT (résolu, PDF 403, à recouper) ; `dok:docs/results/2026-10-30-nh03-deferred-eval.md:1-45` | iDOK l.40 ; iVEI l.32, l.103 | 4 h en S6, inchangé |
| NH-13 (B l.255) [1] | dream-of-kiki | inchangé (SPÉC) | **reformuler** par fusion dans NH-91 (face coût) | NH-13 = face coût de NH-91 : à rétention égale, nombre de DE ; même dessin, même antériorité. | `.github:…/2026-11-02-veille-theses/these-dream-of-kiki.md:38` [résumé] | iDOK l.41 ; iVEI l.36 (contrôle « flux contaminé », VEI-4) | 0 h (supprime une ligne SPÉC) |
| NH-03 du 24/10 (B l.245) [1] | dream-of-kiki | reporté après M3 | **garder** ; ajouter arXiv:2610.36109 (mise en garde « FLOPs égaux ») | — | `these-dream-of-kiki.md:72` | iDOK l.42 | 0 h |
| BS-SF45 (A l.173) [1] | bouba_sens | inchangé (confirmé, Branch B) | **fermer** — clos par erratum | — | erratum 28/10 (`bouba:docs/paper/main.tex:525-540`) ; erratum 10 / issue #72 (`main.tex:572-584`) ; ADR-0024:36-60 | iBS l.31, l.112 | 0 calcul ; ≈ 0,5 h de texte (« Branch B », « robustly distinguishable », `main.tex:604-615`) |
| BS-AMEDI, COMP, TAU, CBF, S14c (A l.174-178) [5] | bouba_sens | rétracté / réfuté / amendé | **fermer** — clos par erratum (les négatifs ne sont pas des preuves : même pont, même canal force, régime non apprenant) | — | chaîne `sf_phase2_adapted` (`bouba:docs/adr/0013-dose-response-amedi-curve.md:27` … `0017-…:198`) | iBS l.32, l.113 | 0 h |
| BS-Q3, BS-N12 (A l.185, 186) [2] | bouba_sens | rétracté / réfuté | **fermer** — clos par erratum, **sous réserve** (monde des graines à recouper) | — | `bouba:docs/adr/0019-multi-seed-q3-retract.md:15` ; `docs/milestones/q3plus-10seeds-2026-05-11.md:14-20` | iBS l.33 | 0 h ; recoupement avant d'affirmer |
| BS-B2 (A l.183) [1] | bouba_sens | inchangé (nul confirmé/renforcé) | **reformuler** (nature : nul → non-test / non mesurable) | B-2 : non-test sur gaussien et CC-film (régime qui n'apprend pas) ; non mesurable sur Studyforrest (sonde contiguë à une classe, puis porte 0/10 graines). | `main.tex:1062-1076,1110-1124` ; JSON stratifiés `n_seeds_gate_pass = 0` | iBS l.34, l.115 | retire B-2 du papier « nuls TOST » (ligne Q3 2027 de la roadmap à reformuler) |
| BS-E12 (A l.184) [1] | bouba_sens | inchangé (réfuté E1) | **reformuler** | E1 (sonde riche) : non concluant dans un canal de codes effondré ; non mesurable sur Studyforrest. | `bouba:scripts/spikes/e1_b2_dimensional_mine.py:62-72` | iBS l.35 | 0 h |
| BS-P128 (A l.188) [1] | bouba_sens | inchangé (amendé) | **reformuler** | N ≳ f(D) nécessaire, pas suffisant : composition de la sonde et des lots rapportée et contrôlée. | issues #77, #80 | iBS l.36 | + 0,5 h dans v0.7.1 |
| BS-B3 (A l.179) [1] | bouba_sens | inchangé (confirmé, magnitude ; MAJ 31/10 : nul apparié non calibré) | **reformuler** ; la forme à seuil 0,02 est close (règle non informative) | Sous lésion effective et en régime qui apprend, l'interaction lésion × requête, sur résidus, dépasse un nul dont l'unité échangeable est le réseau lésé. | ADR-0026:350-355 (taux 1,0 sous H0 à n ≤ 1024) ; amendement diagnostic Me6 :215-248 | iBS l.47, l.114 | aucun calcul avant le tag v0.7.1 (S10) ; dépend de #66 révisée |
| NH-66 (B l.308) [1] | bouba_sens | inchangé (PRÊT) | **reformuler** (moitié close par Me6 du 31/10) | À n ≤ 64, Me6 est dominé par le bruit d'échantillonnage ; à grand n, l'excès est une asymétrie propre à chaque réseau, de signe non reproductible, qui doit disparaître sous un nul par réseau. | milestone Me6 :46-61 (gaussien n = 4096 : 0,0585 contre 0,0164) | iBS l.51 ; iVEI l.57 (MotorSense, outil) | se confond avec la révision de #66 (≈ 6 h de texte) |
| BS-v07 (A l.190), v0.7 (C l.48) [2] | bouba_sens | utile, sous verrou | **reformuler** (préconditions 15-18 ajoutées) | Ajouter : composition de la sonde, composition des lots, straight-through primaire avec porte sur sonde équilibrée, correction « 300-304 non utilisées ». | `bouba:src/bouba_sens/world/actionsense.py:5-6` ; `amendment-v0.7-actionsense.md:346-349` | iBS l.60 | + 1 h dans les 6 h de l'amendement v0.7.1 |
| NH-70 (B l.312) [1] | bouba_sens | inchangé | **reformuler** (précondition) | « Checkpoints existants » → checkpoints straight-through dont la porte d'apprentissage est passée. | ADR-0024:56-60 | iBS l.71 | aucun |
| NH-67 (B l.309) [1] | bouba_sens | inchangé | **reformuler** (précondition ; inv. : garder) | ΔU suppose un estimand B-2 sur canaux survivants et un régime qui apprend, sinon ΔU = 0 par construction. | ADR-0024:45-48 ; M24 du 01/11 | iBS l.69 | aucun |
| BS-v08, BS-v09 (A l.191-192) [2] | bouba_sens | utile, sous verrou | **garder** ; héritent des points 15-17 | — | — | iBS l.61 | 0 |
| BS-OQ1, B1, HB1, LOCK (A l.169-172) [4] | bouba_sens | inchangé | **garder** avec note ADR-0024 (« réfuté » ne vaut pas contre un agent qui apprend) | — | ADR-0024:41-44 | iBS l.62 | 0 |
| KFR-H24 (C l.41, A l.120) [2] | kiki-flow-research | réfuté ; convention de noyau à fixer | **fermer** l'énoncé E1b-1.1 tel que codé — négatif selon préreg ; la loi ε/(2τ) passe en KFR-N3 | — | `kfr:experiments/results/e1b_peyre_bias.json:124-130` (pente 0,600 hors [0,45 ; 0,55]) | iKFR l.23, l.114 | ≤ 1 h (paragraphe `kfr:paper/main.tex:880-891`) |
| M5 certification (C l.42) [1] | kiki-flow-research | rapport technique ; failed 50/60 | **fermer** — négatif selon règle gelée (reste publiable en note numérique) | — | `kfr:docs/prereg/2026-10-30-m5-certify-reading-rule.md:3,16-19,31-39` ; `kfr:docs/results/2026-10-30-m5-certify-verdict.md:9-23` | iKFR l.24, l.115 | 0,5 h pour la 39e configuration (descriptive) ; note ≈ 4 h |
| NH-20 (C l.43, B l.262) [2] | kiki-flow-research | utile, sous verrou ; non identifiable au premier essai | **reformuler** (portée, nature, préconditions) | Flot WFR de KL(ρ‖N) en 1D, découpé W₂/FR : pente globale à T = 1 dans [1,75 ; 2,25] pour Strang à sous-flots exacts, [0,75 ; 1,25] pour Lie, et [0,75 ; 1,25] pour les deux à sous-pas JKO ; nul calibré = bras Strang exact. | M12 « not a direct test » (`kfr:docs/prereg/2026-10-30-jko-splitting-lie-strang.md:36-40`) ; `kfr:docs/prereg/nh20/reading-note.md:353-422` | iKFR l.25, l.31 ; iVEI l.49 (aucune antériorité dans la fenêtre) | < 1 min CPU, ≈ 6 h humaines après déclaration du verrou par le PI |
| NH-58 (B l.300) [1] | kiki-flow-research | inchangé (PRÊT) | **fermer** — clos par erratum | — | `kfr:ERRATUM.md:437-452` (§11, validé PI le 25/10) ; objet non JKO (`:485-533`) | iKFR l.32, l.111 | fermer l'issue #29 ; ≈ 1 h de note |
| NH-59 (B l.301), NH-60 (B l.302) [2] | kiki-flow-research | reporté après M3 | **reformuler** (précondition ; inv. : garder) | NH-59 : pas certifié à λ_J élevé vérifié sur 3 pas avant tout run. NH-60 : pas certifié à 10⁴ pas sur grille ≥ 1 024, hors de portée du solveur actuel [inférence]. | `m5-certify-reading-rule.md:11-13` ; `kfr:ERRATUM.md:566-569` | iKFR l.33-34 | aucun ce trimestre |
| NH-61 (B l.303) [1] | kiki-flow-research | inchangé | **garder** ; étiquette alignée sur reporté après M3 | — | NH-59/60/63 retirés de la phase 2 (`cat:301-302,305`) | iKFR l.35 | 0 h ; décision PI |
| NH-62 (B l.304) [1] | kiki-flow-research | inchangé | **reformuler** (précondition, bouton) | Sur le pas JKO entropique certifié, rétention × gap a un maximum intérieur en reg/h. | `kfr:ERRATUM.md:516-533,576-580` | iKFR l.36 | sous réserve de recalcul |
| NH-63 (B l.305) [1] | kiki-flow-research | reporté après M3 | **garder** (note : schémas, pas la dynamique T2) | — | `kfr:ERRATUM.md:610-616` | iKFR l.37 | aucun |
| KFR-H18 (C l.40, A l.116) [2] | kiki-flow-research | artefact plausible | **garder** (pas « clos par erratum ») | — | PR #65 retire « régime du Thm 3.4 » ; 67,79 reste en `kfr:paper/main.tex:300,639` | iKFR l.22 | rejeu POT (minutes CPU, ≈ 2 h) ou une phrase (≤ 0,5 h) |
| KFR-H2 (A l.101) [1] | kiki-flow-research | inchangé (amendé, rescopé fast) | **fermer** — clos par erratum | — | `kfr:ERRATUM.md:591-601` (§13) | iKFR l.46, l.112 | négatif « attendu par construction » ; KFR-N5 le rend testable |
| KFR-H4, H5, H6, H7 (A l.103-106) [4] | kiki-flow-research | inchangé (rétracté) | **fermer** — clos par erratum (étiquette ; verdict inchangé) | — | `kfr:ERRATUM.md:43-58,185-227` | iKFR l.47 | 0 h |
| KFR-H28 (A l.123) [1] | kiki-flow-research | inchangé (confirmé, framing amendé) | **fermer** — clos par erratum | — | `kfr:ERRATUM.md:485-533` (§12) | iKFR l.51 | 0 h |
| KFR-H1 (A l.100), KFR-H29 (A l.124) [2] | kiki-flow-research | inchangé | **reformuler** (nature → rapport technique) | H1 : 12 min 42 s chronomètre le legacy split, pas un pas JKO. H29 : le surrogate imite l'application d'avant le correctif. | `kfr:ERRATUM.md:516-533` ; `:54,225` | iKFR l.45, l.52 | sous réserve de recalcul |
| KFR-H8 (A l.107), KFR-H9 (A l.108) [2] | kiki-flow-research | inchangé (confirmé) | **reformuler** (portée ; inv. : garder) | H8 : la moitié « rigoureuse » est le legacy split, sous réserve de recalcul. H9 : portée « rapide, γ ≤ 5 », γ ≥ 10 non interprétable. | `kfr:ERRATUM.md:516-533,631-647` | iKFR l.48-49 | aucun |
| KFR-H22 (A l.118) [1] | kiki-flow-research | inchangé (confirmé, prototype) | **reformuler** (nature → non-test) | b^asym préserve L2, pas Σρ ; b^phono absent de Track 2. | `kfr:kiki_flow_core/track2_paper/paper_f.py:248-282` | iKFR l.50 | décision PI |
| routage LoRA 46,4 %, « +7 pp » (C l.44) [1] | micro-kiki | rapport technique ; A/B nul | **reformuler** | 46,4 % / 69,6 % (MiniLM-L6, 34 classes) en rapport technique ; « +7 pp » est un non-test. | `mk:docs/ERRATA.md:165-194` | iMKBB l.48-50 ; iVEI l.83 (46,4 % dans la plage d'un routeur non supervisé) | retraits textuels (`ROADMAP.md:97`) |
| MK-01 (A l.209) [1] | micro-kiki | rapport technique | **fermer** (part 70,7 / 89,5) — clos par erratum ; la part 46,4 / 69,6 reste en rapport technique | — | erratum E-2026-10-25-03 (`mk:docs/ERRATA.md:144-194`) | iMKBB l.48 | issue #17 à fermer (0,25 h) |
| MK-02 (A l.210) [1] | micro-kiki | rapport technique | **reformuler** | 2,2× contre une baseline mots-clés réduite au nom du domaine, sur une autre validation (14 423 ex., 35 dom.). | `mk:docs/ERRATA.md:186-188` ; M18 du 01/11 | iMKBB l.49 | retrait textuel |
| MK-09 (A l.216) [1] | micro-kiki | rapport technique | **fermer** — non-test | — | `mk:results/eval_cognitive_ab.json` (Δ −0,0102, 14/16) ; juge et RBD neutralisés (`mk:src/serving/full_pipeline_server.py:823-824,890`) | iMKBB l.50, l.165 | retrait textuel ; MK-N1 (1 h CPU) explique le chiffre |
| MK-10 (A l.217), MK-12 (A l.219) [2] | micro-kiki | inchangé | **reformuler** | MK-10 : un compte de rappels, pas une utilité. MK-12 : P 0,765 / R 0,383 hors ligne ; RBD et KnowBias inactifs dans le serveur déployé. | `mk:paper/micro-kiki.tex:293,493` ; `mk:src/cognitive/rbd.py:40-41` | iMKBB l.52, l.54 | retrait textuel |
| MK-23 (A l.229) [1] | micro-kiki | reformulé (DPI) | **garder** (« refuted » du dépôt compatible) | — | `mk:docs/ERRATA.md:126-140` | iMKBB l.57 | issue #11 ouverte |
| NH-84 (B l.326), NH-65 (B l.307) [2] | micro-kiki | inchangé | **garder** ; non posables sans Studio | — | Studio éteint ; base BF16 ≈ 70 Go > 24 Go de la 4090 [inférence] | iMKBB l.59-60 | M19 (angles) ≈ 2 h CPU si les adaptateurs sont accessibles |
| NH-85 (B l.327) [1] | micro-kiki | reporté après M3 | **reformuler** (portée) ; rester reporté | H10 : Aeon ne dépasse pas un RAG naïf à budget de contexte égal (réplication ciblée de Bao et al.). H9 : antériorité directe probable (eLife 112891), à fermer comme contribution neuve si la lecture le confirme. | arXiv:2610.30755 ; 10.7554/elife.112891.1 [résumé] | iMKBB l.62 ; iVEI l.74-75, l.112 | ≈ 16 h + 1 j de 4090, après M3 |
| BB-01 (A l.193), Claim A (C l.49) [2] | baby-brain | artefact plausible | **reformuler** (préconditions) | Testable seulement avec (1) porte sur le pas après l'optimiseur, (2) E0 apparié en cadence et en balayage, (3) diagnostics de plasticité sur les deux bras. | `bb:baby_brain/ontogeny/integration.py:93-109` ; DOI 10.1038/s41586-024-07711-7 | iMKBB l.69 | aucun run ; BB-N1 (minutes CPU) |
| BB-03 (A l.195) [1] | baby-brain | inchangé (non testé) | **reformuler** (nature → non-test) | E4 nul par construction ; s'il est rouvert, il écrit dans les poids et se compare à un contrôle ridge / arrêt précoce. | B20 du 01/11 ; DOI 10.1016/j.neunet.2024.106389 | iMKBB l.71 | reporté (décision PI) |
| NH-77 (B l.319), NH-78 (B l.320), NH-79 (B l.321) [3] | baby-brain | reporté / inchangé / inchangé | **reformuler** (préconditions) | NH-77 : régularisateur anti-effondrement et cible qui identifie la vitesse. NH-78 : préconditions de BB-01. NH-79 : à cible d'une image, l'action seule ne restaure pas R² vitesse ≥ 0,6 ; prédire la transition la restaure. | arXiv:2610.06805, arXiv:2610.07540, arXiv:2610.04585 (lus par le dépôt) | iMKBB l.73-75 ; iVEI l.89 (nul « même architecture non entraînée ») | aucun ce trimestre |
| NH-87 (B l.329) [1] | baby-brain | inchangé (« seule question neuve ») | **garder** ; le bras (b) doit choisir son contrôle BabyCL | — | `these-baby-brain.md:48-49` | iMKBB l.77 | dessin 2 h |
| NH-01 (B l.243), C1 = 3,86 (C l.50) [2] | rescience-nh01 / transversal | artefact plausible ; « à déclarer à l'éditeur » | **reformuler** (portée) — proposition iMKBB ; iNW et iDOK proposent « garder » avec renvois (voir rapport §4) | Sous J_ii = 0 des deux côtés, C1 se réplique (3,90 sur graines 200-209 ; 3,86 sur 0-9) ; diagonale des deux côtés : 1,90 [1,85 ; 1,96] ; 3,05 est un rapport mixte sans protocole publié. | commentaire ReScience/submissions#147 du 04/11 §2 ; `nerve-wml:docs/results/2026-10-31-nh01-diagonal-ablation.md:15-16,31-33` | iMKBB l.83 ; iNW l.41 ; iDOK l.47 ; iVEI l.65-67 | v2 ReScience aux deux conventions (4 h, inchangé) |
| paper-methodo « bit-exact » (C l.51) [1] | paper-methodo-2026 | reformulé (reproduction interne) | **reformuler** (étendue) | Bit-exacte intra-hôte x86-64 ; inter-ISA aarch64 : INCONCLUSIVE_STRICT sous le protocole gelé, REPRODUCED seulement sous tolérance post hoc 1e-10. | `rescience-nh01:docs/prereg/arm-reproduction/amendment-2026-11-04.md:10-13,82-89` | iMKBB l.84 | la note ne peut plus écrire « bit-exact » sans qualificatif |
| NH-12 (B l.254) [1] | dream-of-kiki (veille) | inchangé (SPÉC) | **reformuler** (variable) — proposé sur résumé seul, à lire avant | Séparer bruit neuronal rapide (optimum intérieur publié) et bruit synaptique lent (dégradation monotone sur mémoire associative). | arXiv:2611.00516 [résumé] | iVEI l.66, l.105 | aucun ce trimestre (VEI-3) |

## Hors catalogue (à inscrire ou à noter ; non comptés ci-dessous)

| Objet | Proposition | Preuve | Établi par |
|---|---|---|---|
| NH-96 (priorités du 30/10, jamais reportée en table B) | inscrire sous un identifiant non ambigu, étiquette « rapport technique » (contrôle de chaîne `eng − nocomm`, résultat attendu) | `nerve-wml P100:docs/prereg/n10d/nh96-null.md:3-6,20-28` | iNW l.23 |
| NWML-P1bis, NWML-P8c (Hopfield) | inscrire en table A, étiquette « préreg gelée, verrou non passé (ADR-0003) », nature exploratoire pour tout usage public | `nerve-wml ADR3:docs/adr/0003-reading-gate-exception-p1bis-p8c.md:96-117` | iNW l.39-40 |
| Me6 large-n | geler comme rapport technique ; au plus pilote du nul réseau de v0.7.1 | amendement diagnostic Me6 :250-262 | iBS l.52 |
| Recalcul certifié §16 (décision PI du 28/10) | reformuler la décision : γ ≤ 5 d'abord, pilote grille 64, γ ≥ 10 bloqué tant que KFR-N4 n'a pas levé le plancher | `kfr:ERRATUM.md:889-894` | iKFR l.62 |
| « ε = h », legacy split « full JKO » (§12), verdict L1 Turing fort (§14) | clos par erratum | `kfr:ERRATUM.md:271-316,514-533,625-640` | iKFR l.59-61 |
| M12 Q1 | négatif selon préreg (Lie et Strang non substituables au pas certifié, γ ≤ 30) | `kfr:docs/notes/2026-11-01-jko-splitting-results.md:27-40` | iKFR l.117 |
| Table des latences, CAMP/Catfish, KnowBias (micro-kiki) | retrait textuel, aucune hypothèse | `mk:paper/micro-kiki.tex:50,371-390,495` ; `mk:src/cognitive/judge.py:53-54` | iMKBB l.51, l.55 |

## Comptes (vérifiés deux fois, par ligne v2)

**Méthode.** Chaque ligne v2 est comptée une fois, dans le dépôt de la ligne de table où elle figure (NH-01 et C l.50 sous « transversal » ; NH-12 sous « veille »). Second comptage : somme des crochets [n] par proposition, refaite sur la table ci-dessus. Les deux donnent les mêmes nombres.

| Dépôt | fermer | reformuler | garder (touchées) | rouvrir | total touché |
|---|---|---|---|---|---|
| nerve-wml | 1 | 9 | 4 | 0 | 14 |
| dream-of-kiki | 3 | 5 | 7 | 0 | 15 |
| bouba_sens | 8 | 9 | 6 | 0 | 23 |
| kiki-flow-research | 10 | 10 | 4 | 0 | 24 |
| micro-kiki | 2 | 5 | 3 | 0 | 10 |
| baby-brain | 0 | 6 | 1 | 0 | 7 |
| transversal (rescience-nh01, paper-methodo) | 0 | 3 | 0 | 0 | 3 |
| veille seule (NH-12) | 0 | 1 | 0 | 0 | 1 |
| **Total** | **24** | **48** | **25** | **0** | **97** |

Direction : « fermer » ne contient aucune ligne rouverte ; « 24 fermées » ne veut pas dire « 24 réfutées » (voir ci-dessous : 3 seulement sont des négatifs selon préreg). Sur les 20 lignes de la table C, 16 sont touchées (non touchées : l.38 PSK, l.45 C5, l.46 NH-81, l.47 invariant bouba). Sept lignes classées « reformuler » portent « garder » dans leur inventaire (NH-31 et NH-33 « reporter », NH-59, NH-60, NH-67, KFR-H8, KFR-H9) : la différence vient de la règle de classement, pas d'un désaccord sur les faits.

### Fermetures par motif (24 lignes)

| Motif | n | Identifiants (`cat:` l.) |
|---|---|---|
| clos par erratum | 16 | BS-SF45 (173), BS-AMEDI (174), BS-COMP (175), BS-TAU (176), BS-CBF (177), BS-S14c (178), BS-Q3 (185, sous réserve), BS-N12 (186, sous réserve), NH-58 (300), KFR-H2 (101), KFR-H4 (103), KFR-H5 (104), KFR-H6 (105), KFR-H7 (106), KFR-H28 (123), MK-01 (209, part 70,7 / 89,5) |
| non-test | 3 | NWML-N10C (165, campagne arrêtée sans verdict), MK-09 (216), DOK-E1 (93, abandonné, jamais lancé) |
| non mesurable | 0 ligne fermée | portions seulement, dans des lignes reformulées : BS-B2 et BS-E12 sur le pont Studyforrest (183, 184) |
| négatif selon préreg | 3 | KFR-H24 (C l.41 et A l.120, E1b tel que codé), M5 (C l.42, règle gelée, 50/60) |
| lecture exploratoire faite selon la préreg (ni positif ni négatif confirmatoire) | 2 | DOK-H14 (A l.97) et H14 E1-small (C l.33) ; H14-B définitive après PR #92 |
| artefact plausible | 0 | aucune ligne fermée comme artefact ; KFR-H18 (C l.40, A l.116) reste ouverte « artefact plausible » faute de rejeu archivé ; la forme à seuil de BS-B3 (179) est close comme règle non informative à l'intérieur d'une ligne reformulée |

Somme : 16 + 3 + 3 + 2 = 24.

## Correspondance avec les 9 verdicts du 24/10 (règles `cat:16-18`)

Règles appliquées : réplication, rapport technique, reformulé → amendé ; exploratoire → en attente ; non-test, artefact plausible → non concluant ; clos par erratum, reporté, utile sous verrou, inchangé → verdict du 24/10 conservé. **Extensions proposées par la synthèse, à valider par le PI** : « non mesurable » → non concluant ; « négatif selon préreg » → réfuté ; « lecture exploratoire faite » → en attente (règle de l'exploratoire) ; « abandonné, jamais lancé » → non testé (classe du 24/10, `01-table-maitresse-hypotheses.md:6`). Seules les lignes de la table A portent un verdict ; les tables B et C n'entrent pas dans le comptage.

| Ligne A (l.) | Classe v2 | Classe v3 proposée | Motif |
|---|---|---|---|
| NWML-N10C (165) | en attente | non concluant | non-test |
| DOK-E1 (93) | en attente | non testé | abandonné |
| BS-B3 (179) | confirmé | amendé | reformulé |
| BS-B2 (183) | nul | non concluant | non-test / non mesurable |
| BS-E12 (184) | réfuté | non concluant | non-test |
| KFR-H8 (107) | confirmé | amendé | reformulé (portée) |
| KFR-H9 (108) | confirmé | amendé | reformulé (portée) |
| KFR-H22 (118) | confirmé | non concluant | non-test |
| KFR-H29 (124) | confirmé | amendé | rapport technique |
| MK-09 (216) | amendé | non concluant | non-test |
| MK-10 (217) | non concluant | amendé | reformulé |
| MK-12 (219) | non concluant | amendé | reformulé |
| BB-03 (195) | non testé | non concluant | non-test |

Bilan net (13 lignes changent de classe) : confirmé −5, réfuté −1, nul −1, en attente −2, non testé 0 (+1 −1), non concluant +4 (+6 −2), amendé +5 (+6 −1) ; somme 0.

**Effet pervers de la règle l.18, à trancher (rapport §7, Q2).** Une ligne « clos par erratum » garde son verdict du 24/10. Trois lignes fermées par erratum restent donc comptées « confirmé » ou « amendé » : BS-SF45 (confirmé, Branch B), KFR-H28 (confirmé, framing amendé), KFR-H2 (amendé). Mappées sur « rétracté », elles feraient confirmé −2 et amendé −1 de plus.
