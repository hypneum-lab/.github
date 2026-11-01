# Veille Hypneum Lab — groupe de Rome (Agliari, Barra, Fachechi et coauteurs), 2026-11-01

**Fenêtre** : soumissions arXiv 2025-01 → 2026-10 (plus deux articles Neural Networks 2024 demandés en contexte, et une révision v2 de septembre 2026 d'une prépublication de 2024).

**Requêtes** (toutes le 2026-11-01, `https://export.arxiv.org/api/query`, 3 s entre appels ; le point d'entrée `http://` renvoie un 301 vers `https://`) :
- `id_list=` des 13 identifiants fournis (un seul appel groupé) ;
- `search_query=au:Barra_Adriano`, `au:Agliari_Elena`, `au:Fachechi_Alberto`, `au:Alemanno_Francesco`, `au:Aquaro_Miriam`, `sortBy=submittedDate`, `max_results=20` ;
- Crossref `https://api.crossref.org/works/<doi>` pour 5 DOI, et `works?query.bibliographic=` pour résoudre 4 références sans DOI connu ;
- Semantic Scholar en lot via `semantic-scholar/scripts/s2.py lookup` (16 identifiants, un appel ; l'appel direct `paper/batch` a répondu 429) ;
- GitHub `api.github.com/repos/francescoalemanno/hebb-attention`.

**Comptes** : brut 87 résultats arXiv (5 recherches auteurs) + 13 identifiants fournis + 2 DOI → **21 identifiants distincts dans la fenêtre** (18 prépublications 2025-2026, 1 révision v2 datée 2026-09, 2 DOI 2024) → **dédoublonné : 17** (4 déjà vus dans `docs/research/` du 2026-10-24 et du 2026-10-30 : 2609.32605, 2607.29554, 2605.13721, 2606.04651 ; 2 hors sujet écartés : 2512.10325 et 2511.09012, Alemanno seul, optimisation numérique) → **retenu : 19 entrées** (17 nouvelles + 2 déjà vues rappelées uniquement parce que leur statut a changé ou qu'une lecture complète du résumé apporte un fait non noté le 30/10).

**Dédoublonnage** : clone `hypneum-lab/.github` (profondeur 50) dans `repos/github/` ; `grep -rhoE '[0-9]{4}\.[0-9]{4,5}' docs/research/ | sort -u` → 772 identifiants arXiv déjà cités ; idem DOI → 171. Chaque entrée ci-dessous porte la mention **déjà vu** ou **nouveau**. La veille du 30/10 (`2026-10-30-etat-des-lieux/veille/lit-R1-R5.md`) avait classé 2609.32605 en « dépasse, risque de scoop partiel » sur H14/`recombine`, et noté 2607.29554 et 2606.04651 en une ligne chacune sans verdict ; 2605.13721 était déjà cité dans la revue du 24/10 (R1, R7, R9) avec sa version publiée (DOI 10.1016/j.neunet.2026.109729).

**Aucun résultat 2025-2026 pour Miriam Aquaro** (dernier arXiv : 2406.09924, juin 2024). Alemanno n'a qu'une prépublication 2025-2026 dans le sujet (2610.22191, seul auteur).

**Grille de lecture commune** : chez le groupe de Rome, les couplages sont de Hebb **fixés par construction** (y compris les termes anti-hebbiens inter-modules et le noyau de rêve), l'analyse passe par les répliques ou l'interpolation de Guerra, et la vérification par Monte Carlo à champ moyen sur des motifs de Rademacher. Hypneum travaille sur des réseaux **appris** (transport, gradient, LLM). Un « confirme » ci-dessous veut donc dire : l'énoncé tient dans le modèle à couplages fixés ; il reste à montrer qu'il survit à l'apprentissage.

---

## R1 — Rêve, sommeil, rejeu, Hopfield rêveurs (dream-of-kiki, NH-01, NH-03, E1-small)

- **arXiv:2605.13721** (2026-05-13 ; publié Neural Networks 206, 109729, daté févr. 2027, DOI 10.1016/j.neunet.2026.109729 confirmé Crossref) — *Do Hopfield Networks Dream of Stored Patterns? DLAM*, Barra, Durante, Ladiana, Marra Solazzo. **Déjà vu** (24/10 et 30/10). Rappelé pour un fait absent des notes précédentes : le champ local effectif se **décompose en trois termes** (signal, bruit de rêve intra-couche, bruit inter-couches), ce qui donne une décomposition d'énergie prête à être mesurée sur `HopfieldDreamWML`. Et la lecture complète dit explicitement que le mélange en entrée « blends noisy evidence from all sensory channels » et que chaque couche récupère un motif « modality-specific ».
  → Hypneum : **confirme** NH-01 (le rêve atténue sélectivement les modes de grande valeur propre ; un shrink uniforme ne le fait pas) et **pilote possible** pour R4 : DLAM est un modèle de séparation multi-modale à couplages fixés, c'est-à-dire un contrôle « sans apprentissage » pour bouba_sens (que donne la lésion d'une couche de DLAM ?). Impact : **Haut** (déjà compté le 30/10 ; le gain ici est la décomposition en trois bruits).

- **DOI 10.1016/j.neunet.2024.106174** (Neural Networks 173, 106174, mai 2024 ; Crossref : Agliari, Alemanno, Aquaro, Barra, Durante, Kanter) — *Hebbian dreaming for small datasets*. **Nouveau** (le DOI n'apparaît pas dans `docs/research/`). Version publiée, par les mêmes six auteurs, de arXiv:2204.07954 (*Recurrent neural networks that generalize from examples and optimize by dreaming*) ; la correspondance arXiv↔DOI est faite ici par l'ensemble des auteurs et le sujet, arXiv n'indiquant pas de champ DOI. Les motifs ne sont jamais vus : le réseau n'a que des exemples bruités, apprend en ligne par Hebb, et « dort » hors ligne. Résultat : le sommeil **réduit jusqu'à ≈ 90 % la taille du jeu de données** nécessaire pour généraliser, et il existe des charges inaccessibles sans sommeil quelle que soit la taille des exemples.
  → Hypneum : **confirme** la lecture « compromis données-calcul » de DLAM (c'est l'antécédent auto-associatif que DLAM dit étendre) et donne à NH-01 une **seconde grandeur à répliquer** : non plus la capacité α, mais la taille d'échantillon critique en fonction de t. Pour E1-small, c'est la prédiction la plus proche d'un protocole « apprentissage à partir d'exemples » : la bonne variable n'est pas t seul mais (ρ, t). Impact : **Haut**.

- **DOI 10.1016/j.neunet.2024.106389** (Neural Networks 177, 106389, sept. 2024 ; Crossref : Agliari, Alemanno, Aquaro, Fachechi) — *Regularization, early-stopping and dreaming: a Hopfield-like setup to address generalization and overfitting*. **Nouveau**. Version publiée de arXiv:2308.01421 (même titre, mêmes auteurs). On cherche les couplages par **descente de gradient sur une perte régularisée** ; les matrices optimales sont exactement des noyaux de Hebb révisés par un désapprentissage réitéré, et **le temps de rêve t est fonction de l'hyperparamètre de régularisation et du temps d'entraînement**. Régimes sur-apprentissage / échec / succès selon les paramètres du jeu de données.
  → Hypneum : **dépasse** sur un point central de la position Hypneum : c'est le seul papier du groupe où le noyau de rêve est **appris** (gradient) et non posé, et il identifie rêve = régularisation + early-stopping. Pour NH-01 cela dit que « rêve ≠ downscale » doit être testé contre une **régularisation ridge à budget égal**, pas seulement contre un shrink uniforme (la revue du 30/10 notait déjà « réplication de Fachechi–Agliari–Barra / ridge »). Pour NH-03 « quand dormir », l'équivalence t ↔ early-stopping est une piste directe : arrêter tôt *est* dormir plus. Impact : **Haut**.

- **arXiv:2605.10304** (2026-05-11) — *Partial annealing and pattern decorrelation in associative neural networks*, Albanese, Alessandrelli, Barra, Franz, Ricci-Tersenghi. **Nouveau**. Les motifs évoluent lentement, couplés à la dynamique neuronale rapide (cadre deux températures, deux échelles de temps) ; le paramètre réel n joue le rôle du nombre de répliques. Pour **n négatif**, les motifs stockés se **décorrèlent progressivement**, l'interférence baisse, et la capacité atteint **α_c = 1** ; Monte Carlo à champ moyen ; restaure le rappel avec des motifs biaisés, mieux que les décorrélations standard.
  → Hypneum : **dépasse / pilote possible** — c'est un **second mécanisme** qui atteint α → 1, distinct du noyau de rêve (ici les motifs bougent, pas le noyau). Cela fournit à NH-01 le contrôle qui manque : si recuit partiel et rêve donnent la même courbe, l'argument « le rêve a une formule propre » s'affaiblit. Directement pertinent pour le point ouvert « motifs corrélés m = 0,30 non concluant » : le recuit partiel est présenté comme un remède aux motifs biaisés. Impact : **Haut**.

- **arXiv:2503.15353v2** (2025-03-19, révisé 2025-10-15) — *The importance of being empty: a spectral approach to Hopfield neural networks with diluted examples*, Agliari, Fachechi, Luongo. **Nouveau**. Spectre des matrices de couplage (Marchenko–Pastur étendu) pour motifs définis, exemples étiquetés, exemples non étiquetés, avec **entrées vides** (données manquantes). Des entrées vides peuvent **aider** dans certaines conditions (sparsification des données) ; la matrice de Hebb sur exemples épars est le point fixe d'une **descente de gradient avec dropout**.
  → Hypneum : **outil réutilisable** (R1/R11) — pont Hebb fixé ↔ gradient avec dropout, utile pour justifier que les prédictions à couplages fixés s'appliquent à un réseau appris. Impact : **Moyen**.

- **arXiv:2601.07777** (2026-01-12 ; S2 signale une version Physica A, non confirmée par Crossref ici) — *Serial vs parallel recall in the Blume-Every-Griffiths neural networks* (titre arXiv tel quel, coquille pour Blume-Emery-Griffiths), Albanese, Alessandrelli, Barra, Cirillo. **Nouveau**. Re-dérivation rigoureuse par interpolation de Guerra, puis : la **dilution des motifs** fait passer du rappel sériel (un motif à la fois) au rappel **parallèle** (plusieurs à la fois) ; dilution modérée → rappel hiérarchique à amplitudes décroissantes, dilution extrême → une fraction O(1) des motifs rappelée à amplitude égale.
  → Hypneum : **Info** pour R1 (le rejeu de plusieurs souvenirs par épisode a une version à couplages fixés) ; pas de lien direct avec une hypothèse en cours. Impact : **Info**.

## R2 — Communication inter-modules, spécialisation émergente (nerve-wml N10-C/N10-D, kiki-flow-research)

- **arXiv:2501.16789v2** (2025-01-28, révisé 2025-10-15 ; publié Neural Networks 194, 108181, févr. 2026, DOI 10.1016/j.neunet.2025.108181 résolu Crossref sous le titre *Networks of Hebbian networks: more is different*) — Agliari, Alessandrelli, Barra, Centonze, Ricci-Tersenghi. **Nouveau** (ni l'arXiv ni le DOI ne sont dans `docs/research/`). Un assemblage de réseaux de Hopfield en couches, intra-couche hebbien et inter-couches **anti-hebbien**, exécute spontanément le **désenchevêtrement** : entrée = accord, sortie = les notes. Conditions sur les paramètres de contrôle obtenues par mécanique statistique des systèmes désordonnés, motifs de Rademacher.
  → Hypneum : **infirme partiellement** l'interprétation du nul de kiki-flow : la spécialisation de modules sur les constituants d'un mélange **existe** quand la compétition inter-modules est posée (anti-Hebb), elle n'émerge pas d'un apprenant continu par transport sans ce terme. C'est l'article fondateur de la série que `recombine`/H14 recoupe ; à citer avant 2609.32605. Impact : **Haut**.

- **arXiv:2609.32605** (2026-09-26) — *Dense auto-hetero associative memories applied to noisy communication channels*, Agliari, Alessandrelli, Barra, Fachechi. **Déjà vu** (30/10 : « dépasse, risque de scoop partiel » sur H14). Rappelé pour la partie R2 non exploitée le 30/10 : le **protocole de communication** transmet chaque jeton comme un **mélange masqué** de motifs cachés, décodé par la dynamique d'attracteurs, et « dégrade gracieusement » sous forte corruption du canal là où les pipelines classiques cassent net.
  → Hypneum : **dépasse** sur le vocabulaire (canal, jeton, décodage), mais **ne recouvre pas** le cœur de N10-C : le code n'est pas appris, aucun bras « sans communication » ni « registré » n'est testé, pas de mesure de spécialisation émergente. Voir la section scoop. Impact : **Moyen** pour R2 (Haut déjà compté pour R1/H14 le 30/10).

- **arXiv:2610.08612** (2026-10-06) — *Classifications in modular restricted Boltzmann machines*, Agliari, Lepre, Roscani. **Nouveau**. L Hopfield couplés (intra hebbien, inter anti-hebbien) ≡ assemblage de L RBM aux couches cachées couplées (extension de la dualité HM-RBM au modulaire). RBM modulaire **entraînée par divergence contrastive** pour classer une requête en un L-uplet d'étiquettes ; **preuve** que les poids « moyenne empirique » sont un point fixe de la dynamique d'apprentissage avec **borne non asymptotique sur la dérive** ; numériquement, classe et désenchevêtre un mélange à la fois.
  → Hypneum : **outil réutilisable** et le papier du groupe le plus proche d'un réseau appris : il dit où l'apprentissage par gradient (CD-1) converge vers les couplages fixés de la théorie. Pour N10-D, c'est le modèle jouet minimal pour tester si la spécialisation émerge **sans** poser l'anti-Hebb (initialiser la RBM modulaire à zéro et regarder si le point fixe est atteint). Impact : **Haut**.

- **arXiv:2503.06274v2** (2025-03-08, révisé 2025-04-10) — *Multi-channel pattern reconstruction through L-directional associative memories*, Agliari, Alessandrelli, Duarte Mourão, Fachechi. **Nouveau**. Numérique uniquement : L réseaux de Hopfield, intra imitatif, inter anti-imitatif, reconstruisent **tout l'ensemble** des motifs cachés à partir de mélanges bruités ; jeux sans structure et structurés.
  → Hypneum : **Info** — pièce intermédiaire entre 2501.16789 et 2609.32605. Impact : **Info**.

- **arXiv:2505.18796** (2025-05-24 ; publié Physica A 676, 130871, oct. 2025, DOI 10.1016/j.physa.2025.130871 confirmé Crossref) — *Supervised and Unsupervised protocols for hetero-associative neural networks*, Alessandrelli, Barra, Ladiana, Lepre, Ricci-Tersenghi. **Nouveau**. Mémoire tri-directionnelle (TAM) : trois couches binaires, couplages hebbiens généralisés, triplets de motifs ; équations d'auto-cohérence donnant les **tailles critiques de jeu de données** (seuils d'apprentissage) en supervisé et non supervisé ; interaction coopérative des couches.
  → Hypneum : **outil réutilisable** (R2/R11) — seuils analytiques de taille d'échantillon par couche, utiles comme borne de référence pour N10-D si un bras « hétéro-associatif » est ajouté. Impact : **Moyen**.

- **arXiv:2503.04454** (2025-03-06) — *Beyond Disorder: Unveiling Cooperativeness in Multidirectional Associative Memories*, Alessandrelli, Barra, Ladiana, Lepre, Ricci-Tersenghi. **Nouveau** (absent de la liste fournie, trouvé par `au:Barra_Adriano`). TAM avec jeux de données **d'entropies hétérogènes** par couche : on attendrait des régions de rappel plus petites pour les couches moins informées ; au contraire **toutes les régions s'alignent à la même amplitude** (« coopérativité des couches »).
  → Hypneum : **pilote possible** pour N10-D — c'est l'énoncé « le module le mieux informé tire les autres » en version à couplages fixés ; à comparer avec la direction d'oubli dans kiki-flow (0,361 ± 0,010 : qui oublie, le module riche ou le pauvre ?). Impact : **Moyen**.

- **arXiv:2607.29554** (2026-07-31) — *Exponential Capacity in Multilayer Hetero-Associative Neural Networks*, Agliari, Barra, Ladiana, Lepre. **Déjà vu** (30/10, une ligne). Fait non noté : l'association stockée **doit être une fonction surjective de l'indice**, « nothing else can be stored at all » ; capacité P_c ∼ e^{Nρ_L} avec ρ_L ∼ L log 2 ; mêmes formes closes, sans réajustement, sur une variété synthétique, des triplets TCR/épitope et des intentions en langage naturel ; **mémorisation exponentielle et généralisation sont deux capacités distinctes**.
  → Hypneum : **Info** mise à jour ; la phrase « stockage exponentiel ≠ généralisation » est à garder pour R11 (ne pas lire une capacité comme un transfert). Impact : **Info**.

## R11 / R7 — Maths structurelles, verres de spin, nuls calibrés

- **arXiv:2610.22191v2** (2026-10-15, révisé 2026-10-17) — *Attention over noisy examples: generalization and memorization in the exponential Hopfield network*, Alemanno (seul). **Nouveau** (absent de la liste fournie, trouvé par `au:Alemanno_Francesco`). Hopfield exponentiel = **une étape d'attention softmax** avec les exemples non étiquetés comme clés ; analyse signal/bruit en forme close : loi de majorité où une **entropie d'attention** remplace l'entropie du jeu de données. Haute température : l'archétype se perd ; basse : le softmax gèle sur l'exemple le plus proche (modèle à énergies aléatoires) et **mémorise** ; entre les deux, fenêtre de largeur ∝ √N où la couche généralise à toute charge fixée. Sur MNIST/fashion-MNIST, la meilleure précision est **au-delà du gel**. Code, données et Monte Carlo : `github.com/francescoalemanno/hebb-attention` (MIT, poussé le 2026-10-17, 0 étoile, dépôt TeX+code).
  → Hypneum : **outil réutilisable** — formule close généralisation/mémorisation pour une couche d'attention, directement utilisable comme nul calibré (R11) quand on mesure la « mémorisation » d'un module ; la contradiction théorie (fenêtre) / données structurées (optimum après le gel) est exactement le type d'écart à documenter. Impact : **Moyen**.

- **arXiv:2606.04651** (2026-06-03) — *Spectral criteria for generalization in unsupervised Hebbian nets*, Agliari, Duarte Mourão, Fachechi, Vivo. **Déjà vu** (30/10, une ligne « rattrapage juin »). Résumé complet : spectre asymptotique de la matrice d'interaction par matrices aléatoires + répliques ; la généralisation s'allume à une **transition spectrale nette** (deux bulks séparés, informatif et bruit, contre un bulk fusionné) ; avec régularisation, la séparation **prédit** la reconstruction des vecteurs cachés.
  → Hypneum : **outil réutilisable** (R11) — critère spectral « deux bulks » comme test de généralisation a priori, applicable à toute matrice de couplage, apprise ou non. Impact : **Moyen**.

- **arXiv:2509.06905** (2025-09-08 ; S2 signale Physica A, 10 citations, non confirmé par Crossref ici) — *Yet another exponential Hopfield model*, Albanese, Alessandrelli, Barra, Sollich. **Nouveau**. Coût = exponentielle de pertes quadratiques ; non champ moyen mais traitable ; motifs stables jusqu'à un nombre exponentiel en N ; élargir les bassins réduit la charge mais garde l'exponentielle.
  → Hypneum : **Info** (R11) — référence de capacité pour comparer les mémoires denses. Impact : **Info**.

- **arXiv:2511.02441v2** (2025-11-04, révisé 2025-11-21 ; S2 signale Physica A) — *On the supra-linear storage in dense networks of grid and place cells*, Barra, Centonze, Marra Solazzo, Tantari. **Nouveau**. Cellules de lieu interagissant avec des **paires** de cellules de grille ≡ réseau dense de type Battaglia–Treves à interactions à quatre corps ; stockage **supra-linéaire** d'attracteurs continus prouvé analytiquement ; navigation sur surfaces plongées en 3D, numérique.
  → Hypneum : **Info** — hors axes actifs (cartes cognitives) ; à garder si R4 touche aux représentations spatiales. Impact : **Info**.

- **arXiv:2505.06202** (2025-05-09 ; S2 signale J. Math. Phys., non confirmé ici) — *Guerra interpolation for inverse freezing*, Albanese, Barra, Cirillo. **Nouveau** (absent de la liste fournie). Ghatak–Sherrington, Katayama–Horiguchi et BEG-Capel désordonné comme limites d'un hamiltonien unique ; énergies libres recuite et trempée, RS et 1RSB ; ligne de de Almeida–Thouless nouvelle.
  → Hypneum : **Info** (R7, méthode). Impact : **Info**.

- **arXiv:2409.10145v2** (soumis 2024-09-16, **révisé 2026-09-17**) — *The infinite volume limit of the Hopfield neural networks in the replica-symmetric regime*, Agliari, Barra, Bianco, Fachechi, Pallara. **Nouveau** ; hors fenêtre par la date de soumission, signalé pour la révision. Interpolation nouvelle : énergie libre de Hopfield = combinaison d'énergies libres de verres de spin durs et mous + reste positif ⇒ **borne rigoureuse**, non plus approximation, et existence de la limite thermodynamique en RS.
  → Hypneum : **Info** (R11) — c'est l'énoncé « la théorie RS de Hopfield est une borne » à citer si NH-01 compare des capacités à N fini aux prédictions RS. Impact : **Info**.

---

## 5 papiers à lire cette semaine

1. **DOI 10.1016/j.neunet.2024.106389** (Agliari, Alemanno, Aquaro, Fachechi 2024) — le noyau de rêve **appris** par gradient ; fixe la bonne baseline (ridge + early-stopping) pour NH-01 et une piste pour NH-03.
2. **DOI 10.1016/j.neunet.2024.106174** (Agliari et al. 2024) — réduction ≈ 90 % des données par le sommeil ; seconde grandeur réplicable pour E1-small.
3. **arXiv:2605.10304** (Albanese et al. 2026) — recuit partiel, α_c = 1 par un autre mécanisme ; contrôle indispensable pour « le rêve a une formule propre » et pour les motifs corrélés.
4. **arXiv:2501.16789** / DOI 10.1016/j.neunet.2025.108181 (Agliari et al. 2026) — l'article fondateur du désenchevêtrement modulaire ; à citer avant 2609.32605 et à opposer au nul de kiki-flow.
5. **arXiv:2610.08612** (Agliari, Lepre, Roscani 2026) — RBM modulaire apprise par CD-1 avec borne de dérive ; modèle jouet pour N10-D « la spécialisation émerge-t-elle sans anti-Hebb posé ? ».

## Hypothèses déjà faites ailleurs (risque de scoop)

| Hypothèse Hypneum | Travail du groupe de Rome | Recouvrement chiffré | Conseil |
|---|---|---|---|
| N10-C « closed/registered × gtm/nocomm » : canal discret émergent entre modules | 2609.32605 (protocole : jeton = mélange masqué décodé par attracteurs) | **1 cellule sur 4** du plan : seul le bras « canal présent, code fixé » existe chez eux ; rien d'appris, aucun bras nocomm ni registered, aucune mesure d'émergence | Citer comme borne « code non appris » et ajouter, comme le 30/10 le suggérait pour Latent Telepathy, un bras « code hebbien fixé » |
| N10-D (suite) : spécialisation inter-modules | 2503.04454 (coopérativité des couches), 2505.18796 (seuils par couche) | Recouvrement **de l'énoncé seulement** : « les couches s'alignent » est prouvé pour TAM à couplages fixés, **0 %** sur le mécanisme appris | Préenregistrer une prédiction d'équivalence : même amplitude de rappel par module, oui/non |
| kiki-flow : spécialisation émergente d'un apprenant continu par transport = **nul** (oubli 0,361 ± 0,010) | 2501.16789, 2503.06274, 2609.32605, 2610.08612 : spécialisation **spontanée** des modules sur les constituants | Le mot « spontané » recouvre **100 %** de l'énoncé, mais chez eux l'anti-Hebb inter-module est **posé** ; le résultat positif de Rome contre le nul de kiki-flow isole **un ingrédient** (compétition inter-module explicite) absent du transport | Reformuler le nul : « pas de spécialisation sans terme compétitif » et tester un bras avec terme anti-Hebb appris |
| NH-01 « le rêve a une formule », t* = 7 fini, diagonale retirée, cue bruité | 2605.10304 (recuit partiel → α_c = 1), 10.1016/j.neunet.2024.106389 (rêve = ridge + early-stopping) | Deux mécanismes concurrents atteignent la même capacité ; le « rêve ≠ downscale » de NH-01 n'exclut **aucun des deux** | Ajouter les deux comme contrôles à budget égal avant de parler d'optimum fini |
| NH-03 « quand dormir » | 10.1016/j.neunet.2024.106389 : t ↔ temps d'entraînement et régularisation | Partiel : ils donnent la **relation**, pas la politique de déclenchement | Utiliser la relation comme prédiction quantitative du moment optimal |
| H14 / `recombine` = séparation de mélanges | DLAM publié + 2609.32605 + 2501.16789 | Déjà chiffré le 30/10 (« prouvé et étendu à capacité linéaire ») ; inchangé | Citer les trois, positionner GENIAL comme axiomatisation |

## Outils à adopter

- **`francescoalemanno/hebb-attention`** (MIT, 2026-10-17) : code + données + Monte Carlo de 2610.22191 ; formule close généralisation/mémorisation d'une couche d'attention comme nul calibré R11.
- **Décomposition du champ local en trois bruits** (DLAM, 2605.13721) : signal / rêve intra / inter-couches, à instrumenter dans `HopfieldDreamWML`.
- **Critère spectral « deux bulks »** (2606.04651, 2503.15353) : test de généralisation a priori sur toute matrice de couplage, apprise ou non.
- **Seuils analytiques de taille d'échantillon par couche** (2505.18796, Physica A) : bornes de référence pour N10-D.
- **Recuit partiel n < 0** (2605.10304) : décorrélateur de motifs biaisés, contrôle pour le niveau m = 0,30.

## Non vérifié / inaccessible

- **Statuts de publication signalés par Semantic Scholar seulement** (non confirmés par Crossref dans cette veille) : 2601.07777 et 2511.02441 et 2509.06905 en Physica A ; 2505.06202 en J. Math. Phys. ; arXiv n'indique pas de `journal_ref` pour eux. À citer sous leur identifiant arXiv tant que le DOI n'est pas résolu.
- **Correspondance arXiv:2204.07954 ↔ DOI 10.1016/j.neunet.2024.106174** : établie par les six auteurs identiques et le sujet, pas par un champ DOI arXiv (titre changé à la publication).
- **Nombres de citations S2** (ex. 10 pour 2509.06905, 7 pour 2501.16789) : non recoupés avec une autre source.
- **Texte intégral** : aucun PDF lu ; toutes les entrées reposent sur les résumés arXiv complets (API) et les métadonnées Crossref. Les affirmations fines (constante exacte de ρ_L, bornes de dérive de 2610.08612) sont à vérifier dans le corps des articles.
- L'appel direct `api.semanticscholar.org/graph/v1/paper/batch` a répondu 429 ; le passage par `s2.py` (clé + repli OpenAlex) a fonctionné.
- Miriam Aquaro : aucune prépublication 2025-2026 trouvée ; une recherche par variantes de nom n'a pas été faite.

## Citations manquantes dans Hypneum

La revue du 24/10 (`synthese/11-critique-independante.md`, `12-critique-astra.md`) et la veille du 30/10 (`veille/plagiat-reutilisation.md`) ont vérifié par `git grep` l'absence de ces trois références dans dream-of-kiki, nerve-wml et kiki-flow-research (Paper 1 : 81 entrées, 0 occurrence) ; seule la préreg NH-01 cite Fachechi 2019. DOI résolus aujourd'hui via Crossref `query.bibliographic`, puis `works/<doi>` :

| Référence | DOI (Crossref, 2026-11-01) | Où la citer |
|---|---|---|
| Crick, F. & Mitchison, G., *The function of dream sleep*, Nature 304, 111-114 (juil. 1983) | **10.1038/304111a0** | Paper 1 dream-of-kiki, préreg NH-01, README nerve-wml (origine de « rêver = désapprendre ») |
| Hopfield, J. J., Feinstein, D. I. & Palmer, R. G., *‘Unlearning’ has a stabilizing effect in collective memories*, Nature 304, 158-159 (juil. 1983) | **10.1038/304158a0** | Même endroits ; c'est la première implémentation du désapprentissage sur Hopfield que le noyau de Fachechi formalise |
| Fachechi, A., Agliari, E. & Barra, A., *Dreaming neural networks: Forgetting spurious memories and reinforcing pure ones*, Neural Networks 112, 24-40 (avr. 2019) | **10.1016/j.neunet.2019.01.006** (déjà dans `docs/research/`, absent des dépôts de code) | Paper 1, soumission ReScience C NH-01 (référence répliquée), nerve-wml `HopfieldDreamWML` |
| Complément : Agliari, Alemanno, Barra, Fachechi, *Dreaming neural networks: rigorous results*, J. Stat. Mech. 2019, 083503 | **10.1088/1742-5468/ab371d** | ReScience C NH-01 (version rigoureuse du même noyau) |

Les deux Neural Networks 2024 (10.1016/j.neunet.2024.106174 et 10.1016/j.neunet.2024.106389) sont également absents de `docs/research/` et devraient rejoindre la bibliographie de NH-01 et NH-03.
