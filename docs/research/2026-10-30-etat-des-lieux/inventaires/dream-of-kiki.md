# Inventaire dream-of-kiki — 24/10 → 30/10/2026 (relecture scientifique)

Clone lu : `repos/dream-of-kiki`, `main` à `6a61e80` (30/10 07:05). Lecture seule, sans calcul ni SSH. Chemins relatifs au clone. Les constats déjà présents dans l'inventaire et l'avis critique du 24/10 (`inventaires/dream-of-kiki.md` §8 : fixtures, mocks, P_equ≡P_max, délais lock→run, préregs non déposées) ne sont rappelés que s'ils ont évolué. Gravité : **BLOQUANT / MAJEUR / MINEUR / OK**.

## 1. État des lieux

### Fait (vérifié dans le dépôt)
| Date | Élément | Preuve |
|---|---|---|
| 25/10 | NH-03, TTT contre épisodes, 180 cellules, macM1. Tag `prereg-nh03-20261025` posé à 19:55:50, run lancé à 19:56 | `docs/results/2026-10-25-nh03-ttt.md`, tag sur `31412c9` |
| 25/10 | Correctifs « phase 0 » (#57) : version alignée sur C-v0.25.0, README « 25/25 » reformulé, DR-2 réconcilié à **12/24** permutations sûres (et non 12/12 ni 11) | `CHANGELOG.md:38`, `README.md:45`, `docs/specs/amendments/2026-04-21-dr2-empirical-falsification.md:112-124` |
| 27/10 | Ablation des calendriers NH-03, 300 cellules sur le CPU d'ES. Verdict : **récence** | `docs/results/2026-10-27-nh03-schedule-ablation.md` |
| 28/10 | #71 : préregs G4-nono et DR-3 sorties de #41. #74 : dossiers de dépôt, lock `14c3d5f` | `docs/osf-filing/{g4-nono,dr3}/FILING-NOTE.md` |
| 28/10 | #72 (`963bb24`) : harnais E1 et préreg E1-small. #73 : re-pin. #75 : règle GO/NO-GO pour le 35B | `docs/osf-filing/e1-small/FILING-NOTE.md`, `docs/milestones/e1-35b-go-rule-2026-10-28.md` |
| 28/10 | Corpus E1-small gelé : 1 570 items (1 098 confirmatoires, 472 de réglage). Marge de progression (headroom) ACCEPT | `docs/milestones/e1-small/corpus-manifest-frozen-2026-10-28.json` |
| 29/10 06:14 | #76 : déviation déclarée, run lancé avant le dépôt OSF | `docs/milestones/e1-small/deviation-run-before-osf-2026-10-29.md` |
| 29/10 23:57 | #77 : avenant de réglage gelé. LR 3e-4, m=2 pour la sélection vanilla comme pour OPR ; c=5,0 ; n_eval=162 ; p_disc=0,127 ; SD proxy 0,0286 | `docs/milestones/e1-small/e1-tuning-amendment-2026-10-29.json` |
| 30/10 05:56 / 06:05 | Fusion de #69 et #70 (NH-03) ; `675b043` attribue le gain à la récence | git log |

### En cours
- **E1-small confirmatoire** (1 410 cellules, KXKM, d'après nos notes lancé le 30/10 vers 00:05). Le dépôt ne contient **ni journal de run ni cellule confirmatoire**. L'heure de lancement et les ~177 s par cellule sont **non vérifiables**. À 177 s par cellule, on obtient environ 69 h, soit une fin vers le **1er/11 au soir** sans interruption. KXKM est partagé avec N10-C (lancé le 24/10) et N10-C-bis (prévu vers le 7/11).
- **PR #79** (ouverte) : préreg NH-03 « évaluation différée », tag `prereg-nh03-deferred-20261030`. Issue #78 ouverte, label `a-valider-pi`. Aucun run confirmatoire.

### Bloqué / en attente
- **G4-nono** : prêt mais non déposé. Décision PI sur l'hôte de dépôt (macM1 ou autre) ; le smoke §9 et l'item 5 de la checklist ont été faits sur macM1 (`FILING-NOTE.md`, « To resolve before filing »).
- **DR-3** : prêt, non déposé. Aucune question ouverte, il ne manque que le clic de dépôt OSF par le PI.
- **E1 35B** : brouillon toujours dans **#41 (ouverte, pas sur `main`)**. Le lancement dépend de la règle GO (#75). Le port MLX est en réserve (1 cellule = 1 483 s, pic à 219,8 Go, projection de 431 à 482 h, soit 18 à 20 jours de Studio : `docs/osf-prereg-e1-replay-controls-2026-10-23.md:1107-1143`, branche `docs/osf-prereg-2026-10`). Les poids ont été supprimés de Studio le 28/10 (mémoire).
- **PR #68** (brouillon de travail E1-small) toujours ouverte. Issues #47 à #67 ouvertes ; #47 (indice RCI + nul non entraîné) n'est pas traitée par la préreg DR-3 déposable.

### Décisions PI en attente
1. Déposer sur OSF E1-small (avec la déviation), G4-nono et DR-3.
2. Hôte de dépôt G4.
3. Paramètres de #79 : forme du délai, niveaux, marge, hôte.
4. Avant d'appliquer la règle GO, la revoir (voir 2.1).
5. Budget GB300 : **aucune projection de coût ou de durée CUDA/GB300 dans le dépôt** (le mot n'apparaît qu'aux lignes 21, 41 et 1301 du brouillon 35B).

### Où tourne quoi
KXKM RTX 4090 : E1-small, en concurrence avec N10-C. macM1 : smokes G4/DR-3, futurs runs confirmatoires G4/DR-3. ES (CPU) : ablation NH-03. Un hôte « macM3 » est cité dans #79 pour le pilote différé : **absent de l'inventaire d'infra, non vérifiable**.

## 2. Relecture critique (depuis le 24/10)

### 2.1 E1-small et règle GO 35B

**[BLOQUANT pour la décision de dépense 35B] La règle GO peut se déclencher sans aucune opération de rêve.** La ligne 3 de `e1-35b-go-rule-2026-10-28.md:43-44` donne GO si H14-A **ou** H14-B est SUPERIOR **ou POSITIVE-BELOW-SESOI**. Or H14-A compare `p_min` à `p_ctrl_template`. Selon la préreg elle-même, `p_min` « **is** SGD replay at default hyperparameters » et RECOMBINE est un no-op (`docs/osf-prereg-e1-small-2026-10-25.md:140-143`). H14-A teste donc « fine-tuner avec les réponses » contre « fine-tuner sans les réponses ». Le texte reconnaît qu'il ne sépare pas le format du contenu (`:154`). Dans le smoke déterministe (fixtures pilotes, autre corpus), `p_min − template` vaut +0,067, +0,067 et +0,037 sur les 3 graines (`docs/milestones/e1-small/smoke-deterministic-2026-10-27.cells.jsonl`). Un SUPERIOR sur H14-A est donc l'issue attendue, et il suffirait à louer un GB300. De plus, POSITIVE-BELOW-SESOI est un état que la préreg qualifie de « reported, no claim ». Pour H14-B, `p_equ` et `vanilla_tuned` partagent exactement la même suite de mises à jour en mode déterministe : la SD de D sera très petite, et un effet de DOWNSCALE bien inférieur à δ suffirait à donner L > 0, donc GO. **Correctif** : réécrire la règle avant la fin du run et la dater. Elle devrait ne compter que H14-B SUPERIOR, éventuellement avec une borne sur `p_equ − lr_matched`. La note dit « not changed after any E1-small number is seen » : il faut donc agir maintenant ou l'assumer explicitement.

**[MAJEUR] Validité de construit : E1 ne mesure ni consolidation ni oubli.** Le protocole fait : évaluation avant, SGD sur 40 faits indépendants (datés après le cutoff), opérations, évaluation après sur d'autres faits (`scripts/e1_harness.py:241-275`). Il n'y a pas de tâche nouvelle en interférence et plus de sonde d'oubli : MMLU/HellaSwag sont relégués au smoke. Rejouer un fait ne peut pas enseigner un autre fait indépendant. Tout Δ provient donc d'une adaptation au QCM : style des réponses correctes, calibration du score cloze. Même avec H14-B SUPERIOR, la seule conclusion licite serait « multiplier tous les poids par 0,99 après un fine-tuning améliore la précision cloze d'un 4B sur ce corpus ». Cela ne relève pas de la consolidation façon SHY.

**[MAJEUR] Le score de base de Daily Oracle est sous le hasard.** Précision de base sur le réglage : daily_oracle **0,185** (n=146, hasard 0,25, z ≈ −1,8), realtimeqa 0,393, mmlu_cf 0,374 (`corpus-manifest-frozen-2026-10-28.json`, clé `headroom.accuracy`). Le score est la moyenne de log-prob normalisée par la longueur (`scripts/pilot_cycle3_cuda.py:282-291`). La réponse correcte est la plus longue dans 34 % des cas sur Daily Oracle (`report.gold_longest`), contre 25 % attendus. Un score sous le hasard signale un biais systématique de l'outil de mesure face aux distracteurs générés par LLM. Quarante items avec réponses suffisent à inverser ce biais : cela gonflerait H14-A et toute comparaison « avec réponses » contre « sans réponses », par apprentissage d'artefacts et non de connaissances. Le dépôt n'a pas de contrôle « options seules, sans question ». Il est faisable sans GPU lourd après le run, sur le modèle de base.

**[MAJEUR] DOWNSCALE et bras LR-matched.** `downscale` multiplie **tous** les paramètres flottants par 0,99 : embeddings, poids RMSNorm, paramètres du Gated DeltaNet (`scripts/pilot_cycle3_cuda.py:463-466`). Dans le smoke, la dérive relative de `p_equ` est de 0,01004 contre 0,00029 pour le replay seul : DOWNSCALE pèse **environ 35 fois** la mise à jour SGD entière. Le calibrage du bras exploratoire LR-matched a choisi **c = 5,0, la borne haute de la grille {1…5}** (avenant). Le bras n'atteint donc pas la variation de norme visée, et le contraste `p_equ − lr_matched` ne sépare pas « régularisation par la norme » et « shrink ». Les deux sélections de réglage sont aussi au bord de la grille (LR 3e-4, le plus haut) : le témoin « tuned » (Chen et al.) est peut-être sous-réglé. Cela ne biaise pas H14-B, qui partage la configuration, mais affaiblit H14-C.

**[MAJEUR, partiellement atténué] Contamination.** Les items datés sont postérieurs au 16/04/2026, donc après la sortie de Qwen3.5-4B (27/02) : pas de fuite directe de faits. En revanche, MMLU-CF val est public depuis 12/2024 et pèse 34,6 % du poids poolé. Une contamination ne biaise pas directement la différence appariée, mais rejouer un format mémorisé peut « réveiller » des réponses apprises : le gain serait alors spécifique à cette strate. Il faut lire les résultats par source (prévu, descriptif, `:513`) avant toute lecture poolée, et ajouter un test de contamination peu coûteux (Min-K % prob, ou val contre paraphrases).

**[MAJEUR] Ce que le dépôt verrouille réellement après la déviation.** Le contenu est verrouillé par hachage : `963bb24` (horodatage de fusion côté GitHub 2026-10-28T16:57:07Z), brouillon `6d47d8b7…`, corpus, partitions. Le code E1 est **inchangé** entre `963bb24` et HEAD (`git diff --stat 963bb24..HEAD -- scripts` ne touche ni `e1_*`, ni `pilot_cycle3_cuda.py`, ni `analyze_e1_cuda.py`). L'avenant de réglage est déterministe par règle et a été committé avant la cellule confirmatoire : `dff4199` à 23:57:32, fusion à 00:05:10. En revanche :
- (a) L'horodatage tiers n'est que GitHub, un dépôt contrôlé par le PI. Le dépôt OSF ne vaudra plus préenregistrement mais « enregistrement après début de collecte ».
- (b) Écart d'environ 10 s ou moins entre la fusion de #77 et le lancement noté « 00:05 » : **non vérifiable** sans journal.
- (c) `FILING-NOTE.md:6` dit encore « The KXKM-AI run waits for the PI's confirmation that the pre-registration is filed ». Le texte n'a pas été mis à jour après la déviation (MINEUR).

**Correctif** : déposer sur OSF maintenant, avant toute lecture de résultats, et horodater par un tiers (OpenTimestamps ou dépôt Zenodo) le hachage du brouillon, de l'avenant et du manifeste.

**[MINEUR] Inférence conditionnelle au corpus.** 141 graines tirent 202 items parmi 1 098 : chaque item est réutilisé environ 21 fois. Le test t par graine ignore la variance des items, ce que la préreg reconnaît (§5.2). Un modèle à effets croisés graine × item, en secondaire, serait plus honnête pour toute généralisation.

**[MINEUR] Divergences de texte.** Le brouillon 35B déclare le backend MLX « registered » (révision 9), puis le remplace par CUDA/GB300 (révision 10, `:21-46`). E1-small reproduit la révision 9 en §1 à §8. `README.md:149` indique Studio « powered down », alors qu'une cellule 35B y a tourné le 25/10 au soir (branche #41).

**[OK]** Procédures appariées correctes et testées : t apparié, bornes à (1−2α), α=1/60, garde-fous d'exclusion (`scripts/analyze_e1_cuda.py:18-31,57-58`). Le budget en tokens compte les passes de score d'OPR. Contrôle déterministe et parité des noyaux documentés. Ce niveau d'instrumentation est rare.

### 2.2 G4-nono (H12, CIFAR-10 en niveaux de gris + Quick, Draw!, N=95)

**[MAJEUR] L'issue se lit déjà dans le smoke 3.** Différences par graine (900/901/902, `docs/milestones/g4-nono-smoke-records-2026-10/smoke3/cells/`) :
- H12-A, CDPA cross − none : +0,0036 / +0,0078 / +0,0037 (moyenne 0,005, SD 0,0024) ;
- H12-B, cross − within : −0,0041 / −0,0049 / −0,0011 ;
- H12-C, WDPA within − none : moyenne 0,0021, SD 0,0015.

Avec N=95, on attend respectivement POSITIVE-NEGLIGIBLE, BOUNDED-NO-GAIN et EQUIVALENT. CONFIRMED est hors d'atteinte : la SD inter-graines de CDPA vaut environ 0,07, et la contrainte `g_av ≥ 0,5` exigerait D̄ ≳ 0,035, soit 7 fois l'effet observé. Le bras exploratoire `unmixed` fait **aussi bien ou mieux que cross** (+0,005). Le peu qu'apporte cross relève de la « SGD synthétique générique », pas de la recombinaison inter-domaines. N=95 ne coûte qu'environ 6 h de macM1, mais ne fournit pas d'information nouvelle sur DR-4 : il sert à certifier un nul déjà visible.

**[MAJEUR] CDPA est confondu avec un recalibrage du biais de la tête, et le garde-fou est inerte.** CDPA compare les logits a contre b par argmax (`docs/osf-prereg-g4-nono-cross-domain-2026-10-23.md:697-701`). Un simple décalage additif des logits A contre B fait varier CDPA. Le garde-fou DOA est « pinned near 0.5 by construction » (`:709-717`) : il vaut 0,5 dans toutes les cellules de rêve du smoke 3, et acc20 ≈ 0,09. Le réseau est effondré sur la dernière tâche, et la lecture « shortcut » de Zhang et al. ne peut pas être exclue. **Correctif peu coûteux** : rapporter en secondaire une AUROC par paire (ou des logits centrés par classe), invariante aux biais additifs.

**[MINEUR, hérité] Épisode DR-0 factice.** L'épisode exécuté par `profile.runtime.execute` est construit sur des enregistrements gaussiens aléatoires de dimension 4, sans rapport avec le CNN. Les opérations réelles sont appliquées à côté (`experiments/g4_nono_test/run_cross_domain.py:214-256`). « Chaque écriture tracée par un DE journalisé » est donc un traçage parallèle, pas un traçage des écritures réelles.

**[OK]** Règle N corrigée (la ligne N=30 retirée avec une justification χ² correcte, `:354-361`). Appariement par graine. Smokes archivés avec SHA-256.

### 2.3 DR-3 (H13, sonde relationnelle, n=20, permutations K=500)

**[MAJEUR] H13-C et H13-D (FAILS) sont quasi garantis par le choix de τ et la normalisation.** Dans la sonde du smoke (graine 900), `S_mKNN^τ` vaut **0,00014 pour la paire entraînée** contre 0,0098 pour le nul. Le poids conditionnel entraîné est de 0,001 contre 0,12 à 0,19 pour le nul (`docs/milestones/dr3-prefiling-smoke-2026-10-25-records/dr3-smoke900-probe-check.json`). Les poids `exp(−|log d̃x − log d̃y|/τ)` après normalisation par le quantile 90 (`kiki_oniric/eval/relational_probe.py:167-179`) écrasent toute différence d'échelle entre MLP et LIF dès τ=0,1. « Geometry fails » est donc surtout une propriété de τ et de cette normalisation : il faut lire la variation de τ comme le résultat principal, pas comme une analyse de sensibilité.

Rien n'indique que τ a été fixé après lecture du smoke : décision le 24/10, smoke le 25/10, préreg inchangée ensuite d'après la liste des commits de #41. Mais l'intégration du 24/10 a produit des dumps le même jour : **non vérifiable**.

**[MAJEUR] Écart avec la ROADMAP.** La S3 (`github/docs/ROADMAP.md:33`) demandait un « indice relationnel corrigé (distances brutes, pas de ratio de médianes…) » (astra B6, issue #47). La préreg déposable utilise des ratios normalisés par quantile et n'implémente pas RCI. Le PI doit trancher : déposer H13 tel quel ou attendre RCI.

**[MINEUR]** Le texte dit « the smoke statistics are not reported and never analysed » (`docs/osf-prereg-dr3-relational-probe-2026-10-23.md:552`). Or les valeurs D de la graine 900 sont committées : D(S_mKNN)=0,0625 ≥ δ, D(S_H0)=0,0196 < δ. Elles laissent prévoir H13-A SURVIVES, H13-B INDETERMINATE ou FAILS, et donc aucun « global » autorisé. La phrase doit être corrigée.

**[MINEUR]** La SD de planification (0,025) vient de 3 graines (IC à 95 % de la SD environ ×0,5 à ×6). Le pouvoir de FAILS tombe à 0,44 si SD(D)=0,05. K=500 donne une résolution de 1/501, suffisante pour le critère secondaire à 0,05, pas pour α=0,0125 (non utilisé : OK). Substrats faiblement entraînés (précision 0,52-0,54 sur 12 classes, dimension 16) : la validité externe est minimale.

### 2.4 NH-03 (#69, #70) et PR #79

**[OK, et à saluer]** Le résultat primaire (+4,70, étiquette « continuous > bounded ») a été **réattribué publiquement à la récence** par une ablation préenregistrée (`docs/results/2026-10-25-nh03-ttt.md`, section Follow-up ; R = +18,3 sur TTT, +19,0 sur le substrat lent). Le README n'a pas été gonflé.

**[MAJEUR] Échelle et témoin.** La rétention vaut 100·acc_final/acc_initial sur une tâche **binaire** : le plancher du hasard est d'environ 51 points. La ligne de base (58,7) et `C_sgd_matched` (58,5) sont donc toutes deux au plancher. `C_sgd_matched` fait de la SGD sur la tâche courante, sans accès à β (`experiments/nh03_ttt_vs_episodes/run_nh03.py:20-22,238-244`). Il ne peut pas aider la tâche 0, donc « gain dû au contenu de β » est vrai mais tautologique. Le bon témoin serait un replay β sans downscale ou un β mélangé.

**[MINEUR]** Locks posés de quelques secondes à moins d'une minute avant le run (tag 19:55:50 pour un run à 19:56 ; 17:48:03 pour un run à 17:48). Il s'agit de tags git, pas d'OSF. η TTT réglé « to give (b) its best shot » sur des graines pilotes : correct et déclaré.

**[MAJEUR, à corriger avant le lock de #79]** Le délai proposé est un « wake training on task 4 under a fixed pixel permutation ». C'est une **nouvelle tâche interférente** : on confond récence et interférence rétroactive, alors que le but est de neutraliser la récence. Il faut au moins deux formes de délai (pas neutres sans gradient sur la tâche 0 ou bruit, et tâche interférente) ou au moins nommer la confusion. La marge de 3 points est héritée sans TOST : « recency_below_margin » repose sur une borne IC < 3, ce qui convient.

### 2.5 Divers
- [OK] DR-2 corrigé à 12/24. [MINEUR] « Validé empiriquement sur les 12 permutations sûres » reste circulaire : le domaine est restreint aux permutations que le code accepte.
- [MAJEUR, gouvernance] **E1 n'apparaît pas dans la ROADMAP**. Environ 70 h de 4090, puis un GB300 loué, alors que la règle est « pas plus d'une campagne lourde à la fois » (`ROADMAP.md:91`) et que la colonne KXKM ne prévoit que N10-C/N10-C-bis (`:82`). NH-03 a été fait 2 mois en avance (prévu S10, `:47`). La roadmap ne pilote plus ce dépôt.
- [MINEUR] README et STATUS ne mentionnent ni NH-03, ni E1-small, ni l'état des préregs.

## 3. Analyses : ordres de grandeur et décidabilité

**E1-small (1 410 cellules = 141 graines × 10 profils).** n_eval=162 : un item vaut 0,0062 et δ=0,01 vaut 1,6 item. La SD proxy de 0,0286 est inférieure à SD* = 0,0397 : à SD_D ≈ 0,028, la puissance de BOUNDED-NO-GAIN ou NI vaut 0,98 et celle de SUPERIOR à μ=δ vaut 0,50 par construction (§3). **Décidable** : H14-C (NON-INFERIOR contre INCONCLUSIVE), et H14-B si l'effet du shrink est nettement en dehors de [0, δ]. **Peu informatif** : H14-A, dont l'issue positive est attendue et non spécifique au rêve. **Non décidable** : tout ce qui concerne la consolidation, l'échelle ou le 35B (§0 le dit). La SD proxy porte sur vanilla contre OPR. Pour H14-B, dont les suites de mises à jour sont identiques, la SD sera bien plus faible : même un effet de 0,002 sera « détecté ». C'est le cœur du problème de la règle GO.

**G4 (N=95).** MDE d_z = 0,308. Avec la SD observée des différences (0,0015 à 0,0024), 5 à 10 graines suffiraient à trancher les trois états. N=95 sert de marge contre une sous-estimation de la SD à 3 graines (P(SD̂ < seuil) élevée, `:369-374`) : défendable, mais l'issue est prévisible. Ce qui reste indécidable, c'est le mécanisme : recalibrage du biais ou représentation (voir 2.2).

**DR-3 (n=20, K=500).** d_z MDE = 0,739. À la graine 900, D(S_mKNN)=0,0625 : environ 2,5 δ, et si SD(D) ≈ 0,025 alors d_z ≈ 2,5, donc SURVIVES quasi sûr. D(S_H0)=0,0196 : sous δ, d'où INDETERMINATE ou FAILS selon SD(D). Les deux statistiques τ sont négatives : FAILS quasi sûr. La seule vraie inconnue est H13-B. K=500 permutations n'est qu'un critère secondaire à 0,05.

**NH-03.** Effets de 4 à 19 points, SD des différences d'environ 4, N=30 : très au-dessus du bruit. Le risque n'est pas la puissance mais l'interprétation (récence par construction, plancher à 51).

## 4. Suppositions non testées et explications plus simples

1. **« Sur ce QCM, le Δ cloze mesure une capacité. »** Explication plus simple : apprentissage d'artefacts de rédaction des items (longueur, style des distracteurs LLM). Le score sous le hasard de Daily Oracle en est l'indice. *Test* : contrôle « options seules » et analyse du Δ selon que la bonne réponse est ou non la plus longue.
2. **« Multiplier par 0,99 opérationnalise SHY. »** Explication plus simple : changement global de température ou d'échelle des logits, plus perturbation des décroissances du Gated DeltaNet (A_log, dt_bias). *Test* : shrink limité aux poids linéaires, ou rescaling des seuls logits de sortie, à effet équivalent.
3. **« La paire MLP/LIF entraînée partage une structure relationnelle propre à l'entraînement. »** Explication plus simple : les deux réseaux reçoivent les mêmes 1 024 entrées et la structure k-NN est surtout héritée des entrées. Le nul non entraîné donne déjà 0,079, soit 8 fois le hasard k/n. Le nul apparié l'absorbe en partie, mais un nul « entraîné sur des labels permutés » serait le contrôle décisif.
4. **« Recombinaison inter-domaines = découverte. »** Explication plus simple : n'importe quelle SGD sur des échantillons synthétiques rééquilibre la tête (unmixed ≥ cross).
5. **« Le budget d'écritures caractérise l'épisode. »** NH-03 le réfute sur un banc où la récence est récompensée par construction. Ce n'est pas encore une loi de placement, comme les auteurs le disent.
6. **« Un résultat à 4B informe le lancement du 35B. »** La règle GO le présume. Or §0 de la préreg E1-small exclut toute inférence entre tailles. C'est cohérent en tant que règle de décision, pas en tant que science : il faut le dire dans la note GO.

## 5. Utilité hors labo, et ce qu'il faut arrêter

**Réutilisable :**
- **Harnais E1** : budget compté en tokens d'entraînement (scoring inclus), mode déterministe vérifié, avenant de réglage gelé par règle, codes d'état appariés. C'est un outil d'évaluation « continual fine-tuning à calcul égal » publiable en l'état, sous forme de note méthodo ou de package, indépendamment de GENIAL.
- **Corpus de faits post-cutoff** : pins, dédup par squelette, règle des dates et des quasi-doublons, liste NOTA exacte, manifeste avec `--check`. C'est un jeu de données ou une recette de décontamination réutilisable, sous réserve de licence : seuls les identifiants RealTime QA sont publiés.
- **Note « nul calibré et états à quatre issues »** (SUPERIOR / POSITIVE-BELOW-SESOI / BOUNDED / INCONCLUSIVE) avec le **contre-exemple NH-03** (étiquette préenregistrée exacte mais trompeuse, corrigée par une ablation). C'est le meilleur matériau pour la « note méthodo nuls + errata » de la roadmap, et un module de formation (Qualiopi).
- **Sonde relationnelle DR-3** : petit outil générique mKNN/MST plus nul apparié, utile au-delà de nerve-wml si on ajoute le nul à labels permutés.

**À arrêter ou geler :**
- **La location GB300 pour le 35B** tant que la règle GO n'a pas été révisée et que le contrôle d'artefacts n'a pas été fait. À 4B, H14-A n'apporte aucune information sur le rêve.
- **G4-nono à N=95 comme « test de DR-4 »** : le smoke donne déjà l'issue. Soit on le lance pour clore DR-4 en nul (environ 6 h, utile pour l'errata), soit on le remplace par une métrique invariante aux biais. Ne pas en attendre un positif.
- **Les extensions de NH-03 sur G4-ter** au-delà de #79 : le banc binaire, avec son plancher à 51, est épuisé. Passer à G4-quinto comme le propose le rapport, ou arrêter.
- **Le run avant dépôt** comme pratique : G4 et DR-3 (peu coûteux) attendent un clic OSF, tandis qu'E1 (coûteux) part sans. C'est une inversion de priorités.

---

### Résumé (≤ 250 mots)

1. **BLOQUANT (dépense 35B)** : la règle GO (`docs/milestones/e1-35b-go-rule-2026-10-28.md:43-44`) se déclenche si H14-A est positive. Or H14-A compare SGD avec réponses et SGD sans réponses, sans aucune opération de rêve (`docs/osf-prereg-e1-small-2026-10-25.md:140-154`). Le smoke donne +0,04 à +0,07. Il faut réviser et dater la règle avant la fin du run.
2. **MAJEUR** : E1 ne mesure ni consolidation ni oubli, seulement l'adaptation au QCM. Daily Oracle est sous le hasard (0,185, `corpus-manifest-frozen-2026-10-28.json`), signe d'un biais du score cloze (`scripts/pilot_cycle3_cuda.py:282-291`). DOWNSCALE pèse environ 35 fois la mise à jour SGD (`:463-466`, smoke) et le bras LR-matched est bloqué à c=5, en bord de grille.
3. **MAJEUR** : verrou E1-small = commit `963bb24` sur GitHub, code E1 inchangé depuis, avenant gelé avant le confirmatoire. Mais OSF ne sera plus un préenregistrement, l'heure de lancement n'est pas vérifiable et `docs/osf-filing/e1-small/FILING-NOTE.md:6` est obsolète. Il faut déposer et horodater par un tiers maintenant.
4. **MAJEUR** : G4 est prévisible d'après le smoke 3 (A ≈ +0,005 négligeable, B < 0, C équivalent ; unmixed ≥ cross). CDPA est confondu avec le biais de la tête et le garde-fou DOA est bloqué à 0,5. Il faudrait ajouter une AUROC par paire.
5. **MAJEUR** : les FAILS de DR-3 (H13-C/D) sont quasi garantis par τ et la normalisation par quantile (`kiki_oniric/eval/relational_probe.py:167-179`, poids entraîné 0,001 contre 0,12 pour le nul). L'écart avec RCI prévu par la ROADMAP (#47) est à trancher. NH-03 est correctement réattribué à la récence, mais le délai de #79 confond récence et interférence.
