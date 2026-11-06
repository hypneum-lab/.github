# Inventaire — rescience-nh01 et paper-methodo-2026 (relecture du 2026-11-01)

Conventions. `O:n` = ligne n de `scratchpad/work_rm/dl/fab/p.txt` (pdftotext d'arXiv:1810.12217v1, l'article original). `C:n` = `rescience-nh01/article/content.tex`. `R:n` = `rescience-nh01/code/experiments/nh01_hopfield_dream/run.py`. Les chiffres « recalculés » l'ont été en lecture seule par `python3 -I` sur les `summary.json` et `cells.jsonl.gz` des clones (aucune simulation relancée). **Fait** = lu à la source ; **Inférence** = raisonnement de ma part, signalé comme tel. Références : `inventory/refs/rescience-methodo-refs.md`.

Baseline lue **après** formation de l'avis : `clones/.github/docs/research/2026-10-30-etat-des-lieux/README.md` (HEAD efa7b86).

---

# Section 1 — rescience-nh01

## 0. En-tête

- Dépôt : `hypneum-lab/rescience-nh01`, clone `scratchpad/clones/rescience-nh01`, SHA **f6e97fd62cdd7b78417099978af03348aedaf616** (tag de soumission `submission-20261031` → 5691801 ; tag `arm-repro-gb300-freeze-20261031` ajouté ensuite).
- Lus en entier : `article/content.tex` (708 l.), `article/article.tex` (19), `article/metadata.yaml` (112), `article/bibliography.bib` (82), `docs/ai_use.md`, `code/README.md`, `code/CODE_SHA256_AT_TAG.txt`, `data/README.md`, les trois `prereg/*.md`, `run.py` (713), `confirmatory.py` (384), `correlated.py` (237, survol), `review/2026-10-31-verdicts.md`. Texte intégral lu : arXiv 1810.12217 (original), 2308.01421, 2605.10304, 2605.13721.
- Hors dépôt, lus pour recouper : nerve-wml `docs/results/2026-10-31-nh01-diagonal-ablation.md` + `results/nh01_diagonal_ablation/summary.json` (PR #97/#98, 31/10), PR nerve-wml #90 (`scale.md` par l'API), issue ReScience/submissions #147 (JSON API), `gh pr list` des deux dépôts.
- Durée : une session longue (environ 3 h de lecture et recalcul, interrompue par une compaction).

## 1. État des lieux (fait)

1. Soumission ReScience C ouverte le 31/10 16:28 UTC (issue #147) depuis le tag `submission-20261031` ; le 01/11 09:52 UTC l'éditeur (rougier) demande à l'auteur de **proposer deux relecteurs** avant d'avancer (nouveau, non traité dans le dépôt).
2. PR #1–#4 et #6 fusionnées le 31/10 ; **PR #5 ouverte** (lien README → #147, une ligne).
3. Objet : noyau de rêve de Fachechi, Agliari, Barra 2019 à N = 1 000, comparé à Hebb et à un contrôle « shrink » apparié en norme de Frobenius ; trois préregs gelées (pilote, confirmatoire, motifs corrélés).
4. L'article se déclare réplication **partielle** : aucune figure originale reproduite, capacité théorique RS non estimée par Monte Carlo (C:37-48).
5. Écarts déclarés : diagonale retirée (C:94, 218-222), dynamique séquentielle et non parallèle (C:224-230).
6. Résultat principal : C1 = 3,86 [3,79 ; 3,93] (rapport capacité rêve/Hebb, T = 0, t = 10) ; contrôle −2,52 % ; t* = 7 ; à m = 0,30 double étiquette « enregistré confirmed / évaluation inconclusive ».
7. Reproduction interne bit-exacte 9 120/9 120 et 29 640/29 640 cellules (C:509-522), vérifiée par condensats.
8. Code : 3 modules (713/384/237 lignes), tests, manifeste SHA-256, SWHID (metadata.yaml:44-46), données Zenodo nerve-wml v1.10.0.
9. Fait nouveau postérieur au gel : l'ablation de la diagonale (nerve-wml, 31/10 16:39 UTC, tag `prereg-nh01-diagonal-20261031`) existe et **n'est pas dans l'article**.

## 2. Lecture des papiers

### 2.1 L'article ReScience, section par section

| § (lignes) | Condensé | Verdict |
|---|---|---|
| Intro (C:1-48) | Rappel du noyau J(t) = J(1+t)(1+tJ)⁻¹ (C:12), limites t = 0 Hebb, t → ∞ projecteur ; α_c 0,138 → ~1,07 en RS ; périmètre partiel annoncé. | Formule **vérifiée** (ci-dessous). Chiffres RS **vérifiés** O:802-806. Le titre original est « forgetting spurious memories and reinforcing pure ones » ; correct dans le .bib. |
| Contrôle ajouté (C:57-65) | Shrink apparié c(t) = ‖offdiag J(t)‖_F / ‖offdiag J‖_F appliqué à Hebb ; présenté comme « calibrated null » (C:63-64). | Construction **vérifiée** (R:294-299). Qualification « calibrated null » **fausse** (voir §4 et constat M1). |
| Modèle (C:69-104) | Motifs ±1 i.i.d., Hebb normalisé 1/N, diagonale mise à zéro (C:94, R:103-107). | **Vérifié** dans le code. Écart avec O:418 et O:1065-1068 (somme j = 1…N, auto-couplage inclus) déclaré. |
| Indice et estimateur (C:106-129) | Indice bruité (flips), seuil de rappel 0,9 (T = 0) / 0,8 (T = 0,2), capacité = croisement interpolé à 0,5 après le **dernier** point de grille où r ≥ 0,5 (R:343-353, `above[-1]`), grille de 24 charges, censure 0,95, sentinelle 0 `below_grid`. | **Vérifié** code. Remarque : l'estimateur « dernier croisement » est robuste aux courbes non monotones mais biaisé vers le haut si un rebond isolé apparaît (inférence ; aucun rebond vu dans les médianes). |
| Contrôle shrink (C:131-148) | Invariance d'échelle à T = 0 → le contrôle est inerte à T = 0 ; à T = 0,2, shrink ≡ Hebb à température T/c ; contre-exemple pilote 1,012 (C:146-147). | **Vérifié** algébriquement (signe de h inchangé par c > 0). |
| Critères (C:180-203) | C1 ≥ 3 ; C2′ forme en cloche ; C3′ rapport shrink/Hebb ≤ 1 ; P4 parasites ; C4 tendance corrélée ; amendement pilote déclaré. | Fidèles aux préregs (condensats b1ccbb63, 6c29566b, be9ef311 identiques aux tags). |
| Écarts (C:218-230) | « We did not run an ablation with the diagonal kept » (C:221-222). | Exact au gel ; **périmé** depuis le 31/10 16:39 (ablation faite). |
| Pilote (C:245-250) | 3,43 [3,26 ; 3,60]. | **Vérifié** dans `data/nh01/summary.json`. |
| Confirmatoire (C:271-295) | Tableau ; à T = 0,2 gain 3,58 ; Hebb décroît avec N (0,211/0,179/0,175/0,157). | **Vérifié** : C1 = 3,8605 [3,787 ; 3,933] ; à T = 0,2 3,579 ; Hebb T = 0 0,157, T = 0,2 0,126. |
| Corrélé (C:372-466) | 3,82 / 9,06 / 44,4 selon m ; à m = 0,30, T = 0,2, 5 Hebb below-grid ; C4 = 40,6 [38,7 ; 43,2] ; règle de lecture et double étiquette (C:428-460). | **Vérifié** : 3,824 / 9,055 / 44,385 ; à m = 0,30, T = 0, 10/10 flags `ok` (dénominateurs 0,0117–0,0153) ; à T = 0,2, rapports shrink par graine [1, nan, nan, 0, 1, 1, nan, 0, nan, nan] → 0,6 [0,2 ; 1,0]. |
| Reproduction (C:509-522) | Relance bit-exacte. | **Vérifié** (comparison.json, outputs_sha256). Ce n'est **pas** une réplication de l'original. |
| Conclusion (C:526-564) | « supports the central qualitative claims » ; contrôle −2,52 % [1,80 ; 3,35] ; t* = 7. | Chiffres **vérifiés** ; la portée qualitative dépend de la diagonale (constat B1). |
| Travaux récents (C:566-578) | Benedetti 2024, Serricchio 2025, Lucibello 2024. | Attributions **OK** ; manquent JSTAT 2019, Dotsenko 1991, ridge 2024, DLAM, recuit partiel, Marinari 2026. |
| #90 (C:580-586) | Balayage d'échelle annoncé, ouvert. | Exact. |
| Usage IA (C:697-708) | Déclaration générique. | Pas de nom de modèle (`docs/ai_use.md` non plus), alors que la note méthodo nomme « Claude Fable 5.1 » (00-agents.md:17). |

### 2.2 L'article original (arXiv:1810.12217, texte intégral)

| Élément | Source | Verdict |
|---|---|---|
| J(t) = (1/N) ξᵀ(1+t)(I+tC)⁻¹ξ, C = ξξᵀ/N | O:413-418 | **Vérifié à la main** : par push-through, ξᵀ(I+tC)⁻¹ = (I+tJ)⁻¹ξᵀ (J = ξᵀξ/N), donc J(t) = (1+t) J (I+tJ)⁻¹ = J(1+t)(1+tJ)⁻¹ (J et (I+tJ)⁻¹ commutent). Valeurs propres λ → λ(1+t)/(1+tλ) : 0 reste 0, λ → 1 quand t → ∞ (projecteur de Kanter–Sompolinsky, O:432-434). |
| Hamiltonien sommé sur i,j = 1…N | O:418 | Vérifié ; la diagonale fait partie du modèle. |
| Champ h_i = Σ_{j=1}^N J_ij σ_j, mise à jour **parallèle** | O:1065-1075 (Éq. 2.16-2.17) | Vérifié ; l'article ReScience utilise auto-couplage nul + séquentiel (deux écarts, déclarés). |
| α_c ≈ 0,138 → ≈ 1,07 en RS, croissance « log-sigmoïdale » monotone | O:802-807 | Vérifié. |
| Fig. 7 : N = 5 000, M = 10, P/N ∈ {0,02 ; 0,08 ; 0,32}, t ∈ {0 ; 0,1 ; 1 ; 10 ; 100 ; 1 000} | O:964-968 | Vérifié ; C:43-48 cite correctement. |
| Fig. 8 : N ∈ {500 ; 1 000 ; 5 000}, α = 0,08 | O:990-993 | Vérifié. |
| Fig. 9 : 20 × 20 évolutions, départs aléatoires, σ(t) ∼ 0,224 t^−0,998 | O:1080-1095 | Vérifié ; **peu coûteuse à reproduire** (inférence). |
| Fig. 10 : bassins, N = 1 000, P = 50, flips de probabilité p, critère « Mattis maximal », 200 × 200 | O:1099-1104, 1163-1164 | Vérifié ; mêmes N que l'article ReScience → **reproductible directement** (inférence). |
| « strongly resembles » Dotsenko et al. 1991 ; note 12 : chez Dotsenko la région de rappel diminue avec t | O:510, O:822 | Vérifié ; antériorité non citée par l'article ReScience. |

### 2.3 Groupe de Rome — citations

| Papier | Statut dans l'article | Où et pourquoi |
|---|---|---|
| Fachechi, Agliari, Barra 2019 (NN 112) | présent | — |
| Agliari, Alemanno, Barra, Fachechi, JSTAT 2019 (10.1088/1742-5468/ab371d) | **à ajouter** | Intro C:3-41 ; version rigoureuse du même noyau. |
| Agliari, Alemanno, Aquaro, Fachechi 2024, NN 177 106389 (arXiv:2308.01421) | **à ajouter — devance** | Modèle C:69-79 et contrôle C:131-148 : le noyau rêvé **est** l'estimateur ridge avec t_d = 1/ε_J (Éq. 3.4-3.5) ; la capacité croît de façon monotone en t_d (p.txt:333). Cela rend la « courbe en cloche » de C2′ (pic t ≈ 10-20 puis décroissance) une **propriété de la dynamique finie N / du critère**, pas du noyau — à discuter. |
| Barra et al. 2026, DLAM (arXiv:2605.13721, NN 109729) | **à ajouter — devance** | Conclusion C:551-552 : « spectral change, not global downscaling » est déjà énoncé (« differentially attenuating high-eigenvalue interference modes ») avec le lien à SHY. |
| Albanese et al. 2026, recuit partiel (arXiv:2605.10304) | **à ajouter — nuance** | C:566-578 : second chemin vers α_c = 1, et sur motifs biaisés bassins plus grands que le pseudo-inverse : contredit l'idée que la limite projecteur est la meilleure sur données corrélées. |
| Marinari, Rossi, Zamponi 2026 (arXiv:2603.09384) | à ajouter | Contrôle C:131-148 : rêve à synapses bornées = autre façon de poser le « budget ». |
| Agliari et al. 2024, NN 173 106174 ; arXiv:2409.10145 | facultatifs | perspective. |
| Benedetti et al. 2022 (J. Chem. Phys.), Benedetti 2024, Serricchio 2025 | 2024/2025 présents ; 2022 à ajouter | désapprentissage itératif, distinct du noyau fermé. |

Aucun papier de Rome **ne contredit** les chiffres de l'article ; deux (ridge 2024, DLAM) **devancent** son interprétation.

## 3. Vérification des références (détail dans `refs/rescience-methodo-refs.md`)

8/8 entrées existent et sont correctement attribuées (Crossref + S2) ; 1 erreur de prénom (`bibliography.bib:65`, « Ludovico » → **Ludovica** Serricchio). 12 références manquantes résolues. Candidat `arXiv:2112.06694` rejeté (hors sujet). Cook et al. arXiv:2610.37139 (suggéré par la baseline l. 157) **non résolu**.

## 4. Analyses

### 4.1 Ordres de grandeur

- Capacité Hebb mesurée 0,157 à N = 1 000, T = 0, seuil 0,9 (fait). Inférieure à 0,138 × (correction taille finie) attendue ? Non : 0,157 > 0,138, cohérent avec l'effet de taille finie connu à N = 1 000 et le critère « 50 % des graines au-dessus de 0,9 » (inférence).
- Rêve à t = 10 : ≈ 0,61 (médiane C2′ au pic ≈ 0,616 à l'indice 5) — loin de 1,07 RS, ce qu'admet l'article (C:37-41). Ordre de grandeur cohérent avec une dynamique séquentielle à T = 0 et un indice bruité (inférence).
- Facteur 3,86 = 0,606/0,157 environ (fait, recalcul) : **le dénominateur porte le facteur**. Hebb décroît avec N (0,211 → 0,157, C:288-295) ; donc C1 croît mécaniquement avec N (inférence), ce qui rend le C1 de #90 aux grands N quasi garanti.

### 4.2 Diagonale (fait, recalcul depuis nerve-wml `results/nh01_diagonal_ablation/summary.json`)

- Diagonale gardée : médianes 0,250 / 0,614 (pic à t = 1) / 0,535 / 0,512 / 0,490 / 0,476 / 0,471 / 0,465 / 0,462 / 0,441 (nerve-wml `docs/results/2026-10-31-nh01-diagonal-ablation.md:28-29`) ; Hebb avec diagonale = 0,250 (l. 33).
- Rapport rêve/Hebb diagonale gardée : t = 1 → 2,437 ; **t = 10 → 1,904 [1,861 ; 1,951]** ; t = 100 → 1,774. Sans diagonale à t = 10 : 3,898.
- Inférence : avec la convention de l'original (Éq. 2.16), **C1 ≥ 3 échoue**, et la courbe rêvée décroît de t = 1 à t = 100 (pas de cloche à t ≈ 10). Mécanisme plausible : l'auto-couplage J_ii(t) croît avec t (vers P/N pour le projecteur) et fige les états près de l'indice ; le document nerve-wml (l. 34) décrit justement les « spurious » comme des états figés près de l'indice.

### 4.3 C3′ (constat M1)

- Fait : à T = 0, le rapport shrink/Hebb vaut exactement 1 (invariance d'échelle). À T = 0,2, shrink à c < 1 ≡ Hebb à T/c > T, donc plus chaud ; sa capacité ne peut dépasser celle de Hebb à T = 0 (inférence, modulo le changement de seuil 0,9 → 0,8).
- Inférence : S = α̂_shrink(0,2)/α̂_Hebb(0,2) est borné par environ α̂_Hebb(T = 0)/α̂_Hebb(T = 0,2) ≈ 0,157/0,126 ≈ **1,25** si on ignore la différence de seuils ; le critère « ≤ 1 » ne peut échouer que par bruit d'estimation (pilote 1,012, C:146-147). Un test qui ne peut pas échouer par construction n'est pas un « calibrated null ».
- Contre la baseline #10 : « ≤ 1 par théorème » est trop fort (1,012 observé) — c'est « ≤ 1 en espérance, + bruit ».

### 4.4 Puissance

- Confirmatoire : IC bootstrap de C1 de demi-largeur ≈ 0,07 autour de 3,86 → seuil 3 dépassé de > 10 demi-largeurs (fait). La puissance n'est pas le problème ; la **validité de construit** (diagonale, critère, dynamique) l'est.
- #90 : puissance déclarée σ(R) = 0,125, distance 0,111 à 80 % (`scale.md:371-390`) ; plausible, mais le balayage ne traite pas la diagonale.

### 4.5 Ce que diraient trois rapporteurs ReScience

1. **Physicien statistique (Rome-like)** : « Vous ne reproduisez aucune figure de l'original. La Fig. 10 est au même N = 1 000 : faites-la, avec dynamique parallèle et diagonale incluse. Citez JSTAT 2019, Dotsenko 1991 et l'identité ridge 2024. » → exigera la reproduction de Fig. 10 (et probablement Fig. 9).
2. **Réplicateur méthodologique** : « Votre écart diagonale change le résultat d'un facteur 2 (ablation du 31/10) : ce n'est pas un écart mineur ; publiez-le dans l'article. C3′ ne peut pas échouer : retirez “calibrated null”. Les “spurious” sont une classe résiduelle (R:241-255) : P4 ne mesure pas les états de mélange de l'original (O:437). »
3. **Éditeur ReScience** : « Une réplication ReScience reproduit les résultats d'un article ; ici la question est différente (contrôle shrink, motifs corrélés). Est-ce une réplication ou une extension ? » → la baseline (l. 224) jugeait déjà le format inadapté ; je le nuance : le format reste possible si l'article reproduit au moins Fig. 9-10 avec la convention de l'original et présente le reste comme extension.

### 4.6 Positionnement

Inférence : la contribution réelle est (a) un contrôle apparié propre qui montre que l'effet n'est pas une simple remise à l'échelle (mais ce point est déjà établi analytiquement par DLAM et l'identité ridge), (b) une chaîne de préreg et de reproduction exemplaire. La revendication « supports the central qualitative claims » est fragile tant que la diagonale de l'original n'est pas utilisée.

## 5. Suppositions implicites et risque

| Supposition | Où | Risque si fausse |
|---|---|---|
| Retirer la diagonale est un écart neutre | C:94, 218-222 | **Réalisé** : C1 passe de 3,9 à 1,9 avec la diagonale (§4.2). |
| La dynamique séquentielle donne les mêmes points fixes que la parallèle | C:224-230 | Parallèle admet des cycles de période 2 ; capacité mesurée différente. Non testé. |
| « spurious » ≈ états de mélange | R:241-255, P4 | Faux : classe résiduelle ; P4 peut passer sans que les mélanges disparaissent. |
| Le contrôle shrink peut réfuter | C:57-65 | Faux à T = 0 (inerte) et quasi faux à T = 0,2 (§4.3). |
| Le critère de capacité (50 % au-dessus du seuil) est comparable à α_c RS | C:106-129 | Comparaison au 1,07 non interprétable ; l'article le dit. |
| Le changement de seuil 0,9 → 0,8 à T = 0,2 n'affecte pas les rapports | prereg confirmatoire:27 | Les rapports à T = 0,2 ne sont pas comparables à ceux à T = 0. |
| La règle below-grid de C1 s'applique à C3′ | prereg corrélé:35 | Elle n'est écrite que pour C1 ; l'étiquette m = 0,30 dépend d'une lecture post hoc, ce que l'article déclare (double étiquette). |

## 6. Pistes d'utilité

1. **Avant toute relecture externe** : intégrer l'ablation diagonale (tableau + phrase de conclusion corrigée), en version v2 du tag, ou retirer la soumission #147 le temps de le faire.
2. Reproduire Fig. 10 (N = 1 000, P = 50, 200 × 200, parallèle, diagonale incluse) et Fig. 9 : coût faible, gain de légitimité ReScience décisif.
3. Remplacer P4 par un test de stabilité des 3-mélanges (signe de ξ¹+ξ²+ξ³) en fonction de t, ce que l'original revendique (O:437).
4. Remplacer C3′ par un contrôle qui peut échouer : ridge non rêvé à λ quelconque n'est pas possible (c'est le même objet), mais un **shrink spectral non uniforme aléatoire** (même spectre cible, vecteurs propres permutés) ou le désapprentissage itératif de Hopfield 1983 à budget égal le pourraient.
5. Citer et discuter ridge 2024 et DLAM : la courbe en cloche devient une question intéressante (le noyau prédit une monotonie, la mesure montre un pic).
6. Mettre #90 en pause (rejoint la baseline l. 273/277) : il mesure surtout la décroissance du dénominateur Hebb.
7. Fusionner PR #5, proposer les deux relecteurs demandés par l'éditeur, nommer le modèle IA dans `docs/ai_use.md`.

## 7. Constats

| # | Sévérité | Constat | path:line | vs baseline |
|---|---|---|---|---|
| B1 | **BLOQUANT** | Avec la convention de l'original (Éq. 2.16, auto-couplage inclus), le rapport C1 tombe à 1,90 [1,86 ; 1,95] < 3, et la courbe rêvée décroît de t = 1 à t = 100. L'article gelé affirme qu'aucune ablation n'a été faite et conclut « supports the central qualitative claims ». | C:218-222, C:526-545 ; nerve-wml `docs/results/2026-10-31-nh01-diagonal-ablation.md:28-34` ; recalcul `results/nh01_diagonal_ablation/summary.json` | **nouveau** (la baseline #3/#26 de la revue Codex classait la diagonale MAJEUR sans en mesurer l'effet) |
| M1 | MAJEUR | C3′ ne peut pas réfuter : inerte à T = 0, borné ≈ 1,25 à T = 0,2 ; « calibrated null » impropre. | C:57-65, C:131-148 ; `confirmatory.py:120-127` | **confirme et précise** baseline #10 ; infirme sa formulation « ≤ 1 par théorème » (pilote 1,012, C:146-147) |
| M2 | MAJEUR | Aucune figure de l'original reproduite alors que Fig. 10 est au même N. | C:43-48 ; O:1099-1104 | nouveau |
| M3 | MAJEUR | Antériorités manquantes : JSTAT 2019, Dotsenko 1991, identité ridge 2024 (devance), DLAM (devance), recuit partiel, Marinari 2026. | `bibliography.bib` ; C:566-578 | nouveau (la baseline l. 125 évoquait l'alternative ridge sans voir l'identité) |
| M4 | MAJEUR | « spurious » est une classe résiduelle ; P4 ne teste pas la suppression des états de mélange revendiquée par l'original. | R:241-255 ; O:437 | nouveau |
| M5 | MAJEUR | La courbe en cloche (C2′) contredit la monotonie du noyau en t (ridge 2024 p.txt:333) ; non discuté. | C:180-193 ; médianes C2′ | nouveau |
| m1 | MINEUR | Baseline #10 « #87 non calculable » : faux à T = 0 (10/10 flags ok) ; l'article (double étiquette) a raison. | C:428-460 ; `data/nh01_correlated/summary.json` | **infirme** baseline #10 |
| m2 | MINEUR | #90 : la baseline compte 2 BLOQUANT, il y en a eu 5 sur 4 passes, tous déclarés corrigés ; le sweep ne traite pas la diagonale ; C1 grand N quasi garanti. | `scale.md` §11.1-11.4, l. 371-390 | **confirme** baseline l. 273/277 (pause) ; infirme le compte |
| m3 | MINEUR | Prénom « Ludovico » → Ludovica Serricchio. | `bibliography.bib:65` | nouveau |
| m4 | MINEUR | Éditeur : deux relecteurs demandés le 01/11 09:52 UTC, non traité. | issue ReScience/submissions #147 | nouveau |
| m5 | MINEUR | PR #5 ouverte (README). | `gh pr list` | confirme brief |
| m6 | MINEUR | Label « DOM: Machine Learning » vs domaine « Computational Neuroscience » des métadonnées. | `metadata.yaml:72` ; #147 | nouveau |
| m7 | MINEUR | Nom du modèle IA absent, alors que la note méthodo nomme Claude Fable 5.1. | `docs/ai_use.md` ; C:697-708 ; paper-methodo `00-agents.md:17` | nouveau |
| m8 | MINEUR | Le corps de #147 affirme que les attracteurs parasites sont « removed » : non mesuré (cf. M4). | issue #147 | nouveau |
| m9 | MINEUR | Seuils 0,9/0,8 différents entre T = 0 et T = 0,2 : rapports non comparables entre températures. | prereg confirmatoire:27 | nouveau |
| OK1 | OK | Formule J(t) vérifiée à la main ; limite projecteur. | C:12 ; O:413-434 | — |
| OK2 | OK | Paramètres Monte Carlo de l'original cités correctement. | C:43-48 ; O:964-993 | — |
| OK3 | OK | Tous les chiffres des tableaux recalculés (C1, C2′, C3′ = 0,9748 [0,9665 ; 0,9820], P4 51/320 et 318/320, corrélé, C4). | C:245-466 | — |
| OK4 | OK | 28 080 / 9 120 / 29 640 cellules ; bit-exact confirmé ; condensats des préregs = tags nerve-wml. | C:509-522 | confirme le brief |
| OK5 | OK | 8/8 références existent, attributions correctes. | `bibliography.bib` | — |

**Comptes : 1 BLOQUANT, 5 MAJEUR, 9 MINEUR, 5 OK.**

---

# Section 2 — paper-methodo-2026

## 0. En-tête

- Dépôt : `hypneum-lab/paper-methodo-2026`, clone `scratchpad/clones/paper-methodo-2026`, SHA **01d76c8bc0948dbcb581c9fe6e6923dad0489014**. Aucun tag.
- Lus en entier : `README.md` (59), `paper/manuscript.md` (88), `paper/sections/00-agents.md` (50), `03-chain.md` (346), `04-errata.md` (127), `docs/plan-2026-10-31.md` (126), `docs/plan-2026-10-31-v2.md` (240). Total 1 041 lignes.
- Recoupements : `git tag` sur les clones locaux (nerve-wml, kiki-flow, bouba_sens, dream-of-kiki, micro-kiki, rescience-nh01) + API GitHub pour les tags absents des clones ; `git show` des 13 commits de la Table 2 ; kiki-flow `docs/results/2026-10-30-m5-certify-verdict.md`, `ERRATUM.md`.
- Durée : partie de la même session (environ 1 h 30).

## 1. État des lieux (fait)

1. Note méthodo « Freeze, guard, null, amend » à l'état de **squelette** : manuscrit de 88 lignes, trois sections rédigées (00, 03, 04), §1-2 et §5-7 vides.
2. Deux PR fusionnées le 31/10 (déclaration IA ; plan v2). Cinq commits, tous du 31/10.
3. Table 1 (03-chain.md:84-107) : 22 tags de gel, 12 cellules « to verify ».
4. Table 2 (04-errata.md:25-57) : 31 revendications corrigées avec commit, date, détecteur.
5. Résumé (manuscript.md:10) : « at least twenty freeze tags, twelve amendments, twelve dated corrections », « seven repositories » ; le corps dit 22 tags, 15 amendements (03-chain.md:295-296), 31 corrections, cinq dépôts.
6. Déclaration IA : nomme « Claude Fable 5.1 » et Codex (00-agents.md:17, 31-33).
7. Cible envisagée : arXiv cs.LG / stat.ME (plan).
8. Les deux décisions PI vérifiées : E1-35B abandonné (manuscript.md:63), H14 non revendiqué — cohérent.
9. Le plan v2 (l. 181-210) contient 20 références résolues jamais passées dans le manuscrit.

## 2. Lecture du manuscrit, section par section

| Section | Condensé | Verdict |
|---|---|---|
| Résumé (manuscript.md:8-12) | Chaîne en quatre gestes ; comptes. | Comptes **incohérents** avec le corps (constat M3). |
| §1-2 (manuscript.md:14-30) | Plans de paragraphes ; Vaccaro 2026 distingué (agents sujets vs agents exécutants). | Distinction **vérifiée** sur le résumé arXiv:2606.11217. Travaux voisins quasi vides. |
| Règle de sélection (manuscript.md:48 ; README:28-31) | Études de cas = résultats rendus dans la fenêtre de la chaîne. | NH-01 a été rendu les 25 et 27/10 ; à vérifier contre la fenêtre déclarée (constat M5). |
| Études de cas (manuscript.md:49-63) | M5 FAILED 50/60 ; NH-01 « not computable, never 44× » ; E1-35B abandonné. | M5 **vérifié** (kiki-flow `docs/results/2026-10-30-m5-certify-verdict.md:9-13`). NH-01 **faux** (constat B1). |
| §00 Agents (00-agents.md) | Rôles Claude/Codex ; Codex aurait trouvé 7/31 corrections (l. 31-33). | Cohérent avec l'absence de Co-Authored-By dans les deux dépôts ; attribution 7/31 **invérifiable** sans les rapports Codex. |
| §03 Chaîne (03-chain.md) | Tag annoté + manifeste + SWHID ; gardes de lancement (écrites 23-27/10, l. 213-214) ; nul apparié ; règle « near-zero denominator → not computable » (l. 233-235) ; 15 amendements ; « NH-01 replicates … bit-exactly at two loads » (l. 340-342). | Tags **22/22 vérifiés** ; dernière phrase **fausse** (B1). |
| §04 Errata (04-errata.md) | Table 2 ; « Twenty-eight of thirty-one » datées 23-30/10 (l. 62-63) ; audit « thirteen » (l. 71-72) ; nuls « two (rows 10, 16) » (l. 87-89) ; interprétation (l. 95-97). | Comptes **faux** : 30/31 (seule la ligne 1 est du 2026-06-04), 12, 3 (ligne 14 oubliée). L'interprétation l. 95-97 (erreurs anciennes trouvées quand la chaîne force la relecture) est honnête et juste. |
| Plans (docs/) | v1 puis v2 ; v2:30 affirme que « M5 FAILED 50/60 » n'est pas dans les dépôts. | v2:30 **faux** (M5 dans kiki-flow). |

Groupe de Rome : aucun papier de Rome n'est nécessaire à une note méthodo ; seule la référence Fachechi 2019 est à compléter (NN 112, 24-40) et Kanter–Sompolinsky (PRA 35, 380). Aucun papier de Rome ne contredit ni ne devance la note.

## 3. Vérification

### 3.1 Table 1 — tags (fait)

- **22/22 tags existent** avec le commit indiqué (local + API pour les 5 tags micro-kiki NH-81 et `turing-strong-implicit` eee124f).
- `erratum-reruns-2026-10-24` (kiki-flow) est une ancre de provenance, pas un gel de préreg : le dire.
- **7 tags de gel absents** de la table, tous créés le 31/10 après midi : nerve-wml `prereg-nh01-diagonal-20261031`, `n10c-bis-g7-gb300-freeze-20261031` ; micro-kiki `nh81-gb300-freeze-20261031` (+ variante b), `demo-35b-gb300-freeze-20261031` (+ b ; démo, « not a scientific claim ») ; rescience-nh01 `arm-repro-gb300-freeze-20261031`. La table n'a pas d'heure de coupure.
- Le SWHID de NH-01 n'est pas enregistré dans nerve-wml mais l'est dans rescience `metadata.yaml:44-46` : la cellule « to verify » peut être fermée.

### 3.2 Table 2 — 31 corrections (fait)

- Commits existants et pertinents : ffee5d9, 01cefe4, cd61610, 784b4ca, 9a510ae, 1295160, 02c2407, 608e6d9, a3810cc, 17caed5.
- 42bc6bb : commit d'import du 28/10 ; le fichier d'erratum est daté du 23/10 → citer la date du fichier.
- Ligne 14 : 10c7b6e est le réentraînement d'avril, pas la correction.
- **Lignes 29-31** : ba8aa81 porte sur le brouillon SP6 ; la bonne correction est **abfb1a9** « docs(truth): correct Phase 1 gate verdicts », qui cite la revue Hypneum des 24-25/10 → détecteur « external review » douteux.
- Ligne 9 : datée 27/10 alors qu'ERRATUM §12 est daté 25/10 (`ERRATUM.md:485`).
- Ligne 19 : commit « to verify », non sourcée.
- Ligne 22 : « to verify » fermable (v1.10.0 sur Zenodo 10.5281/zenodo.23833431).

### 3.3 Références

Voir `refs/rescience-methodo-refs.md` §C-D : 4 OK (2 à compléter), 1 à remplacer (Gelman–Loken 2013 → 2014), 4 URL/identifiants internes non revérifiés ; 13 références manquantes résolues (Nosek, Chambers, Scheel, Pineau, van Miltenburg, Rougier, Kapoor, Lipton, Sandve, Peng, Forde, Lu, Di Cosmo).

## 4. Analyses

- **Publiable arXiv ?** Inférence : en l'état, non (squelette). Une fois rédigé, cs.LG est probablement reclassé par les modérateurs (pas de contribution ML) ; **cs.DL ou cs.SE** (primaire) avec stat.ME en croisé conviendrait mieux ; JOTE ou ReScience « editorial » sont des venues adaptées.
- **Ordres de grandeur** : 31 corrections en environ 8 jours de chaîne (23-31/10) sur cinq dépôts. Faits : 30/31 datées dans la fenêtre. Inférence : la note documente une **détection** (relecture forcée), pas une **prévention** ; aucune donnée avant/après ne montre que la chaîne évite des erreurs nouvelles. Le dire (l. 95-97 va dans ce sens).
- **Trois rapporteurs** : (1) méthodologue des sciences ouvertes : « N = 1 laboratoire, 8 jours, pas de groupe de comparaison ; présentez-le comme rapport d'expérience » ; (2) chercheur ML reproductibilité : « Situez par rapport à Pineau 2021, van Miltenburg 2021, Kapoor 2023 ; vos gardes de lancement sont la vraie nouveauté — montrez le code et un cas où elles ont bloqué » ; (3) relecteur pointilleux : « Vos comptes du résumé ne correspondent pas au corps, et votre propre étude de cas NH-01 contredit l'article qu'elle cite. »
- **Positionnement** : la nouveauté défendable = gardes de lancement automatiques (nerve-wml `campaign/guards.py`) + nuls appariés par inversion de signe + agents IA exécutants sous préreg (distinct de Vaccaro). Le jeu de données d'errata (Table 2) est le livrable le plus réutilisable (rejoint baseline l. 221/301).

## 5. Suppositions implicites et risque

| Supposition | Où | Risque |
|---|---|---|
| Les corrections ont été trouvées *grâce* à la chaîne | 04-errata.md:95-97 | Confusion détection/prévention ; un rapporteur demandera un contrefactuel. |
| La Table 1 est close | 03-chain.md:84-107 | Déjà périmée (7 tags) ; sans heure de coupure, elle le restera. |
| NH-01 est un succès de la chaîne (« bit-exact replication ») | 03-chain.md:340-342 | Faux : reproduction interne ; et l'ablation diagonale (B1 section 1) renverse le résultat principal. L'étude de cas phare devient un contre-exemple. |
| Les détecteurs attribués (Codex, revue externe) sont exacts | 00-agents.md:31-33 ; Table 2 | Au moins un mauvais commit (abfb1a9) ; attributions invérifiables. |
| « not computable » est la lecture officielle de m = 0,30 | manuscript.md:52 | L'article ReScience dit « enregistré confirmed / évaluation inconclusive » ; à T = 0 c'est calculable. |

## 6. Pistes d'utilité

1. Réécrire l'étude de cas NH-01 comme **exemple d'erreur trouvée après gel** (diagonale) : c'est plus fort pour la thèse de la note que le « bit-exact ».
2. Geler la Table 1 avec une heure de coupure, ajouter les 7 tags, distinguer gels de préreg / ancres de provenance / démos.
3. Recompter et générer les comptes du résumé depuis les tables (script), pas à la main.
4. Publier la Table 2 comme jeu de données (CSV + Zenodo) avec colonnes commit-fichier / commit-correction / détecteur sourcé.
5. Intégrer les 20 références du plan v2 ; viser cs.DL ou JOTE.

## 7. Constats

| # | Sévérité | Constat | path:line | vs baseline |
|---|---|---|---|---|
| B1 | **BLOQUANT** | NH-01 mal décrit : « replicates … bit-exactly at two loads » confond reproduction interne et réplication ; « not computable, never 44× » contredit l'article ReScience (double étiquette ; T = 0 calculable) ; et l'ablation diagonale (section 1 B1) n'est pas mentionnée. | 03-chain.md:340-342 ; manuscript.md:52 ; README.md:30 ; 03-chain.md:233-235 ; vs rescience C:428-460 | **nouveau** ; infirme la formulation baseline #10 reprise par la note |
| M1 | MAJEUR | Lignes 29-31 de la Table 2 : mauvais commit (ba8aa81 → abfb1a9) et détecteur « external review » douteux. | 04-errata.md:25-57 (l. 29-31 de la table) | nouveau |
| M2 | MAJEUR | Comptes faux dans le texte : « thirteen » → 12 ; « two (rows 10, 16) » → 3 (+ ligne 14) ; « twenty-eight of thirty-one » → 30. | 04-errata.md:62-63, 71-72, 87-89 | nouveau |
| M3 | MAJEUR | Résumé incohérent avec le corps (20/12/12/sept vs 22/15/31/cinq). | manuscript.md:10 ; 03-chain.md:84-107, 295-296 | nouveau |
| M4 | MAJEUR | Table 1 périmée : 7 tags de gel du 31/10 absents, pas d'heure de coupure, 12 cellules « to verify ». | 03-chain.md:84-107 | nouveau |
| M5 | MAJEUR | Règle de sélection des études de cas mal appliquée ou ambiguë (NH-01 rendu 25 et 27/10). | manuscript.md:48 ; README.md:28-31 | nouveau |
| M6 | MAJEUR | Thèse détection ≠ prévention ; environ 8 jours d'historique ; travaux voisins quasi vides ; classement cs.LG/stat.ME probablement refusé. | 04-errata.md:95-97 ; manuscript.md:14-30 | **confirme** baseline l. 221/301 (note méthodo + jeu d'errata) |
| M7 | MAJEUR | Attributions des détecteurs (7/31 par Codex, « external review ») invérifiables ou douteuses. | 00-agents.md:31-33 | nouveau |
| m1 | MINEUR | Dates : ligne 9 (27/10 vs ERRATUM §12 25/10), ligne 20. | 04-errata.md (Table 2) ; kiki-flow `ERRATUM.md:485` | nouveau |
| m2 | MINEUR | Ligne 22 « same erratum » et « to verify » fermables (Zenodo 23833431). | 04-errata.md (Table 2) | nouveau |
| m3 | MINEUR | Ligne 19 non sourcée. | idem | nouveau |
| m4 | MINEUR | Ligne 14 cite le commit d'avril (10c7b6e) au lieu de la correction. | idem | nouveau |
| m5 | MINEUR | Plan v2 « écart 1 » faux : M5 FAILED 50/60 est bien dans kiki-flow. | docs/plan-2026-10-31-v2.md:30 | nouveau |
| m6 | MINEUR | Références « à vérifier » résolubles (Fachechi, Kanter) ; Gelman–Loken 2013 → 2014. | manuscript.md:79-88 | nouveau |
| m7 | MINEUR | Harmoniser les noms de modèles IA entre la note (Fable 5.1) et rescience (aucun nom). | 00-agents.md:17 | nouveau |
| OK1 | OK | Déclaration IA cohérente avec git (pas de Co-Authored-By). | 00-agents.md | — |
| OK2 | OK | E1-35B abandonné ; H14 non revendiqué : cohérent avec les décisions PI. | manuscript.md:63 | — |
| OK3 | OK | 22/22 tags vérifiés avec commit. | 03-chain.md:84-107 | — |
| OK4 | OK | 13 commits de la Table 2 existent. | 04-errata.md:25-57 | — |
| OK5 | OK | M5 FAILED 50/60 sourcé. | manuscript.md:49 ; kiki-flow `docs/results/2026-10-30-m5-certify-verdict.md:9-13` | — |

**Comptes : 1 BLOQUANT, 7 MAJEUR, 7 MINEUR, 5 OK.**

---

## Non vérifié

- Cook et al. arXiv:2610.37139 (API arXiv vide deux fois).
- Rapports Codex du 25/10 : nécessaires pour vérifier les attributions de détecteurs.
- URL ReScience/JOTE/MLRC, DOI OSF et Zenodo internes, SWHID du manuscrit méthodo.
- Aucune exécution de code : les effets de la dynamique parallèle et des 3-mélanges sont des inférences.
- Reproduction ARM (tag `arm-repro-gb300-freeze-20261031`) non examinée.
- Revue baseline du 24/10 non relue en détail.
