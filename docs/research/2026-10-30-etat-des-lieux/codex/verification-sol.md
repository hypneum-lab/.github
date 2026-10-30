# Vérification du rapport Codex sol (30/10/2026)

**Provenance.** Modèle gpt-6.1-sol, effort xhigh, 2026-10-30, début ~14:18 (`brief-sol.md` 14:17), fin 14:44 (horodatage du rapport). Brief : `codex/brief-sol.md`. Rapport : `codex/report-sol-2026-10-30.md`, 36 170 octets, 101 lignes, ~3 475 mots. Vérification en lecture seule. Les fichiers des PR absents des clones (#86, #87, #79, #55) ont été lus par `gh api …/contents?ref=<sha>`, sans rien modifier.

Le rapport Codex ne numérote pas ses constats. Je les numérote ici : B1–B5 pour les BLOQUANT, M1–M13 pour les MAJEUR.

## 1. Constats Codex

| # | Constat (1 ligne) | Cité | Verdict après ouverture | Nos n° |
|---|---|---|---|---|
| B1 | bouba : argmax coupe le gradient, donc les anciens B-1/B-2/B-3 décrivent un réseau qui n'apprend pas | `bouba_sens/docs/adr/0024…md:12` | **Confirmé.** L.12-30 : perte à ln 4, précision 0,270/0,274, « argmax blocks the task gradient ». | contexte de 7 |
| B2 | Studyforrest : tenseurs perdus, `vision.pt` impossible à régénérer | `adr/0012…md:205` | **Confirmé.** L.211-230 : « not reproducible », tenseurs disparus le 03/06, `vision.pt` à 120 lignes contre 1 800. | nouveau |
| B3 | L'ancien chemin « rigoureux » n'était pas un pas JKO (historique, reconnu) | `kiki_flow_core/master_equation.py:128` | **Confirmé.** L.128-134 : `legacy_split` « is **not** the JKO step of F ». | errata B (spécialisation 1,35/2,03) ; contexte de 4 |
| B4 | C5 : la borne Holevo « ≤ N bits » ne s'applique pas à des espérances exactes (contre-exemple : 10 angles → log₂10 > 1 bit) | `micro-kiki/docs/paper-a/c5-info-bound.tex:11`, `src/routing/torch_vqc.py:142` | **Confirmé.** `tex:27-30` affirme I(M;Y) ≤ N « regardless », alors que `torch_vqc.py:143-150` calcule ⟨Z⟩ exacts, une variable continue. `ERRATA.md:85-97` corrige l'estimateur de MI, mais pas l'application de Holevo. | nouveau (nous n'avions que le MINEUR « JSON sans `withdrawn` ») |
| B5 | baby-brain : aucun E0–E4 exécuté ; seulement des smokes ; LP négatif ; tests inadaptés | `baby-brain/README.md:47`, `lpm.py:76`, `draft.md:512` | **Confirmé.** README L.51 : « three single-seed smoke runs of 500 ticks ». `lpm.py:76` : Mann–Whitney par approximation normale. `draft:514` : « falsified if CIs overlap ». | partiel (« 1b refuted », autres constats) |
| M1 | NH-01 : portée limitée (filtre spectral publié, témoin inerte à T=0) ; C2 tolère deux baisses cumulées | `nerve-wml/docs/results/2026-10-25-nh01-pilot.md:8` | **Confirmé.** L.13 : médianes 0,600 → 0,559 → 0,522. Chaque baisse (0,041 puis 0,037) passe la tolérance de 0,05, mais leur somme vaut 0,078. L.18 : « C3 at T = 0 is a numerical verification of a theorem ». | 10 |
| M2 | #87 : 44,4× vient d'un Hebb à 0,014 près de la grille ; C3′ à T=0,2 calculé sur 5 graines (1,1,1,0,0), non informatif | `#87:docs/results/2026-10-27-nh01-correlated.md:3` | **Confirmé.** L.25-26 : « α̂_c = 0 on 5 of 10 seeds… ratio 1 on 3… 0 on 2 », « should not be cited », Hebb 0,014 « interpolated between loads 0.01 and 0.02 ». | 10 |
| M3 | N10-C n°1 arrêté après lecture des résultats ; le correctif C ne démontre pas l'usage du message (`gtm_mis` réussit) | `amendment-2026-10-25.md:12`, `bis-control-arms.md:301` | **Confirmé.** `amend.:14-23` : « outcome-informed… declared as a deviation ». `bis:303` : `gtm_mis` 0,81, PASS. | 3 (partiel), errata B N10-C |
| M4 | Tronc partagé entre bras d'une même graine, mais l'analyse reste Welch/Fieller indépendante : covariance omise | `amendment-2026-10-25.md:59`, `…-10-23.md:125` | **Confirmé.** `amend.-10-25:61` : « all arms… start from the same pre-trained trunk ». `-10-23:125,130` : « Welch / independent groups ». Aucun amendement ultérieur ne change l'analyse (grep). | nouveau |
| M5 | NH-03 : 24 écritures ≠ FLOPs égaux ; une mesure immédiate favorise la récence | `nh03-schedule-ablation.md:6` | **Confirmé.** L.11 : « exactly 24 writes ». L.62 : « rewards recency by construction ». | autres constats (#79 récence/interférence) |
| M6 | E1 : shrink sur tous les flottants ; OPR = argmax correcte de « la base initiale » ; RECOMBINE inactif | `pilot_cycle3_cuda.py:462`, `e1_profiles.py:177`, `e1_harness.py:214` | **Nuancé.** `pilot:463-466` et `harness:216-217` (« RECOMBINE is a weight-neutral no-op ») confirment. Mais `e1_harness.py:242-243` dit « pre-replay checkpoint » : rien ne prouve que ce soit la base initiale. | 11 (partiel), 1 (no-op) |
| M7 | B-3 : seuil 0,02 franchi dans 100 % des nuls ; signes tirés indépendamment entre paires ; mock p 0,0585/0,3063 par blocs | `adr/0021…md:136`, `me6_paired_null.py:263`, `adr/0022…md:189` | **Confirmé.** `0021:138-145` : P(B-3 passes \| H0) = 1,0000. `py:265-266` : signes par (trio, paire, bloc). `0022:194-195`. | errata B (mock) ; 100 % nouveau |
| M8 | ActionSense : z-score sur tout le sujet et KFold mélangé ; 600 cellules pour 5 graines | `extract_actionsense.py:985`, `linear_probe.py:109`, `#55:amendment…:326` | **Confirmé.** `extract:989-990` : z-score par sujet entier. `probe:109` : `KFold(shuffle=True)`. `#55:326-333` : 600 cellules. | autres constats (sondes dégénérées), 2 |
| M9 | kiki-flow : code ≠ papier (exp. antisymétrique ≠ conservation de la somme, clipping/renormalisation, facteur ½ absent, hook T2) | `paper_f.py:248,88`, `main.tex:184`, `paper_run.py:251` | **Nuancé.** Confirmé : `paper_f.py:252-253` déduit la conservation de la somme du seul caractère orthogonal ; `:277-280` clippe puis renormalise ; `:104` somme J_sym sans ½, contre `main.tex:186` « ½ Σ J^sym ». Non vérifiable : `paper_run.py:251` ne construit que `MultiscaleLoop` (rien sur le hook), et le contre-exemple numérique (−0,00250) n'a pas été recalculé. | nouveau |
| M10 | NH-81 : R = 0,91 [0,83 ; 1,01], local ; label « provisoire » retiré après la mesure | `nh81-joules.md:41`, `nh81-amendment-1.md:26` | **Confirmé.** `joules.md:16,63` : 0,91 [0,83 ; 1,01], 41,3/45,5 mJ. `amend.:26-30` : décision du 28/10, après la mesure. | 12 |
| M11 | NH-81 : effet d'ordre 0,82 contre 1,01 | `nh81-joules.md:75` | **Confirmé.** L.76-77. | 12 |
| M12 | Porte LoRA en AND ; quantum évalué sur ses données d'entraînement ; prior BioField remis à zéro | `forgetting.py:182`, `qmoe_3domain.py:53`, `bio_field_readout.py:198` | **Confirmé.** `forgetting:194-196` : rollback seulement si angle < seuil ET perte > seuil. `qmoe:61-74` : entraînement puis évaluation sur `X6, y`. `bio:203` : « starting each row from the vague prior ». L'effectif « 15 exemples » n'a pas été vérifié. | nouveau |
| M13 | Porte LIF L1a marquée PASS malgré 13,1 % > 10 % (déjà corrigé par erratum) | `lif-l1a-gate-erratum.md:8` | **Confirmé.** L.12-15 : condition (3) jamais évaluée ; acc_untrained = 0,1309. | nouveau (déjà en erratum) |

## 2. Nos 12 constats vus par Codex

| Nos n° | Trouvé par Codex ? | Contradiction éventuelle |
|---|---|---|
| 1. Règle GO 35B déclenchable par H14-A | **Non.** Codex voit seulement RECOMBINE no-op et une puissance de SUPERIOR ≈ 50 %. | Codex recommande d'« appliquer la règle 35B » sans en voir le défaut. |
| 2. Lésion B-3 non effective (k = 5 000, 19,2 dB) | **Partiellement.** Il note des « lésions nominales… vers 19–20 dB », mais seulement pour l'ancien Studyforrest/ActionSense. | **Oui :** il classe le B-3 final « OK », p = 0,494. |
| 3. N10-C sans besoin d'information | **Partiellement :** `gtm_mis` réussit, aucun usage du message démontré. Absents : taux de pièce ≈ succès d'équipe, politique scriptée à 43 %. | — |
| 4. DOI Zenodo / `main.tex` périmé | **Non.** Il signale seulement que le README reste positif sur la forte-Turing. | — |
| 5. Profil `.github` 70,7 % | **Non.** | — |
| 6. M5 : 96 configurations, `failed` mécanique, pas d'hôte dans `RUN_KEY` | **Partiellement :** règle #52 écrite après 13 stress, coût de 60 h. L'échec mécanique et la provenance manquent. | — |
| 7. TOST PR #9 sur un régime qui n'apprend pas | **Partiellement :** il conteste v0.7 « prêt à préenregistrer » (compétence non établie). La TOST et Hodges–Lehmann ne sont pas mentionnées. | — |
| 8. Synchronisation et évaluation des runs n°2 | **Non** (machines non observées). | — |
| 9. Seconde brèche d'aveuglement | **Non.** Seule la première est citée (`bis:273`). | — |
| 10. NH-01 : C3′ ne peut pas réfuter, 44× fragile | **Oui en grande partie** (M1, M2). L'argument du théorème 2 à T = 0,2 manque. | **Nuance :** il classe C3′ = 0,975 « OK » et le traite comme discriminant ; il précise qu'aucune graine n'est censurée dans le contraste T0 (voir §5). |
| 11. E1 : base 0,185, biais de longueur, DOWNSCALE ≈ 35× SGD | **Partiellement :** shrink global = régularisation/calibration, puissance de SUPERIOR ≈ 50 %. Base sous le hasard et biais de longueur absents. | — |
| 12. NH-81 : voie fused R ≤ 1, effet d'ordre | **Oui** pour l'effet d'ordre et le statut provisoire. R ≤ 1 par construction : non. | **Nuance :** « cela ne prouve pas que l'IC actuel est faux ». |

## 3. Nouveaux constats Codex confirmés que nous n'avions pas

1. **C5 : Holevo mal appliqué (B4).** `c5-info-bound.tex:27-30` borne I(M;Y) par N bits, alors que M est un vecteur d'espérances exactes (`torch_vqc.py:150`). La borne est fausse dans son principe, pas seulement dans son estimateur. L'erratum E-2026-10-25-02 ne le dit pas.
2. **N10-C : covariance omise (M4).** Le tronc commun par graine (`amend.-10-25:61`) contredit « independent groups » (`-10-23:130`). À amender avant les résultats : analyse appariée par graine.
3. **B-3 : seuil 0,02 passé dans 100 % des nuls (M7)** (`adr/0021:138-145`). De plus, les signes du nul apparié sont indépendants entre paires (`me6_paired_null.py:265-266`).
4. **kiki-flow : code ≠ papier (M9).** Le facteur ½ manque (`paper_f.py:104` contre `main.tex:186`). L'étape de dérive clippe puis renormalise (`:277-280`), alors que sa docstring affirme conserver la somme (`:252-253`).
5. **Porte LoRA en AND (M12).** Un grand angle accepte n'importe quelle perte (`forgetting.py:194-196`). Côté quantum, entraînement et évaluation portent sur les mêmes données (`qmoe_3domain.py:61-74`).
6. **NH-01 C2 : baisses cumulées tolérées (M1)** (`pilot.md:13`).
7. **Studyforrest irreproductible (B2)** (`adr/0012:211-230`). Reconnu par le dépôt, absent de notre synthèse.
8. **baby-brain : statistique inadaptée (B5).** Mann–Whitney sur une série autocorrélée (`lpm.py:76`) ; « IC chevauchants = falsifié » (`draft:514`).
9. **E1 : OPR restreint** au checkpoint d'avant replay (`e1_harness.py:242-243`).

## 4. et 5. Désaccords

**Où Codex se trompe.**
- **B-3 final classé « OK ».** La grille préenregistrée lance `scripts/run_grid_probe_v2.sh` (`prereg/2026-10-26-b3-lesion-interaction.md:86`). Ce script ne passe pas `--k-steps` (`run_grid_probe_v2.sh:73-76`) ; le défaut vaut 5 000 (`cli.py:388`). Résultat : SNR final de 19,21 dB (`adr/0020:28-34`). Dans `reports/b3_lesion_interaction_gaussian.json`, la ligne audio vaut 0,6599 sur la diagonale lésée, contre 0,655–0,673 ailleurs : aucune dégradation. Le p = 0,494 ne teste pas une lésion. Notre n° 2 tient.
- **NH-01 C3′ traité comme discriminant.** La préreg elle-même (`2026-10-25-nh01-…-downscale.md:27`) établit que « c < 1 cannot increase capacity ». Le seuil de réfutation (borne basse ≥ 2) est donc inatteignable. Codex ne le voit que pour T = 0.
- **M6, détail inexact :** « base initiale » n'est pas établi. Le code dit « pre-replay checkpoint » (`e1_harness.py:242`).
- **M9, partie non vérifiable :** `paper_run.py:251` ne contient pas l'absence de hook T2 alléguée.

**Où nous nous trompions ou étions imprécis.**
- **N° 10, « graines retirées du bootstrap ».** C'est vrai pour C3′ à T = 0,2 seulement (`correlated.md:25`). Pour le C1 à 44×, « at T = 0 no seed is below grid » (`:26`). Il faut préciser le critère concerné.
- **N° 12.** « Écart d'ordre > demi-largeur de l'IC » est arithmétiquement exact (0,19 contre 0,09). Mais le résultat le dit « balanced by alternation » (`joules.md:77`), et Codex note à juste titre que cela n'invalide pas l'IC. La formulation est à adoucir : covariable à analyser, pas IC faux.
- **Statut C5.** Notre synthèse ne retient que le champ `withdrawn` manquant (MINEUR). Le défaut Holevo justifie un BLOQUANT sur toute nouvelle version de la borne.

## 6. Comptages

- **BLOQUANT Codex (5)** : 5 confirmés, 0 réfuté, 0 nuancé.
- **MAJEUR Codex (13)** : 11 confirmés, 0 réfuté, 2 nuancés (M6, M9).
- **Hors comptage :** un « OK » de Codex est réfuté (B-3 final).
- **Nouveaux constats retenus : 9** (§3), dont 2 à porter au rang BLOQUANT/MAJEUR de notre synthèse : C5 Holevo et covariance N10-C.
- **Nos 12 constats :** 2 trouvés (10, 12), 5 partiellement (2, 3, 6, 7, 11), 5 non (1, 4, 5, 8, 9). Un contredit à tort (2) ; deux nuancés à raison (10, 12).
