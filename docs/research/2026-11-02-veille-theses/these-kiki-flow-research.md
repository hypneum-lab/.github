# kiki-flow-research — thèse, veille et relecture (2026-11-02)

Relu le 02/11/2026 (relecteur Claude à contexte vierge ; passe Codex interrompue avant rapport) : 5 corrections, voir tracking-0211.md

Dépôt `hypneum-lab/kiki-flow-research`, clone `clones/kiki-flow-research`,
branche `docs/nh20-reading-note` (9f5445f). Lus en entier avant la veille :
`docs/prereg/nh20/reading-note.md` (v0.2, 504 l.), `veille-journal.md`
(231 l.), `brainstorm-2026-11-01.md` (201 l.), l'inventaire
`inventory/kiki-flow-research.md`, `inventory/refs/kiki-flow-research-refs.md`,
les lignes du dépôt dans le catalogue v2 (tables C, A, B) et les §4 et §6 de la
spec du verrou.

- **Fenêtre** : soumissions du 2026-10-24 au 2026-11-02.
- **Axes** : R3 (transport optimal, JKO, Sinkhorn, splitting Lie / Strang,
  diffusion parasite) et R11 (tests d'équivalence, nuls calibrés).
- **Requêtes (résumé)** : arXiv 20 requêtes `search_query` bornées par
  `submittedDate` (dont 3 relancées après des 429 répétés) ; OpenReview 10
  requêtes `notes/search` filtrées sur `ICLR.cc/2027/Conference/Submission` +
  1 requête de titre ; bioRxiv balayage complet de la fenêtre (2 034
  préimpressions) filtré par mots-clés ; OpenAlex 8 requêtes bornées par date
  (en remplacement de Semantic Scholar `search`, en 429) ; Crossref 5 requêtes
  de titre (versions revues) ; Semantic Scholar 1 lot `s2.py lookup` (6 ids) ;
  remontée de citations `citation_snowball.py` sur 6 graines ; GitHub 7, Hugging
  Face 8, Zenodo 13, OSF 5 requêtes. Détail exact au §8.
- **Comptes** : bruts ≈ 3 460 notices (dont 2 034 bioRxiv) → dédoublonnées
  contre `seen-arxiv.txt` / `seen-doi.txt` et entre canaux ≈ 1 050 → **gardées
  15** (R3 : 10 ; R11 : 5).
- **Lecture** : 0 source lue en entier ; 1 lue en partie (arXiv:2610.38129,
  p. 1-5 sur 20) ; 14 en résumé (« [résumé moteur] », ou résumé obtenu par
  l'API OpenReview pour les soumissions ICLR 2027).

## 1. La thèse en une phrase, telle que le dépôt la formule

« A Wasserstein gradient flow engine for LLM consolidation, grounded in the
Levelt–Baddeley model of language production » (`README.md:3-4`) ; le
dépôt modélise l'état d'un LLM par quatre densités psycholinguistiques qui
évoluent sous un flot de gradient régularisé en Wasserstein, résolu par un
schéma JKO (`README.md:17-20`).

Fait de relecture : depuis la requalification du 01/11, la seule contribution
neuve retenue pour la ligne kiki-flow est NH-20, Lie O(τ) contre Strang O(τ²),
« ordre non identifiable au premier essai »
(`clones/.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md:43`,
`:262`) ; l'outillage certifié et l'ERRATUM sont rangés comme note
méthodologique (`inventory/kiki-flow-research.md`, §4 « Contribution
réellement neuve »).

## 2. État de la thèse au 02/11

| affirmation | statut 24/10 | requalification 01/11 (catalogue v2, table et ligne) | ce que la veille du 02/11 change | source résolue |
|---|---|---|---|---|
| λ̂ = 67,79 ± 3,78 « régime du Thm 3.4 de Conger » (`paper/main.tex:263`, `:590`, `:878`) | non concluant (KFR-H18) | artefact de grille plausible, retirer (Table C l. 40 ; Table A l. 116) | **rien** sur le chiffre. Un résultat voisin donne un cadre : sur un graphe fini avec réaction Fisher, la courbure entropique uniforme est −∞ dès que le diamètre du graphe est ≥ 3, alors qu'elle est finie sans réaction. Inférence, séparée : une constante de contraction lue sur une grille 1D de 64 points ne peut pas être prise pour une constante uniforme d'un théorème continu, ce qui va dans le sens du retrait. La géométrie de cet article (moyenne logarithmique, Maas) n'est pas celle du script λ (Euler explicite euclidien) : l'appui est indirect | arXiv:2610.38129 (lu p. 1-5, Th. 1.1-1.3) |
| E1b retrouve ε/(2τ) (`paper/main.tex:832-842`) | réfuté (KFR-H24) | REFUTED ; convention de noyau à fixer avant re-préreg (Table C l. 41 ; Table A l. 120) | **rien**. Aucune source de la fenêtre ne fixe la conversion de ε entre Carlier et al. (coût \|x−y\|²) et Baradat et al. (D_ε², diffusion (ε/2)Δ). Le facteur 2 reste « vraisemblable, non vérifié » (`docs/prereg/nh20/reading-note.md:168-174`) | arXiv:2502.12666 (déjà vu, rappelé ; pas de nouvelle version) |
| M5 certification, critère γ ≤ 30 : 50/60 certifiées (`docs/results/2026-10-30-m5-certify-verdict.md:9-12`) | échec mécanique (30/10) | échec de fond du critère ; note numérique ; rapport technique (Table C l. 42) | **aucun verdict ici, aucun calcul.** Un outil voisin apparaît : un certificat primal-dual « anytime » en mémoire linéaire pour le transport non régularisé, par Douglas-Rachford de Bregman vu comme Sinkhorn recuit. Inférence : c'est une piste de comparaison pour le certificat KKT du pas implicite (ERRATUM §16), pas un argument sur le critère γ ≤ 30 | OpenReview `ogeya5rzdE` (résumé API) |
| NH-20 Lie contre Strang, ordre non identifiable au premier essai (exposants médians de S −0,72 et −0,03, `docs/notes/2026-11-01-jko-splitting-results.md:47-52`) | hypothèse | seule contribution neuve ; ordre non identifiable au premier essai (Table C l. 43 ; Table B l. 262) | **aucune antériorité trouvée** pour Strang avec sous-pas JKO dans la fenêtre (absence constatée sur résumés, **à recouper** ; la veille ne tranche pas NH-20) : aucune notice arXiv, OpenReview ICLR 2027, bioRxiv, OpenAlex, GitHub, Zenodo ou OSF ne combine Strang avec JKO ou Fisher-Rao. Deux voisins : un splitting aléatoire de Langevin dont l'erreur de troncature locale est obtenue par les commutateurs des semi-groupes (W₂, pas JKO) ; un schéma JKO « split-step » avec champ non conservatif, existence seulement | DOI 10.4208/csiam-am.so-2025-0124 [résumé moteur] ; arXiv:2610.40942 [résumé moteur] |
| Condition de Carlier (ε\|log ε\| = O(τ²)) suffisante, pas nécessaire (Baradat-Hraivoronska-Santambrogio, `reading-note.md:152-166`) | — | — (introduite par la note v0.2) | **rien** : pas de nouvelle version de 2502.12666 ni de 2604.08283 ; Crossref ne trouve toujours aucune version revue de 2511.18060, 2511.14827, 2511.10884, 2604.08283 au 02/11 19:39. La marque « à recouper » de la portée hors tore reste | arXiv:2502.12666, arXiv:2604.08283 (déjà vus, rappelés) |
| « Strang + JKO reste d'ordre 1 » (`reading-note.md:337-353`) | — | — (prédiction de la note) | **ni prouvé ni contredit** dans la fenêtre. Appui supplémentaire, indirect et de même nature que l'appui (i) de la note : pour Langevin, le biais d'ordre 1 se corrige par un splitting aléatoire, et l'erreur locale s'écrit avec les commutateurs. Ce n'est pas un énoncé sur le JKO | DOI 10.4208/csiam-am.so-2025-0124 [résumé moteur] |
| Soumission ICLR 2027 `pmRC8xTiym` (PDF 403 au tour 2) | — | citée [résumé moteur], **non vérifiée** (`reading-note.md:73-74`, `:274-275`) | **titre et résumé désormais lus par l'API** (`notes/search`) : « Gaussian Mixture Variational Inference with Wasserstein–Fisher–Rao Gradient Flows ». Convergence exponentielle d'un schéma de splitting WFR vers l'approximation gaussienne optimale (cibles lisses fortement log-concaves) ; algorithme « commuté » (échauffement W puis raffinement FR). Le résumé n'annonce aucun ordre de discrétisation, ni Lie ni Strang. PDF : 403 (challenge) de nouveau, aux trois URL. **Aucune version arXiv** : 0 résultat arXiv par titre, 0 par OpenAlex | OpenReview `pmRC8xTiym` (résumé API ; PDF non lu) |

## 3. Veille 02/11 par axe R

### R3 — transport optimal, JKO, Sinkhorn, splitting

- **arXiv:2610.38129** (2026-10-28) — *Graph-diameter criteria and sharp
  dissipation in discrete Wasserstein–Fisher geometry*, R. Zhang. Sur le
  simplexe d'un graphe fini avec transport à moyenne logarithmique et réaction
  de Fisher à masse conservée, la hessienne de l'entropie a une borne
  inférieure globale finie si et seulement si le diamètre du graphe est ≤ 2
  (Th. 1.1) ; sans réaction (λ = 0) la borne est finie sur tout graphe fini
  (Lemme 3.1). Lu p. 1-5.
  → Hypneum : dépasse (cadre) — NH-20 condition C6 (λ-convexité de chaque
  partie, `reading-note.md:394-397`) et KFR-H18 (λ̂). Inférence : sur une
  grille 1D de 16 ou 64 points, un sous-pas FR discret n'a pas de λ-convexité
  uniforme près du bord ; C6 doit être posée sur des densités bornées
  inférieurement, pas sur tout le simplexe. Impact : **Moyen**.
- **DOI** 10.4208/csiam-am.so-2025-0124 (2026-10-27, CSIAM Trans. Appl.
  Math.) — *Ergodicity and Error Estimate of Laws for a Random Splitting
  Langevin Monte Carlo Method*, L. Li. Le splitting aléatoire corrige le biais
  d'ordre 1 de Langevin ; erreur de troncature locale par entropie relative et
  commutateurs des semi-groupes, borne uniforme en temps en W. [résumé moteur]
  → Hypneum : outil réutilisable — NH-20, appui (i) de « Strang + JKO
  ordre 1 » et dessin P6 (`brainstorm-2026-11-01.md:153-169`). Impact :
  **Moyen**.
- **arXiv:2610.40942** (2026-10-29) — *Immersed Boundary Electrodiffusion in
  the Wasserstein Gradient Flow Formalism*, P. Lee. Flot W₂ couplé à des
  champs actifs non conservatifs ; existence globale faible par un schéma JKO
  « split-step ». [résumé moteur]
  → Hypneum : résultat externe déjà publié qui va dans le sens de la ligne 12
  de la note (les splittings avec JKO publiés donnent l'existence, pas d'ordre) et le constat sur b^asym
  (`inventory/kiki-flow-research.md`, MAJEUR 8). Impact : **Info**.
- **DOI** 10.3934/dcds.2026.105543 (2026-10-28, DCDS) — *A proximal
  primal-dual approach to generalized JKO schemes for doubly nonlinear
  parabolic equations*, L. M. Briceño-Arias. Opérateurs proximaux explicites
  pour des coûts de transport généraux, réduits à des problèmes scalaires
  point par point. [résumé moteur]
  → Hypneum : outil réutilisable — dessin P3 (sous-pas résolus point par
  point). Impact : **Info**.
- **OpenReview `pmRC8xTiym`** (soumission ICLR 2027) — *Gaussian Mixture
  Variational Inference with Wasserstein–Fisher–Rao Gradient Flows*, anonymes.
  Splitting WFR sur les gaussiennes, convergence exponentielle ; schéma
  commuté W puis FR. Résumé lu par l'API, PDF 403.
  → Hypneum : va dans le sens de la ligne « reste ouvert » de la note (§4 :
  aucun ordre Lie/Strang publié pour WFR), résumé seul, **à recouper** ;
  voisin du dessin P2. Impact : **Moyen** (à relire dès que le PDF
  est accessible).
- **OpenReview `ogeya5rzdE`** (soumission ICLR 2027) — *Annealed Sinkhorn
  with Momentum: Certified Unregularized Optimal Transport in Linear Memory*,
  anonymes. Douglas-Rachford de Bregman = point proximal inexact (IPOT) à une
  itération de Sinkhorn ; certificat primal-dual « anytime ». Résumé API.
  → Hypneum : outil réutilisable — certificat de M5 (ERRATUM §16) ; aucun
  verdict. Impact : **Moyen**.
- **OpenReview `zgl72xaYh7`** (soumission ICLR 2027) — *Non-Conservative
  Sinkhorn: Optimal Transport with Dissipation*, anonymes. Sinkhorn pour un
  transport discret avec perte de masse par arête. Résumé API.
  → Hypneum : Info — voisin du sous-pas réaction. Impact : **Info**.
- **arXiv:2610.33922** (2026-10-24) — *Learning Population Dynamics with
  Variational Doob-Wasserstein Flow*, W. Qian. Pont de Schrödinger champ
  moyen non équilibré sur la variété WFR, taux sous LSI uniforme. [résumé
  moteur]
  → Hypneum : Info. Impact : **Info**.
- **arXiv:2610.41321** (2026-10-30) — *Existence, Equivalence, and
  Convergence of Unbalanced Optimal Transport*, Q. Zhao. Γ-convergence de la
  limite de pénalité forte sur la source. [résumé moteur]
  → Hypneum : Info. Impact : **Info**.
- **Thèse TU/e, D. L. J. Bon** (2026-10-27) — *Numerical Methods in Metric
  Spaces: Gradient Flows, Optimal Transport, and Sampling* (OpenAlex
  W7225021612, PDF en accès ouvert `pure.tue.nl/ws/files/424433535/20261027_Bon_hf.pdf`,
  page d'accueil en 503 le 02/11). Chapitre 3 : existence de limites en temps
  continu d'une approximation dynamique paramétrée pour les flots de gradient.
  [résumé moteur]
  → Hypneum : Info — canal thèses ; rien sur Lie/Strang dans le résumé.
  Impact : **Info**.

### R11 — tests d'équivalence, nuls calibrés

- **OpenReview `retgbahmng`** (soumission ICLR 2027) — *PopFloor: Split-Half
  Diagnostics for Finite-Sample Wasserstein Bias*, anonymes. Le W₂ « plug-in »
  a un plancher d'échantillon fini ; une prédiction sous-dispersée peut battre
  un vrai échantillon ; estimation du plancher par demi-échantillons. Résumé API.
  → Hypneum : pilote possible — les erreurs W₂ relatives de l'ERRATUM §12
  (0,60 / 0,64 / 0,14) et tout critère W₂ d'un futur P3/P5 demandent ce
  plancher comme nul. Impact : **Moyen**.
- **OpenReview `DF2S9ep40W`** (soumission ICLR 2027) — *The Control Decides
  the Answer: A Matched-Operator Null*, anonymes. Référence « changement
  justifié » en forme close ; décomposition justifié / injustifié / bruit.
  Résumé API.
  → Hypneum : déjà publié (méthode) : va dans le sens de la règle « nul
  calibré avant lecture » (dessin P2, calibration sur le cas exact). Impact : **Info**.
- **OpenReview `qcaONMxcwx`** (soumission ICLR 2027) — *Nuisance Probing Needs
  a Null Derived from the Design*, anonymes. Sur un corpus sans effet, le
  sondage naïf déclare un effet dans 100 % des essais. Résumé API.
  → Hypneum : Info, R11 transverse. Impact : **Info**.
- **OpenReview `ts0kgHyBfr`** (soumission ICLR 2027) — *Phantom Gains:
  Auditing Self-Improvement Against a Measured Null*, anonymes. Sept défauts de
  mesure qui inversent un résultat en l'absence de contrôle gelé. Résumé API.
  → Hypneum : Info, R11 transverse (modèle de rapport d'errata). Impact :
  **Info**.
- **GitHub `jwangucsbmath/wgf-stitching`** (créé 2026-10-26, MIT, 0 étoile) —
  reproduction « clean-room » d'un article déjà vu (arXiv:2607.04738, déjà vu,
  rappelé) ; contrôles « simulateur et résidu contre réponses exactes » sur
  OU quadratique. README lu.
  → Hypneum : outil réutilisable (patron de validation sur cas exact, dessin
  P1). Impact : **Info**.

Bruit écarté : les deux hits arXiv « TOST » (arXiv:2610.34791,
arXiv:2610.33965) sont des usages appliqués sans méthode nouvelle ; bioRxiv,
7 hits sur 2 034, aucun ne touche R3 ou R11 sur le fond.

## 4. Hypothèses déjà faites ailleurs (risque de scoop)

- **NH-20 (Table B l. 262 ; Table C l. 43)** : aucun scoop dans la fenêtre.
  Le plus proche reste Crucinio-Pathiraja (Lie exact, pas Strang ;
  arXiv:2511.18060, déjà vu) ; `pmRC8xTiym` traite un splitting WFR sous
  l'angle de l'optimisation, sans ordre annoncé (résumé seul ; **à recouper**
  tant que le PDF n'est pas lu).
- **NH-58 (Table B l. 300, ε de Sinkhorn = température effective)** :
  rien de neuf dans la fenêtre ; les « Sinkhorn divergence geometry » de la
  semaine (arXiv:2610.36488, arXiv:2610.39850) sont déjà vus.
- **R11 transverse** : la règle « contrôle gelé avant lecture » est désormais
  écrite par plusieurs soumissions ICLR 2027 (`DF2S9ep40W`, `ts0kgHyBfr`,
  `qcaONMxcwx`). Inférence : la « note méthodo nuls + errata » de la roadmap
  perd en nouveauté sur le principe et garde sa valeur comme étude de cas
  (ERRATUM §1-16). **À recouper** (trois soumissions de même nature, aucune
  version revue).

## 5. Outils ou jeux de données à adopter

- Certificat primal-dual anytime (`ogeya5rzdE`) : à comparer, sur le papier,
  au certificat KKT du pas implicite avant toute nouvelle campagne de type M5.
- Plancher W₂ par demi-échantillons (`retgbahmng`) : nul à intégrer à tout
  critère W₂ d'une future préreg.
- Erreur locale par commutateurs (DOI 10.4208/csiam-am.so-2025-0124) :
  méthode candidate pour le dessin P6 (prédiction du défaut de Strang-JKO).
- Aucun jeu de données nouveau (Hugging Face, Zenodo, OSF : zéro retenu).

## 6. Ce qui reste ouvert et le prochain pas sous le verrou

Pas de run. Ouvert : l'ordre de Strang à sous-pas JKO, la conversion de ε
Carlier / Baradat, la portée hors tore de 2502.12666, le contenu de
`pmRC8xTiym`.

| prochain pas | nature | coût humain | ce que ça tranche |
|---|---|---|---|
| Lire arXiv:2610.38129 en entier (p. 6-20, preuve du Th. 1.1 et §7-8) | lecture | ≈ 2 h | si C6 peut être posée « densités ≥ δ » sans perte ; formulation d'une condition C6' |
| Lire Li, CSIAM (DOI ci-dessus), §2-3 | lecture | ≈ 2 h | si la méthode des commutateurs donne le coefficient du défaut local pour P6 |
| Relire `pmRC8xTiym` dès que le PDF s'ouvre (navigateur humain, ou version publiée après décision ICLR) | lecture | ≈ 1,5 h | lève le « non vérifié » des lignes 12 et §4 de la note |
| Ajouter à P3 une ligne « borne inférieure de densité » et à P1/P3 un plancher W₂ calibré | dessin | ≈ 1 h | rend C6 et le critère W₂ vérifiables avant lecture |
| Conversion de ε Carlier / Baradat sur cas gaussien | dessin (forme close, papier) | ≈ 1 h | E1b (KFR-H24) et C2 |

Rappel : aucun de ces pas ne lance de calcul ; le verrou n'est pas déclaré
passé.

## 7. Non vérifié / inaccessible

- OpenReview `pmRC8xTiym` : PDF en 403 (« ChallengeRequiredError ») aux URL
  `openreview.net/pdf?id=`, `api2.openreview.net/pdf?id=` et
  `openreview.net/pdf/c4bb…032.pdf` ; `notes?id=` aussi en 403. Titre et
  résumé lus via `notes/search`. Aucune version arXiv (0 résultat par titre),
  aucune notice OpenAlex.
- Les soumissions ICLR 2027 citées ici n'ont été lues que par leur résumé API.
- Thèse Bon (TU/e) : page institutionnelle en 503 ; résumé via OpenAlex
  seulement.
- Semantic Scholar `search` : 429 persistant, remplacé par OpenAlex ; la
  remontée de citations est passée par OpenAlex (32 lignes, toutes « amont »,
  0 « aval » : la saturation par citations aval n'est pas mesurable à ce tour).
- arXiv : nombreux 429 (concurrence avec d'autres passes) ; les requêtes
  `all:"Fisher-Rao"` et `all:"Gromov-Wasserstein"` du premier lot ont été
  abandonnées puis relancées dans le second lot.

## 8. Journal

Toutes les heures sont CET, le 2026-11-02. User-Agent « hypneum-lab
reading-gate ». Scripts : `veille-0211/scripts-kfr/` ; téléchargements :
`veille-0211/dl-kiki-flow-research/`.

**arXiv** (`export.arxiv.org/api/query`, chaque requête suffixée de
`AND submittedDate:[202610240000 TO 202611022359]`, `max_results=100`,
3,2 s entre appels, reprise sur 429) :

| heure | requête | brut |
|---|---|---|
| 19:11-19:19 | `all:JKO` ; `all:"Wasserstein gradient flow"` ; `all:"Wasserstein gradient flows"` ; `all:Sinkhorn` | 1 ; 3 ; 3 ; 5 |
| 19:12-19:17 | `all:"Fisher-Rao"` | abandon (5 × 429) |
| 19:19 | `all:"Hellinger-Kantorovich"` ; `all:"Strang splitting"` ; `all:"operator splitting" AND all:"gradient flow"` ; `all:"entropic optimal transport"` | 1 ; 0 ; 0 ; 2 |
| 19:22-19:23 | `all:"minimizing movement"` ; `all:"Schrodinger bridge" AND all:entropic` ; `all:"equivalence test"` ; `all:TOST` | 1 ; 0 ; 1 ; 2 |
| 19:23-19:28 | `all:"Gromov-Wasserstein"` | abandon (6 × 429) |
| 19:35 | `all:"unbalanced optimal transport"` | 1 |
| 19:40-19:41 | `all:"Fisher-Rao" OR all:"Wasserstein-Fisher"` ; `all:"Gromov-Wasserstein"` ; `abs:"gradient flow" AND abs:splitting` ; `all:"Lie-Trotter" OR all:"Trotter splitting"` ; `abs:"optimal transport" AND abs:"gradient flow"` | 3 ; 0 ; 3 ; 0 ; 4 |
| 19:45 | `ti:"Gaussian Mixture Variational Inference" AND ti:Fisher` (sans borne de date, version arXiv de `pmRC8xTiym`) | 0 |

arXiv : 30 lignes, 18 identifiants distincts, 9 déjà vus → 9 nouveaux, 4
gardés (2610.38129, 2610.40942, 2610.33922, 2610.41321) et 5 écartés (les 2
hits TOST, 2610.34791 et 2610.33965, après lecture du résumé ; 2610.41958,
2610.36753, 2610.42118).

**OpenReview** (`api2.openreview.net`) :

| heure | requête | brut |
|---|---|---|
| 19:14 | `notes?id=pmRC8xTiym` | 403 (challenge) |
| 19:14 | `openreview.net/pdf?id=pmRC8xTiym` ; `api2.openreview.net/pdf?id=pmRC8xTiym` ; `openreview.net/pdf/c4bb0a68373444eb17c935de75a5dbb234870032.pdf` (19:15) | 403 ; 403 ; 403 |
| 19:14 | `notes/search?term=Wasserstein Fisher Rao splitting&limit=20` | 20 (dont `pmRC8xTiym`, résumé lu) |
| 19:21:07-19:21:42 | `notes/search` + `venueid=ICLR.cc/2027/Conference/Submission`, `limit=50` : `JKO scheme` ; `entropic JKO` ; `Wasserstein gradient flow discretization` ; `Strang splitting` ; `operator splitting Wasserstein` ; `Wasserstein-Fisher-Rao` ; `Sinkhorn convergence entropic regularization` ; `equivalence testing` ; `calibrated null` ; `Gromov-Wasserstein` | 50 ; 50 ; 50 ; 50 ; 50 ; 5 ; 50 ; 50 ; 50 ; 31 |

OpenReview : 436 bruts → 369 distincts → filtre de titre → 11 résumés ouverts
→ 7 gardés (`pmRC8xTiym`, `ogeya5rzdE`, `zgl72xaYh7`, `retgbahmng`,
`DF2S9ep40W`, `qcaONMxcwx`, `ts0kgHyBfr`). Déjà présents dans les documents du
labo, donc non repris : `FqQdvJQi8j`, `lAlT4ZUgMp`, `7l8JCIgUi8`,
`v4nRoil6Tj`, `EbE2zyPxAc`.

**bioRxiv** (19:20-19:23) : `api.biorxiv.org/details/biorxiv/2026-10-24/2026-11-02/<curseur>`,
2 034 préimpressions balayées, filtre
`optimal transport|wasserstein|sinkhorn|gradient flow|fokker.planck|equivalence test|TOST|two one-sided|schrödinger bridge|fisher.rao`
sur titre et résumé → 7 → 0 gardé.

**OpenAlex** (19:26:58-19:27:20) : `works?search=<q>&filter=from_publication_date:2026-10-24,to_publication_date:2026-11-02&per-page=50`
pour `JKO scheme` (35), `Wasserstein gradient flow` (50 sur 113),
`Sinkhorn` (50 sur 64), `Fisher-Rao gradient flow` (50 sur 87),
`Strang splitting` (20), `entropic optimal transport` (50 sur 565),
`equivalence test` (50 sur 2 814), `minimizing movement` (50 sur 2 248) →
355 → filtre de titre 66 → 3 gardés hors arXiv (DCDS, CSIAM, thèse Bon).
19:39 : 2 recherches de titre pour `pmRC8xTiym` (283 et 63 notices, aucune
correspondance ; le plus proche, arXiv:2609.18118, est déjà vu).

**Crossref** (19:39:41-19:39:49) : `works?query.bibliographic=` sur les titres
de 2511.18060, 2511.14827, 2511.10884, 2604.08283 et du CSIAM → aucune
version revue des quatre préprints ; DOI CSIAM confirmé.

**Semantic Scholar** (19:22:45) : `s2.py lookup arXiv:2511.18060 arXiv:2511.14827 arXiv:2511.10884 arXiv:2502.12666 arXiv:2604.08283 arXiv:2105.11146 --tsv`
→ deux 429 puis 6/6 résolus (`dl-kiki-flow-research/s2_lookup.tsv`) ; seul
2502.12666 porte une venue revue (SIAM J. Math. Anal.). 19:15:17 :
`s2.py search` en 429 → repli OpenAlex.

**Remontée de citations** (19:28:45) : `citation_snowball.py --ids arXiv:2511.18060,arXiv:2502.12666,arXiv:2511.14827,arXiv:2604.08283,arXiv:2511.10884,arXiv:1602.04457 --depth 1`
→ 32 lignes (OpenAlex), toutes « amont » de 1602.04457, aucune nouvelle
entrée pertinente (`dl-kiki-flow-research/snowball-0211.tsv`).

**GitHub** (19:15:40-19:15:48, `gh search repos "<q>" --sort updated --limit 20`) :
`JKO scheme` 2 ; `Wasserstein gradient flow` 20 ; `Wasserstein Fisher Rao` 7 ;
`Strang splitting` 20 ; `entropic optimal transport` 20 ; `Sinkhorn` 20 ;
`equivalence testing TOST` 2 → 91 bruts, 16 poussés dans la fenêtre, 4 README
lus, 1 gardé (`jwangucsbmath/wgf-stitching`).

**Hugging Face** (19:16:16-19:16:21, `api/{models,datasets}?search=`) :
`wasserstein gradient flow` 0/0 ; `JKO` 50/50 (préfixes « jko… », bruit) ;
`sinkhorn` 7/1 ; `fisher-rao` 0/0 → 108 bruts, 0 gardé.

**Zenodo** (19:16:21-19:17:11, `api/records?q=<q>&sort=mostrecent&size=25`) :
non cités `JKO scheme`, `Wasserstein gradient flow`, `Strang splitting`,
`Sinkhorn`, `Fisher-Rao gradient flow`, `equivalence test TOST` ; entre
guillemets `"JKO"`, `"Wasserstein gradient flow"`, `"Strang splitting"`,
`"Sinkhorn"`, `"Fisher-Rao"`, `"equivalence test"`, `"entropic optimal transport"`
→ ≈ 315 bruts, 0 gardé. Seul résultat lié : la notice du dépôt lui-même,
DOI 10.5281/zenodo.23636477 (2026-10-25, « paper-v0.13-draft ») — déjà vu,
rappelé : elle publie toujours le texte non corrigé (constat BLOQUANT 5 de
l'inventaire, inchangé).

**OSF** (19:16:36-19:16:46, `v2/registrations/?filter[title]=<q>`) : `JKO` 0 ;
`Wasserstein` 1 ; `Sinkhorn` 0 ; `splitting` 15 ; `equivalence test` 7 → 23,
0 gardé.

**Identifiants** : résolus par API avant écriture (arXiv via OpenAlex et
l'API arXiv, DOI via Crossref ou OpenAlex, OpenReview via `notes/search`) ;
contrôle final `resolve_ids.py` consigné dans
`veille-0211/resolve-these-kiki-flow-research.tsv`.

**Fichiers téléchargés** (`veille-0211/dl-kiki-flow-research/`) :
`arx1.json`, `arx2.json`, `arx_pmRC.xml`, `or_pmRC.json`, `or_s1.json`,
`or_iclr27.tsv`, `pm3.pdf` (page HTML 403, pas un PDF), `biorxiv.json`,
`openalex.json`, `s2_lookup.tsv`, `snowball-0211.tsv`, `zen_kfr.json`,
`tue_bon.html` (page 503), `zhang_2610.38129.pdf` + `zhang.txt`.
