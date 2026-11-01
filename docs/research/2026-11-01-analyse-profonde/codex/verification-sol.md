# Vérification à la source de la passe aveugle Codex gpt-6.1-sol (1er novembre 2026)

*Fichier vérifié : `codex/report-sol.md` (598 lignes, 16 459 mots ; sections 1-4 gelées à 17:46:59 UTC, SHA-256 `def37c6d…`). Vérification par l'agent de synthèse v2, en lecture seule dans `scratchpad/clones/`. Chemins relatifs à `clones/` sauf mention. Recalculs refaits ici avec `scipy` sur les fichiers du dépôt (commandes dans l'historique de session ; résultats recopiés ci-dessous).*

**Périmètre.** Les 17 constats BLOQUANT et 34 constats MAJEUR rédigés en prose de §2-§3 du rapport Codex (numérotés K1-K51 dans l'ordre du fichier), plus le tableau §3.3 (K52, groupé). Les verdicts globaux par dépôt (l.17-22) ne sont pas comptés à part. La case « statut » dit : déjà dans notre rapport v1 (Bn/Mn/En), nouveau, ou contredit notre Bn.

**Comptes.** 52 lignes examinées (17 BLOQUANT, 34 MAJEUR, 1 tableau groupé) : **39 confirmées**, **9 nuancées** (fait exact, mais gravité ou portée excessive, ou fait déjà déclaré par les auteurs), **3 non vérifiées** (raisonnement plausible, pas de contrôle possible sans recalcul lourd), **1 sans objet** (K27, un OK), **0 réfutée**. **Huit constats confirmés sont nouveaux** pour notre rapport (C1-C8 en v2), plus deux nouveaux MINEUR (K22 Davies, K26 « deux ordres de grandeur »). **Un contredit en partie notre B2** (pilote dok), **un nuance notre B21** (diagonale NH-01), **un corrige notre inventaire** (DOI bouba). Sur les 17 BLOQUANT de Codex, nous en gardons 6 en BLOQUANT (K1, K7, K9, K10, K14, K17), 10 en MAJEUR et 1 déjà clos par le labo (K3 : H14 rendues exploratoires le 31/10).

## BLOQUANT de Codex (17)

| K | l. Codex | Résumé | Fichier cité par Codex | Verdict (preuve) | Statut |
|---|---|---|---|---|---|
| K1 | 49 | La classe [P] de DR-2 n'est pas un semi-groupe | `dream-of-kiki/docs/proofs/dr2-compositionality.md:23,118` | **Confirmé** (`dr2-compositionality.md:24-31`) | déjà B1 |
| K2 | 57 | Les expériences historiques ne valident pas les grands modèles (secours de 20 lignes, train = éval) | `build/full-draft.tex:110,156,749,1100` ; `STATUS.md:3` | **Nuancé.** `STATUS.md:3-12` invalide bien les pilotes 1,5B et 7B (fuite de fixture), mais la `.tex` de Paper 1 ne les rapporte pas (aucune occurrence de « 1.5B », « 7B » ou « Qwen ») ; ce qu'elle garde, c'est « Three of four pre-registered hypotheses passed » sur données synthétiques (`build/full-draft.tex:1100-1103`) | déjà M1 |
| K3 | 62 | E1-small n'est pas confirmatoire | `docs/osf-amendment-e1-small-2026-10-30.md:58,102` | **Confirmé** (`:60-72` : moyennes partielles lues sur 266/1 410 cellules le 30/10 à 13:12 ; `:100-106` : H14-A/B/C exploratoires) | déjà (points clos, §4) ; la cause (lecture intermédiaire) est une précision nouvelle |
| K4 | 80 | Paper 2 = le même mock derrière deux noms | `paper2/build/full-draft.tex:110,203,500` | **Confirmé** | déjà M1 (gravité discutée, §2 v2) |
| K5 | 102 | Split EEG Sleep-EDF : permutation aléatoire des époques d'un même sujet, docstring « no shuffle leak » | `nerve-wml/scripts/eeg_preprocess_sleep_edf.py:113,123,156,184` | **Confirmé** (`:120` docstring « Time-respecting split … (no shuffle leak) » ; `:122-126` `rng.permutation(n)` puis découpe ; tous les sujets concaténés `:184`). Gravité ramenée à MAJEUR : le papier ne revendique pas de généralisation inter-sujets (`papers/paper1/main.tex:602-616`), mais « Claim B holds on real EEG » (`:644`) repose sur ces partitions | **nouveau → C1** |
| K6 | 132 | Facteur ½ de l'énergie absent du code | `kiki-flow-research/paper/main.tex:184` ; `paper_f.py:88,153` | **Confirmé** ; gravité MAJEUR conservée (Codex lui-même : « on peut absorber ce facteur dans une convention sur J ») | déjà M10 |
| K7 | 136 | L'ancienne interprétation JKO ne tient pas ; 67,79× et figures à rattacher à leur version | `paper/main.tex:471` | **Confirmé** | déjà B10, B7 |
| K8 | 179 | Atelier : gradient du couplage `2λJρ` faux si J asymétrique (doit être `λ(J+Jᵀ)ρ`) | `paper/workshop/section_4_method.tex:41` ; `query_conditioned_f.py:75,99` | **Confirmé** (`section_4_method.tex:41` ; `query_conditioned_f.py:99` commentaire « 2 * lambda_j * sum_t J_{s,t} * rho_t »). **Inerte dans les runs** : `coupling_matrix=None` → zéros (`:48-50`), cf. B9 | **nouveau → C2** (latent) |
| K9 | 199 | Holevo appliqué à des espérances exactes ; contre-exemple à 1 qubit | `micro-kiki/docs/paper-a/c5-info-bound.tex:19` | **Confirmé** (`c5-info-bound.tex:22-30`) | déjà B13 |
| K10 | 201 | Fano : entrée numérique historique invalide ; cache C5 non recalculé | `src/routing/info_bound.py` | **Nuancé** : le code est corrigé (Ross joint, troncature H(Y), `info_bound.py:10-20`) ; le JSON `results/c5-info-bound.json` n'est pas régénéré (le docstring le signale `:10-12`) | déjà B13 (étend) |
| K11 | 225 | « Null-space superflu sur MoE » non établi | `paper/micro-kiki.tex:254,273` ; `src/eval/forgetting.py:589,598` | **Confirmé** sur le fond ; gravité MAJEUR conservée (article d'ingénierie, affirmation retirable) | déjà M19 |
| K12 | 229 | NH-81 : R = J_dense/J_spiking < 1, pas d'économie | `results/nh81/summary.json` ; PR #19 | **Confirmé** (0,9095 [0,833 ; 1,007] et 0,670 [0,662 ; 0,677] concordent avec M21) | déjà M21, E12 |
| K13 | 235 | QMoE : PCA et évaluation sur les données d'entraînement | `micro-kiki-quantum/src/experiments/qmoe_3domain.py:58-73` | **Confirmé** | déjà M23 |
| K14 | 258 | bouba : erratum « tout à chance » contre corps qui garde invariant et asymétrie | `bouba_sens/docs/paper/main.tex:565,652,703,749,1241` | **Confirmé** | déjà B15 (devient doublement sourcé) |
| K15 | 260 | Intervention confondue avec changement de monde (ADR-0027) | `docs/adr/0027-…md:20,54` | **Confirmé** | déjà M28 et B16 |
| K16 | 262 | Tenseurs historiques perdus | `docs/paper/main.tex:507` | **Confirmé** ; MAJEUR conservé (revendication retirable) | déjà M27 |
| K17 | 295 | Portes × gradient annulées par AdamW | `baby-brain/baby_brain/ontogeny/integration.py:93` ; `__main__.py:458,1519` | **Confirmé** | déjà B18 |

## MAJEUR de Codex (34) et tableau des références

| K | l. | Résumé | Fichier cité | Verdict (preuve) | Statut |
|---|---|---|---|---|---|
| K18 | 51 | DR-4 : inclusion des choix ≠ monotonie de l'algorithme | `docs/proofs/dr4-profile-inclusion.md:64` ; `build/full-draft.tex:491` | **Confirmé** : le lemme porte sur `best(P_equ,S) ≥ best(P_min,S)` (`dr4-profile-inclusion.md:62-66`), la `.tex` en tire un ordre « in expectation » (`build/full-draft.tex:490-493`) | **nouveau → C3** |
| K19 | 53 | Pilote : 3 graines, pas 15 unités ; agrégé par graine, t(2) = 10,55, p = 0,0044 | `experiments/h1_split_mnist/results_h1_v2.csv` | **Confirmé par recalcul** : apparié t = 2,524, p = 0,01216 ; Welch t = 2,437, p = 0,0143 ; par graine (différences 0,0796 / 0,0599 / 0,0820) t = 10,55, p = 0,00443 | **contredit en partie B2** → B2 rétrogradé MAJEUR (voir §2 v2) |
| K20 | 55 | R1 hache les entrées, pas les sorties | `build/full-draft.tex:907` | **Confirmé** (`:905-909` : `run_id` = hash de `(c_version, profile, seed, commit_sha, benchmark_version)`) | déjà M2 (étend) |
| K21 | 63 | Nouveaux brouillons G4-nono, DR3, E1 35B : pas de résultat | `docs/osf-*` | **Non vérifié** (recommandation, pas un constat d'erreur) | — |
| K22 | 82 | Paper 2 annonce encore le semi-groupe libre ; Davies 2018 = Loihi 1 cité pour Loihi 2 | `paper2/build/full-draft.tex:148,235,377,746` | **Confirmé** (Davies 2018 cité « Loihi-2 » `:377,746,765`) | B1 (propagation) ; Davies nouveau, MINEUR |
| K23 | 104 | Capacité « appariée » = largeur seulement ; MLP multicouche contre population LIF unique | `nerve-wml/papers/paper1/main.tex:193` ; `track_w/mlp_wml.py:54` ; `lif_wml.py:50` | **Confirmé** pour la définition (`main.tex:193-196` : « d_hidden = n_neurons ») et l'architecture ; le décompte 4 288 contre 2 384 paramètres n'est pas refait | **nouveau → C4** |
| K24 | 106 | Alignement ≠ transmission ; cause commune ; DPI interdit à la VQ d'augmenter la MI | `main.tex:582` | **Confirmé** sur le principe | déjà B3, B4 (sous un autre angle) |
| K25 | 110 | Pas de plancher de divergence prouvé ; Bastos inversé | `main.tex:74,327,359` | **Confirmé** | déjà M5, B5 |
| K26 | 112 | Entropie spectrale en nats ; facteur 4 appelé « deux ordres de grandeur » | `main.tex:751,1030` | **Confirmé** (`main.tex:751` : d ∈ {32, 64, 128}) | nouveau, MINEUR |
| K27 | 114 | Rétractation N-3 adéquate ; ne pas recycler | `main.tex:970-994` | OK (pas une erreur) | — |
| K28 | 134 | W₂ sur mesures signées ; Hessienne positive ≠ convexité géodésique | `paper/main.tex:173,245,853` | **Non vérifié** (argument mathématique plausible) | proche de B7 |
| K29 | 138 | Ablation full/symmetric tautologique ; référence Gibbs | `paper/main.tex:509` | **Nuancé** : l'inertie du drift asymétrique est déclarée par les auteurs (`main.tex:545-552`) ; la référence Gibbs est notre M11 | déjà M11 |
| K30 | 140 | Bénéfice CL-LLM : différences appariées SST-2 p = 0,166, CoLA p = 0,0144 | `bench/cl_llm/runs/e3_5k_5seeds_summary.json`, `e4b_5seeds_summary.json` ; `main.tex:783` | **Confirmé par recalcul** : SST-2 Δ = 0,0344, IC 95 % [−0,0220 ; 0,0907], p = 0,166 ; CoLA Δ = 0,0196 [0,0064 ; 0,0327], p = 0,0144 (non corrigé). Le texte écrit « 3.4× the E3 baseline std » (`main.tex:780-784`) | **nouveau → C5** (précise §4 kfr) |
| K31 | 181 | Atelier : état = 4 simplexes (dim. 124), pas Δ¹²⁷ ; « free energy » interprétatif | `section_3_method_overview.tex:23` ; `section_4_method.tex:103` | **Non vérifié** | — |
| K32 | 183 | Atelier : 0,0002 = 0,8 sd, pas « 8 sd » | `section_5_experiments.tex:90,137,153` | **Confirmé** | déjà M13 |
| K33 | 203 | Le négatif VQC tient mieux que l'explication ; Du thm 4 hors sujet | `results/c3-c1-rerun.json` ; `paper-a-v2.tex:169` | **Nuancé** : concorde avec notre inventaire (Du « Théorème 4 » = attribution douteuse) | déjà (réf. douteuses mk, B13) |
| K34 | 205 | Oracle − aléatoire = +0,29 [−0,13 ; 0,71] | `results/c2-downstream.json` | **Confirmé** (mêmes chiffres que M22) | déjà M22 |
| K35 | 207 | « 99 s » pour deux charges ; 3 000× non égalisé | `paper-a-v2.tex:46,52` | **Confirmé** | déjà M22 |
| K36 | 223 | 46,4 % et « 2,2× » viennent de deux expériences ; « 1,1 TB » | `paper/micro-kiki.tex:151,195,203` | **Confirmé** (`:76` et `:521` accolent 46,4 % et 2,2× ; `:187` : 2,2× vient de l'ablation sur validation augmentée) | déjà M18 (partiel) ; aspect nouveau → C6 |
| K37 | 227 | Couche cognitive sans gain global | `paper/micro-kiki.tex:305` | **Confirmé** | déjà M16 |
| K38 | 237 | QPEFT local ≠ papier QPEFT ; Ry au lieu de Z | `micro-kiki-quantum/src/qpeft/*.py` | **Nuancé** : l'écart de méthode est confirmé (M23) ; le détail Ry/Z n'est pas revérifié | déjà M23 |
| K39 | 264 | bouba : concepts non identifiés par les métriques ; Amedi, Sidhu | `docs/paper/main.tex:111,117,1061` | **Confirmé** (concorde avec `inventory/refs/bouba_sens-refs.md` : Amedi DOUTEUSE, Sidhu ATTRIB-KO) | déjà M39, §5 |
| K40 | 266 | Seuil B-3 de 0,02 non calibré | `docs/paper/main.tex:371` | **Confirmé** | déjà (MINEUR bouba, ADR-0026:353-355) |
| K41 | 268 | Le nul apparié par items ne couvre pas la variabilité des réseaux | `docs/adr/0026-…md:155` ; PR #66 | **Nuancé** : même diagnostic que M25-M26 sous un autre angle | déjà M25, M26 |
| K42 | 272 | « no estimator crosses +0.10 on any seed » contre « seed 3 (+0.120) crosses » | `docs/paper/main.tex:926` | **Confirmé** (`main.tex:88-89` contre `:926-928`) | **nouveau → C7** |
| K43 | 297 | E1 contre E0 change plus d'un facteur | draft l.500 | **Confirmé** | déjà B19 (Codex ne voit pas le tirage NEONATE) |
| K44 | 299 | Règle IC non chevauchants ; p minimum 1/32 à 5 graines | draft l.512, 625 | **Confirmé** | déjà M29 |
| K45 | 320 | Seuils de capacité ; C2 amendé après pilote | `rescience-nh01/article/content.tex:115,198` | **Nuancé** : fait exact, mais déclaré par l'article lui-même (`content.tex:194-203`) | déjà M34 |
| K46 | 324 | m = 0,30 : 44× calculable à T = 0, pas à T = 0,2 | `content.tex:422` | **Confirmé** | déjà E5 |
| K47 | 326 | Ablation diagonale disponible ; C5 inconclusive, C6 positif ; « les auteurs le disent correctement » | `nerve-wml/docs/results/2026-10-31-nh01-diagonal-ablation.md:7,28,34` | **Nuancé** : chiffres exacts ; Codex ne calcule pas le rapport C1 (1,904 avec diagonale) et ne relève pas que l'article gelé écrit « We did not run an ablation with the diagonal kept » (`content.tex:219-222`) | **nuance B21** (désaccord tranché en §2 v2) |
| K48 | 342 | La note méthodo ne démontre pas d'efficacité causale | `paper/sections/00-agents.md:28` | **Nuancé** (même diagnostic que M37) | déjà M37 |
| K49 | 344 | Note méthodo : SHA ActionSense faux, « aucune garde dans dream » trop général, 13 contre 12, « bit-exact », fenêtre de 36 h appelée 24 h | `03-chain.md:96,119,340` ; `04-errata.md:71` ; `manuscript.md:47` | **Confirmé** : `b8010424…` est le SHA du manifeste brut (`bouba_sens/docs/prereg/actionsense-v0.7/freeze-manifest.md:45`), pas du manifeste de gel (`03-chain.md:96`) ; « twenty-four-hour window » pour 30/10 00:00 → 31/10 12:00 (`manuscript.md:47-48`) ; `dream-of-kiki/scripts/e1_harness.py:105-112` vérifie bien un manifeste FROZEN, contre « the guard does not exist » (`03-chain.md:117-120`) | 13/12 = M35, bit-exact = B22 ; SHA, fenêtre, garde **nouveaux → C8** |
| K50 | 386 | Attributions erronées (van de Ven, Rasch, Saxe, Diff-eRank, Zhao, MoLA, Hajizada, RecursiveMAS, Sharon, Manoach, DOI nerve dans bouba) | `.bib` cités | **Confirmé** ; **corrige notre inventaire** : DataCite résout 10.5281/zenodo.19666405 en « nerve-wml v1.3.0 » (requête du 01/11), et non v1.1.1 comme l'écrit `inventory/refs/bouba_sens-refs.md:28` | déjà M39 ; correction d'inventaire |
| K51 | 403 | 21 placeholders « Anonymous » dans Dream P1 | `paper1/references.bib` | **Confirmé** (mêmes 21 clés) | déjà M39 |
| K52 | 426-436 | Références réelles qui ne soutiennent pas la phrase (dok, P2, nerve, Flow, atelier, C5, système, bouba, bb, rn, pm) | tableau §3.3 | **Confirmé** dans l'ensemble ; les 7 citations absentes du `.bib` de l'atelier sont nos « 7 citations pendantes » | déjà §1, M38, M39 |

## Comptes de références : pourquoi ils diffèrent

Codex : 351 entrées (chaque apparition, variantes FR et bundle comprises), 280 OK, 38 KO, 33 NV. Notre v1 : 332 entrées, 238 OK, 77 avec défaut, 17 invérifiables. L'écart vient de la définition. Codex ne compte en KO que les **notices** fausses (identité, auteurs, métadonnées) et traite à part l'appui des phrases (§3.3). Nous comptons en défaut aussi les **attributions douteuses** (24 sur 77). Un seul vrai désaccord : Codex donne baby-brain 30/30 OK, alors que deux entrées ont une clé et une année incohérentes (`jaegle2022perceiverio`, `oquab2024dinov2`, `inventory/refs/baby-brain-refs.md:46,48`) ; défaut de forme, sans conséquence.

## Couverture de nos 22 BLOQUANT v1 par Codex en aveugle

- **Trouvés seul, en entier (5)** : B1, B13, B15, B18, B22.
- **Partiellement (11)** : B2 (non-indépendance vue, conclusion inverse), B3 et B4 (cause commune et DPI, sans l'argmax de π ni le nul conditionné), B5 (effets de procédure, sans le sous-entraînement), B7 (versions de 67,79×, sans l'artefact de grille), B9 (J nul vu pour la portée du gradient, sans `apply_w2_prox=False`), B10 (« résultats récents absents du récit »), B16 (trouvé **après** levée de l'aveugle, §5.2), B17 (≥ contre > et porte d'apprentissage), B19 (curriculum, sans le tirage NEONATE), B21 (MAJEUR, sans le rapport C1).
- **Pas trouvés (6)** : B6, B8 (E1b REFUTED), B11 (LeCun sous un identifiant Copilot), B12 (Arslan), B14 (juge à l'index 0), B20 (rêve identité). B23 (profil `.github`) était hors de son périmètre.

## Références 2025-2026 de Codex vérifiées par la page arXiv (01/11, User-Agent générique, ≥ 3 s entre identifiants)

| arXiv | Titre lu sur la page abs | Absent de nos veilles ? |
|---|---|---|
| 2609.27252 | What Converges in the Platonic Representation Hypothesis? Structure over Geometry | oui |
| 2606.00732 | SHARP: Sleep-based Hierarchical Accelerated Replay for Long Range Non-Stationary Temporal Pattern Recognition | oui |
| 2605.31369 | A Unifying View of Variational Generative Wasserstein Flows | oui |
| 2609.03150 | Routing Is Not Enough: Diagnosing Intra-Adapter Subspace Contention in MoE+LoRA Fine-Tuning | oui |
| 2606.05115 | Continual Visual and Verbal Learning Through a Child's Egocentric Input | oui |

Les cinq titres sont conformes. Codex note que la plupart sont déjà cités dans les dépôts ; le reproche est qu'ils ne sont pas **discutés** là où ils contredisent le texte (2609.03150 dans le papier système micro-kiki, en particulier). Incident mineur : le script a fait deux requêtes par identifiant (une inutile), toujours espacées de 3 s entre identifiants.
