# Critique à contexte vierge — refresh du catalogue des hypothèses (06/11/2026, soir)

Relecteur : Claude (Opus 5.5), sans contexte préalable, lecture seule des fichiers existants. Objets relus : `synthese/rapport.md` (250 l.), `synthese/catalogue-v3-delta.md`, `synthese/nouvelles-hypotheses.md`, les six `inventory/*.md`, `veille/veille-delta-2026-11-06.md`, `dotgithub/…/catalogue-v2.md` (`cat`), `dotgithub/docs/ROADMAP.md` (`RM`) et les clones `repos/*`. Aucun code des dépôts exécuté ; arithmétique de contrôle en `python3 -I` (binomiale, hypergéométrique, sommes).

**Verdict global : REVISE.** L'arithmétique des comptes est juste, mais plusieurs fermetures ne sont pas du type admis, une fermeture est contredite par sa propre source, le chiffre « 9 errata » est gonflé, une inférence (C-4) est réfutée par un fichier du dépôt, et trois QCM ont un défaut de formulation ou d'ordre. Mode : passé en ADVERSARIAL après le troisième MAJEUR.

## 1. Prédictions faites avant lecture, et ce qui a été trouvé

| Prédiction | Résultat |
|---|---|
| Comptes justes en arithmétique mais base de comptage instable | confirmé : 24/48/25/97 et le bilan à somme nulle se recomptent, mais le périmètre « garder » est sélectif et la table des changements de classe omet des lignes |
| Fermetures « administratives » présentées comme scientifiques | confirmé : DOK-E1 (abandon), H14 (lecture exploratoire, H14-B en attente de #92), NH-58 (« erratum » sur une ligne jamais revendiquée) |
| Errata du catalogue v2 qui n'en sont pas | confirmé : 4 sur 9 sont des contradictions ; les autres sont des omissions de périmètre déclarées par `cat:14,26` ou des règles |
| QCM à option conservatrice mal placée | confirmé : Q6 et R1 |
| Inférence d'une entrée non vérifiée à la source | confirmé : C-4 (VEI-8) réfutée par `eval_cognitive_ab.json` |

## 2. Recomptage (point 1 de la demande)

Recompté ligne par ligne sur la table delta (crochets [n]) :

| Dépôt | fermer | reformuler | garder | total |
|---|---|---|---|---|
| nerve-wml | 1 | 1+1+1+1+1+3+1 = 9 | 3+1 = 4 | 14 |
| dream-of-kiki | 2+1 = 3 | 2+1+1+1 = 5 | 4+2+1 = 7 | 15 |
| bouba_sens | 1+5+2 = 8 | 1+1+1+1+1+2+1+1 = 9 | 2+4 = 6 | 23 |
| kiki-flow | 2+1+1+1+4+1 = 10 | 2+2+1+2+2+1 = 10 | 1+1+2 = 4 | 24 |
| micro-kiki | 2 | 1+1+2+1 = 5 | 1+2 = 3 | 10 |
| baby-brain | 0 | 2+1+3 = 6 | 1 | 7 |
| transversal + NH-12 | 0 | 2+1+1 = 4 | 0 | 4 |
| **Total** | **24** | **48** | **25** | **97** |

Motifs : 16 + 3 + 3 + 2 = 24, exact. Nouvelles : (i) 12, (ii) 11, (iii) 3 = 26 ; 31 − 5 fusions = 26 ; par dépôt 3 + 4 + 4 + 5 + 7 + 3 = 26. Changements de classe : confirmé −5, réfuté −1, nul −1, en attente −2, non testé 0, non concluant +4, amendé +5 ; somme 0, directions conformes à la table `catalogue-v3-delta.md:132-144`.

Réserves sur la base (pas sur l'arithmétique) :
- La somme nulle est une **identité** : toute réaffectation de lignes entre classes somme à 0. Elle ne vérifie rien.
- La règle « reformulé → amendé » (`catalogue-v3-delta.md:128`) n'est pas appliquée à NWML-PRH (A l.140, v2 « artefact plausible » → non concluant, v3 « reformuler (portée) »), BB-01 (A l.193, idem) ni BS-v07 (A l.190, v2 « en attente », v3 « reformuler »). À l'inverse, BS-B2, BS-E12, KFR-H22 et BB-03, reformulés aussi, vont en « non concluant » : une règle de préséance (« la nature l'emporte sur reformulé ») est appliquée sans être écrite.
- « 25 à garder » : les inventaires proposent « garder » avec une note pour d'autres lignes non comptées (DOK-CPU « base de DOK-N3 », `iDOK` ; BS-SNR « précondition lésion effective », `iBS` §1.2 ; MK-26 « constat toujours ouvert », MK-17, NH-81 avec un constat MINEUR, `iMKBB` l.56-61 ; canal PSK, `iNW`). Le delta écrit pourtant « non touchées : l.38 PSK, … l.46 NH-81 » (`catalogue-v3-delta.md:111`), contredit par `iNW` (PSK « garder ») et `iMKBB` l.61.
- Divergences inventaire → delta non signalées : M5 est « garder « rapport technique » » dans `iKFR` l.24 et « fermer » dans le delta (l.53) ; la liste des « sept lignes » qui changent de mot (`catalogue-v3-delta.md:111`) ne compte que les passages garder → reformuler. H14-B est « fermer après #92 » dans `iDOK` (table §1) et fermée sans condition dans le delta (l.30), sauf la mention entre parenthèses.

## 3. Tableau des vérifications ponctuelles

| # | Élément du rapport | Source ouverte | Ce que dit la ligne | Verdict |
|---|---|---|---|---|
| 1 | Comptes 24/48/25/97 (`delta:99-109`) | table delta l.20-81 | recompté : identique (§2) ; périmètre « garder » sélectif | nuancé |
| 2 | 13 lignes, somme nulle (`delta:130-146`) | `cat` verdicts A l.140, 190, 193 | arithmétique juste ; NWML-PRH, BB-01, BS-v07 omises ; somme = identité | nuancé |
| 3 | 26 = 12 + 11 + 3 | `nouvelles-hypotheses.md:19-148` | 12 / 11 / 3 entrées | confirmé |
| 4 | E-1 / N-12 : ordre fixe, RECOMBINE no-op | `repos/dream-of-kiki/scripts/e1_harness.py:214-224` | « RECOMBINE is a weight-neutral no-op on this backend » ; DOWNSCALE puis RESTRUCTURE, ordre codé | confirmé |
| 5 | Aucun profil ne permute ; pas de phase REM-like | `e1_profiles.py:52-57,135-141` ; `docs/papers/paper1/full-draft.md:1065` | profils = booléens downscale/restructure ; REM = `recombine` dans le cadre du dépôt | confirmé |
| 6 | Chiffres H14-A/B/C, signature non observée (§1) ; S2 « H14-B ne peut pas échouer » (`rapport:138`) | `docs/results/2026-11-06-e1-small-analysis.md:164-255` | chiffres exacts ; mais `:200-206` : « Le contrôle peut échouer (13/141 graines identiques seulement), mais faiblement ; … contrôle à faible pouvoir de falsification, pas « non informatif » » | nuancé (S2 contredit la source) |
| 7 | N10-C arrêtée sans verdict ; tâche sans besoin de message | `nerve-wml/docs/milestones/n10c-…-closure-2026-11-05.md:43-45,53` | « No verdict, positive or negative » ; « The task did not require communication » | confirmé |
| 8 | N10-D ne teste pas la nécessité ; puissance 0,808 / 0,599 | `origin/prereg/n10d-skeleton:docs/prereg/n10d/protocol.md:52-62,185-195` | « N10-D does not test whether the message is informationally necessary » ; table 0,70 → 0,599, 0,75 → 0,808 | confirmé |
| 9 | N-10 : embedding LIF affine, « spiking » trop large | `MK:69-76` ; `scripts/platonic_rh_alignment.py:84-86,112` | embedding = `lif.input_proj(lif_encoder(x))` ; mais l'entraînement passe par `spike_with_surrogate` (l.85) | nuancé (R5 (a) « retirer spiking » serait inexact) |
| 10 | B-2 : sonde à une classe sur 4/5 graines ; porte 0,250 sur 10/10 | `bouba_sens/docs/paper/main.tex:1062-1076,1110-1124` | « In 4 of the 5 seeds the probe holds a single class » ; « 0.250 on all ten seeds … the learning gate (0.35) fails on every seed » | confirmé |
| 11 | E-7 : date d'ADR-0024 « non vérifiée » (`rapport:103,249`) | `docs/adr/0024-erratum-default-regime-does-not-learn.md:3-5,45-48` | « Date: 2026-10-26 » ; « it is a null of an untrained regime » | confirmé (E-7 tient ; vérifiable en une commande) |
| 12 | KFR-H24 : pente 0,600 hors bande | `kiki-flow-research/experiments/results/e1b_peyre_bias.json:124-130` | `"slope": 0.6000001…`, `"verdict": "REFUTED"` | confirmé |
| 13 | M5 : 50/60, 12/12/11/10/5 | `docs/results/2026-10-30-m5-certify-verdict.md:9-23` | identique, « failed » | confirmé |
| 14 | NH-58 « clos par erratum » (§11) | `ERRATUM.md:437-452` | ε ∈ [0,01 ; 0,05], écart 0,76-0,80 et 0,41-0,45 bit, « does not come from the Sinkhorn temperature » ; ε/h = 0,1 (critère de NH-58) non mesuré (`iKFR`) ; volets « stationnaire » et « JKO entropique ≡ exact + diffusion » non testés ici | nuancé (négatif exploratoire, pas erratum) |
| 15 | KFR-H2 clos par erratum (§13) | `ERRATUM.md:591-601` | excès sur Gibbs négatif à α ≤ 20, γ ≤ 10 ; « no longer claim emergent specialisation » | confirmé |
| 16 | M12 n'est pas un test direct de NH-20 | `docs/prereg/2026-10-30-jko-splitting-lie-strang.md:36-40` | « related to NH-20, not a direct test of it » | confirmé |
| 17 | MK-01 fermé par erratum (`delta:68`, Q6 (a)) | `micro-kiki/docs/ERRATA.md:190-194` | « MK-01 in the master table stays "non concluant (provenance)" until then; the row's measured value is 46.4 / 69.6 » | **réfuté** |
| 18 | C-4 : la condition de VEI-8 (sélection parmi configurations) « paraît non remplie » (`rapport:146`) | `micro-kiki/results/eval_cognitive_ab.json`, `summary.per_domain` | « +7 pp » = domaine `power` (n = 5) : 0,5543 − 0,4839 = +0,0704, **maximum des 6 deltas par domaine** (+0,070, +0,039, +0,010, −0,002, −0,048, −0,131) ; global −0,0102 | **réfuté** (sélection parmi 6 domaines) |
| 19 | Reproduction aarch64 INCONCLUSIVE_STRICT, tolérance post hoc | `rescience-nh01/docs/prereg/arm-reproduction/amendment-2026-11-04.md:8-13,82-89` | « post hoc, not pre-registered » ; verdict gelé « remains INCONCLUSIVE_STRICT » | confirmé |
| 20 | E-2 / N-15 : 3,90 / 1,90 / 3,05 | ReScience/submissions#147, commentaire du 04/11 (lu via `gh api`) ; `nerve-wml/docs/results/2026-10-31-nh01-diagonal-ablation.md:31-33` | #147 : « J_ii = 0 in both arms … 3.90 » ; « diagonal kept in both arms … 1.90 » ; 3,05 « mixed ratio … no published protocol ». La v2 (`cat:50`) écrit « 3,05 … avec base standard », littéralement compatible ; les l.31-33 du fichier nerve-wml ne contiennent pas ces trois nombres | nuancé (vocabulaire faux, pas chiffres faux ; preuve fichier mal pointée) |
| 21 | E-4 : l.245 décrit « quand dormir » et cite 3gCeBuNNyT « non résolu » | `cat:245,341-342` | l.245 : requalification « « quand dormir » … OpenReview 3gCeBuNNyT [non résolu] » ; l'addendum corrige l.22, 35, 333, pas 245 | confirmé |
| 22 | E-5, E-6 (et E-7) présentés comme errata | `cat:14`, `cat:26` | « Une ligne sans requalification porte « inchangé » … ce qui ne vaut pas validation » ; « Seules les requalifications de la spec … sont appliquées » | **réfuté** comme errata (omissions dans un périmètre déclaré) |
| 23 | DOK-E1 fermé « non-test, abandonné » | `dream-of-kiki/docs/osf-amendment-e1-small-2026-10-30.md:82-90` | 35B abandonnée après une exposition aux chiffres ; « independence from them cannot be shown » | nuancé (fait exact ; fermeture administrative, pas preuve) |
| 24 | N-9 / E-8 : NH-96 absente du catalogue, collision NH-91…101 | `cat` (0 occurrence de NH-92 à NH-101) ; `priorites-hypotheses.md:144,179` ; `P100:protocol.md:20` | confirmé tel quel | confirmé |
| 25 | Q4 (b) / C-6 : #92 « couvert par l'exception du principe 3 » | `RM:11,12,14` | principe 3 : exception sur le **gel** ; principe 4 : « Aucune nouvelle campagne GPU avant S6 », sans exception ; principe 6 : verrou pour « toute campagne lourde (GPU …) » | **réfuté** (l'exception ne couvre pas la règle enfreinte) |
| 26 | Principe 6 cité `ROADMAP.md:15` (`delta:14`, `nouvelles:3`) | `RM:14-15` | l.14 = principe 6 ; l.15 vide | réfuté (pointeur) |
| 27 | Puissance du test des signes 0,62 / 0,93 / 0,99 ; k = 33 / 23 / 16 ; code à un bit 0,481 | recalcul `python3 -I` | m = 15 à k = 20 ; 0,617 / 0,933 / 0,989 ; k = 33 / 23 / 16 ; hypergéométrique (K = 16, C = 4, M = 2) : 0,481 | confirmé |
| 28 | §4.4 : 230 × 30 pas ≈ 1,3-2,5 h | recalcul | 1,34-2,49 h | confirmé |
| 29 | §8 : en-tête de la veille incompatible avec l'heure du fichier | `ls -l` | `veille-delta-2026-11-06.md` écrit à 19:18:17 ; en-tête « entre 19:10 et 20:20 » | confirmé |
| 30 | N-2 cite « ADR-0019:184-192 » | `bouba_sens/docs/adr/` | deux fichiers portent le numéro 0019 (`0019-b2-dimensional-mine-criterion.md`, 583 l. ; `0019-multi-seed-q3-retract.md`, 63 l.) ; la citation désigne le premier par déduction | nuancé (ambiguïté non relevée) |
| 31 | NH-85 H9 : antériorité directe probable (eLife 112891) | — | non ouvert (résumé seulement, aucune lecture possible ici) | non vérifiable |
| 32 | C-7 : état « superseded » des notices Zenodo kiki-flow | — | API Zenodo non interrogée par ce relecteur | non vérifiable |

**Décompte des verdicts (32 vérifications) : 17 confirmés, 8 nuancés, 5 réfutés, 2 non vérifiables.**

## 4. Constats

### BLOQUANT

**B-1. Une fermeture est contredite par sa propre source et figure dans l'option « sans réserve » de Q6.** `catalogue-v3-delta.md:68` ferme MK-01 (« part 70,7 / 89,5 ») « clos par erratum » et `rapport.md:229` la compte parmi les « 14 errata » appuyés « sans réserve ». L'erratum cité dit le contraire : « MK-01 in the master table stays "non concluant (provenance)" until then; the row's measured value is 46.4 / 69.6 » (`micro-kiki/docs/ERRATA.md:190-194`). Le retrait d'un chiffre n'est pas la fermeture de la ligne ; la ligne garde une valeur mesurée et une hypothèse ouverte (réinstaller un routeur mpnet avec JSON d'évaluation). Q6 ne peut pas être soumise au PI en l'état : son option la plus prudente contient une fausse fermeture.
- Confiance : HAUTE. Réfutable par l'auteur : non (citation littérale).
- Correction : MK-01 → **reformuler** (« 70,7 / 89,5 retiré par erratum ; 46,4 / 69,6 en rapport technique ; non concluant jusqu'au réentraînement mpnet »). Comptes : 23 fermer / 49 reformuler ; motif erratum 15 ; Q6 (a) 16.

### MAJEUR

**M-1. Cinq fermetures ne sont pas du type admis, et §0 l'affirme pourtant (`rapport.md:8`, « Aucune n'est fermée … « par lassitude » »).**
- H14 (A l.97, C l.33) : une lecture exploratoire ne retire pas l'hypothèse ; elle en engendre une (DOK-N1, « suite de H14-A », `nouvelles:97-100`). Pour H14-B, l'inventaire dit « **fermer après #92** » ; le delta ferme maintenant (`delta:30`) alors que #92 tourne (fin 07-08/11). Avec la définition du delta (« la ligne n'a plus d'hypothèse à tester », l.10), c'est faux.
- DOK-E1 : abandon décidé « after an exposure », « independence … cannot be shown » (`osf-amendment-e1-small-2026-10-30.md:82-90`). C'est une décision du PI, pas une preuve ; il faut l'étiquette « abandonné (non testé) » hors du compte des fermetures.
- NH-58 (`delta:55`) : ligne de la table B, jamais revendiquée en public ; un « erratum » ne peut pas la clore. La mesure de §11 couvre ε ∈ [0,01 ; 0,05] et pas le point ε/h = 0,1 de son critère (`iKFR`, ligne NH-58) ; deux de ses trois volets ne sont pas testés. Étiquette juste : « négatif exploratoire + antériorité lue en résumé ».
- BS-Q3, BS-N12 : « sous réserve (monde des graines à recouper) » (`delta:41`) n'est pas une preuve au sens de la règle `delta:10`.
- Confiance : HAUTE. Correction : sortir H14-B, DOK-E1 et NH-58 du compte « fermer » (H14-B « en attente de #92 », DOK-E1 « abandonné », NH-58 « négatif exploratoire, à confirmer ») ; garder H14-A/C en « lu, exploratoire » avec renvoi à DOK-N1 ; retirer la phrase de `rapport.md:8` ou la restreindre.

**M-2. Le titre « 24 à fermer » mêle des relabels et des doublons.** Douze des 24 lignes étaient déjà rétractées ou réfutées en v2 : KFR-H4 à H7 (rétracté, `cat:103-106`), BS-AMEDI (rétracté), BS-COMP, BS-TAU, BS-S14c (réfuté), BS-Q3 (rétracté FINAL), BS-N12 (réfuté), KFR-H24 en A (réfuté) et en C (REFUTED). Deux hypothèses sont comptées deux fois (KFR-H24 et H14, tables C et A). Le delta le dit à moitié (« étiquette ; verdict inchangé », l.62) ; §0 ne le dit pas. Un lecteur pressé croira que 24 hypothèses viennent d'être tranchées.
- Confiance : HAUTE. Correction : §0 écrit « 24 lignes, dont 12 déjà rétractées ou réfutées en v2 (changement d'étiquette) et 2 doublons C/A ; fermetures nouvelles : N ».

**M-3. « Neuf errata du catalogue v2 » : quatre seulement sont des contradictions.** E-1, E-2 (nuancé, voir vérification 20), E-3 et E-4 sont contredits par une source. E-5, E-6 et E-7 portent sur des lignes « inchangé » que `cat:14` déclare « ne vaut pas validation » et que `cat:26` met hors périmètre : ce sont des omissions, pas des erreurs. E-8 est une absence, E-9 une conséquence de règle. Par ailleurs E-7 reste « non vérifié » (`rapport.md:103,249`) alors qu'ADR-0024 porte « Date: 2026-10-26 », avant le catalogue.
- Confiance : HAUTE. Correction : scinder §3 en « errata » (E-1 à E-4), « omissions de périmètre » (E-5 à E-7, avec la date d'ADR-0024 vérifiée) et « absences et règles » (E-8, E-9) ; corriger `rapport.md:12`.

**M-4. C-4 est réfutée par le dépôt, et MK-N1 est mal posée.** `eval_cognitive_ab.json` donne « +7 pp » = domaine `power`, n = 5, maximum des six deltas par domaine ; le delta global est −0,0102 (14 contre 16). La condition de VEI-8 (« sélection parmi configurations ») est donc remplie : c'est une sélection du meilleur de six domaines. Le rapport l'écarte (`rapport.md:146` ; `nouvelles:12`) et garde MK-N1, dont l'énoncé « le gain cognitif est un effet de longueur » porte sur 30 paires où il n'y a pas de gain, avec un composite qui contient 0,2 × longueur par construction (`iMKBB` l.96). Le Δ résiduel « nul » est attendu d'avance et ne peut pas être établi par un test de permutation sans marge d'équivalence.
- Confiance : HAUTE (arithmétique sur le JSON versionné). Correction : VEI-8 redevient le nul principal (nul de sélection du maximum sur 6 domaines à n = 5 par domaine) ; MK-N1 est réécrite sur le seul domaine `power` ou retirée du paquet (i) ; mêmes changements dans Q5 (b).

**M-5. Q4 (b) repose sur une lecture que le texte de la roadmap exclut.** L'exception du principe 3 (`RM:11`) porte sur le **gel** ; la règle que #92 enfreint est le principe 4 (`RM:12`, « Aucune nouvelle campagne GPU avant S6 », sans exception), et le principe 6 (`RM:14`) soumet au verrou « toute campagne lourde (GPU …) ». C-6 (`rapport.md:148`) présente cela comme une contradiction d'interprétation entre deux lectures ; ce n'en est pas une.
- Confiance : HAUTE. Correction : Q4 (b) réécrite « considérer que `RM:57` vaut décision de dérogation aux principes 4 et 6 » (si le PI le veut) ; C-6 → « `RM:57` applique une exception qui ne couvre pas le principe 4 ».

**M-6. Q5 (c) « dans l'enveloppe C de 15 h » n'est pas tenable avec les coûts du fichier.** Heures humaines du paquet (i), selon `nouvelles-hypotheses.md` : BOUBA-N1 ≈ 1, BOUBA-N3 ≈ 4, BOUBA-N4 < 1, MK-N1 1, BB-N1 4-6, T-N2 ≈ 1, KFR-N1 ≈ 3, KFR-N2 ≈ 5, KFR-N3 ≈ 4, KFR-N5 ≈ 4, VEI-1 et VEI-2 non chiffrées : ≈ 28-30 h hors VEI-1/VEI-2, soit le double.
- Confiance : MOYENNE-HAUTE (sommes faites sur les chiffres déclarés). Correction : retirer « 15 h » ou réduire (c) à une liste dont la somme tient.

**M-7. L'option conservatrice n'est pas en premier dans Q6 et R1.** Q6 : (a) 17 fermetures, (b) 24, (c) aucune ; la plus prudente est (c), placée en dernier, et (a) est annoncée par « Seulement », qui la présente comme la réserve. R1 : (a) « geler B-3 après le verrou sans nul réseau » est l'option la moins prudente ; l'inventaire la plaçait en (c) et disait que seule la H0 sur tirages de réseaux garde B-3 comme hypothèse sur la plasticité (`iBS` §1.2). Les autres QCM (Q1 à Q5) mettent bien l'option prudente en tête.
- Correction : Q6 (a) « aucune avant le point de reprise », (b) les 16 (après B-1), (c) toutes ; R1 (a) H0 sur tirages de réseaux, (b) H0 conditionnelle, (c) gel sans nul réseau.

**M-8. La table des changements de classe applique une préséance non écrite et omet trois lignes.** Voir §2 : NWML-PRH, BB-01, BS-v07 manquent si « reformulé → amendé » s'applique ; si la règle est « la nature l'emporte », elle doit être écrite. Le KPI « verdicts rendus » (`cat:18`) dépend de ce choix.
- Correction : écrire la préséance dans `catalogue-v3-delta.md:128`, ajouter ou exclure explicitement les trois lignes, et retirer « somme 0 » comme vérification.

**M-9. La supposition S2 contredit la source qu'elle résume.** `rapport.md:138` range H14-B parmi les « contrôles qui ne peuvent pas échouer » ; l'analyse dit : « Le contrôle peut échouer … mais faiblement ; … contrôle à faible pouvoir de falsification, pas « non informatif » » (`e1-small-analysis.md:200-206`). S2 alimente T-N3/T-N4 et la note méthodo ; un exemple faux y serait publié.
- Correction : retirer H14-B de S2, ou créer une catégorie « contrôle à faible sensibilité ».

Self-audit et Realist Check : aucun MAJEUR ne repose sur une confiance BASSE. M-6 et M-7 sont des défauts de présentation, mais ils orientent un vote du PI ce soir (§7 « à trancher maintenant ») : ils restent MAJEUR. B-1 est rapide à corriger ; il reste BLOQUANT pour Q6 seulement, parce que l'option prudente du vote contient une fermeture fausse.

### MINEUR

1. BS-AMEDI, COMP, TAU, CBF, S14c sont fermés (`delta:40`) avec l'argument d'ADR-0024 (« régime non apprenant »), alors que BS-OQ1, B1, HB1, LOCK (`delta:51`), de même verdict « réfuté », sont gardés avec une note sur le même argument. ADR-0024 dit « not evidence for or against » (l.45-48, 55-58) : l'hypothèse sous-jacente reste ouverte pour un agent qui apprend. Atténué par : la différence réelle (pont physio non reproductible, `iBS` §1.1) existe ; elle doit être écrite dans la ligne.
2. `rapport.md:10` écrit au passé « étaient mal lus (phase 1 et phase 2) » ; pour les tenseurs d'avril de la phase 2, l'inventaire dit « probable, non vérifiable » (`iBS` §1.1).
3. `rapport.md:186` (§6) : « DOWNSCALE × 0,99 n'ajoute pas δ » est catégorique avant la fin de #92 ; l'analyse écrit « va dans le sens de ».
4. R5 (a) « retirer « spiking » » serait inexact : le LIF est entraîné avec `spike_with_surrogate` (`platonic_rh_alignment.py:85`) ; c'est l'embedding mesuré qui est pré-impulsionnel. Formulation juste : « embedding pris avant le pas impulsionnel ».
5. Q2 (b) ne donne que les retraits (confirmé −2, amendé −1) et omet rétracté +3.
6. BOUBA-N1 : énoncé au P95, réfutation au P99 ; la zone P95-P99 n'a pas de lecture.
7. BOUBA-N4 n'a pas de nul (« aucun (mesure descriptive) ») : par `RM:10` (principe 2), ce n'est pas une hypothèse posable ; c'est un contrôle descriptif.
8. BB-N1 a une issue connue d'avance (invariance d'échelle d'Adam, B18) ; c'est un test de harnais, au même titre que T-N3 et T-N4 classés en (iii).
9. Pointeurs : principe 6 = `RM:14`, pas `:15` (`delta:14`, `nouvelles:3`) ; deux ADR-0019 dans bouba_sens rendent « ADR-0019:184-192 » et « ADR-0019:409 » ambigus ; `nh01-diagonal-ablation.md:31-33` ne contient pas 3,90 / 1,90 / 3,05.
10. `rapport.md:113` : la marge A de N10-D porte sur `eng − nocomm` ; appliquer 0,55 au bras `learned` suppose que NWML-N1 reprend la même marge, ce qui n'est pas enregistré.

### OK

- Arithmétique des comptes, des motifs, des nouvelles hypothèses et du bilan de classes (§2).
- Puissance du test des signes, k pour 0,90, code à un bit 0,481, coût γ ≤ 5 (vérifications 27-28).
- E-1, E-4, N-9 (collision NH-91…101), N-7, N-10 (fait), B-2 « non mesurable », M5, KFR-H24, KFR-H2, M12, reproduction aarch64 : vérifiés à la source.
- Langage : le rapport et le delta gardent « va dans le sens de », « inférence », « exploratoire » ; pas de « confirme » ou « établit » sur une campagne sans verrou, hors les deux phrases des MINEUR 2 et 3.
- Q1 à Q5 mettent l'option prudente en premier ; les dépendances entre QCM sont écrites.
- §8 déclare honnêtement ce qui n'a pas été lu (PDF, OpenReview 403, date d'ADR-0024).

## 5. Ce que le rapport aurait dû voir

- La per_domain du JSON A/B, qui tranche C-4 (M-4).
- La phrase de clôture d'ERRATA E-2026-10-25-03, qui garde MK-01 ouvert (B-1).
- La date d'ADR-0024, lisible en une ligne (M-3).
- Le changement de mot de M5 (`iKFR` « garder » → delta « fermer ») et la condition « après #92 » de `iDOK` pour H14-B (§2, M-1).
- Le principe 4 de la roadmap, qui ne prévoit aucune exception GPU (M-5).
- Le double numéro ADR-0019 dans bouba_sens.

## 6. Dix changements au rapport

1. **`rapport.md:7-8`, `catalogue-v3-delta.md:68,99-124`** — MK-01 passe de « fermer » à « reformuler » (ERRATA `:190-194`) ; H14-B, DOK-E1 et NH-58 sortent du compte « fermer » (« en attente de #92 », « abandonné », « négatif exploratoire ») ; refaire les comptes et retirer « Aucune n'est fermée … par lassitude ».
2. **`rapport.md:7`** — ajouter : « dont 12 lignes déjà rétractées ou réfutées en v2 (changement d'étiquette) et 2 hypothèses comptées en C et en A ».
3. **`rapport.md:12` et §3 `:95-105`** — « neuf errata » → « quatre errata (E-1 à E-4), trois omissions de périmètre (E-5 à E-7, `cat:14,26`), une absence et une règle (E-8, E-9) » ; E-7 : « ADR-0024 daté du 2026-10-26, vérifié ».
4. **`rapport.md:146` (C-4), `nouvelles-hypotheses.md:12,36-39`, `rapport.md:225` (Q5 b)** — « +7 pp » = maximum de 6 domaines (`power`, n = 5) : VEI-8 redevient le nul principal ; MK-N1 réécrite sur `power` ou retirée du paquet (i).
5. **`rapport.md:148` (C-6) et `:219-221` (Q4)** — l'exception du principe 3 porte sur le gel ; #92 relève des principes 4 (`RM:12`) et 6 (`RM:14`) ; Q4 (b) devient « ratifier `RM:57` comme dérogation datée aux principes 4 et 6 ».
6. **`rapport.md:228-231` (Q6)** — ordre : (a) aucune avant le point de reprise ; (b) les fermetures appuyées sans réserve, recomptées après le changement 1 ; (c) toutes. Supprimer « Seulement ».
7. **`rapport.md:235` (R1)** — ordre : (a) H0 sur tirages de réseaux (#66 révisée) ; (b) H0 conditionnelle ; (c) gel sans nul réseau, avec la mention de `iBS` que seule (a) garde B-3 comme hypothèse sur la plasticité.
8. **`rapport.md:226` (Q5 c)** — retirer « dans l'enveloppe C de 15 h » ou donner la somme (≈ 28-30 h hors VEI-1 et VEI-2) et une sous-liste qui tient.
9. **`catalogue-v3-delta.md:111,128-146`** — écrire la règle de préséance (nature contre « reformulé »), traiter NWML-PRH, BB-01, BS-v07, retirer « somme 0 » comme vérification, corriger « non touchées : l.38, l.46 » et signaler M5 (`iKFR` « garder ») parmi les changements de mot.
10. **`rapport.md:138` (S2), `:186` (§6), `:10` (§0)** — retirer H14-B des « contrôles qui ne peuvent pas échouer » (`e1-small-analysis.md:200-206`) ; §6 : « va dans le sens de … (après #92) » ; §0 : « phase 2 : lecture fautive du code, probable pour les tenseurs d'avril, non vérifiable ».
