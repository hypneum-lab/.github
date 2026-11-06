# Inventaire — bouba_sens (relecture scientifique, 2026-11-01)

## 0. En-tête

- **Dépôt** : `hypneum-lab/bouba_sens`, clone frais `scratchpad/clones/bouba_sens`, non modifié.
- **SHA** : `6f224d1725787d03c7bc52cdb7e228570412d3cf` (2026-10-31 22:57, #67 erratum graines v0.7).
- **Activité depuis le 24/10** : 70 commits (`git log --since=2026-10-24`), PR #41 à #67 ; une seule PR ouverte : #66 (brouillon nul réseau, ADR-0028), lue via `gh api` (`scratchpad/pr66-prereg-draft.md`, 316 l.).
- **Lu intégralement** : `docs/paper/main.tex` (1339 l.), `docs/paper/paper-v0.1-draft.md` (1046 l.), `docs/paper/refs.bib` (32 entrées), `docs/paper/cover-letter-tmlr.md` (232 l.), ADR-0026, ADR-0027, milestone Me6 large-n, prereg pilote Me6, amendement diagnostic Me6, erratum v0.7 (#67), brouillon PR #66.
- **Lu par parties** : `docs/osf/amendment-v0.7-actionsense.md` (577 l. : §1-5, 335-350, 400-440, 510-525), spec de design 2026-04-20 (40-60, 500-525), ADR-0009/0019/0020/0022-0024, milestone interaction lésion B-3, `README.md`, `CITATION.cff`, `.zenodo.json`.
- **Code lu** : `src/bouba_sens/loop.py:274-360`, `nerve.py:272-345`, `metrics/asymmetry.py:9-30`, `metrics/mi_migration.py:55`, `lesion.py:70-85`, `cli.py:200-235, 540-560, 715-820`, `scripts/aggregate_grid.py:200-225`, `scripts/run_grid.sh:160-185`, `scripts/run_grid_probe_v2.sh:100-120`.
- **Données recoupées** : `reports/me6_large_n_*.json` (16 lignes primaires), `reports/v0.5_amedi_curve_multiseed_10seed_final.json`, `reports/v0.5_amedi_n12_verdict.json`.
- **Durée** : environ 2 h 30 de lecture et de vérification. Aucun calcul lourd ; seulement de l'arithmétique à la main ou en une ligne Python.
- **Bases** : `.github` README 2026-10-24 (revue des hypothèses) et 2026-10-30 (état des lieux), lus **après** ma propre lecture.

## 1. État des lieux (≤ 15 lignes)

Le dépôt mesure trois « invariants » de plasticité cross-modale (B-1 : écart T1/T2 de Me7 > 0,05 ; B-2 : migration d'information Me3 > 0,10 bit ; B-3 : asymétrie Me6 > 0,02) sur des mondes synthétiques et un pont Studyforrest « 4,5 modalités ».
B-1 est rétracté (ADR-0019) et B-2 est nul. B-3 est « compatible avec le nul apparié » sur le monde gaussien (README:91).
Les errata d'octobre changent la portée de tout ce qui précède :
- le régime argmax-bridge par défaut n'apprend pas (ADR-0024) ;
- la lésion n'est pas effective, car le SNR reste vers 19,2-19,8 dB (ADR-0020) et les grilles ne passent pas `--k-steps` (`run_grid.sh:171`) ;
- les mondes de phase 1 et de lésion diffèrent pour toute graine ≠ 0 (ADR-0027).

Depuis le 30/10, plusieurs pièces se sont ajoutées :
- la préreg v0.7 ActionSense a été taguée (02c2407) ;
- l'ADR-0026 (Me6 à grand n) a été gelée (tag `prereg-me6-large-n-20261031`), puis exécutée le 31/10 de 09:19 à 12:37 ;
- un amendement diagnostic déclaré conclut « piste C » : l'unité échangeable du nul est à revoir ;
- le brouillon #66 (nul au niveau réseau) est ouvert.

Aucune grille ActionSense n'a tourné, et l'ADR-0025 n'existe pas (`docs/adr/README.md:70`).
Le manuscrit `main.tex` (dernière modification le 29/10) n'intègre ni ADR-0026 ni ADR-0027, et son corps contredit son propre abstract.

## 2. Lecture des papiers

### 2.1 `docs/paper/main.tex` (manuscrit de référence, lu en entier)

| § (lignes) | contenu | verdict |
|---|---|---|
| Abstract (37-100) | B-3 « magnitude only » 0,109-0,125 (5,5-6,3×) ; B-1 rétracté ; B-2 nul ; retrait de la « configuration minimale » (90-94). Release `git.saillant.cc` tag v0.5.9, « ADRs 0001-0021 » (96). | MAJEUR : omet ADR-0024 (pas d'apprentissage), ADR-0020 (lésion inopérante), ADR-0022 (nul apparié), ADR-0026/0027. La plage B-3 de 59 ne correspond pas au tableau (0,1016 à 547 ; « 5,1-6,2× » à 555). |
| Intro 104-170 | Motivation Amedi + bouba/kiki « structural » (110-120). | MAJEUR : amedi2007 ne soutient pas l'écart quantitatif. Sidhu 2018 ne soutient ni le « ≥ 95 % transculturel » ni le « hard-wired » (refs §1, #1 et #6). |
| Méthodes 170-300 | Protocole nerve-wml, 5 modalités, 3 mondes, invariants (Table 1, 149-151). Audit de complexité : écart relatif « < 3 % » (272). | MAJEUR : la Table 1 omet les clauses de la spec gelée (§4.4). L'écart relatif vaut « < 10 % » à 770. |
| Résultats 300-470 | Mondes synthétiques et ECG (358 : B-3 = 0,4453) ; verdict « B-3 PASS 3/3 (~7× threshold) » (346) ; « B-3 passes in every world » (461). | BLOQUANT : ces phrases restent alors que le §1231-1239 conclut à l'absence d'effet de lésion. Les valeurs B-3 sont des multiples de 1/128 (sonde n = 64, médiane de 30) ; 0,1406 = 9/64 est exactement la médiane nulle (milestone Me6 :50 : médiane nulle 0,1406 au mock `cell` n = 64). |
| Studyforrest réel 500-560 | Table 547 : 4,5-modal réel B-3 0,1016 / 0,1250. Errata 507-522 : tenseurs réels perdus. | MAJEUR : chiffres non régénérables (507-522), confirme la baseline 24/10 (« 32/40 artefacts gitignorés »). |
| Verrou 560-567 | « B-3 survives the lock in 5/5 worlds — further confirming its architectural-invariant status » (565-566). | BLOQUANT : affirmation retirée ailleurs (README:231-233). |
| Dose-réponse 569-640 | « 20 seeds × 5 LOCK_AFTER » (571) ; rétractation (test de signe p = 0,623 ; quadratique poolée p = 0,1907 ; N12 c = 2,14e-6, p = 0,595 et c = −1,11e-5, p = 0,129). | OK sur les statistiques (recoupées dans `reports/v0.5_amedi_curve_multiseed_10seed_final.json` et `v0.5_amedi_n12_verdict.json`). MINEUR : « 20 seeds » contredit les 10 graines d'ADR-0019 ; « 1500 cells × 5 LOCK = 7500 » est incohérent. |
| Synthèse 750-760 | « B-3 is always positive and architecturally invariant … central claim narrows to: a frozen mux with hard transducer gating is the minimal configuration » (754-759). | BLOQUANT : c'est l'affirmation retirée à 90-94 et dans README:231-233. Le corps se contredit (baseline 24/10 §2.4 l'avait relevé à §4.4 ; elle persiste ailleurs). |
| E1/E2 et MI 900-1000 | Tables Kraskov (moyenne 0,033, sd 0,047), full-probe (−0,012 / 0,031 / −11,86), D_PR 7,61, two-NN 13,08, τ = 0,3 moyenne 0,005 : arithmétique recoupée. MINE ≈ 1e-7 sur le pont réel (964). | OK pour l'arithmétique. Inférence : un MINE de l'ordre de 1e-7 évoque des codes effondrés, cohérent avec ADR-0024 ; le texte ne le dit pas. |
| Related work 1055-1190 | Amedi, Heimler (1069), « Missing-modality robustness » (1077-1106), bouba/kiki (1112-1114), pré-enregistrement (1145-1147), nerve nets (1184-1185). | MAJEUR : 4 attributions fausses (Sidhu, Gebru, Vanschoren, McNaughton). Aucun papier du groupe de Rome (§4.3). |
| Artefacts 1200-1280 | github, PyPI 0.5.4, commit 360a442 (1205) ; nerve-wml v1.5.3 (1208) ; « ADRs 0004 through 0021 » (1278). | MINEUR : versions périmées ; le DOI Zenodo résout vers v1.1.1. |
| Errata 1229-1273 | « Final B-3 reading (2026-10-27) » : straight-through, Me1 0,467, interaction p = 0,49 ; errata 1241-1252, 1254-1267, 1269-1273. | BLOQUANT (portée) : la grille 300-309 qui porte cette lecture tourne avec la lésion inopérante (k = 5000, SNR ≈ 19 dB) et est touchée par ADR-0027 (T2 lésé sur le monde 0). Le texte ne mentionne ni l'un ni l'autre. |
| Calendrier 1330-1332 | « calendar S2, 2026-05-08 ». | MINEUR : périmé. |

**Verdict main.tex.** Non soumissible en l'état. Le texte superpose trois strates (avril-mai : « invariant architectural », octobre : « compatible avec le nul », 27/10 : « pas d'effet de lésion ») sans retirer la première. Le seul énoncé encore défendable est négatif : avec un réseau qui apprend (straight-through) et un nul exact, aucun effet de lésion n'est détecté. Or cet énoncé repose sur une lésion inopérante, ce qui en fait un non-test plutôt qu'un négatif.

### 2.2 `docs/paper/paper-v0.1-draft.md` (lu en entier)

- Marqué comme remplacé (12-17). Il revendique encore l'OSF Q6JYN (9, 40-41), alors que les métadonnées ont été corrigées (CITATION.cff:22, README:82, 220-225).
- Les chiffres sont plus anciens que ceux de main.tex.
- Le balayage « entropy-proxy » (236-245) donne des B-3 jusqu'à 2,549. Une différence d'exactitude est bornée par 1, donc ces valeurs ne sont pas des Me6. Inférence : il s'agit d'un balayage de bruit sur matrices synthétiques, tautologique par construction.
- Verdict : MINEUR, puisque le fichier est remplacé ; à archiver ou à marquer plus fortement, car il reste en `docs/paper/`.

### 2.3 `docs/paper/cover-letter-tmlr.md` (lue en entier)

La lettre est périmée sur plusieurs points :
- « Eighteen ADRs (`docs/adr/0004..0017`) » (36) ; on en est à 0027.
- « B-3 passes on magnitude only » (47-49).
- Elle vise le Reproducibility track avec « First pre-registered benchmark … on a real Studyforrest bridge » (56-58). Les tenseurs réels sont pourtant perdus (main.tex:507-522).
- « Every empirical statement … thresholds locked before the evaluation campaign » (32-36) contredit le glissement d'opérationnalisation (§4.4).
- Elle attribue à Achille la position de premier auteur (130-132) ; c'est Kleinman (refs §2).

Verdict : MAJEUR si elle est envoyée ; à réécrire entièrement avant toute soumission.

## 3. Vérification des références

Le détail est dans `inventory/refs/bouba_sens-refs.md`.
- **refs.bib, 32 entrées** : 20 OK, 3 OK-v (lieu non vérifié), 9 avec défaut.
  - 2 attributions douteuses : amedi2007, moody2001.
  - 3 attributions contredites : sidhu2018, gebru2021, mcnaughton1971.
  - 2 DOI faux : Zenodo nerve-wml → v1.1.1 ; Studyforrest non enregistré.
  - 1 métadonnée fausse : lubba2019, 5 auteurs sur 7 faux.
  - 1 introuvable : vanschoren2021.
  - 31/32 existent. 1 entrée orpheline : oord2018.
- **Inline, 11** : 6 OK, 4 KO, 2 non vérifiées. Les KO sont : spec Heimler DOI → article sur le prurit ; spec et README Röder 2021 PNAS non enregistré ; lettre « Achille first author ».
- **Manquantes** : 8 lignes dans la table §3 de la fiche refs. Les sources réelles de l'écart congénital/tardif sont Cohen 1999, Sadato 2002 et Collignon 2013. Il manque aussi Ćwiek 2021 (transculturel), Moody & Mark 2001 (MIT-BIH), Hanke et Sengupta 2016 (Studyforrest) et Röder/Kekunnaya/Guerreiro 2021.

## 4. Analyses

### 4.1 Me6 confirmatoire du 31/10 : cohérence préreg ↔ analyse (sans verdict propre)

Conformément à hypneum-nulls, je ne déclare aucun verdict ; je vérifie seulement que l'analyse suit la préreg.

- **Chronologie** :
  - tag annoté `prereg-me6-large-n-20261031` sur b790db2 (08:27:58 CET), manifeste de gel sha 580e13db… ;
  - pilote mock 08:31-09:14 ;
  - commit des longueurs de bloc `9b39c20` à 08:19:31Z (09:19:31 CET), vérifié via l'API GitHub car il est absent du clone (squash #60, fusionné à 14:37Z) ;
  - première cellule confirmatoire 09:19:53 CET, soit 22 s plus tard.
  - Conforme, sous réserve que « poussé » vaille « gelé » : la règle de bloc a été poussée, pas fusionnée, avant les données.
- **Blocs** : la règle k* → puissance de 2 donne bien cell 8/16/16/16 et legacy 4/8/8/8 (prereg pilote).
- **16 lignes primaires** (milestone :46-61) : p, médianes nulles, P99 et blocs concordent avec `reports/me6_large_n_{arm}_{world}.json`. La règle de lecture d'ADR-0026:175-186 est appliquée sans écart, et le décompte Bonferroni (5 lignes < 0,000625) est exact. La plage d'exactitude 0,238-0,269 a été recoupée (0,2376-0,269).
- **Écart avec le rapport attendu, déclaré par le dépôt** : ADR-0026:218-223 attendait des lignes gaussiennes compatibles ; le milestone signale « Not met ». C'est déclaré, pas caché.
- **Amendement diagnostic** (`docs/prereg/me6-large-n/amendment-2026-10-31-diagnostic.md`) : texte poussé à 13:00Z (c80831e), scripts à 13:09Z (7b00593). D1-D3 ont tourné de 14:10 à 14:26 CET et D4 de 14:27 à 15:17 CET, d'après les journaux, avant la fusion. L'écart est déclaré dans l'amendement. Sa conclusion « piste C » (unité échangeable = réseau, pas item) relève du dépôt ; je la rapporte sans la reprendre.
- **Point de cohérence nouveau (inférence, MAJEUR)** : sur le mock, 5 lignes ont p ≥ 0,996, et la médiane observée est **sous** la médiane nulle (ex. cell n = 4096 : 0,0088 contre 0,0223, milestone :53). L'amendement note que la plupart des cellules prédisent une classe quasi constante (39-42). Avec un prédicteur quasi constant sur fenêtres contiguës, d_i = ±1 suit les segments de label. Les flips de signe par bloc détruisent cette anti-corrélation, ce qui sur-disperse le nul. Une lecture « compatible » sur le mock n'est donc pas informative. La même pathologie menace le nul par blocs de v0.7 ActionSense, qui porte aussi sur des fenêtres temporelles contiguës. L'amendement ne commente pas ce mécanisme.

### 4.2 Puissance

- ADR-0026:349-356 (table de puissance de design, nul iid) est recoupée à la main : la moyenne nulle suit 1/√n (0,1402 → 0,0702 → 0,0351 → 0,0176). Les médianes du nul apparié observées (0,0645 / 0,0625 à n = 256 ; 0,0164 / 0,0157 à n = 4096, milestone :47-59) restent à moins de 10 % de cette référence. La règle 0,02 « tire » sous H0 avec probabilité 1,000 pour n ≤ 1024 (ADR-0026:353-355) : confirme et étend la baseline 24/10 §2.4 (n = 64 seulement).
- La section puissance du milestone écrit « 0,249-0,251 » pour ce qui est le p par monde des fichiers iid (0,2488-0,2506). C'est une formulation lâche (MINEUR).
- B-3 v0.7 et ses 4 grilles : aucune correction de multiplicité entre 4 grilles × 3 invariants (amendement v0.7 §5 point 2, 438-441 : « no multiple-comparison correction », explicite). Pour une famille de 12 tests, α réel ≈ 1 − 0,95¹² ≈ 0,46 si les tests étaient indépendants. Inférence : borne grossière, les tests étant corrélés.
- La baseline 30/10:131 (« la puissance n'est pas en cause, c'est la manipulation ») tient : le défaut porte sur la lésion, pas sur n.

### 4.3 Les trois points d'un relecteur

1. **La manipulation n'est pas validée.** La lésion n'abaisse pas le SNR sous ≈ 19 dB (ADR-0020), et `run_grid.sh:171` / `run_grid_probe_v2.sh:109` ne transmettent pas `--k-steps` (défaut 5000, `cli.py:547`) pour une lésion de 100 pas. Aucun contrôle de manipulation (diagonale lésée dégradée) n'est une porte préenregistrée, que ce soit dans v0.7 ou dans #66. Confirme la baseline 30/10 constat 2 et action 6. Infirme la requalification de la baseline 30/10:357 : à HEAD, post-#56/#57/#59, le défaut est toujours présent.
2. **B-2 ne mesure pas ce que dit la spec.** La spec gelée (design 2026-04-20:44-46) définit B-2 comme « Me3_post(channel ≠ lesioned) ». Or `loop.py:286-360` alimente la sonde Me3 avec des entrées **propres** fusionnées sur les 5 modalités, avant comme après. B-2 mesure donc la dérive représentationnelle du code fusionné sur entrée propre, pas l'information des canaux survivants sous lésion. La docstring `mi_migration.py:55` (« surviving channel ») est fausse. Nouveau : la baseline 24/10 parlait d'un estimand glissé et d'un besoin de PID, sans cette preuve dans le code.
3. **H0 est mal posée pour B-3.** Perf[i, j] = exactitude quand i est lésé et j interrogé (`asymmetry.py:9-30`). Un effet principal de requête, construit par le monde, viole la symétrie P = Pᵀ sans aucun effet de lésion. v0.7 (§5 point 3, 442-453) et #66 (§2, 42-46) le reconnaissent, mais gardent cette H0. La règle fixe (« PASS » B-3 v2) est donc acquise dès que les requêtes diffèrent en difficulté. v0.7 la rapporte « as is » mais en confie la lecture au nul apparié, sans en faire une lecture d'effet de lésion : la mitigation existe, le test reste mal posé. De plus, la clause « sign structure reproducible across seeds » de la spec (44-46) n'est implémentée nulle part (`aggregate_grid.py:208-220` ne teste que `>`). D3 de l'amendement diagnostic en est le premier test de fait : 16/30 signes, p = 0,28 ; 13/30, p = 0,42.

### 4.4 Glissement d'opérationnalisation (spec gelée → code)

| invariant | spec 87f723f (44-46) | implémentation | écart |
|---|---|---|---|
| B-1 | Me7 « at SNR_floor », IC bootstrap 95 % | `aggregate_grid.py:208` : médiane > 0,05, sans IC | clause IC abandonnée sans ADR |
| B-2 | Me3_post(canal ≠ lésé) | sonde sur entrée propre fusionnée (`loop.py:286-360`) | estimand changé |
| B-3 | > 0,02 « with sign structure reproducible across seeds » | `aggregate_grid.py:220` : seuil seul | clause de reproductibilité abandonnée |

main.tex Table 1 (149-151) reprend la forme réduite. Aucun ADR ne déclare ces changements.

### 4.5 Positionnement

- Côté ML, les travaux sur la robustesse aux modalités manquantes (ma2022, girdhar2023, liang2021, sui2026) sont cités et correctement résumés.
- Côté physique statistique, le groupe de Rome fournit des modèles analytiques de mémoire associative multimodale. On y trouve des couches = modalités (DLAM), des amplitudes égales entre couches d'entropies hétérogènes (2503.04454) et des entrées vides comme données manquantes (2503.15353). Ces travaux sont absents du dépôt (0 occurrence). Détail et emplacements : fiche refs §4.
- Aucun ne contredit une affirmation **survivante**, faute d'affirmation positive restante. 2503.04454 est une contre-prédiction théorique directe de toute lecture « l'asymétrie suit l'entropie par modalité ».

### 4.6 Brouillon PR #66 (nul au niveau réseau)

- **Contrôle négatif 2 tautologique (prouvé)** (#66 §6, 201-206).
  - Le contrôle remplace A_r par D_r = P_r − P_σ(r), avec σ un dérangement fixe.
  - Le nul (a) agrège par moyenne sur les réplicats : D̄_k = (1/R) Σ_r (P_r − P_σ(r)) = 0, car σ est une permutation des réplicats.
  - Donc T_obs = 0, alors que les tirages nuls (1/R) Σ_r ε_r D_r sont en général non nuls.
  - D'où p = 1 à chaque fois : le contrôle « p ≥ 0,05 » ne peut jamais échouer.
  - Nouveau, absent de la liste « non gelable » transmise.
- H0 (§2, 36-46) inclut toujours « pas d'effet principal de requête » ; le choix est renvoyé au PI (§12 point 10). Même défaut que v0.7.
- Avec le nul (a), la statistique change (moyenne de réplicats, non Me6) ; #66 le dit (§4, 122-124). Une lecture « confirmatoire de Me6 » est donc exclue par construction.

## 5. Hypothèses implicites

1. **Le monde contient une asymétrie à détecter.** Le gaussien projette un même latent à des rangs différents par modalité (baseline 24/10 §2.4). L'asymétrie d'exactitude est alors fabriquée par le monde (effet de requête), pas par la plasticité.
2. **Le « monde ECG » est multimodal.** Selon ADR-0009, c'est une seule trace scipy : audio = rfft, vision = même forme d'onde, tactile/gravité/force à zéro, label = quartile RMS de la même fenêtre. Le label est une fonction des entrées ; le B-3 = 0,4453 (main.tex:358) mesure des modalités nulles contre des modalités informatives.
3. **La lésion de 100 pas est une lésion.** C'est faux avec k = 5000 (§4.3 point 1).
4. **Le réseau apprend.** C'est faux en argmax-bridge (ADR-0024). Les grilles Me6 du 31/10 le disent (milestone, « Regime check ») ; main.tex ne le dit pas pour ses résultats §3-§5.
5. **L'item est l'unité échangeable.** Le diagnostic (piste C) et le mécanisme mock (§4.1) suggèrent que non.
6. **Le verrou de plasticité est biologiquement fondé.** Heimler 2020 et Röder 2021 (NBR) décrivent une plasticité réactivable à l'âge adulte.
7. **Le plafond de partition (1+α)/2 = 13/18 = 72,2 % pour n = 5** fixe l'échelle de lecture du contrôle de partition. Vérifié à la main : 6 des 10 partitions séparent la paire chaude.

## 6. Pistes d'utilité

1. **Note méthodologique « nul calibré d'un max de différences d'exactitude »** : le nul apparié, le plafond de 1/128, la sur-dispersion du nul par blocs sous prédicteur constant et la tautologie de contrôle par dérangement. Ces pièces sont générales et réutilisables (cf. baseline 30/10:207, `scripts/me6_paired_null.py`).
2. **Avant toute grille v0.7** : `K_STEPS` ≤ pas de lésion, porte de manipulation (diagonale lésée < diagonale saine d'un δ préenregistré), porte d'apprentissage (Me1 > base majoritaire 0,4306), H0 sur résidus d'interaction (effets principaux retirés). Le tout sous amendement v0.7.1 tagué avant données.
3. **Contrôle positif bouba/kiki** (baseline 24/10 §2.4 : Loconsole 2026, Biffi 2026) : un monde où une asymétrie connue est plantée par construction, pour démontrer la sensibilité du pipeline lésion → Me6.
4. **Cadrage théorique** : ancrer B-3 sur TAM/DLAM (Rome), qui prédisent l'égalité des amplitudes entre couches. Un écart mesuré sous lésion effective deviendrait alors interprétable.
5. **Manuscrit** : réécrire main.tex comme rapport d'errata et de non-tests, ou le retirer du statut de manuscrit de référence.

## 7. Constats classés

### BLOQUANT

- **B1. main.tex garde les affirmations retirées et omet les errata.**
  - Corps : « B-3 PASS 3/3 » (main.tex:346), « passes in every world » (461), « architectural-invariant status » (565-566), « minimal configuration » (754-759), en contradiction avec l'abstract (90-94) et README:231-233.
  - L'abstract omet ADR-0020/0022/0024 ; ADR-0026/0027 sont absents.
  - La lettre TMLR (36, 47-49, 56-58) est périmée de même.
  - Confirme la baseline 24/10 §2.4 (« §4.4 garde Key claim ») et l'étend : 4 autres lieux, plus la lettre. Nouveau pour 346/461/565 et la lettre.
- **B2. La « lecture finale B-3 » (main.tex:1231-1239) repose sur une grille non valide pour la question posée.**
  - Lésion inopérante (`run_grid.sh:171`, `cli.py:547`).
  - ADR-0027 : T2 lésé sur le monde 0 pour les graines 300-309.
  - Le texte présente « no lesion effect is detected » sans ces réserves.
  - Confirme la baseline 30/10 constat 2 ; infirme sa requalification (30/10:357), car le défaut subsiste à HEAD. Nouveau : le lien avec ADR-0027.
- **B3. La préreg v0.7 ActionSense a été taguée (02c2407, 2026-10-30 21:23) sans les corrections recommandées.**
  - Pas de `K_STEPS` (§4.2, commandes exactes 363-397, sans `--k-steps`). Pas de porte d'apprentissage : seulement une qualification de régime pour argmax-bridge (§5 point 7) et une base majoritaire descriptive (§5 point 5).
  - « PASS if ≥ » (amendment-v0.7:437) contre « > » strict (408-409, 522).
  - Description périmée de la sonde (346-350).
  - Pas de correction de multiplicité, explicitement (§5 point 2).
  - Règle fixe B-3 v2 acquise par l'effet de requête ; lecture renvoyée au nul apparié, dont H0 inclut l'effet de requête (§5 point 3).
  - ADR-0027 ne s'applique pas aux mondes réels (commit 1295160) ; la lésion inopérante, si.
  - Confirme la baseline 30/10 constat 2 et B2. Nouveau : le gel a eu lieu malgré tout ; aucune grille n'a tourné, donc c'est rattrapable par amendement avant données.

### MAJEUR

- **M1. Glissement d'opérationnalisation non déclaré** (spec 44-46 → `aggregate_grid.py:208-220`, main.tex:149-151), §4.4. Confirme la baseline 24/10 (estimand glissé). Nouveau : preuve dans le code que B-2 est mesuré sur entrée propre fusionnée (`loop.py:286-360`, docstring `mi_migration.py:55` fausse) et que la clause de signe de B-3 n'est pas implémentée (`asymmetry.py:9-30`).
- **M2. Nul par blocs sur-dispersé sous prédicteur quasi constant** : lignes mock p ≥ 0,996 avec observé < médiane nulle (milestone Me6 :50-53 et :59-61, amendement diagnostic 39-42). Une lecture « compatible » est donc non informative ; le risque se transmet au nul par blocs de v0.7. Nouveau.
- **M3. Brouillon #66** : contrôle négatif 2 tautologique, p ≡ 1 (§6, 201-206, preuve §4.6). H0 inclut l'effet principal de requête (§2). Nouveau pour la tautologie ; confirme les motifs « non gelable » transmis pour le reste.
- **M4. H0 de symétrie mal posée** pour B-3, que ce soit en v0.7 (§5 point 3) ou en #66 (§2) : un effet de requête suffit à la rejeter. Confirme la baseline 30/10 (« seul l'effet de requête reste ») ; nouveau sur le fait que v0.7 et #66 le reproduisent.
- **M5. Bibliographie** : 3 attributions contredites, 2 douteuses, 2 DOI faux, 1 auteur-liste fausse, 1 introuvable dans refs.bib ; 3 DOI faux ou non enregistrés dans la spec et le README ; lettre « Achille first author » (fiche refs). Nouveau, sauf amedi2007 (baseline 24/10 : corrigé depuis vers Amedi 2007, mais l'attribution reste douteuse).
- **M6. Chiffres réels non régénérables** (main.tex:507-522, tenseurs perdus) alors que la lettre revendique la reproductibilité (cover-letter :37-40, 70-73). Confirme la baseline 24/10 (« 32/40 artefacts gitignorés »).
- **M7. B-1 confondu** avec le budget d'entraînement et, depuis ADR-0027, avec le changement de monde T1/T2 pour graine ≠ 0. Confirme la baseline 24/10 (point 5 : « les doses n'étaient pas des doses ») ; nouveau pour le confondant du monde.

### MINEUR

- m1. Incohérences numériques : plage B-3 (59 contre 547/555), écart d'audit (272 contre 770), « 20 seeds » (571 contre ADR-0019), « 7500 cellules » (571-575).
- m2. Versions et URL périmées : main.tex:96, 1205, 1208, 1278, 1331 ; DOI Zenodo vers v1.1.1.
- m3. paper-v0.1-draft.md revendique encore l'OSF (9, 40-41) ; balayage entropy-proxy avec des B-3 > 1 (236-245).
- m4. oord2018 orphelin dans refs.bib:194.
- m5. Formulation « 0,249-0,251 » de la section puissance du milestone Me6 (p par monde iid 0,2488-0,2506).
- m6. « Monde ECG » : deux vues d'un même signal, label fonction des entrées (ADR-0009) ; à décrire comme tel dans main.tex:213, 358.
- m7. Milestone Me6 : les fichiers de puissance sont répartis par monde au lieu d'un `…_power.json` par bras ; c'est déclaré (milestone :13-14).

### OK

- o1. Discipline de gel Me6 : tag annoté, manifeste, règle de bloc poussée 22 s avant la première cellule, écarts déclarés (attente gaussienne non tenue, amendement diagnostic exécuté avant fusion).
- o2. Arithmétique Bonferroni (0,01/16 = 0,000625 ; 5 lignes) et 16 lignes recoupées avec les JSON.
- o3. Statistiques de rétractation B-1 recoupées (p = 0,623, 0,1907, 0,595, 0,129).
- o4. Lemme de partition 72,2 % vérifié.
- o5. L'erratum #67 (graines 300-304 « jamais utilisées » à amendment-v0.7:335, 517) est exact et correctement daté.
- o6. Métadonnées OSF corrigées (CITATION.cff:22, README:82, 220-225) : la baseline 24/10 (« OSF revendiqué ») est résolue, sauf dans le brouillon v0.1.
- o7. « C+ 25/25 FP » : aucune occurrence dans bouba_sens. C'est un item dream-of-kiki (baseline 24/10, DOK) ; non applicable ici.

### Non vérifié

- Le PDF des papiers cités (résumés seulement) ; le taux exact de Ćwiek 2021.
- Les lieux de publication de sui2026, groger2026 et tsai2026.
- Zhang/Doughty/Snoek 2023 et RecursiveMAS (lettre).
- Les 5 sujets ActionSense extraits (56 321 lignes) : non vérifiés, aucune grille ni rapport dans le clone.
- Les journaux d'exécution du diagnostic, lus via le dépôt et non sur l'hôte (pas de SSH).
