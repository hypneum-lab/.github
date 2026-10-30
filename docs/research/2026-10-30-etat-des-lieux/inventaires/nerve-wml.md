# nerve-wml — inventaire critique 24/10 → 30/10/2026

Relecteur : agent (lecture seule, aucun calcul, aucun SSH). Clone : `repos/nerve-wml`, HEAD `99a7cf4` (merge PR #89, 29/10). Branches non fusionnées lues via `gh api` : #86 (`af97feb`), #87 (`b2e7979`), #90 (`7887f41`). Base de comparaison : HEAD de la revue du 24/10, `c6c65d3`. Ce qui figure déjà dans `docs/research/2026-10-24-revue-hypotheses/` (puissance 4–35 %, hôte et graine confondus, builds Procgen non bit-identiques, N-3, W-5 fantôme) n'est pas répété, sauf quand un fait nouveau le modifie.

Échelle : **BLOQUANT** (invalide la lecture prévue), **MAJEUR** (à corriger avant toute diffusion), **MINEUR**, **OK**.

---

## 1. État des lieux

### Fait (vérifié dans le dépôt)

| Date | Objet | Preuve |
|---|---|---|
| 24/10 | Gel N10-C n°1, tag `n10c-freeze-20261024` → `2ce4214` | tag annoté, SHA du manifeste `1bddf9ca…` |
| 25/10 08:50 | **Campagne n°1 arrêtée après lecture des résultats** (déviation déclarée) : `registered-eng-s73` R=0,005, `registered-gtm-s0` R=0,0 ; tronc IMPALA mort (ReLU), 4 runs exclus | `docs/milestones/n10c-…-amendment-2026-10-25.md:12-36` |
| 25/10 | Correctif C retenu (pièce propre +0,5, tronc pré-entraîné, Adam eps 1e-5, masque des agents finis, garde de vivacité avec un redémarrage). Porte d'apprenabilité : C PASS sur 9101 et 9102 | idem `:38-157` |
| 25–26/10 | Étude Adam (correction de biais) : 3 graines × 2 bras à 1M + 2 runs à 10M. **Décision : pas de correction de biais** | idem `:168-193` |
| 25/10 | PR #80 : bras N10-C-bis (`gtm_mis`, `eng_gtmrx`, `gtm_warm`, `vq`) codés. Porte : 3/4 PASS d'emblée ; `vq` en échec (effondrement du tronc), corrigé par un stop-gradient (`1595375`), relancé, PASS | `docs/milestones/2026-10-25-n10c-bis-control-arms.md:296-318` |
| 27/10 | PR #72 fusionnée (`ddbe517`) | `git log` |
| 28/10 | Plan de gel ; 16 troncs pré-entraînés avant le gel et épinglés | `n10c-freeze-plan-2026-10-28.md`, `manifest/stage2-manifest-fixc.md:160-178` |
| 29/10 06:19 | **Gel n°2, tag `n10c-freeze-20261029` → `99a7cf4`**, SHA du manifeste `68539232…`, **recalculé et conforme** | `git show tag:…/stage2-manifest-fixc.md \| shasum` |
| 25/10 | NH-01 pilote : préreg L1 taguée 08:40 UTC (SHA `b1ccbb63…` conforme), run 08:51 UTC, verdict « confirmé ». PR #81 fusionnée | `docs/results/2026-10-25-nh01-pilot.md`, `results/nh01/` |
| 25/10 | PR #73 « phase 0 vérité » : errata N-3 et Paper 1 (15/15 → 19/20, N=4, Transformer, Loihi, bylines) | `docs/superpowers/research/2026-10-25-phase0-truth-errata.md` |

### En cours ou en brouillon

- **N10-C campagne n°2** : rien de cette campagne n'est versionné, pas d'`attempts.jsonl`, pas de `run.json`. **Non vérifiable depuis le dépôt** : « registered-gtm-s0 fini à 50M, succès 0,96 », « closed-gtm-s0 en cours », « KXKM attend E1-small ». Le plan prévoit environ 22,4 j sur macM1 et 3,5 j d'E1-small puis 17,6 j sur KXKM (`n10c-freeze-plan-2026-10-28.md:84-97`), soit une fin vers le **20–21/11**. La ROADMAP (S4) disait « ≈ 15 nov » : elle est périmée.
- **SWHID du tag 29/10** : absent du dépôt (aucune occurrence de `swh:1:` hors gabarits). Le lanceur l'exige (`campaign/README.md:178`). Soit le SWHID existe ailleurs, soit le lancement a contourné l'exigence. À vérifier.
- **OSF** : « to follow » pour N10-C (`amendment-2026-10-25.md:3`). Aucun dépôt.
- **NH-01** : #86 (confirmatoire N=1000, 3,86×), #87 (motifs corrélés, empilé sur #86) et #90 (balayage N=1000–4000, brouillon non tagué). Tous trois **ouverts en brouillon**. Tags `prereg-nh01-confirmatory-20261025` et `prereg-nh01-correlated-20261027` cités, absents du clone (depth 200), donc non vérifiés. Les « 4 MAJEUR Codex » ne figurent ni dans les PR, ni dans les revues, ni dans les commentaires GitHub : **non vérifiables**.
- **N10-C-bis** : non gelé. Le gel attend celui de N10-C (fait), le manifeste `stage2-manifest-bis.md` (pas d'écrivain, `freeze-plan:97`) et des runs smoke sous fix C. L'échéance « gel avant le 6 nov » (issue #62) reste atteignable. En revanche, le **démarrage sur KXKM est sérialisé après l'entraînement N10-C KXKM**, donc vers le 20/11, avec une durée d'environ 21 j, soit une fin vers mi-décembre. La ROADMAP (S3 « ≈ 7 nov ») est **périmée de 2 semaines**.

### Décisions PI en attente

1. Statut de #86/#87 (formulation « confirmé » à m=0,30) et du balayage #90.
2. Sauvegarde SWH des tags NH-01 et confirmation du SWHID N10-C.
3. Déclaration éventuelle d'une brèche d'aveuglement N10-C-bis (§2, constat N3).
4. Porte de nécessité de la communication avant le gel bis (§5).

### Où tourne le calcul (selon les notes, non vérifiable ici)

macM1 : campagne N10-C (graines 0/17/42, modèle de jour en pause, verrou lourd). KXKM : E1-small, puis N10-C (73/101/131 + 10 contrôles), puis bis. electron-server : runs NH-01, plus #90 envisagé sur KXKM.

---

## 2. Relecture critique des résultats depuis le 24/10

### N10-C

**N1 — BLOQUANT (validité de construit) : la tâche n'exige pas de communication, et le correctif C le rend explicite.**
- Les deux agents jouent **le même niveau** dans deux instances séparées, avec des **paramètres partagés** (`coop_env.py:11-13`, `stage2-manifest-fixc.md:41`). Le succès d'équipe exige que les deux pièces soient prises dans une fenêtre de 20 pas (`coop_env.py:229-230`).
- Deux copies d'une même politique, sur un même niveau, arrivent presque en même temps sans échanger un bit.
- Les chiffres de la porte le montrent : succès d'équipe ≈ taux de pièce individuel, à 0,94–0,97 près. Exemples : `eng` C 0,76 vs 0,785 ; `gtm` A 0,82 vs 0,86 ; `gtm_mis` 0,81 vs 0,84 ; 10M 0,87 vs 0,875 (`amendment-2026-10-25.md:141-153,191` ; `bis…:302`). Avec des succès indépendants on attendrait taux² ≈ 0,74.
- Le bras à **messages permutés `gtm_mis` atteint 0,81** à 1M, au-dessus de `gtm` (0,54/0,64/0,73), et une politique scriptée sans message atteint 43 % (`amendment-2026-10-25.md:32`).
- Dans la condition `registered`, la seule que vise l'estimand primaire, le canal latéral « team summary » fournit déjà le minutage du partenaire (`amendment-2026-10-23.md:39,50`).
- Le correctif C (+0,5 par pièce propre, `:53-55`) transforme l'apprentissage en navigation individuelle.
- **Lecture la plus probable des contrastes θ_e,b et de C1 (bis) : ≈ 0.** L'interprétation « pas de différence entre canaux » sera indiscernable de « la tâche ne sollicite pas le canal ». Le dénominateur ENG − NOCOMM de l'indice NI (`amendment-2026-10-23.md:203`) sera proche de 0, d'où un intervalle de Fieller non borné.
- Ce problème n'est pas une erreur de procédure : le gel est irréprochable. C'est la question posée qui n'est plus celle de la préreg du 11/05.

**N2 — MAJEUR : le correctif change l'objectif d'entraînement en cours d'étude.**
Le choix de C est daté d'avant les résultats de la porte (`:40`), ce qui est correct. Le texte déclare que « l'estimand est inchangé » (`:55`). C'est vrai de la formule, faux de son sens (cf. N1). Le texte doit qualifier explicitement la question : « canal qui se superpose à une coordination déjà résolue par la récompense individuelle ».

**N3 — MAJEUR (procédure, conditionnel) : brèche d'aveuglement bis possible.**
Le texte bis interdit, jusqu'à son tag, de lire « tout champ de courbe d'entraînement » d'un run N10-C (`2026-10-25-n10c-bis-control-arms.md:42`). Les notes du labo citent pourtant « registered-gtm-s0 … succès 0,96 ». Si ce chiffre provient du `run.json` de la campagne n°2, c'est une seconde brèche. Elle doit être déclarée dans le texte bis avant son tag, comme la première (`:273,288`). Ce n'est pas vérifiable dans le dépôt.

**N4 — MINEUR : décision Adam peu informative, et contraire au signal.**
- Les données penchent vers la correction de biais : C-bc ≥ C sur 5/6 cellules (moyenne des 200k derniers pas, +0,047), fraction positive du bloc 3 plus élevée sur 6/6, pas relatifs 1,5–2× plus grands sans correction (`:182-190`).
- Le choix « sans correction » se défend par la continuité avec le gel n°1. Il s'écarte du PPO standard, où la correction de biais est la norme.
- L'heure de la décision est floue : « about 20:15 / 26/10 22:02, exact time in the PI's record » (`:193`). À 20:15, la courbe 10M de C était visible et C-bc n'avait pas démarré.
- Le texte le déclare honnêtement. Il faut l'écrire dans le rapport comme un **choix de continuité, non fondé sur des preuves**.

**N5 — MINEUR : hétérogénéité des troncs.**
- Le tronc de la graine 0 (macM1) plafonne à un taux de pièce de 0,44 → **0,52**, contre 0,82–0,95 pour les autres (`stage2-manifest-fixc.md:162-167`).
- Le seul critère d'« utilisabilité » est la vivacité. Un tronc faible est donc accepté par règle, et il touche tous les bras de la graine 0 (effet de bloc).
- C'est sans biais entre bras, mais cela ajoute de la variance entre graines, déjà confondue avec l'hôte. À rapporter.

**N6 — OK : traçabilité.** Le gel n°2 est exemplaire :
- arrêt déclaré comme dérivé d'un résultat (`:14`) ;
- registre de développement ligne à ligne, plafonds relevés avant usage (`:93-100`) ;
- SHA du manifeste recalculé et conforme ;
- troncs versionnés dans le commit gelé ;
- non-déterminisme CUDA mesuré : écarts de 0,10–0,13 entre deux répétitions (`:159`).

**N7 — MINEUR : le correctif `vq` est décidé après son échec.** Le stop-gradient du terme d'engagement (`bis…:316`) est légitime en développement, mais il donne un VQ non standard. Le test causal annoncé n'a pas été fait (`:313`). La lecture de H-bis-3 doit mentionner « VQ dont la perte auxiliaire n'atteint pas le tronc ».

### NH-01

**H1 — MAJEUR : contrôle tautologique, à T=0 comme à T=0,2.**
- La préreg le dit elle-même : à T=0, le rétrécissement uniforme est inerte par théorème (`nh01…downscale.md:26`).
- Le confirmatoire déplace C3 à T=0,2 (`confirmatory-n1000.md:19,40`). Or c(t) < 1 par construction (le noyau rêvé a une norme plus petite, `pilot.md:26`). Le théorème 2 (`nh01…:27`) implique alors un rapport ≤ 1.
- C3′ **ne peut donc pas réfuter**. La clause « C3′ refutes → pillar B is a downscale » (`confirmatory:47`) est vide.
- Le « confirmé » repose entièrement sur C1/C2, c'est-à-dire sur une réplication à N fini de Fachechi–Agliari–Barra (2019).

**H2 — MAJEUR : l'interprétation « rêve » dépasse la preuve.**
- J(t) = (1+t)/N·ξᵀ(𝟙+tC)⁻¹ξ est la **règle de projection régularisée par ridge** (λ = 1/t). C'est un résultat connu (Personnaz, Kanter–Sompolinsky 1987).
- La prédiction C4 (#87, « le gain croît avec la corrélation ») est **dérivée analytiquement** dans la préreg elle-même (`correlated-patterns.md:28`).
- Ce qui est montré : « la projection régularisée bat Hebb ». Ce qui n'est pas montré : « le rêve n'est pas un `downscale` » au sens SHY, car SHY n'est pas un rétrécissement uniforme multiplicatif.
- Le substrat de dream-of-kiki n'est pas testé.

**H3 — MAJEUR : #87 à m=0,30, « confirmé (formel) ».**
- Le rapport 44,4× a un dénominateur interpolé entre α=0,01 et 0,02. À N=1000, cela fait 10 à 20 motifs, donc r résolu par pas de 0,1.
- Les graines dont Hebb tombe sous la grille sont **retirées** du bootstrap de C1. Si elles sont ≤ 2, le retrait est sélectif.
- C3′ à T=0,2 repose sur 5/10 graines au plancher, IC [0,2 ; 1,0].
- Le libellé doit être « non calculable », règle que #90 propose d'ailleurs a posteriori. Un rapport de capacités est la mauvaise métrique quand le dénominateur tend vers 0 : il faut un log-rapport ou une différence.

**H4 — MINEUR : C2 reformulé après le pilote.** « Monotone » devient « unimodal à optimum intérieur » (`confirmatory:18,39`) après observation du pic à t=10 (`pilot.md:31`). C'est légitime, car tagué avant de nouvelles données (N=1000, nouveaux motifs). Mais il faut écrire que P2 a été **ajustée au pilote** et que le seuil τ=0,02 a été choisi en connaissant une baisse de 0,041 à N=256.

**H5 — MINEUR : provenance du pilote.**
- `run_meta.json` indique `git_commit 8a13a33`, c'est-à-dire le tag, avec les fichiers du commit `86bfbfd` recopiés à la main (`pilot.md:4`).
- `86bfbfd` est horodaté 08:53:59 UTC, **après** le lancement de 08:51:11 UTC. Le code exécuté n'était donc pas encore versionné au départ (dates git non probantes, certes).
- La correction des égalités (tolérance 1e-12, `run.py:53,152`) a été faite après le tag, sans amendement. Elle se justifie, car c'était avant toute lecture de capacité.
- Le confirmatoire corrige ce point par une vérification SHA-256 : OK.

**H6 — OK : implémentation.**
- Noyau spectral et forme dans l'espace des motifs testés l'un contre l'autre (`run.py:77-100`).
- Règle des égalités invariante d'échelle ; estimateur conforme (`:308-318`) ; verdict codé tel qu'enregistré (`:408-458`).
- Aucun bug trouvé. Une imprécision : P4 exige ≥ 0,5 à toutes les charges, y compris α=0,10, qui est au plancher (`:460`) ; elle est déclarée.

### Autres

- **OK** : l'erratum N-3 (#73) reprend la formulation astra M2 (garde de typage exercée, utilité causale non établie).
- **MINEUR** : issues ouvertes #82 (`uv.lock` périmé, l'arbre se salit sur un clone frais) et #85 (`test_w2_hard` dépend de la plateforme). La reproductibilité « en une commande » (#84) en dépend.

---

## 3. Analyses : ordres de grandeur et décidabilité

**N10-C avec 6 graines par bras.**
- Les seules estimations de variance disponibles viennent des runs de développement (niveaux d'entraînement, 1M) :
  - `gtm` C : 0,54 / 0,64 / 0,73 / 0,76 / 0,58 / 0,89, soit σ ≈ 0,13 ;
  - `eng` C : 0,76 / 0,63 / 0,84 / 0,84 / 0,71 / 0,88, soit σ ≈ 0,09 ;
  - deux répétitions identiques diffèrent de 0,10–0,13.
- Contraste Welch à n=6 : erreur-type ≈ √(0,13²/6 + 0,09²/6) ≈ 0,065. Avec t₀,₉₉₁₇,df≈9 ≈ 2,9, la **demi-largeur de l'IC à 98,33 % vaut ≈ 0,19**.
- Pour classer « excludes-SESOI » (U < 0,10), il faudrait un vrai Δ ≲ −0,09. Pour un effet positif net, Δ ≳ 0,29.
- **Conclusion : avec cette variance, seuls des effets ≥ 0,2–0,3 sont décidables.** Sur une tâche où la communication est presque inutile (N1), le résultat attendu est « inconclusive » pour les trois contrastes.
- La seule issue informative serait un plafond qui comprime σ à ≈ 0,03. L'IC (≈ ±0,05) devient alors étroit, mais centré sur 0, et il mesurera l'absence de besoin, pas l'absence d'effet du GTM.
- Données manquantes : aucune variance sur les niveaux de test (200 niveaux tenus à l'écart), seule unité de l'estimand. Avec 16 niveaux d'entraînement, la généralisation de CoinRun est faible (Cobbe et al. 2019). Un **plancher** sur le test est aussi plausible. Non vérifiable avant l'évaluation.
- Coût : 70 runs × 10–18 h ≈ 950 h GPU/Metal, plus 48 runs bis ≈ 21 j KXKM. macM1 et KXKM sont bloqués jusqu'à mi-décembre.

**NH-01 avec N=1000 et 10 graines.** La précision n'est pas le problème : C1 vaut 3,86 [3,79 ; 3,93] et C3′ 0,975 [0,967 ; 0,982]. Tout est décidable, mais les seuls critères capables d'échouer (C1, C2′) testent un résultat analytique connu. #90 (N jusqu'à 4000, 90–190 h cœur) précisera la limite thermodynamique de α_c(t*) : une réplication de théorie à faible valeur marginale pour GENIAL.

---

## 4. Suppositions non testées et explications plus simples

1. **N10-C : « le succès d'équipe mesure la coordination ».** Explication plus simple : la synchronisation vient gratuitement du même niveau et des paramètres partagés (N1). Test peu coûteux, ~12 min KXKM par run : porte `nocomm` vs `eng` vs `gtm_mis` à 10M en condition `closed`, sur une graine de développement.
2. **« Tronc pré-entraîné = neutre entre bras ».** C'est vrai par construction (même tronc par graine). Mais le pré-entraînement solo fixe une représentation centrée sur la navigation, qui peut réduire l'espace où un message utile est encodable. Le contrôle de la graine 101 mesure l'effet d'un tronc par run, pas celui de « pas de pré-entraînement ».
3. **« La garde de vivacité détecte l'échec d'apprentissage ».** Faux, et c'est écrit (`:163`) : B garde un tronc vivant mais n'apprend pas. Seul le critère (ii)/(iii) de la porte le détecte, et il n'existe pas en cours de run.
4. **NH-01 : « la norme de Frobenius = budget synaptique SHY ».** SHY biologique est dépendant de l'activité et soustractif ou seuillé, pas uniforme. Contrôles plus justes à budget égal : autres filtres spectraux (écrêtage des k premières valeurs propres, λ^p), J − εJ² (désapprentissage de Hopfield–Feinstein–Palmer au premier ordre), élagage aléatoire ou par magnitude, désapprentissage itératif par rêves échantillonnés. Si l'un d'eux égale le noyau rêvé, « rêve » se réduit à « décorrélation ».
5. **« Le résultat Hopfield se transpose aux WML et au codebook VQ ».** Non testé : la partie VQ et information mutuelle de NH-01 est hors périmètre (`nh01…:10`). Rien ne relie encore le pilote au substrat nerve-wml.
6. **« Graines 0–9 réutilisées = indépendance ».** Les flux incluent N (`run.py:220-221`), donc les motifs diffèrent entre pilote et confirmatoire : OK. Mais C2′ a été calibré sur le pilote (H4).

---

## 5. Utilité hors labo, et ce qu'il faudrait arrêter

### À valoriser

- **Note méthodologique publiable** (atelier reproductibilité ML, ReScience, ou section de la note « nuls et errata » de M3) : « préenregistrer une campagne RL quand on travaille seul ». Ingrédients : tags annotés plus SHA du manifeste ; registre de développement à plafonds ; arrêt déclaré comme dérivé d'un résultat ; règle de redémarrage aveugle au résultat ; troncs épinglés par SHA. L'épisode effondrement → correctif → nouveau gel est un **cas d'étude honnête et rare**.
- **Outil** : la garde de vivacité PPO (fraction positive du bloc 3, unités h vivantes, écart-type logits/valeur, `harness/train.py`) se réutilise comme détecteur de ReLU mortes pour tout PPO IMPALA. Un petit paquet ou un billet technique.
- **Signalements amont** : non-déterminisme du backward de convolution MLX-CUDA ; builds Procgen arm64 vs x86 non bit-identiques (`bench/procgen-builds/`). Utile à la communauté, coût minime.
- **Formation** : `experiments/nh01_hopfield_dream/` fait un TP propre sur les mémoires associatives (Hebb, projection, rêve, effets de taille finie, contrôle par invariance). À vendre comme support pédagogique, pas comme preuve GENIAL.

### À arrêter ou réorienter

- **#90 (balayage N=1000–4000) : arrêter.** Il mesure une limite déjà prédite analytiquement. Il vaut mieux réaffecter les heures à un vrai contrôle non uniforme (§4.4) et à la partie VQ de NH-01.
- **#87 : ne pas fusionner avec « confirmé » à m=0,30.** Réétiqueter en « non calculable ».
- **N10-C-bis : ne pas geler sans porte de nécessité de la communication.** Ajouter au texte bis, encore non gelé, une condition préalable : en développement, `eng` − `nocomm` ≥ 0,2 (niveaux d'entraînement, condition `closed`). Si elle échoue, ne pas engager 21 j de KXKM. Il faut d'abord rendre la tâche asymétrique (niveaux différents, information privée sur la pièce), ce qui demande un nouveau N10-D. N10-C, gelé, peut finir, puisque son coût est engagé, à condition de le présenter d'emblée comme « borne sur une tâche sans besoin d'information ».
- **ROADMAP** : corriger les dates N10-C (≈ 20–21/11) et N10-C-bis (début ≈ 20/11, fin ≈ mi-décembre), et donc la disponibilité macM1/KXKM pour WML-JEPA, NH-28 et NH-81.
