# Inventaire — nerve-wml (relecture du 2026-11-01)

## 0. En-tête

- **Dépôt** : `hypneum-lab/nerve-wml`, clone `scratchpad/clones/nerve-wml`, SHA `fee6ababb7b177e123e77be92fbabf2df6feeef4` (HEAD 2026-10-31 22:58). PR #100 récupérée en ref locale `pr100` (lecture seule). Aucun fichier du clone modifié.
- **Lus en entier** : `papers/paper1/main.tex` (1114 l.), `papers/paper1/refs.bib` (34 entrées), `papers/paper1/supplementary/cknna-n-dependence-replication/supplementary.md` (308 l.) + son `refs.bib` (7), `docs/research-notes/paper-v1.7.0-review-response.md` (68 l.), `docs/adr/0001*`, `docs/adr/0002*`, `docs/milestones/n10c-procgen-multiagent-gtm-comm-amendment-2026-10-30.md` (52 l.), `docs/milestones/2026-10-25-n10c-bis-control-arms.md`, `docs/milestones/2026-10-25-nh01-hopfield-dream-vs-downscale.md`, `docs/results/2026-10-25-nh01-confirmatory.md`, `docs/results/2026-10-31-nh01-diagonal-ablation.md`, PR #100 `docs/prereg/n10d/protocol.md` (111 l.) + `nh96-null.md` (60 l.) + `experiments/n10d/null.py`.
- **Lus par extraits** : `track_w/tasks/hard_flow_proxy.py:25-74`, `scripts/track_w_pilot.py:429-509`, `scripts/measure_info_transmission.py:65-152`, `track_w/training.py:16-48`, `track_w/mlp_wml.py:56-90`, `track_w/bio_field_wml.py:1-30,185-205`, `experiments/procgen_multiagent_gtm_comm/coop_env.py:1-20`, `harness/comm.py`, `docs/superpowers/plans/2026-05-19-bio-substrate-wml.md:1864-1905`, README, CHANGELOG, JSON de résultats (`mi_multi_estimator.json`, `mi_null_model.json`, `w2_hard_n2_multiseed.json`, `baseline_frozen_encoder.json`, `transmission_full_protocol.json`).
- **Données binaires** : seul `tests/golden/codes_mlp_lif.npz` a été chargé (fixture de test, 3 graines × 5000 codes + embeddings 16-d) pour rejouer Claim B et le mKNN. Aucun checkpoint lu.
- **Activité** : `git log --since=2026-10-24` = 122 commits ; PR #54→#101 passées en revue (titres + diffs des PR touchant papier, N10-C, N10-D, NH-01). Ouvertes : #90 (balayage d'échelle NH-01), #100 (N10-D).
- **Calculs locaux** (CPU, < 2 min chacun) : `scratchpad/work-nerve/{hardtask_check,hardtask_check2,hardtask_check3,golden_check,mknn}.py`.
- **Durée** : ≈ 4 h 30 (dont ≈ 40 min perdues sur des quotas d'API bibliographiques).

## 1. État des lieux (≤ 15 lignes)

- Paper 1 (« nerve protocol », v1.8.x) est rédigé et compilable, mais n'a pas été déposé sur arXiv. `papers/paper1/README.md` annonce 15 pp et « 24/24 refs ». `SUBMISSION.md` annonce 14 pp. Le bib compte 34 entrées.
- Paper 2 n'existe que sous forme de figures (`papers/paper2/`), sans texte.
- Le supplément CKNNA est une réplication synthétique (gaussiennes) de la dépendance en n du CKNNA. Il est cohérent et modeste.
- N10-C (Procgen CoinRun-coop, 6 bras enregistrés + 4 bras « closed », 6 graines, 60 runs) est gelé et lancé.
- L'amendement du 30/10 déclare une deuxième brèche d'aveugle et enregistre le SWHID. Il demande aussi une analyse appariée par graine.
- N10-C-bis ajoute 4 bras de contrôle (gtm_mis, eng_gtmrx, gtm_warm, vq) et une porte de nécessité G1–G7 : eng − nocomm ≥ 0,20, 1 graine, 1 run par bras.
- N10-D (PR #100, ouverte) préenregistre une tâche référentielle asymétrique (NH-96) avec son nul simulé.
- NH-01 (noyau de rêve de Fachechi–Agliari–Barra contre downscaling) a des résultats confirmatoires (C1 = 3,86). Son ablation diagonale est « inconclusive ». L'article ReScience vit dans un autre dépôt.
- BioField (Phase 2 SNN-PC, PR #24) cite la bonne référence Lee et al. 2024. Elle n'est pas confondue avec arXiv:2409.05386, mais le mécanisme implémenté n'est pas celui de Lee (constat C6).
- B-3 et NH-81 ne relèvent pas de ce dépôt : ce sont bouba_sens et micro-kiki. Dans nerve-wml, « ref B-3 » désigne la référence Lee SNN-PC.

## 2. Lecture des papiers

### 2.1 Paper 1 — `papers/paper1/main.tex`, résumé section par section

| Section | Lignes | Résumé condensé |
|---|---|---|
| Abstract | 18-62 | Protocole de neuroletters (code 0..63, rôle π/ε, phase γ/θ) entre substrats hétérogènes. Chiffres annoncés : MI/H 0,91→0,96 (≈ 0,10 avant VQ) ; aller-retour 99 % ; fusion 97 % ; protocole complet 0,924 sur 20 graines ; MoonsTask 0,74 ; mKNN 0,174 à k = 10 (« 18,8× » le nul) ; loi d'écart de polymorphie 10,7 / 6,7 / 2,4 / 2,7 % (19/20) ; triple substrat 8,2 → 4,3 %. |
| Introduction | 64-67 | Simple renvoi à la spec, sans motivation propre. |
| Related Work | 69-149 | Codage prédictif (Rao, Bastos 2012/2020, Gabhart), multiplexage γ/θ (Ruffini, Kim), codebooks (VQ-VAE, SoundStream, DVNC, Peng, Meng), SNN/hybrides (Neftci, Liu), alignement (Moschella, Huh, « Saxe », Kornblith, Morcos, Gröger), NIR/AER, distillation. Délimitation (a)–(c) aux l. 133-149. |
| Method | 151-213 | Tuple neuroletter ; routage Gumbel top-K ; N-3 (ε ⇔ θ) présenté comme garde de typage (erratum, l. 165-185) ; capacité appariée d = 16. |
| Experiments | 215-325 | Portes P (1000 cycles), W (1,000/1,000), M (1,000) ; ablations (l. 245-260) ; mise à l'échelle avec k(N) = max(2, ⌈log2 N⌉) (l. 296-313). |
| Threats | 327-363 | Historique v0.3→v0.7, table d'échelle (l. 341-350), réserve mono-graine. |
| Information Transmission | 365-825 | Tests 1-12 : MI/H avant/après VQ, multi-estimateurs, MNIST, temporel, nul gaussien, DVNC, Sleep-EDF, encodeur gelé, balayage de capacité, canal PSK γ/θ (Test 12 : 1,007 / 0,168 / 0,924, survie des codes 1,00). |
| Reproducibility / Interpretability / Integrations | 827-926 | Scripts, sondes, intégrations NIR/Lava. |
| Limitations | 928-1109 | 20+ items, dont item 9 (CKNNA attribué à Gröger, l. 964), l'erratum N-3 (l. 995-1009), H_spec (l. 1029-1031) et les chiffres Renf 10 (l. 1048-1051). |

### 2.2 Équations et figures clés — verdicts

| Élément | Où | Vérification | Verdict |
|---|---|---|---|
| Tâche HardFlowProxy (6 clusters × bit XOR sur la composante de bruit, 12 classes) | `track_w/tasks/hard_flow_proxy.py:25-74` | Réimplémentée (`hardtask_check.py`). Le centroïde le plus proche retrouve le cluster à 1,000. L'oracle atteint 1,000 sur 12 classes. La régression logistique plafonne à 0,505–0,569. | OK (définition) |
| « MLP plafonne ~0,52 : limite structurelle d'un ReLU à 4 couches » | `main.tex:770-771` | Le même réseau 4×16 sans VQ, avec Adam 1e-2, atteint 0,68–0,78 en 800 pas et 0,92–0,95 en 8000 pas (`hardtask_check3.py`). Une seule couche de 16 unités atteint 0,934 (`hardtask_check2.py`). | **Faux** : c'est un sous-entraînement, pas une limite structurelle (C3) |
| Écart de polymorphie MLP/LIF (acc 0,547 / 0,605) | `main.tex:335` (0,611) vs `:415` (0,605) ; `w2_hard_n2_multiseed.json` | Écart JSON : 0,10714 = (0,60547 − 0,546875)/0,546875. | Chiffre OK, incohérence interne 0,611/0,605 (C12). Mesure invalide au fond, car les deux substrats sont sous-entraînés (C3). |
| MI/H « post-VQ » 0,91→0,96 et plug-in 0,992 / 0,982 / 0,822 | `main.tex:370-378` ; `mi_multi_estimator.json` | Reproduit exactement à partir du golden npz (`golden_check.py`). Les codes sont `emit_head_pi(core(x)).argmax(-1)` (`measure_info_transmission.py:65-152`) : ce sont des prédictions de classe (codes MLP tous < 12, 7 distincts). Le codebook VQ n'est jamais utilisé. | **Construit faux** (C1) |
| Nul mKNN « 18,8× » | `main.tex:431-480`, abstract | Rejoué sur les embeddings golden (N = 1024, k = 10). Observé 0,148–0,188. Nul permuté intra-cluster 0,058–0,059, soit un excès de 2,5–3×. | **Nul inadapté** (C2) |
| H_spec, p_i = σ_i²/Σσ_j² | `main.tex:1029-1031` | Roy & Vetterli (non résolu par API) normalisent probablement par σ_i (de mémoire, non vérifié). | À vérifier (C14) |
| Noyau k(N) = max(2, ⌈log2 N⌉) | `main.tex:296-313` | Recalculé sur la table. | OK |
| Canal PSK γ/θ, Test 12 | `main.tex:785-823` | Cohérent avec le code. C'est le seul point de contact réel avec arXiv:2609.32605 (§4.3). | OK, à situer vis-à-vis de Rome |
| Correspondance π→γ, ε→θ « transcription du predictive routing » | `main.tex:74,89-93,176-180` | Bastos 2020 (résumé, Europe PMC) : erreurs → γ en avant ; prédictions → α/β ; aucun θ. `main.tex:74` attribue l'inverse à Bastos 2012. | **Inversé** (C5) |

### 2.3 Supplément CKNNA (`supplementary.md`, 308 l.)

- **Faits.** Sur un substrat gaussien synthétique, CKNNA@10 passe de 0,9242 à 0,8733 quand n augmente, et le nul de 0,0397 à 0,0006 ; d_z passe de 135 à 1311.
- **Inférence.** C'est une réplication honnête de la Prop. 4.2 de Gröger et al. (nul en k/n). La portée s'arrête au synthétique.
- **Défauts.** Prénoms faux (« Friedrich Gröger, Yiren Wen »). `song2012featureselection` n'est jamais cité. L'entrée Diff-eRank hybride est partagée avec le bib principal.

### 2.4 Autres manuscrits

- `docs/research-notes/paper-v1.7.0-review-response.md` : F1–F5 et m1–m10 sont déclarés clos. Aucun ne porte sur la validité du construit des codes (C1) ni sur la limite MLP (C3).
- ADR-0001 : le ratio KSG de 0,095 donne « ×9,8 ». Le texte du papier n'a pas été modifié en conséquence.
- ADR-0002 : la nouveauté est recadrée, mais l'ADR reprend l'attribution erronée « training-dependent » à Gröger et al. (C7).
- L'article ReScience NH-01 est hors de ce dépôt (`rescience-nh01`) et n'a **pas été lu**.

## 3. Vérification des références

Le détail est dans `inventory/refs/nerve-wml-refs.md`.

- **41 entrées** (34 + 7) : **26 OK** (dont 5 avec réserve de forme), **15 KO**.
- Les 15 KO se répartissent ainsi :
  - 5 auteurs faux : « Saxe » qui est en réalité Hosseini et al. ; « Zhao » qui est Meng ; NIR ; prénoms Gröger/Wen ;
  - 4 mauvaises attributions : Bastos 2012 inversé ; Gröger pour « training-dependent » et pour CKNNA ; Diff-eRank hybride ×2 ;
  - 3 attributions douteuses : Huh pour « cross-modality DINOv2 vs CLIP » ; Bastos 2020 détourné ; Ruffini pour le γ/θ ;
  - 4 introuvables par API : Karlsson 2026, Roy–Vetterli ×2, Song 2012.
- **SNN-PC** :
  - La référence est bien Lee, Dora, Mejias, Bohte, Pennartz 2024, Front. Comput. Neurosci. 18, DOI 10.3389/fncom.2024.1338280. Ce n'est **pas** arXiv:2409.05386 (survey N'dri et al.).
  - En revanche, le texte intégral (PMC11045951) ne contient ni VMP, ni belief, ni terme de Poisson.
- **NH-01** : 5 références vérifiées OK par Crossref (Fachechi 2019, Hopfield 1983, AGS 1985, Kanter–Sompolinsky 1987, Tononi–Cirelli 2014). Il manque Crick–Mitchison 1983 et Agliari et al. 2024 (NN 106389).
- **Groupe de Rome** : Paper 1 n'en cite aucun (0 occurrence). NH-01 cite Fachechi 2019 correctement et 2605.13721 avec la mention « not re-verified ».

## 4. Analyses

### 4.1 Claim B mesure l'accord sur l'étiquette de cluster, pas une transmission

- **Faits.**
  - `_emit_codes` (`scripts/measure_info_transmission.py:65-152`) prend l'argmax de la tête π, entraînée par entropie croisée sur 12 classes (`track_w/training.py:16-48`).
  - Sur le golden, MI(code_MLP ; cluster)/H vaut 0,998 / 0,999 / 0,798, et MI(code_MLP ; bit XOR) vaut 0,001 nat sur 0,69.
  - acc_MLP = 0,501 / 0,539 / 0,613 et acc_LIF = 0,592 / 0,597 / 0,657.
  - Le MI/H inter-substrats de 0,99 vient donc de deux classifieurs qui trouvent tous deux le cluster (trivial, 1,000 au centroïde) et ratent le bit XOR.
- **Inférence.** « post-VQ » désigne ici une prédiction de classe, pas un indice de codebook. Le chiffre ne dit rien d'un code partagé émergent. Le nul gaussien aléatoire (Test 6) ne contrôle pas ce confond, puisqu'il ne partage pas l'étiquette.

### 4.2 Le nul mKNN doit conditionner sur le cluster

- **Faits.** Sur les mêmes embeddings, le nul permuté intra-cluster vaut ≈ 0,06. L'observé vaut 0,15–0,19. L'entrée x contre l'embedding LIF donne 0,22–0,25, plus que la valeur inter-substrats.
- **Inférence.** L'essentiel de l'alignement est hérité de la géométrie de l'entrée (Cui et al. 2022, déjà signalé par la revue du 24/10). Le « 18,8× » mesure l'écart à un nul sans structure, pas un alignement appris.

### 4.3 Le papier de Rome arXiv:2609.32605 face au plan N10-C

- **Faits** (HTML §3.2 lu en entier).
  - Le protocole de Rome repose sur un tenseur hebbien et un codebook pré-partagés, et sur K clés de Rademacher.
  - Chaque jeton est codé comme un mélange de triplets masqué par un flux de clé. Il est décodé par une dynamique d'attracteurs TAM dense. La dégradation reste douce sous corruption du canal.
  - Il n'y a ni apprentissage, ni agents, ni récompense, ni bras nocomm, ni mesure d'émergence.
  - N10-C, lui, compare 6 bras enregistrés (gtm, eng, nocomm, mlp, atoc, dial) et 4 bras « closed ». Ses agents apprennent par renforcement, avec un canal K = 4, A = 16 (16 bits) (`harness/comm.py` ; amendement du 23/10, l. 18-19).
- **Inférence.**
  - 2609.32605 ne devance pas N10-C : il ne teste aucune hypothèse de N10-C.
  - La veille qui le décrit comme « 1 cellule sur 4 (closed/registered × gtm/nocomm) » se trompe sur la structure de N10-C.
  - Le recouvrement réel porte sur Paper 1 Test 12 et la voie de réception PSK du GTM (décoder un canal discret sous bruit). Un décodeur à attracteurs pré-partagé est une alternative non testée, qui devrait figurer en related work et, idéalement, comme bras de comparaison du Test 12.

### 4.4 Taux d'erreur de la porte de nécessité N10-C-bis

- **Faits.** La porte G1–G7 (`docs/milestones/2026-10-25-n10c-bis-control-arms.md:320-352`) prévoit : graine 9101, 1 run par bras, 10M pas-paires, condition closed, succès si eng − nocomm ≥ 0,20. Les répétitions de la table B3 (l. 296-306) diffèrent de 0,10–0,13.
- **Inférence** (mon calcul, loi normale).
  - Avec un σ de différence ≈ 0,14 et 1 graine : P(succès | vraie différence 0) ≈ 8 % ; P(échec | vraie différence 0,30) ≈ 24 %.
  - Avec 3 graines : ≈ 0,8 % et 11 %.
  - La comparaison « gtm_mis 0,81 > gtm 0,54–0,73 » (l. 296-306) repose elle aussi sur des runs uniques.

### 4.5 N10-D (PR #100)

- **Faits.**
  - `nh96-null.md` simule les deux bras au plafond aveugle avec des effets aléatoires indépendants par bras (k = 8, n_eval = 500).
  - Le nombre de graines requis est k = max(5, …) avec une marge de 0,30. Avec un σ plausible, on obtient k = 5.
  - `protocol.md` §5 déclare la condition sym « non informative », mais l'inclut dans H1 et dans le critère de rejet 2.
- **Inférence.** Il y a une incohérence logique à trancher avant le gel. Les effets aléatoires indépendants par bras ignorent aussi la covariance intra-graine (même défaut que celui relevé par l'amendement N10-C du 30/10).

### 4.6 NH-01 et le groupe de Rome

- **Faits.**
  - J(t) = J(1+t)(1+tJ)⁻¹ a pour valeurs propres λ(1+t)/(1+tλ) (vérifié à la main) ; c'est un projecteur ridge avec λ_ridge = 1/t.
  - C1 = 3,86 [3,79 ; 3,93], t* = 7, C3′ = 0,975 (`docs/results/2026-10-25-nh01-confirmatory.md`).
  - D_diag = 0,048 [0,043 ; 0,054], verdict « inconclusive », ΔD = 0,038 (`docs/results/2026-10-31-nh01-diagonal-ablation.md`).
- **Inférence.**
  - Agliari et al. 2024 (NN 177, 106389) établit déjà « rêve = régularisation ridge + arrêt précoce ». La comparaison rêve contre downscaling doit se situer par rapport à ce résultat, sinon C1 sera lu comme une redécouverte.
  - Le contrôle qui ne peut pas échouer (baseline #10) est confirmé.

## 5. Suppositions (non vérifiées, à confirmer)

- Les embeddings golden proviennent de la même configuration que `platonic_rh_alignment.json`. Je n'ai pas pu le confirmer, faute de métadonnées de run dans le npz.
- Roy & Vetterli 2007 normalisent par σ_i et non σ_i². C'est un souvenir, sans API.
- Le γ superficiel / α-β profond est aussi la thèse du texte intégral de Bastos 2012 : seul le résumé a été lu, et il ne donne pas les bandes.
- La plage 0,15–0,25 de Huh et al. n'est lisible que sur figures. Non vérifiée.
- Le σ ≈ 0,14 utilisé en §4.4 est estimé à partir de 2-3 répétitions. L'ordre de grandeur est robuste, le chiffre exact ne l'est pas.
- Les chiffres Sleep-EDF (Test 9) et MNIST (Test 4) n'ont pas été recalculés.

## 6. Pistes d'utilité

1. **Refaire Claim B correctement.**
   - Mesurer l'information mutuelle sur les indices du codebook VQ, pas sur l'argmax de la tête.
   - Conditionner sur le cluster : MI(code_A ; code_B | cluster), ou une tâche dont l'étiquette n'est pas triviale.
   - Ajouter le nul permuté intra-cluster (≈ 30 lignes à partir de `mknn.py`).
2. **Entraîner les substrats à convergence** (8000 pas, ou critère de plateau) avant toute « loi d'écart ». Retirer « structural limit » (`main.tex:770-771`).
3. **Corriger la correspondance biologique** : soit inverser le mapping (π→α/β, ε→γ), soit retirer la revendication de « transcription » de Bastos et assumer un choix d'ingénierie.
4. **Ajouter un bras de décodage par attracteurs** (TAM dense, Rome 2609.32605) au Test 12 : peu coûteux, et c'est une comparaison qu'un relecteur demandera.
5. **Porte de nécessité N10-C-bis** : passer à 3 graines appariées, ou annoncer ses taux d'erreur.
6. **N10-D** : sortir sym de H1 ou la rendre informative ; modéliser un effet aléatoire de graine partagé.
7. **NH-01** : citer Agliari et al. 2024 et Crick–Mitchison 1983 ; formuler C1 en termes ridge.
8. **BioField** : soit implémenter les deux apports de SNN-PC (balayage gist, neurones d'erreur ±), soit décrire le mécanisme comme original, « inspiré de ».

## 7. Constats (BLOQUANT → OK)

| # | Sév. | Constat | Preuve (path:line) | vs baseline |
|---|---|---|---|---|
| C1 | **BLOQUANT** | Claim B : les codes « post-VQ » sont des prédictions de classe (argmax de la tête π). Le MI/H de 0,99 mesure l'accord de deux classifieurs sur l'étiquette de cluster triviale (MI avec le bit XOR = 0,001 nat). | `scripts/measure_info_transmission.py:65-152` ; `main.tex:370-378` ; `track_w/training.py:16-48` ; `work-nerve/golden_check.py` | **Nouveau** |
| C2 | **BLOQUANT** | Le nul mKNN n'est pas conditionné sur le cluster : l'excès réel est de 2,5–3×, pas 18,8×. L'entrée seule s'aligne davantage (0,22–0,25). | `main.tex:431-480`, abstract `:18-62` ; `work-nerve/mknn.py` | **Nouveau** (rejoint la R11 de la revue du 24/10 sur Cui 2022) |
| C3 | **BLOQUANT** | La « limite structurelle » du MLP à 0,52 est un sous-entraînement (0,92–0,95 à 8000 pas). La loi d'écart de polymorphie (10,7 / 6,7 / 2,4 / 2,7 %) compare des substrats non convergés. | `main.tex:770-771`, `:335`, `:415` ; `track_w/mlp_wml.py:56-90` ; `work-nerve/hardtask_check3.py` | **Nouveau** |
| C4 | **BLOQUANT** | N10-C, validité du construit : la comparaison gtm_mis (0,81) contre gtm (0,54–0,73) suggère que le gain ne vient pas du contenu du message. Elle repose sur des runs uniques avec un bruit de répétition ≈ 0,1. | `docs/milestones/2026-10-25-n10c-bis-control-arms.md:296-306` | **Confirme baseline #3** (nuance : runs uniques) |
| C5 | MAJEUR | La correspondance π→γ / ε→θ est l'inverse de la biologie citée : Bastos 2012 est mal rapporté, et Bastos 2020 (erreurs γ, prédictions α/β, pas de θ) est présenté comme sa source. | `main.tex:74`, `:76-78`, `:89-93`, `:176-180` | **Nouveau** |
| C6 | MAJEUR | BioField attribue à Lee et al. 2024 un VMP, des beliefs σ et un « résidu de Poisson, eq. 5 », qui n'existent pas dans ce papier (l'Eq. 5 y est le courant synaptique). La référence elle-même est juste, et ce n'est pas 2409.05386. | `track_w/bio_field_wml.py:6-8,190-200` ; `docs/superpowers/plans/2026-05-19-bio-substrate-wml.md:1864-1880` | **Infirme baseline R2** (« bien cité ») |
| C7 | MAJEUR | Gröger et al. 2026 sont crédités de « training-dependent », alors qu'ils disent l'inverse. CKNNA leur est attribué alors qu'il vient de Huh et al. | `main.tex:709-712`, `:964` ; `docs/adr/0002*` | **Nouveau** |
| C8 | MAJEUR | Références fausses : « Saxe et al. » est en réalité Hosseini et al. ; Diff-eRank est une entrée hybride (eprint de Li et al.) ; « Zhao » est Meng ; auteurs NIR faux. | `refs.bib` ; `main.tex:99,140,1032` | **Nouveau** |
| C9 | MAJEUR | Aucune citation du groupe de Rome dans Paper 1, alors que 2609.32605 (canal discret décodé par attracteurs) recouvre le Test 12 et la voie de réception GTM. | `main.tex:95`, `:133-149`, `:785-823` | **Nouveau** (corrige la lecture de la veille) |
| C10 | MAJEUR | La porte de nécessité à 1 graine (eng − nocomm ≥ 0,20) a ≈ 8 % de faux succès et ≈ 24 % de faux échecs (σ ≈ 0,14). | `2026-10-25-n10c-bis-control-arms.md:320-352` | **Nouveau** |
| C11 | MAJEUR | N10-D : sym est déclaré « non informatif » mais figure dans H1 et dans le critère de rejet 2 ; le nul ignore la covariance intra-graine. | PR #100 `docs/prereg/n10d/protocol.md` §5 ; `nh96-null.md` | **Nouveau** |
| C12 | MINEUR | acc_LIF vaut 0,611 à la l. 335 et 0,605 à la l. 415 (le JSON donne 0,60547). | `main.tex:335,415` ; `w2_hard_n2_multiseed.json` | Nouveau |
| C13 | MINEUR | Moschella : les chiffres cités sont dans la Table 6 et en F1 pondéré, pas dans la « Table 5 » ni en accuracy. Huh : DINOv2 contre CLIP n'est pas une paire inter-modalités. | `main.tex:99`, `:443-445` | Nouveau |
| C14 | MINEUR | H_spec en σ² attribué à Roy–Vetterli (normalisation à vérifier) ; Karlsson 2026 et Song 2012 non résolus, Song n'étant jamais cité. | `main.tex:1029-1031` ; supplément `refs.bib` | Nouveau |
| C15 | MINEUR | README « 24/24 refs, 15 pp » contre SUBMISSION « 14 pp » et 34 entrées. | `papers/paper1/README.md:3` ; `SUBMISSION.md` | Nouveau |
| C16 | MINEUR | NH-01 : il manque Agliari et al. 2024 (rêve = ridge + arrêt précoce) et Crick–Mitchison 1983 ; 2605.13721 est « not re-verified ». | `docs/milestones/2026-10-25-nh01-hopfield-dream-vs-downscale.md:95-103` | Complète baseline #10 |
| C17 | OK | NH-01 : le contrôle ne peut pas échouer et l'interprétation ridge est confirmée (vérification analytique du spectre). | `docs/results/2026-10-25-nh01-confirmatory.md` | **Confirme baseline #10** |
| C18 | OK | La brèche d'aveugle N10-C (lecture de 0,96) est désormais déclarée. | `n10c-…-amendment-2026-10-30.md` | **Confirme baseline #9, résolu** |
| C19 | OK | SWHID enregistré ; l'amendement demande l'analyse appariée par graine. | idem §3 | **Confirme baseline #8, résolu** ; covariance intra-graine = point nouveau de l'amendement |
| C20 | OK | Lee et al. 2024 est la bonne référence (DOI, auteurs, 2024-04-12), pas 2409.05386. | `track_w/bio_field_wml.py:6-7` | Confirme la note CLAUDE.md |
| — | hors périmètre | B-3 (baseline #2) et NH-81 (baseline #12) relèvent de bouba_sens et micro-kiki. | `freeze-plan:35` (mention NH-81 measure.py) | Non évalué ici |

**Comptes** : 4 BLOQUANT, 7 MAJEUR, 5 MINEUR, 4 OK.

### Groupe de Rome — synthèse des demandes du PI

| Papier | (a) À citer où | (b) Déjà cité ? | (c) Contredit / devance ? |
|---|---|---|---|
| arXiv:2609.32605 (Agliari, Alessandrelli, Barra, Fachechi 2026) | `main.tex:95` (codebooks), `:133-149` (délimitation), Test 12 `:785-823` | Non | Devance partiellement le Test 12 (canal discret robuste par attracteurs) ; **ne devance pas N10-C** |
| arXiv:2501.16789 = NN 194, 108181 (réseaux de réseaux hebbiens) | `main.tex:95-97` (communication inter-modules) | Non | Antériorité partielle pour la communication inter-modules sans gradient |
| arXiv:2610.08612 (RBM modulaire CD-1) | `main.tex:133-149` | Non | Non |
| arXiv:2503.06274 (L-directional) | `main.tex:95` | Non | Non |
| Fachechi, Agliari, Barra 2019 (NN 112) | NH-01 | **Oui, correct** (Crossref + arXiv 1810.12217) | — |
| Agliari et al. 2024 (NN 177, 106389) | NH-01 milestone, réfs l. 95-103, et interprétation de C1 | Non | **Devance** l'interprétation ridge de NH-01 |
| arXiv:2605.10304 (recuit partiel, α_c = 1) | NH-01, discussion de capacité | Non | Résumé seul lu, à confronter à t* = 7 |
| arXiv:2605.13721 | NH-01 | Oui, marqué « not re-verified » | Résumé seul lu ; non conclusif |
