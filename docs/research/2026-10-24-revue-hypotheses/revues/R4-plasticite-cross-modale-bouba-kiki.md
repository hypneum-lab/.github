# R4 — Plasticité cross-modale, privation sensorielle et bouba/kiki : revue critique de `bouba_sens`

Hypneum Lab · revue R4 · 2026-10-24 · périmètre : `bouba_sens` @ `87ea54a` (main, 2026-10-24 12:34) + branche `origin/docs/osf-prereg-2026-10` (brouillons v0.7/v0.8/v0.9 du 2026-10-23).
Méthode : lecture de `veille-2026-10-23.md` (non dupliquée ; les entrées déjà présentes sont marquées **[déjà dans veille]**, celles déjà citées par le dépôt ou ses préregs **[déjà dans dépôt]**, le reste **[NOUVEAU]**) ; grep lecture seule du dépôt ; 17 recherches web (budget WebSearch de session épuisé ensuite), 9 recherches GitHub (`gh`), 16 requêtes HF (`/api/datasets`, `/api/papers`), API arXiv (throttlée après ~12 requêtes), ~25 vérifications WebFetch des pages primaires. Aucun calcul lancé, aucun dépôt modifié. Trois références restent **à confirmer** (§2, notes a–c).

---

## 1. Hypothèses ciblées (énoncés exacts, EN)

Source `README.md` (« Three testable invariants ») et `docs/superpowers/specs/2026-04-20-bouba-sens-design.md` §1.2 ; seuils OSF Q6JYN gelés : B-1 ≥ 0.05, B-2 ≥ 0.10 bit, B-3 > 0.02.

- **B-1 — Congenital gap:** « lesion pre-training yields better adaptation than lesion post-convergence. » (Me7 = médiane sur 75 paires de Me1(T1) − Me1(T2)). **Statut : FINAL Retract** (ADR-0019 multi-seed : 10 graines, test du signe p = 0.62, t p = 0.28 ; N12 0/2 à Bonferroni α = 0.025 ; §5.5 réécrit en rétractation complète).
- **B-2 — MI migration:** « mutual information between surviving-modality neuroletters and the target label rises post-lesion. » **Statut : Null** (ADR-0019 B-2 : MINE sonde 896-D −0.038 bit IC95 [−0.105, +0.002] ; E1.3b moyenne +0.031, 1/5 graine > 0.10 ; binning s'effondre en 896-D).
- **B-3 — Perceptive/proprioceptive asymmetry:** « losing vision/audio/tactile produces a quantitatively different plastic response than losing gravity/force. » Opérationnalisation spec : « `Me6` asymmetry matrix max absolute off-diagonal `> 0.02`, with sign structure reproducible across seeds. » **Statut : PASS sur la magnitude seule** (0.109–0.125, 5–6×) ; lecture « architectural property » **retirée** (ADR-0014 : partition pré-enregistrée au 44–72e percentile des 9 partitions 3+2 ; ADR-0015 lemme d'inatteignabilité ; ADR-0018 cadre épuisé). Le README appelle encore B-3 « invariant » (défaut déjà noté dans la veille).
- **ADR-0020 (2026-10-23)** : les trois « sévérités » SNR n'ont jamais été atteintes (k = 5000 pas sur 100 pas de lésion → SNR final 19.21 / 19.41 / 19.80 dB pour des planchers nominaux −20 / −10 / +10). **Toutes les grilles publiées ont lésé à ~19–20 dB, soit un bruit ≈ 10 % de l'écart-type du signal.**

Préregs en brouillon (branche `docs/osf-prereg-2026-10`, « DRAFT — not yet filed ») :
- **v0.7 (N18 proposé) E-1** : « μ₁ = mean of the per-seed E-1 value » ; H1 « −0.025 < μ₁ < +0.025 » (TOST, IC 90 %). **E-2** : « μ₂ = mean of the per-seed ΔMI, primary estimator (Ross 2014, k = 3), hard-demodulated probe » ; H1 « −0.05 < μ₂ < +0.05 ». N = 95 (« smallest N with 0.80 power for E-2 in the planning case », SD de planification 0.1166 = UCL80 du plus grand SD ADR-0019). Séquence fixe E-1 → E-1b → E-1c ; E-2g (Gumbel) secondaire ; corrige le schedule SNR (`k_steps` = 50).
- **v0.8 (N19) S-1** : « Y(s, ℓ) shows an increasing ordered trend in ℓ » (shift de sous-espace chordal S sur Gr(k, 896), contrôle sans lésion, test de Page par permutation intra-bloc, k* fixé par le ratio de participation du pilote, 20 graines, 7 niveaux LOCK_AFTER 25…175). Motivé par Sui et al. 2026.
- **v0.9 (N20) D-1** : « Early decorrelation reduces fusion gain: mean D(s, 0) > 0 » ; **D-2** : « The deficit shows a decreasing ordered trend over onset ». Fenêtre de décorrélation (donneurs intra-classe), bras decor/joint/plain, gate CKA, sonde sur 10 % de frames tenues hors entraînement, double readout (hard/Gumbel), SESOI 0.05. Motivé par Kleinman et al. 2023.

---

## 2. État de l'art (référence | date | résultat | relation à bouba_sens)

Toutes les entrées ci-dessous ont été vérifiées sur la page primaire (arXiv abs, bioRxiv, PMC, éditeur, GitHub) sauf mention « à confirmer ».

| Réf. | Date | Résultat vérifié | Relation | Statut veille |
|---|---|---|---|---|
| Loconsole, Benavides-Varela, Regolin — *Matching sounds to shapes: bouba-kiki in naïve baby chicks*, Science 391(6787):836–839, DOI 10.1126/science.adq7188 | 19 fév. 2026 ; **erratum** Science 392(6799):eaei3078, 14 mai 2026, DOI 10.1126/science.aei3078 (contenu non lu) ; Perspective 10.1126/science.aee8641 **(a)** | Poussins de 1–3 jours : 80 % approchent la forme ronde sous « bouba » vs 25 % sous « kiki » ; mécanisme « predisposed, experience-independent » | Fonde la motivation bouba/kiki **sans langage** ; le benchmark ne teste jamais bouba/kiki (§8 H9) | [NOUVEAU] |
| Loconsole, Xue, Garcia-Pelegrin — *Sound–shape correspondences in macaques*, bioRxiv 10.64898/2026.07.31.741992 | 1 août 2026 | 9 macaques, choix rond sous Bouba 0.67, pointu sous Kiki 0.74, OR ≈ 5.95, χ² = 35.1, p < .001 ; fit singulier (petit n) | Idem ; effet robuste au leave-one-out | [NOUVEAU] |
| Biffi, Pedretti, Normando, Lazebnik, Loconsole, Valsecchi — *Hearing shapes: the Bouba–Kiki effect in adult domestic dogs*, Proc. R. Soc. B 293(2080), DOI 10.1098/rspb.2026.1209 | **7 oct. 2026** (métadonnées Crossref ; corps non lu, page éditeur 403) **(b)** | Même effet chez le chien adulte | Troisième espèce non linguistique en 2026 ; à citer avec le résumé éditeur seulement | [NOUVEAU] |
| Fort & Schwartz — *Resolving the bouba-kiki enigma…*, Sci. Rep. 12 (DOI 10.1038/s41598-022-23623-w) | 2022 | L'effet est enraciné dans la physique : objets ronds → sons plus graves et continus ; indices = balance spectrale + continuité temporelle | Donne une **recette de monde physique** pour un contrôle positif bouba/kiki (§8 H9) | [NOUVEAU] (pré-2026, fondement) |
| Alper & Averbuch-Elor — *Kiki or Bouba?*, NeurIPS 2023 (arXiv 2310.16781) | 2023 | CLIP/Stable Diffusion montrent un motif bouba/kiki en zero-shot | Référence prioritaire du README | [déjà dans dépôt] |
| Kouwenhoven, Shahrasbi, Verhoef — *Revisiting the Bouba-Kiki Effect*, NeurIPS 2025 (arXiv 2507.10013) | juil. 2025, v2 oct. 2025 | CLIP RN/ViT « do not consistently exhibit the bouba-kiki effect » ; Grad-CAM ; biais « rond » du RN | **Contredit** la robustesse du résultat 2023 ; à ajouter en contrepoint dans §7 du papier | [NOUVEAU] |
| Hong, Ibaraki, Shi, Chiang, Li — *Similar Choices, Different Attention*, arXiv 2609.36475 | 29 sept. 2026 | N = 53 humains + eye-tracking ; quelques grands VLM alignent les **choix**, aucun n'aligne l'**attention** (sous un baseline gaussien centré) | Choix ≠ mécanisme : leçon pour toute « preuve » de bouba/kiki par readout | [NOUVEAU] |
| Jeong et al. — *Do LMs Associate Sound with Meaning?*, AAAI 2026 oral (arXiv 2511.10045 v6) | nov. 2025 → mars 2026 | LEX-ICON 8 052 mimétiques + 2 930 pseudo-mots (EN/FR/JA/KO) ; attention phonosémantique | Dataset de pseudo-mots réutilisable | [NOUVEAU] |
| Sharma et al. — *Adversarially Probing Cross-Family Sound Symbolism in 27 Languages*, arXiv 2512.12245 | déc. 2025 | 810 adjectifs ; signal de taille survit au scrubbing adverse de l'identité de langue | Pas des LLM (classifieurs interprétables) ; ancre linguistique | [NOUVEAU] |
| Tseng, Shih, Harwath, Mooney — *Measuring Sound Symbolism in Audio-visual Models*, SLT 2024 (arXiv 2409.12306) | 2024 | Corrélation significative, surtout modèles entraînés sur la parole | Fondement audio-visuel pré-2026 | [NOUVEAU] |
| Tsai et al. — *Hearing Like Humans?*, SLT 2026 (arXiv 2607.10162) | juil. 2026 | Symbolisme sonore dans les speech-LM | Déjà dans refs.bib | [déjà dans veille] |
| Kleinman, Achille, Soatto — *Critical Learning Periods for Multisensory Integration*, CVPR 2023 (arXiv 2210.04643 ; code `mjkleinman/CriticalPeriodMultiView`) | 2022–23 | Période critique d'intégration **seulement dans les réseaux profonds**, pas superficiels ; objectifs de reconstruction croisée protègent | **Prédit le nul B-1** : les encodeurs bouba_sens ont 1 conv/2 couches (§3) | [déjà dans dépôt] |
| Kleinman, Achille, Soatto — *CLP Emerge Even in Deep Linear Networks*, arXiv 2308.12221 v2 | 2023, v2 mai 2024 | Dépend de la profondeur et de la distribution des données | Idem ; listing arXiv `au:Kleinman_Michael` (24 oct. 2026) : **aucune suite** sur les périodes critiques après 2024 (travaux 2025–26 = raisonnement LLM) **(c)** | [NOUVEAU] |
| Constantinescu, Pimentel, Cotterell, Warstadt — *Investigating Critical Period Effects…*, TACL 13:96–120 (arXiv 2407.19325) | 2025 | **Aucune** période critique n'émerge de l'apprentissage statistique seul ; il faut un régularisateur maturationnel (EWC) pour la reproduire | **Contredit** l'attente d'un B-1 spontané ; suggère un bras « plasticité décroissante imposée » | [NOUVEAU] |
| `haeliotang/critical-period-lm` (préenregistré, MIT/CC-BY) | 31 août 2026 | Transformer 7.3 M (MLX, 1 Mac) ; déficit = brouillage de l'ordre des tokens ; **effet inverse d'onset** : le déficit tardif se répare plus lentement (α 0.763 vs 1.158, p = 0.0002, 8 graines) ; mesure un **taux de réparation**, pas un point final | Même direction que B-1, mais nouvel estimand (§8 H4) ; design préenregistré multi-graines directement transposable | [NOUVEAU] |
| Pawlak — *On the Occurence of Critical Learning Periods in NN*, arXiv 2510.09687 | oct. 2025 | Les périodes critiques (et la perte de warm-start) s'évitent par un **LR cyclique** ou une remise à zéro | Caveat déjà intégré dans v0.9 §4 | [déjà dans dépôt] |
| Fukase et al. — *One Period to Rule Them All*, arXiv 2506.15954 | juin 2025 | Identification des phases critiques par prédiction de généralisation ; −59 % temps d'entraînement | Outil d'identification de fenêtre, pas de lésion | [NOUVEAU] |
| Mohapatra — *Simulating Infant Senses with Age-Tuned Networks*, arXiv 2610.25377 (code `pikulsomesh/developmental-world-models`) | 18 oct. 2026 | Filtres d'immaturité indexés par l'âge ; une période critique et un rétrécissement perceptif **émergent** sans être codés ; vision : R² position 0.00 (nouveau-né) vs 0.57 | Alternative à la lésion-par-bruit : **schedule de filtres développementaux** ; pas de cross-modal | [NOUVEAU] |
| Grasse & Tata — *ANNs Trained on Noisy Speech Exhibit the McGurk Effect*, arXiv 2411.05715 v2 | 2024 → oct. 2025 | L'intégration AV croît avec le bruit d'entraînement jusqu'à un seuil puis **échoue** aux bruits extrêmes | Dose-réponse non monotone **sur l'axe SNR** (pas LOCK_AFTER) ; §8 H12 | [NOUVEAU] |
| Han et al. — *Towards Physics of Multimodal Pretraining*, arXiv 2608.05000 | août 2026 | « Early unification » > alignement tardif ; « vision laziness » ; 13.5 B MoE / 2 T tokens | Déjà cité dans v0.9 comme contexte | [déjà dans dépôt] |
| Kamai, Van Assel, Regev, Perets, Balestriero — *When to Align, When to Predict: A Phase Diagram*, arXiv 2606.11190 v4 | juin → 15 oct. 2026 | Quatre régimes (Both/CA/CP/Neither) selon la **corrélation de nuisance inter-vues** et la qualité de la source ; identifie l'« unimodal collapse » | Cadre pour choisir le monde : dans le monde gaussien les modalités sont des projections orthogonales du **même** z → régime redondant pur (§3 B-2) | [NOUVEAU] |
| Kontras … Liang — *SynIB*, arXiv 2606.09853 | mai 2026 | Objectif ciblant la **synergie** ; +7.8 % sur exemples synergiques ; XOR synthétique non appris par l'entraînement standard | Déjà cité dans v0.9 §3.4 (surapprentissage des indices synergiques) | [déjà dans dépôt] |
| Liang et al. — *Quantifying & Modeling Multimodal Interactions* (PID), NeurIPS 2023 (code `pliang279/PID`, 96★, MIT) | 2023 | Décomposition redondance / unicité / synergie estimable sur données réelles | **Rend B-2 obsolète tel que formulé** : la « migration » est un déplacement R→U, pas une hausse de MI totale | [NOUVEAU] (pré-2026, fondement) |
| `warrenzha/flow-pid` — *PID via Normalizing Flows*, NeurIPS 2025 | 2025, commit 19 oct. 2026 | PID en latent gaussien par flots | Estimateur PID moderne pour sonde 896-D | [NOUVEAU] |
| Fang, Zhang, Tao, Chan — *Modality Interaction in Multimodal LMs via PID*, ICML 2026 (arXiv 2606.00959 v2) | mai → août 2026 | « Sensory PID » conditionnel au langage ; les décisions reposent sur l'information **unique** avec **dominance visuelle**, peu de synergie ; interventions par brouillage de modalité | Montre qu'une « asymétrie » inter-modale est la **norme** des modèles multimodaux (dominance), sans aucune lésion : contre-hypothèse directe à B-3 | [NOUVEAU] |
| Yarici & AlRegib — *SynCo: Learning Cross-Modal Synergy by Contrasting Interaction Residuals*, arXiv 2609.32846 | 26 sept. 2026 | Résidu d'interaction (part de la fusion non prédite linéairement des unimodaux) ; +5.98 % de capture de synergie sur Trifeature | Opérationnalisation simple de la synergie réutilisable comme métrique pré/post lésion | [NOUVEAU] |
| Wen, Li, Duan, Dai, Liu, Kang — *Dependency, Compression, and Synergy: A Unified Information-Theoretic View of Multimodal Learning*, arXiv 2609.14421 | 13 sept. 2026 | Survey de 170 travaux : MI → IB → PID comme vues progressivement raffinées ; « Generalized Multimodal Information Lagrangian » | Cadre pour positionner B-2 (MI = vue la plus grossière) ; l'estimation en haute dimension reste ouverte | [NOUVEAU] |
| Sui et al. — *Do More Modalities Always Help?*, NeurIPS 2026 (arXiv 2610.04792 v2) | 3 → 13 oct. 2026 | Rotations structurées des sous-espaces **de paramètres** dans les couches d'interaction ; Geodesic Unlearning ; le papier **ne manipule pas** le moment de la perte à l'entraînement | Base de v0.8 ; la métrique v0.8 porte sur les **représentations**, l'analogie est reconnue comme indirecte | [déjà dans veille] |
| Song, Yang, Ma — *Bias-Corrected Subspace Intersection*, arXiv 2609.05617 | 4 sept. 2026 | Biais de 2e ordre des sous-espaces plug-in par fuite directionnelle des vecteurs singuliers | Déjà cité dans v0.8 (sensibilité k) | [déjà dans dépôt] |
| Knopov & Shvai — *Equivalence testing and run-count design for stochastic ML experiments*, arXiv 2610.23700 (code `DmytroKnopov/equivtest` v0.2.0, MIT, Zenodo 10.5281/zenodo.23421510) | 16 oct. 2026 | TOST avec modèle de variance à deux niveaux (graines × items) ; 2 runs/méthode certifient l'équivalence ~3 % du temps ; 12 runs pour une marge 0.01 AUROC à 80 % ; recommande l'UCL de la variance pilote | Déjà appliqué dans v0.7 (N = 95 sur UCL80) ; code réutilisable | [déjà dans dépôt] |
| Lakens — *Equivalence Tests: A Practical Primer*, SPPS 2017 (PMC5502906) | 2017 | TOST ≈ IC 90 % dans les bornes ; conservatisme possible | Fondement statistique de v0.7 | [NOUVEAU] (fondement) |
| Czyż et al. — `cbg-ethz/bmi` (64★, MIT, commit sept. 2025) | 2023–25 | Benchmark d'estimateurs MI avec vérité terrain | Calibration « known-signal » de v0.7 §4.3 pourrait réutiliser ses familles de distributions | [NOUVEAU] |
| Foresti et al. — MI benchmarks, arXiv 2607.03487 ; Abdelaleem et al. 2506.00330 | 2025–26 | Diversité d'estimateurs ; MI en haute dimension | Déjà dans refs.bib | [déjà dans veille] |
| Wei, Sarré, Abboud, …, Collignon, Cohen, Margulies — *Early sensory deprivation drives local reorganization of sensory integration within a conserved global hierarchy*, bioRxiv 10.64898/2026.06.14.732169 | juin 2026 | rs-fMRI, aveugles précoces (3 sites) et sourds précoces ; **angle sensoriel** modifié localement (extrastrié ; STC gauche chez les sourds, 277.5° vs 137.9°/158.8°), **magnitude et hiérarchie globale conservées** (r ≈ 0.87–0.94) | B-3 et S (v0.8) sont des mesures **globales** ; la biologie prédit un effet **local** (angle), pas global (§8 H10) | [NOUVEAU] |
| Paré, Lubell, Baillet, Kupers, Ptito — *Pathways of Cross-Modal Access to the Visual Cortex in Late Blindness*, Res. Sq. preprint 10.21203/rs.3.rs-8196909/v1 (PMC12869661) | 20 jan. 2026 | MEG, 11 tardifs (onset 25.7 ± 11.3 ans) : V1 tactile à 35 ms vs 59 ms ; PTE alpha thalamus–V1 ↑ ; beta thalamus–V1 ↑ **spécifique aux tardifs** ; **aucune corrélation avec l'âge d'onset** (n faible) | La dichotomie congénital/tardif est **graduelle et multi-voies** ; Me7 scalaire est trop pauvre (déjà soulevé par REVIEW.md) | [NOUVEAU] |
| Kwak, Kyong, Choi, An, Shim — *Auditory performance and cortical plasticity in blind individuals with sensorineural hearing loss*, Front. Aging Neurosci. 18 | 1 oct. 2026 | 12 tardifs + 4 précoces + 12 voyants, tous presbyacousiques : avantages temporels/mémoire conservés, le reste absent ; la perte auditive **limite** la compensation | La plasticité compensatoire dépend de l'**intégrité de la modalité survivante** → croiser lésion × SNR des survivants (§7 T6) | [NOUVEAU] |
| Esmaelpoor et al. — *Cross-modal functional plasticity after cochlear implantation*, Cereb. Cortex 35(4) bhaf084 | avr. 2025 | 23 implantés : connectivité cross-modale encore élevée à 1 an | La réorganisation **persiste** après restauration : prévoit un coût de « dé-plasticité » mesurable en Phase 3 | [NOUVEAU] |
| Qiao et al. — Front. Neurosci. 2024.1411058 | 2024 | Enfants implantés : réorganisation cross-modale à 3 mois, **retour au baseline à 12 mois** | Plasticité réversible et dynamique : une mesure unique post-lésion rate la trajectoire | [NOUVEAU] |
| Bedny, Pascual-Leone, Dravida, Saxe — *A sensitive period for language in the visual cortex*, Brain & Lang. 2012 ; Collignon et al. 2013 ; Heimler & Amedi 2020 | 2012–20 | Période sensible < ~9 ans pour le recrutement occipital | Fondement de T1/T2 (déjà cité). Aucun article Bedny/Amedi/Merabet 2025–26 trouvé dans les 3 recherches dédiées | [déjà dans dépôt] |
| Dohare et al. — *Loss of plasticity in deep continual learning*, Nature 2024 ; Klein et al. survey arXiv 2411.04832 | 2024 | Perte de plasticité sous non-stationnarité prolongée | 200 pas d'entraînement bouba_sens sont **très loin** du régime où la plasticité décline (§3 B-1) | [NOUVEAU] (fondement) |
| Hernandez-Garcia, Figliolia, Millidge — *Can Scale Save Us From Plasticity Loss in LLMs?*, arXiv 2606.24752 | 23 juin 2026 | Perte de plasticité à toutes les tailles 5 M–314 M ; onset croît sous-linéairement | Idem ; l'échelle ne sauve pas | [NOUVEAU] |
| Wang et al. — *Predicting Plasticity in Deep CL: A Theoretical Perspective*, arXiv 2605.09044 | 9 mai 2026 | « Optimization readiness » (force × fiabilité du gradient) borne le gain d'une étape ; rang des représentations/NTK **échouent** | Métrique de plasticité calculable à chaque checkpoint bouba_sens (§7 T7) | [NOUVEAU] |
| Ren, Deng, Hong, Lyle, Gal — *Learning Dynamics of CL: unified view…*, arXiv 2609.33620 | 27 sept. 2026 | Oubli et perte de plasticité = régimes d'une même interaction mise-à-jour/comportement ; diagnostic par readout | Lien direct avec la « hiérarchie de readout » E-2 | [NOUVEAU] |
| Hofmann & Mäder — *When does a network's training history predict its future learning…*, arXiv 2610.09621 | 7 oct. 2026 | L'historique n'informe que tant que l'état courant n'informe pas (gain −21 % [−92, 8] en régime principal) | Tempère l'idée qu'une « empreinte » du moment de lésion soit lisible plus tard | [NOUVEAU] |
| `RLE-Foundation/Plasticine` (49★, MIT, arXiv 2504.17490) | 2025, commit fév. 2026 | Framework RL « plasticity-motivated », métriques (dormance, rang) | Benchmark de plasticité existant ; bouba_sens doit se positionner | [NOUVEAU] |
| MultiBench (`pliang279/MultiBench`, 654★, MIT) | 2021 | 15 datasets / 10 modalités, robustesse bruit/manquant | Menace de priorité déjà notée (REVIEW.md) | [déjà dans dépôt] |
| Sen & Ahmadi — *MacJEPA*, arXiv 2610.08192 v2 | 6–9 oct. 2026 | Manquance **temporellement localisée** (pannes de capteur) sur Epic-Kitchens-100 / Epic-Sounds ; dropout de modalité par fenêtre | Modèle de lésion plus réaliste que le bruit additif ; données réelles | [NOUVEAU] |
| Javadov, Schoess, von Wangenheim — *I Don't Miss You, but I Do*, VLM4RWD @ NeurIPS 2026 (arXiv 2609.07596) | sept. 2026 | 10 VLM : changement exécuté > prédit dans 78/80 réglages (70 % vs ≤ 9.6 %) | Les auto-explications de dépendance modale ne valent rien ; seule l'intervention compte | [NOUVEAU] |
| Robbins … Haussler, Teodorescu — *Goal-Directed Learning in Cortical Organoids*, Cell Reports (DOI 10.1016/j.celrep.2026.116984) | fév. 2026 | Cart-pole en boucle fermée ; taux de réussite 4.5 % → 46 % ; **non persistant après 45 min** ; dépend AMPA/NMDA | Substrat hors-LLM pour une « lésion de canal » biohybride (§8 H8, spéculatif) | [NOUVEAU] |
| Heinrich et al. — *Crossmodal Language Grounding in an Embodied Neurocognitive Model*, Front. Neurorobot. 14:52 | 2020 | MTRNN, robot NICO, timescales adaptés implicitement | Modèle incarné de référence pour l'ancrage multimodal (hors transformer) | [NOUVEAU] (fondement) |
| Hwang & Tani — *Visuomotor Associative Learning under the Predictive Coding Framework*, JNNS 2018 (slides) ; Hwang et al. arXiv 1706.02444 | 2017–18 | P-VMDNN : voies visuelle (MSTRNN) et proprioceptive (MTRNN) liées latéralement | Architecture « deux voies à échelles multiples » = alternative au multiplexeur unique (§9) ; la version 2018 n'est pas un article revu | [NOUVEAU] (fondement) |

Notes : **(a)** citation, DOI et existence de l'erratum confirmés via l'API Europe PMC (PMID 41712735 ; erratum PMID 42133785) ; le **contenu** de l'erratum n'a pas été lu (pages Science/PubMed bloquées) — à lire avant de citer un chiffre précis. **(b)** métadonnées confirmées via l'API Crossref ; corps de l'article non lu (403). **(c)** confirmé par le listing auteur arXiv (API, 24 oct. 2026). Par ailleurs la requête arXiv `abs:"cross-modal plasticity"` ne renvoie **aucun** modèle computationnel 2024–2026 (2 entrées hors sujet) : l'« espace libre » noté dans la veille est confirmé.

---

## 3. Preuves POUR / CONTRE par hypothèse

### B-1 (période critique, dose-réponse Amedi)
**POUR (mécanisme possible)** : Kleinman 2023 (profonds), Grasse & Tata (intégration AV façonnée par le bruit précoce), Mohapatra 2026 (période critique émergente avec filtres d'immaturité), Han 2026 (vision laziness si intégration tardive), `critical-period-lm` (le déficit tardif se répare plus lentement — direction compatible avec B-1).
**CONTRE / rend obsolète** :
1. **Kleinman prédit le nul** : la période critique d'intégration n'apparaît que dans les réseaux profonds ; les encodeurs bouba_sens sont `Conv1d(1,16)+Linear`, `Conv2d(1,8)+Linear`, MLP 2 couches (src/bouba_sens/encoders/*). Le benchmark est dans le régime où la littérature de référence **n'attend pas** de période critique.
2. **Constantinescu 2025** : l'apprentissage statistique seul ne produit pas de période critique ; il faut un mécanisme maturationnel. Le `constellation_lock_after` est précisément ce mécanisme — mais imposé, donc B-1 avec lock n'est pas une **émergence**, c'est une conséquence du design (le papier le reconnaît en §5.3 : « the lock is homogenising, not recovering »).
3. **Échelle temporelle** : Achille 2019 et Dohare 2024 situent la perte de plasticité après des milliers d'époques ou de tâches ; `STEPS_TRAIN=200`, `STEPS_LESION=100`. Hernandez-Garcia 2026 : même à 314 M paramètres l'onset est tardif. **À 200 pas, il n'y a rien à perdre.**
4. **ADR-0020** : les lésions historiques n'ont jamais dépassé ~19 dB ; T1 vs T2 comparaient deux réseaux quasi intacts.
5. Neurosciences 2026 : Paré (aucune corrélation onset/mesures chez les tardifs), Qiao (réversibilité à 12 mois), Kwak (compensation conditionnée par la modalité survivante). La dichotomie T1/T2 à un seul instant de mesure est un modèle trop pauvre ; **l'estimand pertinent est une trajectoire (taux de réparation α)**, comme dans `critical-period-lm`.
→ v0.7 E-1 (TOST ±0.025) est **prêt à préenregistrer** mais ne teste que l'absence d'écart dans un régime où aucun n'est attendu ; son intérêt est méthodologique (certifier le nul), pas théorique.

### B-2 (migration d'information mutuelle)
**CONTRE / explications triviales du nul** :
1. **Saturation par redondance** : dans `GaussianWorld`, les 5 modalités sont des projections orthonormées du **même** z ∈ ℝ³² et le label est `sign(z0)+2·sign(z1)` — chaque modalité (sauf réduction de dimension, cf. B-3-d) porte la **même** information de label. MI(survivants ; Y) est déjà au plafond H(Y) = 2 bits avant lésion : **aucune migration n'est définissable**. Le plafond est reconnu dans v0.7 §4.2 (« ceiling effect ») mais pas sa cause structurelle. XOR/Sinusoïde et les deux ponts réels doivent être caractérisés par PID avant de parler de migration.
2. **Mauvais estimand** : la littérature (Liang 2023, SynIB, flow-PID) décrit la réorganisation comme un déplacement **redondance → unicité** des survivants, pas comme une hausse de MI totale. v0.7 E-2 mesure la MI du code **fusionné** (reconnu : « a gain on surviving channels can cancel a loss on the lesioned one »).
3. **Kamai 2026** : la réussite d'un objectif cross-modal dépend de la corrélation de nuisance inter-vues ; le monde gaussien est à nuisance indépendante par construction (dimensions 2–31 de z projetées orthogonalement : bruit **partagé**, pas indépendant — à vérifier analytiquement : les 30 dimensions de bruit sont communes à toutes les modalités, ce qui place le monde dans un régime de nuisance **fortement corrélée**, où l'alignement échoue mais la prédiction croisée est triviale).
**Estimateurs** : Ross 2014 (k = 3, euclidien brut en 896-D, ~128 points/classe) — biais non caractérisé, reconnu et calibré (§4.3) ; recommandations : (i) réutiliser `cbg-ethz/bmi` pour la calibration à vérité connue ; (ii) ajouter la **décodabilité** (probe linéaire validée croisée sur les codes des survivants, en unités d'accuracy) : même échelle que le SESOI 0.05, exigence d'échantillon bien moindre, directement « TOST-able » ; (iii) rapporter la PID (R/U/S) pré/post par `pliang279/PID` ou flow-PID.
→ E-2 est **prêt à préenregistrer** comme borne sur une statistique opérationnelle ; il ne répond pas à la question « migration ». Le gain scientifique viendrait d'un monde à information **unique par modalité** (§8 H2).

### B-3 (asymétrie perceptif/proprioceptif) — survit-il à une explication triviale ? **Non, en l'état.**
Cinq explications triviales, chacune suffisante :
- **(a) Statistique d'extrême sur du bruit d'échantillonnage.** `query_accuracy` évalue chaque P[i,j] sur **64** échantillons (`batch_size: int = 64`, `loop.py:313` ; la CLI ne passe que `seed`). Écart-type binomial d'une accuracy à p ≈ 0.5 : √(0.25/64) ≈ 0.0625 ; différence de deux cellules indépendantes : ≈ 0.088 ; espérance du **max** de 10 |N(0, 0.088)| indépendants (les 10 paires hors diagonale d'une matrice 5×5 antisymétrique) ≈ 1.54 × 0.088 ≈ **0.136**. La plage observée 0.109–0.125 est **exactement** la valeur attendue sous l'hypothèse nulle « aucune asymétrie ». Le propre balayage de l'ADR-0014 (Me6 ≈ 2.6 σ sur des matrices de bruit) est une mesure de ce multiplicateur d'extrême ; « proxy d'entropie » signifie ici « proxy de bruit ». De plus Me1 est quantifié à 1/64 = 0.0156, et le seuil 0.02 vaut **1.3 quantum**. Aucune ADR ne compare la magnitude Me6 à un nul (ADR-0014/15/18 ne testent que la **partition**).
- **(b) Lésion non appliquée (ADR-0020)** : B-3 a été mesuré sur des réseaux à SNR ≈ 19–20 dB ; il ne peut pas être une « plastic response ».
- **(c) Masquage à zéro hors distribution** : la requête met 4 canaux à zéro alors que la lésion est un bruit **additif** (le réseau n'a jamais vu de zéros) ; chaque encodeur répond alors par ses biais (ReLU sur biais). L'asymétrie mesure la réaction OOD de chaque encodeur au vecteur nul, pas une réorganisation. v0.9 réutilise ce même `fusion_gain` à zéros.
- **(d) Dimensionnalité hétérogène** : gravité 3-D, force 6-D, tactile 32, audio 128, vision 256 (`gaussian.py:35-39`) ; une projection orthonormée aléatoire 32→3 ne conserve qu'une fraction des deux dimensions de label → la décodabilité unimodale de gravité/force est **structurellement** plus faible. La partition « perceptif/proprioceptif » coïncide avec la partition « haute/basse dimension » : confondu parfait.
- **(e) Comparaison de réseaux différents** : P[i,j] (lésion i) et P[j,i] (lésion j) proviennent de **cellules différentes** (`run_grid.sh` : une graine par cellule) ; Me6 inclut donc la variance inter-runs.
- **(f) Dominance modale ordinaire** : Fang et al. (ICML 2026) montrent que des modèles multimodaux **jamais lésés** décident surtout sur l'information unique d'une modalité dominante (vision). Une asymétrie inter-modale est l'état par défaut de tout réseau multimodal ; sans contrôle intact (T2), rien ne la relie à une « plastic response ».
**POUR (ce qui reste)** : Wei et al. 2026 montrent qu'une asymétrie existe biologiquement — mais **locale** (angle d'intégration par aire), avec hiérarchie globale conservée. Un B-3 « sauvable » serait un angle local par SensoryWML, pas un max global de matrice d'accuracy.

### E-2 / hiérarchie de readout (v0.7)
Points solides : double readout hard/Gumbel, N = 95 dimensionné sur UCL80 (règle Knopov & Shvai), calibration à signal connu, estimand explicitement limité. Points faibles : (i) plafond H(Y) ; (ii) Ross non caractérisé en 896-D (reconnu) ; (iii) le readout « hard » rend les codes déterministes mais pas moins **dégénérés** (codes one-hot sur codebook → nombreuses lignes dupliquées → m_i gonflé, compteur de doublons prévu, bien) ; (iv) l'absence de décodabilité comme co-primaire.

### v0.8 (sous-espace) et v0.9 (décorrélation)
v0.8 : métrique propre (chordale, invariante, floor split-half, garde de rang), mais (i) l'analogie Sui porte sur les **paramètres** (reconnu) ; (ii) la veille a déjà conclu « structure relationnelle > géométrie » (You 2609.27252, Gröger 2602.14486) : ajouter une **analyse de sensibilité relationnelle** (RSA/CKA pré-vs-post sur la même sonde) ; (iii) `k*` par ratio de participation du pilote : bien, mais le floor split-half n'est pas la distribution d'échantillonnage du contraste (reconnu). v0.9 : c'est la réplication la plus honnête de Kleinman (manipulation identique, confonds onset/budget déclarés) ; Grasse & Tata suggèrent d'ajouter un **axe SNR** à la fenêtre (§8 H12) ; Kamai suggère de rapporter la corrélation de nuisance intra-classe mesurée par le gate CKA comme coordonnée du diagramme de phase.

---

## 4. Dépôts GitHub réutilisables (vérifiés `gh` le 2026-10-24)

| Dépôt | ★ | Dernier push | Licence | Usage pour bouba_sens |
|---|---|---|---|---|
| `DmytroKnopov/equivtest` | 0 | 2026-10-16 | MIT | Welch-TOST, bootstrap hiérarchique, formule de nombre de runs (déjà cité v0.7) |
| `haeliotang/critical-period-lm` | 0 | 2026-08-31 | MIT (code) / CC-BY-4.0 (prereg) | Protocole préenregistré « taux de réparation α », 1 Mac MLX, 8 graines |
| `mjkleinman/CriticalPeriodMultiView` | 1 | 2023-12-17 | Apache-2.0 | Référence officielle Kleinman (décorrélation, reconstruction croisée) |
| `RoniLeor/critical-learning-periods` | 0 | 2026-09-30 | MIT | Reconstruction typée Achille 2019 (All-CNN, flou CIFAR, Fisher) |
| `pikulsomesh/developmental-world-models` | — | oct. 2026 | n/c (vérifier) | Filtres d'immaturité par âge (vision, audition) |
| `pliang279/PID` | 96 | 2024-10-28 | MIT | Décomposition R/U/S pour reformuler B-2 |
| `warrenzha/flow-pid` | 14 | 2026-10-19 | n/c | PID par flots normalisants (haute dimension) |
| `cbg-ethz/bmi` | 64 | 2025-09-16 | MIT | Benchmark d'estimateurs MI à vérité connue (calibration v0.7 §4.3) |
| `ermongroup/smile-mi-estimator` | 76 | 2020-02-12 | MIT | Limites des estimateurs variationnels (MINE) |
| `pliang279/MultiBench` | 654 | 2024-01-27 | MIT | Baselines bruit/manquant ; menace de priorité |
| `YiLunLee/missing_aware_prompts` | 233 | 2023-12-13 | aucune | Évaluation manquance standard (CVPR'23) |
| `RLE-Foundation/Plasticine` | 49 | 2026-02-09 | MIT | Métriques de plasticité RL (dormance, rang) |
| `robince/partial-info-decomp` | 50 | 2026-04-15 | GPL-3.0 | PID/PED par surprise ponctuelle |
| `linusjoergensen/platonic-bouba-kiki-public` | 1 | 2026-06-01 | aucune | Bouba/kiki vs taille de VLM via PRH (anecdotique) |

---

## 5. Ressources Hugging Face (datasets réels candidats pour remplacer les mondes synthétiques)

Critère : ≥ 3 canaux réels dont au moins un proprioceptif/force (gravité/force de bouba_sens) et un perceptif. Vérifiés via `/api/datasets/<id>` le 2026-10-24.

| Dataset HF | Canaux réels | Licence | Taille / dl | Remarque |
|---|---|---|---|---|
| `Voxel51/TaF-Tactile-Force` (conversion de `jiamig/taf-dataset`) | image tactile (gel) + matrice piézo 12×12 + **wrench 6 axes ATI**, 30 fps synchrones | MIT | 1K–10K ; 2 192 dl | **Trois canaux « proprio/tactile » réels** à l'horloge commune : remplaçant direct de tactile/force synthétiques |
| `OpenGraphLabs-Research/ego-tactile-manipulation` | vidéo égocentrique + **tactile deux mains (gants OGLO)** + signaux capteurs + labels d'action | CC-BY-4.0 | 1.28 h, 1M–10M lignes ; 817 dl | Vision + tactile + labels réels ; candidat « pont 3 réels » |
| `Voxel51/grabette-tactile-full-synced-48ep` | vidéo + tactile + séries temporelles robot (état/force) | Apache-2.0 | 48 épisodes ; 999 dl | Vision + tactile + proprioception robot |
| `eidon-ai/tracker-pov-imu` (+ `eidon-ai/tracker-pov` vidéo) | **IMU 7 points à 24 Hz** (orientation = proxy gravité) joint à la vidéo égocentrique | CC-BY-4.0 | ~780 M lignes ; 1 128 dl | Gravité **réelle** + vision réelle ; très volumineux, sous-échantillonner |
| `Voxel51/Egocentric-EMG-Force` (conv. `Lo6yu/egocentric_dataset`) | RGB-D + **EMG/force** aux poignets, 8 tâches domestiques | CC-BY-NC-4.0 | < 1K ; 1 546 dl | Force réelle + vision ; NC |
| `mlfu7/Touch-Vision-Language-Dataset` (Fu et al., Berkeley/Meta) | toucher (DIGIT) + vision + texte | non déclarée | 1 167 dl | Toucher + vision réels ; licence à clarifier |
| `real-stanford/multisensory_wm` (MuSe, arXiv 2606.30988) | vidéo iPhone + **force-torque** (démos) | MIT | 221 dl | Vision + force ; petit |
| `facebook/wearable-ai` | vidéo + texte (wearables) | CC-BY-NC-4.0 | 4 771 dl | Pas de proprio exposée ; NC |
| `ThomasTheMaker/ptb-xl-ecg` | ECG 12 dérivations (PTB-XL) | upstream CC-BY-4.0 (carte vide) | 10K–100K ; 1.17 M dl | Remplaçant/extension de MIT-BIH (5 min) : 21 837 enregistrements |
| `epr-labs/mit-bih-arrhythmia-database` | ECG MIT-BIH (clone PhysioNet) | ODC-BY | < 1K ; 157 dl | Idem monde ECG actuel |
| `huseyincavus/physionet-ecg-arrhythmia-1.0.0` | ECG PhysioNet | CC-BY-4.0 | 51 597 dl | Alternative |
| Epic-Kitchens-100 + Epic-Sounds (via MacJEPA) | vidéo égocentrique + audio, pannes localisées | non-commercial (upstream) | hors HF | Lésion « panne de capteur » réaliste |

Constats : **aucun** dataset HF n'offre audio + vision + tactile + gravité + force synchronisés ; `studyforrest`, `ObjectFolder`, `ActionSense` sont absents de HF (recherches vides). Le pont le plus crédible à 4–5 canaux réels = **TaF (3 canaux contact/force) ⊕ un flux audio-visuel** sur une horloge alignée artificiellement — ce qui devrait être déclaré comme « synchronie synthétique ». Les recherches croisées « imu audio », « tactile audio », « lerobot audio » sont vides : l'audio est la modalité manquante des datasets robotiques HF.

---

## 6. Actualités septembre–octobre 2026 (toutes vérifiées sur la page primaire)

| Date | Item | Pertinence |
|---|---|---|
| 2026-10-22 | HERD (arXiv 2610.31401) — distillation récursive pour CL | périphérique (titre seul) |
| 2026-10-18 | Mohapatra — *Simulating Infant Senses* (2610.25377) | période critique émergente par filtres d'immaturité ; code public |
| 2026-10-16 | Knopov & Shvai — TOST + run-count (2610.23700) ; `equivtest` v0.2.0 | déjà intégré dans v0.7 ; publication du papier |
| 2026-10-15 | Kamai et al. v4 — diagramme de phase align/predict (2606.11190) | positionner les mondes dans le diagramme |
| 2026-10-13 | Sui et al. v2 — NeurIPS 2026 (2610.04792) | base v0.8 ; pas d'étude de timing |
| 2026-10-07 | Hofmann & Mäder — historique vs état courant (2610.09621) | limite des « empreintes » de timing |
| 2026-10-07 | Biffi et al. — bouba/kiki chez le chien adulte, Proc. R. Soc. B 293(2080) | 3e espèce non linguistique (poussins, macaques, chiens) |
| 2026-09-26 | Yarici & AlRegib — SynCo (2609.32846) | métrique de synergie « résidu d'interaction » |
| 2026-09-13 | Wen et al. — survey MI/IB/PID (2609.14421) | B-2 = vue la plus grossière d'une hiérarchie |
| 2026-10-06/09 | MacJEPA (2610.08192) | lésion = panne de capteur localisée, données réelles |
| 2026-10-01 | Kwak et al., Front. Aging Neurosci. | compensation conditionnée par la modalité survivante |
| 2026-09-29 | Hong et al. — VLM bouba/kiki, choix vs attention (2609.36475) | readout ≠ mécanisme |
| 2026-09-27 | Ren, Deng, Hong, Lyle, Gal — dynamique unifiée oubli/plasticité (2609.33620) | diagnostic par readout |
| 2026-09-30 | `RoniLeor/critical-learning-periods` | reconstruction Achille 2019 |
| 2026-09-07/30 | Javadov et al. — fidélité des auto-explications de manquance (2609.07596) | interventions > explications |
| 2026-09-04 | Song, Yang, Ma — biais des sous-espaces plug-in (2609.05617) | déjà dans v0.8 |
| 2026-08-31 (juste avant) | `critical-period-lm` — effet inverse d'onset préenregistré | estimand « taux de réparation » |
| 2026-08-01 (juste avant) | macaques bouba/kiki (bioRxiv) | effet sans langage, OR ≈ 6 |

Non couvert : acceptations NeurIPS 2026 complètes, ICLR 2027 OpenReview, erratum Science Loconsole (a), BabyLM 2026 (déjà noté dans la veille).

---

## 7. Réfutations et tests critiques réalisables (Mac M1 32 Go / RTX 4090)

Ordre de priorité = rapport (ce que le test tranche) / coût. Repères : une grille de 150 cellules ≈ 20 min sur M3 Ultra (README) ; les encodeurs sont minuscules, le M1 suffit pour T1–T5 ; la 4090 sert aux balayages (T6–T8).

| # | Test | Prédiction si explication triviale vraie | Critère de réfutation de l'explication triviale | Coût |
|---|---|---|---|---|
| T1 | **Nul d'extrême pour B-3** : recalculer Me6 avec sonde n ∈ {64, 256, 1024, 4096} sur les checkpoints existants + nul par permutation (mélange des étiquettes « lésion ») et par bootstrap de la sonde | Me6 ∝ n^(−1/2) (≈ 0.13 → 0.065 → 0.033 → 0.016) et Me6 observé ≈ médiane du nul | Me6 reste > 0.1 à n = 4096 **et** au-dessus du 95e percentile du nul | M1, < 1 h, aucune ré-entraînement |
| T2 | **Contrôle sans lésion pour Me6** : construire P à partir de 5 arms intacts (graines différentes) | Me6_intact ≈ Me6_lésion | Me6_lésion − Me6_intact > seuil 0.02 sur ≥ 8/10 graines | M1, < 1 h |
| T3 | **Masquage** : remplacer les zéros de `query_accuracy` par (i) du bruit à −20 dB, (ii) la moyenne d'entraînement, (iii) un dropout de modalité vu à l'entraînement | Me6 et le signe des paires changent avec le masque | Structure de signe invariante au masque (corrélation de Spearman des 10 paires > 0.8) | M1, < 2 h |
| T4 | **Dimensionnalité** : permuter l'assignation dimension→modalité dans `GaussianWorld` (gravité en 256-D, vision en 3-D), ou égaliser à 32-D | L'asymétrie suit la dimension, pas l'étiquette perceptif/proprio | L'asymétrie suit l'étiquette après permutation | M1, 1 grille |
| T5 | **PID des mondes** : calculer R/U/S (pliang279/PID ou flow-pid) de (modalité_i, modalité_j ; Y) sur les 7 mondes | Gaussien : U ≈ 0, R ≈ H(Y) ; CC-film/Studyforrest : U > 0 | — (c'est une caractérisation préalable obligatoire à tout B-2) | M1, < 1 h |
| T6 | **Lésion réelle × survivants dégradés** (Kwak 2026) : v0.7 schedule (k = 50, −20 dB) croisé avec SNR des survivants {+20, +10, 0} dB | La récupération dépend de la qualité des survivants (interaction) | Pas d'interaction (Δ < 0.025) | 4090, 3 grilles × 20 graines |
| T7 | **Profondeur × durée** (Kleinman/Achille) : encodeurs 1/2/4/6 couches × STEPS_TRAIN {200, 2 000, 20 000}, Me7 et « optimization readiness » (Wang 2026) | B-1 apparaît seulement en profond-long | B-1 absent partout à N ≥ 20 → le lock est le seul mécanisme | 4090, ~1–2 j |
| T8 | **Taux de réparation α** (critical-period-lm) : Me1(T1) − Me1(T2) en fonction du budget de récupération {50, 100, 200, 400} pas, pente log-log par graine | α(T1) > α(T2) même quand l'écart final est nul | IC 90 % de α(T1) − α(T2) contient 0 à N = 20 | 4090, ~1 j |
| T9 | **Angle local (Wei 2026)** : régression non négative des codes de chaque SensoryWML sur les 5 entrées pré/post ; angle par module | Seul le module lésé change d'angle ; PR global stable (|ΔPR| < 5 %) | Changement global | M1, sur checkpoints existants |

T1–T4 suffisent à trancher B-3 ; si T1 et T2 confirment l'extrême, **B-3 doit être rétracté sur la magnitude aussi**, et la ligne « PASS » du README/ADR devient fausse.

---

## 8. Brainstorm : hypothèses falsifiables nouvelles (≥ 8 ; H5–H9 hors paradigme LLM/transformer)

| # | Énoncé | Prédiction quantitative | Test | Réfutation | Référence d'ancrage | Maturité |
|---|---|---|---|---|---|---|
| **H1** | B-3 est une statistique d'extrême du bruit d'échantillonnage | Me6 ≈ 1.54·√(2p(1−p)/n) ; à n = 64 → 0.12–0.14 ; à n = 4096 → < 0.02 | T1 + T2 | Me6 > 0.1 à n = 4096 et > P95 du nul | ADR-0014 balayage A (2.6 σ) ; Lakens 2017 | **prêt à préenregistrer** |
| **H2** | La « migration » n'existe que si les survivants portent de l'information **unique** ; dans un monde redondant ΔU = 0 | Monde « XOR inter-modal » (label = XOR(bit_audio, bit_tactile)) : ΔU_survivants ≥ +0.3 bit après lésion audio ; monde gaussien : |ΔU| < 0.05 | PID pré/post (T5) sur 2 mondes, 20 graines, TOST ±0.05 | ΔU_XOR < 0.1 bit | Liang 2023 PID ; SynIB 2026 ; Kamai 2026 | prêt (une fois T5 fait) |
| **H3** | Porte de profondeur : B-1 n'émerge qu'avec encodeurs ≥ 4 couches et ≥ 2 000 pas | Taille d'effet Me7 croît avec la profondeur (ρ > 0.8 sur 4 niveaux) ; nul en superficiel | T7 | Nul à toutes profondeurs, N ≥ 20 | Kleinman 2023 ; 2308.12221 | prêt |
| **H4** | L'estimand de période critique est un **taux de réparation**, pas un écart final : la lésion tardive se répare plus lentement | α(T1) − α(T2) ≥ 0.3 (échelle log-log, comme 0.39 dans critical-period-lm) | T8, 8–20 graines | IC 90 % ∋ 0 | `critical-period-lm` 2026 ; Achille 2019 | prêt |
| **H5** (hors LLM : SNN) | Dans un réseau LIF à **scaling synaptique homéostatique**, priver un flux démasque les synapses cross-modales faibles ; le gain cross-modal est proportionnel au facteur de scaling | Réponse de l'aire privée aux autres modalités ×(1.5–3) ; corrélation gain/scaling r > 0.7 ; sans homéostasie : gain < 1.2 | snnTorch/Brian2 sur M1, 2 aires × 3 modalités, 20 graines | Gain ≈ 1 ou gain sans scaling | Lee (CurrOpinNeurobiol 2015) scaling L2/3 ; Cramer et al. 2020 criticité BrainScaleS | **spéculatif, testable** |
| **H6** (hors LLM : substrat physique) | Sur un réseau d'oscillateurs γ/θ couplés (analogique/FPGA, Kuramoto), l'« asymétrie » après retrait d'un pilote est **entièrement** prédite par le degré du nœud (topologie), pas par l'étiquette sensorielle | R² (asymétrie ~ degré) > 0.9 ; permuter les étiquettes ne change rien | Simulation Kuramoto (M1) puis carte FPGA/ESP32 + DAC ; 10 topologies | R² < 0.5 ou dépendance à l'étiquette | KoPE/WONN/Kuramoto attention [déjà dans veille] ; Lisman & Idiart 1995 | spéculatif |
| **H7** (hors LLM : robot) | Une **voie courte** cross-modale préexistante (skip A1→V1, cf. Paré 2026) divise par ≥ 2 le temps de récupération après perte tardive d'un capteur réel (caméra occultée) sur un bras/quadrupède avec IMU + force + caméra | t_récup(skip)/t_récup(sans) ≤ 0.5 ; aucun effet sur la perte précoce | Contrôleur MTRNN (Heinrich 2020) avec/sans connexions latérales ; 10 répétitions physiques | ratio ∈ [0.8, 1.2] | Paré 2026 (V1 à 35 ms) ; Hwang & Tani 2018 | spéculatif |
| **H8** (hors LLM : biohybride) | Dans un organoïde en boucle fermée (Robbins 2026), couper l'un de deux groupes d'électrodes « sensoriels » après apprentissage produit une chute puis une **récupération partielle dans la fenêtre de 45 min** ; au-delà, rien | Récupération ≥ 50 % de la chute en < 30 min ; 0 après 45 min de repos | Protocole Cell Reports 2026 avec 2 canaux de stimulation ; n ≥ 6 organoïdes | Aucune récupération ou récupération persistante | Robbins et al. 2026 ; cadre éthique à instruire | **spéculatif** (accès plateforme) |
| **H9** (hors LLM : physique sonore) | Un agent entraîné sur des sons d'impact **simulés physiquement** (objets ronds vs pointus) et leurs formes, **sans langage**, reproduit bouba/kiki au niveau des poussins et macaques | Appariement ≥ 65 % (réf. 80/25 poussins ; 0.67/0.74 macaques) sur pseudo-mots synthétisés | Monde « Fort–Schwartz » (balance spectrale + continuité) + readout 2 choix ; 20 graines | ≤ 55 % | Fort & Schwartz 2022 ; Loconsole 2026 ; Loconsole et al. 2026 (macaques) | prêt (contrôle positif du benchmark) |
| **H10** | La privation réorganise **localement** (angle d'intégration par module), la hiérarchie globale est conservée | |Δangle| module lésé > 30° ; |ΔPR global| < 5 % ; modules intacts |Δangle| < 10° | T9 | Changement global ou aucun changement local | Wei et al. bioRxiv 2026 | prêt |
| **H11** | Le nul B-1 tient à l'absence de perte de plasticité : sous non-stationnarité prolongée (≥ 10 cycles lésion/restauration, ≥ 10 k pas), l'adaptation tardive se dégrade | Me1 post-lésion au cycle 10 < cycle 1 de ≥ 0.05 ; « optimization readiness » chute de ≥ 30 % | Boucle continue sur 4090, 20 graines | Adaptation stable (Δ < 0.025) | Dohare 2024 ; Wang 2026 ; Hernandez-Garcia 2026 | prêt |
| **H12** | La dose-réponse en U inversé recherchée par §5.5 vit sur l'axe **SNR de la fenêtre**, pas LOCK_AFTER : un bruit modéré pendant la fenêtre **améliore** la fusion, un bruit extrême la détruit | FG(SNR 0–10 dB) − max(FG(+20), FG(−20)) ≥ 0.05 | Infrastructure v0.9 (fenêtre w = 50) avec bruit au lieu de décorrélation, 20 graines, test de Page quadratique | Monotone ou plat | Grasse & Tata 2024/25 (McGurk) | prêt |

---

## 9. Concepts et intuitions nouveaux (tous **spéculatifs**, étiquetés)

1. **Plasticité = conversion redondance → unicité** [spéculatif, formalisable]. Une lésion ne « déplace » pas d'information ; elle change le budget PID. Métrique proposée : *taux de conversion* κ = ΔU_survivants / (−ΔR). κ ≈ 1 : réorganisation parfaite ; κ ≈ 0 : perte nette. Test : H2.
2. **Asymétrie topologique plutôt que sémantique** [spéculatif]. L'« asymétrie perceptif/proprioceptif » serait une fonction du degré/bande passante de chaque nœud dans le multiplexeur partagé. Prédit l'ordre des modalités sans aucune étiquette. Test : H6 (physique) et T4 (dimensionnel).
3. **Période critique comme vitrification** [spéculatif, analogie physique]. Le `constellation_lock_after` est un refroidissement brutal ; une vraie période critique serait un recuit : température effective T(t) décroissante (bruit de gradient/LR), fenêtre = intervalle où T est encore au-dessus de la « transition vitreuse » du paysage. Prédiction : temps de ré-adaptation ∝ exp(−(t_lesion − t_g)/τ). Lien avec Pawlak (LR cyclique = réchauffage) et Constantinescu (EWC = refroidissement imposé).
4. **Bouba/kiki sans langage comme contrôle positif obligatoire** [prêt à préenregistrer]. Un benchmark nommé `bouba_sens` qui ne teste jamais bouba/kiki manque son contrôle positif : si l'agent incarné (H9) ne reproduit pas un effet présent chez le poussin d'un jour, ses « réorganisations » n'ont pas de validité externe.
5. **Lésion = trajectoire dans le diagramme de phase de Kamai** [spéculatif]. Sévérité et durée d'une lésion déplacent le monde entre régimes (Both → CP-only → Neither). La « plasticité » se lirait comme la capacité à rester dans un régime où l'objectif cross-modal bat la meilleure modalité seule ; prédit la frontière d'« unimodal collapse » en fonction du SNR.
6. **Estimand trajectoire** [prêt]. Remplacer les points finaux (Me7, ΔMI) par des exposants de réparation (H4) et des angles locaux (H10) ; c'est ce que mesurent à la fois `critical-period-lm` et la neuroscience 2026 (Paré, Qiao : dynamique sur des mois).
7. **Deux voies à échelles multiples au lieu d'un multiplexeur unique** [spéculatif, architecture]. Hwang & Tani / Heinrich : voies parallèles à constantes de temps distinctes couplées latéralement ; une lésion n'y est pas symétrique par construction, ce qui donnerait un B-3 **prédit** par les constantes de temps et non postulé.

---

### Limites de cette revue
Budget WebSearch de session épuisé après 17 requêtes (≥ 12 demandées) ; API arXiv throttlée pendant une partie de la session puis relancée (requêtes « cross-modal plasticity », « equivalence testing », « PID multimodal », listing auteur Kleinman complétées au second passage) ; corps des articles Science (erratum) et Proc B non lus (notes a–b du §2). Aucun résultat numérique n'a été recalculé ; les ordres de grandeur du §3-B-3(a) sont analytiques (loi binomiale, espérance du maximum de 10 demi-normales ≈ 1.54 σ) et doivent être confirmés par T1.

---

## Résumé (≤ 15 lignes)

1. Rien dans la littérature 2024–2026 ne sauve B-1 ni B-2 tels que formulés ; **B-3 ne survit pas** à cinq explications triviales, la première suffisant : à n = 64 par cellule, l'espérance du max de 10 différences d'accuracy sous l'hypothèse nulle vaut ≈ 0.13, soit exactement la plage « PASS » 0.109–0.125 ; aucune ADR n'a comparé la magnitude Me6 à un nul (seule la partition l'a été). Avec ADR-0020 (lésion jamais > ~19 dB), B-3 décrit des réseaux intacts.
2. B-1 : Kleinman 2023 prédit **l'absence** de période critique pour des encodeurs superficiels ; Constantinescu (TACL 2025) montre qu'elle n'émerge pas de l'apprentissage statistique seul ; 200 pas sont très loin du régime de perte de plasticité (Dohare 2024, Hernandez-Garcia 2026). Le protocole préenregistré `critical-period-lm` (août 2026) propose le bon estimand : un **taux de réparation**, pas un écart final.
3. B-2 : dans le monde gaussien, les 5 modalités projettent le **même** z → information de label entièrement redondante → migration indéfinissable ; la littérature PID 2025–26 (Liang 2023, flow-PID, Fang ICML 2026, SynCo, survey Wen 2026) rend la MI totale obsolète comme mesure de réorganisation : mesurer R/U/S et la décodabilité des survivants.
4. v0.7 (TOST, N = 95 sur UCL80 à la Knopov & Shvai) et v0.8/v0.9 sont **prêts à préenregistrer** et méthodologiquement solides ; leur limite est l'estimand (code fusionné, sous-espace de représentation vs paramètres chez Sui, décorrélation déjà faite par Kleinman) plus que la statistique.
5. Neurosciences 2026 (Wei et al. bioRxiv ; Paré et al. ; Kwak et al.) : la privation réorganise **localement** (angle d'intégration), la hiérarchie globale est conservée, l'onset n'explique pas tout, la modalité survivante conditionne la compensation → métriques locales et croisement lésion × survivants.
6. Bouba/kiki existe sans langage chez le poussin (Science, fév. 2026, erratum mai), le macaque (bioRxiv août) et le chien (Proc B, 7 oct.) ; les VLM ne le montrent pas de façon robuste (Kouwenhoven NeurIPS 2025 ; Hong sept. 2026). Un benchmark nommé `bouba_sens` doit l'inclure comme **contrôle positif** (monde physique à la Fort & Schwartz, H9).
7. Tests décisifs sur M1 (< 1 j, sans ré-entraînement) : T1 nul d'extrême par n croissant, T2 contrôle intact, T3 masque, T4 permutation des dimensions, T5 PID des mondes ; sur 4090 : profondeur × durée (T7), taux de réparation (T8), lésion × SNR survivants (T6).
8. Douze hypothèses falsifiables dont cinq hors LLM (SNN homéostatique, oscillateurs physiques, robot avec voie courte, organoïde en boucle fermée, agent de physique sonore) ; concepts spéculatifs : plasticité = conversion redondance→unicité, asymétrie topologique, période critique = vitrification, lésion = trajectoire dans le diagramme de phase de Kamai.
9. Données réelles : aucun dataset HF à 5 canaux synchrones ; meilleur pont = `Voxel51/TaF-Tactile-Force` (3 canaux contact/force, MIT) ⊕ flux audio-visuel ; `eidon-ai/tracker-pov-imu` pour une gravité réelle ; PTB-XL pour étendre l'ECG.
10. Action immédiate : si T1–T2 confirment l'extrême, rétracter B-3 **sur la magnitude** et corriger README/ADR ; ne pas préenregistrer v0.7–v0.9 sans ajouter la décodabilité/PID comme co-primaires et le contrôle positif bouba/kiki.
