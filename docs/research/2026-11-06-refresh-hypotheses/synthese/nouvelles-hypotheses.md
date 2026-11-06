# Nouvelles hypothèses proposées le 2026-11-06 (dédoublonnées)

Statut : propositions, aucune posée. **v2 — intégration des relectures 2026-11-06 ~20:55 CET** (suivi : `critique/integration-2026-11-06.md`). Toutes passent le verrou de lecture avant tout gel (`.github:docs/ROADMAP.md:14`, principe 6). **Cadrage du trimestre** : la roadmap exclut « nouvel axe ni nouvelle hypothèse hors catalogue » (`ROADMAP.md:190`). Les entrées marquées « précondition » ou « contrôle » d'une ligne existante y sont compatibles (lecture de `inventory/bouba_sens.md:76`) ; les autres demandent une décision du PI (rapport §7, Q5).

Sources : `iNW`, `iDOK`, `iBS`, `iKFR`, `iMKBB`, `iVEI` (mêmes abréviations que `catalogue-v3-delta.md`). Les coûts sont ceux des inventaires ; quand l'inventaire écrit « inférence » ou « non mesuré », la mention est gardée.

## Dédoublonnage (31 propositions → 26)

| Proposition | Devient | Raison |
|---|---|---|
| VEI-6 (randomisation conditionnelle sur rollouts N10-C) | contrôle de **NWML-N1** | même question (l'effet « message nul » est-il un usage du contenu ?) ; le substrat N10-C n'a plus d'objet (`iNW` l.25 : tâche sans besoin de message) |
| VEI-8 (nul de bruit de sélection pour « +7 pp ») | **nul principal** de **MK-N1** | même chiffre ; la condition de VEI-8 est remplie : « +7 pp » est le maximum des six écarts par domaine (`power`, n = 5), P ≈ 0,42 sous inversion de signe (`mk:results/eval_cognitive_ab.json` ; relectures C-M4, X-M6). La v1 la jugeait non remplie, à tort |
| VEI-7 (taxonomie de Chen et al.) | second énoncé de **T-N1** | même corpus d'errata, même double codage ; un seul passage de lecture |
| VEI-3 (bruit rapide contre lent) | reformulation de **NH-12** (identifiant gardé) | la veille l'écrit elle-même (`iVEI` l.132) ; voir `catalogue-v3-delta.md` |
| VEI-5 (historiques sensibles à l'ordre) | contrôle de **NH-85 H10** reformulée | l'énoncé est un plancher commun à Aeon et au RAG, pas une hypothèse séparée (`iVEI` l.79) |

Après fusion : 26 propositions, dont **24 hypothèses** (**10 en paquet (i)**, **11 en paquet (ii)**, **3 en paquet (iii)**) et **2 contrôles** sortis du comptage des hypothèses (BOUBA-N4 : mesure descriptive sans nul, ce que le principe 2 exclut, `RM:10` ; BB-N1 : test de harnais à issue attendue par construction). La v1 comptait 26 hypothèses dont 12 en (i).

## Paquet (i) — posable ce trimestre sous verrou, sans calcul lourd (< 6 h CPU)

10 hypothèses. Coûts humains déclarés : ≈ 23 h hors VEI-1 et VEI-2 (non chiffrées) ; ≈ 28-30 h avec les deux contrôles de la section suivante (relecture C-M6).

**BOUBA-N1 — le canal physio est-il informatif pour l'étiquette ?** (précondition de BS-B2/BS-B3)
- Énoncé : sur le cache phase 1 corrigé (`d96ad636…`), l'information mutuelle entre canal force (cardiaque, respiration) et étiquette de scène à 4 classes ne dépasse pas le P95 d'un nul par décalage circulaire.
- Nul : 1 000 décalages circulaires ≥ 60 s. Contrôle positif : canal tactile (fonction de l'annotation). Réfutation : I > P99 → le bras « lésion de force » devient actif. Zone P95-P99 : sans décision, rapportée « non concluant » (la v1 laissait cette zone sans lecture).
- Substrat : tenseurs en cache, macM1 ou electron-server. Coût : ≈ 1 h de script + minutes CPU. Source : issues #72, #74 (`iBS` l.80-86). Lignes v2 : BS-B2 (183), BS-B3 (179).

**BOUBA-N3 — pourquoi la porte d'apprentissage échoue sur Studyforrest.**
- Énoncé : argmax-bridge + lots mélangés reste à ln 4 ± 0,03 et à 0,25 ± 0,03 sur 10/10 graines, et straight-through + lots mélangés passe la porte (≥ 0,35) sur ≥ 3/5 graines par cache.
- Nul : exactitude = taux majoritaire 0,25. Contrôle : les deux caches (ancien, corrigé).
- Substrat : macM1, 2 bras × 10 graines. Coût : ≈ 3 h de code + ≈ 1 h de lecture ; durée par graine non mesurée (à lire dans `reports/b2_phase1_recompute_20261106/`) → bascule en (ii) si le total dépasse 6 h CPU. Source : #80, ADR-0024 (`iBS` l.94-100). Lignes v2 : BS-B2 (183), BS-E12 (184).

**MK-N1 (+ VEI-8) — « +7 pp » est un maximum de sélection, et le composite suit la longueur.** (réécrite en v2 ; relectures C-M4, X-M6)
- Faits : « +7 pp » est l'écart du domaine `power` (n = 5), maximum des six écarts par domaine ; l'écart global est −0,0102 (14 contre 16) (`mk:results/eval_cognitive_ab.json`, `summary.per_domain`). Sous inversion de signe dans les 30 paires, P(maximum des six moyennes ≥ 0,0703) ≈ 0,42 (calcul descriptif des relectures, non préenregistré).
- Énoncé : (a) nul principal (VEI-8) : le maximum des six écarts par domaine ne dépasse pas le P95 de sa distribution sous inversion de signe appariée ; (b) secondaire : sur les 30 paires, la pente de Δcomposite sur Δlongueur est positive, et le Δ résiduel à longueur égale reste dans une marge d'équivalence δ fixée et justifiée avant lecture (TOST apparié).
- Nul : (a) inversion de signe dans les paires, statistique = maximum sur 6 domaines (B = 10 000) ; (b) pente nulle (permutation des étiquettes full/raw dans les paires). Contrôle : sous-score « coherence » seul, sans terme de longueur (le composite contient 0,2 × longueur par construction, `iMKBB` l.96).
- Inférence : (a) a déjà une issue descriptive connue (P ≈ 0,42) ; le préenregistrer ne vaut que pour la formulation publique. (b) n'a qu'une faible puissance à n = 30 ; sans marge justifiée avant lecture, (b) reste descriptif.
- Substrat : `mk:results/eval_cognitive_ab.json`, CPU. Coût : 1 h. Nature : contrôle d'artefact, ne rouvre pas MK-09. Sources : `iMKBB` l.89-98 ; arXiv:2611.01262 (`iVEI` l.91) ; arXiv:2404.04475 (Dubois et al., biais de longueur des évaluateurs automatiques et correction par régression ; résolu, `synthese/resolve-integration.tsv`). Ligne v2 : MK-09 (216).

**T-N2 — tolérance inter-plateformes du noyau NH-01, en prédiction.**
- Énoncé : sur une troisième plateforme (x86-64 AVX2 de KXKM ou arm64 du macM1), le run confirmatoire reproduit `data/` à moins de 1e-10 sur les champs bornés, champs discrets identiques.
- Nul et réfutation : un champ discret diffère ou l'écart dépasse 1e-10. Contrôle : second run intra-hôte (0,0 attendu).
- Coût : 1 h de gel + ≈ 2,8 h CPU à 2 workers. La tolérance doit être figée avant le troisième hôte (elle est post hoc au 04/11). Source : `rescience-nh01:docs/prereg/arm-reproduction/amendment-2026-11-04.md:10-13,28` (`iMKBB` l.132-139). Lignes v2 : NH-01 (243), C l.51.

**KFR-N1 — appariement adjoint en W₂ (bras de NH-20) : calibration sur cible gaussienne.** (requalifiée en v2 ; relecture X-M7)
- Énoncé : sur l'OU gaussien 1D, « demi-pas explicite du potentiel ∘ pas exact de l'entropie ∘ demi-pas JKO du potentiel » a une pente d'erreur W₂ à T = 1 dans [1,75 ; 2,25] sur h = 2⁻² … 2⁻⁹.
- Nul : Strang à sous-pas JKO purs, prédit [0,75 ; 1,25] ; calibration : Strang exact dans [1,75 ; 2,25]. Contrôle : solution OU exacte (formes closes).
- Antériorité : l'algorithme de Langevin symétrisé (SLA) de Wibisono, arXiv:1802.08089 (demi-pas avant, flot de chaleur exact, pas proximal), est la même composition et est « consistent for Gaussian target measure » [résumé, API]. Inférence : sur l'OU gaussien, l'issue est en grande partie prévisible ; KFR-N1 y est une calibration du bras de NH-20, pas une découverte. Une nouveauté ne serait possible que sur un potentiel non gaussien (par exemple quartique), non chiffré.
- Substrat : electron-server `nice 19`. Coût : < 1 min CPU, ≈ 3 h humaines ; même verrou que NH-20. Source : `kfr:docs/prereg/nh20/reading-note.md:452-459` (`iKFR` l.66-72) ; arXiv:1802.08089 (cité par `iKFR` l.71, retiré par la v1 de la synthèse). Ligne v2 : NH-20 (262).

**KFR-N2 — condition C6′ : borne inférieure de densité pour le sous-pas Fisher-Rao discret.**
- Énoncé : l'exposant de Strang à sous-flots résolus reste dans sa bande tant que min ρ ≥ 10⁻⁴ et en sort pour au moins une densité initiale quand min ρ → 10⁻⁸.
- Nul : exposant indépendant de δ (± 0,1 sur {10⁻², 10⁻⁴, 10⁻⁸}). Contrôle : réaction coupée (λ = 0).
- Substrat : N ∈ {1 024, 4 096}, CPU. Coût : ≲ 1 h CPU, ≈ 3 h + 2 h de lecture de arXiv:2610.38129. Source : `iKFR` l.74-80. Ligne v2 : NH-20 (262), KFR-H18 (116).

**KFR-N3 — conversion de ε et re-préreg d'E1b.**
- Énoncé : avec le noyau exp(−|x−y|²/ε) et la convention de pas du nul, la pente Δσ² contre ε/τ de l'OU stationnaire vaut 0,50 ± 0,05.
- Nul : forme close établie avant tout run, gelée en L1. Contrôle : bras sans entropie et invariance de grille (321 → 4 001 points).
- Coût : ≈ 1 h de calcul papier, minutes CPU, ≈ 3 h humaines. Source : `iKFR` l.82-88 ; arXiv:2502.12666. Lignes v2 : KFR-H24 (120, C l.41) ; NH-58 (300, volet 3, reformulée en v2).

**KFR-N5 — à γ ≤ 5, l'état final est le minimiseur statique de F.**
- Énoncé : |excès simulé − excès du minimiseur de F| < 0,05 bit sur ≥ 90 % des cellules γ ≤ 5.
- Nul : minimiseur indépendant (L-BFGS-B, départs multiples) figé avant lecture. Contrôle : α = 0. Réfutation : écart > 0,1 bit sur > 10 % des cellules.
- Substrat : grille 16, CPU. Coût : < 1 h CPU pour les minimiseurs, ≈ 4 h humaines ; comparaison au recalcul certifié γ ≤ 5 (≈ 1,3-3 h CPU, inférence, rapport §4). Source : `iKFR` l.98-105 ; arXiv:2501.16789. Lignes v2 : successeur de KFR-H2 (101, fermée par l'erratum §13 ; autre énoncé), NH-61 (303).

**VEI-1 — l'excès d'alignement inter-modal tombe sous un nul apparié en perte unimodale.**
- Énoncé : l'excès mKNN / CKA locale, mesuré contre le nul « non entraîné », tombe à ≤ 1,5× quand le nul est apparié en perte unimodale.
- Nul : encodeurs entraînés séparément sur flux permutés jusqu'à la même perte unimodale. Contrôle : initialisation aléatoire (nul actuel).
- Substrat : embeddings existants nerve-wml / bouba_sens, CPU ou macM1, heures (non chiffré). Source : OpenReview `2T0Ja28jY5` [résumé tronqué] (`iVEI` l.53, l.130). Lignes v2 : NH-45 (287), mKNN (C l.37), NWML-PRH (140). À lire en entier avant le gel (lecture n° 2 de la veille).

**VEI-2 — désapprentissage rêvé contre palimpseste borné, à budget égal (réplication ciblée).** (nul corrigé en v2 ; relecture X)
- Énoncé : sur Hopfield N = 1 000, le désapprentissage rêvé ne dépasse pas de ≥ 20 % l'horizon mémoire d'un palimpseste à synapses bornées réglé à sa borne optimale, à budget égal de mises à jour.
- Nul : palimpseste borné à sa borne optimale, sans rêve. La v1 donnait « Hebb non borné », nul trivial (le Hebb non borné oublie catastrophiquement). Contrôle : borne optimale ± 20 %.
- Antériorité : Marinari, Rossi, Zamponi (arXiv:2603.09384, 10/03/2026) montrent qu'alterner apprentissage et rêve améliore la capacité d'un Hopfield à synapses bornées [résumé, API ; déjà dans `veille/seen-arxiv.txt:544`, non cité en v1]. Inférence : VEI-2 devient une réplication ciblée de ce résultat, en horizon mémoire et à budget égal.
- Substrat : numpy, minutes. Statut : comparateur de P1bis/P8c, donc « verrou non passé (ADR-0003) » tant que ces préregs n'ont pas de note de lecture ; ADR-0003 non signé (rapport N-16). Source : arXiv:2611.08258 [résumé] (`iVEI` l.65, l.131) ; arXiv:2603.09384. Lignes v2 : NH-01 (243) ; hors catalogue P1bis/P8c.

## Contrôles et tests de harnais (hors comptage des hypothèses)

Deux entrées du paquet (i) de la v1 ne sont pas des hypothèses posables (relectures C, MINEUR 7 et 8 ; X) : elles restent utiles comme préconditions et gardent leur coût.

**BOUBA-N4 — contrôle descriptif : la sonde contiguë à une classe se transmet-elle à ActionSense ?** (précondition de BS-v07 ; pas d'hypothèse, faute de nul)
- Énoncé : une fenêtre contiguë de 64 lignes (6,4 s) tient une seule famille d'activité dans plus de 50 % des tirages `seed + 777`.
- Nul : aucun (mesure descriptive) ; seuil de décision à fixer avant lecture. Réfutation : ≤ 10 % de fenêtres à une classe.
- Substrat : `labels.pt`, macM1, minutes CPU, avant le tag v0.7.1 (lecture des étiquettes seulement). Source : #77 (`iBS` l.101-106). Ligne v2 : BS-v07 (190).

**BB-N1 — test de harnais : la porte de Claim A est un placebo sous AdamW.** (issue attendue par construction : Adam est invariant au changement d'échelle diagonal des gradients, arXiv:1412.6980 ; vérifie le banc, ne teste pas Claim A)
- Énoncé : avec la porte sur le gradient et AdamW, g = 0,5 laisse ‖Δθ‖ à ± 5 % de g = 1 ; une porte appliquée après le pas donne ‖Δθ‖(g) = g·‖Δθ‖(1) à ± 1 %.
- Nul : rapport de pas dans [0,95 ; 1,05]. Contrôle : SGD sans moment (doit donner le rapport g).
- Substrat : CPU sur electron-server (pas GrosMac), minutes. Coût : 4-6 h de code et tests. Décision PI : la porte est reportée après M3 (`ROADMAP.md:128`). Source : B18 du 01/11, arXiv:2610.41130 (`iMKBB` l.100-109). Lignes v2 : BB-01 (193), NH-78 (320).

## Paquet (ii) — posable sous verrou avec calcul (au gel S6 au plus tôt, ou après M3)

**NWML-N1 (+ VEI-6) — usage causal du canal appris par PPO.** *(question centrale de N10-D)*
- Énoncé : sur le jeu asym N10-D, la paire `learned` dépasse `nocomm` appariée par graine **et** dériver les messages entre épisodes ramène le succès au plafond aveugle 1/C.
- Nul : permutation des étiquettes de bras dans chaque graine, avec composante de graine commune ; `nocomm_rep` comme contrôle de bruit. Contrôles : `eng` (borne haute et porte d'apprentissage), `msg_shuffle`, `sym` (fuite) ; test par randomisation conditionnelle sur l'état complet (arXiv:2611.01666, ex-VEI-6) contre les effets de substitution d'ablation.
- Substrat : MLP PPO, JaxMARL v0.2.0 et fork EGG `54eb11c6`, KXKM. Coût : cellules déjà au budget N10-D (240 runs à k = 20) ; ≤ 240 h GPU si ≤ 1 h par run [inférence, TBD-11 ouvert]. Puissance : rapport §4. Source : `iNW` l.53-64 ; Chauhan & Bera arXiv:2609.34373 (appris contre silence apparié, ingénié et cross-play déjà publiés sur 25 graines [résumé] : la nouveauté se réduit au volet (ii), dérangement des messages ; relecture X-M9). Lignes v2 : N10-D (C l.39), NH-32 (274), NH-37 (279).

**NWML-N2 — même test entre substrats hétérogènes (MLP → LIF).**
- Énoncé : avec locuteur MLP et auditeur LifWML (embedding après la dynamique impulsionnelle), les volets (i) et (ii) de NWML-N1 tiennent.
- Nul, contrôles : ceux de NWML-N1, plus une paire MLP→MLP de même graine. Coût : ordre de NWML-N1 par backend ; LIF plus lent [inférence]. Précondition : NWML-N1 conclut A sur substrat homogène. Source : `iNW` l.66-72. Lignes v2 : Claim B (C l.36), NWML-B (133), NWML-FE (143). Reporté après M3.

**NWML-N3 — le succès des paires partielles suit la taille effective du code.**
- Énoncé : le succès de chaque graine `learned` est à ± 0,05 de E[1/(1 + X)] prédit par la partition mesurée du locuteur (M = 1 : 0,25 ; 2 : 0,481 ; 4 : 0,728 ; 8 : 0,900 ; 16 : 1,0).
- Nul : succès indépendant de la partition (≥ 3 graines hors ± 0,10). Contrôle : paire `eng` (1,0).
- Coût : 0 GPU (lecture des messages des runs NWML-N1) ; à enregistrer comme secondaire descriptif avant le gel. Source : arXiv:2410.18806 [résumé] (`iNW` l.74-81). Ligne v2 : N10-D (C l.39).

**DOK-N1 — contenu contre format de la réponse rejouée (suite de H14-A).**
- Énoncé : à jetons de mise à jour égaux, rejouer la question avec la bonne réponse améliore `acc` par rapport à la même question avec une mauvaise réponse de même format, sur graines neuves.
- Nul : μ(D) ≤ 0, inversion de signe appariée calibrée sous H0. Contrôle : `p_ctrl_template` (question seule).
- Substrat : Qwen3.5-4B, RTX 4090 KXKM, graines hors 0-140. Coût : 423 cellules × 177 s ≈ 21 h GPU, ≈ 8 h humaines. Source : `iDOK` l.57-65. Ligne v2 : DOK-H14 (97 ; suite de H14-A, H14-B en attente de #92).

**DOK-N2 — DR-4.L opérationnel, sélection hors échantillon.**
- Énoncé : la configuration sélectionnée dans l'espace inclusif ne fait pas pire, sur graines de confirmation, que P_min sélectionné de même, de plus de δ.
- Nul : μ(D) ≤ −δ (non-infériorité appariée). Contrôle : même grille et mêmes graines de réglage pour les deux espaces.
- Substrat : MLP G4-ter, MLX CPU. Coût : quelques heures CPU (à mesurer), 6 h humaines ; basse priorité. Source : `iDOK` l.67-76. Lignes v2 : DOK-DR4 (62), NH-08 (250).

**DOK-N3 — effet d'ordre des phases parmi les ordres admissibles.**
- Énoncé : sur un substrat où RECOMBINE n'est pas vide, l'ordre des phases admissibles sous [P] change la rétention au-delà du plancher de graine, à budget et histoire égaux.
- Nul : permutation des étiquettes d'ordre dans chaque graine, écart max calibré par simulation. Contrôle : ordre canonique ; porte « RECOMBINE non vide ».
- Substrat : MLP G4-ter ou TTT, electron-server `nice 19`. Coût : 90-360 cellules, < 10 h CPU, 6 h humaines. Source : `iDOK` l.78-86. Lignes v2 : DOK-H14 (97), DOK-CPU (89), DOK-DR2 (59).

**DOK-N4 — RECOMBINE contre le rappel parallèle d'Agliari 2012.**
- Énoncé : dans le régime dilué où la théorie prédit un rappel parallèle, `recombine` retrouve plus de constituants que le nul et échoue là où la théorie prédit l'échec.
- Nul : motifs permutés à charge égale. Précondition : lire Agliari 2012 en entier (résumé seul aujourd'hui).
- Coût : < 2 h CPU, 8 h humaines ; le coût permettrait le paquet (i), l'inventaire recommande après M3. Source : `iDOK` l.88-92. Lignes v2 : C l.32, NH-06 (248), NH-22 (264).

**BOUBA-N2 — phase respiratoire et coupures de scène dans ds000113.**
- Énoncé : la phase respiratoire aux coupures de scène de Forrest Gump n'est pas uniforme (concentration près de l'inspiration).
- Nul : coupures en décalage circulaire, test de Rayleigh. Contrôle : même analyse sur le pouls.
- Substrat : 20 sujets ds000113 phase 1, sans GPU. Coût : ≈ 6 h. Hypothèse neuve, hors cœur du dépôt. Source : 10.1038/s41562-019-0556-z (`iBS` l.87-93). Ligne v2 : aucune ; voisine BS-B2. Reportée après M3.

**BB-N2 — l'écart E1−E0 est porté par la perte de plasticité d'E0.**
- Énoncé : l'écart E1−E0 diminue d'au moins 50 % quand E0 est remplacé par un E0 qui préserve la plasticité, à cadence et balayage appariés.
- Nul : écart inchangé (TOST ± 20 %). Contrôle : E0 apparié (Wu et al.).
- Substrat : MiniGrid SP7, macM1 ou KXKM, 5 graines. Coût : ≈ 2 j-machine après BB-N1. Source : PR baby-brain #291 ; DOI 10.1038/s41586-024-07711-7 (`iMKBB` l.111-119). Lignes v2 : BB-01 (193), NH-87 (329).

**KFR-N4 — le plancher de précision de M5 est un défaut d'évaluation de Q.**
- Énoncé : évaluer Q_h par sommation compensée dans la recherche linéaire certifie au moins 4 des 8 configurations en échec « plancher » (les 4 de la strate γ ≤ 30 et 4 tirées des 11 de la strate γ ≥ 50, `ANALYSIS.md:31,33`), tolérances inchangées.
- Nul : au plus 1 certifiée sur 8. Contrôle : 2 configurations déjà certifiées gardent leurs itérés à 1e-12.
- Substrat : macM3 ou electron-server. Coût : ≈ 5-30 h CPU [inférence], ≈ 6 h humaines ; préreg L1 si > 6 h. Source : `kfr:results/m5_secondary_2026_10_30/ANALYSIS.md:49-57` (`iKFR` l.90-96). Ligne v2 : M5 (C l.42) ; décide le §16 à γ ≥ 10.

**VEI-4 — déclencheur par surprise sur flux contaminé.**
- Énoncé : un déclencheur de DE par surprise absorbe, sur flux contaminé, une fraction de faux ≥ 0,8× celle d'un déclencheur aléatoire à même budget, et une porte par prior la réduit de ≥ 2×.
- Nul : déclencheur aléatoire à budget égal. Contrôle : déclencheur d'horloge.
- Substrat : dream-of-kiki, macM1, heures, après M3. Source : arXiv:2610.39840 [résumé] (`iVEI` l.36, l.133). Lignes v2 : NH-13 (255, fusionnée dans NH-91), NH-07 (249).

## Paquet (iii) — section de la note méthodo plutôt qu'hypothèse

**T-N1 (+ VEI-7) — errata détectés hors de la chaîne.**
- Énoncés : (a) ≥ 70 % des corrections publiques des cinq dépôts sont détectées par relecture externe ou recalcul, pas par un garde de la chaîne ; (b) ≥ 50 % des amendements et errata depuis le 24/10 sont des réparations après données sans déclaration de non-impact vérifiable (taxonomie arXiv:2611.04338).
- Nul : (a) proportion ≤ 0,5 avec unité de compte fixée avant comptage (`paper-methodo-2026:paper/manuscript.md:40`) ; (b) décompte. Contrôle : double codage indépendant à l'aveugle.
- Coût : 3-4 h + ≈ 2 h de lecture, aucun calcul. Seul des trois dont l'issue n'est pas connue d'avance. Source : `iMKBB` l.121-130 ; `iVEI` l.88, l.136. Ligne v2 : C l.51.

**T-N3 — les nuls calibrés changent des verdicts.**
- Énoncé : au moins trois verdicts changent de catégorie quand un nul calibré remplace un nul fixe. Inférence : trois cas candidats sont déjà identifiés (mKNN, Me6, NH-01), donc le résultat est presque connu ; c'est une section descriptive de §3.3, à présenter comme recensement. Coût : 3 h de lecture. Source : `iMKBB` l.141-150. Ligne v2 : C l.37.

**T-N4 — les descriptions de pipeline dérivent du code servi.**
- Énoncé : dans les papiers « système », au moins un module décrit comme actif est neutralisé dans le code servi. Inférence : les cas connus (CAMP, RBD, KnowBias ; porte et rêve-identité de baby-brain) rejettent déjà le nul « 0 cas » ; ce n'est plus un test, c'est un exemple pour §7 de la note. Coût : 4 h de lecture. Source : `iMKBB` l.152-158.

## Collision NH-91 … NH-101 (exposée, non tranchée)

**Faits.**
- Catalogue v2 : NH-91 = « quand dormir » (ex-NH-03 de la spec et de dream-of-kiki), renumérotée par décision PI du 01/11 21:50 (`catalogue-v2.md:24,333`). Le catalogue s'arrête à NH-91.
- Priorités du 30/10 : NH-91 à NH-101 numérotées « à la suite du catalogue (NH-01 à NH-90) » (`2026-10-30-etat-des-lieux/synthese/priorites-hypotheses.md:144`) ; NH-91 = « le rêve algébrique est un recuit thermique » (`:146`), NH-96 = « le canal n'est utilisé que si l'information est privée » (`:179`), NH-100 = DR-3 et classes comparées (`:204`), NH-101 = blocage de grille (`:210`).
- NH-96 est utilisé comme H1 du protocole N10-D (`nerve-wml P100:docs/prereg/n10d/protocol.md:20`) et n'a aucune ligne au catalogue v2 (0 occurrence de NH-92 à NH-99 ; `iNW` l.102).
- Fait : la liste du 30/10 précède la renumérotation de « quand dormir » en NH-91 (décision du 01/11 21:50) ; la collision vient de cet ordre.
- Inférence : un « NH-92 et suivantes » recollisionnerait avec les priorités du 30/10 ; c'est pourquoi les 26 propositions ci-dessus gardent un préfixe de dépôt.

**Règles possibles (pour le PI).**
1. Le catalogue v2 fait foi pour NH-91 (décision du 01/11) ; les onze entrées du 30/10 reçoivent des numéros à partir de NH-102 (NH-91 du 30/10 → NH-102, …, NH-101 → NH-112), avec une table de correspondance dans le catalogue et un renvoi dans le protocole N10-D (NH-96 → NH-107).
2. Les entrées du 30/10 gardent un préfixe daté (`P30-91` … `P30-101`) et n'entrent au catalogue que si elles passent le verrou ; les nouvelles du 06/11 gardent leur préfixe de dépôt jusqu'à leur entrée.
3. Abandon de la numérotation globale : tout identifiant devient `<dépôt>-N<k>` (comme ce refresh), le catalogue ne garde « NH- » que pour NH-01 à NH-91.

Dans les trois cas : un seul registre (le catalogue) attribue les numéros, et aucun document ne crée de « NH- » hors de ce registre.
