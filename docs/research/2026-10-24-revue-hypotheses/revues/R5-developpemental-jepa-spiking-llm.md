# R5 — IA développementale, JEPA, croissance de modèles, LLM à impulsions, MoE-LoRA/mémoire

Revue critique pour Hypneum Lab · 2026-10-24 · axe R5 · complète la veille du 2026-10-23 (ne la duplique pas).

Conventions : **[NOUVEAU]** = absent de la veille du 23/10 ; **[veille]** = déjà cité le 23/10 ; **[dépôt]** = déjà cité ou utilisé dans un dépôt Hypneum. Relation : **appuie / contredit / dépasse / neutre** vis-à-vis des thèses visées. Toutes les références arXiv ont été vérifiées sur leur page `arxiv.org/abs` ou via l'API HF papers (l'API `export.arxiv.org` répondait 429 pendant la session) ; les fiches HF et GitHub via leurs API. Aucune référence n'est inventée ; quand un détail n'a pas pu être lu (résumé seul), c'est dit.

Méthode : 18 recherches web (budget épuisé ensuite), 12 recherches GitHub + 14 fiches dépôt, 8 recherches HF modèles + 6 datasets + 9 papers + ~15 fiches poids, ~25 abstracts arXiv lus, grep lecture seule dans `baby-brain`, `BabyBrain`, `micro-kiki` (+ `nerve-wml` pour LifWML/SpikingKiki).

---

## 1. Hypothèses ciblées (verbatim EN, source dépôt)

| # | Énoncé (verbatim) | Source |
|---|---|---|
| T1 | « *Ontogenetic harness for substrate-agnostic World-Model Learners — growing brains through developmental curricula.* » | `baby-brain/README.md` l.3 |
| T2 | **Claim A (hypothesis).** « *Gating the plasticity of a World-Model Learner by developmental stage improves sample efficiency relative to flat training.* » | `baby-brain/docs/paper/2026-05-22-ontogenetic-wml-draft.md` §Abstract |
| T3 | **Claim B** : « *curiosity-driven active perception covers a broader concept repertoire than a passive curriculum* » | idem |
| T4 | « *Trunk … Bootstrap source (Path-A and Path-B): random — trunk is always from-scratch.* » ; Path-A : encodeurs vision/audio **pré-entraînés** (ViT-tiny timm → DINOv2-small ; mHuBERT) ; Path-B « *ontogenetically pure trajectory* » = tout aléatoire | `docs/specs/2026-05-21-sp1-architecture.md` §3, §5 |
| T5 | « *JEPA hook. A `JEPAPredictor` sub-module (2-layer MLP, workspace→workspace) plus `WML.predict_future()`. SP1 wires the architectural hook only; the JEPA-style auxiliary loss is trained in SP2.* » ; « *~252M trainable … JEPA predictor 1.05M* » | idem, post-T15 |
| T6 | « *Capable of growth — the model must accumulate experience and add parameters over its developmental trajectory without retraining from scratch.* » | idem §2 |
| T7 | 7 stades : `DevelopmentalStage` NEONATE(0), INFANT, TODDLER, PRESCHOOL, SCHOOL_AGE … ADULT ; « *learning-progress (LP) is negative across phases when tick budget is short or envs saturate quickly* » | `baby_brain/stages.py` ; `README.md` §Status ; `docs/specs/2026-05-30-embodied-lpm-gate-design.md` |
| T8 | nerve-wml : « *discrete-code communication layer between heterogeneous neural modules (World Model Languages, or WMLs). Modules exchange neuroletters over a sparse learned topology, multiplexed on gamma/theta rhythms, and converted between local codebooks by per-edge transducers.* » ; LifWML = « *toy substrate with n_neurons=16–100, a codebook of size 64 … has never been benchmarked as a standalone learner on a non-trivial task* » | `nerve-wml/README.md` l.10 ; `docs/superpowers/specs/2026-05-30-lif-l1a-sim-training-design.md` |
| T9 | micro-kiki : « *A null-space projection ablation on 3 domain pairs shows that Brainstacks-style orthogonalization is superfluous on native MoE architectures: adapter weight vectors are already quasi-orthogonal at ∼88.6°* » ; « *Aeon achieves 36+ episode recalls per 14-turn dialogue* » ; « *This is not a fleet-wide no-forgetting claim — only 5 of 41 adapter artefacts have been pairwise checked.* » | `micro-kiki/paper/micro-kiki.tex` l.50, l.303 ; `README.md` l.305 |
| T10 | Triple hybride v0.3 : « *SNN Backbone (SpikingKiki) — LAS conversion of Qwen3.5-35B-A3B … First SNN MoE at 35B scale … Target: 69% sparsity, energy reduction TBD* » ; « *35B MoE on Loihi-2 (theoretical): 0.032 mJ/tok. 91.6x ops reduction via LAS conversion.* » ; note de cadrage : « *The SNN and VQC layers documented here are research artifacts, not active runtime components.* » | `micro-kiki/docs/paper-outline-triple-hybrid.md` ; `README.md` §SNN energy estimate |
| T11 | Fiches HF : `clemsail/spikingkiki-35b-a3b-v4` = « *Lossless ANN-to-SNN (LAS) conversion of Qwen3.6-35B-A3B weights … rate-coded integrate-and-fire surrogate (T=128) … 99.5 % sane modules (validation Phase E, N=200)* » ; `electron-rare/spikingkiki-27b` = « *Status: research-stage; not benchmarked end-to-end* » | HF, 2026-04/05 |
| T12 | **BSK « BIG Spiking Kiki »** (brief du PI) : LLM à impulsions ~140M construit de zéro sur corpus FR, neurogenèse net2net function-preserving, élagage synaptique, fire rate 1–3 %, en pause depuis juin 2026. **Aucun artefact public trouvé** (ni GitHub `hypneum-lab`, ni HF `hypneum-lab`/`electron-rare`/`clemsail`). ⚠ Collision de nom : les « SpikingKiki » publics sont des **conversions** LAS de Qwen, pas des modèles de zéro. | brief ; API HF `author=electron-rare|clemsail|hypneum-lab` |

---

## 2. État de l'art par sous-axe

### 2a. Famille JEPA et architectures prédictives « monde »

| Réf | Date | Résultat clé | Relation à T1–T6 |
|---|---|---|---|
| I-JEPA, Assran et al., arXiv:2301.08243 **[dépôt]** (`assran2023ijepa` dans `baby-brain/references.bib`) | 2023 | Prédiction en espace latent d'images masquées, pas de reconstruction pixel | fondement ; neutre |
| V-JEPA 2, arXiv:2506.09985 **[dépôt]** (note `micro-kiki/docs/research/vqc-cem-acceleration-vjepa2.md`) | juin 2025 | Encodeur vidéo SSL + prédicteur action-conditionné (V-JEPA 2-AC, ≈300M) ; planification CEM 16 s/action | dépasse l'ambition « modèle du monde » de T1 à grande échelle ; neutre pour « de zéro » |
| V-JEPA 2.1, Mur-Labadia … LeCun, Ballas, Bardes, arXiv:2603.14482 **[NOUVEAU]** (v1 15/03, v3 11/06/2026) | mars 2026 | Perte prédictive dense + supervision profonde ; Ego4D STA 7,71 mAP ; saisie robot +20 pts vs V-JEPA 2-AC ; NYUv2 0,307 RMSE | dépasse (perception) ; neutre (développement) |
| LeJEPA, Balestriero & LeCun, arXiv:2511.08544 **[NOUVEAU]** | nov. 2025 | SIGReg : latents gaussiens isotropes, 1 hyperparamètre, ~50 lignes, pas de stop-grad/EMA ; 79 % lin. probe ViT-H/14 | **appuie** « substrat minimal appris de zéro » ; rend caduques les heuristiques anti-collapse |
| *When Does LeJEPA Learn a World Model?*, Klindt, LeCun, Balestriero, arXiv:2605.26379 **[NOUVEAU]** | 25/05/2026 | Preuve d'**identifiabilité linéaire** des latents du monde (transitions stationnaires + bruit additif) ; le gaussien est l'unique distribution latente admissible ; validé jusqu'à 1024 d et contrôle robotique pixel | **appuie et dépasse** T8 : si deux WML-JEPA sont identifiables linéairement, le transducteur inter-codebooks est une rotation (voir §4, §10-C1) |
| LeWorldModel (LeWM), Maes, Le Lidec, Scieur, LeCun, Balestriero, arXiv:2603.19312 **[NOUVEAU]** (v3 03/06) | 13/03/2026 | JEPA pixel→latent stable **~15M paramètres, 1 GPU, quelques heures**, 2 termes de perte, planification 48× plus rapide que les WM à modèle de fondation ; latents sondables physiquement ; détection de « surprise » | **dépasse** T4/T5 : un « World-Model Learner from scratch » existe déjà à l'échelle baby-brain, avec résultats |
| stable-worldmodel-v1, Maes … LeCun, Balestriero, arXiv:2602.08968 **[NOUVEAU]** ; GitHub `galilai-group/stable-worldmodel` 2 271★ MIT | fév. 2026 | Écosystème reproductible (envs à propriétés visuelles/physiques contrôlables, baselines DINO-WM, planification, évaluation) | **appuie** : banc d'essai prêt pour SP7 et bras JEPA N11-A |
| JEPA-WMs, Terver, Yang, Ponce, Bardes, LeCun, arXiv:2512.24497 **[NOUVEAU]** (v4 02/09/2026) ; `facebookresearch/jepa-wms` 505★ ; HF `facebook/jepa-wms` CC-BY-NC-4.0 | déc. 2025 → sept. 2026 | Étude systématique architecture/objectif/planificateur ; modèle combiné > DINO-WM et V-JEPA-2-AC ; encodeurs **DINOv2 ViT-S/14** + prédicteur profondeur 6 pour Push-T/PointMaze/Wall | **appuie** T4 Path-A (encodeur SSL gelé + prédicteur appris) — c'est exactement le choix DINOv2-small de SP1 |
| EB-JEPA (bibliothèque), Terver … LeCun, Bar, arXiv:2602.03604 **[NOUVEAU]** ; `facebookresearch/eb_jepa` | fév. 2026 | Exemples 1 GPU/quelques h : CIFAR-10 91 % probe, Moving MNIST, Two Rooms 97 % succès planification ; « *regularization components are important for preventing representation collapse* » | **appuie** JEPA petit budget ; référence pédagogique pour WML-JEPA |
| H-JEPA, Zhang, Terver, Rabbat, LeCun, Balestriero, arXiv:2610.06805 **[veille]** ; `kevinghst/H-JEPA` 190★ MIT ; HF `jepa-world-models/h-jepa` (12,4 Go, 31 ckpt) | 05/10/2026 | Hiérarchie de JEPA action-conditionnés, chaque niveau prédit plus loin ; DROID | appuie N11-A (déjà acté) ; nouveau : GGUF 55–184 Mo exécutables CPU |
| *A Generalization Theory for JEPA-Based World Models*, Cui et al., arXiv:2606.27014 **[NOUVEAU]** (v2 29/09) | 25/06/2026 | JEPA = factorisation de rang faible d'une matrice de co-occurrence action-conditionnée ; borne regret de planification ; compromis gouverné par la dimension latente ; prédiction latente plus robuste que niveau entrée sous observations imprévisibles | **appuie** « latent > pixels » ; donne un levier : dimension latente = variable d'ontogenèse |
| *Frozen in a Frame: The Velocity Blind Spot in JEPA World Models*, Zhang … Lamb, arXiv:2610.04585 **[NOUVEAU]** | 03/10/2026 | Sur les poids LeWM officiels (PushT/Reacher/Cube/TwoRoom) : sondes **vitesse ≤ hasard**, position R² ≈ 0,95 ; TI-JEPA (code pose + code mouvement) −55 % (pendule) / −64 % (CartPole) distance finale | **contredit** l'idée que JEPA seul suffit comme WML ; **appuie** un rôle pour proprioception/copie d'efférence (baby-brain 1c MuJoCo) |
| PSG-JEPA, Yan et al., arXiv:2608.06799 **[NOUVEAU]** ; `Haodong-Yan/PSG-JEPA` 19★ | 07/08/2026 | « *forward prediction alone … do[es] not explicitly enforce reliable identifiability of robot-centric physical state* » ; ancrage proprioceptif à l'entraînement seulement | **appuie** T6/T7 : l'ancrage par le corps est une étape développementale naturelle |
| Autres JEPA-WM 2026 (titres vérifiés) : FF-JEPA 2606.09311 ; InJePA 2610.23896 (Habitat MP3D) ; *Representation Geometry Matters* 2608.16287 ; *Value-guided planning* 2601.00844 ; D-JEPA 2609.24749 ; JEPA-TTT 2610.00722 ; *Anisotropic Representations* 2609.37441 ; TD-JEPA 2607.25337 ; Flow-JEPA 2608.29029 ; Causal-JEPA 2602.11389 ; Spectral-Target 2609.04264 ; Semigroup-JEPA 2609.10464 ; JEPA-WAM 2608.09381 ; point-LeWM 2608.29434 **[NOUVEAU]** | jan.–oct. 2026 | Le champ est devenu une sous-discipline (≥15 preprints en 10 mois) centrée sur *planifier dans le latent* | **dépasse** tout positionnement « nous construisons un modèle du monde latent » non différencié |
| Energy-Based Transformers, Gladstone et al., arXiv:2507.02092, ICLR 2026 **[NOUVEAU]** | 2025→2026 | Prédiction par descente de gradient sur une énergie ; l'énergie = incertitude | neutre ; EBM « système 2 » séparable du substrat |
| AMI Labs (LeCun), TechCrunch 09/03/2026 **[NOUVEAU]** | mars 2026 | Levée 1,03 Md$ (3,5 Md$ pre-money) ; CEO A. LeBrun ; **aucun produit public trouvé** | neutre (signal de marché) |
| Dupoux, LeCun, Malik, *Why AI systems don't learn…*, arXiv:2603.15381 **[NOUVEAU]** | 16/03/2026 | Architecture proposée : **System A** (apprentissage par observation), **System B** (par action), **System M** (méta-contrôle qui bascule A↔B) ; « *studying how organisms adapt … across evolutionary and developmental timescales* » | **appuie fortement** T1–T3 : baby-brain *implémente déjà* un M (stades) qui ordonne A (corpus) et B (SP7) — à revendiquer explicitement |
| Dreamer 4, Hafner, Yan, Lillicrap, arXiv:2509.24527 **[veille (N11-C)]** ; pas de dépôt officiel (`danijar/dreamer4` absent ; `danijar/dreamerv3` 3 904★ MIT) | sept. 2025 | Diamants Minecraft hors-ligne, *shortcut forcing*, temps réel 1 GPU | dépasse (échelle) ; non reproductible sur M1 |
| Genie 3 (Google) **[NOUVEAU]** | 2026 | Fermé (Project Genie, abonnés AI Ultra US) ; alternatives ouvertes lourdes (Cosmos-Predict 7B = 1×H100 80 Go ; HY World 1.5 ; Matrix-Game) ; DreamForge-World 0.1 arXiv:2606.30292 « *low-compute real-time controllable* » (non lu) ; bancs WorldArena 2.0 2605.17912, WBench 2605.25874, WorldRoamBench 2606.31672 | neutre : génération vidéo ≠ WML latent ; hors budget M1 |

### 2b. IA développementale 2025–2026

| Réf | Date | Résultat clé | Relation |
|---|---|---|---|
| ZWM, Aw … Frank, Yamins, arXiv:2604.10333 **[veille]** ; `awwkl/ZWM` 43★ MIT ; HF `awwkl/zwm-babyview-170m` (687 Mo, accès manuel), `zwm-kinetics-170m` (ouvert) ; 170M et 1B | avr. 2026 | MAE à masquage temporellement factorisé ; recette BabyView : **8×A40, bs 512, 200 k it.** ; CPU non supporté, macOS non testé | appuie (bras de comparaison) ; **compute hors M1** pour l'entraînement, inférence possible |
| EgoBabyVLM 2605.19130 ; BabyCL 2606.05115 ; Bunzeck 2606.01045 **[veille]** | mai–juin 2026 | (voir veille) | — |
| BabyVLM-V2, Wang … Gong, arXiv:2512.10932, **CVPR 2026** **[NOUVEAU]** | v2 29/03/2026 | Corpus audiovisuel centré nourrisson (vidéo-énoncé, image-énoncé, conversation) + **DevCV Toolbox** (10 tâches dérivées du NIH Baby Toolbox) ; « *compact model pretrained from scratch … outperforming GPT-4o on some tasks* » | **appuie** T4 (de zéro, petit) ; **fournit la batterie d'évaluation** que SP6/`developmental-iq-battery` réinvente |
| BabyLM 2026 (*BabyLM Turns 4 and Goes Multilingual*), arXiv:2602.20092 ; babylm.github.io **[NOUVEAU vs veille : détails]** | atelier **EMNLP Budapest 24–29/10/2026** (en cours) | Pistes : Strict 100M mots (multimodal + interaction *absorbés*), Strict-Small 10M, **Multilingual** EN/NL/ZH (BabyBabelLM) ; données HF `BabyLM-community/BabyLM-2026-Strict` (725 dl) / `-Strict-Small` ; éval `babylm-org/babylm-eval` ; **pas de résultats publiés au 24/10** | neutre ; le français n'est pas dans la piste multilingue → BSK « corpus FR » est hors concours mais BabyBabelLM (45 langues) contient du FR à vérifier |
| Oudeyer, *Curiosity* (revue, préprint non daté, fichier « March26 », pyoudeyer.com) **[NOUVEAU]** ; `oudeyer2007intrinsic` **[dépôt]** | 2026 | Curiosité = famille de processus à **échelles de temps multiples** (secondes → mois) ; « *new experimental paradigms are needed to study open-ended, self-directed exploration* » | **appuie** T3 mais **contredit** la fenêtre LP de 8 pas de SP7 (échelle unique) |
| Curiosity-Critic, Bhaskara & Wang, arXiv:2604.18701, ICML 2026 wkshp EIML **[NOUVEAU]** | avr.→juin 2026 | Récompense = amélioration de l'erreur **cumulée** (erreur courante − baseline apprise par un critic) ; sépare erreur réductible/irréductible ; grille stochastique | **appuie** et répare T7 : remède direct au « LP négatif » de SP7 (la fenêtre glissante mesure du bruit, cf. `lpm.py`) |
| *Can In-Context Learning Support Intrinsic Curiosity?*, Elmoznino … Lajoie, arXiv:2606.19476 **[NOUVEAU]** | 17/06/2026 | Preuve : récompense LP **non biaisée impossible** via ICL dans un MDP général ; possible (bornée, convergente) hors temporel | **contredit** toute mesure de LP « sans mise à jour » (ex. mesurer le progrès du WML par son contexte) |
| *Remember to be Curious*, Goli … Kanazawa, arXiv:2605.22814 **[NOUVEAU]** | 21/05/2026 | En 3D photoréaliste (HM3D), la curiosité échoue sans **persistance spatiale** (reconstruction 3D en ligne = WM persistant) + **contexte épisodique** ; zéro-shot Gibson | **appuie** T1 (WM + mémoire épisodique = prérequis de l'exploration) ; lie dream-of-kiki/Aeon à SP7 |
| ActiveMimic, Lin et al., arXiv:2606.06194 **[NOUVEAU]** | 04/06/2026 | Le mouvement de caméra égocentrique traité comme **« viewpoint action »** plutôt que bruit ; pré-entraînement conjoint perception active + manipulation | **appuie** Claim B (l'action primaire = choisir où regarder) |
| MIMo, Mattern et al., IEEE TCDS 16(4) 2024 ; *MIMo Grows!* ICDL 2025 ; `trieschlab/MIMo` 51★ MIT **[NOUVEAU]** | 2024–2025 | Corps de nourrisson MuJoCo/Gymnasium : vision, toucher, proprioception, vestibulaire + **module de croissance corporelle** | **appuie** T6/T7 : un corps qui grandit à coût CPU ; candidat Phase 1d |
| *Developmental Curiosity and Social Interaction in Virtual Agents*, arXiv:2305.13396 ; Smith 2018 « the developing infant creates a curriculum » ; Gopnik (Berkeley Talks 17/04/2026 : explorer/exploiter/*care* = modes distincts) **[NOUVEAU]** | 2018–2026 | Fondements : le corps crée les données ; modes cognitifs distincts | appuie T2/T3 (cadrage) |
| Envs 3D légers : ViZDoom, MiniGrid, MuJoCo **[dépôt]** ; Crafter `danijar/crafter` 604★ (2D) ; Habitat-lab 3 167★ ; MineDojo 2 277★ (lourd) ; stable-worldmodel envs | — | | neutre ; Habitat+InJePA = seul couple JEPA-3D publié |

### 2c. Croissance de modèles, élagage, LLM à impulsions, énergie

| Réf | Date | Résultat clé | Relation à T6/T10–T12 |
|---|---|---|---|
| Net2Net (Chen et al. 2015) ; *Stacking Your Transformers* 2405.15319 NeurIPS 2024 ; SOLAR DUS 2312.15166 ; *Composable Function-preserving Expansions* 2308.06103 ; LESA 2502.13794 ACL 2025 ; MIDUS 2512.13751 ; *Overcoming Growth-Induced Forgetting* 2408.10566 ; Multimodal DUS 2604.00489 **[NOUVEAU]** | 2015–2026 | Empilement de couches > élargissement ; chute initiale puis récupération ; insertion de couches gelées réversible | fondement T12 ; neutre |
| *When is Warmstarting Effective for Scaling LMs?*, Mallik … Hutter, Klein, arXiv:2605.13405 **[NOUVEAU]** | 13/05/2026 | « *Keeping the base model's performance right after growth is not required* » ; stratégies simples > opérateurs complexes ; **facteur 2× le plus fiable** ; gains maximaux à ~20 tokens/param et **s'effacent aux gros budgets** ; borne supérieure sur g | **contredit** l'insistance « function-preserving » de BSK ; **appuie** la croissance *dans le régime petit budget* de BSK/baby-brain |
| *How Model Growth, Recursion, and Boundary Operators Influence Scaling Exponents*, Chen … Wilson, arXiv:2609.19107 **[NOUVEAU]** | 16/09/2026 | La croissance **change l'exposant** de loi d'échelle ; modèle 7,4B « growth » = GPT-3 13B sur CORE avec ~20× moins de calcul | **appuie** T6 ; donne une métrique (pente loss/compute) |
| *Neural Developmental Programs* 2307.08197 ; *From Growing to Looping* 2602.16490 **[NOUVEAU]** | 2023, 2026 | Auto-assemblage ; boucles = croissance partagée | neutre ; voie « neurogenèse programmée » |
| Élagage : *Synaptic Pruning … Regularization* 2508.09330 (warm-up puis élagage cubique) ; *Pruning as Evolution* 2601.10765 (MNIST, 35 % sparsité → 95,5 %) ; *Finding Sparse Subnetworks in One Cycle* 2606.12278 ; *Developmental Plasticity-inspired Adaptive Pruning for SNN/ANN* 2211.12714 **[NOUVEAU]** | 2022–2026 | Surcroissance→élagage existe en régularisation ; rien à l'échelle LM 2026 | neutre ; BSK serait **premier** à combiner croissance+élagage+spikes à l'échelle LM — mais avec des comparateurs faibles |
| SpikeGPT 2302.13939 ; SpikeLLM 2407.04752 ; FAS 2502.04405 ; LAS 2505.09659 **AAAI 2026** (`lc783/LAS` 10★, sans licence) **[dépôt]** | 2023–2026 | Conversions ANN→SNN quasi sans perte | fondement T10/T11 |
| SpikingBrain 1.0, arXiv:2509.05276, **TMLR 2026** ; `BICLab/SpikingBrain-7B` 1 426★ MIT **[dépôt]** ; **SpikingBrain2.0**, Pan … Li, arXiv:2604.22575 **[NOUVEAU]** | 24/04/2026 | SpB2.0-5B / VL-5B (base Qwen3-4B) ; DSSA (softmax sparse 1:3 linéaire sparse) ; **64,31 % sparsité** ; **−70,6 % surface / −46,5 % puissance à 500 MHz** *sur exécution neuromorphique* ; 10,13× TTFT à 4M ctx ; **< 7 k GPU·h A100** | **contredit** T10 (« 0,032 mJ/tok théorique ») : la réduction mesurée est 2× en puissance, sur silicium dédié, pas 91,6× |
| NeuronSpark, Tang, arXiv:2603.16148 **[NOUVEAU]** (v2 09/10/2026) | mars 2026 | **1,1B de zéro sur 2,1B tokens**, sans attention, neurones LIF à décroissance/gain/seuil **adaptatifs par token** ; 40,0 moy. 8 tâches = 95 %/93 % de Pythia/Mamba ; proxy énergie −90 %/−67 % (VHDL) ; **FPGA réel : TTFT 24 s, 0,082 tok/s** | **dépasse** BSK (échelle 8×, même régime « de zéro ») ; **contredit** l'efficacité pratique : le chemin matériel réel est 3 ordres de grandeur trop lent |
| SymbolicLight V1, Liu, arXiv:2605.21333 **[NOUVEAU]** (v3 07/09/2026) | mai 2026 | 4 modèles **194M de zéro, 3B tokens**, LIF binaire + flux résiduel continu ; **89,96 % zéro-spike** (encodeur seulement) ; PPL **+7,7 % vs GPT-2 201M** ; **mesuré RTX 2080 Ti : 22,8 vs 91,5 tok/s et 2 848 vs 905 mJ/token** (le spiking est 4× plus lent et 3× plus énergivore sur GPU) | **contredit** T10/T12 sur l'énergie *mesurée* ; comparateur direct de BSK (même échelle) |
| *Adaptive Spiking Neurons for Vision and Language*, Zhou … Tian, arXiv:2604.12365 **[NOUVEAU]** | 14/04/2026 | ASN/NASN : dynamique membranaire apprise, « integer training / spike inference », 19 jeux de données | neutre ; brique de neurone pour BSK |
| Project Nord (`gtausa197-svg/-Project-Nord-…`, 83★ Apache-2.0) **[NOUVEAU]** | août–oct. 2026 | « *first pure SNN language model trained from scratch* » — auto-proclamé, non évalué | neutre ; preuve que le créneau « SNN-LM de zéro » se remplit |
| Énergie SNN : *All in one timestep*, Castagnetti, Pegatoquet, Miramond, arXiv:2510.24637 (spikes multi-niveaux 2–3× moins d'énergie que binaire ; « spike avalanche » dans les résiduels) ; *Rethinking the Energy Efficiency of SNNs and ANNs*, ACM 10.1145/3822176 (page 403, non lue : d'après l'extrait, l'accès mémoire est négligé par la métrique SynOps) ; *Synaptic Activity … Digital Neuromorphic*, ACM 10.1145/3520133 (2022) **[NOUVEAU]** | 2022–2025 | La métrique « opérations synaptiques » surestime le gain ; l'énergie réelle est dominée par le trafic mémoire | **contredit** le « 91,6x ops reduction » comme preuve d'énergie |

### 2d. MoE-LoRA, routage, oubli, mémoire d'agents

| Réf | Date | Résultat clé | Relation à T9 |
|---|---|---|---|
| Chowdhury 2609.03150 ; Xie & Alanwar 2607.23711 ; Janati 2608.07890 ; Zhang 2606.12883 ; Bao 2610.30755 **[veille]** | 2026 | (voir veille) | — |
| PaLoRA, Li, Zeng, Tang, arXiv:2610.04226, **NeurIPS 2026** **[NOUVEAU]** | 03/10/2026 | « *finite-precision updates leak into the subspace of prior knowledge even under nullspace projection* » ; loi de cadence s* = √(R/c) ; +~4 % sur 50 tâches ImageNet-A/R | **contredit** T9 (« null-space superflu ») : même la projection parfaite fuit ; l'angle de 88,6° ne borne pas la fuite |
| PEAM, Guo et al., arXiv:2605.27762 **[NOUVEAU]** | 26/05/2026 | Mémoire **paramétrique** d'agent : MoE-LoRA avec un adaptateur **physiquement isolé par catégorie de compétence** ; score de « *parameterization-worthiness* » + déclenchement auto-échelle décidant *quoi/quand* consolider ; Minecraft | **dépasse** Aeon (rappel par récupération) : consolidation en poids = pont micro-kiki ↔ dream-of-kiki |
| MemDelta, Wang, arXiv:2606.29914 **[NOUVEAU]** | 29/06/2026 | LongMemEval-S, une variable à la fois : changer **l'embedding seul = +6,2 pp** (p=0,004) ; RAG verbatim ≈ contexte complet (47,2 vs 49,8, p=0,34) mais ordre inversé selon la famille de modèle ; mémoire-agent 42 % < récupération 47 % ; Mem0 = cloud-RAG à **50× le coût** sur 2/6 types | **contredit** toute lecture de « 36+ rappels » comme gain : fixer l'embedding, stratifier par modèle, rapporter le coût d'écriture |
| StreamMemBench 2606.14571 ; MemoryArena 2602.16313 ; MemoryAgentBench ICLR 2026 **[NOUVEAU]** | 2026 | Bancs en flux / multi-session | neutre ; bancs pour Aeon |
| `mem0ai/mem0` 67 736★ Apache-2.0 ; `MindLab-Research/Mixture-of-LoRA-Harness` 197★ MIT ; FreeFuse (TMLR 2026) 246★ **[NOUVEAU]** | 2026 | Infrastructure mémoire / service de centaines de LoRA avec routage-composition | neutre ; comparateurs d'ingénierie |

---

## 3. Preuves POUR / CONTRE les thèses

**POUR « WML de zéro + protocole nerveux »**
1. LeWM (15M, 1 GPU, quelques heures) et EB-JEPA (Two Rooms 97 %) démontrent qu'un apprenant de modèle du monde **de zéro et petit** est viable et planifie — l'échelle visée par T4/T5 n'est pas fantaisiste **[NOUVEAU]**.
2. Klindt–LeCun–Balestriero (2605.26379) : latents gaussiens linéairement identifiables ⇒ deux modules hétérogènes entraînés sur le même monde partagent une structure reliée par une **application linéaire** — c'est la condition d'existence que suppose nerve-wml (transducteurs par arête) et que DR-3 reformulé (structure relationnelle) vise **[NOUVEAU]**.
3. Dupoux–LeCun–Malik (2603.15381) formulent A/B/M — baby-brain en est une instance opérationnelle (stades = M). Personne d'autre n'a de harnais exécutable qui ordonne A et B par stade **[NOUVEAU]**.
4. Warmstarting (2605.13405) + exposants (2609.19107) : la croissance paie **surtout à petit budget de tokens** — le régime de BSK et de baby-brain — et peut changer la pente d'échelle **[NOUVEAU]**.
5. *Remember to be Curious* : WM persistant + mémoire épisodique sont des prérequis de l'exploration 3D — l'assemblage baby-brain + dream-of-kiki + Aeon est la bonne décomposition **[NOUVEAU]**.
6. BabyVLM-V2 (CVPR 2026) : un modèle compact de zéro bat GPT-4o sur certaines tâches DevCV — le « petit et développemental » est publiable au plus haut niveau **[NOUVEAU]**.

**CONTRE**
1. **Redondance partielle** : le substrat « trunk 150M + décodeurs pixel/audio/texte » de SP1 (reconstruction) est dominé par un JEPA 15M en prédiction latente (Cui et al. : latent plus robuste ; LeWM : 48× plus rapide). T5 range la perte JEPA en *auxiliaire* : c'est inversé par rapport à l'état de l'art.
2. **Angles morts JEPA** (vitesse, état physique) : un WML-JEPA sans proprioception ni copie d'efférence ne « comprend » pas le mouvement (2610.04585, 2608.06799). Le « de zéro » pur (Path-B) sans corps est voué à ces angles morts.
3. **LP négatif** de SP7 n'est pas une curiosité : la mesure (fenêtre 8) est théoriquement inadaptée (Oudeyer : échelles multiples ; Curiosity-Critic ; Elmoznino : LP non biaisé impossible sans mise à jour).
4. **Énergie des spikes** : toutes les mesures *réelles* 2026 (SymbolicLight ×3 pire sur GPU ; SpikingBrain2.0 −46,5 % puissance seulement sur silicium dédié ; NeuronSpark FPGA 0,08 tok/s) contredisent le « 0,032 mJ/tok théorique / 91,6× » de T10. Sans matériel neuromorphique, BSK et SpikingKiki ne peuvent revendiquer que de la sparsité, pas de l'énergie.
5. **BSK est déjà dépassé en échelle** par NeuronSpark (1,1B de zéro) et égalé par SymbolicLight (194M) ; sa seule différenciation est croissance+élagage, et Warmstarting dit que le « function-preserving » n'est pas la variable qui compte.
6. **micro-kiki** : PaLoRA invalide la conclusion « orthogonalisation superflue » (fuite en précision finie même avec projection) ; MemDelta exige un protocole contrôlé pour Aeon ; PEAM propose une alternative paramétrique crédible au rappel épisodique.
7. **Artefact BSK introuvable** : impossible d'auditer la revendication « de zéro » ; les artefacts publics nommés SpikingKiki sont des conversions LAS, ce qui prêtera à confusion devant un relecteur.

---

## 4. Section JEPA dédiée

### 4.1 Ce qui tourne sur Mac M1 32 Go (vérifié API HF ; tailles = safetensors/GGUF)

| Poids | Taille | Licence | Inférence M1 | Entraînement M1 |
|---|---|---|---|---|
| `quentinll/lewm-pusht` (+ `-tworooms`, `-cube`, `-reacher`) | **72 Mo** | MIT | oui (PyTorch MPS ; GGUF `jepacpp/lewm-pusht-GGUF`) | **oui** (15M ; « 1 GPU quelques heures » ⇒ ordre de grandeur 1–2 jours MPS/MLX, à mesurer) |
| `jepacpp/lejepa-vits16-pretrain-in1k-GGUF` ; `galilai-group/lejepa` 1 398★ | 42 Mo f16 / 23 Mo q8 | Apache-2.0 | oui, CPU (jepa.cpp) | oui à petite échelle (ViT-S, CIFAR/Moving MNIST) |
| `facebook/dinov2-small` | 88 Mo | Apache-2.0 | oui **[dépôt : encodeur SP1]** | gelé (JEPA-WMs l'utilise gelé + prédicteur depth 6) |
| `facebook/jepa-wms` (pusht/pointmaze/wall/metaworld : DINOv2 ViT-S/14 + préd. depth 6) | petit (non chiffré sur la fiche) | **CC-BY-NC-4.0** | oui | prédicteur ré-entraînable |
| `facebook/vjepa2-vitl-fpc64-256` | 1,3 Go | MIT | oui | non (encodeur) ; prédicteur AC ≈300M : fine-tune possible mais lent |
| `facebook/vjepa2-vitg-fpc64-256` / `-vith-` | 4,1 Go / ~2,5 Go | Apache-2.0 / MIT | oui (gigantic : juste) | non |
| V-JEPA 2.1 ViT-B/L 384 (`apiantonio/vjepa2.1-vit-large-384` 1,3 Go, communautaire MIT ; **pas de dépôt `facebook/vjepa2.1` trouvé sur HF**) ; port **MLX** `lukasugar/vjepa2.1-mlx` (6★, MIT, encodeur seul, base+large, plus rapide que MPS sur M1 Max, MPS échoue à 64 frames) ; GGUF `jepacpp/vjepa2_1-vitb-384-GGUF` 210/113 Mo | 0,2–1,3 Go | MIT | **oui, natif MLX** | non |
| `facebook/ijepa_vith14_1k` | 2,5 Go | **CC-BY-NC-4.0** | oui | non |
| `jepa-world-models/h-jepa` (31 ckpt, 12,4 Go) ; GGUF 55–184 Mo par ckpt (ant/pusht) | 55 Mo–… | MIT | oui (CPU, planificateur top-down inclus dans jepa.cpp) | niveaux 1–2 sur ant/pusht : oui ; DROID : non |
| `awwkl/zwm-kinetics-170m` (ouvert) / `zwm-babyview-170m` (accès manuel) | 687 Mo | MIT (code) | oui (CUDA requis dans le repo → port à faire) | non (8×A40) |

`aselimc/jepa.cpp` (6★, MIT, ggml, CPU « any », CUDA optionnel, **Metal non mentionné**) couvre LeJEPA, LeWM, H-JEPA, I-JEPA, V-JEPA 2/2.1/2-AC + CEM ; parité cosinus 1,000 en f32. Pour le M1 : inférence CPU immédiate ; entraînement via MLX (port encodeur existant) ou PyTorch MPS.

### 4.2 Ce qu'un WML-JEPA changerait

**baby-brain.** (i) Inverser T5 : la perte JEPA (SIGReg + prédiction du latent suivant, action-conditionnée) devient l'objectif **primaire** du trunk ; les décodeurs texte/audio/image deviennent des têtes auxiliaires gelées par stade. (ii) La **dimension latente** devient la variable ontogénétique (Cui et al.) : croître d_latent par stade = « neurogenèse » mesurable par la borne regret. (iii) Le corps répare l'angle mort vitesse : proprio + copie d'efférence en entrée du prédicteur (TI-JEPA/PSG-JEPA) ⇒ les phases 1b/1c de SP7 sont le bon banc. (iv) Curiosity-Critic remplace la fenêtre LP ; `lpm.py` reste pour l'éval. (v) DevCV Toolbox (BabyVLM-V2) comme batterie développementale externe.

**nerve-wml.** Si chaque WML est un LeJEPA (latent gaussien isotrope, identifiable linéairement), alors (a) la quantification en codebook 64 est une quantification d'une gaussienne — la taille optimale du codebook se calcule (distorsion-débit) au lieu d'être fixée ; (b) le transducteur par arête est une **rotation + VQ**, testable par Procrustes orthogonal ; (c) le mélange γ/θ peut transporter les *directions de sketch* (projections aléatoires de SIGReg) comme message — hypothèse C1 §10. Le claim « couche orthogonale » survit : aucun JEPA-WM publié ne définit de protocole inter-modules.

**dream-of-kiki.** Un WML-JEPA fournit un substrat où « rêver » = dérouler le prédicteur dans le latent (imagination à la Dreamer, mais sans décodeur). La détection de surprise de LeWM (événements physiquement implausibles) est un déclencheur naturel de consolidation. Les axiomes DR-0…DR-4 deviennent testables sur un substrat 15M, 5 graines, sur M1 — ce que la rétractation du gain LLM (19/06) ne permettait plus à 35B.

**Verdict sur la question directrice.** JEPA ne rend pas la thèse baby-brain redondante : il lui donne **le substrat** qui lui manquait (un WML de zéro qui marche) et lui retire **l'originalité du substrat** (SP1 reconstructif). L'originalité qui reste est triple et aucune ne vient de JEPA : le *harnais* (stades/plasticité/M), le *protocole* (nerve-wml), la *consolidation* (dream-of-kiki). BSK et le triple hybride SNN sont, eux, rendus largement obsolètes par NeuronSpark/SymbolicLight/SpikingBrain2.0, sauf à prouver un effet croissance+élagage que personne n'a mesuré.

---

## 5. Dépôts GitHub réutilisables (étoiles, dernier push, licence — API GitHub 24/10)

| Dépôt | ★ | Push | Licence | Usage |
|---|---|---|---|---|
| `galilai-group/stable-worldmodel` | 2 271 | 2026-10-02 | MIT | banc reproductible WM (envs à propriétés contrôlables, DINO-WM, planif.) |
| `galilai-group/lejepa` | 1 398 | 2026-01-25 | Other | SIGReg de référence |
| `facebookresearch/vjepa2` | 4 810 | 2026-03-23 | MIT | V-JEPA 2/2.1 (code) |
| `facebookresearch/jepa-wms` | 505 | 2026-04-11 | Other (poids CC-BY-NC) | étude Terver ; recettes DINOv2-S + prédicteur |
| `facebookresearch/eb_jepa` | — (non interrogé) | 2026 | — | exemples 1 GPU |
| `kevinghst/H-JEPA` | 190 | 2026-10-10 | MIT | hiérarchie JEPA (N11-A) |
| `aselimc/jepa.cpp` | 6 | 2026-10-15 | MIT | inférence CPU GGUF de toute la famille |
| `lukasugar/vjepa2.1-mlx` | 6 | 2026-04-28 | MIT | encodeur V-JEPA 2.1 natif MLX |
| `mandarwagh9/dvd-jepa` | 36 | 2026-10-14 | MIT | JEPA-WM minuscule reproductible (physique d'un logo) — gabarit pédagogique |
| `PhilV1tt/world-model-from-scratch` | 4 | 2026-07-15 | MIT | JEPA SIGReg+VICReg + CEM, de zéro |
| `awwkl/ZWM` | 43 | 2026-08-25 | MIT | bras ZWM (CUDA) |
| `trieschlab/MIMo` | 51 | 2026-07-06 | MIT | corps nourrisson MuJoCo qui grandit |
| `danijar/dreamerv3` / `danijar/crafter` | 3 904 / 604 | 2026-10-04 / 2024-01-23 | MIT | baseline N11-C ; env 2D |
| `facebookresearch/habitat-lab` | 3 167 | 2026-05-07 | MIT | 3D (InJePA) |
| `BICLab/SpikingBrain-7B` | 1 426 | 2026-05-14 | MIT | SNN-LM hybride (code) **[dépôt]** |
| `lc783/LAS` | 10 | 2025-12-05 | **aucune** | conversion LAS **[dépôt]** — risque licence |
| `gtausa197-svg/-Project-Nord-…` | 83 | 2026-08-28 | Apache-2.0 | SNN-LM « de zéro » (non audité) |
| `babylm-org/babylm-eval` ; `timinar/BabyLlama` | 14 ; 84 | 2026-07-19 ; 2026-08-20 | — ; MIT | éval BabyLM 2026 ; baseline Strict-Small |
| `mem0ai/mem0` ; `MindLab-Research/Mixture-of-LoRA-Harness` | 67 736 ; 197 | 2026-10-23 ; 2026-07-23 | Apache-2.0 ; MIT | comparateurs Aeon ; service multi-LoRA |

---

## 6. Ressources Hugging Face

Modèles : voir §4.1 (JEPA). Spiking : `maujim/spikingbrain-v1-7b-base` 15,2 Go (MIT, custom code) ; `electron-rare/spikingkiki-27b` 53,8 Go (122 dl, requantifié par `mradermacher` — signal d'intérêt externe) ; `clemsail/spikingkiki-35b-a3b-v4` 19,9 Go npz (0 dl) ; aucun poids public NeuronSpark/SymbolicLight trouvé par recherche `spiking`.
Datasets : `BabyLM-community/BabyLM-2026-Strict` (725 dl) et `-Strict-Small` (616) ; `cambridge-climb/BabyLM` ; `drooryck/babylm-macaroni-corpus` (2026-07) ; **BabyView et SAYCam absents de HF** (Databrary, DUA) ; sous-ensembles Ego4D (`Wangtwohappy/Ego4D_audio_subset`…) ; `vanyacohen/MET-Bench-Minecraft-Trajectories` ; corpus parole enfant FR : aucun trouvé (seulement kazakh/russe, anglais).
Papers API : « JEPA world model » → 8 entrées 2026-07→10 (toutes listées §2a) ; « spiking language model » → NeuronSpark, SymbolicLight, Adaptive Spiking Neurons ; « LeJEPA » → 2605.26379 et Laya (EEG, 2603.16281).

---

## 7. Actualités septembre–octobre 2026 (toutes **[NOUVEAU]** sauf H-JEPA)

- 02/09 : JEPA-WMs v4 (Terver et al.) — version consolidée avec *data scaling*.
- 07/09 : SymbolicLight v3 — ajoute les mesures GPU réelles (énergie ×3 défavorable).
- 16–17/09 : *Model Growth … Scaling Exponents* (Wilson) — la croissance change l'exposant.
- 29/09 : *Generalization Theory for JEPA-WM* v2.
- 03/10 : *Velocity Blind Spot* (LeWM sans vitesse) ; **PaLoRA** (NeurIPS 2026, fuite null-space).
- 05/10 : H-JEPA **[veille]** ; 13/10 : GGUF H-JEPA pour jepa.cpp (1 181 dl en 11 jours).
- 09/10 : NeuronSpark v2 (chiffres FPGA).
- 15/10 : jepa.cpp dernier push ; 22/10 : `vjepa2.1-mlx` ; 23/10 : `point-lewm`, `lejudge-jev-jepa`.
- 24–29/10 : atelier BabyLM 4 (EMNLP Budapest) — **résultats non publiés au 24/10**.
- Marché : AMI Labs 1,03 Md$ (mars) ; Genie 3 grand public mais fermé ; Dreamer 4 toujours sans code officiel.

---

## 8. Réfutations / tests critiques réalisables (M1 32 Go ou RTX 4090 24 Go)

| # | Test | Matériel | Ce qu'il réfute si négatif |
|---|---|---|---|
| R1 | Reproduire LeWM Push-T (72 Mo) sur M1 : entraînement MLX/MPS ≤ 48 h, succès planif. ≥ 80 % de la valeur publiée | M1 | la faisabilité « WML de zéro sur M1 » |
| R2 | Sonde vitesse sur le JEPA de baby-brain (ViZDoom/MuJoCo) : R² vitesse vs position | M1 | « le WML comprend la dynamique » si R² vitesse ≈ 0 |
| R3 | Recalculer LP de SP7 avec Curiosity-Critic ; comparer au signe de `mean_lp` | M1 | la lecture « LP négatif = env saturé » |
| R4 | Mesurer **J/token intégré** (nvidia-smi 10 Hz) de `spikingkiki-27b` Q4 vs Qwen3.5-27B Q4 sur 4090 | 4090 | T10 (0,032 mJ/tok) et tout claim énergie BSK |
| R5 | Rejouer `eval_nullspace_ablation.py` en **bf16 vs fp32** et après 10 empilements séquentiels : win-rate inter-domaines | Studio/4090 | T9 (« null-space superflu ») si fuite > 2 pp (PaLoRA) |
| R6 | MemDelta sur Aeon : fixer l'embedding (e5-large vs mpnet), RAG verbatim vs Aeon, 3 familles de modèles | 4090 | « Aeon est le vrai différenciateur » |
| R7 | Croissance 2× vs de zéro à budget égal (~20 tok/param) sur un LM 35M→70M FR (non spiking d'abord) | 4090 | la valeur de la neurogenèse BSK |
| R8 | Procrustes entre deux LeJEPA (graines/modalités différentes) sur Two Rooms : MI/H du transducteur linéaire vs MLP | M1 | « les transducteurs doivent être appris non linéairement » |
| R9 | Bras chronologique (ZWM-like, sans stades) vs stades gatés sur le flux SP7 — 5 graines | M1 | Claim A |
| R10 | MIMo + croissance corporelle : ε-plateau atteint plus vite avec corps qui grandit vs corps adulte dès t=0 | M1 (CPU) | T6 version « corps » |

---

## 9. Brainstorm : hypothèses falsifiables (≥10 ; ★ = hors paradigme LLM/transformer)

| # | Énoncé | Prédiction quantitative | Test | Réfutation | Référence d'appui |
|---|---|---|---|---|---|
| H1 ★ | **Inversion JEPA** : un WML dont l'objectif primaire est la prédiction latente (LeJEPA+action) atteint le plateau ε de SP7 avec moins d'interactions qu'un WML reconstructif (SP1) | ratio d'échantillons ≥ 2 (ViZDoom Basic, MuJoCo Reacher), 5 graines | mêmes envs, même budget, 15–30M params chacun | IC95 du ratio inclut 1 | LeWM 2603.19312 ; Cui 2606.27014 |
| H2 ★ | **Claim A sur substrat JEPA** : gates de plasticité par stade (encodeur gelé tôt, prédicteur tard) vs plat | −15 % d'échantillons pour 90 % de succès Two Rooms | EB-JEPA Two Rooms, 5 graines | gain ≤ 5 % | EB-JEPA 2602.03604 ; Warmstarting 2605.13405 |
| H3 ★ | **Copie d'efférence** : injecter action(t−k…t) + proprio dans le prédicteur supprime l'angle mort vitesse sans code mouvement explicite | R² vitesse ≥ 0,6 (vs ≤ 0,1 sans) | sondes linéaires sur latents, Reacher 1c | R² < 0,3 | Velocity Blind Spot 2610.04585 ; PSG-JEPA 2608.06799 |
| H4 ★ | **Transducteur linéaire suffit** entre deux LeJEPA du même monde | MI/H Procrustes ≥ 0,90 × MI/H MLP | nerve-wml Track-W, 2 graines × 2 modalités | < 0,70 | Klindt 2605.26379 |
| H5 ★ | **Croissance à petit budget** (BSK) : 35M→70M→140M (2× par étape) bat 140M de zéro à ≤ 3B tokens | PPL −5 % à calcul égal | corpus FR, 3 graines, non spiking puis spiking | PPL ≥ de zéro | Warmstarting 2605.13405 ; Chen-Wilson 2609.19107 |
| H6 | **Énergie mesurée** : un LM à impulsions sans matériel dédié consomme ≥ 1× le dense | mJ/token spiking ≥ dense sur 4090 | R4 | spiking < 0,8× dense | SymbolicLight 2605.21333 ; SpikingBrain2.0 2604.22575 |
| H7 ★ | **Élagage développemental** : surcroissance puis élagage cubique atteint fire rate 1–3 % avec PPL ≤ +3 % | sparsité ≥ 97 %, ΔPPL ≤ 3 % | BSK 140M, schedule 2508.09330 | ΔPPL > 10 % | 2508.09330 ; 2211.12714 |
| H8 | **Fuite null-space** (micro-kiki) : projection + bf16 → perte sur domaines antérieurs après 10 empilements | drop win-rate ≥ 2 pp | R5 | < 0,5 pp | PaLoRA 2610.04226 |
| H9 | **Consolidation paramétrique vs Aeon** : un LoRA d'épisodes (dream-of-kiki) égale le rappel Aeon | écart ≤ 5 pp, tokens d'inférence ÷ 10 | 14 tours, 3 domaines | écart > 10 pp | PEAM 2605.27762 |
| H10 | **Aeon sous MemDelta** : à embedding fixé, Aeon ≈ RAG verbatim | |Δ| < 3 pp | R6 | Aeon ≥ +5 pp (alors Aeon gagne) | MemDelta 2606.29914 |
| H11 ★ | **Curiosity-Critic** rend LP positif là où la fenêtre 8 est négative | signe + sur ≥ 4/5 graines ViZDoom | R3 | ≤ 2/5 | 2604.18701 ; Oudeyer 2026 |
| H12 ★ | **Persistance + épisodes** : contexte épisodique dans la boucle SP7 augmente la couverture | régions visitées +30 % | ViZDoom maze | < +10 % | *Remember to be Curious* 2605.22814 |
| H13 | **Stades programmés vs émergents** (ZWM) : sans gates, l'ordre des stades n'apporte rien | Δ = 0 (nul préenregistré, TOST ±5 %) | R9 | effet > 5 % | ZWM 2604.10333 |
| H14 ★ | **Exposant d'échelle** : la croissance change la pente loss/compute sur 3 tailles | pente growth > scratch hors IC | balayage 35/70/140M | pentes égales | Chen-Wilson 2609.19107 |

---

## 10. Concepts et intuitions nouveaux (spéculatif, étiqueté)

- **C1 [spéculatif, test H4]** *Neuroletters gaussiennes.* Si chaque WML est un LeJEPA, son latent est une gaussienne isotrope ; le « codebook 64 » de nerve-wml est alors une quantification de gaussienne (taille optimale calculable), les transducteurs sont des rotations, et le multiplexage γ/θ peut transporter des *directions de sketch* (projections aléatoires de SIGReg) : γ = coefficients, θ = direction. Fusionne nerve-wml et LeJEPA sans nouveau mécanisme.
- **C2 [spéculatif, test H3]** *JEPA à copie d'efférence.* Le prédicteur reçoit l'action émise (pas seulement l'observation) comme un cortex moteur fournit une copie d'efférence ; le canal « vitesse » émerge du corps, pas d'un code explicite. Si vrai, Path-B (pur) est réalisable à condition d'avoir un corps.
- **C3 [spéculatif, test H2/H14]** *Neurogenèse = ajout de niveaux H-JEPA par stade.* Stade k ajoute le niveau k (horizon plus long) ; les niveaux anciens gèlent (plasticité régulée). Warmstarting dit qu'il n'est pas nécessaire de préserver la fonction à l'ajout — le « function-preserving » de BSK est une contrainte à relâcher.
- **C4 [spéculatif, préenregistrable]** *Rêver = dérouler le prédicteur, déclenché par la surprise.* DR-2 (épisodes discrets) peut être rendu continu : la surprise LeWM (événement implausible) ouvre une fenêtre de consolidation — réconcilie dream-of-kiki avec Zhang et al. (replay sans phase hors-ligne, veille).
- **C5 [prêt à préenregistrer]** *Protocole d'honnêteté énergétique.* Toute revendication SNN du programme rapporte J/token intégré sur matériel cible + taux de spikes + trafic mémoire, jamais SynOps seuls (ACM 3822176 ; SymbolicLight).
- **C6 ★ [spéculatif]** *Spiking-JEPA.* Spikes uniquement dans l'encodeur (où SymbolicLight mesure 90 % de zéros), prédicteur continu, perte latente : les impulsions deviennent un *codage d'entrée* parcimonieux plutôt qu'un substrat complet — c'est peut-être le seul endroit où BSK a un avantage réel.
- **C7 [prêt à préenregistrer]** *baby-brain = instance de A/B/M (Dupoux–LeCun–Malik).* Reformuler SP6 : stades = politique M, curriculum = A, SP7 = B. Prédiction : un harnais sans M (A puis B fixes) est dominé par M appris ou programmé sur la couverture de concepts (Claim B).
- **C8 [spéculatif]** *Dimension latente comme horloge développementale.* Cui et al. montrent un compromis gouverné par d_latent ; croître d_latent quand la borne de regret stagne est une règle de neurogenèse *dérivée de la théorie*, pas d'une métaphore.

**Prêt à préenregistrer** : H1, H2, H4, H6, H8, H10, H13, C5, C7. **Spéculatif avec test** : H3, H5, H7, H9, H11, H12, H14, C1–C4, C6, C8.

---

## Limites de cette revue

Budget WebSearch épuisé après 18 requêtes : LeJEPA-identifiabilité, Terver et MIMo ont été vérifiés par fiches arXiv/GitHub plutôt que par recherche ; l'ACM 3822176 n'a pas pu être lu (403) ; `export.arxiv.org` répondait 429 (vérifications faites sur `arxiv.org/abs` et l'API HF papers). Les résultats BabyLM 2026 sortent pendant l'atelier (24–29/10). Les chiffres LeWM/EB-JEPA « 1 GPU quelques heures » n'ont pas été convertis en temps M1 mesuré (R1 le fera). BSK n'a pas d'artefact public : ses énoncés viennent du brief du PI.
