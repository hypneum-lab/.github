# R7 — La matière comme modèle formel et comme substrat pour Hypneum Lab

Cristallisation / alignement · changements d'état · spin de l'électron
2026-10-24 · évaluation pour le PI (Clément Saillant) · lecture seule des dépôts

**Méthode et budget réellement consommés.** Contexte lu : `veille-2026-10-23.md`
et README de `dream-of-kiki`, `nerve-wml`, `kiki-flow-research` (plus
`docs/specs/2026-05-20-biophysical-stratification.md`, `docs/substrate-paradigms.md`,
`track_p/oscillators.py`, `track_p/multiplexer.py`). Recherche : 23 requêtes
WebSearch (dont 17 en mode « extended »), 21 requêtes API arXiv + 2 lots
`id_list` (63 identifiants confirmés : titre, auteurs, date, résumé), ~20
requêtes/fiches GitHub (`gh search`, `gh api`), ~25 requêtes API Hugging Face
(papers / models / datasets), 60 DOI résolus via Crossref, 2 articles Nature 2026
et 1 deck Toshiba (PDF, 14 pages) lus. Fichiers bruts : `research/r7-raw/`.
**Limites** : tarification D-Wave Leap non vérifiée (page derrière login) ;
communiqué Aalto (cristal temporel) inaccessible (HTTP 500) ; revue CISS
*Nanoscale* 2026 vue uniquement en résultat de recherche (DOI non résolu) ;
Knowm (memristors) et IonQ non évalués (budget WebSearch épuisé en fin de passe).
Toute source non revue par les pairs (prépublication, presse, deck) est marquée
**[prépub.]**, **[presse]** ou **[deck]** ; les prépublications mono-auteur 2026
sont marquées **[mono]** et pèsent peu.

---

## 1. Cadrage — ce que le PI vise et les trois lectures possibles

**Ce que le PI vise probablement.** Sortir du paradigme LLM en important des
concepts qui ont déjà une théorie quantitative mûre (ordre/désordre, nucléation,
recuit, frustration, synchronisation) pour obtenir des *prédictions chiffrées*
sur trois objets du programme : la consolidation bornée (GENIAL, DR-0), le
transport de messages discrets multiplexés γ/θ (nerve-wml) et la spécialisation
par flot de gradient de Wasserstein (kiki-flow). Le mot « cristallisation »
recouvre trois intuitions distinctes qu'il faut séparer : (i) *ordre* (passage
d'un état désordonné à un état ordonné : grokking, émergence), (ii) *alignement*
(orientation commune de grains : convergence des représentations) et
(iii) *stabilité* (une mémoire « cristallisée » résiste au bruit : consolidation).

**Trois lectures, à ne jamais confondre dans un papier.**

| Lecture | Ce qu'elle apporte | Ce qu'elle coûte | Verdict R7 |
|---|---|---|---|
| **A. Analogie** (vocabulaire : « le rêve recuit les poids ») | Intuitions, figures, cadrage | Non falsifiable ; attire la critique « physics-washing » | À bannir des claims ; tolérée en discussion si étiquetée |
| **B. Modèle formel** (équation partagée + prédiction chiffrée) | Hypothèses réfutables, lois d'échelle, paramètres d'ordre | Il faut que l'équation soit *la même*, pas « ressemblante » | **Oui**, sur 4 ponts solides (§3) |
| **C. Substrat** (une physique exécute un WML / un épisode de rêve) | Preuve DR-3 hors silicium, hors LLM ; nouveaux comparateurs | Matériel inaccessible (spintronique = labo) ; simulateurs GPU | **Oui en simulation**, zéro achat matériel avant résultat positif |

**Ce que le programme possède déjà** (vérifié dans les dépôts) : un bras Kuramoto
et un balayage AKOrN dans `nerve-wml/track_p` (86 occurrences « kuramoto »),
un stratum 5 « criticalité » explicitement *spéculatif et conditionnel* dans
dream-of-kiki, un flot JKO entropique avec particules de Langevin et profils de
Turing dans kiki-flow (erratum du 24/10 sur l'opérateur proximal). En revanche :
**zéro occurrence de « Hopfield »** dans les trois dépôts, 2 de « crystalliz* »,
4 de « anneal* », 3 de « phase transition ». Le vide le plus coûteux est
l'absence totale de la littérature « réseaux de Hopfield rêveurs /
désapprentissage » (§2.1), qui est pourtant le modèle formel le plus proche de
« consolidation par rêve » depuis 1983.

**Critère d'admission dans un éventuel axe « Hypneum matière »** : une physique
n'entre que si elle fournit (a) une équation effectivement partagée avec un
dépôt existant et (b) une prédiction chiffrée réfutable sur Mac M1 32 Go,
RTX 4090 ou simulateur libre, avec baseline non physique appariée.

---

## 2. État de l'art par sous-axe

Colonnes : référence (vérifiée) | date | résultat | lecture (A analogie / B
modèle / C substrat) | relation à Hypneum : **appuie / contredit / dépasse /
neutre** + dépôt concerné.

### 2.1 Cristallisation, alignement, ordre

| Réf. | Date | Résultat | Lect. | Relation / dépôt |
|---|---|---|---|---|
| Rubin, Seroussi, Ringel — *Grokking as a first-order phase transition in two-layer networks*, arXiv:2310.03789 | 2023 | Grokking = transition du 1er ordre (noyau adaptatif) ; « gouttelettes » de bonnes représentations = nucléation | B | **Appuie** l'idée consolidation = nucléation ; dream-of-kiki |
| Ersoy & Wiesner — *Noise-driven escape from metastable phases explains grokking*, arXiv:2606.17120 [prépub.] | 2026-06 | Hystérésis d'une transition du 1er ordre pilotée par L2 ; temps d'échappement ∝ Arrhenius ; nb d'états métastables = nb de valeurs singulières de la covariance | B | **Dépasse** : fournit une loi quantitative (Arrhenius) transposable au budget DR-0 ; dream-of-kiki, kiki-flow |
| Truong et al. — *Spectral entropy collapse as a phase transition in delayed generalisation*, arXiv:2604.13123 [prépub.] | 2026-04 | L'entropie spectrale de la covariance des représentations franchit un seuil *avant* la généralisation ; interventionnel, multi-graines | B | **Appuie** : paramètre d'ordre mesurable (famille I/S de GENIAL) ; dream-of-kiki |
| Wang — *Grokking as dimensional phase transition*, arXiv:2604.04655 [prépub.][mono] | 2026-04 | Dimension effective D traverse 1 à l'onset ; « criticalité auto-organisée » revendiquée | A/B | **Neutre** ; source faible (mono-auteur, pas de code vu) |
| Ootani — *Grokking is conditional and fragile*, arXiv:2607.05104 [prépub.][mono] | 2026-07 | Grokking mesuré comme *taux* multi-graines sur un transformeur de 12 k paramètres : conditionnel, fragile | méthodo | **Appuie** la discipline multi-seed du labo ; tous dépôts |
| Yang — *Feature lottery? A bifurcation theory of concept emergence*, arXiv:2605.24057 [prépub.][mono] | 2026-05 | Émergence = bifurcation fourche supercritique du hessien ; brisure de symétrie collective ; pureté précoce (5 %) prédit pureté finale | B | **Appuie** spécialisation = nucléation ; kiki-flow |
| Truong — *Emergence via phase transitions (HEF)*, arXiv:2606.07563 [prépub.][mono] ; Pandey — *Thermodynamic weight decay*, arXiv:2607.20552 [prépub.][mono] | 2026-05/07 | Collapse tanh des courbes de grokking (R²=0,93, 111 runs) ; « chaleur spécifique de l'attention » (variance des logits) accélère le grokking (p=0,049, 1 tâche) | A | **Neutre** : vocabulaire thermodynamique sans grandeur thermodynamique ; à ne pas citer comme appui |
| Lakkapragada — SLT & grokking, arXiv:2512.00686 [prépub.][mono] | 2025-11 | Coefficient d'apprentissage local comme détecteur de transitions | B | Neutre |
| Huh et al. — PRH, arXiv:2405.07987 ; Gröger et al. 2026 (vue aristotélicienne) ; You et al. arXiv:2609.27252 (cf. veille) | 2024–2026 | Ce qui converge est la **structure relationnelle**, pas la géométrie métrique | B | **Contredit** la lecture « épitaxie / alignement d'orientation » : un cristal aligne des *orientations* (géométrie), les modèles alignent des *voisinages* (topologie). DR-3 et test (6) nerve-wml : déjà en reformulation |
| Khona & Fiete — *Attractor and integrator networks in the brain*, Nat Rev Neurosci 2022 (doi:10.1038/s41583-022-00642-0) | 2022 | Les cellules de grille forment un réseau hexagonal (cristal 2D) issu d'une formation de motifs ; attracteurs continus | B | **Appuie** kiki-flow (profils de Turing déjà dans le papier) : seule « cristallisation » littérale du cerveau |
| Hopfield, Feinstein & Palmer — *'Unlearning' has a stabilizing effect in collective memories*, Nature 304:158 (1983) ; Crick & Mitchison — *The function of dream sleep*, Nature 304:111 (1983) | 1983 | Le rêve REM = désapprentissage hebbien des attracteurs parasites | B | **Dépasse** : prior art direct de « consolidation par rêve », absent des trois dépôts |
| Fachechi, Agliari, Barra — *Dreaming neural networks*, Neural Networks 112 (2019) (doi:10.1016/j.neunet.2019.01.006) ; Agliari et al. — *rigorous results*, J. Stat. Mech. 2019 (doi:10.1088/1742-5468/ab371d) | 2019 | Noyau « rêvé » J(t)=J(1+t)/(1+tJ) : capacité α_c passe de 0,138 à 1 quand le temps de rêve t→∞ ; convergence prouvée vers la projection sur les motifs purs | B | **Dépasse** : un *temps de rêve fini t* est exactement un budget DR-0 avec prédiction chiffrée α_c(t) ; dream-of-kiki, nerve-wml |
| Serricchio et al. — *Daydreaming Hopfield networks and their surprising effectiveness on correlated data*, Neural Networks 2025 (doi:10.1016/j.neunet.2025.107216) ; Doi, Ohzeki, Ricci-Tersenghi — *Daydreaming algorithm for biased patterns*, J. Stat. Mech. 2026 074001 (arXiv:2604.19258) | 2025–2026 | Règle itérable indéfiniment (plus d'early-stopping) ; version centrée pour motifs biaisés, bassins plus larges que la pseudo-inverse | B | **Appuie** DR-4 (recombinaison) : les données corrélées sont le cas Hypneum ; dream-of-kiki |
| Takeuchi, Takahashi, Kabashima — *Hopfield model incorporating unlearning*, arXiv:2602.08428 [prépub.] ; Marinari, Rossi, Zamponi — *Dreaming improves memorization with bounded synaptic strength*, arXiv:2603.09384 [prépub.] ; Barra et al. — *DLAM*, arXiv:2605.13721 [prépub.] | 2026 | Répliques (RS) du désapprentissage ; synapses bornées (« clipping ») = palimpseste sans oubli catastrophique, rêve améliore la mémorisation ; rêve + couplage hétéro-associatif multi-couches dans une seule énergie | B | **Dépasse** : « clipping » = DR-0 au niveau synaptique ; DLAM = rêve *inter-modules*, i.e. nerve-wml ; dream-of-kiki, nerve-wml |
| Wilczek — PRL 109, 160401 (2012) ; Zhang et al. Nature 543 (2017) ; Randall et al. Science 374 (2021) ; Fauseweh — *Local error correction prolongs time-crystalline memory*, arXiv:2610.18124 [prépub.][mono] | 2012–2026 | Cristaux temporels discrets : réponse sous-harmonique robuste sous pilotage périodique ; durée de vie limitée par l'environnement | A | **Neutre** : aucune équation partagée avec le multiplexage θ/γ (pas de localisation à N corps dans nerve-wml) ; métaphore seulement. Communiqués Aalto/ScienceDaily 2026 **[presse]**, non vérifiés |
| « Weight crystallization » / « crystallization of knowledge » | — | Terme **absent** de la littérature 2025–2026 (seule occurrence : logique de Łukasiewicz, 2016) | — | Ne pas l'employer comme mot-clé ni comme concept « établi » |

### 2.2 Changements d'état (transitions, verres, PCM, Wasserstein, criticalité)

| Réf. | Date | Résultat | Lect. | Relation / dépôt |
|---|---|---|---|---|
| Hopfield — PNAS 79:2554 (1982) ; Amit, Gutfreund, Sompolinsky — PRL 55:1530 (1985) | 1982–85 | Mémoire associative = verre de spin ; capacité 0,138 N par la méthode des répliques | B | Fondation du pont Ising↔Hopfield (§3) |
| Bahri et al. — *Statistical mechanics of deep learning*, Annu. Rev. Condens. Matter Phys. 11 (2020) ; Geiger et al. PRE 100 (2019) ; Spigler et al. J. Phys. A 52 (2019) | 2019–20 | Transition de *jamming* sous/sur-paramétrisation ; paysage de perte comme empilement de sphères | B | **Appuie** : seuil de capacité pour micro-kiki (adaptateurs) et surrogate kiki-flow |
| Barney, Winer, Galitski — *Neural networks as spin models: from glass to hidden order through training*, arXiv:2408.06421 [prépub.] | 2024 | Réseau à poids aléatoires = verre SK en couches (prouvé) ; l'entraînement fait émerger un « ordre caché » avec température de fusion mesurable | B | **Appuie** : paramètre d'ordre (T_fusion) pour la consolidation ; dream-of-kiki |
| Li — *A spin glass characterization of neural networks*, arXiv:2508.07397 [prépub.][mono] ; Rubin & Ringel — *RLVR landscapes… spin-glass theory*, arXiv:2609.28625 [prépub.] | 2025–26 | Distribution d'overlap P(q) comme descripteur ; paysage RLVR bénin par cartographie sur un modèle de spin | B | Neutre (LLM) ; P(q) réutilisable pour DR-3 (H13) |
| Giorlandino, De Giuli, Goldt — *Phase structure of the Random Language Model*, arXiv:2606.28103 [prépub.] | 2026-06 | Hiérarchie de transitions de phase dans des grammaires aléatoires (limite double) | B | **Appuie** l'« espèce » syntaxe de kiki-flow comme phase |
| Jordan, Kinderlehrer, Otto — SIAM J. Math. Anal. 29 (1998) ; Lisini, Matthes, Savaré — arXiv:1201.2367 (Cahn-Hilliard comme flot de gradient en métrique Wasserstein pondérée ; auteurs de mémoire, titre vérifié) ; Heinze, Hopf, Liero — *Dissipative solutions for fibred Wasserstein gradient flows of Cahn-Hilliard-type energies*, arXiv:2610.23718 [prépub.] | 1998–2026 | JKO = Fokker-Planck ; Cahn-Hilliard = JKO avec mobilité non linéaire ; **version multi-espèces (« fibrée ») avec interactions non linéaires entre types, convergence du schéma JKO prouvée** | B | **Dépasse** : kiki-flow est un JKO multi-espèces → il *est* un Cahn-Hilliard fibré dès qu'on met un potentiel double-puits ; la séparation de phase est la spécialisation |
| Cahn & Hilliard — J. Chem. Phys. 28 (1958) ; Bray — *Theory of phase-ordering kinetics*, Adv. Phys. 43 (1994) | 1958–94 | Décomposition spinodale ; lois de coarsening L(t)∝t^{1/3} (paramètre conservé, LSW) / t^{1/2} (non conservé) ; nucléation vs spinodale selon la profondeur de trempe | B | **Dépasse** : prédictions d'exposants pour la spécialisation (H3, H4) ; kiki-flow |
| Kuzum et al. Nano Lett. 2011 ; Tuma et al. Nat. Nanotech. 2016 ; Sebastian et al. Nat. Nanotech. 2020 ; Le Gallo et al. — *64-core… phase-change memory*, Nat. Electron. 2023 ; Nir-Harwood…Pop — *Energy and scaling limits of PCM*, arXiv:2605.28336 [prépub.] | 2011–2026 | GST : cristallisation = poids analogique ; neurones stochastiques ; puce Hermes 64 cœurs ; dizaines de fJ/bit, région active < 10 nm, limite ~aJ/nm³ ; dérive de conductance persistante | C | **Appuie** comme substrat simulable (IBM aihwkit, MIT) ; la *cinétique* de cristallisation GST n'a aucun rapport mécaniste avec l'oubli, seule la dérive en loi de puissance en a un (H10) ; nerve-wml (artefact INT8) |
| Kim et al. — on-chip Hebbian, Adv. Mater. 2025 ; Shooshtari et al. — revue memristors, Adv. Intell. Syst. 2026 (vus en recherche web, non lus) | 2025–26 | Apprentissage hebbien sur matrice 6×6 memristive | C | Neutre : échelle jouet, pas de kit accessible identifié |
| Beggs & Plenz — J. Neurosci. 2003 ; Sipling, Zhang, Di Ventra — *A critical assessment of the brain criticality hypothesis*, arXiv:2604.21071 [prépub.] ; Crosser & Brinkman arXiv:2512.18113 [prépub.] ; Du et al. — *Fisher information metric… criticality*, arXiv:2609.07624 [prépub.] ; Xiao et al. arXiv:2605.22598 [prépub.] ; Topal et al. arXiv:2602.17820 [prépub.] ; Vock & Meisel arXiv:2608.28431 (veille) | 2003–2026 | Avalanches en loi de puissance ; **contre-modèle** : couplage à une ressource lente (« mémoire ») produit une phase d'ordre à longue portée sans point critique ; criticalité intrinsèque vs latente distinguable par perturbation ; FIM comme susceptibilité model-free ; codage efficace sous contrainte → criticalité + « sloppiness » | B | **Appuie et contredit** le stratum 5 : fournit la métrique (FIM) *et* le nul à battre (Di Ventra) ; dream-of-kiki |
| Ikeda, Akita, Takahashi — *Noise-driven spontaneous activity: homeostatic maintenance of criticality and memory consolidation*, arXiv:2502.10946 [prépub.] | 2025 | SNN + cultures dissociées : l'activité spontanée restaure criticalité et balance E/I après stimulation et prolonge la mémoire évanescente | B/C | **Appuie** épisodes de rêve = bruit homéostatique ; dream-of-kiki, nerve-wml (BioWML) |
| Tononi & Cirelli — Neuron 81 (2014) ; Massey et al. — arXiv:2601.08447 et arXiv:2609.13927 (IWAI 2026) [prépub.] ; Xie — arXiv:2603.14517 [prépub.][mono] | 2014–2026 | Downscaling synaptique ; régularisation homéostatique « sommeil » stabilise STDP dans des RSNN ; « sieste » comme minimisation d'énergie libre | B | **Appuie** DR-0 et replay+downscaling (veille Bazhenov) ; dream-of-kiki, nerve-wml (LifWML) |
| Fusi, Drew, Abbott — Neuron 45 (2005) ; Benna & Fusi — Nat. Neurosci. 19 (2016) | 2005–16 | Cascade / chaîne de variables à échelles de temps géométriques : oubli en loi de puissance au lieu d'exponentiel | B | **Appuie** : un programme de recuit = cascade d'échelles ; dream-of-kiki |
| Kirkpatrick, Gelatt, Vecchi — Science 220 (1983) ; Kadowaki & Nishimori — PRE 58 (1998) | 1983–98 | Recuit simulé / quantique | B | Fondation du pont recuit↔consolidation |
| Goto et al. Sci. Adv. 2019, 2021 ; Inagaki et al. Science 2016 ; Honjo et al. Sci. Adv. 2021 ; Mohseni, McMahon, Byrnes — Nat. Rev. Phys. 2022 ; Yao et al. — *FPGA natively sparse Ising machine*, Nat. Commun. 17:8549 (2026) ; Vadde…Åkerman — *2048-spin bulk acoustic wave Ising machine*, Commun. Phys. 9:290 (2026) ; Tatsumura — deck IWIM 2026 [deck] ; Shaglel et al. — benchmark Digital Annealer, New J. Phys. 2026 (arXiv:2507.22117) | 2016–2026 | Bifurcation simulée (SB) = changement d'état d'oscillateurs Kerr classicisés ; 20 000 variables sur un FPGA, int8 à 99 % de bSB float32 ; 2048 spins acoustiques (stabilité thermique ×10⁴ vs CIM) ; **SBM embarqué : 512 spins, 284 µs/run, 3,4 W** ; Gen3 « bord du chaos » (Phys. Rev. Applied 25, 044011, 2026) | C | **Neutre** pour le cœur scientifique (optimisation) ; substrat bon marché possible (FPGA PYNQ) ; l'image « bord du chaos » rejoint le stratum 5 sans l'appuyer |

### 2.3 Spin de l'électron

| Réf. | Date | Résultat | Lect. | Relation / dépôt |
|---|---|---|---|---|
| Grollier et al. — *Neuromorphic spintronics*, Nat. Electron. 3 (2020) ; Marković et al. — Nat. Rev. Phys. 2 (2020) ; Majumdar & Everschor-Sitte — chapitre arXiv:2409.10290 | 2020–24 | Revues de référence : oscillateurs, p-bits, skyrmions, réservoirs | B/C | Cadre général |
| Torrejon et al. — Nature 547 (2017) ; Romera et al. — *Vowel recognition with four coupled spin-torque nano-oscillators*, Nature 563 (2018) ; Zahedinejad et al. — Nat. Nanotech. 15 (2019/20) | 2017–20 | Un STNO = 400 neurones par multiplexage temporel ; **4 STNO couplés reconnaissent des voyelles par synchronisation** ; matrices 2D de SHNO mutuellement synchronisés | C | **Appuie** le lien direct avec le GTM : la reconnaissance se fait par *verrouillage de phase* ; mais ces travaux sont de la reconnaissance, pas un protocole de messages ; nerve-wml |
| Menshawy…Grollier, Mizrahi — *Remotely programming the weights of a spintronic neural network by a radiofrequency broadcast*, arXiv:2604.24561 [prépub.] (CNRS-Thales, INL Braga, Messina) ; Pereira…Finocchio, Rodrigues — arXiv:2603.03947 [prépub.] ; Raj et al. — arXiv:2605.29942 [prépub.] ; Bandekar et al. — arXiv:2605.22625 [prépub.] ; Horizumi, Chiba, Komine — J. Magn. Magn. Mater. 656 (2026) (arXiv:2603.01351) | 2026 | 22 synapses MTJ vortex programmées par diffusion RF (94,9 % chiffres) ; gradients analogiques par différences finies sur MTJ (93,3 %) ; synapses MRAM + neurones STNO vortex pour CNN ; neurones à parois de domaine (simulation) ; réservoir STO vortex évalué par équation de Thiele, bord du chaos par Lyapunov | C | **Appuie** : un WML sur réseau de STNO est désormais *simulable* (Thiele/LLG) ; le matériel reste réservé aux laboratoires ; nerve-wml |
| Wang & Roychowdhury — *OIM: Oscillator-based Ising machines*, arXiv:1903.07163 (2019) ; **Venkatakrishnan, Emerick, Bamieh, Bullo — *Mean-field oscillator Ising machines: gradient flows and classification of limit solutions*, arXiv:2608.16025 [prépub.]** ; Önder & Keser arXiv:2609.14550 [prépub.] ; Acker et al. arXiv:2607.00286 [prépub.] ; Rudner-Halász, Porod, Csaba arXiv:2608.25191 [prépub.] | 2019–2026 | Phases d'oscillateurs couplés sous verrouillage sous-harmonique ⇒ fonction de Lyapunov ≈ hamiltonien d'Ising ; **la limite champ moyen d'un OIM est un flot de gradient dans l'espace de Wasserstein**, points fixes binarisés (0/π) stables presque partout, seuil de binarisation borné ; ONN à couplages memristifs signés ; reconnaissance de formants par oscillateurs sans prétraitement | B/C | **Dépasse** : pont formel publié 2026 entre Kuramoto (nerve-wml) et JKO (kiki-flow) ; constellation PSK du GTM = clusters de phase d'un verrouillage harmonique ; nerve-wml, kiki-flow |
| Camsari, Faria, Sutton, Datta — PRX 7, 031014 (2017) ; Borders et al. — Nature 573 (2019) ; Aadit…Camsari — *Programmable probabilistic computer with 1,000,000 p-bits*, arXiv:2606.25313 [prépub.] ; Zhang…Camsari — CMFT, arXiv:2609.22645 [prépub.] ; Delacour…Camsari — *Probabilistic algorithms for Ising machines from optimization to generative AI*, Nat. Rev. Electr. Eng. 2026 (arXiv:2610.03972) ; Fang et al. — arXiv:2610.31339 [prépub.] | 2017–2026 | p-bits ; factorisation par MTJ stochastiques ; **10⁶ p-bits, >10¹² flips/s, précision gouvernée par le ratio fréquence d'échange aux frontières / fréquence de mise à jour locale** ; théorie champ moyen par clusters ; revue des algorithmes (recuit, parallel tempering, PAOA) ; p-bits à états continus (FPGA) | B/C | **Dépasse** : le ratio échange/mise à jour est une *loi de conception* pour la cadence θ des neuroletters (H9) ; échantillonnage de Gibbs à budget fini = épisode DE (DR-0) ; nerve-wml, dream-of-kiki |
| Prychynenko et al. — Phys. Rev. Applied 9 (2018) ; Lee et al. — *Task-adaptive physical reservoir computing*, Nat. Mater. (2023/24) ; Papp, Porod, Csaba — Nat. Commun. 12 (2021) ; Ustinov et al. — Optics Commun. 616 (2026) | 2018–2026 | Skyrmions et aimants chiraux comme réservoirs ; interférence d'ondes de spin ; réservoir magnonique-optoélectronique | C | **Neutre** : réservoirs, pas protocole ; simulables (mumax3/MicroMagnetic.jl) |
| Zhong et al. — *Scalable physics-inspired transformers for spin glasses*, arXiv:2606.22984 [prépub.] ; Khasia — p-Spin Glass Network, arXiv:2608.14774 [prépub.][mono] | 2026 | Échantillonnage de Boltzmann de verres frustrés par transformeurs ; architecture « p-spin » ternaire pour apprentissage continu | B | Neutre |
| D-Wave Ocean (`dwavesystems/dwave-ocean-sdk`, Apache-2.0) ; Kadowaki & Nishimori 1998 | — | Recuit quantique en nuage ; tarifs non vérifiés | C | **Neutre/faible** : aucune hypothèse Hypneum n'a besoin d'un recuit quantique |
| Naaman, Paltiel, Waldeck — Nat. Rev. Chem. 3 (2019) ; Evers et al. — Adv. Mater. 34 (2022) ; Bloom et al. — Chem. Rev. 124 (2024) ; Acharya & van Schilfgaarde — *CISS as a nonequilibrium effect: a unified test of competing mechanisms*, arXiv:2610.05710 [prépub.] ; revue *Nanoscale* 2026 CISS(I)/CISS(II) (DOI non résolu) | 2019–2026 | Mécanisme du CISS **toujours non tranché** ; règle exacte : signaux CISS impairs sous renversement du temps, nuls près de l'équilibre | physique | **Neutre** : aucune équation partagée, aucun objet Hypneum ; hors périmètre |
| Hore & Mouritsen — Annu. Rev. Biophys. 45 (2016) ; Xu et al. — Nature 594 (2021) ; Denton et al. — Nat. Commun. 2024 (effet Zénon) ; Gassab et al. — *Quantum in biology… mapping the evidence*, arXiv:2605.00205 [prépub.] | 2016–2026 | Paires radicalaires : cryptochrome 4 magnétosensible *in vitro* ; preuve *in vivo* au champ terrestre encore manquante ; carte d'évidence 2026 avec alternatives classiques | physique/bio | **Neutre** : magnétoréception plausible, aucun lien avec la cognition ni avec Hypneum |
| Tegmark — PRE 61 (2000) ; Fisher — Ann. Phys. 362 (2015) ; Geraci et al. — *Psychedelics and the quantum brain*, Front. Pharmacol. 17 (2026, « Hypothesis and Theory ») ; Eldin — arXiv:2605.00024 [prépub.][mono] | 2000–2026 | Décohérence 10⁻¹³–10⁻²⁰ s ; molécules de Posner non observées *in vivo* ; hypothèse « falsifiable » (isotopes de Xe) dans une revue de pharmacologie ; « SOC = conscience » sur EEG 64 canaux | spéculatif | **À exclure** (cf. archivage de micro-kiki-quantum et Faryad 2026 dans la veille) |

---

## 3. Ponts formels : solides vs faibles

### 3.1 Ponts solides (équation partagée, prédiction chiffrée)

**P1 — JKO ↔ Fokker-Planck ↔ Cahn-Hilliard (kiki-flow).**
Le pas JKO ρ_{k+1} = argmin_ρ { E(ρ) + W₂²(ρ, ρ_k)/2τ } est la
discrétisation de ∂_t ρ = ∇·(m(ρ) ∇ δE/δρ). Avec E = ∫ (ε²/2)|∇ρ|² + W(ρ) et
W à double puits, c'est Cahn-Hilliard (Lisini-Matthes-Savaré 2012) ; avec
plusieurs espèces couplées, c'est le flot « fibré » de Heinze-Hopf-Liero (2026),
dont le schéma JKO converge. kiki-flow utilise déjà un JKO entropique à 4
espèces avec potentiels asymétriques (α, β, γ) : le résultat « spécialisation
émergente sous potentiels asymétriques, entropie 2,60 bits vs 4,00 » est une
*séparation de phase* au sens strict. Prédictions importées : exposant de
coarsening (t^{1/3} si la masse de chaque espèce est conservée, t^{1/2} sinon,
Bray 1994) ; temps d'incubation de nucléation croissant exponentiellement avec
l'inverse de la profondeur de trempe ; plancher entropique ε/(2τ) (déjà mesuré,
E1b) comme température effective qui *empêche* la séparation sous un seuil
critique ε_c (point de transition prédit).

**P2 — Kuramoto ↔ Ising ↔ Wasserstein (nerve-wml ↔ kiki-flow).**
dθ_i/dt = −K Σ_j J_ij sin(θ_i−θ_j) − K_s sin(2θ_i) : le terme de verrouillage
à la 2ᵉ harmonique binarise les phases en {0, π} et la dynamique descend une
fonction de Lyapunov ≈ hamiltonien d'Ising (Wang & Roychowdhury 2019). En
champ moyen, c'est un flot de gradient de Wasserstein (Venkatakrishnan et al.
2026), avec seuils de stabilité bornés pour la binarisation. La constellation
PSK apprise du `GammaThetaMultiplexer` (64 symboles sur porteuse γ) est la
généralisation M-aire : un verrouillage à la M-ième harmonique donne M clusters
de phase. Ce pont relie, par une *même* équation, le bras Kuramoto existant de
nerve-wml et la machinerie JKO de kiki-flow, et donne un seuil K_s/K prédit.

**P3 — Ising ↔ Hopfield ↔ rêve/désapprentissage (dream-of-kiki).**
E = −½ Σ J_ij s_i s_j ; noyau rêvé J(t) = J (1+t)/(1 + tJ) (Fachechi et al.
2019) : α_c(t) croît de 0,138 vers 1 ; les variantes 2025–2026 (Daydreaming,
synapses bornées, DLAM) couvrent données corrélées, oubli catastrophique et
architecture multi-modules. C'est le seul cadre où « rêver » a une *formule* et
une capacité prédite, et il est entièrement calculable sur CPU.

**P4 — Recuit ↔ consolidation bornée (DR-0).**
Temps d'échappement d'un état métastable t ∝ exp(ΔE/T) (Ersoy & Wiesner
2026 pour le grokking ; Kirkpatrick 1983) ; cascade de Benna-Fusi = échelles de
temps géométriques = programme de recuit. DR-0 (« tout delta trace à un DE à
budget fini ») devient une contrainte thermodynamique : budget = ∫ T(t) dt.
Prédiction : log(temps de consolidation) linéaire en 1/T_bruit.

**P5 — Jamming ↔ capacité (nerve-wml, micro-kiki).** Transition N/P ≈ 1
(Spigler 2019) : le plateau 1–3 % de la loi d'échelle de pool pourrait être le
côté sur-paramétré d'un cusp de jamming (H11).

### 3.2 Ponts faibles ou creux (à refuser comme claims)

| Pont tenté | Pourquoi il est faible |
|---|---|
| Épitaxie / orientation cristalline ↔ alignement des représentations | **Contredit** par You et al. 2026 : ce qui converge est relationnel, pas métrique ; l'orientation est une géométrie |
| Cristaux temporels ↔ porteuse θ/γ | Aucune équation partagée (Floquet, localisation à N corps) ; la « période sous-harmonique » est déjà décrite par Kuramoto + verrouillage |
| « Cristallisation des poids » | Terme sans littérature ; les phénomènes réels s'appellent grokking, ordre caché, collapse d'entropie spectrale |
| Cinétique de cristallisation GST ↔ oubli | Seule la dérive de conductance (loi de puissance) partage une forme avec l'oubli ; la nucléation/croissance du GST n'a aucun homologue |
| « Chaleur spécifique de l'attention » | Variance des logits renommée ; pas de température, pas d'énergie |
| CISS, paires radicalaires, Posner ↔ cognition | Aucun objet commun ; mécanisme CISS non tranché ; preuve *in vivo* absente ; risque réputationnel maximal |
| SOC ↔ conscience | Sources mono-auteur ; contre-modèle Di Ventra non écarté |

---

## 4. Substrats et simulateurs accessibles

Métadonnées GitHub relevées le 2026-10-24 (`gh api`) : étoiles · dernier push ·
licence. Machines Hypneum : Mac M1 Max 32 Go (CPU/MPS, pas de CUDA), RTX 4090
24 Go (kxkm-ai, CUDA), Mac Studio (arrêté pour les backends gateway).

| Outil | ★ · push · licence | Sert à | Tourne sur |
|---|---|---|---|
| `mumax/3` (micromagnétisme LLG) | 505 · 2026-10-20 · GPL-3 | STNO, skyrmions, parois ; cellules 10⁶–10⁷ | **RTX 4090 uniquement** (CUDA ≥ 5.0, ≤ 12.9) |
| `ubermag/ubermag` + `oommfc` | 46/55 · 2026-10-19 · BSD-3 | Même physique via OOMMF (CPU) ou mumax3 ; Jupyter | Mac M1 (OOMMF CPU, petits systèmes) |
| `MagneticSimulation/MicroMagnetic.jl` | 78 · 2026-10-16 · MIT | LLG + dynamique de spins atomistique ; README annonce NVIDIA/AMD/Intel/**Apple** GPU | M1 (à valider), 4090 |
| `UppASD/UppASD` ; `spirit-code/spirit` ; `computationalmodelling/fidimag` | 102 · 2026-10-23 · GPL-3 ; 145 · 2025-10 · MIT ; 71 · 2026-10-23 · (licence non déclarée) | Spins atomistiques / Monte-Carlo ; modèles d'Ising/Heisenberg réels | M1 CPU, 4090 |
| `bqth29/simulated-bifurcation-algorithm` | 170 · 2026-01 · MIT | SB (Goto) en PyTorch CPU/GPU ; 10⁴–10⁵ spins | M1 (CPU/MPS), 4090 |
| `dwavesystems/dimod` ; `dwave-samplers` ; (`dwave-neal` archivé 2022) | 141 · 2026-10-22 · Apache-2.0 ; 20 · 2026-08 | API Ising/QUBO, recuit simulé, tabou | M1 |
| `mcmahon-lab/cim-optimizer` ; `pycim-simulator` | 43 · 2024-09 · CC-BY-4.0 ; 11 · 2026-05 | Simulateurs de CIM (périmé) | M1 |
| `autonomousvision/akorn` (ICLR 2025 oral) | 135 · 2025-10 · **sans licence** | Kuramoto différentiable ; déjà baseline nerve-wml | M1, 4090 |
| `archnoid98/oim-pynq` | 0 · 2026-10 · (non déclarée) | Émulation FPGA (PYNQ-Z2) d'une machine d'Ising à oscillateurs en anneau | carte PYNQ-Z2 (~150–250 €, non vérifié) |
| `IBM/aihwkit` | 522 · 2026-10-22 · MIT | Modèles de dispositifs PCM/ReRAM **avec dérive et bruit** ; entraînement/inférence analogique | M1 CPU, 4090 |
| `neurosim/*` | 148–233 · 2026-10 · (non déclarée) | Benchmark compute-in-memory | 4090 |
| `brian-team/brian2` ; `nest/nest-simulator` ; `norse/norse` ; `synsense/sinabs` ; `nengo/nengo` | 1248 · 2026-10-23 · (custom) ; 673 · GPL-2 ; 827 · LGPL-3 ; 127 · Apache-2.0 ; 954 | SNN ; Brian2 = réseaux physiques (oscillateurs, STDP, homéostasie) | M1 |
| `lava-nc/lava` + `lava-dl` | 741 · 2026-05 · (custom) ; 183 · BSD-3 | Loihi (stub déjà dans nerve-wml) | M1 |
| `ml-jku/hopfield-layers` | 1968 · 2023 · (custom) | Hopfield moderne ; le noyau « rêvé » tient en 10 lignes NumPy | M1 |
| p-bits | **aucun simulateur libre avec traction trouvé** (`gh search` « p-bit », « probabilistic computing MTJ » : rien) | Échantillonneur de Gibbs à écrire (trivial, torch) | M1, 4090 |

**Pièges de nommage repérés** : `upperstory/spintronics-simulator` (166 ★) est
le simulateur d'un *jeu de circuits mécaniques* de marque « Spintronics », sans
rapport avec le spin ; `nvidia/Ising-Calibration-*` sur HF est un modèle
vision-langage de calibration, pas un modèle d'Ising.

**Matériel et nuage.**

| Plateforme | Accès / coût | Évaluation |
|---|---|---|
| Cortical Labs CL1 (neurones humains sur puce) ; Cortical Cloud | ~35 k$ l'unité, ~300 $/semaine en nuage **[presse : TechRadar, The Register, heise]** ; SDK Python + Jupyter (page officielle, sans prix) | nerve-wml a déjà `BioWML` + `BioCultureClient` (mock) : seul substrat « matière vivante » réellement branché ; Kagan et al. Neuron 2022 pour la base |
| D-Wave Leap (Advantage2) | Ocean SDK libre ; grille tarifaire derrière login ; source secondaire non datée : 335/1 000/3 000 $ par mois pour 10/30/90 min de QPU, 1 min gratuite **[non vérifié]** | Inutile aux hypothèses R7 (aucune n'exige un recuit quantique) |
| FPGA PYNQ-Z2 / Zynq | ~150–250 € **[non vérifié]** | Seule voie « physique » bon marché : OIM à oscillateurs en anneau (oim-pynq) ou SB embarqué (Toshiba : 512 spins, 284 µs, 3,4 W sur FPGA automobile) |
| Dispositifs spintroniques (STNO, SHNO, MTJ vortex) | Laboratoires seulement (CNRS-Thales, INL Braga, Messine, Göteborg) ; aucun kit grand public trouvé | Simulation uniquement (Thiele/LLG) |
| Memristors (Knowm) ; IonQ | Non évalués dans cette passe (budget WebSearch épuisé) | — |

**Adéquation calcul.** M1 32 Go : OOMMF CPU (≤ 10⁵ cellules), Brian2, SB torch
(≤ 10⁴ spins), Hopfield rêveur (N ≤ 10⁴), Kuramoto (N ≤ 10⁵), kiki-flow (déjà
3 min 37 s fast / 12 min 42 s rigoureux). RTX 4090 : mumax3 (10⁷ cellules), SB
(10⁵ spins), Gibbs (10⁶ spins). Rappel des feedbacks : zéro calcul lourd sur
GrosMac ; chantiers WML via `ssh macm1`.

---

## 5. Ressources Hugging Face (API `papers/search`, `models`, `datasets`)

| Type | Ressource | Intérêt |
|---|---|---|
| Papers (index HF) | 2310.03789 (grokking 1er ordre), 2402.15555 (*Deep networks always grok*), 2401.10463 (taille critique de données), 2410.13821 (AKOrN), 2604.07904 (KoPE, ICML 2026), 2605.20922 (WONN), 2606.11585 (Kuramoto Attention), 2606.22984 (transformeurs pour verres de spin), 2603.23539 (*PLDR-LLMs reason at SOC* — titre vu, non lu, **à traiter avec prudence**) | Index utile pour la bibliographie ; rien d'inédit par rapport à arXiv |
| Models | `callummcdougall/grokking_full_run_data`, `LawrenceChan/more-grokking-runs`, `smithjessk/grokking-saved-runs` (checkpoints de runs de grokking) ; `ItsnotAilabs/Kuramoto-8N` (21 téléch., licence « other », inconnu) | Les checkpoints de grokking permettent de tester P4 (Arrhenius) et le collapse spectral **à calcul nul** |
| Datasets | `Laplaxe/spin-glass-benchmarks` (25), `SecureFinAI-Lab/Ising_Model_Instances` (490), `ShayManor/ising-sim2real-results` (1 412) ; `THULab/computational_phase_transitions_data` et `algoplexity/computational-phase-transitions-data` (« transitions » de raisonnement LLM, pas de physique) ; `colabfit/Materials_Project`, `LMucko/crystallography-open-database` (matériaux, hors sujet) | Instances d'Ising de référence pour calibrer SB/OIM/Gibbs ; aucun jeu EEG-sommeil sur HF (Sleep-EDF reste sur PhysioNet, déjà utilisé par nerve-wml) |

Verdict HF : couverture mince pour cet axe ; valeur = checkpoints de grokking +
instances d'Ising. Les modèles « Ising-*» de NVIDIA et « materials.* » d'IBM sont
des faux amis.

---

## 6. Actualités septembre–octobre 2026 (toutes vérifiées sur arXiv/éditeur)

| Date | Travail | Portée R7 |
|---|---|---|
| 2026-10-22 | Fang et al., p-bits à états continus sur FPGA, arXiv:2610.31339 | Substrat d'échantillonnage à budget fini (H9) |
| 2026-10-16 | Heinze, Hopf, Liero, flots de Wasserstein fibrés d'énergies Cahn-Hilliard, arXiv:2610.23718 | **Pont P1 multi-espèces prouvé** |
| 2026-10-13 | Fauseweh, correction d'erreurs locale et mémoire temps-cristalline, arXiv:2610.18124 | Confirme : cristaux temporels = métaphore seulement |
| 2026-10-09 (v2) | Venkatakrishnan, Emerick, Bamieh, Bullo, OIM champ moyen = flot de Wasserstein, arXiv:2608.16025 | **Pont P2** |
| 2026-10-05 | Acharya & van Schilfgaarde, CISS hors équilibre, arXiv:2610.05710 | Mécanisme CISS non tranché → exclure |
| 2026-10-02 | Delacour…Camsari, revue Nat. Rev. Electr. Eng., arXiv:2610.03972 | Catalogue d'algorithmes pour substrats Ising |
| 2026-10-01 | Chen et al., modèles de champ de phase *ab initio* appris, arXiv:2610.01432 | Phase-field + ML : méthodes réutilisables pour H3 |
| 2026-09-27 | You et al., *Structure over geometry* (veille) | Tue le pont « épitaxie » |
| 2026-09-23 | Rubin & Ringel, paysages RLVR et verres de spin, arXiv:2609.28625 | Outillage répliques sur politiques |
| 2026-09-18 | Zhang…Camsari, machines d'Ising à très grande échelle (CMFT), arXiv:2609.22645 | Loi « ratio échange/mise à jour » (H9) |
| 2026-09-13 / 10-13 | Önder & Keser, OIM+ sélectif sur SK, arXiv:2609.14550 (code GitHub, MIT) | Référence OIM reproductible |
| 2026-09-12 | Massey et al., paradigme de sieste pour RSNN (IWAI 2026), arXiv:2609.13927 | Downscaling testable sur LifWML |
| 2026-09-08 | Vadde…Åkerman, machine d'Ising acoustique 2048 spins, Commun. Phys. 9:290 | Substrat oscillatoire à T ambiante |
| 2026-09-07 | Du et al., métrique de Fisher comme proximité à la criticalité, arXiv:2609.07624 | Métrique pour le stratum 5 (H7) |
| 2026-08-28 | Vock & Meisel, SOC adaptative dans les DNN (veille) | Règle homéostatique locale |
| 2026-08-26 | Liu et al., recuit matériel par dynamique de Langevin, arXiv:2608.26100 | Lien Langevin (kiki-flow) ↔ matériel |
| 2026-08-25 | Rudner-Halász, Porod, Csaba, formants par oscillateurs, arXiv:2608.25191 | ONN sur signaux temporels bruts |
| 2026-08-17 | Ustinov et al., réservoir magnonique-optoélectronique, Opt. Commun. 616 | Neutre |
| 2026-07-11 | Yao et al., machine d'Ising FPGA sparse 20 k variables, Nat. Commun. 17:8549 | Référence vitesse/précision int8 |
| 2026-07 | Menshawy…Grollier, Mizrahi (v4), Ootani, Pandey, Ersoy & Wiesner (06) | Cf. §2 |

---

## 7. Risques et critères d'arrêt

**Risques.**
1. *Analogie creuse* : le vocabulaire de la matière condensée remplace la
   mesure (ex. « chaleur spécifique de l'attention ») ; un relecteur de PLOS
   Comp. Biol. ou TMLR le détecte immédiatement.
2. *Non-falsifiabilité* : « la consolidation est une cristallisation » n'est
   réfutable que si l'exposant, le seuil ou la capacité sont annoncés d'avance.
3. *Charlatanisme quantique* : Posner, microtubules, CISS-cognition ; le labo a
   déjà archivé micro-kiki-quantum pour une raison scientifique (Faryad 2026) ;
   un seul paragraphe de ce type ruine la crédibilité du programme OSF.
4. *Dispersion du PI unique* : 10 PR de documentation ouvertes le 23/10, N10-C
   en cours, 3 reformulations d'axiomes en attente ; un axe de plus sans fin de
   non-recevoir est un risque d'exécution, pas scientifique.
5. *Sources fragiles* : la moitié des prépublications « grokking = transition »
   de 2026 sont mono-auteur, sans code vérifié ; les pondérer en conséquence.
6. *Outillage GPU-only* : mumax3 exige CUDA ; les feedbacks interdisent le
   calcul lourd local → tout passe par kxkm-ai (4090) ou macM1.
7. *Faux amis* : « Ising-Calibration », « spintronics-simulator » (§4).
8. *Coût matériel* : CL1 35 k$, spintronique inaccessible ; seul FPGA PYNQ est
   raisonnable, et seulement après un résultat positif en simulation.

**Critères d'arrêt (à écrire dans le préenregistrement OSF avant le premier run).**
- A1. Si, après deux pilotes préenregistrés (≥ 5 graines, baseline non physique
  appariée, TOST pour les nuls), aucune prédiction *dérivée de la physique*
  (exposant, seuil, loi d'Arrhenius, capacité α_c(t)) ne bat la baseline ni ne
  se vérifie dans son intervalle annoncé → fermer l'axe.
- A2. Si la seule production après 8 semaines est lexicale (réécriture de
  papiers avec un vocabulaire physique) → fermer.
- A3. Toute hypothèse exigeant une cohérence quantique en milieu biologique ou
  une « conscience » est refusée d'office, sans pilote.
- A4. Plafond : ≤ 15 % du temps du PI sur 6 mois ; aucun achat matériel avant
  un résultat positif en simulation ; pas de nouveau dépôt (travail dans les
  dépôts existants, tag `track-m`).
- A5. Chaque hypothèse nomme sa condition de réfutation et son estimateur
  avant exécution (discipline bouba_sens/nerve-wml).

---

## 8. Brainstorm : hypothèses falsifiables pour un axe « Hypneum matière »

Toutes à ≥ 5 graines, baseline appariée, préenregistrement OSF. Coût : M1 =
Mac M1 32 Go ; 4090 = kxkm-ai ; sim = simulateur libre cité. 12 des 15 sont
hors paradigme LLM.

| # | Énoncé | Prédiction quantitative | Test réalisable | Réfutation | Référence |
|---|---|---|---|---|---|
| H1 | Un épisode de rêve (DE) à budget fini est un désapprentissage hebbien de durée t (noyau rêvé) | Capacité de rappel d'un `HopfieldDreamWML` (N=1 000) passe de ≈0,14 à > 0,5 pour t=10 ; attracteurs « mélange » réduits > 50 % | nerve-wml, nouveau substrat conformant ; M1 CPU, minutes | Gain < 0,1 ou non monotone en t sur 5 graines | Fachechi 2019 ; Serricchio 2025 ; DR-0, DR-4 |
| H2 | Le temps de consolidation suit une loi d'Arrhenius dans la température de bruit (taille de lot) | log t_consol linéaire en 1/T, R² > 0,8 sur 4 valeurs de T | kiki_oniric p_min, 5 graines ; M1 | Pente ≤ 0 ou R² < 0,5 | Ersoy & Wiesner 2026 ; DR-0 |
| H3 | La spécialisation des espèces de kiki-flow est une décomposition spinodale à masse conservée | Taille des domaines L(t) ∝ t^{0,33±0,05} sur 2 décades après trempe profonde (double puits + pénalité de gradient) | kiki-flow track2, JKO fibré ; M1, ≤ 15 min | Exposant hors [0,25 ; 0,45] ou domination du plancher ε/(2τ) | Bray 1994 ; Heinze 2026 ; P1 |
| H4 | Trempe peu profonde ⇒ nucléation (incubation), trempe profonde ⇒ spinodale (pas d'incubation) | Temps d'incubation croît exponentiellement avec 1/Δ (Δ = profondeur) ; nul au-delà de la spinodale | kiki-flow, balayage Δ ; M1 | Incubation indépendante de Δ | Bray 1994 ; Rubin 2023 |
| H5 | Les neuroletters M-PSK sont les clusters de phase d'un verrouillage à la M-ième harmonique | Avec M=4 et 8 : MI/H des codes transmis par un canal Kuramoto+SHIL ≥ 0,9 au-dessus du seuil K_s/K, effondrement en dessous (transition nette) | nerve-wml track_p (bras Kuramoto existant) + terme sin(Mθ) ; M1 | Pas de seuil, dégradation graduelle | Wang & Roychowdhury 2019 ; Venkatakrishnan 2026 ; P2 |
| H6 | Le multiplexeur Kuramoto à grand N obéit à la même dissipation d'énergie libre que le JKO de kiki-flow | dF/dt = −∫ ρ |∇ δF/δρ|² à 5 % près, F monotone à N=4 096 | nerve-wml + `kiki_flow_core.master_equation` ; M1 | F non monotone ou écart > 20 % | Venkatakrishnan 2026 ; JKO 1998 ; P2 |
| H7 | Le budget DE optimal coïncide avec un pic de susceptibilité (criticalité), **sauf si** une variable lente (ressource) explique les lois de puissance | FIM(budget) maximale au budget de rétention maximale, Spearman ρ > 0,7 ; le modèle à ressource lente (Di Ventra) ne reproduit pas le pic | kiki_oniric p_equ, BioFieldWML ; M1 | FIM plate, pic déplacé > 2× ou nul reproduit par la variable lente | Du 2026 ; Sipling-Di Ventra 2026 ; stratum 5 |
| H8 | La consolidation augmente une température de fusion d'« ordre caché » des poids | T_fusion (poids → couplages d'Ising) croît avec la rétention, chute après un épisode d'oubli ; r > 0,5 | MlpWML / kiki_oniric, Monte-Carlo sur couplages ; M1 | |r| < 0,3 sur 5 graines | Barney, Winer, Galitski 2024 |
| H9 | Entre deux modules, la fidélité dépend du ratio cadence d'échange (θ) / cadence locale (γ), avec seuil | Au-dessus d'un ratio seuil, précision = module monolithique ; en dessous, erreur résiduelle décroît plus lentement (loi CMFT) | Gibbs partitionné en 2 WML reliés par neuroletters ; M1/4090 | Pas de seuil, dépendance linéaire | Aadit 2026 ; Zhang 2026 (CMFT) |
| H10 | L'oubli structurel d'un code déployé sur PCM suit la dérive en loi de puissance et l'alignement survit à la précision | MI/H ∝ t^{−ν}, ν ≈ 0,05–0,1 ; MI/H chute *après* l'exactitude | artefact INT8 LifWML sur `aihwkit` (modèle PCM + dérive) ; M1/4090 | MI/H s'effondre avant l'exactitude, ou ν > 0,3 | Le Gallo 2023 ; Nir-Harwood 2026 ; finding 7 nerve-wml |
| H11 | Le plateau 1–3 % de la loi d'échelle de pool est le côté sur-paramétré d'un cusp de jamming | L'écart vs N/P montre un cusp à N/P ≈ 1 | nerve-wml, balayage N/P ; M1 | Courbe lisse monotone | Spigler 2019 ; Geiger 2019 |
| H12 | 4–8 STNO couplés et injectés transportent une neuroletter de 2 bits par phase relative | BER < 1 % à SNR > 10 dB dans la plage de verrouillage | Thiele/LLG via MicroMagnetic.jl (M1) ou mumax3 (4090) ; sim | Plage de verrouillage < séparation des codes | Romera 2018 ; Horizumi 2026 |
| H13 | Deux substrats conformants convergent relationnellement ⇔ distribution d'overlap P(q) unimodale (type ferro), pas RSB | Largeur de P(q) décroît avec N ; bimodalité absente | nerve-wml MLP↔LIF, répliques ; M1 | P(q) large et stable quand N croît | Li 2025 ; You 2026 ; DR-3 |
| H14 | Le rêve hétéro-associatif (DLAM) aide la recombinaison inter-domaines plus qu'intra-domaine | Gain inter ≥ 2× gain intra | DLAM 2 couches, jeux synthétiques ; M1 | Gains égaux | Barra 2026 ; Zahn 2026 (veille) ; DR-4 |
| H15 | Le downscaling « sommeil » (régularisation homéostatique) réduit l'oubli sans rehearsal | Oubli HardSplitTask < 0,4 (vs 0,767 sans, 0,532 EWC) | nerve-wml track_w, LifWML ; M1 | Oubli ≥ 0,5 | Massey 2026 ; Tononi & Cirelli 2014 |

---

## 9. Concepts et intuitions nouveaux (spéculatifs, étiquetés)

| Étiquette | Intuition | Ce qui la rendrait falsifiable |
|---|---|---|
| **[spéc.] Rêve = recuit de désapprentissage à budget fini** | DR-0 n'est pas seulement un invariant de traçabilité : c'est le temps de rêve t du noyau J(t). Le « bon » budget est celui qui maximise α_c(t) sans détruire les motifs faibles (sur-rêve) | H1 : courbe α_c(t) avec maximum interne prédit pour données corrélées |
| **[spéc.] Neuroletter = cluster de phase** | Un alphabet discret n'a pas besoin d'être imposé : il *émerge* d'un verrouillage harmonique ; la taille de l'alphabet est l'ordre de l'harmonique | H5 : M clusters exactement, seuil K_s/K |
| **[spéc.] Spécialisation = coarsening conservatif** | Les espèces de kiki-flow ne « choisissent » pas un rôle : elles se séparent comme un alliage trempé ; conservation de la masse ⇒ t^{1/3}, et la trempe trop lente ne spécialise pas (nucléation bloquée) | H3, H4 |
| **[spéc.] Cadence θ = loi d'échange de frontière** | La fréquence θ du GTM n'est pas biologique « par principe » : c'est le ratio minimal échange/mise à jour qui garantit la fidélité d'un calcul partitionné | H9 |
| **[spéc.] Alignement = ordre caché, pas cristal** | La bonne grandeur n'est pas une orientation (épitaxie) mais une température de fusion d'un ordre caché ; deux substrats « alignés » ont la même T_fusion relationnelle | H8, H13 |
| **[spéc.] Oubli = dérive, pas fusion** | L'oubli structurel est une dérive lente (loi de puissance, PCM) et non une fusion thermique ; les codes discrets dérivent moins vite que les poids continus | H10 |
| **[spéc.] Criticalité ou ressource lente ?** | Le stratum 5 doit être posé comme *alternative* explicite : pic de FIM vs ordre à longue portée induit par une variable lente (énergie, astrocytes) | H7 |
| **[spéc.] Palimpseste par bornage** | Borner les synapses (clipping) suffit à supprimer l'oubli catastrophique et rend le rêve plus efficace : DR-0 appliqué au niveau du poids, pas de l'épisode | Variante de H1/H15 avec clip sur LifWML |
| **[spéc.] Famille de substrats « physiques » dans nerve-wml** | OIM-WML, HopfieldDream-WML, PCM-WML (aihwkit), STNO-WML (Thiele) : quatre substrats conformants *sans matériel*, qui élargissent la preuve DR-3 au-delà de MLP/LIF/Transformer/BioField | Suite de conformité C+ (C1–C3) sur chacun |

---

## 10. Recommandation

**Ouvrir sous conditions — comme un *track M* (matière) dans les dépôts
existants, pas comme un nouveau champ.** Les sous-axes (1) cristallisation et
(2) changements d'état fournissent deux ponts formels publiés en 2026 et un
prior art de 1983–2026 (Hopfield rêveur) que le programme ignore aujourd'hui ;
le sous-axe (3) spin ne vaut que par les oscillateurs couplés (P2) et les p-bits
(loi d'échange), en simulation.

Conditions :
1. Reformuler d'abord DR-3 (structure relationnelle) et le test (6) de
   nerve-wml, comme la veille l'impose : sans cela, toute « cristallisation »
   serait lue comme une géométrie.
2. Deux pilotes en 8 semaines sur M1, préenregistrés avec réfutation nommée :
   **H1** (Hopfield rêveur, le moins cher et le plus porteur : il donne enfin
   une formule à « rêve ») et **H3/H4** (coarsening dans kiki-flow, qui possède
   déjà F-decay, profils de Turing et le plancher ε/(2τ)). Décision GO/NO-GO
   sur A1–A2 (§7).
3. Si GO : H5/H6 (nerve-wml, bras Kuramoto existant), H7 (stratum 5 avec le nul
   de Di Ventra), H10 (substrat PCM via aihwkit), puis H9/H12.
4. Exclusions fermes : CISS, paires radicalaires, Posner/microtubules, cristaux
   temporels (métaphore), recuit quantique en nuage, achat matériel avant
   résultat positif en simulation.
5. Garde-fous rédactionnels : interdiction de mots-valises (« cristallisation
   des poids ») dans les claims ; chaque emprunt physique cite l'équation
   partagée ou est étiqueté « analogie ».

Ce que cela apporte au PI qui veut « sortir du LLM » : 12 des 15 hypothèses se
testent sur des réseaux de Hopfield, des oscillateurs, des flots de densité et
des modèles de dispositifs, sans aucun modèle de langage, sur Mac M1.

---

## Résumé (≤ 15 lignes)

1. Le PI confond probablement trois idées sous « cristallisation » : ordre (grokking), alignement (convergence des représentations) et stabilité (consolidation) ; seule la troisième a un modèle formel mûr.
2. Pont solide P1 : kiki-flow est déjà un JKO multi-espèces, donc un Cahn-Hilliard « fibré » (Heinze-Hopf-Liero, oct. 2026) dès qu'on met un double puits ; prédictions d'exposant de coarsening (t^{1/3}) et de nucléation vs spinodale.
3. Pont solide P2 : la limite champ moyen d'une machine d'Ising à oscillateurs est un flot de Wasserstein (Venkatakrishnan et al. 2026) ; la constellation PSK du GTM = clusters de phase d'un verrouillage harmonique (seuil K_s/K prédit).
4. Pont solide P3 : les « réseaux de Hopfield rêveurs » (Hopfield 1983, Crick & Mitchison 1983, Fachechi-Agliari-Barra 2019, Daydreaming 2025, 4 prépublications 2026) donnent au rêve une formule et une capacité α_c(t) ; zéro occurrence dans les trois dépôts : prior art à intégrer d'urgence.
5. Pont solide P4 : budget DR-0 = loi d'Arrhenius / cascade de Benna-Fusi ; grokking par échappement métastable (Ersoy & Wiesner 2026).
6. Ponts faibles à refuser : épitaxie↔alignement (contredit par You et al. 2026), cristaux temporels, « chaleur spécifique de l'attention », cinétique GST↔oubli, CISS/paires radicalaires/Posner↔cognition.
7. Spin : seuls les oscillateurs couplés (Romera 2018 ; 2026 Grollier-Mizrahi, Finocchio) et les p-bits (Camsari : loi ratio échange/mise à jour, 10⁶ p-bits) sont exploitables, en simulation ; aucun kit spintronique accessible.
8. Substrats : mumax3 (CUDA, 4090 seulement), ubermag/OOMMF et MicroMagnetic.jl (M1), SB torch, dimod, Brian2, IBM aihwkit (PCM avec dérive, MIT) ; Cortical Cloud ~300 $/semaine (presse) ; D-Wave inutile ; FPGA PYNQ seule voie matérielle bon marché.
9. HF : mince (checkpoints de grokking, instances d'Ising) ; faux amis « Ising-Calibration », « spintronics-simulator ».
10. Criticalité : adopter la métrique FIM (Du 2026) et le contre-modèle « ressource lente » de Di Ventra (2026) comme nul du stratum 5.
11. 15 hypothèses falsifiables, 12 hors LLM, toutes sur M1/4090/simulateur, avec réfutation nommée.
12. Risques : analogie creuse, prépublications mono-auteur, charlatanisme quantique, dispersion du PI ; critères d'arrêt A1–A5.
13. Recommandation : **ouvrir sous conditions** comme *track M* dans les dépôts existants ; pilotes H1 (Hopfield rêveur) et H3/H4 (coarsening kiki-flow) en 8 semaines, GO/NO-GO ensuite.
14. Préalable : reformuler DR-3 en « structure relationnelle » avant tout emprunt cristallin.
15. Vérification : 63 arXiv via API, 60 DOI via Crossref, 2 Nature 2026 + deck Toshiba lus ; non vérifiés : tarifs D-Wave, communiqué Aalto, revue CISS Nanoscale, Knowm, IonQ.
