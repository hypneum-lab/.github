# kiki-flow-research — analyse profonde (2026-11-01)

## 0. En-tête
- Repo : `hypneum-lab/kiki-flow-research` ; clone `scratchpad/clones/kiki-flow-research` (non modifié).
- SHA : `8470e93a41bb82bd77bc26e7a00399b7fadfb0ec` (merge PR #60, 2026-11-01). `git log --since=2026-10-24` : 96 commits.
- Fichiers lus en entier : `paper/main.tex` (976 l.), `paper/references.bib` (22 entrées) ; `paper/workshop/{main,section_1_intro,section_2_related,section_3_method_overview,section_4_method,section_5_experiments,section_6_discussion}.tex` + `references.bib` (12) ; `paper/arxiv_bundle/main.tex` (537 l.) + bib (6) ; `ERRATUM.md` (943 l., §1–16) ; `CITATION.cff` ; `docs/prereg/2026-10-30-m5-certify-reading-rule.md`, `docs/results/2026-10-30-m5-certify-verdict.md`, `results/m5_secondary_2026_10_30/{ANALYSIS,table}.md`, `docs/prereg/2026-10-30-jko-splitting-lie-strang.md`, `docs/notes/2026-11-01-jko-splitting-results.md` ; code : `kiki_flow_core/track2_paper/paper_f.py`, `kiki_flow_core/track3_deploy/{jko_oracle_runner,query_conditioned_f}.py`, `kiki_flow_core/modules/phonological_loop.py`, `multiscale_loop.py`, `particle_simulator.py`, `kiki_flow_core/species/data/{dell,levelt}_baddeley_coupling.yaml`, `experiments/e1b_peyre_bias_preregistered.py` + `experiments/results/e1b_peyre_bias.json`, `experiments/check_lambda_monotonicity.py` + `paper/lambda_monotonicity.json`.
- Baselines lues APRÈS mon avis : `.github/docs/research/2026-10-30-etat-des-lieux/{README.md, inventaires/kiki-flow-research.md, codex/report-sol-2026-10-30.md, codex/verification-sol.md}` ; `2026-10-24/{inventaires/kiki-flow-research.md, revues/R3-wasserstein-jko-specialisation.md}`.
- Vérifications faites hors dépôt (numpy seul, < 1 min CPU) : `scratchpad/kfr_scripts/e1b_factor.py`, `scratchpad/kfr_scripts/lam2.py`. Références : S2 batch + Crossref + HTML arXiv (`scratchpad/kfr_refs/`).
- Durée : ~1 h 40.

## 1. État des lieux
- Objet : un « free energy » multi-espèces sur 4 densités (phono, lex, sem, syntax) couplées par une matrice J (topologies Dell / Levelt), intégré par un schéma de type JKO, proposé comme modèle de consolidation psycholinguistique, plus un pont vers l'apprentissage continu de LLM.
- Papiers :
  - `paper/main.tex` « paper-v0.13-draft » (976 l.), dernière modif. 2026-10-25 (137331b) ; `paper/main.pdf` reconstruit à a09492a (10-24), donc antérieur au .tex. Brouillon, non soumis.
  - `paper/workshop/` : variante QueryConditionedF (atelier NeurIPS 2026, « Anonymous » mais URL du dépôt dans le texte). Brouillon.
  - `paper/arxiv_bundle/main.tex` (537 l.) = `paper/kiki-flow-arxiv-v0.5.zip` : version périmée, jamais déposée.
- Hypothèses actives : la spécialisation émerge-t-elle du transport seul (nul publié) ; le pas certifié (§16) est-il exploitable sur la grille γ×α (M5) ; Lie/Strang peut-il remplacer le pas couplé (NH-20).
- Campagnes récentes : M5 certifié (FAILED 50/60, PR #52, 11-01) ; M5 secondaire (10/38, PR #60, 11-01) ; Lie/Strang NH-20 (PR #53, 11-01). Décision PI : pas implicite certifié partout, recalcul estimé à 8–11 jours (ERRATUM.md §16).

## 2. Lecture des papiers

### 2.1 `paper/main.tex` (v0.13-draft)
**Thèse** : le flux JKO multi-espèces sur F (éq. 2) reproduit des statistiques psycholinguistiques, ne spécialise pas spontanément sans potentiels (excès sur Gibbs négatif), contracte à un taux λ̂ ≈ 67,8 « dans le régime du Thm 3.4 de Conger », et un pont transport réduit l'oubli d'un LLM.

**Condensé section par section**
| Section (lignes) | Ce qu'elle affirme | Ce qu'elle prouve | Ce qui manque |
|---|---|---|---|
| Résumé (16-44) | 2,72 bits à (10,0) ; 3,53 bits à α=30 ; excès −0,39 [−0,42 ; −0,36] ; « petit excès positif seulement avec γ≥20 » (33) | chiffres issus du pas entropique | l'excès γ≥20 est retiré par ERRATUM §14 (10-27) ; texte inchangé |
| 1 Introduction (46-75) | flux de Wasserstein multi-espèces comme modèle de consolidation | rien (programme) | — |
| 2 Background (76-169) | JKO, Sinkhorn, Conger, Gallouët ; CL l.142-159 | — | Turing 1952 (cité en mot l.165 sans réf.), Carlier et al. 2017, interactive activation, groupe de Rome |
| 3 Model (170-212) | éq. 2 l.184-187 avec ½ ΣJ^sym∫ρ_iρ_j ; b^asym et b^phono « intégrés exactement » (203-211) | — | code sans ½ (voir eq. 2) ; drift b^phono absent de Track 2 |
| 3.1 Dell/Levelt (213-244) | J « excitatrice / consolidation » | — | entrées toutes ≥0 entrant avec + dans F = pénalité de recouvrement (inversion de sens) |
| 3.2 λ-monotonie (245-273) | λ̂ = 67,79 ± 3,78, régime Thm 3.4 (263-272) | courbes décroissantes | λ̂ est un artefact de grille (voir 2.1 éq.) |
| 3.3 Boucle phono (274-298) | éq. 5 l.282-286 κ clip(tanh(ρ_phono−ρ_lex),±s) | — | aucune implémentation Track 2 ; `phonological_loop.py` est une autre formule, Track 1 seulement |
| 4 Implementation (299-336) | Track 2 intègre b^phono (310-312) | — | faux (aucun drift tanh dans track2) |
| 5 Experiments (337-353) | chemin rigoureux = « full JKO scheme » (342) | — | ERRATUM §12 : le chemin rigoureux n'est pas un pas JKO |
| 5.1 Moments 5 graines (354-381) | moments par espèce | tableaux | pas legacy |
| 5.2 Fast vs rigorous (382-422) | accord rapide/rigoureux | accord entre deux schémas non-JKO | erreurs W2 relatives 0,60/0,64/0,14 (ERRATUM §12) |
| 5.3 Agrégats (423-508) | excès sur Gibbs (471-498), +0,53 [+0,49 ; +0,57] à (5,50) (491) | — | retiré par §14 (pas non dissipatif γ≥10) |
| 5.4 Ablation couplage (509-572) | séparable 1,9612 / dell-full 1,9675 / levelt 1,9687 | écart ≤ 0,0075 bit | chemin rapide legacy ; montre que J est négligeable devant α |
| 5.5 Décroissance F + λ̂ (573-605) | contraction empirique | décroissance de F | interprétation λ̂ fausse |
| 5.6 Profils (606-618) | profils finaux | figures | — |
| 5.7 Pas entropique vs ε (619-657) | biais entropique mesuré | — | — |
| 5.8 Proxy CL (658-695) | proxy | — | — |
| 5.9 CL LLM réel (696-799) | oubli SST-2 0,361 ± 0,010 (757), pont 0,326 ± 0,047 | mesuré | écart 0,035 < 1 σ du bras pont ; aucun transport dans le bras de référence |
| 5.10 Latence (800-823) | T3 0,04 ms | — | — |
| 6 Discussion (824-946) | E1b « pré-enregistré … confirme » (827-849) ; E2 convexité (851-863) ; « λ̂ quantifie la contraction transitoire du couplage » (869-885) ; splitting asymétrique (887-941) | — | E1b est REFUTED dans son propre JSON ; affirmation λ̂ sans donnée |
| 7 Conclusion (947-976) | reprend le résumé | — | idem résumé |

**Équations / théorèmes / figures clés**
| Élément | Verdict | Justification |
|---|---|---|
| Éq. 2 (184-187), facteur ½ | **faux vs code** | `paper_f.py:101-104` somme `J_sym[i,k]<ρ_i,ρ_k>` sans ½ et le gradient vaut 2J^sym ρ (`paper_f.py:163`). Soit le texte, soit le code (le gradient du texte est J^sym ρ). Confirme Codex M9 (30/10). |
| Couplage J « excitateur » (213-244) | **faux (signe)** | `dell_baddeley_coupling.yaml`, `levelt_baddeley_coupling.yaml` : entrées ≥0, diagonale « self-consolidation » (sem 0,85). Avec un + dans F, la diagonale pénalise ∫ρ_i² (dispersion) et le hors-diagonale pénalise le recouvrement (répulsion) : l'inverse de « spreading activation / consolidation ». Inférence : le signe doit être − ou le texte réécrit. |
| Valeurs propres J^sym, « −0,288 » (851-863) | **plausible mais mélangé** | Calcul : Dell [−0,358 ; 0,175 ; 0,503 ; 1,079], Levelt min −0,288. Le −0,288 est Levelt (E2 sur grille 8) alors que la topologie par défaut est Dell. |
| λ̂ = 67,79 ± 3,78 et « régime Thm 3.4 » (263-272, 877-880) | **faux (artefact)** | `check_lambda_monotonicity.py` : `apply_w2_prox=False` (Euler explicite euclidien), potentiels plats, prior uniforme, grille 64, h=0,002, Dirichlet(1), ajustement sur 8–9 points. Prédiction de l'Euler explicite sur la hessienne euclidienne de l'entropie (1/ρ = n à l'uniforme) : λ = −ln(1−h·n)/h = 68,5. Mon jouet entropie seule (`lam2.py`) : n=16 → ≈16 (prédit 16,3) ; 32 → ≈33 (33,1) ; 64 → ≈66 (68,5) ; 128 → ≈150 (147,9). λ̂ suit la résolution de grille, pas le couplage ; Conger Thm 3.4 (flux W2 continus) ne s'applique pas à un Euler euclidien. |
| E1b, Var* = (ε/τ)g(τ), g→½ (832-842) | **faux (deux fois)** | (i) `experiments/results/e1b_peyre_bias.json:124-130` : pente 0,600, bande pré-enregistrée [0,45 ; 0,55] → « verdict": "REFUTED" ; g(τ) ajusté après coup (l.140 « MODEL_BIAS »). Le texte dit « confirms ». (ii) Bug facteur 2 : `e1b_peyre_bias_preregistered.py:84-85` `a_func = exp(-tau*v/reg)` alors qu'avec la convention du code (F + OT_reg/(2τ), coût |x−y|²) il faut `exp(-2τV/reg)` ; le nul exact (l.110) utilise y = x/(1+τ) quand le bras entropique a pour application moyenne y/(1+τ/2). Les deux bras n'ont pas le même pas de temps. Vérif. numérique (τ=1, reg=0,2) : code → Var 0,120 = reg(1+τ/2)/(2τ(1+τ/4)) ; corrigé → 0,0667 = reg(1+τ)/(2τ(2+τ)) → reg/(4τ). Convention Baradat et al. (HTML arXiv 2502.12666) : coût |x−y|²/2 + εH, pas D_ε²/(2τ)+F, diffusion ajoutée α/2Δ ; en unités du code reg = 2ε_B, donc plancher reg/(4τ). Inférence : la loi ε/(2τ) n'est retrouvée que grâce au pas mal étiqueté. |
| E2 convexité (851-863) | **plausible** | pire valeur propre 2,831 ; non recalculé. |
| Thm/claim « splitting de Gallouët intègre exactement b^asym, b^phono » (203-211, 287-297) | **faux / douteux** | `apply_drift_splitting` (`paper_f.py:248-282`) applique une matrice orthogonale par cellule (interconversion d'espèces), qui préserve la norme L2 et non Σρ (contrairement au docstring), puis clip+renormalise. Ce n'est ni un drift de transport ni une intégration exacte ; G–M 2017 est un splitting W2 + Fisher–Rao pour flux KFR. b^phono n'existe pas dans Track 2. |
| Excès sur Gibbs négatif = « pas de spécialisation spontanée » (471-498) | **vrai mais quasi tautologique** | Inférence : le minimiseur de F_sep est exactement l'état de Gibbs ; la diagonale positive de J pousse l'entropie vers le haut ; la diffusion entropique et particulaire ajoute un biais. Un excès négatif est attendu par construction. |
| Tableau ablation couplage (509-560) | **vérifié (chiffres)**, interprétation limitée | 1,9612 / 1,9675 / 1,9687 : le couplage pèse ≤ 0,0075 bit devant α=10. |
| Oubli SST-2 0,361 ± 0,010 → 0,326 ± 0,047 (757) | **plausible**, non significatif | l'écart (0,035) est inférieur à l'écart-type du bras pont. |
| Lie/Strang (887-941 et prereg §9) | **vérifié (algèbre)** | Calcul à la main : Strang = I + h(A+B) + h²[3A²/4 + (AB+BA)/2 + B²] ; défaut vs flot exact h²(A²/4 + B²/2) ; E_A(h/2)² − E_A(h) = −h²A²/4 ; Lie − S = −h²BA. Tout correct. |

### 2.2 `paper/workshop/` (QueryConditionedF)
**Thèse** : un oracle JKO conditionné par la requête, pré-entraîné par un labeler heuristique (spaCy-fr, Lexique, phonemizer), donne des encodeurs dont le KL vers l'oracle classe C > B.

**Condensé**
| Section | Affirme | Prouve | Manque |
|---|---|---|---|
| s1 Intro (1-86) | géométrie de Wasserstein + active inference (s1:20) | — | cite 5 clés absentes de la bib (s1:17 `\citealp` chen2018neural etc.) |
| s2 Related (1-84) | message passing (s2:10, parr2017) ; « affine flows parameterized by text » (s2:40, rezende2015) ; « Levelt's working-memory architecture » (s2:65) | — | 3 attributions fausses ou douteuses |
| s3 Overview (1-82) | oracle = flux de Wasserstein (s3:30-32, 73-76) | — | l'oracle n'a pas de prox W2 |
| s4 Method (1-140) | F avec couplage λ_J=0,1 « issu d'un pilote » (s4:19-34) ; gradient 2λJρ (s4:41) ; projection softplus | — | `QueryConditionedF` construit sans `coupling_matrix` → zéros (`query_conditioned_f.py:48-50`) ; 2λJρ faux pour J asymétrique ; projection réelle = clip+renormalise |
| s5 Experiments (1-166) | 1 pas JKO par requête (s5:15) ; ΔKL = +0,002 = 8× sd (s5:137-139) ; ablation labeler faite, « within 0.003 » (s5:150-153) | tableaux | aucun artefact pour robustesse/SUBTLEX/analyse d'erreurs dans le dépôt |
| s6 Discussion (1-88) | 10 pas JKO (s6:9) ; ablation labeler = « follow-up » (s6:55-57) ; Wasserstein (s6:26-27) | — | contradictions internes avec s5 |

**Éléments clés**
| Élément | Verdict | Justification |
|---|---|---|
| Oracle de Wasserstein (s3:30-32, s3:73-76, s4:43-45, s6:26-27) | **faux** | `jko_oracle_runner.py:91-111` : `JKOStep(..., apply_w2_prox=False)` aux lignes 96 et 110 ; aucun prox W2. |
| Terme de couplage λ_J J (s4:19-34) | **faux** | `query_conditioned_f.py:48-50` : `coupling_matrix=None` → `np.zeros`. Le terme n'existe pas dans les résultats. |
| Gradient 2λJρ (s4:41) | **faux** pour J asymétrique ((J+Jᵀ)ρ). |
| « ΔKL = +0,002, 8× sd » (s5:137-139) | **faux** | Le tableau (s5:135-136) donne C 0,0736 (graines 0,0736/0,0741/0,0739, sd 0,00025) et B 0,0738 → Δ 0,0002, soit < 1 sd. Classement non robuste. |
| « within 0,003 » (s5:151-153) | **faux d'un ordre** | 0,0739 − 0,0736 = 0,0003. |
| Chiffres de robustesse, SUBTLEX, analyse d'erreurs | **invérifiables** | aucun artefact dans le dépôt (confirme baseline 10-24 H31). |

### 2.3 `paper/arxiv_bundle/main.tex` (v0.5)
**Thèse** : version antérieure, spécialisation émergente.
| Section | Affirme | Verdict |
|---|---|---|
| Résumé (≈16-40) | gap 2,04 bits (31), « under ninety minutes » (23) | **retiré** par l'ERRATUM (spécialisation = artefact du prox D1/D2) |
| 3 Model (126-150) | idem main v0.5 | non-JKO (§12) |
| 5.2 Fast vs rigorous (211-248) | accord KL 0,000638 ± 0,000265 « bits » (243) | unité fausse et pas défectueux |
| 5.3 Agrégats (249-282) | entropie 1,96 vs 4 bits, gap 2,04 (267) | **retiré** |
| 5.6 Biais Sinkhorn (308-...) | ~8,3 bits à ε≥0,05 (318) | ε non transmis (ERRATUM §9) |
| Figure-status | Fig. 4–5 « synthétiques » vs texte « measured » | contradiction interne |
| Discussion/Conclusion (494-537) | erratum seulement en commentaires LaTeX | ne doit pas circuler |

### 2.4 Positionnement groupe de Rome (exigence PI 18:07)
- (b) Déjà cités : **aucun** dans les trois manuscrits (`git grep -niE "agliari|barra|fachechi|hopfield"` sur `paper/ docs/ README.md` : 0 résultat).
- (a) À citer :
  - `main.tex` §2, paragraphe apprentissage continu l.142-159 : arXiv:2501.16789 (DOI 10.1016/j.neunet.2025.108181) et arXiv:2610.08612, comme références de spécialisation modulaire quand la compétition inter-modules est posée (anti-Hebb).
  - `main.tex` Discussion l.869-885 (et 471-498) : mêmes deux papiers pour expliquer le nul : l'ingrédient manquant est un couplage anti-hebbien de force comparable au terme de potentiel. kiki-flow contient bien une compétition (hors-diagonale positive de J^sym = pénalité de recouvrement) mais elle pèse ≤ 0,0075 bit devant α=10 (509-560).
  - `main.tex` §5.9 l.696-799 : DOI 10.1016/j.neunet.2024.106389 (rêve = ridge + early stopping) comme mécanisme de consolidation alternatif au pont, à côté de bazhenov2026. Arbitrage, pas obligatoire.
  - Workshop : aucun papier de Rome essentiel. arxiv_bundle : à retirer, sans objet.
- (c) Devancent/contredisent : 2501.16789 **devance** l'explication du nul (la spécialisation existe avec anti-Hebb posé), sans le contredire : le nul de kiki-flow porte sur un couplage faible et de signe répulsif sur le recouvrement. 2605.10304 (recuit partiel) : sans lien direct ici.
- Désaccord avec la veille : `veille/rome-2026-11-01.md:45`, `:60` et `:101` rattachent le nul de spécialisation à « oubli 0,361 ± 0,010 ». Fait : 0,361 est l'oubli SST-2 d'un LoRA séquentiel sur Qwen3-4B sans transport (`main.tex:757`) ; le nul de spécialisation est l'excès sur Gibbs (`main.tex:471-498`). La « direction d'oubli » de 2503.04454 (veille:60, non résolu par moi) ne s'applique donc pas à ce chiffre.

## 3. Vérification des références
Tableau complet : `inventory/refs/kiki-flow-research-refs.md`.
- 32 entrées uniques dans les 3 bibs (22 main ; workshop 12 dont 10 propres ; arxiv_bundle 6 = sous-ensemble du main) + 7 citations pendantes du workshop sans entrée bib.
- Toutes existent sauf les 2 auto-citations `saillant2026*` (introuvables par API).
- Main : 15 OK + 3 OK à venue invérifiable ; 2 venue périmée (conger2025 → SIAM J. Appl. Dyn. Syst., DOI 10.1137/25m1780808 ; baradat2025 → SIAM J. Math. Anal., DOI 10.1137/25m1736001) ; 2 attribution douteuse (gallouet2017 pour l'intégration exacte d'un drift non conservatif ; peyre2015 pour le plancher stationnaire) — conger2025 compte aussi « Thm 3.4 » douteux ; 3 venue invérifiable (caucheteux ICML, kim EMNLP « to appear », zhang atelier NeurIPS).
- Workshop : 7 OK ; 1 mauvaise attribution (levelt1989 « working-memory architecture ») ; 2 douteuses (parr2017 pour message passing → Parr et al. 2019 ; newboucard2004 = Lexique 2 cité pour Lexique 3.83 → New et al. 2007) ; 2 non résolues par API (lecun2022 OpenReview, spaCy logiciel).
- Pendantes : rezende2015 en mauvaise attribution (s2:40).
- Manquantes : Turing 1952, Carlier–Duval–Peyré–Schmitzer 2017, Hraivoronska–Santambrogio 2025 (JKO entièrement discret, pertinent pour l'épinglage de grille), Di Francesco–Fagioli 2013 (interaction non locale à deux espèces), McClelland–Rumelhart 1981, groupe de Rome (§2.4).

## 4. Analyses
- Ordres de grandeur : le couplage J pèse ≤ 0,0075 bit sur des entropies ≈ 1,96 bit (main.tex:509-560), soit < 0,4 %. Inférence : toutes les conclusions « topologie Dell vs Levelt » sont sous le bruit de schéma (erreurs W2 relatives 0,14–0,64, ERRATUM §12).
- λ̂ ∝ résolution de grille (n=16→16 ; 128→150) : aucune information sur la dynamique de couplage.
- Puissance : 3 graines pour λ̂ et la robustesse workshop ; 5 pour les moments ; ΔKL workshop < 1 sd.
- M5 : strate primaire γ≤30 certifiée 50/60 (12/12, 12/12, 11/12, 10/12, 5/12 pour γ=0,5,10,20,30) ; stress 7/36 ; 96/96 configurations exécutées (83 macM3, 13 electron-server) ; F décroît sur 219/219 pas. Secondaire : 10/38 (critère 4/10, stress 6/28) ; échecs plancher de précision 15, budget 8, stagnation 5 ; (10,50,0,05,500) encore en cours.
- Lie/Strang (notes 2026-11-01) : Lie non substituable (C1 échoue 14, C2 2, C3 30), Strang non substituable (C1 8, C2 11, C3 25) ; 12/60 marges exploitables ; Strang sauve 3 configs γ≥50, Lie 0 ; Q3 non identifiable : exposants adjacents médians de S −0,72 et −0,03. Inférence (nouvelle) : le défaut d'auto-convergence du pas couplé S ne diminue pas avec h sur la grille 16 points, donc pas de limite en temps continu cohérente observable à cette résolution.
- Rapporteur en 3 points : (1) le schéma numérique n'a été JKO à aucun moment pour les résultats du papier et les métriques de contraction (λ̂) et de biais (E1b) sont des artefacts de discrétisation ou d'étiquetage ; (2) la psycholinguistique est décorative : J est de signe inversé, négligeable, et le drift phonologique annoncé n'existe pas ; (3) le résultat négatif (pas de spécialisation spontanée) est attendu par construction et la littérature (Rome 2025-26) donne déjà le mécanisme.
- Contribution réellement neuve après lecture des références : l'outillage certifié (pas implicite Bregman-MM avec résidus KKT, ERRATUM §16) et la discipline pré-enregistrée M5/NH-20, ainsi que l'ERRATUM lui-même comme étude de cas méthodologique. Le modèle psycholinguistique n'apporte rien de neuf vs Conger 2025, Di Francesco–Fagioli 2013 et Agliari et al. 2025.

## 5. Suppositions implicites
| Supposition | Risque si fausse |
|---|---|
| Le pas « rigoureux » est un pas JKO de F | Fausse (ERRATUM §12) : tous les résultats Track 2 du papier changent. |
| J positif = excitation | Fausse : signe inversé, interprétation psycholinguistique inversée. |
| Grille 16–64 points suffisante | λ̂ dépend de n ; S non convergent en h ; épinglage de grille (Hraivoronska–Santambrogio). |
| Certifier F_δ (Turing lissé δ=1e-5) = certifier F | Baseline 10-30 ; non levée. |
| reg du code = ε de Baradat | Fausse d'un facteur 2 (E1b). |
| Le nul sur Gibbs dit quelque chose de la spécialisation | Il est attendu par construction. |
| Particules Langevin = dynamique du modèle | Dérive nulle (mouvement brownien pur, bruit 0,05) dans `particle_simulator.py`. |

## 6. Pistes d'utilité
- Publiable tel quel : note méthodologique « ERRATUM kiki-flow » (pas non-JKO, prox défectueux, ε/max_iter non transmis, γ≥10 non dissipatif) + M5 FAILED (règle de lecture pré-enregistrée, échec documenté) + NH-20 négatif (Lie/Strang non substituables). Cela rejoint le « 1er papier = note méthodo nuls + errata » de la roadmap.
- À arrêter : λ̂ et le renvoi au Thm 3.4 ; E1b tel qu'écrit ; le workshop sous sa forme actuelle (oracle non Wasserstein, couplage nul) ; toute circulation de l'arxiv_bundle et du Zenodo actuel.
- Manque pour une soumission du main : recalcul complet au pas certifié (8–11 j) ; correction du ½ et du signe de J ; implémentation réelle de b^phono ou retrait de l'éq. 5 ; E1b corrigé (exp(−2τV/reg)) et re-pré-enregistré ; convergence en h et en grille ; citations Rome + Carlier 2017 + Hraivoronska–Santambrogio ; reconstruction du PDF.

## 7. Constats classés
**BLOQUANT (5)**
1. λ̂ = 67,79 est l'Euler explicite de l'entropie à n=64 (prédit 68,5), pas une contraction du couplage ; le « régime Thm 3.4 » ne s'applique pas. `paper/main.tex:263-272`, `:877-880`, `experiments/check_lambda_monotonicity.py`, `paper/lambda_monotonicity.json`. **Nouveau** (baseline 10-24 H18 : « non concluant » seulement).
2. E1b est REFUTED (pente 0,600 hors [0,45 ; 0,55]) mais présenté comme confirmation ; de plus le bras entropique a un facteur 2 (`exp(-tau*v/reg)` au lieu de `exp(-2τV/reg)`) et un pas de temps différent du nul. `paper/main.tex:832-842`, `experiments/e1b_peyre_bias_preregistered.py:84-85,110`, `experiments/results/e1b_peyre_bias.json:124-130`. **Infirme** baseline 10-24 R3 l.110 (« cohérente avec Baradat ») ; facteur 2 **nouveau**.
3. Workshop : l'oracle n'a pas de prox W2 et le couplage vaut zéro, alors que le texte revendique une géométrie de Wasserstein et λ_J=0,1. `kiki_flow_core/track3_deploy/jko_oracle_runner.py:96,110`, `query_conditioned_f.py:48-50` vs `paper/workshop/section_3_method_overview.tex:30-32,73-76`, `section_4_method.tex:19-34,43-45`, `section_6_discussion.tex:26-27`. **Nouveau**.
4. `main.tex` gelé au 10-25 revendique encore l'excès positif γ≥20 retiré par ERRATUM §14 et appelle le chemin rigoureux « full JKO scheme ». `paper/main.tex:33`, `:491`, `:342` ; `ERRATUM.md` §12, §14. **Confirme** baseline 10-30 (main non à jour) ; le maintien dans le résumé est précisé ici.
5. Zenodo / `CITATION.cff` publient toujours le pas non-JKO comme « rigoureux » (DOI anciens, version paper-v0.13-draft) ; `paper/main.pdf` antérieur au .tex. `CITATION.cff`. **Confirme baseline #4**.

**MAJEUR (10)**
6. Facteur ½ de l'éq. 2 absent du code (gradient 2J^sym ρ). `paper/main.tex:184-187` vs `kiki_flow_core/track2_paper/paper_f.py:101-104,163`. **Confirme** Codex M9.
7. Signe de J inversé : entrées ≥0 avec + dans F = répulsion et auto-dispersion, l'inverse de l'activation excitatrice décrite. `kiki_flow_core/species/data/dell_baddeley_coupling.yaml`, `levelt_baddeley_coupling.yaml`, `paper/main.tex:213-244`. **Nouveau**.
8. b^phono (éq. 5) n'existe pas dans Track 2 et b^asym est une rotation par cellule (préserve L2, pas Σρ), pas un drift « intégré exactement ». `paper/main.tex:203-211,282-297,310-312`, `paper_f.py:248-282`, `kiki_flow_core/modules/phonological_loop.py`. **Confirme et renforce** Codex M9 (hook T2 « non retrouvé » → drift absent partout).
9. Le nul de spécialisation (excès sur Gibbs < 0) est attendu par construction (minimiseur de F_sep = Gibbs, diagonale J positive, diffusion). `paper/main.tex:471-498`. **Nouveau**.
10. Le défaut d'auto-convergence du pas couplé S ne décroît pas avec h (exposants −0,72, −0,03) : pas de limite continue observable sur 16 points. `docs/notes/2026-11-01-jko-splitting-results.md` (Q3). **Nouveau**.
11. Workshop : ΔKL réel 0,0002 (< 1 sd 0,00025) et non 0,002 « 8× » ; « within 0,003 » au lieu de 0,0003 ; 1 vs 10 pas JKO ; ablation faite vs « follow-up » ; chiffres de robustesse sans artefacts ; 7 citations sans entrée bib. `paper/workshop/section_5_experiments.tex:137-139,151-153,15`, `section_6_discussion.tex:9,55-57`. ΔKL **nouveau** ; artefacts manquants **confirme** baseline 10-24 H31.
12. arxiv_bundle périmé (gap 2,04 bits, 0,000638 « bits », 8,3 bits, « ninety minutes ») identique au zip v0.5. `paper/arxiv_bundle/main.tex:23,31,243,267,318`. **Confirme** baseline 10-30.
13. M5 échoue sur le fond (5/12 à γ=30, 10/12 à γ=20) avec 96/96 configurations exécutées. `docs/results/2026-10-30-m5-certify-verdict.md`. **Infirme baseline #6** (« failed mécanique par couverture 50/96, rien pour γ∈{0,5,10} »).
14. ERRATUM §16 toujours marqué « PROPOSED … not merged » alors que PR #51 est fusionnée. `ERRATUM.md:700-703,746`. **Confirme** baseline 10-30.
15. La veille confond l'oubli SST-2 0,361 (LoRA séquentiel sans transport) et le nul de spécialisation. `veille/rome-2026-11-01.md:45,60,101` vs `paper/main.tex:757,471-498`. **Nouveau** (sur la veille, pas sur le dépôt).

**MINEUR (7)**
16. Venues périmées conger2025, baradat2025 (`paper/references.bib:88,116`). Nouveau.
17. Attributions douteuses : gallouet2017 (exactitude du drift), peyre2015 (plancher), conger « Thm 3.4 ». Nouveau.
18. Workshop : rezende2015 (s2:40), Levelt « working-memory » (s2:65), parr2017 (s2:10), Lexique 3.83 via Lexique 2 (s4:68). Nouveau.
19. −0,288 = Levelt alors que la topologie par défaut est Dell (−0,358). `paper/main.tex:851-863`. Nouveau.
20. Turing 1952 et interactive activation nommés sans référence (`paper/main.tex:165`). Nouveau.
21. Docstring `apply_drift_splitting` (Σρ préservée) faux. `paper_f.py:248-282`. Confirme Codex.
22. Reset de tau dans `multiscale_loop.py` l.84 et l.148 (suivi m4 de l'ERRATUM) toujours ouvert ; particules à dérive nulle ; `reinject` True par défaut depuis 10-25. Nouveau (dérive nulle).

**OK (4)**
23. Algèbre Lie/Strang du prereg §9 vérifiée à la main. `docs/prereg/2026-10-30-jko-splitting-lie-strang.md` §9.
24. Discipline d'exécution M5 : règle gelée avant run, 219/219 pas à F décroissant, verdict FAILED assumé ; secondaire vérifié par Codex sans BLOQUANT.
25. Normes de Frobenius et rapports d'asymétrie de J (Dell 1,323 / 0,314 ; Levelt 1,247 / 0,331) recalculés.
26. ERRATUM.md : documentation exemplaire des défauts (§1–16), base d'une note méthodologique.

**Hors périmètre** : « TOST PR #9 » appartient à bouba_sens ; la PR #9 de kiki-flow est un squelette AGENTS.md.

**Non vérifiable** : chiffres workshop (pas d'artefacts) ; venues ICML/EMNLP/atelier NeurIPS ; script λ réel avec POT (reproduit seulement par jouet numpy) ; texte intégral des papiers de Rome au-delà des résumés ; E2 (2,831) non recalculé.
