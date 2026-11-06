# bouba_sens — refresh du catalogue v2 (2026-11-06, soir)

Dépôt `hypneum-lab/bouba_sens`, clone frais `--depth 300` dans `scratchpad/refresh-hyp/repos/bouba_sens`, `main` = `b9443bb` (2026-11-06 17:28 CET, fusion de #78). Refs des PR brouillons récupérées localement (`pr66`, `pr82`, `pr83`). Lu : PR #66, #75, #76, #78, #81, #82, #83 (corps, commentaires, fichiers) ; issues #69, #70, #72, #74, #77, #79, #80 (corps et commentaires) ; `README.md` (findings F3/F4, errata 8-12), `docs/paper/main.tex` (abstract, §4.5-modal 522-615, §(d) 995-1125, §(e) 1171-1192, erratum ADR-0024 1459-1470), ADR-0019 (184-192, 265-435), ADR-0024, ADR-0026 (350-356), milestone Me6 large-n, amendement diagnostic Me6 (180-269), v0.7 (340-360), note v0.7.1 et brainstorm (#68), journaux `reports/b2_*_20261106/`, JSON `reports/e1_b2_*`. Code lu sans exécution : `world/studyforrest.py:135-155`, `world/ccfilm.py:68-80`, `world/actionsense.py:1-35`, `scripts/spikes/e1_b2_dimensional_mine.py:55-72`, `cli.py:414-420`. Baseline : catalogue v2 (l. 47-48, 169-192, 265, 298, 308-318), inventaire du 01/11, veille thèses du 02/11 (`these-bouba_sens.md`).

Aucun calcul lancé ; seule de l'arithmétique à la main et la lecture de JSON versionnés. Aucun verdict de campagne n'est rendu ici. Le verrou bouba v0.7.1 n'est pas passé.

Abréviations : `bouba/` = racine du clone ; « catalogue » = `.github:docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`.

## 0. Ce qui a changé depuis le 02/11 (faits)

- **Phase 2, `extract_force`** (#72, ouverte 06/11) : l'en-tête est lu sur un TSV BIDS sans en-tête ; canal « ecg » = déclencheur (nul partout après décimation), canal « resp » = pouls ; la respiration n'est jamais lue ; 960/1800 trames non nulles (issue #72, corps). Deux PR brouillons concurrentes la corrigent (#82, #83) ; aucune valeur recalculée, car les tenseurs d'avril sont perdus (#45) et les données publiques donnent 120 trames vision contre 1800 (`bouba/docs/paper/main.tex:525-540`).
- **Phase 1, `_build_force`** (#74, corrigé par #75 fusionnée le 06/11 15:58Z) : 4 colonnes à 100 Hz lues comme 3 à 500 Hz ; « cardiac » = respiration, « resp » = pouls, 9000 trames ≈ 4500 s au lieu de 900 s ; pouls au-dessus de Nyquist (issue #74, corps). Cache régénéré, `force.pt` `890b90ae…` → `d96ad636…`, pics 1,37 Hz et 0,30 Hz, cinq autres tenseurs identiques à l'octet (`bouba/docs/paper/main.tex:1001-1015`).
- **Recalcul B-2** (#81, fusionnée 16:13Z) : moyennes ≈ 0 (Kraskov −0,0002, binning +0,0001, MINE 1-D +2,4e-7, MINE complet −1,3e-4 bit) ; nul apparié p = 0,62 / 0,79 (`main.tex:1028-1060`). **Mais** la sonde contiguë de 512 trames contient une seule classe sur 4 graines sur 5 : B-2 = 0 par construction, contrôle qui ne peut pas échouer (#77 ; `main.tex:1062-1076`).
- **Sonde stratifiée** (#78, fusionnée 16:28Z, amendement ADR-0019 daté avant le run, exploratoire) : 128 trames par classe, mais exactitude du lecteur avant lésion = 0,250 sur 10/10 graines, porte (0,35) échouée partout : **B-2 non mesurable** sur le pont Studyforrest (`main.tex:1110-1124` ; `bouba/reports/e1_b2_dimensional_mine_studyforrest_stratified_{newcache,oldcache}.json`, `n_seeds_gate_pass = 0`).
- **#80** (ouverte) : piste restante, entraîner le lecteur sur des lots stratifiés ; coût estimé ≈ 3 h + 10 graines macM1 + ≈ 1 h.
- **#66** (nul réseau B-3) : un seul commit, inchangé depuis le 2026-11-01 09:31Z ; la relecture croisée Opus + Codex du 31/10 conclut « REVISE, BLOQUANT » (commentaire sur #66 : forme brute garde les effets principaux de requête, composantes partagées entre réplicats, contrôle 2 tautologique, pas de ligne primaire ni de règle de multiplicité).
- **#68** fusionnée le 06/11 06:08Z (note de lecture v0.7.1 v0 + brainstorm) ; **#67** fusionnée le 31/10 (graines 300-304 déjà utilisées le 27/10).

## 1. Lignes du catalogue touchées

Colonnes : identifiant (ligne du catalogue) | statut v2 | **proposition** | nouvel énoncé si reformulé | preuve | effet sur le trimestre.

### 1.1 Lignes qui reposaient sur un canal physio défectueux

Question (1) du brief. Fait : seuls deux ensembles de résultats passent par la physio de ds000113. (a) Le pont **4,5 modalités** (phase 2, `extract_force`, ADR-0012) et toute la chaîne B-1 qui l'utilise (ADR-0013 à 0017, `StudyforrestRealWorld(data_dir=data/sf_phase2_adapted)` : `bouba/docs/adr/0013-dose-response-amedi-curve.md:27`, `0014-compound-lock-gumbel-transducer.md:39`, `0015-gumbel-tau-scan.md:29`, `0016-finer-tau-codebook-freeze.md:34`, `0017-sprint14-retraction-and-schedule.md:198`). (b) Le pont **OpenNeuro phase 1** de §(d) (B-2 E1.3c, `_build_force`). Les mondes gaussien, XOR, sinusoïde, mock, « ECG » MIT-BIH, CC-film (force synthétique) et ActionSense (force = EMG Myo, `bouba/docs/osf/amendment-v0.7-actionsense.md:110`) ne lisent pas cette physio.

Inférence : pour (a), le défaut physio est **probable, non vérifiable** (tenseurs perdus, code inchangé depuis `d7a3645`, issue #72) ; il s'ajoute à trois défauts déjà établis (non reproductible au 28/10, vision = damier de 12 s, régime qui n'apprend pas ADR-0024). Aucun recalcul n'est possible sans reconstruire l'entrée, ce qui serait un changement de méthode (#83, corps). « À recalculer » n'est donc pas une option ouverte : ces lignes se ferment par erratum.

| ID (l.) | statut v2 | proposition | nouvel énoncé / motif | preuve | trimestre |
|---|---|---|---|---|---|
| BS-SF45 (173) | « confirmé (Branch B) », inchangé | **fermer** (clos par erratum) | — B-3 0,1016 / 0,1250, B-1 0/+0,0063, B-2 −0,0376 [−0,056 ; −0,001] « first robustly distinguishable » : historiques, non régénérables, canal force probablement = déclencheur + pouls, régime non apprenant | `main.tex:525-540` (erratum 28/10) ; `main.tex:572-584` et README:304-313 (erratum 10, #72) ; ADR-0024:36-60 ; liste des valeurs à recalculer dans #82 (corps, « Values to recompute ») | 0 h de calcul ; ≈ 0,5 h de texte (main.tex garde « Branch B » et « robustly distinguishable », `main.tex:604-615`) |
| BS-AMEDI (174), BS-COMP (175), BS-TAU (176), BS-CBF (177), BS-S14c (178) | rétracté / réfuté / amendé, inchangé | **fermer** (clos par erratum) | les négatifs eux-mêmes ne sont pas des preuves : même pont, même canal force, même régime | ADR cités ci-dessus ; `main.tex:525-530` (« Sections dose-response–sprint14 ») | 0 h |
| BS-Q3 (185), BS-N12 (186) | rétracté (FINAL) / réfuté | **fermer** (clos par erratum), réserve | même chaîne §5.5 (`bouba/docs/adr/0019-multi-seed-q3-retract.md:15`) ; le monde des graines Q3/N12 n'est pas écrit dans les milestones : **à recouper** avant de l'affirmer | `docs/milestones/q3plus-10seeds-2026-05-11.md:14-20` | 0 h |
| BS-B2 (183) | « nul (confirmé/renforcé) », inchangé | **reformuler** | « B-2 : non-test sur le gaussien et CC-film (régime qui n'apprend pas, ADR-0024 ; estimand glissé, M24) ; **non mesurable** sur le pont Studyforrest (sonde contiguë à une classe, puis porte d'apprentissage 0/10 graines). » Nature : nul → non-test / non mesurable | `main.tex:1062-1076,1110-1124` ; ADR-0019:184-192,405-435 ; ADR-0024:45-48 (« a null of an untrained regime ») ; JSON stratifiés `n_seeds_gate_pass = 0` | retire B-2 du papier « nuls TOST » (voir constat C4) |
| BS-E12 (184) | « réfuté (E1) » | **reformuler** | « E1 (sonde riche) : non concluant — une sonde plus riche ne peut rien révéler dans un canal de codes effondré (ADR-0024) ; sur Studyforrest, non mesurable. » | idem ; `bouba/scripts/spikes/e1_b2_dimensional_mine.py:62-72` (pas d'option `emission`, donc argmax-bridge par défaut, `cli.py:414-420`) | 0 h |
| BS-P128 (188) | amendé (→ N ≳ f(D)) | **reformuler** | « N ≳ f(D) est nécessaire, pas suffisant : la composition de la sonde (effectifs par classe) et celle des lots d'entraînement doivent être rapportées et contrôlées. » | #77 (effectifs `[0,512,0,0]` …) ; #80 | +0,5 h dans v0.7.1 |

Catalogue table C, ligne CC-film/Studyforrest : aucune ligne C ne cite B-2. Les lignes C l. 47 (non-tests B-3) et l. 48 (v0.7) sont traitées en 1.2 et 1.3.

### 1.2 B-3, Me6 et nul apparié (questions 2 et 3)

**Où en est le « nul à calibrer apparié » de la revue du 24/10 ?** Faits. (i) Le nul apparié par item existe et est calibré contre la référence iid (milestone Me6 :73-74 : médiane nulle 0,0164 / 0,0157 à n = 4096 contre 0,0176 iid). (ii) La règle figée 0,02 se déclenche sous H0 avec probabilité 1,000 pour n ≤ 1024 (ADR-0026:350-355) et sur 19 des 20 lignes observées (milestone :75-79). (iii) Sur le gaussien, l'excès sur le nul apparié à n ≥ 256 est une asymétrie fixe par cellule, sans direction partagée entre trios (D3 : S = 0,0183, p = 0,28 ; 0,0126, p = 0,42 ; amendement diagnostic :215-222), apparue surtout après la phase de lésion (D4 :228-248) : « piste C ». (iv) Le réseau de ces grilles n'apprend pas (milestone :31-36). (v) Le nul réseau (#66) est jugé BLOQUANT et n'a pas bougé depuis le 01/11.
Inférence : le nul **apparié par item** est calibré et ne suffit pas ; le nul **par réseau** n'existe pas encore. L'hypothèse B-3 reste posable seulement sous une forme qui réunit quatre préconditions jamais réunies dans une même grille : régime qui apprend (straight-through), lésion effective (`k_steps`), H0 sur les résidus d'interaction (effets principaux de requête retirés), nul dont l'unité échangeable est le réseau.

| ID (l.) | statut v2 | proposition | nouvel énoncé | preuve | trimestre |
|---|---|---|---|---|---|
| BS-B3 (179) | « confirmé (magnitude) », MAJ 31/10 | **reformuler** (et fermer la forme à seuil) | « B-3 (v0.7.1) : sous lésion effective et en régime qui apprend, l'interaction lésion × requête, mesurée sur les résidus (effets principaux de requête retirés), dépasse un nul dont l'unité échangeable est le réseau lésé. » La forme « max \|off-diag\| > 0,02 avec structure de signe » est **close** : règle non informative (taux 1,0 sous H0 à n ≤ 1024) et structure de signe testée sans direction reproductible | ADR-0026:350-355 ; milestone :75-79 ; amendement diagnostic :215-248 ; `inventaires/bouba_sens.md:113-115` (01/11) | la forme reformulée n'a pas de calcul ce trimestre avant le tag v0.7.1 (S10, ROADMAP:107) |
| BS-B3arch (180) | non-test | **garder** | — ; aucun lien avec la physio (monde gaussien) | `run_grid.sh:15,166-175` (inchangé) | 0 |
| BS-NG (181), BS-F123 (182) | réfutés | **garder** | — | — | 0 |
| BS-SNR (189) | confirmé (audit) | **garder** | — ; c'est la précondition « lésion effective » de BS-B3 reformulée | ADR-0020:34-36 | 0 |
| NH-66 (308) | inchangé, « PRÊT » | **reformuler** (moitié close par le run Me6 du 31/10) | « À n ≤ 64, Me6 est dominé par le bruit d'échantillonnage (établi). À grand n, l'excès résiduel est une asymétrie propre à chaque réseau lésé, de signe non reproductible entre trios ; il disparaît si le nul prend le réseau pour unité. » Nature : passe de « recalcul sur checkpoints existants » à « nul réseau » (= #66 révisée) ; reste exploratoire, réseau non apprenant | milestone :46-61 (gaussien n = 4096 : 0,0585 contre 0,0164, p = 5·10⁻⁵ ; la prédiction « < 0,02 à n = 4096 » de NH-66 tient sur le mock, pas sur le gaussien) ; D4 (b) T1 initial 0,0220 contre 0,0186 | se confond avec la révision de #66 (≈ 6 h de texte, voir 1.3) |
| Me6 large-n (hors tables, C/A via l. 179) | « utile, sous verrou » | **geler comme rapport technique** | Me6 large-n a rempli son rôle (test de la statistique et de son nul). Ne pas lancer K1/K3 comme campagne séparée : en faire, au plus, le pilote du nul réseau de v0.7.1. | amendement diagnostic :250-262 (« What a later confirmatory test would need ») ; ROADMAP:24,107,142 | économise la ligne « K1/K3 sur electron-server » de S10 si le PI l'accepte ; sinon inchangé |

Décision à porter au PI (QCM) pour Me6 : (a) H0 **conditionnelle aux réseaux** (transpose flip D2, déjà validé, aucun calcul neuf, mais ne répond pas à « la lésion cause-t-elle l'asymétrie ? ») ; (b) H0 **sur tirages de réseaux** (#66 révisée : R réplicats, forme sur résidus ; pilote 1,8-4,4 h, confirmatoire 4,5-11 h par combinaison, minimum proposé 12,5-31 h, `pr66:docs/prereg/b3-network-null/prereg-draft.md:245-258`) ; (c) geler B-3 après le verrou sans nul réseau. Inférence : (b) est la seule qui garde B-3 comme hypothèse sur la plasticité.

### 1.3 v0.7 ActionSense, v0.8/v0.9, préconditions

| ID (l.) | statut v2 | proposition | nouvel énoncé / ajout | preuve | trimestre |
|---|---|---|---|---|---|
| BS-v07 (190) / table C l. 48 | utile, sous verrou | **reformuler** (préconditions) | Ajouter à la liste v0.7.1 (`brainstorm-2026-11-01.md:175-198`, 14 points) : (15) **composition de la sonde** : effectifs par classe rapportés par cellule ; sonde aléatoire ou stratifiée si une sonde contiguë de 64 fenêtres (6,4 s) tient une seule famille d'activité ; (16) **composition des lots d'entraînement** (même question, lots de 16 contigus) ; (17) **straight-through comme bras primaire** et porte d'apprentissage mesurée sur une sonde équilibrée ; (18) corriger « 300-304 (non utilisées à ce jour) » | `ActionSenseWorld` sert des lots contigus (`bouba/src/bouba_sens/world/actionsense.py:5-6`) ; sonde B-3 = une fenêtre contiguë partagée par les 5 requêtes (`amendment-v0.7-actionsense.md:346-349`) ; #77, #80 | +1 h de rédaction dans les 6 h de l'amendement v0.7.1 (ROADMAP:97) |
| BS-v08 (191), BS-v09 (192) | utile, sous verrou ; reportées | **garder** | — ; héritent des points 15-17 | — | 0 |
| BS-B1 (170), BS-HB1 (171), BS-LOCK (172), BS-OQ1 (169) | réfuté / inchangé | **garder**, avec la qualification ADR-0024 | le statut « réfuté » ne vaut pas preuve contre un écart congénital/tardif dans un agent qui apprend ; aucune dépendance à la physio (le « monde ECG » est MIT-BIH ou le mock, `main.tex:479`) | ADR-0024:41-44 | 0 |
| BS-PAP (187) | rétracté | **garder** | — | — | 0 |

### 1.4 Table B, autres lignes bouba_sens

| ID (l.) | proposition | motif | preuve |
|---|---|---|---|
| NH-67 (309) PID ΔU | **garder**, précondition ajoutée | ΔU suppose un estimand B-2 sur canaux survivants (M24 du 01/11 : la sonde lit l'entrée propre fusionnée) et un régime qui apprend ; sinon ΔU = 0 par construction | `inventaires/bouba_sens.md:114` ; ADR-0024:45-48 |
| NH-68 (310) | **garder** | c'est la seule ligne qui fait de « l'agent n'apprend pas » un objet d'étude ; cohérente avec ADR-0024 | — |
| NH-70 (312) | **reformuler** (précondition) | « sur checkpoints existants » = checkpoints argmax-bridge non apprenants ; remplacer par « checkpoints straight-through dont la porte d'apprentissage est passée » | ADR-0024:56-60 |
| NH-23 (265), NH-56 (298), NH-69 (311), NH-71 (313), NH-72 (314), NH-73 (315), NH-74 (316), NH-75 (317), NH-76 (318) | **garder** | aucune ne dépend de la physio ni des ponts Studyforrest ; veille du 02/11 : contexte seulement (`these-bouba_sens.md:42-43`) | — |

## 2. Nouvelles hypothèses (numérotation provisoire BOUBA-N*)

Réserve de cadrage. Fait : la ROADMAP interdit « nouvel axe ni nouvelle hypothèse hors catalogue » ce trimestre (`.github:docs/ROADMAP.md:190`). Inférence : N1, N3 et N4 sont des préconditions ou des contrôles de lignes existantes (BS-B2, BS-B3, BS-v07), donc compatibles ; N2 est une hypothèse neuve, à poser au catalogue avec le statut « reporté après M3 ».

**Question (4) : lire la respiration change-t-il une prédiction ?** Fait : aucune prédiction cataloguée ne porte sur le contenu du canal force de Studyforrest ; les ponts qui le lisent sont fermés (4,5 modalités) ou non mesurables (phase 1). Fait : les valeurs B-2 sont ≈ 0 avec l'ancien et le nouveau cache (`main.tex:1028-1050`). Inférence : avec ce régime, le canal force ne contribuait rien, défectueux ou non ; la respiration ne change une prédiction que si elle porte de l'information sur l'étiquette de scène (N1).

- **BOUBA-N1 — le canal physio est-il informatif pour l'étiquette ?** (précondition de BS-B2/BS-B3 sur ds000113)
  - Énoncé : sur le cache phase 1 corrigé (`d96ad636…`), l'information mutuelle entre le canal force (cardiaque 1,37 Hz, respiration 0,30 Hz, amplitudes et dérivées) et l'étiquette de scène à 4 classes ne dépasse pas le P95 d'un nul par décalage circulaire de l'étiquette.
  - Nul : décalage circulaire (préserve l'autocorrélation des deux séries), 1000 décalages ≥ 60 s.
  - Contrôle positif : le canal tactile (coupures de scène), qui est une fonction de l'annotation, doit dépasser ce nul.
  - Falsification : I(force ; label) > P99 du nul → la physio est informative (éveil émotionnel, plausible d'après la littérature sur la réponse autonome au film, 10.1016/j.biopsycho.2010.03.010) et le bras « lésion de force » devient un bras actif, pas neutre, dans toute lecture B-3 future sur ce pont.
  - Substrat : tenseurs en cache, sans réseau. Coût : ≈ 1 h de script + minutes CPU (macM1 ou electron-server). Données : cache vu, cette mesure jamais faite ; à déclarer.
  - Lien : BS-B2, BS-B3 (bras force), #80.
- **BOUBA-N2 — phase respiratoire et coupures de scène dans ds000113 phase 1** (neuve, **reportée après M3**)
  - Énoncé : la phase respiratoire au moment des coupures de scène de Forrest Gump n'est pas uniforme (concentration près de l'inspiration).
  - Nul : coupures déplacées par décalage circulaire ; test de Rayleigh contre cette distribution.
  - Contrôle : même analyse sur le pouls (on n'attend aucun verrouillage à l'échelle de 0,7 s).
  - Antériorité : verrouillage de la cognition sur l'inspiration chez l'humain (10.1038/s41562-019-0556-z) ; données : 4 colonnes à 100 Hz, Hanke et al. 2014 (10.1038/sdata.2014.3).
  - Substrat : ds000113 phase 1, 20 sujets ; coût ≈ 6 h (script, téléchargement, analyse), sans GPU.
  - Inférence : c'est une hypothèse de données humaines, hors du cœur de bouba_sens (réseau) ; son intérêt pour le dépôt est de dire si un signal physio réel est aligné sur le récit, condition pour que le canal force soit autre chose qu'un bruit coloré.
- **BOUBA-N3 — pourquoi la porte échoue sur Studyforrest** (reformule la piste de #80)
  - Énoncé : la baisse de perte de phase 1 (1,33-1,40 → 0,87-0,92, sous ln 4) avec une exactitude de 0,250 sur sonde équilibrée vient d'une tête qui suit la classe du lot contigu courant, dans un canal de codes effondré (ADR-0024).
  - Prédictions : (a) argmax-bridge + lots mélangés → perte finale à ±0,03 de ln 4 = 1,386 et exactitude 0,25 ± 0,03 sur 10/10 graines ; (b) straight-through + lots mélangés → porte (≥ 0,35) passée sur ≥ 3/5 graines par cache.
  - Nul : exactitude = taux majoritaire 0,25.
  - Falsification : si (a) passe la porte, ADR-0024 ne s'applique pas à ce pont et l'inférence de #80 suffit ; si (b) échoue, le pont ne permet pas B-2 même en régime qui apprend.
  - Coût : option d'entraînement + tests ≈ 3 h (#80), 2 bras × 10 graines sur macM1 (durée par graine à lire dans `reports/b2_phase1_recompute_20261106/`), lecture ≈ 1 h. Amendement ADR-0019 daté avant run ; exploratoire.
  - Lien : BS-B2, BS-E12, #80 ; nouveauté par rapport à #80 : le bras (b) et la prédiction (a), absents de l'issue.
- **BOUBA-N4 — la pathologie « sonde à une classe » se transmet-elle à ActionSense ?** (précondition de BS-v07)
  - Énoncé : sur le cache ActionSense extrait (5 sujets, 56 321 lignes, classe majoritaire 0,3874, mémoire du 31/10), une fenêtre contiguë de 64 lignes (6,4 s) tient une seule famille d'activité dans plus de 50 % des tirages `seed + 777`.
  - Nul : aucun (mesure descriptive) ; seuil de décision à fixer avant la lecture.
  - Falsification : ≤ 10 % de fenêtres à une classe → le défaut de #77 ne se transmet pas et le point 15 de v0.7.1 devient un rapport, pas un changement de sonde.
  - Coût : minutes CPU sur `labels.pt` (macM1), sans entraînement ; à faire **avant** le tag v0.7.1, sous la note de lecture (lecture des étiquettes seulement, pas de résultat B-3).
  - Lien : BS-v07, M25 du 01/11 (nul par blocs sur-dispersé sous prédicteur constant).

## 3. À fermer

| ID | preuve | ce qu'on peut encore en dire publiquement |
|---|---|---|
| BS-SF45 (et la phrase B-2 « robustly distinguishable », `main.tex:607-615`) | erratum 28/10 (`main.tex:525-540`), erratum 10 / #72, ADR-0024 ; B-3 = 0,1016 = 13/128, sous les médianes nulles appariées mesurées à n = 64 sur les autres mondes (0,1250 gaussien, 0,1406 mock ; milestone :46,50) — comparaison inférée, aucun nul calculé sur ce pont | Rien comme résultat. Publiable seulement dans l'histoire des errata (note méthodo : « un résultat non reproductible, construit sur un canal mal lu, dans un réseau qui n'apprend pas »). |
| BS-AMEDI, BS-COMP, BS-TAU, BS-CBF, BS-S14c (et BS-Q3, BS-N12 sous réserve du monde) | mêmes errata ; chaîne sur `sf_phase2_adapted` (ADR-0013:27 à ADR-0017:198) | Rien comme négatif sur la période critique ; l'histoire de la rétraction (graine unique → 10 graines → p = 0,62) reste un exemple de méthode publiable. |
| BS-B3, forme à seuil 0,02 | ADR-0026:350-355 (taux 1,0 sous H0) ; D3 sans direction reproductible ; non-apprentissage | **Négatif méthodologique publiable** : une règle de seuil sur un max de différences d'exactitude se déclenche sous H0 avec probabilité 1 à n ≤ 1024 ; le plafond 1/128 ; la sur-dispersion du nul par blocs sous prédicteur constant. Antériorité partielle à citer : OpenReview `ts0kgHyBfr` (`these-bouba_sens.md:71-72`, résumé seulement, à recouper). |
| BS-B2 sur le pont Studyforrest (portion « Null ») | #77, #78 ; JSON stratifiés `n_seeds_gate_pass = 0` | **Négatif méthodologique publiable** : « un contrôle qui ne peut pas échouer » (sonde contiguë à une classe), puis porte d'apprentissage échouée sur 10/10 graines ; exemple direct pour la note méthodo (nul calibré, porte avant lecture). |

Rien n'est fermé par lassitude : NH-66 est reformulée (pas fermée) ; Me6 large-n est gelée comme rapport technique, pas déclarée négative.

## 4. Constats nouveaux depuis le 02/11

- **C1 — MAJEUR.** Fait : §(e) et ADR-0019 écrivent « B-2 is Null on the CC-film bridge and on the Gaussian reference world » et que CC-film est le seul pont qui donne « an informative measurement » (`main.tex:1185-1192` ; ADR-0019:184-192 ; README:62,95,211). Fait : aucune porte d'apprentissage n'a été mesurée sur CC-film (grep « accuracy »/« gate » d'ADR-0019 : seulement E1.3c-ter) ; le script E1 construit les `SensoryWML` sans option `emission`, donc en argmax-bridge (`scripts/spikes/e1_b2_dimensional_mine.py:62-72` ; `cli.py:414-420`). Fait : ADR-0024:45-48 qualifie ce nul de « null of an untrained regime ». Inférence : sur CC-film, l'information des codes effondrés avec l'étiquette est nulle avant et après lésion, donc le contrôle ne peut pas échouer non plus ; « informative » est trop fort. Action : aligner §(e), ADR-0019 Decision 4 et README F3/F4 sur ADR-0024 (≈ 0,5 h).
- **C2 — MAJEUR.** Fait : #80 propose des lots d'entraînement stratifiés sans citer ADR-0024 ni l'émission. Inférence : la piste peut échouer pour la raison d'ADR-0024 et non pour celle de #80 ; il faut le bras straight-through (BOUBA-N3) pour départager.
- **C3 — MAJEUR.** Fait : la liste de 14 points de v0.7.1 (`brainstorm-2026-11-01.md:175-198`) et le dessin de la note (`reading-note.md:292-310`) ne mentionnent ni la composition de la sonde ni celle des lots ; `ActionSenseWorld` hérite du service contigu (`world/actionsense.py:5-6`) et la sonde B-3 v1 est une fenêtre contiguë (`amendment-v0.7-actionsense.md:346-349`). Inférence : la leçon de #77/#80 n'est pas encore propagée à la campagne qui attend le verrou. Action : points 15-17 (§1.3) et BOUBA-N4.
- **C4 — MAJEUR.** Fait : la ROADMAP prévoit au Q3 2027 « publication de B-1/B-2 comme nuls (équivalence TOST seulement si marges justifiées) » (`ROADMAP.md:160`) ; issue #24 ouverte (« Publier le nul B-1/B-2 en équivalence »). Inférence : après ADR-0024, #77 et #78, une équivalence TOST sur ces données serait une équivalence dans un régime qui n'apprend pas ; la seule forme publiable est « non-test » ou « non mesurable », dans la note méthodo. Reformuler la ligne Q3 et #24.
- **C5 — MAJEUR (blocage de jalon).** Fait : #66 n'a qu'un commit, inchangé depuis le 01/11 09:31Z, alors que la relecture du 31/10 est BLOQUANT. Inférence : le point 8 de v0.7.1 (contrôle 2 de #66 refait) et l'option (b) du QCM Me6 dépendent d'un brouillon non révisé ; à budgéter avant S7 (amendement v0.7.1, ROADMAP:104).
- **C6 — MINEUR.** Fait : deux PR brouillons concurrentes corrigent #72 : #82 retombe sur la disposition phase 2 avec un avertissement si aucun sidecar, #83 lève une `ValueError` ; elles numérotent l'erratum 10 (mis à jour) et 13 (nouveau). Le PI doit en fermer une.
- **C7 — MINEUR.** Fait : l'erratum 11 dit encore « The reported values have not been recomputed » (`README.md:329`) alors que §(d) est recalculé (`main.tex:1008-1015`, #81).
- **C8 — MINEUR.** Fait : ADR-0019:409 et #80 donnent une exactitude après lésion de 0,365 sur la graine 3 de l'ancien cache ; le run principal donne 0,250 (`reports/b2_stratified_probe_20261106/strat_b2_oldcache.log:5`) et 0,365 vient du rejeu du nul (`strat_null_oldcache.log:5`, `reader_acc_post`). La porte porte sur l'exactitude avant lésion, 0,25 partout : le verdict « non mesurable » ne change pas. Le rejeu non déterministe est déjà déclaré (`main.tex:1119-1121`).
- **C9 — MINEUR.** Fait : `reading-note.md:300-301` et `brainstorm-2026-11-01.md:197` qualifient les graines 300-304 de « non utilisées à ce jour », contre l'erratum #67 (`docs/osf/erratum-2026-10-31-v0.7-seeds.md:1,23` : grille gaussienne du 27/10, graines 300-309).
- **C10 — MINEUR.** Fait : « K1/K3 » n'apparaît dans aucun fichier de bouba_sens (grep vide) ; l'étiquette ne vit que dans `.github` (rapport 01/11 §7 point 9, `README.md:287` ; ROADMAP:24,107,142). Un contradicteur aveugle (#70) ne pourra pas la résoudre ; écrire sa définition dans la note v0.7.1.
- **C11 — OK.** Correctif phase 1 (#75), recalcul (#81) et sonde stratifiée (#78) : amendement ADR-0019 daté avant run, classe « exploratoire » déclarée, journaux et JSON versionnés (`reports/b2_*_20261106/`), deux caches comparés, décision PI tracée (ROADMAP:49,58).
- **C12 — OK.** #72 et #74 distinguent ce qui est établi (tenseurs régénérés) de ce qui est inféré (tenseurs d'avril perdus) ; les textes du papier suivent cette séparation (`main.tex:572-584`).

## 5. Résumé (≤ 250 mots)

Voir le message de retour (identique).
