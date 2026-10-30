# bouba_sens — inventaire critique du 24/10 au 30/10/2026

> Relecture en lecture seule. Clone `scratchpad/repos/bouba_sens`, HEAD `1290a4b` (30/10 14:11, PR #56). Branches des PR lues via `gh api` : PR #9 (`docs/osf-prereg-2026-10`, dernier commit `1ef5085` du 29/10) et PR #55 (`docs/amendment-v0.7`). Aucun calcul n'a été lancé. Les ordres de grandeur du §3 sont de l'arithmétique faite à la main sur des chiffres déjà publiés dans le dépôt. Les chemins sont relatifs à la racine du dépôt. `PR9:` et `PR55:` désignent un fichier de la branche de ces PR.
>
> **Écarts constatés avec les notes de départ.** (a) ADR-0022 ne classe pas B-3 en « non calibré ». Il fait passer le monde gaussien à « calibré : compatible avec le nul », et la formulation finale est celle d'ADR-0023 et ADR-0024 (`docs/adr/0022-me6-paired-null.md:274-277`, `docs/adr/0023-b3-probe-v2.md:168-177`). (b) La phrase « mock 0,31 / ECG 0,45 > P99 ≈ 0,30 » n'est pas soutenue par le dépôt. La médiane mock vaut 0,3047 ; elle est rejetée par le nul par blocs de 8 (p = 1·10⁻⁴), mais pas par blocs de 16 (p = 0,06) ni de 32 (P99 0,3203, p = 0,31). La grille ECG n'a pas été recalculée (`docs/adr/0022-me6-paired-null.md:189-195, 242-252`). (c) ActionSense ne fait pas partie de la PR #9. Elle est dans la PR #55, qui garde le numéro v0.7 et renvoie le brouillon TOST de la PR #9 en v0.8. (d) Aucune trace dans le dépôt de « nuls Me6 calibrés acceptés sur KXKM CPU » : non vérifiable. (e) Point nouveau : la passe rev. D sur CC-film (29/10) échoue elle aussi.

## 1. État des lieux

**Fait (sur `main`)**
- **ADR-0021**, nul iid de Me6 (PR #19, 25/10). P(B-3 passe | H0) = 1,0000 pour n ∈ {64, 256}, et pour n = 1024 sauf p = 0,9 (0,9993). Le seuil 0,02 ne rejoint le P99 que vers n ≈ 4096 (`docs/adr/0021-me6-null-calibration.md:136-175`). OK.
- **ADR-0022**, nul apparié par inversion de signe (PR #28 et #40, 25/10). Gaussien : 0,1562 contre une moyenne nulle de 0,1409, p = 0,17, exactitude 0,254. Mock : le verdict dépend de la longueur des blocs (`:136-227`).
- **ADR-0023**, sonde v2 : lecture linéaire de l'état caché de chaque modalité. Préreg taguée `prereg-b3-probe-v2-20261025` (`1d96a65`, 25/10 19:14). Les grilles confirmatoires (graines 200–204) rejettent la symétrie avec p = 5·10⁻⁵ sur les deux mondes. Le H0 est ensuite déclaré mal posé : le rejet vient entièrement de l'effet principal de la modalité interrogée (`:202-239`).
- **Diagnostic d'effondrement** (PR #42) et **ADR-0024**, erratum accepté le 26/10 : avec les réglages par défaut, le réseau n'apprend pas. La perte reste à ln 4. Cela couvre **tous** les résultats publiés depuis avril (`docs/adr/0024-erratum-default-regime-does-not-learn.md:10-60`).
- **Émission straight-through** en option (`4e1dffc`). Le critère du pilote est figé avant le pilote (`b89b9f4`). Le gaussien apprend (perte 0,993) ; le mock échoue de 0,0006 (1,3006) et la règle est appliquée telle quelle (`docs/prereg/2026-10-27-emission-pilot-result.md:8-16`).
- **Test d'interaction lésion × modalité interrogée**, tagué `prereg-b3-lesion-interaction-20261027` (`37810b5`, 27/10 03:48 UTC). Gaussien, graines 300–309 : S = 3,90·10⁻⁴, p = 0,494, verdict « compatible avec l'absence d'interaction » (`docs/milestones/2026-10-27-b3-lesion-interaction-results.md:25-35`). Formulation finale de B-3 dans `README.md:60`.
- **Piste Studyforrest réelle close** (PR #47, issue #45). Les tenseurs d'avril sont perdus. Les 17 blocs réels sont déclarés non reproductibles.
- **ActionSense** : spec (#46), monde (#48), pilote S00 run 1 (#50), ajustement d'horloge audio (#51), run 2 (#53), test nul du contrôle 3 avec p = 0,012 (#54), règles de seuil et famille « jar » (#56, `1290a4b`).

**En cours ou bloqué**
- **PR #55**, amendement v0.7 ActionSense, brouillon. Il attend trois choses : la signature du PI, le commit d'extraction postérieur au correctif de #52, et les sha256 de S02–S05 (`PR55:docs/osf/amendment-v0.7-actionsense.md:521-528`).
- **Issue #52**, ouverte. Un seul blocage isolé de l'enregistreur fait rejeter tout un segment audio. C'est le prérequis de l'extraction des 5 sujets.
- **PR #9**, brouillon depuis le 23/10, 94 commits, renumérotation à faire.
  - v0.8 subspace : **retirée** le 29/10 à 06:10 après les rev. A, B et C (`PR9:docs/osf/pilot-report-2026-10-25.md:623-635`).
  - v0.9 : la porte d'apprentissage échoue en rev. B, C et D. La rev. D CC-film à 1 800–2 000 pas reste bloquée sur un plateau à un bit. La rev. D Studyforrest **n'a pas tourné** parce que macM1 est pris par N10-C (`PR9:…revc-2026-10-28.md:752-807`).
  - Brouillon TOST (v0.7, à renommer v0.8) : N = 150, graines 4001–4150, quatre rondes de pilote B-2. Rien de confirmatoire n'a tourné.
- **Issues ouvertes** : #36, #37, #38, #45 (phase 0), #23, #24, #29–#32, #1.

**Décisions du PI en attente**
- Signer v0.7 ActionSense.
- Trancher v0.9 : arrêter, changer d'architecture, ou exclure les graines effondrées.
- Choisir l'hôte de la rev. D Studyforrest.
- Choisir la longueur de bloc du mock, et décider si l'on fait l'ECG.
- Décider du sort du brouillon TOST après ADR-0024.

**Où tourne le calcul**
- Grilles B-3, nuls et diagnostics : electron-server (ES).
- Pilotes de la PR #9 et ActionSense : macM1, actuellement occupé par N10-C (22 jours).
- Aucun calcul bouba_sens n'est actif d'après le dépôt.

## 2. Relecture critique

### BLOQUANT

**B1. Depuis le 24/10, les « lésions » ne lèsent presque rien, et toute la conclusion « aucun effet de lésion » de B-3 repose dessus.**
- `run_grid_probe_v2.sh:73-76` et `run_grid.sh:127-140` (main) ne passent jamais `--k-steps`. Le défaut reste k = 5000 (`src/bouba_sens/cli.py:388`, `src/bouba_sens/lesion.py:41-57`).
- Avec 100 pas de lésion, le SNR final vaut 20 − 40 × 99/5000 = **19,2 dB** pour la cellule « floor ». Le bruit représente environ 1,2 % de la puissance du signal. C'est exactement ce que constatait ADR-0020, que ni `docs/prereg/2026-10-26-b3-lesion-interaction.md`, ni ADR-0023, ni le jalon du 27/10 ne citent.
- **Le contrôle de manipulation est disponible dans le dépôt et il échoue.** Dans `reports/b3_lesion_interaction_gaussian.json`, sur la diagonale (la modalité interrogée est la modalité lésée), le décodage n'est pas dégradé :

  | | lésée | autres |
  |---|---:|---:|
  | audio | 0,660 | 0,66 |
  | vision | 0,655 | 0,68 |
  | tactile | 0,623 | 0,61 |
  | gravité | 0,285 | 0,28 |
  | force | 0,331 | 0,33 |

- La formulation finale « aucun effet de lésion n'est détecté » (`README.md:60`, `docs/adr/0023-b3-probe-v2.md:175-177`) tire donc une conclusion d'un dispositif où la lésion n'agit pas. Elle doit devenir : « **non concluant, lésion non effective (SNR ≥ 19 dB)** ».
- `K_STEPS` n'existe que sur la branche de la PR #9 (`PR9:scripts/run_grid.sh:36,146`), où la rampe atteint bien −20 dB au pas 50.

**B2. v0.7 ActionSense (PR #55) reproduit le même défaut, et plusieurs règles se contredisent.**
- Les commandes figées dans `PR55:…:366-381` n'ont pas de `K_STEPS`, et le `run_grid.sh` de main ne le connaît pas. Les 600 cellules seraient lésées à environ 19 dB.
- Il n'y a **ni porte d'apprentissage ni contrôle positif**, alors qu'ADR-0024 l'exige (« Any new reading … needs a regime that learns, shown by a preregistered criterion », `docs/adr/0024…md:65-66`). La perte de phase 1 n'est que descriptive (`PR55:…:457-460`).
- La règle de décision se contredit :
  - `PR55:…:437` : « PASS if the grid median is **greater than or equal to** its threshold » ;
  - `:405-414` et la décision 5 du PI : « > strict » ;
  - `aggregate_grid.py:208-220` code « > ».
  - `README.md:87-88` écrit aussi « ≥ ».
- `PR55:…:346-350` décrit encore une sonde B-3 de 64 items avec `seed + 777`, alors que la décision 2 du PI désigne la v2 (256 items, une graine par trio) comme sonde primaire.
- À corriger avant toute signature.

**B3. Le brouillon TOST (PR #9) porte sur un régime qui n'apprend pas.**
- Les quatre rondes du pilote B-2 tournent avec l'émission par défaut. Le texte ne cite ni ADR-0024 ni straight-through (grep vide sur `PR9:docs/osf/amendment-v0.7-tost-equivalence-2026-10-23.md`, modifié pour la dernière fois le 28/10, donc **après** l'erratum).
- Une équivalence à ±0,05 bit sur un canal de code effondré est garantie d'avance. Elle ne dit rien de la plasticité.
- La loi de planification de B-1 (Q3/Q3+) vient du même régime : Me7 y vaut presque toujours 0 au quantum 0,00625, d'où P(E-1) = 1,000 « all centres 0 » (`PR9:reports/pilots/v07_b1_robust_power_n150.json`).
- Tel quel, ce texte ne doit pas être déposé.

### MAJEUR

**M1. Le chemin bifurquant du TOST.** Il y a eu quatre rondes sur les mêmes graines (1101–1105, puis l'espace de noms 7201). Après avoir vu les données, le design a changé : lecture dure → Gumbel → Gumbel K = 8 ; sonde → multi-fenêtres équilibrée ; moyenne → TOST robuste de Hodges–Lehmann (HL) ; N 95 → 150 ; ajout de l'issue E-2s (`PR9:pilot-report…:7-17, 139-246`). Tout est déclaré, et c'est à porter au crédit du dépôt. Mais **le passage à HL a lieu quand la queue « switch » (1 graine sur 5 à +0,63 bit) rend la TOST sur la moyenne impossible** : puissance ≈ 0 en ronde 3. Le choix de la statistique est donc dicté par sa capacité à conclure à l'équivalence.

**M2. La TOST robuste efface le seul signal observé.**
- Au N = 150 prévu, supposons 10 % de graines à +0,6 bit. Environ 19 % des moyennes de Walsh contiennent une graine « switch ». L'estimateur HL ne se déplace alors que d'environ +0,005 bit, et l'équivalence est déclarée.
- Le test de signe de sensibilité conclut à l'équivalence dans **77 %** des cas quand la pseudo-médiane vaut −0,05, soit exactement la borne (`PR9:reports/pilots/v07_sign_power_r4_n150.json`). Comme analyse de sensibilité, il n'est pas valide.
- Détail : une puissance « exacte » de 1,0000000000000153 > 1 apparaît dans `v07_b2_pilot_r4_derived_n150.json` (arrondi numérique, MINEUR).

**M3. Pour B-3, l'amendement ActionSense préenregistre un H0 qu'on sait déjà mal posé.**
- `PR55:…:440-452` reprend la symétrie de E[P] d'ADR-0022 et reconnaît qu'un rejet « n'est pas lu comme un effet de lésion ». Sur ActionSense, les modalités n'ont pas la même informativité : le rejet est quasi certain, et il ne veut rien dire.
- Le seul test qui pose la bonne question est l'interaction de `docs/prereg/2026-10-26-b3-lesion-interaction.md`, et il est absent.
- Le seuil 0,02 décide toujours le verdict formel. Or ADR-0021 donne P(passe | H0) = 1 à n = 256. Cela contredit l'issue #23 et la ROADMAP (« aucun dépôt sans nul calibré »). PID et contrôle positif bouba/kiki, demandés en #23, sont absents.

**M4. Sur ActionSense, le monde rend les sondes dégénérées.**
- `StudyforrestRealWorld.sample_with_indices` (`src/bouba_sens/world/studyforrest.py:135-140`), dont ActionSense hérite (`world/actionsense.py:20`), tire **une fenêtre contiguë**.
- Les segments de S00 durent 25 à 40 s (`docs/pilot/actionsense-s00-run2.md:269`). Les fenêtres font 1,6 s pour un lot d'entraînement, 6,4 s pour la sonde v1, 51,2 s pour le pool v2 et 25,6 s pour le test v2. Elles couvrent le plus souvent une ou deux classes.
- `linear_probe._fit_predict` renvoie la classe unique si le pool n'en a qu'une (`src/bouba_sens/linear_probe.py:66-69`), ce qui donne une exactitude de 0 ou 1.
- La validation croisée `KFold(shuffle=True)` sur des trames autocorrélées (`:109`) fuit d'un pli à l'autre.
- Il n'y a **aucune séparation entraînement/test** du monde : la sonde évalue des trames vues pendant l'entraînement.
- Le test fumée l'annonce déjà : me1 = 0,0 et me1_probe = 0,0 (`docs/pilot/actionsense-s00-run2.md:235-237`). La PR #9 avait rencontré le même problème (« single-label on 3 of 5 seeds ») et l'avait corrigé par une sonde multi-fenêtres équilibrée. ActionSense ne reprend pas ce correctif.

**M5. B-1 est confondu avec le budget d'entraînement.** T1 saute la phase 1 (`cli.py:381, 457, 507`) et ne s'entraîne que 100 pas ; T2 en fait 300. Dans un régime qui apprend (straight-through), Me7 = Me1(T1) − Me1(T2) est donc négatif par construction. Les grilles straight-through d'ActionSense ne peuvent pas tester B-1 tel qu'il est énoncé.

**M6. v0.9 : la tâche est construite à partir des entrées.**
- Studyforrest : y = 2a + b. Le bit a est le drapeau de narration, récupéré par moindres carrés à partir du proxy audio, lui-même construit depuis les annotations. Le bit b est le signe d'une colonne de force (`PR9:…revc…:237-260`). La « fusion » consiste à recombiner deux traits fournis tels quels.
- La lignée Studyforrest réelle est déclarée non reproductible (#45, #47). Le cache ds000113 à 9 000 trames (`PR9:pilot-report…:40-52`) a des sha256, mais je n'ai pas vérifié qu'on peut le reconstruire.
- Résultat du pilote : la porte d'apprentissage échoue en rev. B, C et D, avec un plateau à un bit, des pics transitoires (graine 3212 : 0,88 puis 0,46) et des effondrements (3214, 3207).

**M7. Le contrôle 3 d'ActionSense (synchronisation) est peu probant.**
- La règle du nul a été fixée **après** que S_obs = 0,063 a été vu au contrôle 3.
- Le creux de −0,106 à +400 ms (|r| maximal) et la valeur 0,056 à +1000 ms suggèrent une structure périodique du geste de découpe. Elle est compatible avec un décalage de plusieurs centaines de millisecondes.
- La vision n'a aucun contrôle de synchronisation, et un seul sujet est examiné (`docs/pilot/actionsense-s00-run2.md:184-215, 266-288`).

**M8. Le correctif proposé pour #52 laisse des trames décalées.** Avec une porte au p99, un blocage de 7 blocs sur environ 84 000 passe inaperçu : les trames du blocage restent décalées d'environ 0,3 s. Il faut aussi masquer localement les résidus, comme le prévoit le test proposé dans #52 (« seules les trames du blocage sont écartées »), alors que `PR55:…:228-232` présente les deux options comme équivalentes.

### MINEUR

- **Numérotation en collision.** ADR-0023 et 0024 sont pris sur main. Le brouillon TOST les réserve aussi (`PR9:…tost…:11`), et ActionSense réserve ADR-0025. C'est la même dérive que les sept doublons signalés le 24/10.
- `.zenodo.json` est arrêté au 25/10 : il ne mentionne ni ADR-0022, ni 0023, ni 0024.
- Le test secondaire par permutation des items rejette « aucun effet de lésion » (p = 1·10⁻⁴). Ce rejet s'explique correctement par la variabilité d'un run à l'autre (`…results.md:43-51`).

### OK

- L'erratum ADR-0024 est d'une portée exemplaire.
- Le critère du pilote d'émission est figé avant le pilote et appliqué à 0,0006 près.
- Les tags sont posés avant les grilles confirmatoires, et les horodatages sont vérifiés (tag 19:14, pilote, blocs committés à 20:32:53, grille lancée à 20:32:58).
- Le test d'interaction utilise un nul exact par inversion de signe au niveau graine (1 024 motifs) : l'unité statistique est correcte.
- Les nuls de Me6 sont correctement codés : contrôle croisé avec `aggregate_grid` à l'identique.

## 3. Analyses

- **Lésion effective.** SNR au pas 99 avec k = 5000 : 19,21 / 19,41 / 19,80 dB. Le bruit vaut 0,95 à 1,2 % de la puissance du signal, soit environ 11 % en amplitude. Avec k = 50, il faut monter à 1–100× la puissance du signal pour parler d'une vraie lésion.
- **Sensibilité du test d'interaction.** Moyenne nulle de S = 4,1·10⁻⁴ sur 20 cellules, soit un résidu RMS par cellule d'environ 0,0045. Le test détecterait une interaction de l'ordre de **0,01–0,015** en exactitude. Sa puissance n'est donc pas en cause ; c'est la manipulation qui manque.
- **Puissance de E-2 à N = 150** (bornes ±0,05, α = 0,05, t critique ≈ 1,655) :
  - Loi de la ronde 4 sans queue (σ_UCL80 = 0,0372) : erreur type 0,0030, marge 0,045, soit environ 15σ. Puissance ≈ 1 à μ = 0 et ≈ 1 à μ = −0,02 (8σ). Le dépôt annonce 1,000. **N = 150 est surdimensionné d'environ ×15** : le JSON donne N₀,₈₀ = 7 à 11.
  - Loi avec une proportion p_s de graines « switch » à +0,6 bit, TOST sur la moyenne :
    - μ = 0,6·p_s ;
    - à p_s = 0,05 : μ ≈ 0,03, σ ≈ 0,14, erreur type 0,0114, marge 0,031, puissance ≈ 0,5 ;
    - à p_s ≥ 0,08 : puissance ≈ 0, quel que soit N.
  - L'estimation pilote de p_s (un switch post-lésion sur 10 graines toutes rondes confondues) est compatible avec 0,3 % à 45 %.
  - **Ce qu'on peut trancher :** l'équivalence robuste (HL) passera presque sûrement ; l'équivalence sur la moyenne dépend entièrement de p_s ; l'issue E-2s (proportion de switch) est la seule qui porte de l'information.
- **B-3, seuil 0,02.** Il ne sépare signal et nul qu'à n ≈ 4096 items par entrée (ADR-0021), soit environ 64 fois la sonde v1 et 16 fois la sonde v2.
- **Coût d'ActionSense.** 600 cellules à environ 30 s chacune sur ES inactif, soit 5 h en série et environ 1,3 h à 4 en parallèle. Le calcul n'est pas le goulot. Le goulot est l'espace disque : 37,5 Go de données brutes pour S00, donc environ 150 à 190 Go pour 5 sujets, à rapprocher des 63 Go libres sur macM1 (d'après les notes infra, non vérifié dans le dépôt).

## 4. Suppositions non testées et explications plus simples

1. **« La lésion agit sur le réseau. »** Fausse au SNR employé (B1). C'est l'explication la plus simple de tous les nuls « pas d'effet de lésion » obtenus depuis le 24/10.
2. **« La sonde v2 voit l'effet d'une lésion. »** Elle relit des traits figés sur des entrées propres. Un encodeur non entraîné atteint déjà une marge de 0,26–0,29 (`reports/b3_lesion_interaction_gaussian.json`, `untrained_reference…`). Le plancher dû aux traits aléatoires masque toute perte modérée. C'est un défaut de sonde possible.
3. **« Le réseau en straight-through apprend. »** Seulement en partie :
   - Gaussien : Me1 = 0,467, alors qu'un label défini par le signe se décode presque parfaitement ;
   - v0.8 rev. C : 6 graines sur 10 au hasard ;
   - CC-film : plateau à un bit.
   Le facteur limitant est la **capacité du canal de code** (1 à 8 codes actifs) et sa stabilité, pas la plasticité. Avant d'interpréter B-1, B-2 ou B-3, il faut un plafond de référence : un réseau sans goulot discret, entraîné de la même façon.
4. **« Les deux bits de v0.9 réclament une fusion. »** Chacun est lisible à 0,97–1,0 sur sa propre modalité. La tâche mesure la capacité de la tête à les combiner, non une intégration multimodale.
5. **« Les 3 niveaux de SNR sont trois conditions. »** Ce sont des quasi-réplicats (ADR-0020). Les « 30 trios » valent environ 10 unités indépendantes au plus.
6. **« Les trames d'ActionSense sont échangeables. »** Faux : fenêtres contiguës, normalisation par sujet, sujet et session confondus avec la répartition des activités. Ce qui ressemble à une asymétrie peut n'être que du rythme d'activité.
7. **« Les seuils de 2026-04 restent pertinents. »** Ils ont été calibrés sans nul et sur un système qui n'apprend pas. Les garder « gelés » protège contre le p-hacking, mais rend les verdicts formels non informatifs.

## 5. Utilité hors labo, et ce qu'il faut arrêter

**Ce qui est utile hors labo** : (1) le diagnostic d'effondrement (argmax + pont 1e-6 + Adam invariant d'échelle, contrôle SGD), note d'atelier générale pour les goulots discrets (VQ, Gumbel, PSK) ; (2) les nuls de Me6 (« max puis médiane » sur exactitudes binomiales, nul apparié ou par blocs), matière de la note méthodologique S11 ; (3) la chaîne d'extraction ActionSense (horloge par morceaux, nul par décalage circulaire), publiable après #52 ; (4) la culture d'errata (ADR-0024) comme cas d'étude.

**À arrêter ou à geler**
- **v0.8 subspace** : déjà retirée. OK.
- **Brouillon TOST** : à arrêter dans sa forme actuelle (B3). Il ne vaut la peine d'être réécrit que dans un régime qui apprend, avec E-2s en critère primaire et une TOST sur la moyenne, ou bien il faut abandonner l'équivalence. Publier B-1/B-2 comme « nuls d'un régime non apprenant » sans TOST est plus honnête et moins coûteux.
- **v0.9** : **geler**. Trois passes ont échoué (B, C, D). Le blocage vient de l'architecture (voie fusionnée instable), pas du budget. Tant qu'un réseau ne franchit pas la porte d'apprentissage sur le gaussien avec plus de 4 graines sur 5, aucun pilote supplémentaire ne se justifie, et surtout pas sur macM1 pendant N10-C. Studyforrest ne doit pas devenir le monde primaire après coup (« swap primary ») : ce serait un chemin bifurquant.
- **B-3 au seuil 0,02 (v1 comme v2 « symétrie »)** : à arrêter définitivement comme verdict. Ne garder que le test d'interaction, avec trois conditions : `K_STEPS` qui atteint réellement le plancher, la diagonale comme contrôle de manipulation préenregistré, et un plancher de traits aléatoires soustrait. La formulation finale de B-3 dans `README.md:60` doit être corrigée en « non concluant, lésion non effective ».
- **v0.7 ActionSense** : **ne pas signer en l'état.** Six corrections minimales :
  1. ajouter `K_STEPS=50` (et la prise en charge de `K_STEPS` dans `run_grid.sh` sur main) ;
  2. ajouter une porte d'apprentissage et un contrôle positif v2 ;
  3. utiliser une sonde multi-fenêtres équilibrée par classe ;
  4. remplacer B-3 « symétrie » par le test d'interaction ;
  5. aligner `:437` sur « > » ;
  6. retirer les deux grilles argmax-bridge, dont on sait qu'elles n'apprennent pas, ou les déclarer descriptives.

  Sans ces corrections, les 600 cellules produiront des verdicts déterminés d'avance : B-1 FAIL par confusion avec le budget, B-3 v2 « asymétrie » due à l'effet de modalité, et lésion nulle.

## Résumé

1. **BLOQUANT, lésion non effective.** Aucune grille récente ne passe `--k-steps`. Avec k = 5000 et 100 pas, le SNR reste à environ 19 dB (`scripts/run_grid_probe_v2.sh:73-76`, `src/bouba_sens/cli.py:388`). Sur la diagonale de `reports/b3_lesion_interaction_gaussian.json`, la modalité lésée n'est pas dégradée. La formulation finale de B-3, « aucun effet de lésion » (`README.md:60`), doit devenir « non concluant ».
2. **BLOQUANT, v0.7 ActionSense (PR #55).** Il manque `K_STEPS`, la porte d'apprentissage et le contrôle positif. La règle « ≥ » de `PR55:…:437` contredit le « > » de `aggregate_grid.py:208-220`. La description de la sonde est périmée (`:346-350`).
3. **BLOQUANT, brouillon TOST (PR #9).** Il a été pensé et piloté dans le régime qui n'apprend pas, sans citer ADR-0024. Le passage à HL a été décidé après qu'une queue « switch » est apparue, et HL efface ce signal. Le test de signe conclut à l'équivalence dans 77 % des cas à la borne. N = 150 est environ 15 fois trop grand.
4. **MAJEUR, sondes ActionSense dégénérées.** Fenêtres contiguës de 1,6 à 51 s pour des segments de 25 à 40 s, pool d'une seule classe, aucune séparation entraînement/test (`world/studyforrest.py:135-140`, `linear_probe.py:66-69`). B-1 est confondu avec le budget (T1 : 100 pas, T2 : 300).
5. **MAJEUR, v0.9 à geler.** La porte d'apprentissage échoue en rev. B, C et D (plateau à un bit, effondrements). La tâche y = 2a + b est construite à partir des entrées. Le correctif proposé pour #52 (porte au p99) laisse des trames décalées d'environ 0,3 s.
