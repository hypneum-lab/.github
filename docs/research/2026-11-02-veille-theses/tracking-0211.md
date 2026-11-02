# Suivi des relectures du 02/11/2026 — intégration des corrections

Intégration faite le 02/11/2026 vers 20:10-20:45 CET. Sources des constats : `veille-0211/relecture-0211.md` (relecteur Claude à contexte vierge, constats B / M / m) et `veille-0211/codex/salvage-astra-0211.md` (notes intermédiaires d'une passe Codex astra interrompue par sa limite d'usage : des pistes, pas des constats ; numérotées X ci-dessous). Copies avant modification : `veille-0211/pre-relecture/`. Aucun calcul, aucun SSH, aucun verdict de campagne, aucune préreg touchée, rien d'écrit dans les clones.

Vérifications à la source utilisées : catalogue v2 (`clones/.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`, table C l.28-51, table A l.53-238, table B l.239-333) ; clones (`clones/kiki-flow-research` main, `clones/nerve-wml`, `clones/micro-kiki` 61056d9) ; textes PDF déjà téléchargés par les passes ; API arXiv `id_list` (User-Agent « hypneum-lab reading-gate », 1 appel, sortie `veille-0211/dl-relecture-fix/arx-ids.xml`) ; [MEM] `/Users/electron/.claude/projects/-Users-electron/memory/project_hypneum_manifeste_v3_2026_10_31.md` (59 lignes) ; [TRK] `/Users/electron/Documents/Projets/hypneum-next-handoff-2026-10-31/verif/tracking-astra-v3.md` (174 lignes, `grep -n "^| C"`).

Les numéros de ligne « fichier:ligne » sont ceux des fichiers **avant** correction (copies `pre-relecture/`).

| n° | Source | Fichier:ligne | Gravité | Verdict | Correction appliquée | Preuve |
|---|---|---|---|---|---|---|
| 1 | Claude B1 ; Codex X10 | these-baby-brain.md:39 | BLOQUANT | confirmé | oui | Claim A = BB-01 « non testé » (`catalogue-v2.md:193`, table A) ; la source externe (QFw0sg52VV) ne teste pas Claim A. Reformulé en « déjà publié (résultat négatif externe) … va à l'encontre de la ligne « déjà publié » ». |
| 2 | Claude B2 ; Codex X1 | these-dream-of-kiki.md:45 | BLOQUANT | confirmé | oui | NH-04 = STDP contre surrogate (`catalogue-v2.md:246`, table B) ; le dépôt Zenodo n'a pas de bras surrogate (même fichier l.72). « Antériorité partielle … ne dit rien de NH-04 ». |
| 3 | Claude B3 | these-dream-of-kiki.md:39 | BLOQUANT | confirmé | oui | NH-01 porte sur le noyau de Hopfield (`catalogue-v2.md:243`) ; Kubo et al. = réseaux récurrents par Equilibrium Propagation (résumé, l.38 du fichier). Formulation « déjà publié … à citer pour NH-01, dont il ne teste pas le noyau ». |
| 4 | Claude B4 | these-nerve-wml.md:83 | BLOQUANT | confirmé | oui | NH-45 jamais exécutée (`catalogue-v2.md:287` ; fichier l.103) ; arXiv:2512.18792 ne mesure rien sur nerve-wml. « Outil réutilisable / norme publiée ». |
| 5 | Claude M1 ; Codex X7 | dossier-relecture.md:6, 10, 31-33, 72, 80, 84, 117, 133, 140 | MAJEUR | confirmé | oui | [MEM] compte 59 lignes (`wc -l`). Renvois recalculés : rev 17→27 / 27→37 / rev 91 → l.26-28 ; « superseded » → l.28, l.39 ; « soumise le 31/10 (#147) » (rev 99) → l.33 ; engagements E1-E7 dont E5 → l.37 ; plan semaine 1 → l.39, l.58 ; Inception / date INSEE → l.40 ; « 96 lignes » → 59. D12 : « [MEM] l.49 » retiré (l.49 = PR dream-of-kiki #87), remplacé par une inférence citant [TRK] C37 l.158. |
| 6 | Claude M2 | dossier-relecture.md:20-36, 108 | MAJEUR | confirmé | oui | `grep -n "^| C"` sur [TRK] : C02b 119, C04 121, C05 122, C10 126, C11 127, C15 130, C14 133, C23b 141, C24b 142, C31 145, C32 146, C24 148, C26 149, C27 150 ; C33 154, C34 155, C35 156, C36 157, C37 158 justes. §4 : « C26-C32, l.142-148 » → l.145-150. |
| 7 | Claude M3 | these-dream-of-kiki.md:29, 54 | MAJEUR | confirmé | oui | `recency_survives` est un résultat du labo (`dok/docs/results/2026-10-30-nh03-deferred-eval.md:37,43`) ; arXiv:2610.36109 ne le lit pas. « Inférence : … cadre où la lecture « récence » est attendue ; elle ne la teste pas ». |
| 8 | Claude M4 | these-bouba_sens.md:48, 50 | MAJEUR | confirmé | oui | NH-70 porte sur des réseaux (`catalogue-v2.md:312`). « Antériorité biologique … ne teste pas NH-70 » aux deux lignes. |
| 9 | Claude M5 (a) | these-dream-of-kiki.md:70 | MAJEUR | confirmé | oui | Une seule prépublication (arXiv:2610.36109) ; « à recouper » ajouté. |
| 10 | Claude M5 (b) | these-dream-of-kiki.md:71 | MAJEUR | confirmé | oui | Une seule prépublication bioRxiv (Kubo) ; « à recouper » ajouté. |
| 11 | Claude M5 (c) | these-bouba_sens.md:89 | MAJEUR | confirmé | oui | Deux soumissions OpenReview, même nature, résumés seuls ; « à recouper » ajouté. |
| 12 | Claude M5 (d) | these-rescience-methodo.md:76 | MAJEUR | confirmé | oui | Une seule source (arXiv:2610.34379) ; « à recouper » ajouté (aussi aux lignes 24 et 46 qui reprennent la même affirmation). |
| 13 | Claude M6 ; consigne (e) | these-nerve-wml.md §3-§4 | MAJEUR | confirmé | oui | arXiv:2610.33495 résolu par API arXiv `id_list` (v1 2026-10-24, Oladimeji Anthonio et al., cs.CL ; « 35-43 times chance »), absent de `seen-arxiv.txt` et des huit livrables (`grep -c` = 0). Entrée ajoutée en §3 (R2/R11, [résumé moteur], à recouper) et §4 (NWML-PRH table A l.140, NH-45 table B l.287) ; compte « gardé » 13 → 14 ; ligne de journal ajoutée. |
| 14 | Claude m (tables) ; Codex X4, X11 | these-bouba_sens.md:27, 29, 88 | MINEUR | confirmé | oui | l.180 (BS-B3arch) et l.190 (BS-v07) sont dans la table A (l.53-238) ; l.310 (NH-68) et l.318 (NH-76) dans la table B (l.239-333). Étiquettes corrigées. |
| 15 | Claude m (tableau §8) | these-bouba_sens.md:132-149 | MINEUR | réfuté | non (précision seulement) | Le tableau est intact : chaque ligne porte bien « 19:xx:xx » et les heures concordent avec `dl-bouba_sens/arxiv3.log` (19:19:22 … 19:29:18). Seule précision faite : « 19:29:1x » → « 19:29:11 » (log). |
| 16 | Claude m | these-kiki-flow-research.md:248-250 | MINEUR | confirmé | oui | Énumération : 4 gardés (2610.38129, 2610.40942, 2610.33922, 2610.41321), 5 écartés ; le §3 en garde 4 ; total d'en-tête 15 (R3 10, R11 5) recompté juste. |
| 17 | Claude m | these-micro-kiki.md:5 | MINEUR | confirmé | oui | Quatre entrées « ancien, non vu » au §3 (arXiv:2411.19379, arXiv:2602.01053, arXiv:2409.08290, DOI 10.1016/j.joule.2026.102430). « trois » → « quatre », liste ajoutée. |
| 18 | Claude m | these-rescience-methodo.md:43 | MINEUR | confirmé | oui | `dl-rescience-methodo/2610.33980.txt:89-93` : « nearly half of the expected new entrants failed to appear » dans les domaines clairsemés. Phrase réécrite avec citation. |
| 19 | Claude m ; Codex X8 | these-nerve-wml.md:40 | MINEUR | nuancé | oui | Le PDF lu porte l'en-tête « arXiv:2609.39243v2 [cs.LG] 4 Oct 2026 » et dit 928 configurations / 1 405 500 interventions (`dl-nerve-wml/2609.39243.txt:11,25-38`) ; le résumé API de la même v2 dit 72 configurations / 100 800 interventions sur GPT-2 small (`dl-relecture-fix/arx-ids.xml`). Écart métadonnées / PDF consigné ; chiffres du PDF gardés. |
| 20 | Claude m | these-baby-brain.md:61, 84 | MINEUR | confirmé | oui | KdVy927FLx cité dans `veille/revue-de-fond-2026-11-01.md:605`. Marqué « déjà vu, rappelé » (les listes `seen-*` ne couvrent pas OpenReview). |
| 21 | consigne (a) ; Codex X1, X2, X10 | these-dream-of-kiki.md:21, 23, 28, 49, 61 | MAJEUR | confirmé | oui | « confirme / infirme » appliqués à H14-B, à l'« espace libre » du brainstorm, à l'idée 1, à la lignée de PR #87 et à la critique du `downscale` → « résultat externe déjà publié qui va dans le sens de / à l'encontre de … ». |
| 22 | consigne (a) ; Codex X2 | these-nerve-wml.md:28, 29, 30, 48, 50, 57, 59, 68, 70 | MAJEUR | confirmé | oui | Mêmes reformulations ; « infirme en partie M5 » (l.68) : M5 = constat du rapport du 01/11 (Table C l.38), pas la campagne M5 (Codex le notait) ; reformulé « va en partie à l'encontre de la ligne « déjà publié » du constat M5 … ne tranche pas le Test 12 ». |
| 23 | consigne (a) | these-baby-brain.md:27, 32, 45 | MAJEUR | confirmé | oui | « Confirme qu'elle reste ouverte » (NH-87) → « aucune antériorité trouvée … à recouper » ; « la requalification tient » → « rien ne la remet en cause (la veille ne la tranche pas) » ; « confirme » (CoNLL) → « déjà publié (autre domaine) ». |
| 24 | consigne (a) | these-bouba_sens.md:30 | MINEUR | confirmé | oui | « confirme » une absence → « rien de neuf … absence constatée sur résumés, à recouper ». |
| 25 | consigne (a) | these-micro-kiki.md:18, 20, 22, 24, 49, 56 | MAJEUR | confirmé | oui | « confirme la saturation / le retrait / routage saturé », « la requalification C5 tient », « Rien n'infirme » → formulations « va dans le sens de », « ne remet pas en cause ». l.37 et l.47 (état de l'art externe, pas une hypothèse du labo) laissés tels quels. |
| 26 | consigne (a) ; Codex X3 | these-kiki-flow-research.md:53, 86, 100, 144 | MAJEUR | nuancé | oui | « confirme l'absence d'antériorité » tirée de résumés → « aucune antériorité trouvée (absence constatée sur résumés, à recouper ; la veille ne tranche pas NH-20) » ; l.86, l.100, l.144 reformulées. |
| 27 | consigne (a) | these-rescience-methodo.md:18, 19, 23, 24, 25, 33, 46, 48, 50 | MAJEUR | confirmé | oui | « confirme / infirme » (C1, argument de diagonale de B21, requalification « bit-exact », genre, plan de catégorie, mlx#3568, menace « agents ») → formulations « déjà publié / va dans le sens de / va à l'encontre de », avec « ne tranche pas C1 ni NH-01 ». |
| 28 | consigne (d) ; Codex X5 | these-micro-kiki.md:21, 61, 79 | MAJEUR | confirmé | oui | l.61 écrivait « prépublication et version revue : deux natures » pour arXiv:2409.08290 = DOI 10.1109/tcad.2026.3718799. Compté désormais comme une seule source, « à recouper » ajouté (l.21, l.61, l.79). |
| 29 | consigne (d) | these-rescience-methodo.md:18-19 | MINEUR | nuancé | oui | Recoupement Takeuchi + Agliari = deux articles distincts (arXiv:2602.08428 = DOI 10.1088/1751-8121/ae8f87 ; arXiv:2308.01421 = DOI 10.1016/j.neunet.2024.106389) : recoupement maintenu, précision ajoutée que chaque paire prépublication / version revue compte pour une. Autres recoupements relus (dream-of-kiki l.20, baby-brain l.21, 82, micro-kiki l.78) : chaque paire déjà comptée une fois, rien à changer. |
| 30 | consigne (f) ; Codex X9 | these-micro-kiki.md:21, 61, 93 | MAJEUR | confirmé | oui | `dl-micro-kiki/2409.08290.txt:55-58` : « under typical neuromorphic hardware conditions … spike rate below 5.7% ». Le fichier écrivait « Inférence : aucun avantage n'était attendu, quelle que soit l'implémentation ». Reformulé : résultat sur matériel neuromorphe ; transposition à GPU / Apple Silicon en inférence séparée, à recouper. |
| 31 | consigne (h) ; Codex X6 | dossier-relecture.md:46 | MAJEUR | confirmé | oui | « M1 « verrou passé pour N10-D » » → « jalon M1 de la roadmap v2 (fin du verrou de lecture N10-D) ». Les autres occurrences (« aucun verrou n'est passé à ce jour », l.41 ; « si son verrou passe ») décrivent un fait ou une condition, laissées. |
| 32 | consigne (h) ; Codex X6 | dossier-relecture.md:20 (D01), 22 (D03), 23 (D04), 24 (D05), 26 (D07), 96 | MAJEUR | confirmé | oui | États de M5 et des campagnes réécrits comme état enregistré avec `path:line` : `kiki-flow-research:docs/results/2026-10-30-m5-certify-verdict.md:9-13` (« failed », 50/60) et `results/m5_secondary_2026_10_30/ANALYSIS.md:26-30` (10/38), vérifiés sur `main` du clone ; `nerve-wml:docs/results/2026-10-31-nh01-diagonal-ablation.md:15-16` (C5, C6) ; `inventory/compute-status.md:5-6, 9` (E1-small 1 227/1 410, dial 29,0 M/50 M, m5-secondary fini 31/10 18:42). |
| 33 | Codex X4, X11 | huit livrables, tables du catalogue | MINEUR | nuancé | oui pour bouba (n° 14) | Toutes les étiquettes « table C / A / B » et numéros de ligne cités dans dream-of-kiki, nerve-wml, kiki-flow-research, micro-kiki, baby-brain, rescience-methodo ont été recontrôlés contre les bornes des tables (C 28-51, A 53-238, B 239-333) et les lignes ouvertes : seule l'erreur de bouba_sens était réelle. Les écarts de ligne du catalogue lui-même (MK-26 `README.md:81` / `tex:207` → 83 / 197 ; MK-17 `README.md:322` → 332) sont déjà signalés dans `these-micro-kiki.md` ; le catalogue n'est pas modifié ici (**suivi 02/11** : corrigé depuis dans la PR #24, commit 3711088, `catalogue-v2.md:224,231` et addendum ; numéros de ligne du catalogue inchangés). |
| 34 | Codex X3 | conclusions d'absence tirées de résumés (kiki-flow NH-20, baby-brain NH-87, bouba §2) | MAJEUR | nuancé | oui | Voir n° 23, 24, 26 : marquées « absence constatée sur résumés, à recouper ». |

## Bilan

- Relecture Claude : 20 constats (4 BLOQUANT, 6 MAJEUR dont M5 en 4 sous-points, 7 MINEUR) → 18 confirmés, 1 nuancé (version de 2609.39243), 1 réfuté (tableau §8 de bouba_sens). Les 4 sous-points de M5 sont comptés comme 4 lignes (n° 9-12).
- Pistes Codex (X1-X11, non livrées comme constats) : X1, X2, X6, X7, X8, X9, X10 recoupent des constats Claude ou des consignes et sont confirmées ; X3, X4, X5, X11 nuancées (une seule erreur de table, une seule paire prépublication / version revue comptée deux fois).
- Consignes (a)-(h) : toutes appliquées ; (e) via n° 13 ; (g) via n° 14 et 33.

## Corrections par fichier

| Fichier | Corrections |
|---|---:|
| `these-dream-of-kiki.md` | 11 |
| `these-nerve-wml.md` | 12 |
| `these-kiki-flow-research.md` | 5 |
| `these-bouba_sens.md` | 8 |
| `these-micro-kiki.md` | 12 |
| `these-baby-brain.md` | 5 |
| `these-rescience-methodo.md` | 11 |
| `dossier-relecture.md` | 30 |

## Écart de méthode

- Une correction de numéro de ligne dans `these-rescience-methodo.md` (`2610.33980.txt:88-93` → `89-93`) a été faite par `sed -i` au lieu de l'outil Edit ; une seule substitution, contrôlée par `grep -c`.

## Non vérifié

- Le Claude Doc rev 101 lui-même (comme dans le livrable).
- Les PDF OpenReview (403) : toutes les entrées OpenReview restent [résumé moteur].
- arXiv:2610.33495 : résumé seulement, PDF non ouvert.
