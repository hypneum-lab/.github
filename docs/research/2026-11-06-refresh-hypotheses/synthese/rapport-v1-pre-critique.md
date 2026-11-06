# Hypneum Lab — refresh du catalogue des hypothèses, 6 novembre 2026 (soir)

Demande du PI (18:53 CET) : refaire l'analyse avec la veille, les relectures et les hypothèses, et dire ce qu'il faut fermer, reformuler et poser. Baseline : catalogue v2 (`.github` main `c8967a2`, `docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`, abrégé `cat`), rapport du 01/11 (`…/2026-11-01-analyse-profonde/README.md`, abrégé `R0111`), ROADMAP v2.1 (`docs/ROADMAP.md`, abrégé `RM`). Annexes : `catalogue-v3-delta.md`, `nouvelles-hypotheses.md`, `inventory/*`, `veille/*`. Abréviations des sources : `iNW`, `iDOK`, `iBS`, `iKFR`, `iMKBB` (inventaires), `iVEI` (veille delta), `iCS` (état du calcul). **Rien ici n'a passé le verrou de lecture ; aucune phrase n'est confirmatoire.**

## §0 Résumé exécutif

- 97 lignes du catalogue v2 sont touchées : **24 à fermer**, **48 à reformuler**, 25 à garder avec une note, **0 à rouvrir** (`catalogue-v3-delta.md`, comptes).
- Les 24 fermetures se répartissent ainsi : 16 par erratum, 3 non-tests, 3 négatifs selon préreg (E1b tel que codé, M5), 2 lectures exploratoires faites selon la préreg (H14). Aucune n'est fermée « comme artefact » ni « par lassitude ».
- **26 nouvelles hypothèses** après fusion de 31 propositions : 12 posables ce trimestre sans calcul lourd, 11 avec calcul (S6 au plus tôt ou après M3), 3 qui sont des sections de la note méthodo.
- Constat 1 : les canaux physio de Studyforrest étaient mal lus (phase 1 et phase 2). Proposition : fermer huit lignes bouba par erratum (dont deux sous réserve) et requalifier B-2 en « non mesurable » sur ce pont.
- Constat 2 : la H1 enregistrée de N10-D est un contrôle de chaîne dont le résultat est attendu. Fait : la seule question ouverte (usage causal du canal appris, NWML-N1) n'a dans le protocole ni nul propre, ni critère, ni calcul de puissance.
- Constat 3 : E1-small ne contient ni phase REM-like ni manipulation d'ordre. Inférence : l'étiquette v2 « réplication de l'ordre des phases » n'a pas de support. C'est le premier de neuf errata du catalogue v2 (§3), avec les « deux bases 1,90 / 3,05 » contredites par la déclaration envoyée à l'éditeur.
- Aucun constat BLOQUANT nouveau n'est établi par les inventaires ; 15 MAJEUR nouveaux, dont 2 prolongent un constat du 01/11.
- Décisions à prendre maintenant : 6 QCM (§7), dont la collision NH-91…NH-101 et le statut primaire de NWML-N1.

## §1 État par dépôt

**nerve-wml** (`master` `a1d1192`). Fait : N10-C run 2 est clos à la graine 0, sans verdict (`CL:43-45`) ; la tâche Procgen ne requiert pas le message (`CL:53`). Fait : le contradicteur aveugle N10-D ne réfute aucun fait et relève un BLOQUANT commun (porte `sym`), corrigé dans la PR #100 (`VER:7-18` ; `iNW` l.108). Fait : la nécessité du message est fixée par construction (contraste oracle 0,75 / 0) et la question restante est l'usage causal du canal par le bras `learned` (`P100:protocol.md:52-62` ; tour 1, `V1:305-324`). Fait : P1bis et P8c tournent sur KXKM sous une exception de verrou non signée (ADR-0003, PR #118 ouverte ; `iCS` l.6). Fait : l'embedding LIF du Test 6 est affine, sans pas impulsionnel (`MK:69-76`). Propositions : 1 fermeture (NWML-N10C), 9 reformulations, 3 nouvelles (NWML-N1 à N3).

**dream-of-kiki** (`main` `365bf14`). Fait : l'analyse E1-small selon la préreg est fusionnée (PR #91). H14-A : D̄ = +0,0432 [+0,0383 ; +0,0481], 131/141 graines positives ; H14-B : D̄ ≈ 0, [−0,0018 ; +0,0018], discordance 0,016 ; H14-C : +0,0187 [+0,0129 ; +0,0245], non-infériorité à δ = 0,01 ; tout est exploratoire (`dok:docs/results/2026-11-06-e1-small-analysis.md:164-235`). Fait : la signature `dream > sft > shuffle ≈ noise` n'est pas observée (`:244-255`). Fait : les contrôles de la PR #92 tournent sur KXKM, fin attendue le 07-08/11 (`iCS` l.5). Propositions : 3 fermetures (H14 sur deux lignes, DOK-E1), 5 reformulations (DR-2, DR-4, `recombine`, NH-13 fusionnée dans NH-91), 4 nouvelles (DOK-N1 à N4, toutes après M3 par défaut).

**bouba_sens** (`main` `b9443bb`). Fait : en phase 2, le canal « ecg » est le déclencheur et le canal « resp » le pouls ; la respiration n'est jamais lue (issue #72) ; en phase 1, 4 colonnes à 100 Hz étaient lues comme 3 à 500 Hz (issue #74, corrigée par #75) (`iBS` l.11-12). Fait : B-2 recalculé vaut ≈ 0, mais la sonde contiguë ne contient qu'une classe sur 4 graines sur 5, puis la sonde stratifiée échoue la porte d'apprentissage sur 10/10 graines (`bouba:docs/paper/main.tex:1062-1076,1110-1124`). Fait : le nul réseau B-3 (#66) n'a pas bougé depuis le 01/11 malgré une relecture BLOQUANT (`iBS` l.16). Propositions : 8 fermetures par erratum, 9 reformulations (B-2, B-3, NH-66, v0.7), 4 nouvelles (BOUBA-N1 à N4).

**kiki-flow-research** (`main` `39b6419`). Fait : M5 échoue sous sa règle gelée (50/60) ; la secondaire certifie 10/38 avec budget accru et ne change pas le verdict (`kfr:docs/results/2026-10-30-m5-certify-verdict.md:9-23` ; `ANALYSIS.md:26-36`). Fait : M12 n'est pas un test direct de NH-20 ; son « non identifiable » est le nul déclaré (`kfr:docs/prereg/2026-10-30-jko-splitting-lie-strang.md:36-40`). Fait : la note de lecture NH-20 v0.2 est fusionnée, verrou non déclaré (`iKFR` l.130). Fait : la bannière « superseded » est en place dans le dépôt, pas sur Zenodo (`iKFR` l.124, l.131). Propositions : 10 fermetures, 10 reformulations (dont NH-20), 5 nouvelles (KFR-N1 à N5).

**micro-kiki, baby-brain, note méthodo, rescience-nh01.** Fait : micro-kiki n'a reçu que des corrections de bibliographie ; « +7 pp », la table des latences et CAMP/KnowBias restent dans le papier (`iMKBB` l.20-24, l.179). Fait : l'erratum E-2026-10-25-03 retire 70,7 / 89,5 et garde 46,4 / 69,6 (`mk:docs/ERRATA.md:144-194`). Fait : baby-brain #291 ajoute trois limites au brouillon (E0 non neutre, cibles à une image, E0 non apparié) sans toucher le code (`iMKBB` l.30-35). Fait : la déclaration ReScience #147 du 04/11 nomme 3,90 et 1,90 comme les deux conventions ; la reproduction aarch64 est INCONCLUSIVE_STRICT sous le protocole gelé (`iMKBB` l.37-40). Propositions : 2 fermetures, 14 reformulations, 7 nouvelles (MK-N1, BB-N1, BB-N2, T-N1 à T-N4). Trois hypothèses issues de la veille (VEI-1, VEI-2, VEI-4) complètent les 26.

## §2 Constats nouveaux depuis le 02/11

Dédoublonnage contre `R0111` §2 (B1-B23, M1-M40) : un constat déjà listé porte « déjà B-x / M-x ». La sévérité est celle de l'inventaire, sauf mention « (sévérité : synthèse) ».

### BLOQUANT

Aucun constat BLOQUANT nouveau n'est établi par les six entrées. Les BLOQUANT du 01/11 encore ouverts sont listés en fin de section.

### MAJEUR

| # | Dépôt | Constat (fait, puis inférence) | Preuve | Établi par |
|---|---|---|---|---|
| N-1 | bouba | Fait : phase 2, `extract_force` lit un en-tête sur un TSV sans en-tête ; « ecg » = déclencheur, « resp » = pouls, 960/1 800 trames non nulles. Fait : phase 1, `_build_force` lisait 4 colonnes à 100 Hz comme 3 à 500 Hz, pouls au-dessus de Nyquist (corrigé, `force.pt` `890b90ae…` → `d96ad636…`). Inférence : tout le pont 4,5 modalités et la chaîne B-1 reposent sur un canal mal lu, sans recalcul possible (tenseurs d'avril perdus). (sévérité : synthèse) | issues #72, #74 ; `bouba:docs/paper/main.tex:525-540,572-584,1001-1015` | iBS l.11-12, l.25-27 |
| N-2 | bouba | Fait : §(e) et ADR-0019 écrivent que B-2 est nul sur CC-film et que ce pont donne « an informative measurement » ; aucune porte d'apprentissage n'y a été mesurée et le script tourne en argmax-bridge. Inférence : sur CC-film aussi, le contrôle ne peut pas échouer. | `main.tex:1185-1192` ; ADR-0019:184-192 ; `scripts/spikes/e1_b2_dimensional_mine.py:62-72` ; ADR-0024:45-48 | iBS l.121 |
| N-3 | bouba | Fait : #80 propose des lots stratifiés sans citer ADR-0024. Inférence : la piste peut échouer pour la raison d'ADR-0024 ; il faut le bras straight-through (BOUBA-N3). | issue #80 | iBS l.122 |
| N-4 | bouba | Fait : la liste v0.7.1 (14 points) et la note de lecture ne mentionnent ni la composition de la sonde ni celle des lots ; `ActionSenseWorld` sert des lots contigus. Inférence : la leçon de #77 n'est pas propagée à la campagne qui attend le verrou. | `brainstorm-2026-11-01.md:175-198` ; `world/actionsense.py:5-6` ; `amendment-v0.7-actionsense.md:346-349` | iBS l.123 |
| N-5 | bouba | Fait : la roadmap prévoit en Q3 2027 la publication de B-1/B-2 comme nuls TOST ; issue #24 ouverte. Inférence : ce serait une équivalence dans un régime qui n'apprend pas. | `RM:160` ; issue #24 | iBS l.124 |
| N-6 | bouba | Fait : #66 n'a qu'un commit, inchangé depuis le 01/11 09:31Z, malgré une relecture BLOQUANT. Inférence : le point 8 de v0.7.1 et l'option (b) du QCM Me6 dépendent d'un brouillon non révisé. Déjà M26 pour le contenu ; nouveau : la stagnation bloque le jalon. | PR #66 | iBS l.125 |
| N-7 | nerve | Fait : la H1 de N10-D porte sur `eng − nocomm`, contrôle au résultat attendu ; le dérangement n'est appliqué qu'à `eng` ; l'usage causal de `learned` n'a ni nul, ni critère, ni puissance. | `P100:protocol.md:88-89,105` ; `P100:nh96-null.md:20-24` ; `RN:227-238` | iNW l.100 |
| N-8 | nerve | Fait : Chauhan & Bera apparient déjà par graine appris et silence entraîné et trouvent l'appris indistinguable du silence. Inférence : « aucune antériorité » ne vaut que pour la combinaison PPO + `nocomm` entraîné + nul apparié + intervention sur `learned`. | `RN:79,139-141,202-209` ; arXiv:2609.34373 | iNW l.101 |
| N-9 | nerve, .github | Fait : NH-91 à NH-101 sont attribués deux fois (catalogue v2 et priorités du 30/10) ; NH-96, H1 de N10-D, n'a aucune ligne au catalogue. | `priorites-hypotheses.md:146-210` ; `cat:24,333` ; `P100:protocol.md:20` | iNW l.102 |
| N-10 | nerve | Fait : l'embedding LIF du Test 6 est `lif.input_proj(lif_encoder(x))`, deux `Linear`, aucun pas impulsionnel ; Paper 1 présente le résultat comme « ANN vs spiking LIF with surrogate-gradient ». Inférence : NWML-PRH, NH-35 et NH-45 ont une portée plus étroite qu'écrite. Distinct de B4 (magnitude du nul). | `MK:69-76` ; `scripts/platonic_rh_alignment.py:84,112` ; `papers/paper1/main.tex:104` | iNW l.103 |
| N-11 | nerve, veille | Fait : arXiv:2611.01666 (effets de substitution des ablations d'action, test de randomisation conditionnelle) n'est pas dans le tour 1 N10-D. Inférence : le critère par ablation du message de NWML-N1 est concerné. (sévérité : synthèse) | `iVEI` l.90 ; `veille/n10d-tour1.md` (absent) | iVEI |
| N-12 | dok | Fait : E1-small applique ses opérations dans un ordre fixe, RECOMBINE est un no-op, aucun profil ne permute l'ordre. Inférence : l'« apport = réplication de l'ordre des phases » du catalogue v2 et de la spec n'a pas de support (erratum §3, E-1). | `dok:scripts/e1_harness.py:214-223` ; `dok:scripts/e1_profiles.py:52-57,135-141` ; `cat:33,97` | iDOK l.115 |
| N-13 | dok | Fait : la PR #92 est un run GPU de 28-49 h lancé le 06/11 au titre de l'exception « addendum de contrôle sur une campagne en cours », alors qu'E1-small était finie le 01/11. Inférence de l'inventaire : la décision devrait être enregistrée comme dérogation datée (comme ADR-0003). La roadmap v2.1 la classe dans l'exception (`RM:57`) ; voir §4, C-6. | `pr92:docs/osf-addendum-e1-small-controls-2026-11-06.md:3-4,232-284` ; `RM:10-11,57` | iDOK l.116 |
| N-14 | kfr | Fait : l'ERRATUM n'enregistre ni l'échec de M5 ni sa conséquence pour le §16, qui porte encore « PROPOSED » ; la bannière dit que le recalcul « has not been run », pas qu'il est en partie bloqué à γ ≥ 10. Déjà M14 pour « PROPOSED » ; nouveau : le recalcul décidé est en partie infaisable avec le solveur actuel. | `kfr:ERRATUM.md:700-702,746,892-894` ; `kfr:paper/main.tex:33-37` | iKFR l.125 |
| N-15 | rn, .github | Fait : le catalogue (`cat:50,243`) et la roadmap (`RM:70`) parlent de « deux bases 1,90 et 3,05 » ; la déclaration du 04/11 à l'éditeur nomme 3,90 (J_ii = 0 des deux côtés) et 1,90 (diagonale des deux côtés), et dit de 3,05 qu'il ne correspond à aucun protocole publié. (erratum §3, E-2) | ReScience/submissions#147, commentaire du 04/11 §2 ; `nerve-wml:docs/results/2026-10-31-nh01-diagonal-ablation.md:31-33` | iMKBB l.176 |

### MINEUR

| # | Dépôt | Constat | Preuve | Établi par |
|---|---|---|---|---|
| n-1 | nerve | Puissance globale N10-D 0,808 à π = 0,75 et 0,599 à π = 0,70, sous la cible 0,90 ; π non sourcé. | `P100:protocol.md:185-195,486-489` | iNW l.104 |
| n-2 | nerve | ADR-0003 non signé (PR #118 ouverte) ; KPI « tags sans verrou » = 0 dans la roadmap, 2 dans l'ADR. | `ADR3:100-103,197` ; `RM:198` | iNW l.105 |
| n-3 | nerve | Closure N10-C : la table des machines du plan du 01/11 reste ouverte. | `CL:103` | iNW l.106 |
| n-4 | nerve | N10-C-bis à k = 3 : le test des signes ne peut pas rejeter (p minimale 1/8) ; A+ est une porte de décision, pas un test. | `BIS:25-27,34-36,153-166` | iNW l.107 |
| n-5 | dok | La roadmap date la fin d'E1-small au 02/11 puis au 01/11 20:20 dans la même cellule. | `RM:42` | iDOK l.118 |
| n-6 | dok | Le rapport DOWNSCALE / rejeu annoncé ≈ 35 vaut ≈ 25,6 ; amendement et déclaration non annotés. | amendement :151-155 ; `ana:277-278` | iDOK l.119 |
| n-7 | dok | Paper 1 ne cite toujours ni « When to Sleep », ni SIESTA, ni Kubo et al., ni la Control Map, ni Agliari 2012. Prolonge M38. | `dok:docs/papers/paper1/full-draft.md:264,1083` | iDOK l.120 |
| n-8 | dok | La signature de défendabilité échoue parce que `p_ctrl_sft` n'apprend pas (Δ −0,0004) ; ce maillon ne contrôle rien sur ce substrat. | `ana:246-255` | iDOK l.121 |
| n-9 | dok | #92 ne peut que restreindre H14-B et ne sépare pas format et contenu dans Δ (partie par profil non lancée). | `pr92:…addendum…:108-122,149-152` | iDOK l.122 |
| n-10 | bouba | Deux PR brouillons concurrentes corrigent #72 (#82 repli + avertissement, #83 `ValueError`). | PR #82, #83 | iBS l.126 |
| n-11 | bouba | L'erratum 11 dit encore « not been recomputed » alors que §(d) l'est. | `README.md:329` | iBS l.127 |
| n-12 | bouba | ADR-0019:409 et #80 citent 0,365 (rejeu du nul) pour l'exactitude ; le run principal donne 0,250 ; verdict inchangé. | `strat_b2_oldcache.log:5` ; `strat_null_oldcache.log:5` | iBS l.128 |
| n-13 | bouba | Note v0.7.1 et brainstorm disent « 300-304 non utilisées », contre l'erratum #67. | `reading-note.md:300-301` ; `erratum-2026-10-31-v0.7-seeds.md:1,23` | iBS l.129 |
| n-14 | bouba | « K1/K3 » n'est défini dans aucun fichier de bouba_sens (vit seulement dans `.github`). | grep vide ; `RM:24,107,142` | iBS l.130 |
| n-15 | kfr | Bannière « γ ≥ 20 », erratum §14 « γ ≥ 10 ». | `kfr:README.md:19-20` ; `kfr:ERRATUM.md:631` | iKFR l.126 |
| n-16 | kfr | 39e configuration de la secondaire M5 non enregistrée (descriptive). | `ANALYSIS.md:34-36` | iKFR l.128 |
| n-17 | kfr | Issues #29, #30, #31 ouvertes malgré un statut tranché ou reporté. | GitHub | iKFR l.129 |
| n-18 | mk | Issue #17 ouverte alors que sa branche « corriger le README » est faite. | `gh issue list` du 06/11 | iMKBB l.182 |

Rappels sans constat nouveau : n'ont pas changé depuis le 01/11 ou le 02/11 — λ̂ = 67,79 sans réserve (déjà B7, en partie corrigé ; `iKFR` l.127), NH-81 « supported » dans le dépôt (déjà M21 ; `iMKBB` l.181), cs.LG primaire (déjà M37 ; `iMKBB` l.180), `mk/README.md:83` (relevé du 02/11 ; `iMKBB` l.183), [P] lu à la première occurrence (déjà M4 ; `iDOK` l.117).

OK relevés : contradicteur N10-D vérifié en source (`iNW` l.108) ; closure N10-C non aveugle déclarée, fondements datés (`iNW` l.109) ; chronologie H14-B déclaration 13:17 avant analyse 13:46 (`iDOK` l.123) ; garde-fou `choice_kl` bit pour bit (`iDOK` l.124) ; correctifs bouba datés avant run et classés exploratoires (`iBS` l.131-132) ; note NH-20 v0.2, bannière, M12 recalculé par Codex (`iKFR` l.130-132) ; Aeon d'Arslan cité, Fachechi et Agliari cités (`iMKBB` l.184-185).

### Constats du 01/11 toujours ouverts au 06/11

| Constat | État au 06/11 | Preuve |
|---|---|---|
| B8 (E1b « confirms / recovers ») | non corrigé ; la bannière ne nomme pas E1b | `kfr:paper/main.tex:880-891` (`iKFR` l.123) |
| B10 (Zenodo « superseded ») | côté dépôt fait (PR #64) ; notices Zenodo 23636477 et 23619954 sans mention ; action PI de M0 (8/11) | `iKFR` l.124 |
| B14 + M16 (CAMP inactif, « +7 pp », « 4-6 s ») | inchangés dans le papier ; README « mpnet + MLP » | `mk:paper/micro-kiki.tex:50,116-117,297,303,329,377,495` (`iMKBB` l.179) |
| B18 (porte placebo sous AdamW) | le brouillon dit toujours « the mechanism Claim A tests » | `bb:docs/paper/2026-05-22-ontogenetic-wml-draft.md:406-408` (`iMKBB` l.178) |
| B22 (« bit-exact ») | **aggravé** : la reproduction aarch64 préenregistrée est INCONCLUSIVE_STRICT (écart 3,759e-12 > 1e-12) | `pm/paper/manuscript.md:10,51` ; `amendment-2026-11-04.md:82-89` (`iMKBB` l.177) |

## §3 Errata du catalogue v2 lui-même

| # | Ligne v2 | Ce que dit le catalogue | Ce que dit la source | Correction proposée | Établi par |
|---|---|---|---|---|---|
| E-1 | C l.33, A l.97 (et spec `2026-11-01-verrou-lecture-plan-trimestre-design.md:90`) | H14 : « réplication de l'ordre des phases » | ordre fixe, RECOMBINE no-op, aucun profil ne permute (`dok:scripts/e1_harness.py:214-223`) ; l'étiquette vient du brainstorm (`brainstorm-dream-of-kiki.md:12`) | retirer l'étiquette ; question reportée à DOK-N3 | iDOK l.115 |
| E-2 | C l.50, B l.243 (et `RM:70,78,134`) | « 1,90 (base de Hebb avec diagonale), 3,05 (base standard) » | #147 du 04/11 : 3,90 (J_ii = 0 des deux côtés, convention de l'article) et 1,90 (diagonale des deux côtés) ; 3,05 = rapport mixte | reprendre le vocabulaire de #147 dans le catalogue, la roadmap, la v2 et la note | iMKBB l.176 |
| E-3 | C l.32 | `recombine` = « réplication inter-substrats » | dream-of-kiki n'a jamais produit l'effet (no-op sur E1, canal vide sur G4) | « non-test » | iDOK l.38 |
| E-4 | B l.245 (NH-03 du 24/10) | la colonne de requalification décrit « quand dormir » et cite 3gCeBuNNyT « [non résolu] » | la ligne est « DE discret contre consolidation continue (TTT) » (`cat:245`, colonne énoncé) ; « quand dormir » est NH-91 (`cat:24,333`) ; 3gCeBuNNyT est résolu depuis le 02/11 et l'addendum ne corrige pas l.245 (`cat:341-342`) | réécrire la requalification de l.245 pour la seule hypothèse TTT (report après M3, spec §5.3) et retirer le « [non résolu] » | lecture de `cat` par la synthèse |
| E-5 | B l.300 (NH-58) | « inchangé » | ERRATUM §11, validé par le PI le 25/10, avant le catalogue : écart insensible à ε (`kfr:ERRATUM.md:437-452`) | « clos par erratum » | iKFR l.32 |
| E-6 | B l.303 (NH-61) | « inchangé » | NH-59, 60 et 63, qui partagent les balayages et le pas, sont reportés après M3 (`cat:301-302,305`) | « reporté après M3 » | iKFR l.35 |
| E-7 | A l.183 (BS-B2) | « nul (confirmé/renforcé) », inchangé | ADR-0024:45-48 : « a null of an untrained regime » | « non-test / non mesurable ». La date d'ADR-0024 n'a pas été vérifiée par la synthèse : si elle précède le 01/11, l'étiquette v2 était déjà contredite | iBS l.34, l.121 |
| E-8 | table B (absence) | NH-96 n'existe pas au catalogue | NH-96 est la H1 du protocole N10-D (`P100:protocol.md:20`) | inscrire après la règle de renumérotation (§7, Q1) | iNW l.102 |
| E-9 | règle `cat:18` | « clos par erratum » ne change aucune des 9 colonnes | conséquence : BS-SF45 et KFR-H28 restent comptés « confirmé », KFR-H2 « amendé » | décision PI (§7, Q2) | synthèse (`catalogue-v3-delta.md`) |

## §4 Analyses et suppositions

### 4.1 Puissance de N10-D en fonction de π

Faits. Le protocole donne une puissance globale de 0,808 à π = 0,75 et 0,599 à π = 0,70 pour k = 20 (`P100:protocol.md:185-195,486-489` ; `iNW` l.104). L'inventaire calcule, pour le seul test des signes de NWML-N1 par backend (k = 20, m = 15, q = π + (1 − π)/2) : 0,62 à π = 0,5, 0,93 à π = 0,7, 0,99 à π = 0,8 ; et k = 33, 23, 16 pour 0,90 à π = 0,5, 0,6, 0,7 (`iNW` l.62).
Inférence. Les deux séries ne se contredisent pas : la première porte sur la H1 enregistrée (IC apparié, marge de magnitude, deux backends), la seconde sur un test des signes d'un seul backend. Sous indépendance des backends, la conjonction des deux tests des signes à π = 0,7 vaudrait ≈ 0,93² ≈ 0,86 [arithmétique de la synthèse].
Fait. π n'est donné par aucune source : de 0 à 1 dans Eccles 2019 (Table 1), 25/48 dans un autre dessin (`A4P:29` ; arXiv:1912.05676, arXiv:1905.12561). Fait (calcul de `iNW` l.76, refait par la synthèse) : un code à un bit (M = 2 classes) donne un succès attendu de 0,481 < 0,55, donc ne passe jamais la marge A de N10-D.

### 4.2 B-3 : seuil 0,02 et nul apparié

Faits. La règle « max |off-diag| > 0,02 » se déclenche sous H0 avec probabilité 1,000 pour n ≤ 1 024 (ADR-0026:350-355) et sur 19 des 20 lignes observées (milestone Me6 :75-79). Le nul apparié par item est calibré : médianes 0,0164 / 0,0157 à n = 4 096 contre 0,0176 iid (milestone :73-74). Sur le gaussien à n = 4 096, l'observé vaut 0,0585 contre 0,0164 (p = 5·10⁻⁵), mais sans direction partagée entre trios (S = 0,0183, p = 0,28 ; S = 0,0126, p = 0,42 ; amendement diagnostic :215-222) (`iBS` l.42, l.51).
Inférence. L'excès est une asymétrie propre à chaque réseau lésé ; un nul dont l'unité est le réseau est nécessaire, et il n'existe pas (#66 non révisée). Le B-3 de BS-SF45, 0,1016 = 13/128, est sous les médianes nulles à n = 64 des autres mondes (0,1250, 0,1406) ; la comparaison est inférée, aucun nul n'a été calculé sur ce pont (`iBS` l.112).

### 4.3 B-2 non mesurable

Faits. Recalcul sur cache corrigé : Kraskov −0,0002, binning +0,0001, MINE 1-D +2,4·10⁻⁷, MINE complet −1,3·10⁻⁴ bit ; nul apparié p = 0,62 / 0,79 (`main.tex:1028-1060`). La sonde contiguë de 512 trames ne contient qu'une classe sur 4 graines sur 5 ; la sonde stratifiée donne une exactitude de 0,250 avant lésion sur 10/10 graines, sous la porte de 0,35 (`main.tex:1062-1076,1110-1124`).
Inférence. B-2 = 0 était garanti par la sonde ; la question « la lésion efface-t-elle l'information multimodale » n'a pas été posée sur ce pont.

### 4.4 M5 et le recalcul du §16

Faits. M5 primaire : 50/60 certifiés dans la strate γ ≤ 30 (12, 12, 11, 10, 5 par γ), verdict `failed` ; secondaire : 10/38 avec budget ×5 et ×4, dont 4 dans la strate γ ≤ 30, 15 échecs « plancher de précision » sur 28 ; temps médian par configuration de 3 pas : 2 s (γ 0) et 4 s (γ 5), max 112 s (`iKFR` l.24, l.62). Le coût déclaré du recalcul complet est de 8 à 11 jours sur electron-server à 4 workers (`kfr:ERRATUM.md:889-892`). Le balayage compte 350 runs × 30 pas lents, dont 230 à γ ≤ 5 (`iKFR` l.62).
Inférence. 230 × 30 = 6 900 pas, à 0,7-1,3 s par pas, font 4 830-8 970 s, soit ≈ 1,3-2,5 h CPU [arithmétique de la synthèse] ; l'inventaire écrit ≈ 1,5-3 h. L'ordre de grandeur est le même ; une queue longue reste possible. Le recalcul à γ ≥ 10 est en partie infaisable tant que le plancher de précision n'est pas levé (KFR-N4, non testé).

### 4.5 E1-small : ce qui est mesuré

Faits : voir §1. Arithmétique de `iDOK` l.22 sur les contrastes secondaires appariés : `p_equ − p_min` = +0,0069 (confondu avec le réglage), `p_max − p_equ` = −0,0263 ; l'ordre descriptif `p_equ ≈ vanilla réglé > p_min > p_max` ne suit pas l'ordre DR-4. Encadrement ρ / ‖θ_r − θ₀‖ ≈ 25,6, contre ≈ 35 annoncé (`ana:270-293`).
Inférence. Rien de cela n'est un test d'ordre ; aucun test d'ordre n'est enregistré dans la préreg.

### 4.6 Suppositions transversales

- **S1 — Régimes qui n'apprennent pas.** Bouba (ADR-0024), `p_ctrl_sft` dans E1-small (`ana:246-255`), N10-C (tâche sans besoin de message). Inférence : une porte d'apprentissage mesurée avant lecture devrait être une précondition générale, comme le fait déjà N10-D (`eng`).
- **S2 — Contrôles qui ne peuvent pas échouer.** Sonde B-2 contiguë, H14-B (discordance 0,016), NH-96 (résultat attendu par construction), seuil B-3 (taux 1 sous H0).
- **S3 — Le substrat décrit n'est pas le substrat exécuté.** LIF affine (Test 6), RECOMBINE no-op (E1), CAMP/RBD neutralisés (micro-kiki), porte avant AdamW (baby-brain). T-N4 recense ces cas pour la note.

### 4.7 Contradictions entre entrées (exposées, non tranchées)

- **C-1 — NH-01.** `iMKBB` l.83 propose de reformuler (portée, vocabulaire #147) ; `iNW` l.41 et `iDOK` l.47 proposent de garder avec des renvois (P1bis/P8c, Kubo). Aucun fait ne s'oppose ; les deux derniers n'examinent pas la déclaration #147. Le delta retient « reformuler » en le signalant.
- **C-2 — Statut v2 mal relevé par `iNW`.** NH-28 est « reporté après M3 » au catalogue (`cat:270`), l'inventaire écrit « PILOTE, inchangé » (`iNW` l.33) ; NH-35 est « utile, sous verrou » (`cat:277`), l'inventaire écrit « PRÊT/PILOTE, inchangé » (`iNW` l.31). La proposition n'en dépend pas.
- **C-3 — PEAM.** `iVEI` l.32 présente OpenReview `QkJkp8E5EA` comme inédit, « Haut (à lire) ». `iMKBB` l.62 cite arXiv:2605.27762, même titre, comme voisin connu ; l'identifiant est dans la baseline de dédoublonnage (`veille/seen-arxiv.txt:672`) et dans le catalogue v2. Inférence : le dédoublonnage a manqué un même travail sous deux types d'identifiant ; la révision du 26/10 peut différer du texte arXiv, ce qui n'a pas été vérifié.
- **C-4 — VEI-8.** La veille conditionne VEI-8 à une sélection parmi configurations (`iVEI` l.137, l.170) ; `iMKBB` l.50 établit que « +7 pp » est un Δ de composite lexical sur n = 5. La condition paraît non remplie ; VEI-8 est rattachée à MK-N1.
- **C-5 — Coût du recalcul γ ≤ 5.** 1,5-3 h (`iKFR` l.62) contre 1,3-2,5 h (arithmétique de la synthèse, §4.4).
- **C-6 — Exception de la PR #92.** `iDOK` l.116 lit l'exception « addendum sur une campagne en cours » comme non applicable ; la roadmap v2.1 l'applique (`RM:57`). Le PI tranche (§7, Q4).
- **C-7 — Zenodo.** `iKFR` l.124 dit avoir interrogé l'API Zenodo (records 23636477 et 23619954) ; `iVEI` l.166 dit que l'API n'a pas renvoyé de JSON exploitable (autres records). Les deux constats portent sur des records différents ; l'état « superseded » des notices kiki-flow repose sur la seule lecture de `iKFR`.
- **C-8 — Libellés de la veille.** Le corps de `iVEI` renvoie à « V-1 … V-8 », la table à « VEI-1 … VEI-8 » ; « V-4 » y est motivé par la taille de la mémoire (`iVEI` l.33), variable absente de l'énoncé VEI-4 (`iVEI` l.133).

## §5 Littérature : ce que changent la veille du 25/10-06/11 et le tour 1 N10-D

Tout est lu au niveau du résumé ; aucune entrée ne ferme ni ne confirme une ligne. Identifiants résolus : `veille/resolve-veille-delta.tsv` (48/48), `inventory/resolve-nerve-wml.tsv`.

1. **arXiv:2609.34373** (Chauhan & Bera, tour 1 / note N10-D) — appris contre silence entraîné, tests appariés par graine, appris indistinguable du silence : restreint la nouveauté de NWML-N1 à la combinaison (N-8). Connu depuis le 24/10 ; l'effet sur la question de N10-D est nouveau.
2. **arXiv:2410.18806** (tour 1) — le jeu de Lewis se résout avec un ou deux symboles : fixe la borne basse côté tâche de NH-28 et motive NWML-N3.
3. **arXiv:2611.01666** (Xu, 01/11) — les ablations d'action créent de faux effets sous plans autocorrélés ; test de randomisation conditionnelle valide : contrôle de NWML-N1, NH-32, NH-79 ; absent du tour 1 (N-11).
4. **OpenReview `2T0Ja28jY5`** (ICLR 2027, manquée le 02/11) — la perte unimodale règle l'alignement inter-modal : va dans le sens de l'artefact mKNN par un mécanisme ; motive VEI-1.
5. **10.7554/elife.112891.1** (Pan … Sompolinsky, 04/11) — un adaptateur bas rang creux par épisode, sélectionné par porte compétitive : antériorité directe probable de NH-85 H9.
6. **arXiv:2611.05636** (Fang, 03/11) — mémoire en poids + routeur vers mémoire texte, moins de jetons à rappel égal : antériorité partielle de NH-85 H10, sans le facteur.
7. **arXiv:2611.00516** (Kurikawa, 31/10) — l'optimum intérieur appartient au bruit neuronal rapide, pas au bruit synaptique : motive la reformulation de NH-12.
8. **arXiv:2611.08258** (Lepre, 05/11) — horizon mémoire maximal à une borne synaptique intermédiaire : comparateur de P1bis/P8c (VEI-2) ; ne touche pas NH-01.
9. **arXiv:2611.04338** (Chen, 03/11) — taxonomie des réparations de préregistration, « non-impact vérifiable » : cadre et antériorité partielle de la note méthodo (T-N1 b).
10. **arXiv:2611.05577** (Modgil, 03/11) — préregs ML à petit budget, un JEPA ne bat pas le même réseau non entraîné : nul pour NH-77, exemple pour la note.

Sans effet : aucune antériorité de NH-20 ni de NH-58 dans la fenêtre (`iVEI` l.49, l.122).

## §6 Pistes d'utilité

### Négatifs publiables pour la note méthodo

| Négatif | Forme publiable | Source |
|---|---|---|
| M5 | le pas implicite certifié ne certifie pas toutes les configurations γ ≤ 30 (50/60), règle gelée avant calcul | `iKFR` l.115 |
| M12 Q1 | Lie et Strang ne remplacent pas le pas certifié sur γ ≤ 30 | `iKFR` l.117 |
| KFR §11 | l'écart rapide/rigoureux n'est pas un effet de la température de Sinkhorn | `iKFR` l.111 |
| KFR §14 | l'excès Turing fort était un artefact de pas non dissipatif | `iKFR` l.116 |
| E1b | la bande gelée est ratée (0,600) ; le codage du bras est en cause, pas de « confirms » | `iKFR` l.114 |
| B-3 seuil 0,02 | une règle de seuil sur un max se déclenche sous H0 avec probabilité 1 à n ≤ 1 024 | `iBS` l.114 |
| B-2 Studyforrest | un contrôle qui ne peut pas échouer, puis une porte échouée sur 10/10 graines | `iBS` l.115 |
| Physio Studyforrest | un résultat construit sur un canal mal lu, non reproductible, dans un réseau qui n'apprend pas | `iBS` l.112 |
| N10-C run 2 | leçon de dessin : la tâche telle que réglée ne requiert pas le message ; ni positif ni négatif sur la communication | `iNW` l.89 |
| MK-09 / MK-01 | A/B nul ; chiffre non reproductible depuis le dépôt | `iMKBB` l.164-165 |
| aarch64 NH-01 | INCONCLUSIVE_STRICT sous protocole gelé, cité avec la tolérance post hoc | `iMKBB` l.84 |
| H14-B (après #92) | DOWNSCALE × 0,99 n'ajoute pas δ au rejeu réglé ; contraste peu sensible | `iDOK` l.101 |

### Ce qu'il faut arrêter (propositions)

- Lancer K1/K3 Me6 comme campagne séparée ; au plus, un pilote du nul réseau de v0.7.1 (`iBS` l.52).
- Préparer une équivalence TOST pour B-1/B-2 (`RM:160`, issue #24) (`iBS` l.124).
- Présenter N10-D comme une « étude de nécessité du message » (`iNW` l.90).
- Garder NH-31, NH-33, NH-37 sur le substrat N10-C (`iNW` l.26-28).
- Viser le recalcul §16 complet à γ ≥ 10 avec le solveur actuel (`iKFR` l.62).
- Écrire « bit-exact » sans qualificatif dans la note (`iMKBB` l.177).
- Tenir NH-13 comme ligne séparée de NH-91 (`iDOK` l.41).
- Planifier NH-84 et NH-65 tant que le Studio est éteint (`iMKBB` l.59-60).

## §7 Décisions du PI (QCM)

### À trancher maintenant

**Q1 — Collision NH-91 … NH-101.** (dépend de : rien ; conditionne Q3 et l'inscription de NH-96)
- (a) Ne rien renuméroter avant le point de reprise ; garder les préfixes de dépôt (`NWML-N1`, …) et écrire « NH-96 (priorités 30/10) » partout.
- (b) Le catalogue v2 fait foi ; les onze entrées du 30/10 deviennent NH-102 à NH-112 (NH-96 → NH-107), avec table de correspondance.
- (c) Préfixe daté `P30-91` … `P30-101` jusqu'à leur entrée au catalogue.
- (d) Préfixes de dépôt permanents ; « NH- » réservé à NH-01 … NH-91.

**Q2 — Comptage des lignes « clos par erratum ».** (indépendante)
- (a) Garder la règle `cat:18` (verdict du 24/10 conservé) et ajouter une note sous chaque ligne concernée.
- (b) Mapper « clos par erratum » sur « rétracté » (BS-SF45, KFR-H28 : confirmé −2 ; KFR-H2 : amendé −1).
- (c) Créer une dixième classe « clos » hors des neuf verdicts.

**Q3 — Primaire de N10-D.** (dépend de Q1 pour le nom de NH-96 ; doit précéder le tour 2 de veille, S4)
- (a) Garder la H1 enregistrée (`eng − nocomm`) ; NWML-N1 en secondaire exploratoire déclaré.
- (b) NWML-N1 primaire, NH-96 en porte de chaîne ; refaire k et la règle avant le gel (π à fixer : k = 23 à π = 0,6, k = 16 à π = 0,7 pour 0,90 par backend).
- (c) Co-primaires par intersection-union (deux B → B global).

**Q4 — PR #92 (contrôles E1-small, 28-49 h GPU).** (indépendante ; aucun effet sur le run en cours)
- (a) Enregistrer une dérogation datée à la règle 4, sur le modèle d'ADR-0003.
- (b) Considérer le run couvert par l'exception du principe 3, comme l'écrit `RM:57`.

**Q5 — Paquet (i) des nouvelles hypothèses ce trimestre.** (dépend de `RM:190`)
- (a) Aucune avant le point de reprise.
- (b) Seulement les préconditions et contrôles de lignes existantes : BOUBA-N1, BOUBA-N3, BOUBA-N4, MK-N1, KFR-N1, KFR-N3.
- (c) Tout le paquet (i) (12 entrées), dans l'enveloppe C de 15 h.

**Q6 — Fermetures à accepter maintenant.** (indépendante)
- (a) Seulement les 17 appuyées par un document du dépôt sans réserve : 14 errata (hors BS-Q3 et BS-N12) et 3 négatifs selon préreg.
- (b) Les 24.
- (c) Aucune avant le point de reprise.

### Au point de reprise

- **R1 — Nul de Me6 / B-3.** (a) geler B-3 après le verrou sans nul réseau ; (b) H0 conditionnelle aux réseaux (transpose flip, sans calcul) ; (c) H0 sur tirages de réseaux (#66 révisée ; pilote 1,8-4,4 h, minimum 12,5-31 h, `iBS` l.54). Dépend de la révision de #66.
- **R2 — Correctif physio #72.** (a) #83 (`ValueError` sans sidecar) ; (b) #82 (repli phase 2 + avertissement). Fermer l'autre.
- **R3 — Recalcul §16.** (a) garder la bannière, ne rien recalculer ; (b) γ ≤ 5 + pilote grille 64, γ ≥ 10 bloqué jusqu'à KFR-N4 ; (c) maintenir la décision du 28/10. Dépend de KFR-N4 pour (c).
- **R4 — Verrou NH-20.** (a) attendre la décision sur le contradicteur (issue #63) ; (b) déclarer le verrou sur lecture mathématique seule (autorisé par `RM:24`).
- **R5 — Texte de Paper 1 nerve-wml (« spiking LIF »).** (a) retirer « spiking » pour le Test 6 ; (b) attendre NH-35 reformulée (embedding après dynamique).
- **R6 — BB-N1 hors du report de `RM:128`.** (a) non ; (b) oui, CPU sur electron-server.
- **R7 — NH-85 H9 après lecture de l'eLife 112891.** (a) fermer comme contribution neuve si la lecture confirme l'antériorité ; (b) garder comme réplication ciblée.
- **R8 — Ligne Q3 2027 et issue #24 (B-1/B-2).** (a) reformuler en « non-test / non mesurable » dans la note ; (b) garder la TOST si des marges sont justifiées.
- **R9 — T-N1, T-N3, T-N4.** (a) sections de la note, sans préreg ; (b) T-N1 préenregistrée en L1 avant comptage, les deux autres en sections.

## §8 Provenance et limites

- **Agents** (tous Claude, modèle Opus 5.5 selon les en-têtes disponibles et le brief) : six inventaires (nerve-wml ; dream-of-kiki ; bouba_sens ; kiki-flow-research ; micro-kiki + baby-brain + note méthodo + rescience-nh01 ; état du calcul) et une veille delta, puis cette synthèse.
- **Durées** (horodatages des fichiers, CET) : brief 18:54 ; clones 18:55-18:57 ; état du calcul 18:58 ; inventaires écrits entre 19:05 (nerve-wml) et 19:09 (bouba_sens, kiki-flow, micro-kiki), soit ≈ 10-14 min chacun ; veille 19:00-19:18 (fichiers bruts de 19:00 à 19:14) ; synthèse à partir de 19:20. L'en-tête de la veille annonce des requêtes « entre 19:10 et 20:20 CET », incompatible avec un fichier écrit à 19:18 : l'heure de fin déclarée est fausse.
- **Non vérifié.** Aucun PDF ouvert (tout est au niveau du résumé ou du résumé tronqué). OpenReview `notes?id=` en 403 sur toute la passe ; O2IGIHRtWc, hukTsKYu8Y, EaGbKYSNTf, r0fc1l2JMi non résolus, ne tranchent rien. Semantic Scholar non interrogé par la veille delta (HTTP 429 au tour 1 N10-D). Aucun code des dépôts exécuté ; seule de l'arithmétique légère (§4.1, §4.4, NWML-N3). La date d'ADR-0024 (E-7), les cartes HF des adaptateurs micro-kiki, les licences MotorSense / Xu / Heinrichs, et la révision du 26/10 de PEAM n'ont pas été vérifiées. Aucune valeur de #92, P1bis, P8c ou A+ n'a été lue (`iCS` l.10).
- **Étapes du pipeline non faites à ce stade** : passe aveugle Codex sur les clones et passe croisée sur ce rapport ; critique à contexte vierge ; publication (Claude Doc, PR `.github`, Outline).
