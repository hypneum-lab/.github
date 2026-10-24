# R6 — Futures IA et substrats alternatifs : revue critique pour Hypneum Lab

2026-10-24 · Axe R6 (post-transformer, quantique, neurosciences, wetware, calcul thermodynamique/photonique)
Base : `veille-2026-10-23.md` (non dupliquée) + README `hypneum-lab`, `dream-of-kiki`, `nerve-wml`, `baby-brain` (lecture seule).
Étiquettes : **[NOUVEAU]** = absent de la veille du 23/10 ; **[veille]** = déjà cité ; **(2nd)** = source secondaire, à confirmer ; **(non vérifié)** = titre seul.
Relation à Hypneum : **appuie / contredit / dépasse / neutre / positionne** + dépôt concerné.

Invariants Hypneum utilisés comme grille : **consolidation bornée** (DR-0 budget fini, DR-1 fenêtre τ_max, 4 opérations replay/downscale/restructure/recombine), **protocole discret** (neuroletters post-VQ, transducteurs par arête, multiplexage γ/θ = GTM), **substrat-agnosticisme** (DR-3 opérationnel = Critère de Conformité C1 typage / C2 tests d'axiomes / C3 invariants bloquants S1-S3, I1).

---

## 0. Lecture d'ensemble (10 lignes)

1. **Le vent souffle vers la « consolidation en continu »** (Titans/Hope/TTT, fast weights, MemoryBench de Meta) : la mémoire s'écrit à chaque token, sans phase hors-ligne. C'est la vraie menace conceptuelle pour DR-0 (« pas de rêve ambiant ») — mais elle est aussi une chance : un module TTT est un substrat candidat à la conformité C+, et le « continuum memory system » de Hope est formellement un GTM à N fréquences.
2. **La hiérarchie bi-fréquence seule n'achète rien** : l'analyse ARC Prize de HRM (le H/L n'apporte ~0, la boucle externe de raffinement tout) rime exactement avec le verdict « tied » du GTM. Le comparateur juste pour N10/N11 est un non-hiérarchique à boucle externe, pas un oscillateur de plus.
3. **Les règles locales passent enfin en profondeur** (PC-ALM 1 000 couches, ePC+bPC 4 bits, DeltaNet-PC = mémoire de test-time sans BPTT) : un substrat PC conforme à GENIAL est aujourd'hui réaliste sur M1.
4. **Quantique : verdict négatif confirmé en 2026** — l'« avantage » IBM du 30/07 est de la physique, pas de l'apprentissage ; un théorème (19/10) borne la mémoire des réservoirs quantiques bruités par les qubits frais, pas par la taille ; l'entraînement par recuit se fait encore… en recuit simulé. Rester archivé.
5. **Wetware : accessible mais non-apprenant à ce jour** — la première étude FinalSpark d'octobre 2026 traite l'organoïde comme un réservoir fixe (83 % avec 3 organoïdes contre 82 % sans organoïde en propre) ; la stimulation répétée déprime la réponse (93 % → 10 % du réseau). Utile pour Hypneum uniquement comme **test de substrat-agnosticisme à la limite** (Claim B oui, Claim A non prédit).
6. **Thermodynamique/p-bits** : les seuls résultats matériels sont des FPGA (10^6 p-bits, 10^12 flips/s) ; Extropic reste une projection (10 000× sur Fashion-MNIST binarisé). La pièce utile pour Hypneum : `recombine` comme échantillonnage de Gibbs, implémentable en simulation.
7. **Neurosciences** : dendrites = signaux d'erreur locaux (revue Petrovici/Senn), astrocytes = accumulateurs lents de contexte (automate hybride) et portes d'attention émergentes — deux mécanismes qui donnent un sens biologique au « quand consolider », absent de GENIAL.
8. Verdict transversal : **les trois invariants Hypneum survivent au changement de paradigme**, à condition de reformuler DR-0 en budget (non en temps) et de revendiquer DR-3 au niveau protocole, jamais représentation.

---

## 1. État de l'art par sous-axe

### 1a. Architectures post-transformer et apprentissage en continu

| Réf | Date | Résultat vérifié | Relation → dépôt |
|---|---|---|---|
| Behrouz & Mirrokni, *Nested Learning* / archi **Hope** (NeurIPS 2025 ; blog Google 07/11/2025) [NOUVEAU] | 2025-11 | Modèle = problèmes d'optimisation imbriqués ; **Continuum Memory System** = spectre de mémoires mises à jour à des fréquences différentes ; Hope > Titans/Samba/Transformer en PPL et NIAH (pas de code ni poids publiés) | **contredit** DR-0 (consolidation ambiante, par token) ; **appuie** nerve-wml (CMS ≡ multiplexage fréquentiel généralisé du GTM) |
| Pan & Behrouz, *Titan-Llama* arXiv:2610.19210 [NOUVEAU] | 2026-10-13 | Rétrofit d'un LLM pré-entraîné avec modules de mémoire neuronale externes (Titans) | **positionne** micro-kiki (mémoire externe vs LoRA/Aeon) |
| Peng et al., *VisionHOPE* arXiv:2609.33325 [NOUVEAU] | 2026-09-27 | Backbone visuel « auto-modifiant » (Hope) | **neutre** ; comparateur N10-A |
| TTT famille : e2e TTT 2512.23675 ; TTCD 2608.01672 ; SCoL 2605.07076 ; Latent Compaction 2610.20582 ; World-T3 2610.17434 (RLS, PSNR revisite 13,5→18,3 dB, 20,6 FPS B200) ; JEPA-TTT 2610.00722 [NOUVEAU] | 2025-12 → 2026-10 | Écriture en poids rapides à l'inférence ; SCoL = « consolidation continue du contexte dans les poids en limitant l'interférence » (= replay+downscale sans phase hors-ligne) | **contredit** épisodes discrets (même fil que Zhang et al. [veille]) ; **dépasse** kiki_oniric sur le coût ; **appuie** DR-1 (chaque épisode est consommé) |
| Lahoti et al., **Mamba-3** arXiv:2603.15569, ICLR 2026 ; poids `state-spaces/mamba3-{siso,mimo}-187m`, `siso-1.5b` (Apache-2.0, 2026-07-28) [NOUVEAU] | 2026-03 | Discrétisation exp-trapèze + état complexe + MIMO ; parité 100 % (vs ~0,9 % Mamba-2) ; +1,8 pt vs Gated DeltaNet à 1,5B ; retrieval non structuré toujours derrière l'attention | **neutre** micro-kiki (Qwen3.6 = Gated DeltaNet hybride) ; état fixe lossy = analogue du goulot VQ (nerve-wml) |
| ARC Prize, *HRM analysis* (15/08/2025) + Jolicoeur-Martineau **TRM** 2510.04871 + Ren & Liu, mécanistique 2601.10679 + PTRM 2605.19943 + Deliege & Van Droogenbroeck 2610.13660 (BNAIC 2026) [NOUVEAU] | 2025-08 → 2026-10 | HRM semi-privé : 32 % ARC-1, 2 % ARC-2 ; **hiérarchie H/L ≈ 0 effet** (transformer même taille à ~5 pts), **boucle externe** = moteur (+13 pts 1→2 boucles) ; l'essentiel vient du TTT sur les tâches d'éval ; HRM échoue sur des puzzles à 1 inconnue (violation du point fixe) ; budgets pré-entraînement/TTT confondent les comparaisons d'architectures | **appuie** le verdict « tied » du GTM ; **contredit** l'intuition « deux horloges = gain » ; impose un comparateur à boucle externe pour N10-C/N11 (nerve-wml) |
| Liquid AI **LFM2.5** (HF `LiquidAI/LFM2.5-{230M,350M,1.2B,2.6B}`, licence LFM Open v1.0 ; 2.6B : 22 blocs conv courte à double porte + 8 GQA, 131k ctx, 34T tokens) [NOUVEAU] | 2026-01 → 08 | Recherche d'architecture hardware-in-the-loop : quelques GQA + convolutions courtes battent attention linéaire/SSM à budget edge | **positionne** baby-brain : LFM2.5-230M ≈ échelle 252M du WML SP5 → substrat de contrôle non-transformer |
| Gladstone et al., **EBT** 2507.02092, ICLR 2026 ; NRGPT 2512.16762 [NOUVEAU] | 2025-07 / 2025-12 | Pensée « système 2 » = descente de gradient sur une énergie ; taux de scaling +35 % mais 3,3-6,6× plus de FLOPs ; ≤ 800M params | **positionne** kiki-flow (inférence = flot de gradient) ; `restructure` comme minimisation d'énergie |
| VERSES **AXIOM** 2505.24784 ; dépôt `VersesTech/axiom` (80★, NOASSERTION, dernier push 2025-06) [NOUVEAU] | 2025-05 | Modèle du monde objet-centrique bayésien, sans gradient ; Gameworld 10k : 77 vs 48 (DreamerV3), 39× moins de GPU-temps (chiffres VERSES ; aucun bench 2026 trouvé) | **appuie** « sortir du LLM » pour baby-brain (apprenant développemental non-LLM) ; licence à vérifier avant réutilisation |
| Forward-Forward 2026 : CAG 2605.04346 (ImageNet-100 83,98 %, écart BP 3,6 %, VGG-16) ; Hyperspherical FF 2605.00082 (>25 % top-1 ImageNet-1k) ; free-riding 2605.06240 [NOUVEAU] | 2026-04 → 07 | FF reste derrière BP à l'échelle ImageNet, écart qui se referme ; artefact de « goodness cumulative » documenté | **neutre** ; candidat substrat local pour C2 |
| Codage prédictif : μPC 2505.13124 ; **PC-ALM** 2605.31022 (Sakana, 1 000 couches, ≤2 pts de BP sur MNIST, `SakanaAI/pc-alm` 243★ MIT) ; Error Highways 2606.22744 ; **ePC+bPC 4 bits** 2610.15933 ; **DeltaNet-PC** 2610.15185 (mémoire de test-time sans BPTT, rappel parfait) ; PotentialEP 2610.14409 (génératif CIFAR sans BP, relaxation analogique) [NOUVEAU] | 2025-05 → 2026-10 | Le PC passe en profondeur et en basse précision ; un PC natif peut tenir une mémoire de séquence | **appuie** nerve-wml `BioFieldWML` (SNN-PC Lee 2024 [veille]) ; **dépasse** : un substrat PC complet, conforme C+, est faisable sur M1 (voir T10) |
| HDC/VSA : `torchhd` 390★ MIT ; QHDC Cumbo & Blankenberg, *npj Unconv. Comput.* 2026 (Phys.org 16/06/2026 : « 500× » sans baseline nommée) ; Capacity Analysis of VSA 2301.10352 [NOUVEAU] | 2026 | Codes haute dimension à capacité **analytique** ; QHDC = affirmation non étayée publiquement | **dépasse** nerve-wml sur un point : les transducteurs par arête pourraient être des opérateurs VSA (permutation/binding) à capacité calculable, au lieu d'un MI/H mesuré |
| Réservoirs : ParalESN 2601.22296 ; KARC 2606.19984 ; RC-inspired MatMul-free LM 2512.23145 ; `reservoirpy` 662★, `conn2res` 127★ (connectomes comme réservoirs) [NOUVEAU] | 2025-12 → 2026-06 | Réservoirs parallélisables à grande dimension ; réservoirs dans un LM | **neutre** ; outil pour la strate 5 (criticité) et pour l'hypothèse « connectome comme topologie » |
| Mémoire associative dense : Kafraj, Krotov & Latham (ICLR 2026, DAM bio-plausible à capacité exponentielle) ; « Dynamical properties of DAM » (ICLR 2026) ; paysage d'énergie libre 2607.19195 ; DMFT Hopfield + plasticité 2605.22254 ; **Vivet & Arenas** 2604.25481 (gains astrocytaires → softmax = attention émergente, Lyapunov global) [NOUVEAU] | 2026 | Capacité, bassins et temps de convergence des DAM deviennent calculables | **appuie** dream-of-kiki : `downscale` ≡ schéma de température dans un paysage d'énergie ; **dépasse** : capacité analytique vs mesurée |
| LLM à impulsions : SpikingBrain (TMLR 2026-03, 7B/76B) + **SpikingBrain2.0** 2604.22575 (5B, INT8-spiking −0,69 %) ; **Saunders et al., lois d'échelle compute-optimales** 2610.15146 (exposant 0,56 ≈ 0,50 dense ; coût « spiking » 0,34→0,23 nats décroissant) ; **TTFS 1,5B** 2609.05151 (une impulsion/neurone, écart PPL) ; Spora 2610.10933 (GLUE 78,2 à 6 pas) ; **URCHIN** 2609.13899 (4,23M params, 128 neurones E/I, BabyLM) ; **OpenArchEvo** 2609.40258 (évolution guidée par LLM d'archis SNN natives, NeuroGate > DeltaNet sur WikiText-103, 132 V100-jours) [NOUVEAU] | 2026-03 → 10 | Le spiking ne change pas le compromis paramètres/données ; le surcoût se résorbe avec le calcul ; aucune mesure d'énergie réelle | **appuie** BSK (il existe un protocole d'évaluation honnête : écart en nats à FLOPs égaux) ; **contredit** toute promesse d'efficacité non mesurée ; URCHIN = voisin direct de baby-brain (BabyLM) |
| Meta **Muse Wonder** + **MemoryBench** (TechCrunch 12/10/2026) ; Hassabis (02/2026) : « les systèmes sont gelés après entraînement » ; TRC² 2602.22479 (colonnes corticales routées thalamiquement) [NOUVEAU] | 2026-02 → 10 | « Mémoire active » auto-évaluée (pas de scores publics, pas de tiers) ; aucune annonce « IA qui apprend en continu » d'OpenAI/Anthropic/DeepMind trouvée pour oct. 2026 | **positionne** : le marché mesure la consolidation ; Hypneum a une suite de conformité exécutable que MemoryBench n'a pas |

### 1b. Informatique quantique pour l'apprentissage (2026)

| Réf | Date | Résultat vérifié | Relation → dépôt |
|---|---|---|---|
| IBM + Algorithmiq / U. Chicago, « quantum advantage » (newsroom IBM 30/07/2026) [NOUVEAU] | 2026-07-30 | Simulation de matière quantique hétérogène sur Heron ; validation par injection de bruit et multi-devices ; **aucune tâche d'apprentissage** ; réplique classique en 37,3 min sur 256 H100 (Technology.org 07/09, 2nd) | **neutre** ; aucun levier pour micro-kiki-quantum |
| Nair & Ferrie, *Local tensor-train surrogates for QML models* 2604.25631 [NOUVEAU] | 2026-04-28 | L'inférence d'un modèle QML entraîné est remplaçable localement par un substitut classique à erreur contrôlée (constantes exponentielles dans le pire cas) | **appuie** l'archivage (dequantization pratique) |
| Baumann, Stein & Linnhoff-Popien, **memory ceiling of noisy quantum reservoirs** 2610.26228 [NOUVEAU] | 2026-10-19 | Temps de mémoire ≤ exp[Θ(k)] avec k qubits frais/pas ; **indépendant de la taille** ; borne atteinte | **dépasse** : théorème transposable (voir H11, C1) ; tue l'idée « plus gros réservoir quantique = plus de mémoire » |
| Nguyen & Soh, QFI-aware QRC 2610.14454 [NOUVEAU] | 2026-10-10 | Réservoir Jaynes-Cummings 1-3 atomes vs ESN réglé : −25 à −69 % d'erreur Mackey-Glass à 4-30 poids (simulation implicite, 1 tâche) | **neutre** (jouet) |
| Cao, Xia & Li, *edge-of-chaos advantage in QRC* 2610.05213 [NOUVEAU] | 2026-10-04 | Chaotique = perte de mémoire exponentielle ; intégrable = pas de non-linéarité ; l'avantage est au bord du chaos | **appuie** strate 5 (criticité) de nerve-wml — argument indépendant du substrat |
| Atallah & Herrman, QUBO layer-wise CNN 2603.02958 [NOUVEAU] | 2026-03-03 | Tête FC entraînée par QUBO ; **tout en recuit simulé** ; 15 bits « tiendrait » sur D-Wave Advantage | **contredit** l'utilité du recuit pour l'entraînement en 2026 |
| D-Wave Qubits 2026 (BusinessWire 27/01/2026) : solveur hybride + ML surrogate, toolkit RBM PyTorch (sans chiffres) [NOUVEAU] | 2026-01 | Usage Advantage2 +314 % ; aucun bench RBM publié | **neutre** |
| QPEFT/QMoE : aucun suivi 2026 trouvé à Quantum-PEFT 2503.05431 ; Faryad « input problem » [veille] | — | Le chargement des données annule l'avantage | **appuie** ARCHIVED.md |
| QHDC npj 2026 (cf. 1a) | 2026-06 | « 500× » sans baseline ni matériel nommés | **contredit** rien, mais à ne pas citer comme résultat |

### 1c. Neurosciences 2025-2026 pertinentes

| Réf | Date | Résultat vérifié | Relation → dépôt |
|---|---|---|---|
| von Hünerbein … Senn, Petrovici, **Dendritic structure enables powerful plasticity** 2608.23251 (revue, q-bio.NC) [NOUVEAU] | 2026-08-24 | Compartiments = accès local à des signaux d'erreur plus spécifiques et rapides que la neuromodulation globale → apprentissage profond local en temps réel | **appuie** BioFieldWML / stratification (dream-of-kiki) ; propose un mécanisme concret pour C2 sur substrat SNN |
| DendriCL 2607.02283 ; « neurone humain = réseau profond » (presse 07/2026, 2nd) ; Beniaguev 2021 (lignée) [NOUVEAU] | 2026 | Un compartiment suffit pour l'apprentissage en contexte dans une couche à impulsions (non revu) | **neutre/positionne** nerve-wml LifWML |
| Vedovati, Monosov, Papouin & Ching, **neural-astrocyte hybrid automaton** 2609.16217 [NOUVEAU] | 2026-09-14 | Les astrocytes accumulent l'évidence d'un changement de contexte ; bifurcations induites par la récompense ; « collant » réglé par l'entropie de l'environnement | **dépasse** GENIAL : fournit un contrôleur du **quand** consolider (GENIAL n'a qu'un cron I1 horaire) |
| Kozachkov et al. PNAS 2023 (transformers neurones-astrocytes) ; MIT PNAS 2025 (capacité DAM astrocytaire linéaire) ; **RMAAT** 2601.00426 ICLR 2026 ; Vivet & Arenas 2604.25481 [NOUVEAU] | 2023 → 2026 | Astrocytes = mémoire + porte d'attention ; modélisation, pas de confirmation in vivo | **appuie** l'idée d'une couche lente (θ) gérant la mémoire — à côté du GTM |
| Neuromodulation : revue 3-facteurs (TMLR / Patterns 2025) ; DA-SSDP 2512.07194 ; bioRxiv 13/10/2026 porte RPE ≈ 0,97 = **quasi inerte** (2nd) [NOUVEAU] | 2025-12 → 2026-10 | Le troisième facteur n'aide que si corrélé à la perte | **contredit** faiblement `plasticity_schedule` du GTM (v1.4.0) si la porte est peu informative ; rapporter la corrélation porte/perte |
| Connectomique : FlyWire LIF (Nature 2024) ; Loihi 2 ×12 puces 2508.16792 ; **FlyGM** 2602.17997 (connectome = contrôleur RL d'une mouche biomécanique) ; MaleCNS Cell 09/2026 (2nd, non vérifié) ; Eon Systems 03/2026 (2nd) [NOUVEAU] | 2024 → 2026 | Le connectome sert de prior topologique exploitable ; H01 : aucune mise à jour 2026 trouvée | **positionne** nerve-wml : topologie sparse apprise vs topologie connectomique (H12) |
| Brain-Score : changelog 2026 (jeux de benchmarks 01/03/06/08/09/**05-10**) ; « Only Brains Align with Brains » 2604.21780 ; « Prediction scores are not enough » 2605.14025 [NOUVEAU] | 2026 | Les modèles normatifs n'alignent pas entre régions comme les cerveaux ; les scores de prédiction ne suffisent pas | **contredit** la forme forte de PRH ; **appuie** la reformulation DR-3 « structure relationnelle, niveau protocole » [veille] |
| Codage prédictif (cf. 1a) ; Ruffini 2026, Kim-Battaglia 2026 [veille] | — | — | **appuie** GTM |

### 1d. Wetware / bio-calcul

| Réf | Date | Résultat vérifié | Relation → dépôt |
|---|---|---|---|
| **Cortical Labs CL1** : 35 k$/unité (20 k$ en rack de 30) ; Cortical Cloud : 120 unités à Melbourne, API Python + Jupyter, paiement CB (The Daily Perspective 14/03/2026) ; tarif cloud non publié (300 $/sem. selon IEEE Spectrum 2025 ; ~2 170 $/mois selon une autre source — **conflit**) ; `Cortical-Labs/cl-api-doc` 358★, `cl-sdk` 167★ [NOUVEAU] | 2025-03 → 2026-03 | Plateforme accessible ; aucun résultat 2026 revu par les pairs trouvé ; `4R7I5T/CL1_LLM_Encoder` (243★) : non affilié, aucun résultat visible, pas de licence — **ne pas citer** | **positionne** nerve-wml : un `BioCultureClient` existe déjà dans `track_w/` |
| **FinalSpark Neuroplatform** : 2 plans (4 organoïdes partagés / dédiés, « contact for pricing » ; 500-1 000 $/mois selon sources 2nd) ; 30 To de données gratuites ; `FinalSpark-np/LiveMEA` 18★ [NOUVEAU] | 2026 | Accès distant, MEA 8 électrodes basse densité, durée de vie ~100 j | **accessible** pour un pilote à ~1-2 k€ |
| Liu, Philamore & Ward-Cherrier, **Braille avec organoïdes**, *Frontiers in AI* 16/10/2026 [NOUVEAU] | 2026-10-16 | 26 lettres ; 1 organoïde 57-61 %, 3 organoïdes (24 canaux) 83 % ; **SVM direct sans organoïde 82 %** (propre) ; gain seulement sous bruit (83 vs 55 % gaussien) ; **boucle ouverte, aucun apprentissage de l'organoïde** ; confusion dimension 8/24/32 | **contredit** l'« intelligence » des organoïdes ; **appuie** une lecture « réservoir biologique » (Claim B possible, Claim A non) |
| Nadimi et al., **organoïdes corticaux HD-MEA** 2607.28068 [NOUVEAU] | 2026-07-30 | Réponse évoquée = burst quasi synchrone **sans propagation** (pente latence/distance = 0) ; métriques de propagation inapplicables ; **dépression par stimulation répétée** : 93 % de l'array engagé à la 1re séance vs ~10 % après 5 séances | **contredit** tout protocole « entraîner un organoïde par stimulation quotidienne » ; dicte un contrôle naïf de stimulation |
| Schottlender et al., **Synthetic Biological Intelligence** 2604.27933 (TU Dresden) [NOUVEAU] | 2026-04-30 | Abstractions système ; protocole unifié encodage/décodage/benchmark proposé ; le goulot = absence de plateformes standard | **positionne** nerve-wml comme « couche protocole » applicable au bio-digital |
| DishBrain (Kagan 2022, lignée) ; OI (Harvard Sci. Rev. 02/2026) ; ADN : Cherry & Qian Nature 2025 (classifieur 100 bits appris in vitro) [NOUVEAU] | 2022 → 2026 | Rien de 2026 en apprentissage in vitro au-delà de 2025 | **neutre** |

### 1e. Calcul thermodynamique / probabiliste / analogique / photonique

| Réf | Date | Résultat vérifié | Relation → dépôt |
|---|---|---|---|
| Extropic : *npj Unconv. Comput.* 2026 avec I. Chuang (denoising thermodynamic model) ; « 10 000× » = **projection** sur Fashion-MNIST binarisé ; LOI CHIPS ≤ 75 M$ (2nd) ; aucun client ni perf publiés [NOUVEAU] | 2026 | Modèles + mesures de puce p-bit, pas de système | **neutre** ; ne pas citer comme résultat |
| Normal Computing : CN101 (06/2025), CN201 attendu 2026 ; aucune mesure publiée [NOUVEAU] | 2025-06 → | Feuille de route | **neutre** |
| Aadit … Camsari, **1 000 000 p-bits** 2606.25313 [NOUVEAU] | 2026-06-24 | Réseau de FPGA ; Gibbs > 10^12 flips/s ; seuil η = f_comm/f_pbit ; spin glasses, Max-Cut, SAT ; pas d'énergie rapportée | **appuie** `recombine` comme échantillonnage (canal 2 `LatentSample`) — substrat « Ising » candidat |
| Fang et al., **continuous-state probabilistic computer** 2610.31339 [NOUVEAU] | 2026-10-22 | Prototype FPGA ; factorisation 7 bits (33 000× vs QUBO logiciel) ; rappel MNIST 100 % | **neutre/positionne** |
| Polymer p-bits (Adv. Phys. Res. 2026) [NOUVEAU] | 2026 | Première matière molle à p-bits | neutre |
| Photonique : Meyer et al., *Nat. Commun.* 09/04/2026 (crossbar 9×3, MNIST 98,1 %, CIFAR-10 72,0 %) ; **Zhang et al., APNN à criticité dissipative** 2609.34171 (95,2 % avec 100 exemples/44 paramètres, −30 dB SNR, mémoire associative) ; meshes photoniques param-efficient 2610.26429 (non vérifié) [NOUVEAU] | 2026-04 → 10 | La **criticité** est présentée comme mécanisme unifié : séparabilité, mémoire temporelle, tolérance au bruit | **appuie** strate 5 nerve-wml, indépendamment du substrat (photonique, quantique, SNN) |
| PotentialEP 2610.14409 (cf. 1a) | 2026-10-10 | Génération = relaxation physique, entraînement sans BP | **appuie** substrat analogique conforme DR-3 |

---

## 2. Verdicts honnêtes

**(a) Post-transformer.** Le paradigme dominant 2026 n'est pas « un remplaçant du transformer » mais **l'écriture en poids rapides pendant l'inférence** (Titans/Hope/TTT/World-T3), greffée sur n'importe quel backbone. Pour Hypneum : (i) DR-0 doit être reformulé en **budget** (un DE = une quantité bornée d'écriture, pas un créneau hors-ligne), sinon GENIAL est contredit par construction ; (ii) la hiérarchie bi-fréquence doit être vendue comme **protocole de communication**, pas comme gain de performance — HRM/ARC l'a tué comme argument de perf ; (iii) les règles locales (PC-ALM, ePC+bPC, DeltaNet-PC) rendent un **substrat PC conforme C+** réaliste à court terme — c'est la sortie du LLM la moins coûteuse.

**(b) Quantique : NON utile en 2026**, et la raison est devenue plus solide qu'en août (veille) : surrogate classique de l'inférence QML (04/2026), borne de mémoire des réservoirs par les qubits frais (10/2026), entraînement par recuit toujours simulé (03/2026), « avantage » IBM hors apprentissage. Garder `micro-kiki-quantum` archivé ; ajouter ces trois références dans ARCHIVED.md. Seul usage défendable : un **test de conformité DR-3 « à la limite »** sur simulateur (gratuit) — pas de QPU (IonQ via Braket : ordre de 0,30 $/tâche + 0,03 $/tir sur liste 2025, à revérifier ; un sondage sérieux ≈ 300-3 000 $ pour zéro information scientifique nouvelle).

**(c) Neurosciences.** Deux apports exploitables : **dendrites = crédit local** (justifie C2 sur SNN) et **astrocytes = accumulateur lent de contexte** (justifie un contrôleur de déclenchement des DE). Un apport négatif : les portes neuromodulatrices peu corrélées à la perte sont inertes → rapporter cette corrélation pour `plasticity_schedule`. Brain-Score 2026 confirme : revendiquer l'agnosticisme au niveau **protocole**, jamais représentation.

**(d) Wetware : accessible (FinalSpark ~1-2 k€/mois estimé, CL1 cloud tarif non publié), mais non-apprenant à l'échelle des protocoles publiés.** L'organoïde est aujourd'hui un **réservoir fixe à réponse décroissante**. Pour Hypneum c'est précisément intéressant : c'est le substrat le plus hostile possible pour Claim A (compétence) tout en restant un candidat pour Claim B (alignement des codes post-VQ). Coût d'un pilote : 1 mois d'abonnement + 2 semaines d'ingénierie sur `track_w/spiking_kiki_bio_client.py`.

**(e) Thermodynamique/photonique.** Résultats matériels réels = FPGA p-bits et puces photoniques de laboratoire ; les promesses commerciales (Extropic, Normal) sont des projections. Levier Hypneum : `recombine` est formellement un échantillonnage de Gibbs ; un substrat « Ising simulé » conforme C+ coûte une journée de 4090 et donnerait une 4e famille de substrat (après MLX, LIF, Transformer, BioField) entièrement hors paradigme LLM. La **criticité** apparaît dans trois substrats indépendants (photonique, quantique, SNN) : la strate 5 mérite une sonde de conformité.

---

## 3. Dépôts GitHub (étoiles/push vérifiés via `gh` le 24/10/2026)

| Dépôt | ★ | Dernier push | Licence | Réutilisation Hypneum |
|---|---|---|---|---|
| `sapientinc/HRM` | 12 660 | 2026-10 | Apache-2.0 | Référence ; `arcprize/hierarchical-reasoning-model-analysis` 178★ Apache-2.0 = protocole d'ablation à copier pour N10-C |
| `state-spaces/mamba` | 18 952 | 2026-07-22 | Apache-2.0 | Mamba-3 ; port MLX : `VikramLex/mamba3-minimal` 110★ Apache-2.0, `kroggen/mamba.c` 203★ |
| `lucidrains/titans-pytorch` | 1 995 | 2026-07-13 | MIT | TitansWML (H1) ; port MLX `Aedelon/titans-pytorch-mlx` 32★ Apache-2.0 |
| `test-time-training/e2e` | 714 | 2026-02-15 | aucune déclarée | JAX ; `ttt-video-dit` 2 452★ MIT ; `a1600012888/LaCT` 533★ MIT ; `ekinakyurek/marc` 356★ MIT (TTT ARC) |
| `alexiglad/EBT` | 662 | 2026-04-21 | Apache-2.0 | Énergie ↔ kiki-flow ; `Lemon-cmd/energy-transformer-graph` 27★ MIT |
| `VersesTech/axiom` | 80 | 2025-06-02 | **NOASSERTION** | Apprenant non-LLM pour baby-brain ; licence à clarifier avant fork |
| `infer-actively/pymdp` | 746 | 2026-10-23 | MIT | Active inference POMDP (contrôleur « quand rêver », H7) |
| `SakanaAI/pc-alm` | 243 | 2026-09-08 | MIT | Substrat PC profond (T10) ; `thebuckleylab/jpc` 97★ MIT (JAX, M1) ; `coxlab/prednet` 806★ MIT |
| `loeweX/Forward-Forward` | 170 | 2026-09-23 | MIT | Substrat FF (faible priorité) |
| `hyperdimensional-computing/torchhd` | 390 | 2026-10-13 | MIT | Transducteurs VSA (H3) ; `cumbof/hdlib` 44★ MIT ; `roandejager/Hillock` 144★ AGPL-3.0 (éviter, AGPL) |
| `reservoirpy/reservoirpy` | 662 | 2026-10-20 | MIT | Sweep de criticité (H9) ; `netneurolab/conn2res` 127★ BSD-3 (connectome→réservoir, H12) ; `quantinfo/ng-rc-paper-code` 193★ MIT |
| `ml-jku/hopfield-layers` | 1 968 | 2026-10-23 | autre | Couches Hopfield modernes (C3) |
| `BICLab/SpikingBrain-7B` / `SpikingBrain2.0` | 1 426 / 65 | 2026-10 | MIT | Comparateur BSK ; pipeline INT8-spiking |
| `fangwei123456/spikingjelly` / `jeshraghian/snntorch` | 2 170 / 2 078 | 2026-10 | Apache-2.0 / MIT | LIF à compartiments (H8) ; `TheBrainLab/Spikingformer` 153★ Apache-2.0 (AAAI 2026) |
| `neuromorphs/NIR` | 188 | 2026-10-16 | BSD-3 | Toujours sans protocole inter-modules → positionnement nerve-wml tient [veille] |
| `mlech26l/ncps` | 2 358 | 2026-10-23 | Apache-2.0 | LTC/CfC (liquid) comme substrat continu |
| `Cortical-Labs/cl-api-doc` / `cl-sdk` | 358 / 167 | 2026-10 | — / autre | Simulateur CL API gratuit → prototyper un `CL1WML` sans matériel |
| `FinalSpark-np/LiveMEA` | 18 | 2026-08-11 | Unlicense | Lecture du flux MEA public (gratuit) |
| `Optima-CityU/OpenArchEvo` | (non vérifié) | 2026-10 | ? | Évolution d'architectures SNN (C9) |

---

## 4. Ressources Hugging Face (API `/api/models`, `/api/papers`, 24/10/2026)

- **Mamba-3 officiels** : `state-spaces/mamba3-siso-187m`, `mamba3-mimo-187m`, `mamba3-siso-1.5b` (Apache-2.0, 2026-07-28, ~900-1 200 téléchargements) ; `arianraje/qwen3-4b-mamba3-hybrid-stage2b-kd-bias0` (21 k dl, distillation Qwen3→Mamba-3, non vérifié).
- **Liquid LFM2.5** : `LiquidAI/LFM2.5-2.6B-GGUF` 627 k dl, `-230M-Base` 149 k dl, `-1.2B-Instruct`, `-24B-A2B`, `-Audio-1.5B` ; licence LFM Open v1.0 (`license:other`) — vérifier la clause recherche avant usage dans baby-brain.
- **Spiking** : `electron-rare/spikingkiki-27b` (base Qwen3.5-32B, LIF dans des couches choisies, 2026-05-11, 122 dl, « not benchmarked end-to-end ») et `spikingkiki-122b-a10b` (base Qwen3.5-MoE-A10B) — **artefacts BSK du lab** ; ⚠ les quantifications tierces `mradermacher/spikingkiki-*-GGUF` (1 623 dl) ignorent presque sûrement `lif_metadata.json` → ce qui circule n'est plus un modèle à impulsions ; `maujim/spikingbrain-v1-7b-base` (miroir), `hamingsi/SpikingLM` (ICML 2026, fill-mask).
- **Titans** : `ffurfaro/Titans-OLMo-1B-hf` (Apache-2.0, 2025-09) ; `win10/Lfm2-MaleCNS-Titans-VL-3B` (hybride non documenté, 147 dl — curiosité, non vérifié).
- **Hopfield / HDC / énergie / quantique : quasi rien sur HF** (0-3 modèles anecdotiques) → HF reste LLM-centrique ; « sortir du LLM » implique de publier les substrats sur Zenodo/GitHub, pas sur HF.
- **Papers HF utiles** (avec abstract) : 2606.03979 *LMs Need Sleep* [veille] ; 2602.22479 TRC² ; 2605.07076 SCoL ; 2608.01672 TTCD ; 2610.11287 REMORY ; 2609.20800 **JEPA-Anything** (factorisation prédictive orthogonale, « monde-agnostique » — voisin de la polymorphie nerve-wml) ; 2610.00722 JEPA-TTT (bras N11-A) ; 2610.14409 PotentialEP ; 2605.31022 PC-ALM.

---

## 5. Actualités septembre-octobre 2026 (dates vérifiées sur arXiv/éditeur, sauf mention 2nd)

| Date | Fait | Pour Hypneum |
|---|---|---|
| 2026-10-22 | Lois d'échelle spiking v2 (2610.15146) ; ordinateur probabiliste à états continus FPGA (2610.31339) | Protocole d'éval BSK ; substrat Ising |
| 2026-10-19 | Plafond de mémoire des réservoirs quantiques bruités (2610.26228) | Théorème transposable (C1) |
| 2026-10-16 | Braille sur organoïdes FinalSpark, *Frontiers in AI* | Wetware = réservoir, pas apprenant |
| 2026-10-13 | Titan-Llama (2610.19210) ; bioRxiv porte RPE quasi inerte (2nd) | Mémoire externe ; prudence neuromodulation |
| 2026-10-12 | Meta Muse Wonder + MemoryBench (TechCrunch) ; World-T3 | Le marché benchmarke la mémoire continue |
| 2026-10-11/10 | ePC+bPC 4 bits ; DeltaNet-PC ; PotentialEP ; QFI-QRC | Substrat PC conforme faisable |
| 2026-10-09 | Budgets pré-entraînement/TTT pour ARC (2610.13660) | Comparer à budget égal (N10/N11) |
| 2026-10-07 | Spora (2610.10933) | Encodage spike co-conçu |
| 2026-10-05 | Brain-Score : nouveau jeu de benchmarks (changelog) | DR-3 niveau protocole |
| 2026-10-04 | Théorie bord-du-chaos QRC (2610.05213) | Strate 5 |
| 2026-09-30 | OpenArchEvo (2609.40258) ; JEPA-TTT | Évolution de substrats ; bras N11-A |
| 2026-09-28 | APNN photonique à criticité (2609.34171) | Strate 5, substrat photonique |
| 2026-09-27 | VisionHOPE (2609.33325) | Comparateur N10-A |
| 2026-09-14 | Automate hybride neurones-astrocytes (2609.16217) | Contrôleur « quand rêver » |
| 2026-09-12 | URCHIN, LM spiking 4,2M sur BabyLM (2609.13899) | Voisin baby-brain ; BabyLM 2026 du 24 au 29/10 [veille] |
| 2026-09-07 | Réplique classique de l'« avantage » IBM en 37,3 min / 256 H100 (Technology.org, 2nd) | Quantique : rien pour l'apprentissage |
| 2026-09-04 | LLM TTFS 1,5B « au plus une impulsion par neurone » (2609.05151) | Cible BSK |
| 2026-09-03 | MaleCNS, *Cell* (liste GitHub, 2nd, non vérifié) | Prior topologique |
| 2026-09 | Page Sakana PC-ALM (arXiv 05/2026) | Substrat PC 1 000 couches |
| 2026-10-27 | Krotov, Édimbourg : « DAM : physical systems for novel AI architectures » (à venir) | Veille à suivre |

Non trouvé malgré recherche ciblée : une annonce « IA qui apprend en continu » d'un grand labo en octobre 2026 (seuls Meta/MemoryBench et WPP-NVIDIA « continuous learning » marketing) ; H01 2026 ; résultats Cortical Labs 2026 revus par les pairs ; QPEFT/QMoE 2026.

---

## 6. Tests critiques réalisables (Mac M1 32 Go / RTX 4090 / services) — coûts estimés

| # | Test | Matériel | Durée | Coût | Débloque |
|---|---|---|---|---|---|
| T1 | **TitansWML / TTT-layer comme substrat** : implémenter `TitansWML` (port MLX `Aedelon/titans-pytorch-mlx`) sous le WML Protocol, passer `dream-harness conformance` C1-C3 ; chunker les mises à jour en DE à budget B | M1 | 3-4 j | 0 € | H1 ; preuve que DR-3 couvre le paradigme « mémoire continue » |
| T2 | **Comparateur HRM-lesson pour N10-C** : baseline non hiérarchique + boucle externe de raffinement + TTT, à budget égal (protocole `arcprize/…-analysis`) | 4090 | ~20 GPU-h | 0 € (possédé) | H2 ; amendement OSF N10-C [veille] |
| T3 | **Transducteurs VSA** (torchhd) à la place des transducteurs appris ; prédiction de capacité analytique vs MI/H mesuré | CPU M1 | 1-2 j | 0 € | H3 |
| T4 | **Organoïde comme WML** : FinalSpark 4 organoïdes partagés, 1 mois ; codes = vecteurs de comptes de spikes → VQ → MI/H vs MLP ; contrôle naïf de stimulation (2607.28068) | Service | 6 sem. | ~1-2 k€ (tarif sur devis ; 500-1 000 $/mois 2nd) — alternative CL1 cloud : tarif non publié (300 $/sem. 2nd) | H4 ; Claim B à la limite |
| T5 | **Lois d'échelle BSK** : IsoFLOP SpikeGPT-RWKV 3·10^17-10^18 FLOPs, FineWeb-Edu, 5 tailles × 3 budgets × 3 graines ; même protocole que 2610.15146 ; puis SpikingKiKi-27B converti vs from-scratch à FLOPs égaux | 4090 | 3-4 j GPU (≈1 h par run à 10^17) | 0 € | H5, H15 ; premier chiffre honnête pour BSK |
| T6 | **`recombine` = Gibbs sur Ising simulé** (p-bits émulés, 10^5 spins) ; canal 2 `LatentSample` ; conformité DR-0/DR-2' | 4090 | 1-2 j | 0 € | H6 ; substrat « physique » hors LLM |
| T7 | **Quantique** : (a) QHDC vs torchhd sur simulateur (PennyLane/Aer, gratuits) ; (b) **pas de QPU** (IonQ Braket ≈ 0,30 $/tâche + 0,03 $/tir, liste 2025 à revérifier → 300-3 000 $ pour un sondage sans valeur scientifique) | M1 | 1 j | 0 € | H10 ; justifie ARCHIVED.md |
| T8 | **Sweep de criticité** sur réservoirs (reservoirpy) : MI/H nerve-wml vs exposant de Lyapunov | CPU | 1 j | 0 € | H9 ; strate 5 testable [veille piste 9] |
| T9 | **Topologie connectomique** (conn2res + sous-graphe FlyWire) vs sparse aléatoire pour la topologie nerve-wml | CPU | 2 j | 0 € | H12 |
| T10 | **Substrat PC conforme** (`jpc` JAX ou `pc-alm`) : replay = relaxation clampée sur β, downscale = échelle de précision globale ; conformité C+ ; FlowProxyTask | M1 | 3-5 j | 0 € | H13 ; 5e famille de substrat |
| T11 | **Curriculum ontogénétique sur AXIOM** (JAX, 4090) : stades ordonnés vs mélangés, Gameworld-like | 4090 | 2 j | 0 € (licence à vérifier) | H16 ; bras chronologique [veille piste 6] sans LLM |
| T12 | **Contrôleur astrocytaire du « quand rêver »** (pymdp ou accumulateur d'évidence) vs cron I1 | M1 | 2 j | 0 € | H7 |

Toutes : ≥ 5 graines, préenregistrement OSF avant exécution, pas de verdict de supériorité à 5 graines (cadrage estimation/pilote, cf. amendements du 23/10).

---

## 7. Brainstorm — 16 hypothèses falsifiables (majorité hors paradigme LLM)

Format : énoncé · prédiction quantitative · test · critère de réfutation · référence d'appui. **[PRÊT]** = préenregistrable tel quel ; **[SPÉC]** = spéculatif, test défini.

**H1 [PRÊT] — Un module à poids rapides (Titans/TTT) est un substrat GENIAL conforme si et seulement si ses écritures sont chunkées en épisodes à budget.** Prédiction : à FLOPs égaux sur un flux à 2 tâches (FlowProxy→HardFlowProxy), la version « DE à budget B » retient autant que la version continue (écart ≤ 1 pt, TOST). Test : T1. Réfutation : la version continue bat la version bornée de > 3 pts de rétention dans ≥ 4/5 graines. Réf : Hope/CMS (NeurIPS 2025), SCoL 2605.07076, Zhang et al. [veille].

**H2 [PRÊT] — Le GTM ne bat pas un comparateur non hiérarchique à boucle externe de raffinement (leçon HRM).** Prédiction : |Δ précision| < 0,02 sur N10-C à budget égal. Réfutation : GTM > comparateur de > 0,05 dans ≥ 4/5 graines (ce serait une bonne nouvelle). Réf : ARC Prize 15/08/2025, 2610.13660.

**H3 [PRÊT] — Des transducteurs VSA (permutation+binding, non appris) atteignent le MI/H des transducteurs appris et leur capacité est prédite analytiquement.** Prédiction : MI/H post-VQ ≥ 0,88 (vs 0,93 appris) à alphabet 64, K = 7 ; erreur de prédiction de capacité < 10 %. Réfutation : MI/H < 0,78 ou erreur > 25 %. Réf : 2301.10352, torchhd.

**H4 [PRÊT] — Un organoïde satisfait Claim B (alignement des codes) mais pas Claim A (compétence).** Prédiction : MI/H(codes organoïde ; codes MLP) > 0,30 au-dessus du nul par permutation (p < 0,01) après VQ ; précision tâche par le seul organoïde < baseline SVM directe. Réfutation : MI/H ≤ nul + 0,05 sur 3 organoïdes. Sous-prédiction : la dépression par stimulation répétée réduit MI/H de > 30 % en 5 séances. Réf : Frontiers 16/10/2026, 2607.28068.

**H5 [PRÊT] — Le coût « spiking » de SpikingKiKi (conversion LIF) est ≥ celui d'un modèle à impulsions entraîné de zéro à FLOPs égaux.** Prédiction : écart ≥ 0,30 nats à 10^18 FLOPs pour la conversion vs 0,23-0,34 nats from-scratch. Réfutation : conversion < 0,15 nats. Réf : 2610.15146.

**H6 [PRÊT] — `recombine` implémenté comme échantillonnage de Gibbs sur Ising (p-bits émulés) produit une recombinaison inter-domaines utile.** Prédiction : transfert inter-domaines +Δ ≥ 0,02 vs nul intra-domaine (réouverture DR-4, cf. Zahn [veille]). Réfutation : Δ ≤ 0 dans ≥ 4/5 graines. Réf : 2606.25313, 2607.16256.

**H7 [SPÉC] — Un déclencheur de DE par accumulation d'évidence (astrocyte-like) consomme moins d'épisodes qu'un cron à rétention égale.** Prédiction : −20 % de DE à rétention égale (±1 pt). Réfutation : réduction < 10 % dans ≥ 4/5 graines. Réf : 2609.16217.

**H8 [PRÊT] — Un LIF à deux compartiments (erreur locale apicale) augmente le MI/H de LifWML.** Prédiction : +0,05 à d = 16 (n = 50, nul d'initialisation). Réfutation : CI95 incluant 0. Réf : 2608.23251.

**H9 [PRÊT] — Le MI/H d'un substrat réservoir est unimodal en l'exposant de Lyapunov, pic au bord du chaos.** Prédiction : pic à |λ| < 0,1 ; chute ≥ 0,2 à |λ| > 0,5. Réfutation : MI/H monotone en λ ou pic à |λ| > 0,3. Réf : 2610.05213, 2609.34171, Vock & Meisel [veille].

**H10 [PRÊT] — QHDC n'apporte aucun gain de vitesse sur simulateur à dimension égale.** Prédiction : simulateur-QHDC ≥ 1× plus lent que torchhd sur MNIST à précision égale. Réfutation : > 10× plus rapide. Réf : npj 2026 (Cumbo).

**H11 [SPÉC] — La borne « qubits frais » se transpose aux réservoirs classiques bruités : la mémoire dépend de l'entropie exportée par pas, pas de la taille.** Prédiction : à fraction de reset k fixée, la capacité de mémoire (MC) d'un ESN bruité varie < 2× quand N passe de 100 à 10 000. Réfutation : MC croît > 2×. Réf : 2610.26228.

**H12 [PRÊT] — Une topologie initialisée depuis un sous-graphe connectomique (FlyWire) n'améliore pas le MI/H de nerve-wml (hypothèse nulle).** Prédiction : |Δ| < 0,02. Réfutation : connectome > aléatoire de > 0,05 dans ≥ 4/5 graines. Réf : 2602.17997, conn2res.

**H13 [PRÊT] — Un réseau à codage prédictif passe la conformité C+ et retient à ≤ 2 pts du substrat MLX sur FlowProxyTask.** Réfutation : violation S1 (non-régression) dans > 1/5 graines ou écart > 5 pts. Réf : 2605.31022, 2610.15933.

**H14 [SPÉC] — Un état SSM (Mamba-3) forcé à travers un goulot VQ (neuroletters) conserve le suivi d'état.** Prédiction : parité ≥ 0,90 (vs 1,00 sans goulot) à alphabet 64. Réfutation : parité < 0,60. Réf : 2603.15569.

**H15 [PRÊT] — BSK en codage TTFS (une impulsion/neurone) à 100M paramètres garde un écart de perplexité ≥ 20 % vs dense.** Réfutation : écart < 10 %. Réf : 2609.05151.

**H16 [PRÊT] — Un curriculum ontogénétique accélère un apprenant bayésien non-LLM (AXIOM).** Prédiction : −25 % de pas jusqu'au seuil vs ordre mélangé sur ≥ 6/10 environnements. Réfutation : gain ≤ 10 %. Réf : 2505.24784, BabyCL [veille].

---

## 8. Concepts et intuitions pour « la prochaine IA » (spéculatifs, étiquetés)

- **C1 [SPÉC→H11] La consolidation comme budget d'entropie.** Le théorème des réservoirs quantiques dit : durée de mémoire ∝ exp(entropie drainée par pas). Reformuler DR-0 : un DE n'est pas une tranche de temps mais une **quantité d'entropie exportée** ; prédit une courbe rétention/budget exponentielle, mesurable sur kiki_oniric.
- **C2 [SPÉC→H3] Le protocole discret comme canal à capacité calculable.** Si les neuroletters sont des hypervecteurs, la taille d'alphabet nécessaire se prédit en fermé — nerve-wml passerait de « MI/H mesuré » à « capacité démontrée ».
- **C3 [SPÉC→T10/T6] Dormir = recuire un paysage d'énergie.** DAM à énergie libre + Ising : `downscale` = schéma de température, `restructure` = déformation du paysage, `recombine` = échantillonnage. Falsifiable par la statistique des bassins avant/après DE.
- **C4 [SPÉC→H7] Le *quand* avant le *quoi*.** GENIAL spécifie quoi consolider ; les astrocytes suggèrent un contrôleur d'incertitude décidant quand. Une IA future aurait un « thermostat de consolidation » explicite, sondable.
- **C5 [PRÊT, déjà amorcé] Agnosticisme à deux niveaux.** Protocole invariant, représentations divergentes (Brain-Score 2026). Prédit qu'une métrique relationnelle sépare les familles de substrats alors que le MI/H post-VQ ne les sépare pas — c'est exactement l'écart 0,10/0,93 déjà mesuré, à ériger en loi.
- **C6 [SPÉC→H9] La criticité comme service du substrat.** Photonique, quantique et SNN convergent : exposer un paramètre λ réglable ; ajouter une condition **C4 « sonde de criticité »** au Critère de Conformité.
- **C7 [SPÉC→H1] Rêver en ligne mais borné.** Réconcilier Zhang et al. (replay sans phase hors-ligne) et DR-0 : l'épisode est défini par le budget, pas par l'horloge. Test d'équivalence online-borné vs offline-borné.
- **C8 [PRÊT→H4] L'organoïde comme réservoir, pas comme élève.** Prédiction forte et contre-intuitive : le substrat vivant valide la couche protocole (Claim B) et invalide la couche compétence (Claim A).
- **C9 [SPÉC, coûteux] La conformité comme fonction de fitness.** OpenArchEvo montre qu'un LLM peut évoluer des architectures SNN ; utiliser C+ comme fitness pour découvrir des substrats conformes — 100+ GPU-jours, pas maintenant.
- **C10 [SPÉC] Multiplexage fréquentiel ≡ système de mémoire continuum.** Le CMS de Hope et le GTM γ/θ sont le même objet (spectre de fréquences de mise à jour) ; un CMS à 2 fréquences devrait ≈ GTM — test direct et peu coûteux (T1 + GTM).

---

## 9. Méthode et limites

- Recherches : ~32 WebSearch (dont ~20 en mode étendu), ~45 requêtes GitHub (`gh search/api`), ~20 requêtes HF (`/api/models`, `/api/papers`), ~25 abstracts arXiv lus en direct (API arXiv `id_list` indisponible pendant la session — repli sur pages `abs/` et API HF papers). Budget WebSearch de session épuisé à la fin : **non recherché** → Dreamer 4 (date confirmée via HF papers : 2509.24527, 29/09/2025), Google Quantum AI 2026, propagation d'équilibre sur memristors 2026, Kuramoto 2026 (couvert par la veille).
- Toutes les références arXiv citées ont un identifiant et une date vérifiés sur la page ou via l'API HF ; les sources marquées **(2nd)** (tarifs CL1/FinalSpark, réplique classique IBM, MaleCNS, Eon Systems, bioRxiv 13/10) n'ont pas été confirmées sur une source primaire.
- Aucun dépôt Hypneum modifié ; aucun calcul lancé ; les coûts sont des estimations (tarifs cloud non publiés par Cortical Labs ni FinalSpark).

---

## Résumé (≤ 15 lignes)

La tendance 2026 est la **consolidation continue en poids rapides** (Hope/Titans/TTT, MemoryBench) — menace frontale pour un DR-0 lu « hors-ligne », mais réconciliable si l'épisode est défini par **budget** et si un module TTT est traité comme substrat conforme (T1/H1). HRM/ARC confirme que **la hiérarchie bi-fréquence seule n'apporte rien** : le comparateur juste du GTM est une boucle externe non hiérarchique (T2/H2). Les règles locales **passent en profondeur** (PC-ALM 1 000 couches, ePC 4 bits, DeltaNet-PC) : un substrat PC conforme C+ est faisable sur M1 (T10/H13). **Quantique : non utile**, verdict renforcé (surrogates classiques, plafond de mémoire par qubits frais, recuit simulé partout) — rester archivé, zéro QPU. **Wetware accessible (~1-2 k€/mois estimé) mais réservoir fixe à réponse décroissante** : c'est le test ultime de l'agnosticisme (Claim B oui / Claim A non, H4). **Thermodynamique** : seuls résultats réels = FPGA p-bits ; `recombine` comme Gibbs sur Ising est un substrat hors-LLM à une journée de 4090 (T6/H6). Neurosciences : dendrites = crédit local, astrocytes = contrôleur du *quand* consolider, neuromodulation inerte si décorrélée de la perte. La **criticité** apparaît dans trois substrats indépendants → candidate à une condition C4 de conformité. Pour BSK, il existe enfin un protocole honnête (lois d'échelle spiking : écart en nats à FLOPs égaux ; TTFS 1,5B). 16 hypothèses falsifiables (12 préenregistrables), 12 tests à coût ≈ 0 € sauf wetware ; les trois invariants Hypneum (budget borné, protocole discret, agnosticisme niveau protocole) **survivent au changement de paradigme** sous ces reformulations.
