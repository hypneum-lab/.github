# R11 — Mathématiques structurales pour formaliser Hypneum

Évaluation d'axe de recherche · Hypneum Lab · 2026-10-24 · lecture seule des dépôts `dream-of-kiki`, `nerve-wml`, `kiki-flow-research`, `bouba_sens` (état du 2026-10-23).

Méthode : 19 recherches web (budget épuisé ensuite), 8 recherches GitHub + 19 fiches dépôts (`gh repo view`, puis quota), 5 recherches « papers » + 3 « datasets » Hugging Face, ~45 références vérifiées une à une sur leur page arXiv/éditeur (titre, auteurs, date). L'API arXiv (`export.arxiv.org`) a renvoyé des réponses vides depuis ce sandbox ; les dates ci-dessous viennent des pages `arxiv.org/abs`. Toute référence non revérifiée est marquée **[NV]**.

Étiquettes : **PRÊT** = préenregistrable maintenant (données ou code existants) ; **PILOTE** = un essai bon marché avant préenregistrement ; **SPÉC** = spéculatif, avec test.

---

## 1. Énoncés actuels et leur problème

### 1.1 DR-3 (dream-of-kiki)

`kiki_oniric/axioms/__init__.py:182-199` (identique à la spec `docs/specs/2026-04-17-dreamofkiki-framework-C-design.md:492-500`) :

> "∀ substrate S, if S satisfies the Conformance Criterion below, then DR-0, DR-1, DR-2 (or DR-2') are empirically validated on S (operational sense, see §6.2 'Operational statement' ; not a formal implication — DR-2 itself remains a weakened axiom with precondition, §6.2)."

Critère de conformité, spec `…framework-C-design.md:510-522` :

> "a substrate S instantiates the framework iff all three conditions hold: 1. Signature typing — S implements the typed Protocol signatures of primitives α, β, γ, δ, 1, 2, 3, 4 […] 2. Axiom property tests — the property test suite for DR-0, DR-1, and DR-2 (or DR-2') passes on S […] 3. BLOCKING invariants enforceable — invariants S1 […], S2 (no NaN/Inf), S3 (hierarchy valid), and I1 […] are implemented as runtime checks on S […]"
> "conforms(S) ≜ typed(S) ∧ axiom_tests_pass(S) ∧ invariants_enforced(S, {S1,S2,S3,I1})"

Reformulation du 2026-10-23, `docs/papers/paper1/full-draft.md:1114-1126` :

> "Our substrate-agnosticism claim does not require that the MLX, E-SNN and LoRA substrates share one global representation or one metric geometry ; it requires only that a *conformant* substrate preserves the *relational* operational structure the Conformance Criterion checks — that the same consolidation operations, composed in the same order, produce neighbourhood-equivalent episode states. […] DR-3 is therefore anchored to relational structure, not metric geometry."

**Problème.** (i) `conforms(S)` ne mesure *aucune* structure relationnelle : c'est typage + les tests d'axiomes eux-mêmes (circularité reconnue, spec l. 525-531) + des gardes NaN/topologie. Un substrat peut passer `conforms(S)` et produire des états d'épisodes arbitraires. (ii) « neighbourhood-equivalent episode states » n'a ni métrique, ni nul, ni seuil nulle part dans le code (`grep -ri knn dream-of-kiki/tests/conformance` → rien). (iii) Le dossier d'évidence `docs/proofs/dr3-substrate-evidence.md:1-55` constate lui-même que la réplication à deux substrats « strengthens the *architectural* claim […] it does not yet carry a cross-substrate empirical claim ». DR-3 reformulé est donc aujourd'hui **non falsifiable** : il n'y a pas d'observation qui pourrait le réfuter.

### 1.2 Test (6) (nerve-wml)

`papers/paper1/main.tex:414-420` :

> "**(6) Post-hoc validation via mutual-kNN alignment (v1.5.2).** […] we apply their mutual_knn alignment kernel to the continuous pre-VQ embeddings of MLP and LIF trained on HardFlowProxyTask (d=16, 12-class). For each sample in a held-out batch of N=1024, we compute the overlap between its k nearest neighbours in each substrate's embedding space under cosine similarity."

Table l. 424-438 : k=10 → chance 0.0098, random 0.0093, MLP↔LIF 0.174 (18.8×). Nul = « two independent N(0,1) tensors ». Règle de décision du script `scripts/platonic_rh_alignment.py:17-19` :

> "alignment > max(3 x random_baseline, 0.05) => substrates converge => local confirmation of Platonic RH on heterogeneous substrates."

Paragraphe « Global versus local alignment », `main.tex:450-479` : « Our claim is deliberately the relational, neighbourhood-level one. […] We have not computed a global relational measure such as H₀ skeleton overlap, so we make no claim either way about global relational structure. »

**Problème.** (i) Le nul i.i.d. gaussien ne contrôle ni la structure d'entrée partagée (Cui et al. 2022 : deux réseaux *non entraînés* sur les mêmes entrées ont déjà une CKA de 0,99), ni la capacité (Gröger et al. 2026), ni la graine. (ii) Le seuil « 3× ou 0,05 » est ad hoc, non préenregistré, et dépend de k/N (Koepke et al. 2026). (iii) « local, pas global » est un **non-résultat** (mesure non calculée), pas une conclusion. (iv) mutual-kNN exige des échantillons appariés un-à-un et est une mesure de *décodage* : Bertram et al. 2026 montrent que RSA/CKA/Procrustes ne voient pas la topologie d'encodage. (v) Le mot « local » recouvre deux choses que You et al. 2026 séparent — l'échelle et la nature (relationnelle vs métrique) de ce qui est comparé.

### 1.3 Invariants nerve-wml

`nerve_core/invariants.py:5-14` ≡ spec `docs/superpowers/specs/2026-04-18-nerve-wml-design.md:152-160` : N-1 silence légitime ; N-2 `send()` idempotent sur `(src, dst, code, timestamp)` ; N-3 `role == ERROR ⟺ phase == THETA` ; N-4 poids de routage ∈ {0,1} après élagage ; N-5 chaque WML possède son codebook (test d'identité d'objet, l. 72-93) ; W-1 `step()` ne mute pas un autre WML ; W-2 `parameters()` inclut le codebook ; W-3 pas d'accès au routage dans `step()` ; W-4 `id` stable. Alphabet : `nerve_core/neuroletter.py:3` « Alphabet size is fixed at 64 (codon-like, ~6 bits) », `code: int  # 0..63`.

**Problème.** Neuf propriétés de **sûreté** (prédicats d'état ou de trace locale), zéro propriété de **vivacité** (rien n'exclut un protocole mort qui ne transmet jamais rien : N-1 rend le silence légal, aucun invariant n'exige qu'une ERROR soit suivie d'une PREDICTION). N-5 est satisfait par deux tenseurs identiques en valeur mais distincts en mémoire. Aucun invariant ne parle de l'*information* portée par les neuroletters. La « suite de conformité exécutable » est donc une collection d'assertions, pas (encore) un objet mathématique.

---

## 2. État de l'art par sous-axe

Relation : **appuie** / **contredit** / **dépasse** (rend caduque ou absorbe la formulation actuelle) / **neutre**.

### (a) Alignement relationnel — GW, RSA/CKA, PRH 2025-2026

| Réf | Date | Résultat | Relation à Hypneum | Dépôt |
|---|---|---|---|---|
| You, Jang, Mo, Jung — *What Converges in the PRH? Structure over Geometry* (arXiv:2609.27252) | 23/09/2026 | Cadre 2×2 (relationnel/métrique × local/global) ; la structure relationnelle converge aux deux échelles après calibration, la géométrie métrique beaucoup moins ; mKNN et H₀-skeleton overlap corrélés ρ=0,968 | **appuie** la reformulation DR-3 ; **dépasse** le test (6) : l'opposition local/global confond échelle et nature | — |
| Shi, Han, Li, Thompson, Hernández-Lobato — *From Plato to Aristotle: Lattice Representation Hypothesis* (arXiv:2610.20286) | 14/10/2026 | Les critères d'alignement forment un treillis ; le spanning-tree overlap de You et al. « mostly repeats one-nearest-neighbor overlap » ; la convergence globale reste ouverte | **contredit** l'usage de H₀-skeleton comme mesure globale ; **appuie** l'idée de rapporter un *profil* plutôt qu'un scalaire | EEthanShi/LRH ★2 |
| Gröger, Wen, Brbić — *Aristotelian View* (arXiv:2602.14486, ICML 2026) | 16/02/2026 | CKA/SVCCA/Procrustes gonflés par la taille ; calibration par nul de permutation ; seules les mesures de voisinage gardent leur tendance | **appuie** ; impose le nul de permutation au test (6) | mlbio-epfl/Aristotelian ★42, MIT, push 2026-10-14 |
| Koepke, Zverev, Ginosar, Efros — *Back into Plato's Cave* (arXiv:2604.18572) | 20/04/2026 | mKNN à k fixe s'effondre quand N passe de 1K à 1M ; il faut k ∝ N ; alignement = structure grossière seulement | **contredit** la lecture « 18,8× » à N=1024, k=10 ; impose de rapporter k/N | akoepke/cave_umwelten ★16 |
| Shang et al. — *Displacement Geometry* (arXiv:2609.24209) | 21/09/2026 | Ce qui est partagé : les *directions de déplacement* entre échantillons sous une seule transformation orthogonale, pas les positions ; le fine-tuning casse les déplacements mais pas la similarité ponctuelle | **dépasse** : propose une 3ᵉ nature (déplacements) entre relationnel et métrique | — |
| Bangachev, Bresler, Polyanskiy — *Representation Alignment Rests on Linear Structure* (arXiv:2605.28870) | 22/05/2026 | Signal/biais/bruit ; centrage+normalisation changent l'alignement ; SAE améliorent l'alignement | **appuie** : figer le prétraitement dans les préenregistrements | — |
| Bertram, Dyballa, Keller, Kinger, Zucker — *Decoding Alignment without Encoding Alignment* (arXiv:2605.05907 v2) | 07/05→09/10/2026 | RSA, CKA, Procrustes R² insensibles à la topologie d'encodage (MNIST contrôlé) ; proposent variétés d'encodage + **distance de Gromov-Wasserstein** comme diagnostic complémentaire | **appuie fortement** GW pour DR-3 ; **contredit** mKNN seul pour le test (6) | — |
| Schnaus, Dagès, Cremers, Wang, Isola — *Shared Geometry as a Rosetta Stone* (arXiv:2610.09411) | 07/10/2026 | Alignement inter-modal **sans paires** par Wasserstein-Procrustes + initialisation géométrique grossière ; les métriques géométriques prédisent la faisabilité | **appuie** l'alignement sans correspondance (cas E-SNN vs LoRA) | — |
| Houry, Feydy, Vialard — *Gromov-Wasserstein at Scale, Beyond Squared Norms* (arXiv:2602.06658, ICML 2026, PMLR 306) | 06/02→05/10/2026 | Solveur GW mémoire linéaire, temps quadratique, « hundreds of thousands of points in minutes », différentiable | **neutre/appuie** : lève l'objection de coût | — |
| Gong, Rioux, Goldfeld — *Sliced Inner Product GW* (arXiv:2605.08546) | 08/05/2026 | Variante tranchée, invariante par rotation, appliquée à la comparaison de modèles de langue | **appuie** (outil) | — |
| Karumanchi, Goldfeld, Kato, Zhang — *GW Gradient Flows* (arXiv:2608.19198) | 19/08/2026 | Flot de gradient GW de l'entropie relative : non-convexité, convergence exponentielle via Fokker-Planck | **dépasse/pont** vers kiki-flow (flot sur *structures*) | — |
| Beier, Eckstein — *GW Quantization and Clustering* (arXiv:2608.11016) | 11/08/2026 | k-means version GW, algorithme de Lloyd | **appuie** (f) : quantifier un codebook par structure | — |
| Takeda, Abe, Kitazono, Oizumi — iScience 28(5):112427 | 15/04/2025 | GWOT aligne sans étiquettes des représentations Neuropixels/fMRI entre individus ; RSA élevé peut masquer des différences fines | **appuie** GW comme standard neuro | oizumi-lab/GWTune ★24, sans LICENSE, push 2025-02-15 |
| Kawakita et al. — *GW unsupervised alignment… color similarity… humans and LLMs*, Sci. Rep. 2024 (s41598-024-65604-1) **[NV auteurs]** | 2024 | GWOT humains vs GPT sur 93 couleurs | **appuie** | idem |
| Achara et al. — *Multi-Way Representation Alignment* (arXiv:2602.06205 v2) | 05/02→04/07/2026 | Procrustes généralisé corrigé (GCPA) pour M ≥ 3 modèles | **neutre** (métrique, pas relationnel) ; utile si 3+ substrats | — |
| Landau, Keren — *Beyond Plato and Aristotle* (arXiv:2607.17800, ICML 2026 oral) | 20/07/2026 | L'évidence d'alignement ne porte pas de conclusion métaphysique | **appuie** la prudence de Paper 1 | — |
| Ziyin, Chuang — *Proof of a perfect PRH* (arXiv:2507.01098 v2) | 07/2025→12/2025 | Réseaux linéaires profonds « parfaitement platoniciens » à rotation près sous SGD | **neutre** (cas linéaire) | — |
| Cui, Kumar, Marttinen, Kaski — *Deconfounded Representation Similarity* (NeurIPS 2022, arXiv:2202.00095) | 2022 | Réseaux non entraînés CKA 0,99 vs entraînés 0,95 : confondeur = similarité des entrées | **contredit** le nul gaussien du test (6) | — |
| Klabunde et al. — survey ACM CSUR 57(9) 2025 (arXiv:2305.06329 v4) | 2023→04/2025 | Catalogue des mesures représentationnelles/fonctionnelles | **neutre** (référence) | wrongu/repsim ★26 MIT |
| Mémoli 2011 (FoCM) ; Peyré-Cuturi-Solomon ICML 2016 ; Chowdhury-Mémoli 2019 ; Vayer et al. NeurIPS 2019 (sliced/fused) ; Séjourné-Vialard-Peyré NeurIPS 2021 (unbalanced GW) ; Scetbon-Peyré-Cuturi ICML 2022 (low-rank) | — | Fondements GW : distance entre espaces métriques mesurés, sans géométrie commune | **appuie** : candidat direct DR-3 | PythonOT/POT ★2858 |

### (b) Topologie des données

| Réf | Date | Résultat | Relation | Dépôt |
|---|---|---|---|---|
| Fay, García-Redondo, Wang, Dubossarsky, Monod — *Shape of Adversarial Influence* (arXiv:2505.20435 v3) | 05/2025→24/04/2026 | PH sur activations de 6 LLM (3,8B-70B) : « topological compression » sous injection/backdoor | **appuie** (c-concept 4) : la consolidation comme compression topologique | — |
| Malhotra et al. (Monod) — *Tracking Representation Dynamics with PH* (arXiv:2606.19542) | 17/06/2026 | PH pendant le SFT (1B-7B) : pic topologique précoce puis stabilisation ; trajectoires distinguables selon l'objectif | **appuie** : PH comme traceur de consolidation | — |
| Jiang et al. — *TIPS* (arXiv:2606.23590 v2) | 22/06→04/10/2026 | H₀/H₁ des états cachés d'un prompt → 7 descripteurs ; pilotage | **neutre** (méthode réutilisable) | — |
| You, Kang, Jung — *Topological Alignment of Shared VL Embedding Space* (arXiv:2510.10889 v2) | 13/10/2025→04/03/2026 | Perte d'alignement par PH avec sparsification de graphe et bornes d'erreur | **appuie** : PH *comme critère d'alignement* différentiable | — |
| García-Castellanos, Marchetti, Kragic, Scolamiero — *Relative Representations: Topological and Geometric Perspectives* (arXiv:2409.10967 v3) | 09/2024→24/10/2025 | Représentations relatives normalisées (invariance échelle/permutation) + perte de clustering topologique pour le *stitching* | **appuie** : le stitching zéro-shot est un test de substrat-agnosticisme | — |
| Songdechakraiwut, Yin, Van Veen — *Topological Continual Learning with Wasserstein Distance and Barycenter* (arXiv:2210.02661) | 10/2022 | Régularisateur PH (cycles du 1-squelette) + mémoire épisodique contre l'oubli | **appuie** (seul précédent TDA × CL trouvé ; rien en 2025-26) | — |
| Sen, Singh, Tiwari — *Three Axis Evaluation for Mapper* (arXiv:2606.21688) | 19/06/2026 | Stabilité / qualité de clusters / forme : critères en conflit, aucune variante dominante | **neutre** ; met en garde contre Mapper sans protocole | — |
| Madukpe et al. — revue Mapper 2007-2025 (arXiv:2504.09042) | 12/04/2025 | Revue des filtres/clusterings | **neutre** | — |
| Rieck et al. — *Neural Persistence* (ICLR 2019) ; Zomorodian-Carlsson 2005 | — | PH sur poids ; fondements | **neutre** | ripser.py ★346, GUDHI ★330 |

### (c) Théorie des catégories et faisceaux

| Réf | Date | Résultat | Relation | Dépôt |
|---|---|---|---|---|
| Gavranović et al. — *Categorical Deep Learning* (ICML 2024, PMLR 235:15209) | 2024 | Monades sur 2-catégorie de cartes paramétriques comme théorie des architectures | **neutre** : cadre, pas de prédiction mesurable | bgavran/Category_Theory_Machine_Learning (liste) |
| Crescenzi — survey (arXiv:2410.05353 v2) | 10/2024 | Optiques, algèbres, diagrammes de cordes ; pas de faisceaux | **neutre** | — |
| Gauderis et al. — *From Mechanistic to Compositional Interpretability* (arXiv:2605.08934) | 09/05/2026 | Explications = paires d'applications dont la cohérence avec le modèle est vérifiée formellement | **appuie** l'idée « conformité = diagramme commutatif vérifié » | — |
| Hansen-Ghrist 2019 (J. Appl. Comput. Topol.) ; Hansen-Gebhart *Sheaf NN* (arXiv:2012.06333) ; Bodnar et al. NSD (NeurIPS 2022) | — | Faisceaux cellulaires, laplacien de faisceau = désaccord, sections globales = consensus | **dépasse** : N-5 + transducteurs *sont* un faisceau cellulaire sur le graphe de routage | twitter-research/neural-sheaf-diffusion ★101 (2023) |
| Hanks et al. — *Distributed Coordination over Cellular Sheaves* (arXiv:2504.02049) | 04/2025 | ADMM distribué sur laplaciens de faisceau non linéaires : consensus, formation, flocking | **appuie** (c-concept 3) | — |
| Seely, Cupiał, Jones — *Sheaf-ADMM* (arXiv:2605.31005, ICML 2026) | 29/05/2026 | Agents à vues partielles négocient via projections linéaires apprises ; différentiable | **appuie** : prototype d'un « nerf » faisceautique | SakanaAI/sheaf-admm, Apache-2.0 |
| Bourgerie, Girdzijauskas, Fodor — *Deep NSD* (arXiv:2605.19021, GFM@ICML 2026) | 18/05/2026 | Le signal de désaccord du laplacien s'éteint en profondeur ; adjacence de faisceau + gating | **neutre** (ingénierie) | — |
| Hernández, Sánchez-Soto — *Sheaf Framework for Strategic MAS* (arXiv:2606.01663) | 01/06/2026 | Équilibres de Nash = sections globales ; obstructions cohomologiques = incohérences | **neutre/SPÉC** | — |
| Olivieri, Hernández — *Sheaf-Theoretic Transport and Obstruction* (arXiv:2605.14033) | 13/05/2026 | Score d'obstruction pour décider si un cadre représentationnel s'étend à un nouveau régime | **appuie** (c-concept 3 : obstruction H¹) | — |
| Castro-Perez, Ferreira, Jongmans — *Synthetic MPST* (arXiv:2511.22692) | 27/11/2025 | Types de session multipartites vérifiés contre un LTS global, mécanisés en Agda | **appuie** (e) : le protocole nerve comme type de session | — |
| Farshim, Karvonen, Knispel, Kohlweiss, Wadler — *UC, Categorically* (arXiv:2608.04521) | 05/08/2026 | Composition de protocoles prouvée par diagrammes de cordes vérifiables | **appuie** (e) | — |
| Thomas, Saad, Strinati — *Compositional Semantic Communication* (arXiv:2607.18115) | 20/07/2026 | Topologies de Grothendieck/préfaisceaux pour composer des messages d'appareils | **neutre/SPÉC** | — |
| Coecke, Sadrzadeh, Clark — DisCoCat (2010) | 2010 | Catégories monoïdales compactes pour la composition sémantique | **neutre** : les neuroletters n'ont pas de grammaire ; faible priorité | — |

### (d) Géométrie de l'information, WFR, JKO

| Réf | Date | Résultat | Relation | Dépôt |
|---|---|---|---|---|
| Duan, Hertrich, Steidl — *Neural Sampling… WFR JKO* (arXiv:2610.10278) | 07/10/2026 | JKO pour KL en géométrie Wasserstein-Fisher-Rao ; convergence exponentielle pour tout pas fixe sans log-concavité | **appuie** (d-concept 5) : la réaction FR comme opération de consolidation | — |
| Rahimi — *Weighted SDE for WFR flow* (arXiv:2512.17878) | 19/12/2025 | WFR par SDE pondérées (Feynman-Kac) | **appuie** (outil) | — |
| Gallouët-Monsaingeon — *JKO splitting for Kantorovich-Fisher-Rao* (SIAM J. Math. Anal. 2017, arXiv:1602.04457) | 2016/17 | Pas JKO = transport W₂ puis réaction Hellinger | **dépasse** : donne un sens exact à la *non-commutativité* des ops de rêve (DR-2) | — |
| Liero-Mielke-Savaré (Invent. Math. 2018) ; Chizat-Peyré-Schmitzer-Vialard (FoCM 2018) | 2018 | Distance Hellinger-Kantorovich / WFR | fondements | POT (FUGW), thibsej/unbalanced_gromov_wasserstein ★50 MIT |
| Li-Montúfar — *Natural gradient via OT* (Inf. Geom. 2018, arXiv:1803.07033) ; Amari 1998 | 2018 | Le gradient naturel de Wasserstein ; JKO en espace de paramètres | **appuie** : lie kiki-flow (JKO) et Amari (FR) | — |
| Caucheteux-Bonet-Korba (arXiv:2605.31369, ICML 2026) ; Han et al. W-Flow (arXiv:2605.11755) ; Segal-Ambati JKO-RAG (arXiv:2607.24776) | 2026 | Déjà dans la veille ; cadre des flots génératifs | positionnement kiki-flow | — |
| Torbati, Gaebler, Hofmann, Scherf — *Ollivier-Ricci… representational alignment* (arXiv:2501.00919 v2, NeuReps@NeurIPS 2024) | 01→10/2025 | Courbure de Ricci discrète révèle des différences d'alignement que RSA manque | **appuie** (mesure géométrique locale intermédiaire) | — |

### (e) Méthodes formelles pour protocoles

| Réf | Date | Résultat | Relation | Dépôt |
|---|---|---|---|---|
| Zheng, Zhang — *AgentRFC* (arXiv:2603.23801) | 25/03/2026 | 11 principes en invariants TLA+ ; phase 1 model-checking, phase 2 **rejeu des contre-exemples contre les SDK réels** | **appuie** : modèle à copier pour N-1..N-5 | — |
| RFC2TLA+ (Ding et al., ASE 2026, Toronto) **[NV page PDF]** | 2026 | Extraction de specs TLA+ depuis des RFC | **neutre** | — |
| SysMoBench (arXiv:2509.23130) | 09/2025 | Alloy/TLA+/PAT : traces concrètes → faits Alloy | **neutre** (outil d'évaluation) | — |
| Castro-Perez et al. MPST Agda (ci-dessus) | 11/2025 | Conformité processus/protocole global sans projection | **appuie** | — |
| Miller — *Vlasov mean-field in Lean 4* (arXiv:2607.08986 v2) | 07/2026 | Couche OT réutilisable : W₁ + dualité Kantorovich-Rubinstein, 49 déclarations sur Mathlib seul | **appuie** : W₁ formalisable, W₂/Sinkhorn non | leanprover-community/mathlib4 ★4351 |
| Mathlib `InformationTheory.KullbackLeibler.Basic` (`klDiv`, `klDiv_eq_zero_iff`, Gibbs) ; `InformationTheory.Hamming` | vérifié 24/10/2026 | KL et distance de Hamming formalisées ; **pas** d'information mutuelle ni de Wasserstein dans Mathlib | **neutre** : Lean utile pour DR-2 (preuve sur listes d'ops), pas pour GW | — |
| Lamport TLA+ ; Jackson Alloy ; MacIver *Hypothesis* (JOSS 2019) ; Quint/Apalache (Informal Systems) | — | Model checking, PBT à états (`RuleBasedStateMachine`) | **appuie** | tlaplus ★3138 MIT ; quint ★1874 Apache-2.0 ; hypothesis ★9108 MPL-2.0 ; Alloy ★877 |

### (f) Théorie de l'information sur codes discrets

| Réf | Date | Résultat | Relation | Dépôt |
|---|---|---|---|---|
| Chauhan, Bera — *Emergence, Not Bandwidth* (arXiv:2609.34373) | 09/2026 | Bornes sur Dec-POMDP à débit limité ; émetteur optimal de référence ; l'échec est d'émergence, pas de capacité | **contredit** une lecture « capacité » naïve de l'alphabet 64 ; impose l'émetteur de référence (déjà dans l'avenant N10-C) | — |
| Kaszyński — *Emergent Compositional Communication for Latent World Properties* (arXiv:2604.03266) | 18/03/2026 | Goulot Gumbel-Softmax + apprentissage itéré ; allocation de bande ∝ extractibilité (r=0,964) | **appuie** : lire le codebook 64 en termes débit-distorsion | — |
| Prystawski, Arumugam, Goodman — *Lossy communication constrains iterated learning* (arXiv:2511.18220 v2) | 11→12/2025 | Transmission à débit limité : seuils non linéaires ; borne de population | **appuie** (f-hyp. 9 : coude de capacité) | — |
| Meng et al. — *Channel-Aware VQ* (arXiv:2510.18604) | 21/10/2025 | Codebooks VQ tenant compte des probabilités de transition : symboles confondables ↦ codes sémantiquement proches | **appuie** (f-concept 6 : dégénérescence codon) | — |
| Shannon 1948 ; Blahut 1972 / Arimoto 1972 ; Reed-Solomon sur GF(64) | — | Capacité du canal 64-aire symétrique C(p) = 6 − H_b(p) − p·log₂63 bits/symbole ; RS de longueur ≤ 63 symboles | **appuie** : formules fermées pour un seuil préenregistrable | — |

---

## 3. Propositions de formalisation (métrique, nul, seuil, procédure, coût)

### 3.1 Objet relationnel commun

Pour tout substrat S conformant et tout ensemble d'épisodes E = {e₁…e_N}, définir **R(S, E)** = la matrice N×N des distances (cosinus, après centrage et normalisation **figés** — Bangachev et al.) entre les représentations internes des N épisodes *après* le cycle de rêve. Tous les substrats de dream-of-kiki exposent ces représentations (`GammaSnapshotProtocol` / `DeltaLatentsProtocol`, `kiki_oniric/core/primitives.py`) ; dans nerve-wml ce sont les embeddings pré-VQ déjà extraits par `platonic_rh_alignment.py`. R(S,E) est un espace métrique mesuré fini : c'est l'objet sur lequel GW, mKNN et PH sont tous définis.

### 3.2 Échelle de conformité relationnelle à trois niveaux (treillis explicite, cf. Shi et al.)

| Niveau | Mesure d_ℓ | Nature | Correspondance requise ? | Coût (M1 Max, N=1024) |
|---|---|---|---|---|
| L0 voisinage | mKNN(k) pour k ∈ {5,10,20,50}, rapporté comme (mKNN − k/N)/(1 − k/N) | relationnel local | oui (épisodes appariés) | < 1 s ; nul de permutation 1000× : secondes |
| L1 structure | **GW₂ entropique** entre R(S,E) et R(S₀,E) (POT `ot.gromov.entropic_gromov_wasserstein`, ε réglé par GWTune-style sur 10 inits) | relationnel toutes échelles | **non** | ~1 s/appel ; 1000 bootstraps ≈ 20 min |
| L2 topologie | distance de Wasserstein-2 entre diagrammes de persistance H₀ et H₁ de la filtration de Rips de R(S,E) (ripser.py + GUDHI `wasserstein_distance`) | topologique | non | H₀ : secondes ; H₁ : ≤ 2 min, sous-échantillonner à 512 si N > 2000 |
| M (contrôle) | CKA calibrée (Aristotelian) et Procrustes R² | **métrique** | oui | secondes |

### 3.3 Trois références obligatoires

- **N0 — plancher de graine** : d_ℓ(S₀^{seed a}, S₀^{seed b}), même substrat, graines différentes (≥ 5 paires). C'est la borne basse naturelle : aucun substrat étranger ne peut être « plus pareil » qu'une re-graine.
- **N1 — nul par permutation** (Gröger et al.) : permutation des identités d'épisodes dans un des deux R. **Attention : vide pour GW et PH**, qui sont invariants par réétiquetage. Ne s'applique qu'à L0 et M.
- **N2 — nul « structure détruite »** : (i) paire de substrats **non entraînés** sur les mêmes épisodes (contrôle du confondeur d'entrée, Cui et al. 2022) ; (ii) nuage gaussien i.i.d. de même N et dimension (l'actuel `random` de nerve-wml, à garder comme borne haute). S'applique à tous les niveaux.

### 3.4 Indice de conformité relationnelle et décision

**RCI_ℓ(S) = (d_ℓ(S,S₀) − med N0) / (med N2(i) − med N0)**, borné à [0,1]. Hypothèse DR-3 relationnelle au niveau ℓ, à préenregistrer :

- H_DR3(ℓ) : RCI_ℓ(S) ≤ 0,25 **et** borne supérieure de l'IC 95 % (bootstrap sur épisodes × graines) < 0,5 ; test d'équivalence TOST contre N0 avec SESOI = 1,5 × med N0 (la revendication est une *équivalence*, pas une différence — cohérent avec le harnais E1 TOST déjà livré dans dream-of-kiki).
- Réfutation : RCI_ℓ > 0,5 ou IC chevauchant N2(i). Correction Holm sur les 3 niveaux ; α = 0,05.
- Le substrat est dit **DR-3-conformant relationnel** si L0 ∧ L1 passent ; **topologiquement conformant** si L2 passe en plus ; le niveau M est rapporté sans entrer dans la décision (on ne prétend plus rien sur la géométrie métrique, mais on la *mesure* — pour pouvoir falsifier plus tard « métrique ≠ » par un TOST propre).

Ce qui change par rapport à `conforms(S)` : on ajoute une **condition 4 — conformité relationnelle** au Critère de conformité, exécutable (`dream-harness conformance --substrate S --relational`), avec un verdict chiffré et une référence S₀ = `mlx_kiki_oniric`. Les conditions 1-3 restent (ce sont des préconditions d'exécution), mais la phrase « neighbourhood-equivalent episode states » devient RCI_L0 ≤ 0,25.

### 3.5 Test (6) reformulé : « profil de treillis » au lieu de « local vs global »

1. Figer : N = 1024 **et** 4096 (pour mesurer la pente en k/N), k ∈ {5,10,20,50}, prétraitement (centrage, normalisation L2), graines ≥ 5.
2. Calculer le vecteur **Π = (mKNN_k/N calibré ×4, GW₂, W₂(H₀), W₂(H₁), CKA calibrée, Procrustes R²)** pour MLP↔LIF, MLP↔Transformer, LIF↔Transformer, et pour N0, N1, N2(i), N2(ii).
3. Décision préenregistrée : « alignement relationnel » ⟺ L0 **et** L1 battent N2(i) à α=0,05 (Holm) **avec** RCI ≤ 0,25 ; « pas d'alignement métrique » ne peut être affirmé **que** par TOST d'équivalence de la CKA calibrée avec N1 (absence d'évidence ≠ évidence d'absence) ; sinon écrire « non testé ».
4. Supprimer le seuil « 3× ou 0,05 » et la phrase « 18,8× » au profit de RCI et d'effets standardisés.
Coût total : < 1 h sur M1 Max 32 Go avec les embeddings déjà produits par `scripts/platonic_rh_alignment.py`. **PRÊT**.

### 3.6 Conformité des invariants comme objet mathématique (e)

Définir **Conf(S) ≜ Traces(S) ⊆ Traces(Spec) ∧ Spec ⊨ □(N-1 ∧ … ∧ W-4) ∧ Spec ⊨ L-1 ∧ L-2**, où Spec est un module TLA+/Quint du nerf (WML, Nerve, Router, Transducer) et L-1 : ◇(ERROR ⇒ ◇PREDICTION) (toute erreur est un jour suivie d'une prédiction sur le même lien), L-2 : ◇(send ⇒ ◇listen) (toute lettre envoyée est un jour lue). La suite PBT (Hypothesis `RuleBasedStateMachine`) devient un **estimateur Monte-Carlo de l'inclusion de traces**, avec métrique de couverture ; la validation de traces (style AgentRFC) rejoue les traces Python réelles contre Spec. Deux livrables mesurables : taux de détection de mutants invariants (objectif ≥ 95 %) et nombre de comportements de Spec non couverts. Coût : modèle à 4 WML, alphabet abstrait à 4 symboles, TLC/Apalache en minutes sur M1. **PRÊT** (ingénierie, 1-2 semaines).

### 3.7 Canal discret (f)

Mesurer la matrice de transition empirique P(code reçu | code émis) et calculer la capacité par Blahut-Arimoto ; comparer au débit effectif **R = H(usage des codes)/6** et à la capacité fermée du canal 64-aire symétrique **C(p) = 6 − H_b(p) − p·log₂63**. Rapporter MI(code émis ; code reçu)/6 ∈ [0,1] à la place de MI/H post-VQ (l'écart 0,93 vs 0,095 est un artefact de dénominateur : la quantification à 6 bits écrase H). Coût négligeable.

---

## 4. Outils GitHub (★, dernier push, licence — relevés le 2026-10-24)

| Dépôt | ★ | Push | Licence | Usage R11 / Mac M1 |
|---|---|---|---|---|
| PythonOT/POT | 2858 | 2026-10-20 | MIT | GW, GW entropique, FGW, FUGW, barycentres ; backends numpy/torch(MPS)/jax ; pas de MLX. **Outil central.** |
| ott-jax/ott | 769 | 2026-09-18 | Apache-2.0 | GW low-rank à l'échelle ; JAX-Metal expérimental sur M1 : préférer CPU ou RTX 4090 |
| alexisthual/fugw | 53 | 2026-08-06 | MIT | FUGW GPU (neuro) |
| thibsej/unbalanced_gromov_wasserstein | 50 | 2026-07-29 | MIT | UGW (Séjourné et al.) |
| oizumi-lab/GWTune | 24 | 2025-02-15 | **aucun fichier LICENSE** | Optuna + POT : balayage ε et inits GW (évite les minima locaux) ; à réimplémenter plutôt que dépendre |
| mlbio-epfl/Aristotelian | 42 | 2026-10-14 | MIT | calibration par permutation ; CKA/kNN/RSA/CCA |
| minyoungg/platonic-rep | 730 | 2025-04-12 | **LICENSE absent (404)** | mutual_knn, cycle_knn, lcs_knn, cka, unbiased_cka, cknna, svcca ; attention licence |
| EEthanShi/LRH ; akoepke/cave_umwelten | 2 ; 16 | 2026-10-14 ; — | non indiquée | profil de treillis ; mKNN emboîté 10K→1M |
| rsagroup/rsatoolbox ; wrongu/repsim ; ahwillia/netrep | 254 ; 26 ; 146 | 2026-10-03 ; 2026-06-10 ; 2024-07-30 | MIT ; MIT ; — | RSA avec nuls ; CKA/Procrustes ; shape metrics (Williams 2021) |
| scikit-tda/ripser.py ; Ripser/ripser ; simonzhang00/ripser-plusplus | 346 ; 371 ; 132 | 2026-10-24 ; 2026-10-16 ; 2026-08-14 | MIT ; MIT ; MIT | PH Vietoris-Rips ; ++ = CUDA (RTX 4090) |
| GUDHI/gudhi-devel | 330 | 2026-10-12 | MIT (page) | Rips, Mapper (cover complex), distances bottleneck/Wasserstein entre diagrammes (pip `gudhi`, M1 OK) |
| giotto-ai/giotto-tda | 1007 | **2024-06-18** | AGPL-3.0 | Mapper + pipelines sklearn ; **stagnant**, licence copyleft : éviter |
| bruel-gabrielsson/TopologyLayer | 430 | 2026-06-11 | MIT | PH différentiable (pertes topologiques) |
| wmayner/pyphi | 435 | 2026-10-17 | GPL-3.0 | IIT 4.0 (Φ) ; explosion combinatoire au-delà de ~10 nœuds : seulement pour un nerf à ≤ 8 WML, et SPÉC |
| SakanaAI/sheaf-admm ; alessioborgi/sheaf-mpnn ; twitter-research/neural-sheaf-diffusion ; TheMesocarp/koho | — ; 24 ; 101 ; 22 | — ; 2026-10-22 ; 2023-08-16 ; 2026-09-14 | Apache-2.0 ; Other ; — ; AGPL-3.0 | laplaciens de faisceau, PyG ; NSD de référence (ancien) |
| tlaplus/tlaplus ; quint-co/quint ; AlloyTools/org.alloytools.alloy | 3138 ; 1874 ; 877 | 2026-10-24 ; 2026-10-24 ; 2026-06-11 | MIT ; Apache-2.0 ; LICENSE = texte Apache-2.0 coiffé d'un en-tête « currently code is under MIT » (ambigu) | TLC/Apalache ; Quint = TLA+ exécutable, traces JSON rejouables |
| HypothesisWorks/hypothesis | 9108 | 2026-10-23 | MPL-2.0 | PBT à états ; déjà dans l'écosystème Python 3.14 des dépôts |
| leanprover-community/mathlib4 | 4351 | 2026-10-24 | Apache-2.0 | `klDiv`, `hammingDist` ; **pas** d'OT ni d'information mutuelle |
| facebookresearch/EGG | 323 | archivé | — | jeux de communication émergente ; archivé → ne pas dépendre ; alternatives google-deepmind/emergent_communication_at_scale ★40 Apache-2.0, facebookresearch/measuring-emergent-comm ★35 |

---

## 5. Ressources Hugging Face

Papers indexés (upvotes) : 2602.14486 Aristotelian (12), 2606.23885 *Mind the Heads* (4 ; HeRA : alignement tête-par-tête par mKNN, **pas** de PH malgré le titre), 2605.20496 *Platonic Representations in the Human Brain* (2 ; rotations orthogonales non supervisées sur NSD, pas GW), 2604.18572 Plato's Cave (2), 2602.06205 Multi-Way (2), 2610.09411 Rosetta Stone (2), 2602.06658 GW at scale (0), 2510.10889, 2409.10967, 2608.23720 *PRH on World Models* (2, non lu). Modèles : aucun résultat pertinent pour « gromov » ou « mutual-knn » (homonymes). Datasets : « representational alignment » 0, « emergent communication » 0, « persistent homology » 1 (finance, hors sujet). **Conclusion : HF n'est pas un hub pour cet axe ; les données utiles (NSD, Allen Neuropixels) sont hors HF, et les données Hypneum (G5, nerve-wml) sont déjà locales.**

---

## 6. Actualités septembre–octobre 2026

- 21/09 — Shang et al., *Displacement Geometry* (2609.24209) : les déplacements, pas les positions ; le fine-tuning casse les déplacements.
- 23/09 — You et al., *Structure over Geometry* (2609.27252) : le pivot de la reformulation DR-3.
- 09/2026 — Chauhan & Bera (2609.34373) : « Emergence, Not Bandwidth » (déjà intégré à l'avenant N10-C).
- 04/10 — TIPS v2 (2606.23590) : H₀/H₁ sur états cachés, descripteurs compacts.
- 05/10 — Houry, Feydy, Vialard v3 (ICML 2026, PMLR 306) : GW à l'échelle.
- 07/10 — Duan, Hertrich, Steidl (2610.10278) : JKO Wasserstein-Fisher-Rao neural.
- 07-08/10 — Schnaus, Dagès, Cremers, Wang, Isola (2610.09411) : alignement sans paires par Wasserstein-Procrustes.
- 09/10 — Bertram et al. v2 (2605.05907) : RSA/CKA aveugles à la topologie d'encodage ; GW recommandé.
- 14/10 — Shi et al., *Lattice Representation Hypothesis* (2610.20286) + dépôt LRH : le spanning-tree overlap ≈ 1-NN ; convergence globale ouverte.
- 14-24/10 — maintenance active : Aristotelian (14/10, 20/10), POT (20/10), sheaf-mpnn (22/10), HetSheaf « NeurIPS 2026 » (20/10), BSNN Bayesian Sheaf NN (20/10), ripser.py / quint / tlaplus / hypothesis / mathlib4 (23-24/10).
- Non couvert : listes OpenReview ICLR 2027 ; `NeurIPS 2026` accepted list.

---

## 7. Risques — le formalisme vide

1. **Catégories sans contenu calculable.** « Neuroletters comme morphismes » n'ajoute rien tant qu'aucune propriété (naturalité, commutation, section globale) n'est *mesurée* avec un nul. Règle : pas de catégorie dans un papier sans une statistique dérivée (ici : erreur de commutation, énergie de faisceau, rang de H¹).
2. **GW trop permissif.** GW est invariant par isométrie : d_GW = 0 n'implique pas « même sémantique », seulement même structure de distances ; deux structures symétriques différentes peuvent être proches. Parade : GW *et* mKNN (qui utilise l'appariement), et contrôle par TOST contre N0. GW est aussi non convexe (minima locaux) : ≥ 10 initialisations, rapporter la dispersion ; le biais entropique ε doit être figé.
3. **Nul mal choisi.** Le nul gaussien ne tient pas (Cui 2022) ; le nul de permutation est **vide pour GW/PH**. Sans N2(i) « substrats non entraînés », tout résultat GW est inexploitable.
4. **PH en grande dimension.** Diagrammes H₁ bruités, coût cubique, dépendance au sous-échantillonnage : bootstrap obligatoire, H₁ uniquement sur ≤ 1000 points, rapporter la stabilité (Sen et al. 2026 : les critères Mapper se contredisent).
5. **Treillis = comparaisons multiples.** Un profil à 8 composantes × 3 paires de substrats × niveaux : Holm ou Bonferroni, SESOI préenregistré, sinon on « trouve » toujours un niveau qui aligne.
6. **PBT = fausse assurance.** Hypothesis explore des traces courtes ; la vivacité ne se teste pas par assertion. Sans model checker, L-1/L-2 restent des vœux.
7. **Refaire le débat PRH au lieu de prédire quelque chose sur Hypneum.** Le test est : une proposition de R11 doit changer une décision de dream-of-kiki/nerve-wml/kiki-flow (op à garder, invariant à ajouter, pas de temps à choisir). Les hypothèses §8 sont filtrées sur ce critère.
8. **Plancher de graine trop serré ou trop lâche.** SESOI = 1,5 × N0 est un choix ; le préenregistrer et le justifier par la variance observée de G5 (retention 0,5119 identique sur 3 profils → variance faible, SESOI exigeant).

---

## 8. Brainstorm — 13 hypothèses falsifiables

Format : énoncé · prédiction quantitative · test (matériel) · critère de réfutation · référence d'appui.

**H1 — DR-3 relationnel par GW sur G5 (PRÊT).** Pour MLX `mlx_kiki_oniric` et E-SNN `esnn_thalamocortical` sur le même jeu d'épisodes (N ≈ 1000 états post-rêve), RCI_L1 ≤ 0,25. · Prédiction : d_GW(MLX, E-SNN) ≤ 1,5 × med N0, ≥ 5 graines. · M1 Max, POT, < 30 min. · Réfutation : RCI_L1 > 0,5 ou IC recouvre N2(i). · Bertram 2026 ; Takeda 2025.

**H2 — Le 18,8× s'effondre sous nul non entraîné (PRÊT).** mKNN(k=10) de MLP↔LIF **non entraînés** sur HardFlowProxyTask vaut déjà ≥ 0,05 (structure d'entrée partagée), ramenant le ratio entraîné/nul de 18,8× à ≤ 5×. · Réfutation : nul non entraîné ≈ 0,0098 ± 0,003 (chance). · Cui 2022 ; Gröger 2026.

**H3 — Pente en k/N (PRÊT).** À k = 10 fixe, mKNN(MLP↔LIF) chute d'un facteur ≥ 2 quand N passe de 1024 à 8192 ; à k/N constant il est stable à ±20 %. · M1, minutes. · Réfutation : stable à k fixe. · Koepke 2026.

**H4 — GW et mKNN classent les paires différemment (PILOTE).** Sur les trois paires (MLP, LIF, Transformer), l'ordre induit par d_GW diffère de l'ordre induit par mKNN dans ≥ 1 paire sur ≥ 3 graines sur 5, parce que mKNN est une mesure de décodage appariée. · Réfutation : ordres identiques sur toutes les graines. · Bertram 2026.

**H5 — Consolidation = compression topologique (PILOTE).** Un cycle P_equ (REPLAY+DOWNSCALE) réduit la persistance totale H₀ (somme des durées de vie) du nuage d'états d'épisodes de ≥ 20 % vs. éveil, sans changer le nombre de classes H₁ persistantes (> médiane des durées) ; RECOMBINE n'ajoute rien — cohérent avec la réfutation empirique de DR-4. · M1, ripser, < 10 min par cellule sur les sorties existantes de G4-ter/G5. · Réfutation : Δ persistance H₀ dans le bruit de graine (|g| < 0,2). · Fay 2026 ; Malhotra 2026.

**H6 — Énergie de faisceau du nerf prédit la réussite (SPÉC).** Faisceau cellulaire sur le graphe de routage : fibre(WML) = simplexe du codebook (64), applications de restriction = transducteurs appris (N-5). L'énergie laplacienne du faisceau de l'état des messages décroît en entraînement réussi et plateau ≥ 2× plus haut dans les runs ratés ; corrélation finale accuracy/énergie ρ ≤ −0,5 sur ≥ 20 runs. · M1, PyG/sheaf-mpnn ou numpy, heures. · Réfutation : |ρ| < 0,3. · Hansen-Ghrist 2019 ; Hanks 2025 ; Seely 2026.

**H7 — DR-2 = non-commutativité d'un splitting (PRÊT, kiki-flow).** REPLAY ≈ pas de transport W₂, DOWNSCALE ≈ pas de réaction Fisher-Rao. Le splitting de Lie-Trotter (transport puis réaction) a une erreur stationnaire O(τ), le splitting de Strang (demi-réaction, transport, demi-réaction) O(τ²) : en divisant τ par 2 l'erreur Lie se divise par 2, l'erreur Strang par 4. · Test OU 1-D déjà dans `experiments/e1b_peyre_bias`, GrosMac/M1, minutes. · Réfutation : mêmes pentes. · Gallouët-Monsaingeon 2017.

**H8 — Plancher WFR (SPÉC).** Ajouter une réaction FR de taux λ au JKO entropique abaisse le plancher de variance stationnaire ε/(2τ) d'un facteur f(λτ) décroissant, f ≈ 1/(1+λτ) au premier ordre. · Même banc OU, minutes. · Réfutation : |Δ plancher| < 5 % pour λτ ∈ [0,1 ; 1]. · Duan-Hertrich-Steidl 2026 ; Liero-Mielke-Savaré 2018.

**H9 — Coude de capacité du canal 64 (PILOTE).** Sous bruit de substitution symétrique p sur les codes, l'accuracy nerve-wml reste à ±5 % du sans-bruit jusqu'à p* tel que C(p*) = 6 − H_b(p*) − p*·log₂63 = R (débit empirique H(usage)/6), puis chute ≥ 20 points dans Δp = 0,1 au-delà. · M1, réentraînement MLP+LIF avec bruit injecté dans `MockNerve`, heures. · Réfutation : dégradation linéaire sans coude à ±0,05 de p*. · Shannon ; Prystawski 2025.

**H10 — Dégénérescence codon (SPÉC).** Entraîné avec p ≥ 0,1, le codebook développe des codes synonymes : perplexité d'usage ≤ 32 (vs ≥ 48 sans bruit), et les synonymes sont des voisins confondables du canal. · Idem H9. · Réfutation : perplexité inchangée (±4). · Meng 2025 (CAVQ) ; code génétique 64→21.

**H11 — Les invariants actuels admettent un protocole mort (PRÊT).** Un modèle TLA+/Quint du nerf satisfaisant N-1..N-5 ∧ W-1..W-4 possède un comportement où une ERROR n'est jamais suivie d'une PREDICTION (L-1 violée) ; au moins 1 des 3 substrats (MLP, LIF, Transformer) viole L-1 sous Hypothesis avec `MockNerve` en ≤ 10 000 exemples. · M1, TLC/Apalache + Hypothesis, heures. · Réfutation : TLC ne trouve aucune trace et les 3 substrats passent L-1. · AgentRFC 2026 ; Castro-Perez 2025.

**H12 — Profil de treillis MLP↔LIF ≈ plancher de graine sauf au niveau métrique (PILOTE).** Sur Π, les composantes L0/L1/L2 de MLP↔LIF sont dominées (TOST, SESOI 1,5×) par MLP↔MLP inter-graines ; la CKA calibrée ne l'est pas. · M1, < 1 h. · Réfutation : GW inter-substrat > 2 × plancher. · You 2026 ; Shi 2026.

**H13 — Géométrie de déplacement inter-substrat (SPÉC).** Sous une seule rotation orthogonale ajustée (Procrustes sur les paires), la cosinus-similarité moyenne des *vecteurs de déplacement* e_i − e_j entre MLP et LIF excède celle des positions de ≥ 0,10. · M1, minutes. · Réfutation : différence < 0,03. · Shang 2026.

---

## 9. Concepts et intuitions nouveaux (tous SPÉC sauf mention)

**C1 — Indice de conformité relationnelle (RCI).** Position normalisée d'un substrat dans la plage dynamique [plancher de graine, nul structure détruite]. Transforme « agnosticisme de substrat » en un nombre sur [0,1] avec IC. *Test* : H1, H12. Statut : PRÊT à préenregistrer après un pilote sur G5.

**C2 — DR-3 comme transformation naturelle.** Soit **D_S : Épisodes → États_S** le foncteur « un cycle de rêve sous profil P sur S » et **R : États → EMM** (espaces métriques mesurés) le foncteur relationnel. DR-3 devient : R∘D_S ≅_ε R∘D_{S'} (isomorphisme naturel à ε près, ε mesuré par GW). La *naturalité* est testable : pour deux jeux d'épisodes E → E' (sous-ensemble, permutation, ajout d'un domaine), le carré commute à ε près. *Test* : erreur de commutation ≤ RCI sur 3 morphismes E→E' (restriction, union, mélange inter-domaines — lien direct avec le RECOMBINE inter-domaines de la veille). Le mot « foncteur » n'est gardé que parce qu'il produit cette statistique.

**C3 — Le nerf est un faisceau cellulaire.** N-5 (codebook propre) + transducteurs = exactement une structure de faisceau sur le graphe de routage (fibres = codebooks, restrictions = transducteurs). Conséquences mesurables : énergie laplacienne = désaccord de protocole en direct (H6) ; H¹ ≠ 0 = cycles de routage inconsistants que l'élagage N-4 devrait éliminer (prédiction : rang H¹ → 0 après élagage, sinon le routage appris est incohérent). *Test* : calcul du laplacien de faisceau sur un nerf à 4-8 WML, numpy.

**C4 — Plancher topologique de la consolidation.** Réinterprétation de la réfutation de DR-4 : « plus d'ops » n'apporte rien parce que REPLAY+DOWNSCALE amène déjà le nuage d'états à un minimum de persistance H₀ ; RECOMBINE intra-domaine ne peut pas descendre plus bas, et RECOMBINE inter-domaines ne gagnerait qu'en créant des classes H₁ (ponts). Prédiction : le gain inter-domaines de Zahn-Evans-Eagleman (veille) s'accompagne d'une hausse du nombre de classes H₁ persistantes. *Test* : H5 étendu au bras inter-domaines.

**C5 — Les quatre ops comme splitting d'un flot WFR (+ GW).** REPLAY = transport W₂ ; DOWNSCALE = réaction Fisher-Rao (rééchelonnement de masse) ; RESTRUCTURE = changement de métrique ; RECOMBINE = **barycentre de Gromov-Wasserstein** entre structures d'épisodes (Peyré 2016). La précondition de DR-2 (`¬(RESTRUCTURE avant REPLAY)`) devient une propriété d'ordre de splitting, et kiki-flow hérite d'une prédiction d'ordre (H7) et d'un plancher (H8). Si H7 tient, l'ordre canonique de dream-of-kiki pourrait être remplacé par un ordre symétrique (Strang) à coût égal.

**C6 — Dégénérescence codon comme correction d'erreur émergente.** Avec 64 symboles ≈ 6 bits et un canal bruité, un VQ entraîné devrait, comme le code génétique, regrouper des codes synonymes confondables — un code correcteur appris sans l'avoir spécifié. Si vrai, la « capacité » utile de l'alphabet n'est pas 6 bits mais log₂(perplexité d'usage), et N10-C doit rapporter cette quantité. *Test* : H9-H10.

**C7 — La suite de conformité est un préordre de raffinement.** Conf(S) ≜ Traces(S) ⊆ Traces(Spec) ; PBT = estimateur Monte-Carlo ; couverture et taux de détection de mutants = ses erreurs de type II estimées. Donne enfin un sens mathématique à « executable conformance suite » et un chiffre publiable (taux de mutants détectés). *Test* : H11 + 30 mutants (invariants cassés un à un).

**C8 — Le nul canonique de DR-3 est « deux substrats non entraînés ».** Ni gaussien, ni permutation : c'est la seule référence qui conserve l'entrée, l'architecture et la dimension en détruisant l'apprentissage. À écrire dans la spec comme N2(i). *Test* : H2.

---

## 10. Recommandation

1. **Préenregistrer maintenant (PRÊT, coût < 1 journée de calcul M1)** : (a) le test (6) reformulé en profil de treillis Π avec les trois références N0/N1/N2 et la règle de décision §3.5 — H2, H3, H12 sur les embeddings existants ; (b) H1 (RCI_L1 par GW) sur les états G5 MLX vs E-SNN, qui devient la **condition 4** du Critère de conformité ; (c) H7 (splitting Lie vs Strang) sur le banc OU de kiki-flow. Ces trois rendent DR-3 et le test (6) **falsifiables** avec métrique, nul calibré, seuil et procédure.
2. **Pilotes avant préenregistrement (1-2 semaines)** : H5 (compression topologique) sur les sorties G4/G5 existantes ; H11 (modèle TLA+/Quint + L-1/L-2 + mutants) — c'est aussi la seule voie pour que « suite de conformité exécutable » soit un objet mathématique (C7) ; H4/H13 en sous-produits de (a).
3. **Spéculatif à garder en veille, un seul pilote** : C3/H6 (faisceau sur le nerf) — le concept le plus original de l'axe, mais le risque de formalisme vide est maximal ; condition d'entrée : que l'énergie de faisceau soit calculable en < 100 lignes numpy et corrélée à l'accuracy sur 20 runs existants. H8-H10 (WFR, canal 64) ensuite, en lien avec N10-C.
4. **Ne pas poursuivre** : DisCoCat/pregroupes pour les neuroletters (pas de grammaire), IIT/PyPhi (explosion combinatoire, pas de nul), Mapper sans protocole d'évaluation, formalisation Lean de GW/Sinkhorn (hors Mathlib) — Lean reste pertinent pour la preuve DR-2 sur listes d'ops (petit, faisable).
5. **Écriture** : remplacer, dans Paper 1 §8.4 et `axioms/__init__.py`, « neighbourhood-equivalent episode states » par la définition RCI ; dans nerve-wml Test (6), remplacer « local, not global » par le profil Π et la phrase « metric alignment not tested (no equivalence test performed) ». Figer centrage/normalisation (Bangachev) et k/N (Koepke) dans les avenants OSF.

---

## Résumé

1. DR-3 reformulé (« relational structure, not metric geometry ») est aujourd'hui non falsifiable : `conforms(S)` ne mesure aucune structure relationnelle ; le test (6) de nerve-wml repose sur un nul gaussien, un seuil ad hoc et un « pas global » qui est une mesure non faite.
2. La littérature 2026 converge : relationnel ≠ métrique (You 09/26), les critères forment un treillis (Shi 10/26), RSA/CKA sont aveugles à la topologie d'encodage et GW est le diagnostic recommandé (Bertram 10/26), le nul doit être calibré (Gröger, Cui) et k/N figé (Koepke).
3. Proposition centrale : un objet relationnel commun R(S,E) (matrice de distances des épisodes post-rêve) et un **indice RCI** sur trois niveaux (mKNN calibré, GW entropique sans correspondance, persistance H₀/H₁), borné par le plancher de graine et le nul « substrats non entraînés », avec TOST et seuil 0,25 → condition 4 exécutable du Critère de conformité.
4. Test (6) → profil de treillis Π à 8 composantes, trois références, décision préenregistrée ; coût < 1 h sur M1 Max avec les embeddings existants.
5. Invariants N-1..N-5 : tous de sûreté, zéro vivacité ; conformité = inclusion de traces (TLA+/Quint) + PBT comme estimateur + mutants ; L-1/L-2 à ajouter.
6. Pont kiki-flow : les ops de rêve comme splitting d'un flot Wasserstein-Fisher-Rao (DR-2 = non-commutativité, prédiction Lie O(τ) vs Strang O(τ²)) ; RECOMBINE = barycentre GW.
7. Spéculatif étiqueté : nerf = faisceau cellulaire (énergie laplacienne, H¹), consolidation = compression topologique, dégénérescence codon du codebook 64 comme correction d'erreur émergente.
8. Prêts à préenregistrer : H1, H2, H3, H7, H11, H12 ; pilotes : H4, H5, H6, H9, H13 ; outils : POT (MIT), ripser.py/GUDHI (MIT), Aristotelian (MIT), quint/tlaplus, Hypothesis ; éviter giotto-tda (stagnant, AGPL) et GWTune/platonic-rep (licence absente).
