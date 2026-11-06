# Passe croisée sur `synthese/rapport.md` (v2)

*Passe croisée de remplacement, Claude Opus critic, 2026-11-01. Elle remplace gpt-6-astra, hors quota jusqu'à 20:50. Contexte vierge : `critique.md` a été lu seulement après la formation de l'avis. Toutes les vérifications ont été faites en lecture seule dans `scratchpad/clones/` (SHA conformes à §1 : dok 8a7e8468d2e8, nerve fee6ababb7b1, kfr 8470e93a41bb, mk 61056d9d9e34, bouba 6f224d172578, bb 376fe83824eb, rn f6e97fd62cdd, pm 01d76c8bc094, `.github` efa7b86). Quatre recalculs ont été faits en CPU léger : C1 de l'ablation diagonale, la différence appariée de C5, les zéros structurels du pilote dok, et le point fixe gaussien du schéma E1b (B8). Les chemins sont relatifs à `clones/`.*

**Verdict : ACCEPTER AVEC RÉSERVES, après trois corrections.** Le fond est solide :

- 24 des 28 constats B*/C* sont confirmés à la source.
- 4 sont nuancés, aucun n'est réfuté.
- Les 36 corrections de la critique sont appliquées.

Trois points doivent toutefois changer avant diffusion :

1. Le cadrage « rapport divisé par deux avec la convention de l'original » (§2, §7 Q1/Q3) est plus fort que les données.
2. Un décompte de tests significatifs de Me6 subsiste en §4.
3. La provenance (§0.11, §8) annonce encore astra « en cours ».

Mode : THOROUGH, sans escalade. Aucun CRITIQUE ne touche les faits.

## 1. Tableau de vérification B* / C*

| # | Verdict | Preuve (path:line) et remarque |
|---|---|---|
| B1 | **confirmé** | `dream-of-kiki/docs/proofs/dr2-compositionality.md:118-131` ([P], (C), (B), (F)) et `:139-145` ((A) déclarée « independent of [P] »). (RESTRUCTURE) et (REPLAY) satisfont chacun [P], mais leur concaténation dans cet ordre ne le satisfait pas : la classe n'est pas close. L'origine `ValueError addmm` est confirmée (`specs/amendments/2026-04-21-dr2-empirical-falsification.md:31-37`). |
| B3 | **confirmé** (sur le code) | Codes = `pi.argmax(-1)` (`nerve-wml/scripts/measure_info_transmission.py:100-101,106`). La tête est entraînée sur les `n_classes` premières colonnes (`track_w/training.py:31-33`), avec `n_classes=12` (`measure_info_transmission.py:75`). `idx = dist.argmin` ne sert qu'à la perte VQ (`training.py:36-39`). Les chiffres 0,998/0,999/0,798 restent ceux de l'agent. **Équité** : le papier écrit lui-même « argmax codes from each substrate's π head » et donne MI/H ≈ 0,095 sur les embeddings continus (`papers/paper1/main.tex:372,374`). Seul le label « post-VQ » est trompeur. |
| B4 | **nuancé** (non reproduit) | « 18.8× the random baseline » est confirmé (`main.tex:55,443,470`). Le nul intra-cluster de 0,06 et l'excès de 2,5-3 viennent de `work-nerve/mknn.py`, dont la sortie n'est pas archivée. Je ne l'ai pas rejoué (calcul torch). Le tableau a raison de le garder « agent seul ». |
| B7 | **confirmé** (faits) ; artefact PLAUSIBLE | `kiki-flow-research/experiments/check_lambda_monotonicity.py` : `apply_w2_prox=False` (l.308), potentiels `np.zeros` (l.289), `--grid-size 64`, `h` 0,002 (l.417-421). La phrase « regime of Theorem 3.4 » est à `paper/main.tex:268-272`. **Le rapport ne le dit pas** : `paper/lambda_monotonicity.json` donne `n_pairs: 3` (5 par défaut) et `fit_points: 9`. λ̂ = 67,79 ± 3,78 est donc l'écart-type de 3 pentes, chacune ajustée sur 9 points du transitoire initial. |
| B8 | **confirmé**, renforcé par une dérivation analytique | Pente 0,600, verdict « REFUTED » (`experiments/results/e1b_peyre_bias.json:124,130`), fenêtre [0,45 ; 0,55] (`e1b_peyre_bias_preregistered.py:23,62`). Coût `sqeuclidean`, noyau `exp(-cost/reg)` (l.136-138), facteur `exp(-tau*v/reg)` (l.85). Bras nul : `y = x/(1+τ)` (l.110). Point fixe gaussien du schéma codé à τ = 1 : variance = 0,6 ε **exactement**, ce qui reproduit le JSON. Avec `exp(-2τV/reg)` (même pas que le nul), on obtient ε/3. Quand τ → 0, le schéma codé tend vers ε/(2τ) et le schéma cohérent vers ε/(4τ). L'inférence « loi retrouvée seulement par un pas mal étiqueté » tient donc. **Nuance** : le texte écrit `Var* = (ε/τ) g(τ)` avec `g → 1/2` (`main.tex:838-840`). Le REFUTED à τ = 1 est un effet de pas fini que le texte couvre en partie. |
| B9 | **confirmé** | `kiki_flow_core/track3_deploy/jko_oracle_runner.py:96,110` (`apply_w2_prox=False`) ; `query_conditioned_f.py:48-49` (J = 0). Le texte dit « combined with the Wasserstein proximal operator » (`paper/workshop/section_3_method_overview.tex:30-31`) et λ_J = 0,1 (`section_4_method.tex`). |
| B10 | **confirmé** | `paper/main.tex:33,342,491` (γ ≥ 20, « full JKO scheme ») ; `ERRATUM.md:603` (§14, 27/10) ; `CITATION.cff:37-38` (DOI 23636477 du 25/10). |
| B11 | **confirmé** | 2206.15331 est cité aux l.12, 26, 62, 271 et 374 de `micro-kiki/docs/papers/paper-a-draft-v1.md`, et en reframe FR l.15, 44. Précision : l'identifiant apparaît dans **6 fichiers** (4 papiers + `docs/research/vqc-conditioned-aeon-predictor.md` + un plan). |
| B12 | **confirmé**, désormais relu à la source | `grep -c "Arslan\|2601.15311" docs/papers/paper-a-draft-v1.md` = 0. La spec écrit « we adopt it as-is » (`docs/specs/2026-04-15-cognitive-layer-design.md:28`). B12 ne repose donc plus sur un seul agent. |
| B13 | **confirmé** | `docs/paper-a/c5-info-bound.tex:22-30` (I ≤ N pour des ⟨Z⟩ exactes) ; `docs/ERRATA.md:129-130` (min(I, N, H(Y))) ; « 0.91 » retiré à `paper-a-v2.tex:111`, mais encore présent à `:175`, qui est bien dans `\section{Conclusion}` (l.173). |
| B14 | **confirmé** | `src/serving/full_pipeline_server.py:822-824,890` ; `src/cognitive/judge.py:53-54` (`winner_idx=0`) ; `src/cognitive/rbd.py:39-41` (`biased=False`) ; `paper/micro-kiki.tex:116-117,297`. |
| B15 | **nuancé** | Les formulations du corps sont confirmées : « PASS 3/3 » (`bouba_sens/docs/paper/main.tex:346`), « every world » (`:462`), « architectural-invariant » (`:566`), « minimal configuration » (`:757`). La lettre TMLR cite « Eighteen ADRs (0004..0017) » (`cover-letter-tmlr.md:36`). **Inexact** : « ADR-0020, 0022, 0024 … manquent ». Le corps cite ADR-0020 (l.57, 134, 573, 1042, 1050), ADR-0022 (l.383) et ADR-0024 (l.1245). Seuls 0026 et 0027 sont absents. L'inventaire disait « l'abstract omet » (`inventory/bouba_sens.md:168`). |
| B16 | **confirmé** | `grep k-steps scripts/*.sh` est vide ; `lesion_args` sans `--k-steps` (`scripts/run_grid.sh:166-175`) ; défaut 5 000 (`src/bouba_sens/cli.py:547`) ; rampe (`lesion.py:47-57`). 20 − 40 × 99/5 000 = 19,2 dB, et 10^(−19,2/20) = 0,11. La phrase « no lesion effect » (`main.tex:1232`) porte sur la grille straight-through 300-309 (`docs/adr/0027-…:59,88`). |
| B17 | **confirmé**, désormais relu à la source | `docs/osf/amendment-v0.7-actionsense.md:408` (« > ») contre `:437` (« ≥ ») ; `:439-440` (« no multiple-comparison correction ») ; aucune occurrence de `k_steps`, `K_STEPS` ni de porte d'apprentissage ou de manipulation ; tag `bouba_sens/v0.7-actionsense-prereg` sur 02c2407. |
| B18 | **confirmé** | `baby_brain/ontogeny/integration.py:93-109` (gradient × porte) puis `optimizer.update` (`__main__.py:457-460`) ; AdamW (`:1519-1523`), β = (0,9 ; 0,95) (`training/config.py:31`). Les nuances (porte méta-plastique, transitoire) sont reportées. |
| B19 | **confirmé** | `__main__.py:224-230` (toujours NEONATE), `:1709-1711` (profondeur par stade) ; `adapters/dream_mlx.py:26-34` (profil de rêve par stade). |
| B20 | **confirmé** (nuance) | `dream_mlx.py:89-97` renvoie `episode.workspace_latents`. Le harnais passe `None` (`ontogeny/harness.py:253-256`). `apply_consolidation` n'existe qu'en `getattr` optionnel (`loop/replay.py:121`). Nuance : `execute_profile` mute **en place** le débruiteur d'un substrat M7 instancié à part (`dream_mlx.py:72-73,88`), sans lien avec le WML. Mieux vaut écrire « ne modifie pas le WML » que « ne modifie rien » (§0.2). |
| B21 | **nuancé** (chiffres confirmés, cadrage trop fort) | Recalcul depuis `nerve-wml/results/nh01_diagonal_ablation/summary.json` : R_diag = 1,904, IC t [1,849 ; 1,959] (le [1,861 ; 1,951] du rapport est un bootstrap, à préciser) ; R_offdiag = 3,898 ; différence 0,226 [0,218 ; 0,234], donc « ni confirmé ni réfuté » sous `rescience-nh01/article/content.tex:180-183`. Phrase gelée : `:217-222`. **Raté** : la division par deux vient surtout du dénominateur. La capacité rêvée à t = 10 baisse de 22 % (0,611 → 0,477), alors que la base de Hebb monte de 60 % (0,157 → 0,250). Avec la base de Hebb standard (J_ii = 0), le rapport vaut **3,05 [2,99 ; 3,10]**. Voir §4. |
| B22 | **confirmé** (localisation à préciser) | « replicates … bit-exactly » : `paper-methodo-2026/paper/sections/03-chain.md:340-341`. La phrase suivante corrige en partie : « a statement about the lab's code, not about the phenomenon ». « never 44× » se trouve à `paper/manuscript.md:52` (TODO), pas aux l.233-235, qui énoncent la règle générale. Aucun « diagonal » dans pm. La contradiction avec `content.tex:428-431` (44,38 défini à T = 0) est confirmée. |
| B23 | **confirmé** | `.github/profile/README.md:55` (70.7 %, 89.5 %, CAMP, KnowBias), commit efa7b86. |
| C1 | **confirmé** | `nerve-wml/scripts/eeg_preprocess_sleep_edf.py:120-126` (`perm = rng.permutation(n)` au sein d'un sujet, docstring « Time-respecting ») et `:186-191` (concaténation). L'en-tête l.17 annonce même « Patient-wise train/val/test split ». `main.tex:644` : « Claim B holds on real EEG ». |
| C2 | **confirmé** | `query_conditioned_f.py:75-82` (énergie λ Σ J_ij ρ_i·ρ_j) contre `:99-106` (gradient 2λ Σ_t J_st ρ_t) ; `section_4_method.tex:40-41`. Le gradient exact est λ Σ_t (J_st + J_ts) ρ_t. |
| C3 | **confirmé** | `dream-of-kiki/docs/proofs/dr4-profile-inclusion.md:62-66` (`best(P_equ,S) ≥ best(P_min,S)`) contre `docs/papers/paper1/build/full-draft.tex:490-493` (« in-expectation »). |
| C4 | **confirmé** (qualitatif) | `main.tex:195-196` (`d_hidden = n_neurons`) ; `track_w/mlp_wml.py:54-75` (4 couches d × d) ; `lif_wml.py:45-75` (une population). Le décompte de paramètres n'a pas été refait. |
| C5 | **confirmé** (recalculé) | SST-2 : différence appariée 0,0344, IC95 [−0,022 ; 0,091], t(4) = 1,69, p ≈ 0,166. CoLA : 0,0196 [0,0065 ; 0,0327], t(4) = 4,14, p ≈ 0,014. Sources : `bench/cl_llm/runs/e3_5k_5seeds_summary.json`, `e4b_5seeds_summary.json`, `paper/main.tex:782-786`. |
| C6 | **confirmé** | `micro-kiki/paper/micro-kiki.tex:76,521` (46,4 % accolé à « 2.2× ») ; `:187` signale lui-même l'autre jeu de validation. |
| C7 | **confirmé** | `bouba_sens/docs/paper/main.tex:87-89` (« no estimator crosses +0.10 on any seed on the Gaussian reference ») contre `:926-927`. Le tableau porte bien sur le monde gaussien (`:900-902`). |
| C8 | **confirmé** pour (i) et (ii), **nuancé** pour (iii) | (i) `03-chain.md:96` cite `b8010424` ; `bouba_sens/docs/prereg/actionsense-v0.7/freeze-manifest.md:45` le donne comme SHA du manifeste **brut**. (ii) De 30/10 00:00 à 31/10 12:00, il y a 36 h (`manuscript.md:47-48`). (iii) `dream-of-kiki/scripts/e1_harness.py:108-115` refuse un manifeste FROZEN non conforme : c'est une garde de lancement, mais sans tag. La phrase de pm est fausse au sens de §3.2 (« code in the launch path that refuses »). |

**Comptes : 24 confirmés, 0 réfuté, 4 nuancés (B4, B15, B21, C8).** Sens des chiffres revérifié : 19,2 dB, 0,226 > 0,1, 50/60 (M15), 5 lignes mock à p ≥ 0,996 (M25), gtm_mis 0,81 contre 0,54-0,73 (M8, `n10c-bis-control-arms.md:303,328`), Δ −0,0102 (M16).

**Lignes « Fait » qui contiennent une inférence :**

- B8 : la formule « au lieu de `exp(-2τV/reg)` » est normative et dépend de la convention. **Écrire** : « le bras entropique utilise `exp(-τV/reg)` avec un noyau `exp(-|x-y|²/reg)`, soit un pas effectif τ/2, alors que le bras nul applique un pas τ (`y = x/(1+τ)`) ».
- B21 : « la courbe culmine à t = 1 ». La grille ne localise le pic que dans ]0 ; 3[ (note du labo). **Écrire** : « culmine sur la grille à t = 1 ».
- M8 : les taux de 8 % et 24 % supposent un effet vrai de 0,30 (à dire).

## 2. Errata §3 vérifiés

| E | Verdict | Preuve |
|---|---|---|
| E1 | exact | `grep -rli holevo micro-kiki-quantum` ne renvoie rien ; Holevo apparaît à `micro-kiki/docs/paper-a/c5-info-bound.tex:22-30`. |
| E2 | exact | `kfr/docs/results/2026-10-30-m5-certify-verdict.md:9-26` (12/12/11/10/5 ; 9 des 10 échecs à γ = 20-30). |
| E3 | exact | `mk/docs/SESSION-2026-04-19-INDEX.md:86,96` (Task 14 notée « Strong », aucune rétractation). |
| E4 | exact | `rn/article/content.tex:137-146`. |
| E5 | exact | `content.tex:428-431` (44,38 défini à T = 0, m = 0,30 ; plage de 30 à 65) ; seul T = 0,2 est censuré. |
| E7 | exact | `kfr/paper/main.tex:755-757` (0,361 = oubli SST-2). |
| E8 | exact en tant qu'inférence | « vraisemblablement » est conservé. J'ajoute n_pairs = 3 et 9 points d'ajustement (B7). |
| E9 | exact | `run_grid.sh:166-175`. |
| E10 | **à nuancer** | Sur les 6 lignes (`dok/docs/papers/paper2/results.md:855-862`), le « doublon » est CIFAR-100 à N = 30 et à N = 95 (confirmatoire Studio) : ce n'est pas un doublon strict. Une ligne est un Jonckheere, pas un Welch. |
| E11, E15 | exacts | Voir B3 et B8. |
| E12 | exact sur R ≤ 1 | 0,670 n'est pas sur `main` (PR #19) : invérifiable dans le clone. Le noter. |
| E18 | exact | Fachechi : 1 occurrence dans `full-draft.md`, 2 dans `references.bib`, 0 dans `build/full-draft.tex`. |
| E6, E13, E14, E16, E17, E19 | non revérifiés | « agent seul » ou hors clone (résumé arXiv, issue #147, `scale.md`) ; marquage du rapport correct. |

Les comptes sont justes : 14 erreurs (E1, E3-E8, E10-E12, E14-E16, E19) et 5 dépassées (E2, E9, E13, E17, E18).

## 3. Phrases à retirer ou reformuler (campagnes en cours)

1. **§4, puce bouba**. « 16 lignes conformes aux JSON, **5 sous 0,000625** ». C'est un décompte de tests significatifs au seuil de Bonferroni de Me6 (`bouba_sens/docs/milestones/2026-10-31-me6-large-n-results.md:41-61`). Il vaut verdict de fait sur une campagne que le PI tient pour ouverte (nul réseau #66 en révision). **Remplacer** par : « 16 lignes conformes aux JSON ; écarts déclarés ; aucune lecture ici ».
2. **M25**. « Inférence : sous un prédicteur constant, le nul par blocs est sur-dispersé ». Cette phrase lit des sorties Me6 (mock). **Reformuler** : « Le labo documente lui-même un diagnostic de sur-dispersion du nul par blocs sous prédicteur constant (`amendment-2026-10-31-diagnostic.md:39-42`) ; v0.7 doit le simuler avant données ».
3. **M8**. « le gain ne viendrait pas du contenu du message » est une conclusion de mécanisme sur N10-C-bis. Elle repose sur un run par bras, alors que le pilote GB300 de la même porte tourne aujourd'hui. **Remplacer** par : « un run par bras ne permet pas d'attribuer le gain au contenu du message ».
4. **§4, puce nerve**. « À 6 graines et σ 0,1-0,14, seuls des |Δ| ≥ 0,2 sont tranchés ». Ce n'est pas un verdict, mais σ est non apparié, alors que la même puce recommande l'analyse appariée par graine. **Écrire** : « en non apparié … ; la puissance appariée reste à calculer avant lecture ».
5. **§0.7**. « Me6 confirmatoire terminé ». Le statut est exact pour le calcul, mais il faut **ajouter** « (analyse non close, aucun verdict ici) » pour rester aligné sur la consigne.

Aucune phrase ne donne de verdict sur E1-small (§4 « Risque à déclarer avant lecture » est conforme) ni sur N10-C run 2 (§5 est conforme).

## 4. Incohérences, avec la correction exacte proposée

1. **B21, §2 « Désaccords », §7 Q1/Q3 : cadrage de la diagonale (le point le plus important).** Dans le Hamiltonien de Hopfield, les termes diagonaux J_ii s_i² sont une constante. La capacité α_c de l'original, calculée par la théorie des répliques à l'équilibre, ne dépend donc pas de la diagonale. Elle n'agit que dans la dynamique à T = 0 et dans l'estimateur, par le terme d'inertie que le labo décrit. L'article lui-même ne reproduit pas la courbe des répliques (`content.tex:45-48`). Parler de « convention de l'original » est donc ambigu. Avec la base de Hebb standard, le rapport vaut 3,05 [2,99 ; 3,10]. Corrections :
   - §2 Désaccords, remplacer « un fait postérieur au gel qui divise par deux le chiffre principal » par « un fait postérieur au gel qui change le chiffre principal selon la convention de diagonale : 1,90 avec la base de Hebb avec diagonale, 3,05 [2,99 ; 3,10] avec la base sans diagonale ; la capacité rêvée elle-même baisse de 22 % (0,611 → 0,477) ».
   - Q3 (a), remplacer la citation par « réplication partielle ; avec l'auto-couplage gardé dans la dynamique, le pic se déplace et le rapport C1 dépend de la base choisie (1,9 ou 3,0) ; trouvé après gel par une ablation préenregistrée par le labo ».
   - Q1 (a) et §0.3, ajouter « ; avec la base de Hebb sans diagonale, 3,05 [2,99 ; 3,10] ».
2. **§0.2 contre le tableau B4.** §0.2 dit « B4 et B12 restent sur un seul agent », alors que B4 porte « Codex partiel (cause commune) » et figure parmi les « 11 en partie » (§2). **Écrire** : « B4 n'a qu'un appui partiel de Codex ; B12 et B17 ont été relus à la source par la passe croisée de remplacement ».
3. **§0.9.** « 39 confirmées, 9 nuancées, 3 non vérifiées, 0 réfutée » fait 51, et non 52. **Ajouter** « 1 sans objet », comme en §2 et en §8.
4. **§0.11 et §8.** « Codex gpt-6-astra en cours » doit devenir : « gpt-6-astra hors quota jusqu'à 20:50 ; passe croisée remplacée par Claude Opus critic (`codex/report-cross-claude-replacement.md` : 28 constats B*/C*, 24 confirmés, 4 nuancés, 0 réfuté) ».
5. **B15.** Remplacer « ADR-0020, 0022, 0024, 0026 et 0027 manquent » par « ADR-0026 et 0027 sont absents ; 0020, 0022 et 0024 sont cités dans le corps mais pas dans l'abstract ».
6. **M38, action.** « Ajouter les entrées du §1 » renvoie à un §1 qui ne liste aucune entrée. **Écrire** « Ajouter les entrées de §5 (`veille/revue-de-fond-2026-11-01.md`) ».
7. **Q9.** L'option (a) cite « H0 sur résidus, contrôle 2 de #66 refait », qui relève de M26. **Renvoi** : « (B16, B17, M26) ».
8. **B21, IC.** Préciser « IC bootstrap par graine », puisque l'IC t donne [1,849 ; 1,959].
9. **§0.2.** « lésion trop faible pour agir (≈ 19 dB) » est une inférence, et aucune mesure de manipulation n'existe. **Écrire** « lésion arrêtée à 19 dB au lieu du plancher de −20 dB prévu ». De même, remplacer « rêve qui ne modifie rien » par « rêve qui ne modifie pas le WML » (B20).
10. **B22, preuve.** Remplacer `03-chain.md:233-235` par `:340-342` et `manuscript.md:52`.

## 5. Constats ratés (lecture des manuscrits et des artefacts)

1. **rn : la diagonale est un terme constant de l'énergie** (voir §4.1). C'est un argument de physique statistique qui manque au §2 comme au commentaire #147. Les rapporteurs de ReScience le soulèveront. Sans lui, la déclaration à l'éditeur surestimerait l'effet. Gravité : MAJEUR, parce que c'est le texte destiné à l'éditeur.
2. **kfr E1b : le REFUTED et le « recovered » dépendent du pas effectif** (B8). Le point fixe analytique reproduit 0,600 exactement. Le schéma cohérent avec le bras nul donnerait ε/3 à τ = 1 et ε/(4τ) quand τ → 0. Le texte et le préregistrement confondent donc deux conventions de régularisation. Il faut fixer la convention de noyau avant de re-préenregistrer ; écrire « REFUTED » ne suffit pas. Gravité : MAJEUR (complète B8).
3. **kfr λ̂ : faible base statistique** (`paper/lambda_monotonicity.json` : `n_pairs` 3, `fit_points` 9). Le ± 3,78 est l'écart-type de trois pentes ajustées sur neuf points du transitoire. On ne peut pas en tirer un « régime » au sens d'un théorème de contraction globale. Gravité : MINEUR (renforce B7).
4. **dok, pilote : zéros structurels et pseudo-réplication.** Dans `experiments/h1_split_mnist/results_h1_v2.csv`, l'oubli de la dernière expérience vaut 0,0 dans les 9 runs (3 graines × 3 conditions). Le t apparié du papier (`full-draft.md:905-911`) traite 15 lignes, dont 3 nulles par construction et 5 corrélées par graine, comme indépendantes. Le papier se contredit aussi lui-même : α primaire 0,00625 (`:635`) contre « α_per_hypothesis = 0.05/4 = 0.0125 » (`:655`). Le rapport cite l.635 mais pas cette contradiction interne, qui explique le « below α ». Gravité : MINEUR (complète B2).
5. **nerve : le papier publie déjà le contre-argument de B3.** `main.tex:374` dit que la quantification argmax « amplifies the apparent shared information by ∼10× ». `main.tex:99` déclare la convergence non nouvelle. B3 gagnerait à le dire : le défaut n'est pas caché, il est mal qualifié (« post-VQ », « Claim B holds »). Gravité : équité, MINEUR.

## 6. Provenance (§8) et critique précédente

- **Critique à contexte vierge** : j'ai contrôlé les 36 lignes dans la v2. **Les 36 sont appliquées.** Deux suggestions non numérotées restent sans suite : une annexe pour alléger §1 et §5 (critique (d)7) et une colonne « script » (critique (d)4, couverte en partie par §8). La note de provenance sur la source de « Me6 terminé » (`compute-status.md:7`) n'est pas traitée.
- **Codex sol croisé** : les comptes de §2 et §8 concordent avec `codex/verification-sol.md:7` (qui date K3 du 31/10 ; le rapport a raison : 30/10).
- **astra** : voir §4.4.

## 7. Équité

Le rapport reconnaît honnêtement ce qui tient :

- §1, « Solides » par dépôt : §5.8 et NH-03 de dok, Test 12, ERRATUM de kfr, négatif de Paper A ;
- §4, « Contribution réellement neuve » ;
- §6, « Actifs réels » ;
- l'ablation préenregistrée par le labo 58 s après son tag, mise en avant en §0.3.

La v2 a aussi corrigé ses propres excès : B2, B5 et B6 rétrogradés ; « lésion jamais appliquée » devenu « bruit faible » ; M32 réduit au seul « calibrated null ».

Trois rééquilibrages restent à faire :

1. **B21** : le labo a lui-même découvert, préenregistré et publié la nuance. Le rapport doit éviter d'en faire une division par deux sans réserve (§4.1).
2. **B3** : le papier publie déjà le 0,095 continu et l'amplification ×10.
3. **B8** : la formule en g(τ) couvre en partie le REFUTED à pas fini.

Plusieurs « Fait » reprennent des limites que les auteurs déclarent eux-mêmes : P_min = P_equ (dok `:928-932`), C2 → C2′ (rn `:197-203`), plage de 30 à 65 sur 44,38 (rn `:432-436`). Le rapport le signale en général, sauf pour B3.

**Les 3 corrections indispensables avant diffusion :**

1. Reformuler B21, §2 « Désaccords », Q1 et Q3 avec la base double : 1,90 avec diagonale, 3,05 [2,99 ; 3,10] sans. La diagonale est une constante énergétique, l'effet passe par la dynamique et l'estimateur.
2. Retirer « 5 sous 0,000625 » (§4 bouba) et reformuler M8 et M25 (campagnes ouvertes).
3. Corriger la provenance (§0.11, §8 : astra remplacé), le total 51/52 de §0.9, l'appui de B4 et B12 en §0.2, et la liste d'ADR de B15.
