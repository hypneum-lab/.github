# baby-brain + BabyBrain — inventaire et relecture (2026-11-01)

## 0. En-tête

- **baby-brain** : `git -C clones/baby-brain rev-parse HEAD` = `376fe83824eb7373a18da57acb6cd63d88850fc2` (dernier commit 2026-10-31, PR #290 « declare AI assistance » ; 285 commits dans le clone).
- **BabyBrain** : `86f1a9f058fa2efd7963dd676121833911cf0947` (2026-10-31, PR #49 ; 72 commits).
- **Fichiers lus en entier** : `docs/paper/2026-05-22-ontogenetic-wml-draft.md` (682 l.), `docs/paper/references.bib` (271 l., 30 entrées), `docs/paper/README.md`, `baby_brain/loop/lpm.py`, `tests/loop/test_lpm_acceptance.py`, les 3 JSON de `docs/research/`, `docs/specs/2026-05-22-eval-driven-transition-design.md` (l.1-40), README (l.40-125), ROADMAP (l.180-240), issues #287 et #288, `BabyBrain/README.md`.
- **Lus en partie (fonctions ciblées)** : `baby_brain/ontogeny/{__main__,harness,transitions,integration,gates,stubs}.py`, `baby_brain/adapters/{dream_mlx,dream,plasticity}.py`, `baby_brain/loop/{replay,stage_modulation}.py`, `baby_brain/training/config.py`, `baby_brain/model/wml.py`, `tests/loop/test_lpm.py`, fixture `tests/fixtures/sp7_minigrid_phase1a_curve.jsonl` (500 lignes, recalculée).
- **Non lus** : données, binaires, firmware, apps Swift (sauf comparaison de fichiers avec BabyBrain).
- **Calculs locaux légers** (numpy, < 1 min) : LPM recalculé sur la fixture, calibration du LPM sous un nul AR(1), puissance de la règle « IC bootstrap non chevauchants » à 5 graines, simulation d'AdamW avec gradients multipliés.
- **Durée** : environ 1 h 15.

## 1. État des lieux

baby-brain est un harnais « ontogénétique » : un orchestrateur (SP4) fait passer un World-Model Learner multimodal (SP1, ~252 M paramètres) par 7 stades et règle par stade des « portes de plasticité » par module.
Il y ajoute une boucle perception-action par curiosité (SP7) et trois adaptateurs vers dream-of-kiki, bouba_sens et nerve-wml.
**Un seul manuscrit** : `docs/paper/2026-05-22-ontogenetic-wml-draft.md`, brouillon SP6, 682 lignes, **sans aucun résultat** (bandeau l.3-24, statut revu le 25/10).
Il pose 4 hypothèses (Claims A à D) et un plan d'ablations E0-E4, tous « not tested ».
Il n'y a ni dépôt OSF ni préenregistrement.
Seules mesures du dépôt : trois smoke runs SP7 à une graine et 500 ticks (2026-05-30, `docs/research/*.json`).
Le LP y est négatif dans les trois environnements.
Activité depuis le 01/10 : 11 commits, tous de documentation (PR #282, #283 bibliographie ; #289 corrections « phase 0 » ; #290 note IA).
Aucune campagne n'est en cours.
Issues ouvertes : #286 (NH-77 substrat LeWorldModel), #287 (NH-87 bras chronologique), #288 (critère LP multi-échelles à préenregistrer).
**BabyBrain** est une application macOS SwiftUI (cockpit de monitoring), sans contenu scientifique.
C'est une **copie divergente** de `baby-brain/apps/baby-brain-monitor/` : sur 39 fichiers Swift de BabyBrain, 29 sont identiques et 10 diffèrent ; la copie du monorepo en a 43 (dernier commit 2026-05-30), BabyBrain a été modifié le 2026-10-23.
BabyBrain dépend du monorepo par chemin relatif (`BabyBrain/Packages/BabyBrainMonitor/Package.swift:13-14`).
Ce n'est donc ni un doublon exact ni une archive.

## 2. Lecture du papier

### 2.1 Condensé section par section (`2026-05-22-ontogenetic-wml-draft.md`)

| § | lignes | ce qu'elle affirme | ce qu'elle prouve | ce qui manque |
|---|---|---|---|---|
| Bandeau | 3-24 | Aucun résultat, aucun préenregistrement ; A à D « not tested ». | Honnête et conforme au dépôt. | — |
| Résumé | 28-55 | Claim A : des portes de plasticité par stade améliorent l'efficacité en échantillons face à un entraînement plat ; Claim B secondaire. | Rien (hypothèses). | La taille d'effet visée n'est pas donnée. |
| 1 Introduction | 59-109 | Motivations : fenêtres critiques, perception active, pluralité théorique. | Rien. | Aucune source pour la pluralité (reconnu l.671-676). Elman 1993 et Rohde & Plaut 1999 absents. |
| 2 Travaux liés | 111-249 | Situe A face à ZWM (stades émergents), BabyCL (rejeu chronologique) et Achille/Pawlak (périodes critiques en DL). | Les 30 références existent ; 24 sont exactes sur le fond (voir `refs/baby-brain-refs.md`). | « When do curricula work? », Dohare 2024, Oudeyer-Kaplan-Hafner 2007, Frank et al. 2610.31842. La ligne 116 parle de marqueurs `[CITE]` restants alors qu'il n'y en a plus. |
| 3.1 WML | 259-308 | Perceiver-IO, workspace K=64×D=512, ~252 M paramètres ; inférence < 3 Go (978,8 Mo pic). | La somme des modules fait 252,18 M (vérifiée à la main, l.265-267). Le chiffre 978,8 Mo n'a de source que dans `ROADMAP.md:101`, sans artefact. | Path-B n'a jamais été comparé à Path-A. |
| 3.2 Curriculum | 310-328 | Échantillonnage par stade avec fuite vers les stades antérieurs. | La classe `Curriculum` existe. | **Le harnais ne l'utilise pas par stade** : l'entraînement tire toujours au stade NEONATE (constat B2). |
| 3.3 Harnais | 330-387 | Portes en [0,1] par module, appliquées « pour de vrai » aux gradients ; transition hybride « genuinely data-driven » via bouba_sens. | Les portes multiplient bien les gradients (`integration.py:94-109`). | **Sous AdamW, une porte dans (0,1] ne change pas la mise à jour** (B1). La transition par défaut repose sur une plasticité factice constante à 0,6 (M3). |
| 3.4 Boucle SP7 | 389-429 | Planification par inférence : gain d'information attendu, tracker de LP. | Code présent (`loop/`). | Les 500 ticks de la fixture 1a restent tous dans la région 0, au stade NEONATE, à τ=1 (M5). Le mécanisme stadifié n'a jamais tourné sur un vrai environnement. |
| 3.5 Adaptateurs | 431-447 | Le rêve consolide, bouba_sens mesure la plasticité, nerve module γ/θ. | Les ABC existent. | **Le rêve ne modifie pas le WML** (B3). L'adaptateur bouba_sens n'est instancié que dans les tests. nerve n'est pas branché dans le CLI. |
| 4.1 Plan | 457-469 | Mini-WML de « quelques M » paramètres, 5 graines, IC bootstrap. | — | **Le mini-WML n'existe pas dans le code** (M4). |
| 4.2 E0-E4 | 471-567 | E1 ne change « exactly one thing » par rapport à E0 ; A est soutenu si les IC ne se chevauchent pas et falsifié s'ils se chevauchent. | — | Changer le stade change aussi la profondeur de raisonnement, la cible de babil, le profil de rêve et τ (B2). La règle de décision est peu puissante et confond absence de preuve et réfutation (M1). La « concept coverage » de B n'est pas définie (reconnu l.639-643). |
| 4.3 Figures | 569-580 | F1-F7 : ce sont des emplacements. | — | — |
| 5 Préreg | 582-614 | Gel prévu des hypothèses, des graines, des métriques ; correction de multiplicité. | — | Il manque le traitement des runs qui n'atteignent jamais l'erreur cible (données censurées) et un test d'équivalence. |
| 6 Discussion | 616-664 | Limites honnêtes, retrait possible. | — | Les trois défauts de mécanisme ci-dessous n'y figurent pas. |

### 2.2 Équations, affirmations et figures clés

| élément | lignes | verdict |
|---|---|---|
| Somme des paramètres 21,8+90+0,7+0,033+33,6+50+19,7+35,3+1,05 = 252,18 M | 265-267 | **vérifié** (arithmétique) |
| Inférence à 978,8 Mo de pic Metal | 269-270 | **invérifiable** (seulement `ROADMAP.md:101`, aucun journal) |
| Saturation par CV = std/mean < seuil ; historique nul = saturé | 366-372 | **vérifié** (code `transitions.py:82-92`) ; **dégénéré** avec la plasticité factice (std = 0, donc transition à chaque plancher) |
| « Gate snapshot applied for real to the gradients … this is the mechanism Claim A tests » | 357-360 | **faux en effet** : la multiplication existe (`integration.py:94-109`, appliquée à `__main__.py:457-460`), mais l'optimiseur est AdamW (`__main__.py:1519-1523`) et AdamW est invariant à l'échelle des gradients (B1) |
| Transition « genuinely data-driven » par bouba_sens | 379-381 | **faux dans le code livré** : `StubPlasticityAdapter(schedule=[0.6]*…)` est câblé en dur (`__main__.py:1773-1774`) ; `SubprocessPlasticityAdapter` n'apparaît que dans `tests/adapters/test_plasticity.py` |
| Le rêve rejoue les épisodes à ε élevé | 427-429, 435-437 | **faux en effet** : `MLXDreamAdapter.consolidate` renvoie les latents d'entrée inchangés (`dream_mlx.py:89-97`). Le harnais lui passe `workspace_latents=None` (`harness.py:253-262`). `WML.apply_consolidation` n'existe pas (grep vide), donc `replay.py:131-132` ne fait rien |
| Règle E1 : IC non chevauchants = soutenu, chevauchants = falsifié | 512-516 | **statistiquement faible** (M1, simulé) |
| F1-F7 | 571-580 | emplacements, rien à vérifier |

### 2.3 Résultats du dépôt hors papier (Phase 1 SP7)

La revue du 24/10 et la PR #289 ont déjà corrigé les verdicts (README l.47-67, ROADMAP l.180-230).
Le delta tient au recalcul du LPM (`loop/lpm.py`) sur la fixture 1a (`tests/fixtures/sp7_minigrid_phase1a_curve.jsonl`).
Résultat : `passed=True`, `status=LEARNING`, `relative_drop=0,588`, `drop_pvalue=8,0e-15`, `backhalf_pvalue=1,8e-4`, n=500.
La baisse résiste à l'exclusion des 20 puis des 50 premiers ticks (p=6,3e-13 puis 5,6e-10).
Donc « ε baisse sur MiniGrid » est robuste.
En revanche, l'autocorrélation de ε brut est de 0,18 au retard 1 et 0,34 au retard 2 sur la série entière, et de **0,55 au retard 1 sur la seconde moitié**.
Sous un nul stationnaire AR(1) de même autocorrélation (r=0,55, 300 tirages), Mann-Whitney donne p<0,05 dans **15 %** des cas au lieu de 5 %, et Mann-Kendall (le critère de régression) dans **35 %**.
Le test d'acceptation `tests/loop/test_lpm_acceptance.py:25-41` affirme que la courbe que l'ancien critère a fait échouer « must now PASS ».
Il fige donc dans la CI le déplacement de but signalé par #288.

## 3. Vérification des références

Le détail est dans `inventory/refs/baby-brain-refs.md`.
Sur 30 entrées : **24 OK**, 2 années ou clés incohérentes (Perceiver IO, DINOv2), 3 attributions douteuses (Bengio et le « jalon développemental » ; ChildVox « EMNLP 2026 » non confirmé ; « BabyLM at EMNLP 2026 » absent du résumé cité), 1 non vérifiable (OpenReview EaGbKYSNTf, défi 403).
0 introuvable.
**Manquantes** (toutes résolues par API) : Wu et al. 2021 (arXiv:2012.03107), Elman 1993, Rohde & Plaut 1999, Dohare et al. 2024, Oudeyer-Kaplan-Hafner 2007, McCloskey & Cohen 1989, Dupoux-LeCun-Malik 2603.15381, Velocity Blind Spot 2610.04585, Frank et al. 2610.31842.
**Rome** : aucune citation présente.
Aucun papier de Rome ne devance ni ne contredit A ou B.
Pour C et E4, il faut citer Fachechi-Agliari-Barra 2019 (10.1016/j.neunet.2019.01.006) en §2 l.230-239 et §3.5 l.435.
Il faut aussi citer Agliari et al. 2024 (10.1016/j.neunet.2024.106389, rêve = ridge + early-stopping) en E4 l.554-565, avec un contrôle de régularisation à budget égal.
Les citations Crick-Mitchison, Hopfield-Feinstein-Palmer et Fachechi 2019 fusionnées dans dream-of-kiki ne concernent pas ce dépôt ; non vérifiées ici.

## 4. Analyses

**Puissance (simulée, 1000 répétitions, effet en d de Cohen, 5 graines par bras).**
Avec la règle « IC bootstrap 95 % non chevauchants » (l.512-516), le taux de « soutien » est de 3 % sous le nul, 27 % à d=1, 54 % à d=1,5 et 74 % à d=2.
À titre de comparaison, un t unilatéral donne 40 %, 70 % et 88 %.
Le bootstrap percentile à n=5 couvre **83 %** au lieu de 95 %.
À n=5, il n'existe que C(9,5)=126 rééchantillons distincts (combinatoire vérifiée).
Avec la règle actuelle, un effet *grand* (d=1) serait donc déclaré « falsifié » trois fois sur quatre.

**Capacité et compute.**
Le seul modèle du code est le WML à 252 M paramètres.
5 bras × 5 graines de ce modèle ne relèvent pas du « mini » (l.462-463, 644-646).
Le budget n'est pas estimé.

**Ce que dirait un rapporteur, en 3 points.**
(1) Le mécanisme testé n'est pas celui que décrit le texte : multiplier les gradients sous AdamW revient, pour une porte dans (0,1], à ne rien faire ; les vraies variables sont le gel (porte = 0) et le calendrier des stades.
(2) E1 contre E0 n'est pas une ablation à un facteur, car le stade pilote aussi la profondeur de raisonnement, les cibles motrices et le rêve.
(3) La règle de décision n'a pas la puissance voulue et n'a pas d'issue « équivalent ».

**Positionnement.**
Une fois les références lues, la contribution neuve se réduit à « des stades *imposés* battent-ils des stades *émergents* (ZWM) ou un flux chronologique (BabyCL) ? ».
C'est exactement NH-87 (#287).
Frank et al. (2610.31842, résumé lu) ne testent pas de stades.
Ils montrent que des représentations visuelles pré-entraînées sur Internet surpassent l'apprentissage sur la seule vidéo développementale.
L'argument vise Path-B, pas Claim A.

## 5. Suppositions implicites

1. Une porte multiplicative sur le gradient réduit la plasticité. Si c'est faux (ça l'est sous Adam), Claim A teste un placebo pour toute porte non nulle.
2. Une porte à 0 gèle le module. AdamW découplé continue d'appliquer la décroissance de poids (`weight_decay=0.1`, `training/config.py:32`) : les encodeurs pré-entraînés de Path-A dérivent vers 0 pendant le gel. Ma simulation numpy donne un déplacement non nul à porte 0 ; c'est à confirmer dans le source MLX épinglé, que je n'ai pas lu.
3. Le stade est la seule variable manipulée. Si c'est faux, les effets de E1 sont confondus.
4. Le curriculum suit le stade. Si c'est faux (le harnais tire au stade NEONATE, `__main__.py:224-230`), les « stades » ne changent pas les données et les sources réelles TODDLER+ ne sont jamais vues à l'entraînement.
5. La plasticité mesurée varie. Si c'est faux (constante factice), les transitions sont un calendrier fixe de 5 époques par stade.
6. Le rêve agit sur le WML. Si c'est faux, E4 contre E3 est nul par construction.
7. Les ticks sont indépendants. Si c'est faux, MWU et MK sont anticonservateurs (15 % et 35 % de faux positifs).
8. Path-A est développementalement neutre. Si c'est faux (DINOv2/HuBERT viennent de corpus du Web), « ontogenèse » ne qualifie que le tronc.

## 6. Pistes d'utilité

- **Publiable tel quel** : rien comme papier empirique. L'erratum Phase 1 (LP négatif sur 3 environnements, critère redéfini après coup) peut alimenter la note méthodologique Hypneum sur les nuls et errata, avec le chiffrage AR(1) ci-dessus.
- **À arrêter** : les portes fractionnaires (0,2) comme variable expérimentale sous Adam ; E4 tant que le rêve ne touche pas le WML ; l'emploi du test d'acceptation LPM comme preuve d'apprentissage.
- **À faire avant toute soumission** :
  - implémenter la porte sur le taux d'apprentissage par module (groupes de paramètres, ou porte appliquée *après* l'étape Adam) ou un vrai gel (sans décroissance de poids) ;
  - un unique bras E1 dont seul le calendrier des portes diffère (profondeur, babil, rêve et τ fixés) ;
  - un curriculum qui suive réellement le stade (ou un E0 qui reçoive la même séquence de données) ;
  - un vrai mini-WML ;
  - une règle préenregistrée : Welch ou permutation sur l'aire sous la courbe d'apprentissage (pas de « samples-to-target » censuré), TOST avec SESOI, au moins 10 graines si d≈1 ;
  - le bras chronologique de NH-87 ;
  - un LPM à blocs (block bootstrap ou MWU sur moyennes de blocs) préenregistré (#288).
- **BabyBrain** : archiver l'un des deux cockpits ; aujourd'hui deux copies divergent.

## 7. Constats classés

### BLOQUANT
1. **Les portes de plasticité ne règlent pas la plasticité sous AdamW.**
   Les portes multiplient les gradients (`baby_brain/ontogeny/integration.py:94-109`, appliquées à `baby_brain/ontogeny/__main__.py:457-460`) avant `optim.AdamW` (`__main__.py:1519-1523`).
   Le rapport m̂/√v̂ d'Adam est invariant à un facteur constant sur g (dérivation à la main ; simulation : déplacement moyen identique à 1e-8 près pour les portes 1,0, 0,2 et 0,05).
   Le seul effet réel est celui de la porte 0 (`_build_gate_schedule`, `__main__.py:517-534` : encodeurs à 0 en NEONATE, 0,2 en INFANT). À porte 0, la décroissance de poids continue de déplacer les poids.
   Le texte l.357-360 dit que c'est le mécanisme testé par Claim A. **Nouveau vs baseline.**
2. **E1 contre E0 n'est pas une ablation à un facteur, et les données ne suivent pas le stade.**
   Le stade fixe la profondeur de raisonnement (`__main__.py:1711`) et la cible de babil (`__main__.py:380-392`), en plus du profil de rêve (`adapters/dream_mlx.py:26-34`) et de τ (`loop/stage_modulation.py`).
   Le jeu d'entraînement tire toujours au stade NEONATE (`__main__.py:224-230`).
   Cela contredit « exactly one thing changes » (draft l.500-503) et le curriculum par stade de §3.2 (l.321-325). **Nouveau.**
3. **Claim C / E4 est nul par construction.**
   `MLXDreamAdapter.consolidate` renvoie les latents inchangés (`dream_mlx.py:89-97`), le harnais lui envoie `workspace_latents=None` (`harness.py:253-262`) et `apply_consolidation` n'existe pas sur le WML (`loop/replay.py:131-132`, grep vide).
   Le texte l.427-429 et l.554-565 décrit pourtant une consolidation onirique du WML. **Nouveau.**

### MAJEUR
4. **Règle de décision.** « IC bootstrap non chevauchants » ; chevauchement = falsifié (draft l.512-516).
   Avec 5 graines : 27 % de soutien à d=1, couverture du bootstrap de 83 %, 126 rééchantillons distincts.
   Le chevauchement est traité comme une réfutation. **Confirme le constat Codex de la baseline 30/10 (l.92), et le chiffre.**
5. **LPM sur une série autocorrélée.** Le critère utilise MWU et MK sur ε brut (`loop/lpm.py:76-132, 207, 214`). L'autocorrélation au retard 1 vaut 0,55 sur la seconde moitié de la fixture.
   Taux de faux positifs : 15 % (MWU) et 35 % (MK) sous AR(1).
   La baisse 1a reste robuste (p=8e-15 ; p=6e-10 sans les 50 premiers ticks).
   `test_lpm_acceptance.py:25-41` fige le déplacement de but. **Confirme la baseline 30/10 l.92 et #288, chiffré.**
6. **Transition dégénérée, et le texte dit le contraire.** Par défaut : politique `hybrid` (`__main__.py:1293-1296`) et `StubPlasticityAdapter([0.6]…)` (`__main__.py:1773-1774`).
   Le draft l.379-381 parle d'un critère « genuinely data-driven ». **Confirme la baseline 24/10 §2.5 (« ADULT in ~7 min ») ; nouveau : la contradiction du texte.**
7. **Le mini-WML annoncé n'existe pas.** Draft l.462-463 ; seul `WMLConfig` existe (`model/config.py:8`, 252 M). **Nouveau.**
8. **La preuve 1a est mono-région et mono-stade** : 500/500 ticks en région 0, stade NEONATE, τ=1,0 (fixture). Le « LP par région » de l'ancien critère portait sur une seule région. **Nouveau.**
9. **La baseline 30/10 l.168 classe 2610.31842 comme « résultat négatif publié » sur les stades.** Le résumé (lu via l'API) porte sur l'apprentissage mot-objet et la qualité des représentations visuelles, sans manipulation de stades. Il pèse contre Path-B (draft l.303-308), pas contre Claim A. QFw0sg52VV est non vérifiable (OpenReview 403). **Infirme partiellement la baseline 30/10 l.168 et l.210.**
10. **Antériorités manquantes** : Wu et al. 2021, Elman 1993 / Rohde & Plaut 1999, Dohare et al. 2024, Oudeyer-Kaplan-Hafner 2007 (le tracker LP de l.410-414). **Nouveau.**

### MINEUR
11. Clé et année incohérentes : `jaegle2022perceiverio` (année 2021, ICLR 2022) et `oquab2024dinov2` (2023, TMLR 2024), `references.bib:230-252`. **Nouveau.**
12. Attributions douteuses : Bengio et le « developmental milestone » (l.137-139) ; ChildVox « EMNLP 2026 » (`references.bib:57-64`) ; « BabyLM fourth round at EMNLP 2026 » (l.172-174), absent du résumé de 2602.20092. **Nouveau.**
13. La ligne 116 annonce des `[CITE]` restants alors qu'il n'y en a plus. La ligne 359 cite `tree_map` alors que le code utilise `tree_map_with_path`. **Nouveau.**
14. Le chiffre 978,8 Mo (l.269-270) n'a pas d'artefact (`ROADMAP.md:101` seulement). **Nouveau.**
15. Aucune CI dans baby-brain (pas de `.github/`). Fragilité de protocole connue : un `.pyc` périmé fait ignorer un nouveau `FrameType` (`baby_brain/io/protocol.py`). C'est un problème d'infrastructure du runtime matériel, sans portée sur le papier. **Confirme la baseline 24/10 (« aucune CI »).**
16. BabyBrain est une copie divergente du cockpit du monorepo (29/39 fichiers identiques). **Nouveau.**
17. Le résumé de Yang et al. (2609.10702) indique un programme conduit par un agent autonome ; le texte l.162 ne le dit pas. **Nouveau.**

### OK
18. Le bandeau « no results », les verdicts « not tested » et l'erratum Phase 1 sont conformes aux JSON (`docs/research/*.json`). **Confirme la baseline 24/10 et la PR #289.**
19. Les 30 références existent, et les 30 clés sont toutes citées. La somme des paramètres (252,18 M) est exacte.
20. Les avertissements sur la réutilisation des données (Yang, l.162-171) et sur le planning du taux d'apprentissage du contrôle (Pawlak, l.219-221) sont pertinents et conformes aux sources.
