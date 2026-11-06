# Intégration des deux relectures — refresh du catalogue (2026-11-06, ~20:10-20:55 CET)

Relectures intégrées : **C** = critique Claude à contexte vierge (`critique/critique-claude-2026-11-06.md`, verdict REVISE) ; **X** = passe croisée Claude Opus remplaçant gpt-6-astra (`codex/report-claude-cross.md` ; quota : `codex/QUOTA.md`). Fichiers corrigés : `synthese/rapport.md`, `synthese/catalogue-v3-delta.md`, `synthese/nouvelles-hypotheses.md`, `synthese/README.md`. Copies v1 intactes : `synthese/*-v1-pre-critique.md` (le fichier `nouvelles-hypotheses.md` n'a pas de copie v1 ; son état v1 est celui que citent les deux relectures).

Méthode : chaque BLOQUANT et MAJEUR a été vérifié en ouvrant la source citée (chemins relatifs à `repos/<dépôt>/` sauf mention ; `cat` = `dotgithub/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` ; `RM` = `dotgithub/docs/ROADMAP.md` ; `R0111` = `dotgithub/docs/research/2026-11-01-analyse-profonde/README.md`). Les MINEUR qui changent un chiffre ou une étiquette ont été vérifiés ; les reformulations pures concordantes ont été appliquées sur la foi des deux relectures (marquées « concordant »). Calculs : `python3 -I` sur fichiers versionnés seulement (sommes, binomiale, inversion de signe sur `micro-kiki/results/eval_cognitive_ab.json`). Aucun code des dépôts exécuté. GitHub lu en lecture seule (`gh pr view` #92 dream-of-kiki, #118 nerve-wml ; `git fetch origin pull/118/head`).

Verdicts : **confirmé** (la source dit ce que dit la relecture) ; **nuancé** (vrai en partie, ou correction acceptée sous une autre forme) ; **réfuté** (la source contredit la relecture ; détail en annexe).

## BLOQUANT

| id | rel. | source vérifiée (chemin:ligne) | verdict | action dans le rapport |
|---|---|---|---|---|
| C-B1 | C | `micro-kiki/docs/ERRATA.md:190-194` : « Open. To reinstate an mpnet router … MK-01 in the master table stays "non concluant (provenance)" until then; the row's measured value is 46.4 / 69.6 » | confirmé | MK-01 : fermer → **reformuler** (70,7 / 89,5 retiré ; 46,4 / 69,6 en rapport technique ; non concluant jusqu'au réentraînement mpnet). Sorti de Q6. |
| X-B1 | X | `cat:123` (KFR-H28 : « reviewer: rigorous proxy label overstated », résultat « The reviewer is correct », verdict « confirmé (framing amendé) ») ; `kiki-flow-research/ERRATUM.md:485-499` (§12 : le chemin rigoureux n'est pas un pas JKO de F) | confirmé | Q2 (b) réécrite : KFR-H28 reste « confirmé » (l'erratum donne raison au relecteur) ; « rétracté » = BS-SF45 (et BS-CBF, voir C-m5) ; KFR-H2 → « réfuté ». Paragraphe « effet pervers » du delta et E-9 réécrits. |

## MAJEUR

| id | rel. | source vérifiée (chemin:ligne) | verdict | action dans le rapport |
|---|---|---|---|---|
| C-M1a | C | `dream-of-kiki/docs/results/2026-11-06-e1-small-analysis.md:188-206` (H14-B BOUNDED-NO-GAIN, contrôle à faible pouvoir) ; `inventory/dream-of-kiki.md:32` (« fermer après #92 ») ; `gh pr view 92` : brouillon ouvert | confirmé | DOK-H14 (A l.97, C l.33) : fermer → **reformuler** (nature : lecture exploratoire faite ; H14-B en attente de #92 ; H14-A transférée à DOK-N1 ; étiquette « ordre des phases » retirée). |
| C-M1b | C | `dream-of-kiki/docs/osf-amendment-e1-small-2026-10-30.md:82-92` (décision 35B retirée après exposition ; « independence from them cannot be shown ») | confirmé | DOK-E1 sorti de « fermer » : nouvelle colonne **abandonné (décision du PI, hors fermetures)**, 1 ligne. |
| C-M1c | C | `kiki-flow-research/ERRATUM.md:437-452` (ε ∈ [0,01 ; 0,05] seulement) ; `cat:300` (trois volets, critère à ε/h = 0,1) | confirmé | NH-58 : fermer → **reformuler** (volet 1 clos dans la plage mesurée ; volet 2 non testé ; volet 3 → KFR-N3). |
| C-M1d | C | `bouba_sens/docs/adr/0024-erratum-default-regime-does-not-learn.md:3-5,32-40` (Q3/Q3+ et N12 nommés) ; `0019-multi-seed-q3-retract.md:15` (§5.5 « on 4.5-modal real bridge ») ; `0013-dose-response-amedi-curve.md:27` | nuancé | La réserve n'est plus une preuve manquante : Q3 est rétracté par sa préreg (ADR-0019a), N12 réfuté selon sa préreg, les deux dans le régime qui n'apprend pas (ADR-0024:34-38). BS-Q3, BS-N12 fermés **sans réserve** ; le pont Studyforrest reste une inférence, la fermeture n'en dépend pas (avec X-M5). |
| C-M1e | C | `synthese/rapport-v1-pre-critique.md:8` | confirmé | Phrase « Aucune n'est fermée … par lassitude » remplacée par la répartition par preuve. |
| C-M2 | C | colonne verdict de `cat` : KFR-H4-H7 rétracté (l.103-106), BS-AMEDI rétracté (174), COMP, TAU, S14c réfuté (175, 176, 178), BS-Q3 rétracté (185), BS-N12 réfuté (186), KFR-H24 réfuté (A l.120) et REFUTED (C l.41) | confirmé | §0 : « 19 lignes, dont 12 déjà rétractées ou réfutées en v2 et 1 doublon C/A (KFR-H24) ; 7 fermetures nouvelles ». |
| C-M3 | C | `cat:14` (« inchangé … ne vaut pas validation »), `cat:26` (périmètre : seules les requalifications de la spec) ; ADR-0024:3-5 (daté du 2026-10-26) | confirmé (E-2 nuancé) | §3 scindé : 3 errata (E-1, E-3, E-4), 1 incomplet (E-2), 3 omissions de périmètre (E-5 à E-7), 1 absence (E-8), 1 conséquence de règle (E-9). E-7 sans conditionnel. |
| C-M4 / X-M6 | C, X | `micro-kiki/results/eval_cognitive_ab.json` `summary.per_domain` : écarts +0,0101 (chat-fr), −0,1313 (embedded), +0,0704 (power, n = 5), +0,0386 (python), −0,0016 (spice), −0,0475 (stm32) ; global −0,0102, 14/16 ; `paper/micro-kiki.tex:50,329` (« +7 pp ») ; inversion de signe sur les 30 paires, B = 100 000, graine 0 : P(max des 6 moyennes ≥ 0,0703) = 0,425 (X : ≈ 0,42) | confirmé | C-4 réécrite (sélection avérée) ; VEI-8 = nul principal de MK-N1 ; MK-N1 réécrite avec marge d'équivalence et Dubois arXiv:2404.04475 ; Q5 (b) mise à jour. |
| C-M5 / X item 36 | C, X | `RM:11` (principe 3 : exception sur le **gel**), `RM:12` (principe 4 : « Une seule campagne lourde à la fois. Aucune nouvelle campagne GPU avant S6 »), `RM:14` (principe 6), `RM:57` | confirmé | N-13, C-6 et Q4 réécrits : l'exception citée par `RM:57` ne couvre pas la règle enfreinte. |
| C-M6 | C | coûts de `nouvelles-hypotheses.md` (v1) : 1 + 4 + < 1 + 1 + 4-6 + 1 + 3 + 5 + 4 + 4 ≈ 28-30 h hors VEI-1/VEI-2 | confirmé | « 15 h » retiré de Q5 (c) ; sommes données : paquet (i) v2 ≈ 23 h (10 hypothèses, hors VEI-1/VEI-2), ≈ 28-30 h avec les 2 contrôles ; Q5 (b) ≈ 13-14 h. |
| C-M7 | C | `rapport-v1:228-235` ; `inventory/bouba_sens.md:61` (QCM Me6 : (a) conditionnelle, (b) tirages de réseaux, (c) gel ; « (b) est la seule qui garde B-3 comme hypothèse sur la plasticité ») | confirmé | Q6 : (a) aucune, (b) les 17 sans réserve, (c) les 19. R1 : (a) tirages de réseaux, (b) conditionnelle, (c) gel. « Seulement » supprimé. |
| C-M8 / X-M1 | C, X | `catalogue-v3-delta-v1:128` (règle « reformulé → amendé ») ; verdicts `cat:140` NWML-PRH amendé + artefact plausible, `cat:193` BB-01 non testé + artefact plausible, `cat:190` BS-v07 en attente + utile sous verrou, `cat:209` MK-01 non concluant + rapport technique | nuancé | Règle de préséance écrite (P1-P4, delta). Appliquée ligne par ligne : **19 lignes** changent de classe (13 v1 + NWML-PRH + BS-OQ1, BS-B1, BS-HB1, BS-LOCK + MK-01), bilan confirmé −6, réfuté −4, nul −1, en attente −2, non testé 0, non concluant +8, amendé +5. MK-01 : la ligne reformulée prend la classe que le dépôt écrit lui-même, « non concluant (provenance) » (`ERRATA.md:193-194`), donc amendé → non concluant (X : « 16 si MK-01 passe en reformuler » suppose amendé → amendé ; nuancé). BB-01 et BS-v07 (et BS-v08/v09) ne changent pas par P3 (préconditions ajoutées à une ligne sans résultat). Sans P3 : 23 lignes (−6 / −4 / −1 / −5 / 0 / +7 / +9). « Somme 0 » retiré comme vérification ; table recomptée par script. |
| C-M9 | C | `e1-small-analysis.md:200-206` (« Le contrôle peut échouer … faiblement … contrôle à faible pouvoir de falsification, pas « non informatif » ») | confirmé | S2 scindée : S2 (ne peuvent pas échouer : sonde B-2 contiguë, NH-96, seuil B-3) ; S2b (faible pouvoir de falsification : H14-B). |
| X-M2 | X | = C-B1 | confirmé | idem C-B1. |
| X-M3 | X | = C-M1c ; `inventory/kiki-flow-research.md:32` (ε/h = 0,1 non mesuré) | confirmé | idem ; renvoi à KFR-N3. |
| X-M4 | X | DOK-H14 : = C-M1a. KFR-H2 : `kiki-flow-research/ERRATUM.md:591-601` (excès sur Gibbs négatif à α ≤ 20, γ ≤ 10 ; « no longer claim emergent specialisation ») ; KFR-N5 = autre énoncé (état final = minimiseur statique de F) | DOK-H14 confirmé ; KFR-H2 nuancé | DOK-H14 → reformuler (en attente de #92). KFR-H2 : **fermer** (l'erratum est une preuve au sens du brief), **successeur explicite KFR-N5** écrit dans la ligne. Choix dit dans le delta. |
| X-M5 | X | ADR-0024:3 (« Accepted — PI decision 2026-10-26 (22:28) »), :32-40 (portée : toutes les grilles, dont lock, gating, N12, Q3/Q3+), :49-51 (B-3 v1 = exactitudes au hasard), :56-60 (« not evidence for or against ») ; `cat:169,179` (BS-OQ1 « confirmé (Occam → shared) », BS-B3 « confirmé (magnitude) », inchangés) | confirmé | E-7 sans conditionnel, étendu à BS-B3 et BS-OQ1 (et aux « réfuté » de BS-B1, HB1, LOCK) ; réserve Q3/N12 levée (voir C-M1d). |
| X-M7 | X | `inventory/kiki-flow-research.md:71` (source de KFR-N1 : « arXiv:1802.08089 (SLA, annexe B) ») ; résumé arXiv:1802.08089 résolu (`synthese/resolve-integration.tsv`) : SLA = demi-pas avant, flot de chaleur exact, pas proximal ; « SLA is in fact consistent for Gaussian target measure » | confirmé | KFR-N1 requalifiée « calibration sur cible gaussienne » (antériorité partielle Wibisono 2018, lue en résumé) ; nouveauté seulement pour un potentiel non gaussien. |
| X-M8 | X | `inventory/compute-status.md:5-6` (#92 GPU 21,8 / 24,6 Go + 8 workers `p8c_nocap --confirmatory`, plafond de mur 10/11) ; `RM:12` et `RM:190` (« pas plus d'une campagne lourde à la fois ») ; `RM:14` (lourd = GPU ou > 6 h CPU) ; `nerve-wml` `pr118:docs/adr/0003-reading-gate-exception-p1bis-p8c.md:3-4` (« Accepted, PI decision 2026-11-06 17:12 … to be signed by the PI »), :109-111 (aucun langage confirmatoire), :195-198 (case de signature vide) ; `gh pr view 118` : brouillon ouvert | confirmé | Nouveau MAJEUR **N-16** ; Q4 réécrite ; « aucune lecture confirmatoire de P8c avant signature d'ADR-0003 » dans §2, §6 et Q4. |
| X-M9 | X | résumé arXiv:2609.34373 (API, `resolve-integration.tsv`) : ingénié 1,000, appris 0,482 « indistinguishable from silence (p = 0.400, n = 25) », « self-play 0.980 collapses to 0.144 across seeds », démarrage à chaud 0,857 contre 0,562, 25 graines | confirmé | N-8 et §5 réécrits ; nouveauté de NWML-N1 = l'intervention de dérangement sur le canal appris ; NH-33 cite la source. |
| N-16 | synthèse | voir X-M8 | — | ajouté au §2 ; MAJEUR passent de 15 à 16. |

## MINEUR

| id | rel. | source vérifiée | verdict | action |
|---|---|---|---|---|
| C-m1 | C | ADR-0024:41-44,52-60 ; ADR-0013:27, 0014:39, 0015:29, 0016:34 (`data_dir=data/sf_phase2_adapted`) | confirmé | BS-OQ1, B1, HB1, LOCK : garder → **reformuler (nature : non-test, régime qui n'apprend pas)** ; la ligne BS-AMEDI… écrit la différence (pont Studyforrest non reconstructible ; l'hypothèse pour un agent qui apprend passe à BS-v07). |
| C-m2 | C | `inventory/bouba_sens.md:24` (phase 2 « probable, non vérifiable ») | confirmé | §0 : phase 2 « lecture fautive du code, effet sur les tenseurs d'avril probable, non vérifiable ». |
| C-m3 | C | `e1-small-analysis.md:203-206` | confirmé | §6 : « va dans le sens de … (formulation après #92) ». |
| C-m4 | C, X item 34 | `nerve-wml/scripts/platonic_rh_alignment.py:85,112` (concordant C et X) | confirmé | R5 (a) : « préciser que l'embedding est pris avant le pas impulsionnel ». |
| C-m5 | C | `cat:174-178` ; delta v1 l.148 | confirmé | Q2 (b) donne les deux sens (avec X-B1). |
| C-m6 | C, X | `nouvelles-hypotheses.md` v1 l.22-23 | confirmé | BOUBA-N1 : P95-P99 = zone sans décision, rapportée « non concluant ». |
| C-m7 | C, X | `RM:10` (principe 2) ; v1 l.33 (« Nul : aucun ») | confirmé | BOUBA-N4 → **contrôle descriptif**, hors comptage des hypothèses. |
| C-m8 | C, X | arXiv:1412.6980 (Adam, « invariant to diagonal rescaling of the gradients », résolu) | confirmé | BB-N1 → **test de harnais**, hors comptage. Hypothèses : 26 → 24 (paquet (i) 12 → 10) + 2 contrôles. |
| C-m9a | C | `RM:14` = principe 6 ; l.15 vide | confirmé | pointeurs corrigés (delta, nouvelles). |
| C-m9b | C | `bouba_sens/docs/adr/0019-multi-seed-q3-retract.md:3-6` (note de numérotation du dépôt : ADR-0019a / ADR-0019b) | nuancé | l'ambiguïté est réglée par la convention du dépôt : « ADR-0019b:184-192 », « ADR-0019b:409 », « ADR-0019a:15 ». |
| C-m9c | C, X item 22 | `nerve-wml/docs/results/2026-10-31-nh01-diagonal-ablation.md:26-33` (médianes par bras, pas les trois rapports) | nuancé | N-15 et E-2 : #147 cité comme source des trois nombres ; le fichier comme source des médianes (l.28-31). |
| C-m10 | C | `P100:protocol.md:88-89` (marge A sur `eng − nocomm`) | concordant | §4.1 : « si NWML-N1 reprenait la marge A (non enregistré) ». |
| C-§2a | C | inventaires : `dream-of-kiki.md:46` (DOK-CPU, « base de DOK-N3 »), `bouba_sens.md:50` (BS-SNR, précondition de BS-B3), `micro-kiki-baby-brain-methodo.md:57-58,61` (MK-23 + C l.45 ; MK-26 « constat toujours ouvert » ; NH-81 B l.323 + C l.46, constat MINEUR) | nuancé | 6 lignes ajoutées en « garder » (DOK-CPU, BS-SNR, MK-26, NH-81 B l.323, NH-81 C l.46, C l.45 C5 avec MK-23). PSK et MK-17 : réfuté (annexe). Critère écrit : une ligne « garder » est comptée si l'inventaire lui ajoute une note, un lien ou un constat. |
| C-§2b | C | `inventory/kiki-flow-research.md:24` (M5 « garder « rapport technique » ») | confirmé | divergence signalée ; M5 reste « fermer » (négatif selon règle gelée, successeur KFR-N4). |
| C-§2c | C | — (identité arithmétique) | confirmé | « somme 0 » n'est plus présenté comme vérification. |
| C-v20 / X-m E-2 | C, X | ReScience/submissions#147 (lu par C et X via `gh api`) ; `cat:50` | confirmé (nuancé sur le mot) | E-2 = « incomplet » (vocabulaire et convention 3,90 absents), pas « contredit ». |
| C-v32 | C | `codex/zenodo-23619954.json`, `codex/zenodo-23636477.json` (API Zenodo, écrits 19:48 par la passe astra interrompue) : versions paper-v0.12/v0.13-draft, aucune mention « superseded » | nuancé | C-7 : l'état « sans mention » est recoupé par une seconde lecture de l'API. |
| X-m1 | X | = C-M9 | confirmé | S2 / S2b. |
| X-m2 | X | `cat:93` (« 141 seeds 35B in-flight 06-18 », « aucun résultat committé », tags `e1-35b-cycle3-v1/v2`) ; `git tag` du clone : les deux tags existent | confirmé | DOK-E1 : « aucun résultat committé » (pas « jamais lancé »). |
| X-m3 | X | `RM:160` (« Q3 (22 fév–7 mars) … équivalence TOST seulement si marges justifiées ») | confirmé | N-5, BS-B2, R8 : « jalon Q3 de la roadmap (22 février-7 mars) ». |
| X-m4 | X | `rescience-nh01/docs/prereg/arm-reproduction/amendment-2026-11-04.md:10-13,82-89` (concordant C v19) | nuancé | B22 : « portée bornée » (résultat inter-ISA), pas « aggravé ». |
| X-m5 | X | `R0111:104` (M18 : baseline mots-clés = nom du domaine, n = 14 423) ; `ERRATA.md:186-188` (« The ablation ratio "2.2×" … is unaffected ») | confirmé | MK-02 : M18 en preuve principale, ERRATA cité comme position du dépôt. |
| X-m6 | X | `kiki-flow-research/docs/prereg/nh20/reading-note.md:353-422` (concordant) | confirmé | NH-20 : le bras Strang exact est une **calibration**, pas un nul. |
| X-m7 | X | règle `catalogue-v3-delta-v1:11-12` ; `inventory/bouba_sens.md:61-62` | nuancé | BS-OQ1, B1, HB1, LOCK → reformuler (C-m1) ; BS-v08/v09 → reformuler (préconditions 15-17 héritées = préconditions nouvelles) ; « héritage » de la règle « garder » restreint à un lien de filiation sans condition nouvelle. |
| X-m8 | X | `catalogue-v3-delta-v1:111` | confirmé | « 5 garder + 2 reporter » ; liste des divergences inventaire → delta complétée (M5, H14-B, DOK-E1, MK-01, NH-58, BS-OQ1…v09). |
| X-m9 | X | arXiv:2603.09384 (Marinari, Rossi, Zamponi, résolu ; `veille/seen-arxiv.txt:544`) | confirmé | VEI-2 : antériorité citée ; nul « Hebb non borné » remplacé (comparateur = palimpseste borné optimal sans rêve). |
| X-m10 | X | `RM:12` ; `codex/binomial-check.json` ; recalcul `python3 -I` (test des signes unilatéral α = 0,05, q = π + (1 − π)/2) | confirmé | Q3 (b) : 0,95 par backend ⇒ k = 28 (π = 0,6), 18 (π = 0,7), 42 (π = 0,5). |
| X-m11 | X | `dotgithub/docs/research/2026-10-30-etat-des-lieux/synthese/priorites-hypotheses.md:144` (NH-91…101 numérotés le 30/10) ; `cat:24` (renumérotation du 01/11 21:50) | confirmé (concordant) | N-9 : la liste du 30/10 précède la renumérotation. |
| X-m12 | X | `kiki-flow-research/results/m5_secondary_2026_10_30/ANALYSIS.md:31,33` (4 échecs « precision floor » en γ ≤ 30 ; 11 en γ ≥ 50) ; `inventory/kiki-flow-research.md:91` | confirmé | KFR-N4 : « 8 configurations = 4 de la strate γ ≤ 30 + 4 tirées de γ ≥ 50 ». |
| X-m13 | X | delta v1 l.120 | confirmé | « 3 lignes, 2 hypothèses distinctes (E1b en C et A, M5) ». |
| X-m14 | X | `veille/or-agent_memory_consolidation.json` (notice QkJkp8E5EA : « CoRR 2026 », bibtex `abs-2605-27762`) | confirmé | C-3 tranché : un seul travail ; la « révision du 26/10 » n'est plus une question ouverte. |
| X-m15 | X | MK-N1, BB-N1, BOUBA-N4, BOUBA-N1 (= C-m6 à C-m8, C-M4) | confirmé | voir lignes C. |

## Décompte par relecture et par sévérité

| relecture | sévérité | constats | confirmés | nuancés | réfutés |
|---|---|---|---|---|---|
| C | BLOQUANT | 1 | 1 | 0 | 0 |
| C | MAJEUR | 9 | 7 (M-2 à M-7, M-9) | 2 (M-1 : parties a, b, c, e confirmées, d nuancée ; M-8) | 0 |
| C | MINEUR (numérotés) | 10 | 9 (m1 à m8, m10) | 1 (m9 : pointeurs b et c) | 0 |
| C | réserves du §2 et vérifications reprises | 5 (§2a, §2b, §2c, v20, v32) | 2 (§2b, §2c) | 3 (§2a, v20, v32) | 0 (2 sous-points de §2a réfutés, voir annexe) |
| X | BLOQUANT | 1 | 1 | 0 | 0 |
| X | MAJEUR | 9 | 7 | 2 (X-M1, X-M4 pour KFR-H2) | 0 |
| X | MINEUR | 15 | 13 | 2 (X-m4, X-m7) | 0 |

Lecture du tableau : aucune des deux relectures n'a de constat entièrement réfuté. Deux sous-points de la réserve C-§2a (PSK, MK-17) sont réfutés ; trois points de méthode opposent les relectures (ci-dessous) et sont tranchés.

## Contradictions entre les deux relectures, et arbitrage

1. **DOK-E1.** C : sortir de « fermer » (abandon = décision, pas preuve). X : nuancé sur le libellé seulement (« aucun résultat committé »). Arbitrage : règle du brief (« fermée … par une preuve … pas par lassitude ») ; un abandon décidé après exposition n'est pas une preuve → colonne « abandonné » hors fermetures, libellé de X.
2. **KFR-H2.** C (vérification 15) : fermeture confirmée. X (X-M4) : un successeur teste encore, « transférée ». Arbitrage : l'erratum §13 est une preuve ; KFR-N5 est un autre énoncé → **fermer**, successeur écrit.
3. **Table des changements de classe.** C : écrire la préséance ou ajouter trois lignes. X : 17 lignes sous la règle littérale (16 si MK-01 reformulé). Arbitrage : règle de préséance écrite (P1-P4) ; 19 lignes ; le compte sans P3 (23) est donné aussi, pour que le PI choisisse.
4. **Q6 option « sans réserve ».** C : 16 (MK-01 retiré). X : 15 (MK-01 et NH-58 retirés). Arbitrage : MK-01 et NH-58 retirés **et** réserve Q3/N12 levée (X-M5, vérifié) : 14 errata + 3 négatifs = **17**.
5. **BS-Q3 / BS-N12.** C : « sous réserve » n'est pas une preuve. X : ADR-0024:36 donne une seconde base. Arbitrage : les deux ont raison ; la fermeture repose désormais sur la rétractation et le négatif préenregistrés + ADR-0024, sans dépendre du monde des graines.
6. **E-2.** C : chiffres justes, vocabulaire faux, pointeur faux. X : juste en arithmétique, incomplet. Arbitrage : « incomplet » ; #147 pointé comme source des nombres.

## Annexe — Désaccords (constats réfutés, avec preuve)

| constat | relecture | preuve contraire |
|---|---|---|
| PSK (C l.38) serait une ligne « garder » touchée, contredisant « non touchées : l.38 » (`critique:37`) | C | `inventory/nerve-wml.md:32` : « **garder** \| — \| rien de nouveau au 03-06/11 dans les sources lues \| — » : aucune note, aucun lien ; la ligne n'est pas touchée au sens du delta. |
| MK-17 serait une ligne « garder » avec note non comptée (`critique:37`) | C | `inventory/micro-kiki-baby-brain-methodo.md:56` : « **garder** (à valider par le PI, comme noté) \| — » : l'inventaire renvoie à la note déjà présente en v2 (`cat:224`), sans fait nouveau. |
| « deux ADR-0019 rendent la citation ambiguë » (`critique:73`, en partie) | C | `bouba_sens/docs/adr/0019-multi-seed-q3-retract.md:3-6` : le dépôt nomme les deux fichiers ADR-0019a et ADR-0019b (issue #21) ; l'ambiguïté vient de la citation, pas du dépôt. Correction appliquée avec les suffixes. |
| (méthode) 16 lignes changent de classe (X-M1) | X | non réfuté sur l'arithmétique (vérifiée : 16 avec NWML-PRH, BB-01, BS-v07 et MK-01 en amendé) ; divergence de règle : P3 exclut BB-01 et BS-v07 ; C-m1 / X-m7 ajoutent BS-OQ1, B1, HB1, LOCK ; MK-01 prend la classe écrite par le dépôt (non concluant) → 19. |

## Comptes finaux (après intégration)

- Lignes v2 touchées : **103** (97 + 6 lignes « garder » ajoutées) : **fermer 19**, **reformuler 58**, **garder 25**, **abandonné 1**, **rouvrir 0**.
- Changements de proposition par rapport à la v1 : fermer → reformuler 4 lignes (MK-01, NH-58, DOK-H14 A l.97, H14 C l.33) ; fermer → abandonné 1 (DOK-E1) ; garder → reformuler 6 (BS-OQ1, B1, HB1, LOCK, v08, v09) ; nouvelles « garder » +6. Bilan : fermer 24 − 5 = 19 ; reformuler 48 + 4 + 6 = 58 ; garder 25 − 6 + 6 = 25.
- Fermetures par motif : clos par erratum 14, non-test 2, négatif selon préreg 3 lignes (2 hypothèses) ; 12 déjà rétractées ou réfutées en v2 ; 7 nouvelles.
- Changements de classe (table A) : 19 lignes, confirmé −6, réfuté −4, nul −1, en attente −2, non testé 0, non concluant +8, amendé +5 (sans la règle P3 : 23 lignes, −6 / −4 / −1 / −5 / 0 / +7 / +9).
- Constats §2 : BLOQUANT 0 nouveau ; **MAJEUR 16** (N-1 à N-16), dont 2 prolongent un constat du 01/11 (N-6, N-14) ; MINEUR 18.
- Errata du catalogue v2 : 3 errata, 1 incomplet, 3 omissions de périmètre, 1 absence, 1 conséquence de règle.
- Nouvelles hypothèses : 31 propositions → 26 après fusion → **24 hypothèses** (paquet (i) 10, (ii) 11, (iii) 3) + **2 contrôles** (BOUBA-N4, BB-N1).
- Q6 : (a) aucune ; (b) les **17** appuyées sans réserve (14 errata + 3 négatifs) ; (c) les 19.
