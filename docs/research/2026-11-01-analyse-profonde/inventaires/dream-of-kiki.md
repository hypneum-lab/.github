# Inventaire profond — dream-of-kiki (2026-11-01)

## 0. En-tête

- **Dépôt** : `hypneum-lab/dream-of-kiki`, clone frais `scratchpad/clones/dream-of-kiki`.
- **SHA** : `8a7e8468d2e81119646cf12179355b8cf9e1dc1c` (HEAD = PR #87 « cite unlearning lineage », 2026-11-01 09:38).
- **Durée** : ≈ 2 h 15.
- **Fichiers lus intégralement** : `docs/papers/paper1/build/full-draft.tex` (1 496 l.) ; `docs/papers/paper1/full-draft.md` (1 284 l., source vivante) ; `docs/papers/paper2/build/full-draft.tex` (889 l.) ; `docs/papers/paper1/references.bib` (84 entrées) ; `docs/papers/paper2/references.bib` (25) ; `docs/papers/paper1-plos-submission-audit-2026-05-04.md` ; `docs/osf-amendment-e1-small-2026-10-30.md` (§1-§4) ; `docs/results/2026-10-30-nh03-deferred-eval.md` ; `docs/specs/amendments/2026-04-21-dr2-empirical-falsification.md` (début + correction) ; veille `scratchpad/veille/rome-2026-11-01.md`.
- **Lus en partie** : `docs/proofs/dr2-compositionality.md` (§0-§3, plan complet) ; `docs/proofs/op-pair-analysis.md` (tableau et bilan) ; `kiki_oniric/axioms/__init__.py:67-81` ; `docs/papers/paper2/full-draft.md` (diff vs .tex) ; `docs/papers/paper2/results.md:816-870` (G4-septimo) et `discussion.md:100-112` ; `docs/papers/paper1/{discussion,methodology,introduction}.md` (passages citant les références douteuses) ; `docs/osf-prereg-g4-nono-*.md`, `docs/osf-prereg-erratum-g4-power-*.md`, `docs/osf-prereg-dr3-*.md` (titres, familles, puissance) ; `docs/osf-amendment-bonferroni-cycle3.md` ; `experiments/h1_split_mnist/results_h1_v2.csv` (recalcul).
- **Calculs refaits** : t-test du pilote PermutedMNIST (§7.5) et variantes ; MDE de l'erratum G4 (approximation t, pas de nct : scipy nct renvoie NaN sous Python 3.14).
- **Non lus** : `paper2/results.md` hors §7.1.11, `paper1-fr`, `paper2-fr`, `paper3/outline.md`, préreg E1-small (1 728 l.) au-delà de l'amendement, code E1/NH-03/G4/DR-3, `HopfieldDreamWML` (vit dans nerve-wml, pas dans ce dépôt : `grep -r HopfieldDream` ne trouve rien dans `kiki_oniric/`).

## 1. État des lieux

- **Objet** : un cadre « GENIAL / Framework C » qui type quatre opérations de consolidation (replay, downscale, restructure, recombine), cinq axiomes DR-0…DR-4 et un « Conformance Criterion » exécutable, plus une batterie d'études préenregistrées localement (G4-*, G5-*, G6-*, E1-small, NH-03, DR-3).
- **Paper 1** : *dreamOfkiki: A Substrate-Agnostic Formal Framework…*, cible PLOS CB, brouillon v0.2. Deux versions divergentes : la `.tex` de build (1 496 l., commit 204f1dc du 3 mai) et `full-draft.md` (1 284 l., modifié jusqu'au 1er nov.). Jamais déposé (ni arXiv ni revue). ≈ 10 000 mots revendiqués (`full-draft.md:1256`), 0 figure.
- **Paper 2** : *Cross-substrate conformance… (synthetic-substitute replication)*, brouillon ; la `.tex` (889 l., 23 oct. pour le .md, 3 mai pour la .tex) ne contient **que** des résultats de prédicteur factice partagé. Les vrais pilotes G4-*/G5-*/G6-* sont dans `paper2/results.md` (1 345 l.) et absents du rendu.
- **Hypothèses actives** : E1-small (H14-A/B/C, désormais toutes exploratoires, `docs/osf-amendment-e1-small-2026-10-30.md:102-106`), G4-nono (RECOMBINE inter-domaines), DR-3 (sonde relationnelle), NH-03 (récence). Aucune n'est déposée sur OSF (`docs/osf-amendment-e1-small-2026-10-30.md:122-123`).
- **Campagnes** : E1-small sur KXKM, 1 410 cellules, fin prévue 01/11 ≈ 21:30 (`…amendment…:35-36`) ; NH-03 différée terminée le 30/10 (verdict `recency_survives`, `docs/results/2026-10-30-nh03-deferred-eval.md:43-44`).

## 2. Lecture des papiers

### 2.1 Paper 1 — source vivante `docs/papers/paper1/full-draft.md` (et écarts de la `.tex`)

**Thèse centrale.** Il n'existe pas de cadre formel unifié des quatre « piliers » du sommeil ; Framework C en fournit un, avec un théorème de composition (DR-2), un critère de conformité exécutable (DR-3) validé sur deux substrats, et une méthodologie préenregistrée (`full-draft.md:24-46,1070-1081`).

**Condensé section par section**

| § (lignes md) | Affirme | Prouve | Manque |
|---|---|---|---|
| 1 Abstract (22-82) | DR-2 « proved », deux substrats conformes, pilote p = 0.01216 < 0.0125 | rien en propre | ne dit pas que DR-2 n'est prouvé que sous précondition, que α déclaré ailleurs est 0.00625 |
| 2.1 (88-113) | l'oubli catastrophique manque de théorie unifiante ; lignée Crick-Mitchison → Hopfield → Fachechi (ajout #87) | citations correctes (vérifiées Crossref) | aucune des opérations du cadre n'est reliée à l'unlearning de Hopfield ; Tadros 2022, Golden 2022 absents |
| 2.2-2.4 (115-178) | quatre piliers ; « 12 cross-pairs non commutatives » ; « premier cadre formel » | — | « 12 sur 16 » est trompeur (cf. §3.5) ; revendication « first » non étayée |
| 3 préambule (184-198) | raffinement du cadre à trois processus en quatre générateurs | renvoi à la preuve | l'irréductibilité ne dépend que d'une partition d'écriture posée par définition |
| 3.1-3.4 (200-273) | correspondance pilier → opération | — | « FEP interprète le sommeil comme restructuration » (262-264) n'est pas dans Friston 2010 ; bazhenov2026 surinterprété (232-234) |
| 3.5 (275-310) | ordre canonique « load-bearing » ; mapping pilier → axiome | — | le mapping (A→DR-1, B→DR-2, D→DR-3, C→DR-4, 302-307) est arbitraire : DR-3 n'a rien de FEP |
| 4.1-4.4 (320-365) | 8 primitives, profils, 5-uplet, semigroupe | — | tableau des profils contredit Paper 2 (cf. 2.2) |
| 4.5 (367-405) | DR-0…DR-4, DR-2 « proved under precondition » | voir §2.1.1 ci-dessous | précondition non close par composition ; code ≠ énoncé |
| 4.6-4.7 (407-426) | invariants I/S/K, DualVer | — | — |
| 5.1-5.5 (437-473) | contrat abstrait | — | — |
| 5.6 (475-527) | deux substrats « conformes », 9 tests chacun, « ~27 assertions » | tableau de tests | DR-1 et DR-4 « hérités par construction » (513-515) : non testés par substrat ; « 18 tests × 1.5 assertions » est une moyenne inventée |
| 5.7 (529-540) | esquisses de preuves | — | — |
| 5.8 (542-617) | la couche structurelle laisse passer 12/15 puis 22/25 substrats adverses | JSON d'audit cités | conclusion honnête et utile (le critère C1+C3 est vide sans C2) ; mais C2 est par construction propre à chaque substrat, donc le critère n'est plus « substrate-agnostic » |
| 6.1-6.2 (623-674) | H1-H4 préenregistrées ; « primary analysis uses α = 0.00625 » (635) puis « α = 0.05/4 = 0.0125 » (656) | — | contradiction interne de α |
| 6.3-6.5 (676-728) | mega-v2, Studyforrest, R1/R3 | — | tout §7 sur données synthétiques (687-689) ; R1 « 16-character » puis « bumped to 32 » dans la même phrase (713-718) |
| 7.1 (747-770) | pipeline statistique exécutable ; « No p-values are reported » | exécution | contredit par 8.2 (994-998) |
| 7.2-7.3 (772-803) | 6 injections de fautes, 1 000 tuples R1 | tests | tests de plomberie, pas de science |
| 7.4 (805-880) | portabilité nerve-wml ; gap 12.1 % = artefact de lecture ; mutual-kNN 0.174 = 18.8× un nul gaussien | reprend nerve-wml | auto-citation ; nul gaussien i.i.d. faible (le texte le reconnaît, 1129-1132) |
| 7.5 (882-940) | pilote PermutedMNIST : t = 2.524, p = 0.01216 < 0.0125 ; H2 « non supportée » | recalculé (§2.1.2) | test apparié ≠ test préenregistré (Welch) ; pseudo-réplication ; H2 mal décrite |
| 7.6 (942-958) | cinq propriétés opérationnelles | — | — |
| 8.1-8.2 (964-1010) | « three of four pre-registered hypotheses passed at α = 0.0125 » | données synthétiques | contredit 7.1 et 8.3 |
| 8.3 (1012-1038) | limites (pas de décision H1-H4, deux substrats, P_max squelette) | — | — |
| 8.4 (1040-1081) | tableau d'antériorité (27 lignes) | — | 15 références inline sans entrée .bib (Rusu, Fernando, Wayne, Banino, Veness, Buzzega, Chaudhry, Tschantz, Millidge, Hafner, LeCun, Assran, Bardes, « AMI Labs 2026 ») |
| 8.4 PRH (1083-1133) | DR-3 ancré à la structure relationnelle, pas à la géométrie | résumés arXiv conformes | aucune mesure DR-3 ne teste cela (le texte le dit, 1129-1132) |
| 9.1 (1139-1154) | l'E-SNN est « deferred … single-substrate validation » ; Paper 1 « does not yet demonstrate empirically across two substrates » | — | **contredit** §5.6 et l'abstract (deux substrats conformes) |
| 9.2-9.4 (1156-1211) | P_max, fMRI, multi-substrats ; H3 « borderline » (1189-1192) | — | H3 « borderline » vient de données factices |
| 10 (1215-1237) | « 16 entries cycle-1 stub » | — | le .bib en a 84 |

**Divergences `.tex` ↔ `.md`** (la `.tex` est le seul rendu LaTeX existant ; aucun PDF) : la `.tex` dit « free semigroup » (`build/full-draft.tex:260,452,1077`) puis nie la liberté (`:482-484`) ; elle présente le gap 12.1 % comme un négatif honnête (`:943-945`) que le `.md` qualifie d'artefact (`full-draft.md:832-842`) ; elle cite Zenodo 19656354 « v1.1.2 » (`:925-926`, DataCite : v1.1.3) ; sa bibliographie rendue a 16 entrées (`:1413-1494`), sans Crick, Hopfield ni Fachechi ; §5.8 (tests négatifs) et §8.4 PRH n'y figurent pas.

#### 2.1.1 Équations, théorèmes, figures clés — verdicts

| Élément | Où | Verdict |
|---|---|---|
| DR-2 (C) « π ∈ Op » | `docs/proofs/dr2-compositionality.md:125-131` | **Tautologique** (vérifié à la main) : Op est défini comme le semigroupe libre des mots (`:63-70`), donc tout mot y appartient. La vraie propriété est la totalité de φ(π) sur l'état. |
| DR-2 (B) additivité du budget | `:127,229-254` | Vrai **par définition** (le budget d'un mot est défini comme la somme). |
| DR-2 (F)+(A) composition fonctionnelle, associativité | `:258-310` | Vrai et trivial : associativité de la composition dans Set. |
| « Semigroupe généré sous [P] » | `full-draft.md:374-381` | **Faux tel qu'énoncé** (vérifié à la main) : l'ensemble des mots satisfaisant [P] n'est pas clos par concaténation. (RESTRUCTURE) et (REPLAY) satisfont chacun [P], leur composé (RESTRUCTURE, REPLAY) le viole. Ce n'est pas un sous-semigroupe. |
| Précondition [P] codée | `kiki_oniric/axioms/__init__.py:75-80` | **Code ≠ énoncé** : `permutation.index()` ne lit que la première occurrence ; (REPLAY, RESTRUCTURE, REPLAY) viole [P] (i = 1, j = 2) mais la fonction renvoie `not (1 < 0) = True`. Les mots à répétition sont admis à tort. |
| Origine de [P] | `docs/specs/amendments/2026-04-21-dr2-empirical-falsification.md:29-37` | Un `ValueError` de forme MLX (`addmm`, entrée (2, 4)) après un échange de couches : un bogue d'implémentation d'un substrat devient la précondition d'un axiome « substrate-agnostic ». |
| Irréductibilité de `recombine` (§7) | `dr2-compositionality.md:314-430` ; `full-draft.md:386-393` | Plausible mais vide : elle découle de la partition d'écriture posée par hypothèse (`recombine` seul écrit H). Ce n'est pas une propriété mathématique des opérations. |
| « 12 sur 16 paires non commutatives » | `full-draft.md:142-145,285-286` ; `op-pair-analysis.md:130-134` | **Trompeur** : il n'y a que 12 paires ordonnées croisées (4 × 3), toutes déclarées non commutatives ; les 4 « paires » restantes sont op∘op, qui commute toujours avec elle-même — classer restructure∘restructure « non-commutatif » (`op-pair-analysis.md:133`) n'a pas de sens. La non-commutativité est argumentée, pas mesurée. |
| DR-4 inclusion de chaînes | `full-draft.md:338-346,401-405` | Vrai par construction des listes. Lemme DR-4.L non lu. |
| Tableau pilote §7.5 | `full-draft.md:906-916` | Chiffres **vérifiés** depuis `results_h1_v2.csv` : moyennes 0.0895/0.0158/0.0157, t = 2.5239, p = 0.012159, df = 14. Inférence **invalide** (voir 2.1.2). |
| α du pilote | `full-draft.md:635` vs `:656,914-915` | **Incohérent** : sous α = 0.00625 déclaré « primary », p = 0.01216 ne passe pas. |
| Figures | `full-draft.md:1279-1282` | **Aucune** n'existe (confirme l'audit `paper1-plos-submission-audit-2026-05-04.md:121-124`). |

#### 2.1.2 Pilote PermutedMNIST recalculé

Fait (recalcul sur `experiments/h1_split_mnist/results_h1_v2.csv`, 45 lignes) : t apparié n = 15, t = 2.524, p = 0.0122 ; Welch unilatéral (le test préenregistré pour H1, `full-draft.md:641-642`) : t = 2.437, **p = 0.0143 > 0.0125** ; les 3 lignes de l'expérience 4 valent 0 dans les trois conditions (oubli nul par définition, pic = final) ; moyennes par graine n = 3 : t = 10.5, p = 0.0044 ; Wilcoxon p = 0.0048.
Inférence : le « p < α » dépend du choix d'un test apparié non préenregistré sur 15 paires non indépendantes (5 expériences par graine) dont 3 zéros structurels. L'effet lui-même est énorme et attendu (rejeu vs naïf : 0.090 → 0.016), donc le pilote ne dit rien de spécifique au cadre. La phrase « below α » est à retirer ou à recadrer en descriptif.
Fait : H2 est préenregistrée comme « P_max equivalence » (`full-draft.md:643-645`), pas « restructure adds value beyond replay » (`:930-932`). Le pilote compare P_equ (EWC) à P_min : ce n'est pas H2.

### 2.2 Paper 2 — `docs/papers/paper2/build/full-draft.tex`

**Thèse centrale.** Deux enregistrements de substrats (MLX, numpy-LIF) passent la même batterie de conformité ; le pipeline H1-H4 tourne sur les deux ; l'accord 4/4 est « trivial by shared-predictor construction » (`:111-115,131-136`).

| § (lignes .tex) | Affirme | Prouve | Manque |
|---|---|---|---|
| Bandeau + 1 Abstract (108-137) | tout résultat vient d'un prédicteur factice partagé | — | Paper 1 y est « C-v0.6.0+PARTIAL » (121), Paper 1 dit « C-v0.5.0+STABLE » (`paper1/full-draft.md:160,424`) |
| 2.1 (144-166) | Paper 1 « exercised it on a single substrate » (158-160) | — | **contredit** Paper 1 §5.6 (deux substrats) ; « free semigroup » (148) contredit Paper 1 §4.5 |
| 2.2-2.4 (168-226) | contribution d'ingénierie | — | — |
| 3 (228-276) | rappel ; « no prior work ships a reusable conformance suite » | — | Golden 2022 (PLOS CB, SNN + sommeil) absent |
| 4 (278-389) | matrice 3 × 2 PASS + ligne N/A | tests cités | « Does NOT certify » honnête (383-389) |
| 5 (391-470) | architecture ; P_min = replay seul, canal 1 (417) ; P_equ = {replay, downscale, restructure} canaux 1+2+3 (420) ; P_max « fully wired cycle 2 » (423) | — | **contredit** Paper 1 (`paper1/full-draft.md:340-342` : P_min = replay+downscale ; P_equ inclut recombine_light, canaux 1+3+4 ; P_max squelette) |
| 6 (472-532) | H1-H4 héritées ; « OSF … DOI pending » (482) | — | Paper 1 cite Q6JYN comme verrouillé |
| 7 (534-683) | Tableau 7.2 : p identiques sur les deux substrats ; H2 « self-equivalence » TOST p = 0.0000 (606) ; H4 p = 0.0101 (610) | — | H2 auto-équivalence = **contrôle tautologique** (comparer un profil à lui-même) ; aucun chiffre informatif |
| 8 (685-757) | lecture correcte : architecture oui, efficacité non | — | « No contradictions » avec Paper 1 (739) : faux (ci-dessus) |
| 9 (759-806) | cycle 3 | — | — |

**Équations/figures** : aucune équation ; Tableaux 7.2-7.4 : chiffres de mock, **invérifiables et non informatifs** par construction.

**Ce que la `.tex` omet** : les pilotes réels G4 → G6 (`paper2/results.md:52-1104`). Le plus lourd : « RECOMBINE-empty H6-C universality CONFIRMED on 4 benchmarks × 4 substrates » (`results.md:816`), dérivé de « Fail-to-reject H0 → H6-B confirmed » (`:838-841`). C'est un non-rejet présenté comme confirmation, sur 6 couples benchmark × substrat (`:852-859`) et non une grille 4 × 4.

## 3. Vérification des références

Tableau complet : `scratchpad/inventory/refs/dream-of-kiki-refs.md` (109 lignes, 93 clés uniques).

**Comptes** — Paper 1 (84) : OK 56, mauvaise attribution 15, attribution douteuse 9, introuvable 3, année-venue fausse 1 ; 15 orphelines. Paper 2 (25) : OK 23, mauvaise attribution 1 (vandeven2020brain, partagée), douteuse 1 (recursivemas2026) ; 5 orphelines. Clés uniques (93) : OK 64, KO 29.

**Erreurs visibles dans un rendu** : `vandeven2020brain` co-auteur « Tuytelaars » au lieu de Siegelmann (`build/full-draft.tex:1480` ; Paper 2 `build/full-draft.tex:874`) ; `rasch2025sleep` = en réalité Lutz, Harkotte, Born, Physiol. Rev. 106 (2026) ; `schreiner2024jneurosci` = Siefert et al. (et le texte écrit « Schreiner et al. », `paper1/discussion.md:173`) ; `cordi2021robust` = Curr. Opin. Neurobiol., pas Eur. J. Neurosci. ; `javadi2024sleeprestriction` = premier auteur Crowley ; `wamsley2020eszopiclone` → le PMID cité est Mylonas et al. 2020.
**Introuvables** : `pmc2025systems`, `pnas2022dualstage`, `ajgp2024clashome` (cités `background.md:17,119` et `discussion.md:167`).
**Motif** : 21 entrées de Paper 1 ont l'auteur « {Anonymous} » et un titre reformulé (berkeley2025sleeptimecompute, arxiv2025statefulreplay, mlxsnn2026, braintransformers2024, spinnaker2024, aimeetsbrain2025…). Inférence : elles ont été écrites depuis un résumé de veille, pas depuis la source.
**PR #87 (Rome)** : Crick-Mitchison 1983, Hopfield-Feinstein-Palmer 1983, Fachechi-Agliari-Barra 2019 sont **correctes** (Crossref : volume, pages, DOI, auteurs ; `references.bib:5-41`) et la phrase ajoutée (`full-draft.md:104-110`) leur attribue correctement l'idée. Elles ne sont que dans le `.md` (pas dans la `.tex`, pas dans Paper 2).

**Références manquantes évidentes** (DOI résolus Crossref) : Golden, Delanois, Sanda, Bazhenov 2022, *Sleep prevents catastrophic forgetting in spiking neural networks*, PLOS CB 18 (10.1371/journal.pcbi.1010628) — même revue cible, même thème (SNN + phase de sommeil + oubli) ; Tadros, Krishnan, Ramyaa, Bazhenov 2022, Nat. Commun. 13 (10.1038/s41467-022-34938-7) ; Hinton, Dayan, Frey, Neal 1995, *wake-sleep*, Science 268 (10.1126/science.7761831) ; Kanter & Sompolinsky 1987 (10.1103/PhysRevA.35.380) et Dotsenko, Yarunin, Dorotheyev 1991 (10.1088/0305-4470/24/10/026), ancêtres du noyau de rêve ; Agliari, Alemanno, Barra, Fachechi 2019, *rigorous results* (10.1088/1742-5468/ab371d) ; « When to Sleep » (OpenReview 3gCeBuNNyT, signalé par la baseline 30/10 l. 151, non résolu ici).

### 3.1 Groupe de Rome : où citer, ce qui contredit ou devance

Lus : résumés arXiv (API, 7 identifiants) et texte HTML arXiv de 2308.01421v2, 2501.16789v2, 2605.10304v1, 2605.13721v1.

| Papier de Rome | Statut dans le dépôt | Où le citer | Effet sur une revendication |
|---|---|---|---|
| Fachechi, Agliari, Barra 2019 (10.1016/j.neunet.2019.01.006) | cité Paper 1 `.md` (`full-draft.md:108`) — correct | aussi Paper 2 §3.2 (`paper2/build/full-draft.tex:240-249`) | — |
| Agliari, Alemanno, Aquaro, Fachechi 2024, *Regularization, early-stopping and dreaming* (10.1016/j.neunet.2024.106389 ; arXiv:2308.01421) | absent | Paper 1 §3.2 après `full-draft.md:230` (downscale) ; §7.5 après `:940` (EWC proxy) ; §8.4 ligne EWC (`:1045`) | **Devance/contredit** la séparation des piliers : le texte HTML montre que le noyau de rêve est exactement l'estimateur ridge, t étant l'inverse du paramètre de Tikhonov, et qu'un temps d'arrêt précoce lui correspond. Donc (i) un `downscale` uniforme (×f) n'est pas le rêve (ridge rétrécit par direction propre), (ii) EWC, régularisation quadratique, est du côté « rêve », pas « restructure ». Le pilote H2 (EWC = restructure) mélange les catégories. |
| Agliari et al. 2024, *Hebbian dreaming for small datasets* (10.1016/j.neunet.2024.106174 ; arXiv:2204.07954) | absent | Paper 1 §2.1 après `full-draft.md:110` | Fournit une grandeur testable (taille d'échantillon critique vs t) que Framework C n'a pas ; pas de contradiction. |
| Agliari, Alessandrelli, Barra, Centonze, Ricci-Tersenghi 2026, *Networks of Hebbian networks: more is different* (10.1016/j.neunet.2025.108181 ; arXiv:2501.16789) | absent | Paper 1 §3.3 (`full-draft.md:238-255`, recombine) et §8.4 ligne Zahn (`:1066`) ; Paper 2 `results.md` §7.1.11 | Le HTML confirme : la spécialisation (désenchevêtrement) vient d'un couplage inter-couches **anti-imitatif posé**. Pour `recombine` (mélange de latents), c'est l'opération inverse, analysée avec garanties. Ne contredit pas RECOMBINE-empty, mais montre qu'un mélange sans terme compétitif n'a pas de raison de produire de la séparation. |
| Barra et al. 2026, DLAM (10.1016/j.neunet.2026.109729 ; arXiv:2605.13721) | absent | Paper 1 §3.3 ; Paper 2 §3.4 | Décompose le champ local en signal / bruit de rêve intra / inter-couches ; le rêve atténue sélectivement les grands modes propres. Devance toute affirmation que `downscale` (uniforme) opérationnalise un effet du sommeil sur l'interférence. |
| Albanese et al. 2026, *Partial annealing* (arXiv:2605.10304) | absent | Paper 1 §2.1 après `:110` comme second mécanisme de décorrélation | Le HTML le relie explicitement à l'unlearning et à la pseudo-inverse. Pour Paper 1 : la capacité α → 1 n'est pas propre au « rêve », ce qui affaiblit la lecture « rêver = désapprendre » comme spécifique. Ne contredit aucun chiffre du dépôt. |
| Agliari, Alessandrelli, Barra, Fachechi 2026, *Dense auto-hetero…* (arXiv:2609.32605) | absent | Paper 1 §8.4 ligne Zahn ; préreg G4-nono §1 | Devance H14/G4-nono sur « recombine = séparation de mélanges » (baseline 30/10 l. 160, confirmé). |
| Agliari, Lepre, Roscani 2026, *modular RBM* (arXiv:2610.08612) | absent | Paper 2 §3.4 | Point fixe d'un apprentissage CD vers les couplages hebbiens : réponse partielle à « le cadre vaut-il pour des réseaux appris ? ». |
| Autres de la veille (2503.15353, 2601.07777, 2610.22191, 2606.04651, 2509.06905, 2511.02441, 2505.06202, 2409.10145, 2505.18796, 2503.04454, 2607.29554, 2503.06274) | absents | non nécessaires pour Paper 1/2 | — |

## 4. Analyses

- **Ordres de grandeur.** Le pilote §7.5 compare 0.090 à 0.016 d'oubli moyen (×5.7) ; un tel écart rejeu/naïf est connu depuis 2017 ; ce n'est pas une mesure du cadre. Paper 2 n'a aucune quantité empirique. Les vrais chiffres du dépôt sont ailleurs : G4-ter g = +2.77 (baseline 24/10 point 3), RECOMBINE g ≈ 0 sur 6 couples (`paper2/results.md:852-859`), NH-03 R_d3 = +14.65 [13.77 ; 15.51] (`docs/results/2026-10-30-nh03-deferred-eval.md:34`).
- **Puissance.** G4-septimo : N = 30 par bras à α = 0.05 bilatéral détecte d ≈ 0.74 (`docs/osf-prereg-erratum-g4-power-2026-10-23.md:22`, recalcul approché d ≈ 0.73-0.75) ; |g| = 0.025 observé est compatible avec des effets jusqu'à ~0.5 non exclus : « confirmed » est indéfendable sans TOST. Erratum G4 : d = 0.857 pour N = 30, α = 0.0167 bilatéral, mon approximation t donne 0.853 (plausible).
- **Capacité/complexité du formalisme.** L'objet mathématique de DR-2 est le monoïde d'endomorphismes d'un ensemble d'états, restreint à des mots ; aucune propriété non triviale (présentation, relations, invariants, action) n'est démontrée. Le contenu falsifiable est porté par les tests (C2) qui sont spécifiques à chaque substrat.
- **Ce qu'un rapporteur dirait en 3 points.** (1) Le « théorème » DR-2 est une tautologie de la composition de fonctions plus une précondition issue d'un bogue de forme, et l'ensemble restreint n'est pas un semigroupe. (2) Aucune hypothèse du papier n'a de données réelles (H1-H4 synthétiques, Paper 2 entièrement factice), et le seul pilote réel teste rejeu contre naïf avec un test non préenregistré. (3) Le manuscrit se contredit (α, nombre de substrats, profils, liberté du semigroupe, p-values « non reportées » puis « 3/4 passées ») et sa bibliographie a 29/93 entrées KO.
- **Positionnement.** Une fois Tadros 2022, Golden 2022, Robinson 2022, Sorrenti 2023/2024 et Rome 2019-2026 lus, la contribution réellement neuve est d'ordre ingénierie et méthode : (a) une suite de conformité exécutable et le constat honnête que sa couche structurelle laisse passer 22/25 substrats adverses (§5.8) ; (b) la discipline de préenregistrement et d'errata (DR-2, E1-small §2bis). Le « cadre formel unifié » n'apporte pas de prédiction quantitative que les modèles de Rome (rêve = ridge, désenchevêtrement) ou de Bazhenov n'aient déjà.

## 5. Suppositions implicites

1. Chaque pilier biologique correspond à une opération discrète et une seule (`full-draft.md:200-273`). Risque : Rome 106389 montre que rêve, régularisation et arrêt précoce sont la même opération ; la décomposition en quatre générateurs n'est pas identifiable.
2. `downscale` multiplicatif = SHY (`:224-230`). Risque : un ×f uniforme est neutre pour un argmax (invariance d'échelle des logits si biais nuls) ; dans E1-small il pèse ~35× la mise à jour SGD (`docs/osf-amendment-e1-small-2026-10-30.md:150-155`), donc il domine H14-B/C.
3. Passer des tests de types et de gardes signifie « hériter des garanties du cadre » (`full-draft.md:976-979`). Risque : §5.8 montre que non sans C2, et C2 est par substrat.
4. Les effets humains (Hu 2020 g = 0.29 ; Crowley 2024 g = 0.29) donnent des planchers d'effet pour des MLP (`paper1/methodology.md:20-33`). Risque : transposition sans fondement ; les seuils de puissance en dépendent.
5. Le prédicteur factice valide « le pipeline » (Paper 2). Risque : un pipeline qui reçoit des nombres scriptés ne teste ni la mesure ni le modèle.
6. Les mesures nerve-wml sont transférables à Framework C (`full-draft.md:805-880`). Risque : autre interface, autre tâche ; auto-citation.

## 6. Pistes d'utilité

- **Publiable tel quel (avec réécriture courte)** : §5.8 comme note méthodologique « un critère de conformité structurel est vide sans tests d'axiomes spécifiques » ; l'amendement DR-2 + l'addendum E1-small §2bis comme cas d'école de transparence ; NH-03 comme négatif : l'avantage TTT est un effet de récence (`docs/results/2026-10-30-nh03-deferred-eval.md:55-80`) ; RECOMBINE nul sur 6 couples, **en non-rejet** avec MDE, pas en « confirmed ».
- **À arrêter** : présenter DR-2 comme « théorème » ; Paper 2 en l'état (zéro contenu empirique, contradictions avec Paper 1) ; les tables H1-H4 synthétiques dans un papier soumis.
- **Manque pour une soumission Paper 1** : choisir une source unique (`.md` ou `.tex`) et la re-rendre ; corriger α, H2, §9.1, §8.2, « free » ; refaire la bibliographie depuis les DOI (29 entrées KO) et ajouter les 15 références inline ; Golden 2022 + Tadros 2022 + Rome 106389/108181/DLAM ; figures ; données réelles pour au moins une hypothèse ou recentrer le papier sur la suite de conformité.

## 7. Constats classés

| # | Sévérité | Constat | Preuve | Vs baseline |
|---|---|---|---|---|
| 1 | BLOQUANT | DR-2 : (C) et (B) vrais par définition, (A) trivial ; l'ensemble des mots satisfaisant [P] n'est pas clos par composition, donc pas un semigroupe ; la précondition vient d'un `ValueError` de forme MLX | `docs/proofs/dr2-compositionality.md:63-70,118-131` ; `full-draft.md:374-381` ; `docs/specs/amendments/2026-04-21-dr2-empirical-falsification.md:29-37` | nouveau (la baseline 24/10 ne traite que le compte 11/12, l. 340) |
| 2 | BLOQUANT | Contradiction de α : « primary analysis uses α = 0.00625 » vs « α = 0.0125 » ; le pilote ne passe que sous 0.0125 | `full-draft.md:635` vs `:656,914-915` | nouveau |
| 3 | BLOQUANT | Le pilote « p < α » utilise un t apparié non préenregistré (Welch préenregistré : p = 0.0143) sur 15 paires non indépendantes dont 3 zéros structurels | `full-draft.md:641-642,912-916` ; recalcul `results_h1_v2.csv` | nouveau |
| 4 | MAJEUR | « Three of four pre-registered hypotheses passed » sur données factices, contredit §7.1 et §8.3 | `full-draft.md:994-998` vs `:767-770,1016-1023` | nouveau (baseline 24/10 l. 76 dit « jamais testé ») |
| 5 | MAJEUR | §9.1 dit l'E-SNN différé et Paper 1 mono-substrat ; Paper 2 dit Paper 1 mono-substrat ; Paper 1 §5.6 et l'abstract en revendiquent deux | `full-draft.md:1139-1154` ; `paper2/build/full-draft.tex:158-160` vs `full-draft.md:48-55,475-511` | nouveau |
| 6 | MAJEUR | Profils et version incompatibles entre Paper 1 et Paper 2 (P_min, P_equ, P_max, C-v0.5.0 vs v0.6.0, DOI OSF « pending ») | `paper1/full-draft.md:340-342,424` vs `paper2/build/full-draft.tex:121,417-423,482` | nouveau |
| 7 | MAJEUR | `.tex` de build périmée de 6 mois (16 refs, pas de Rome, gap 12.1 % non corrigé, « free semigroup ») ; aucun PDF | `paper1/build/full-draft.tex:260,452,943-945,1413-1494` | confirme l'audit du 4 mai (§1, §4) ; nouveau vs baseline |
| 8 | MAJEUR | Bibliographie : 29/93 clés KO (15 mauvaises attributions, 3 introuvables, 10 douteuses, 1 venue fausse), dont un co-auteur faux dans le rendu (van de Ven) | `scratchpad/inventory/refs/dream-of-kiki-refs.md` ; `paper1/build/full-draft.tex:1480` | nouveau (la baseline n'a vérifié que l'absence de Crick/Hopfield/Fachechi, l. 194) |
| 9 | MAJEUR | « RECOMBINE-empty universality CONFIRMED on 4 × 4 » à partir de non-rejets ; 6 couples seulement | `paper2/results.md:816,838-841,852-859` | confirme baseline 24/10 point 2 (l. 41) ; nouveau : le texte du Paper 2 garde « confirmed » |
| 10 | MAJEUR | Code de [P] admet des mots à répétition qui violent [P] | `kiki_oniric/axioms/__init__.py:75-80` | nouveau |
| 11 | MAJEUR | Antériorités absentes : Golden 2022 (PLOS CB, SNN + sommeil), Tadros 2022, Rome 106389 (rêve = ridge), 108181, DLAM | §3 ci-dessus | nouveau pour Golden/Tadros/106389 ; confirme baseline 30/10 l. 160 pour DLAM/2609.32605 |
| 12 | MAJEUR | Paper 2 : H2 « self-equivalence » = contrôle tautologique ; tous les p proviennent d'un mock partagé | `paper2/build/full-draft.tex:604-612,642` | nouveau |
| 13 | MINEUR | « 12 sur 16 paires non commutatives » trompeur ; self-pairs déclarées non commutatives | `full-draft.md:285-286` ; `docs/proofs/op-pair-analysis.md:130-134` | nouveau |
| 14 | MINEUR | H2 mal décrite dans le pilote (EWC vs P_max equivalence) | `full-draft.md:643-645` vs `:930-932` | nouveau |
| 15 | MINEUR | 15 références inline sans entrée .bib ; 15 + 5 entrées orphelines ; §10 dit « 16 entries » | `full-draft.md:1050-1055,1217-1219` | nouveau |
| 16 | MINEUR | R1 « 16-character » puis « 32 » dans le même item ; « ~27 assertions » calculé par moyenne supposée | `full-draft.md:713-718,517-520` | nouveau |
| 17 | MINEUR | DOI concept nerve-wml résout vers v1.10.0, pas v1.9.0 ; titre .bib ≠ titre DataCite ; .tex cite « v1.1.2 » (DataCite : v1.1.3) | `references.bib` (`saillant2026nervewml`) ; `full-draft.md:809-811` ; `build/full-draft.tex:925-926` | nouveau |
| 18 | MINEUR | E1-small : non déposé sur OSF, run avant dépôt, exposition intérimaire ⇒ tout exploratoire ; DOWNSCALE domine H14-B/C | `docs/osf-amendment-e1-small-2026-10-30.md:102-106,114-123,150-155` | confirme baseline 30/10 #1 et #11 (et la règle GO est retirée, donc #1 est clos) |
| 19 | OK | Citations Crick-Mitchison, Hopfield-Feinstein-Palmer, Fachechi-Agliari-Barra (PR #87) exactes | `references.bib:5-41` ; `full-draft.md:104-110` | confirme que la lacune baseline 30/10 l. 194 est comblée dans le `.md` seulement |
| 20 | OK | NH-03 différé : chiffres cohérents, nul de signe calibré, verdict préenregistré ; lecture « pas d'avantage TTT » honnête | `docs/results/2026-10-30-nh03-deferred-eval.md:20-90` | infirme partiellement baseline 30/10 l. 86 (« le délai confond récence et interférence ») : l'asymétrie est désormais déclarée dans les limites (l. 82-90), mais la confusion reste réelle |
| 21 | OK | §5.8 tests négatifs : conclusion juste et utile | `full-draft.md:542-617` | nouveau |

**Non vérifié** : la réplication NH-01 citée (`hypneum-lab/rescience-nh01`) ; le contenu de la v2 de Zahn (seul le résumé servi par l'API a été lu) ; le lemme DR-4.L ; les chiffres nerve-wml de §7.4 (autre dépôt) ; les JSON G4/§5.8 non relus ; le lien OpenReview ICLR de `iclr2026lmsleep` ; « When to Sleep ».
