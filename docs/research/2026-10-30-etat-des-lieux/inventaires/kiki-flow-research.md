# kiki-flow-research : inventaire et relecture critique (30/10/2026)

Clone examiné : `main` = `31feab6` (fusion de la PR #51, 29/10 19:12 CET), plus `prereg/m5-certify-rule` = `f2f146e` et le tag `prereg-m5-certify-20261030`, récupérés à part. Tout a été fait en lecture seule, sans calcul ni SSH. Les chemins sont relatifs au dépôt. `PREREG` désigne `docs/prereg/2026-10-30-m5-certify-reading-rule.md` (branche, pas sur `main`) et `VALID` désigne `experiments/implicit_jko_certified_validation_2026_10_27.py`. Les constats déjà présents dans la revue du 24/10 (non-réinjection, potentiels qui imposent la spécialisation, artefacts T3, NH-58) ne sont pas répétés, sauf quand leur statut a changé.

Légende : **BLOQUANT** / **MAJEUR** / **MINEUR** / **OK**.

---

## 1. État des lieux

### Fait (vérifié dans le dépôt)

| Date | Objet | Preuve |
|---|---|---|
| 24–25/10 | Balayage ε du gap « rigoureux » : 1,276 / 1,266 / 1,234 bits à ε = 0,01 / 0,02 / 0,05, contre 2,032 pour le chemin rapide. L'hypothèse « température Sinkhorn » est réfutée. | PR #27 (fusion `2db1c74`), `ERRATUM.md:419-484`, `results/eps_sweep_2026_10_25/` |
| 25/10 | Le chemin « rigoureux » n'est pas un pas JKO de F. Erreur relative W2 au minimiseur exact : 0,60 → 0,94 sur le cas quadratique quand h passe de 0,05 à 0,00625. | PR #40 (`175551c`), `docs/notes/2026-10-25-jko-step-identification.md`, `ERRATUM.md:485-570` |
| 25/10 | Pas JKO entropique de F avec `scheme` explicite (#45), balayage (#46), défaut entropique et métrique « excès sur Gibbs » (#47) | `5dc3aee`, `d81f7bb`, `1d148b7` ; `ERRATUM.md:571-602` |
| 26/10 | Préreg « strong-Turing » avec tag, puis run : verdict « soutenu à (5, 30) » | PR #48, tag `prereg-turing-strong-20261026` → `681c966` |
| 27/10 | Retrait : le pas explicite n'est pas dissipatif pour γ ≥ 10, donc le verdict de #48 est un artefact | PR #49, `ERRATUM.md:603-658` |
| 27/10 | PR #50 : Turing implicite par défaut, fusionnée 54 min après son ouverture, 0 revue GitHub | `49480e0` ; `gh pr view 50` |
| 27/10 | Revue Codex de #50 (B1, B2, M1–M6) ; recalcul arrêté à 17:40 ; 20 runs gardés sous `INVALID-nonconverged-fp/` (sur ES, pas dans le dépôt) ; le tag `prereg-turing-strong-implicit-20261027` marque un test jamais exécuté | `ERRATUM.md:700-745` |
| 28–29/10 | PR #51 : pas implicite **certifié** (Bregman-MM, recherche linéaire sur Q_h, deux résidus KKT, crochets OT certifiés). Quatre passes de revue Codex/Claude, hors GitHub (0 revue GitHub). CI `test (3.14)` verte. | `31feab6` ; `kiki_flow_core/master_equation.py:120-583` |
| 30/10 13:28 CET | Règle de lecture M5 : commit `f2f146e`, tag annoté (tagger 13:28:25 CET), PR #52 en **brouillon** créée à 12:28:41Z (horodatage serveur, tête inchangée) | `git cat-file -p 61dd69e` ; `gh pr list` |

### En cours (selon nos notes, non vérifiable ici)

- M5 `certify` : lancé sur electron-server le 29/10 à 18:13Z (une minute après la fusion), en phase `certify` depuis le 30/10 à 01:13Z (`PREREG:16-19`). Arrêt à 13:58 avec 13 lignes, puis reprise des configurations restantes sur macM3. **Aucun `certify.jsonl` n'est committé**, et `reference`, `operating` et `smoothing` n'ont aucun résultat dans `results/implicit_jko_certified_2026_10_27/` (seulement `b1_*`).
- Le préreg pilote Lie/Strang (4 cœurs) est **introuvable dans ce dépôt**. Seuls `ROADMAP.md` (S7) et un amendement nerve-wml mentionnent Strang. Non vérifiable.
- NH-60 (issue #31, ouverte) : non lancé. Le préalable « revisit NH-60 only after… » (`ERRATUM.md:569`) n'est pas levé.

### Bloqué / décisions PI en attente

1. **ERRATUM §16 toujours « PROPOSED »** et décrit la PR comme « draft, not merged » (`ERRATUM.md:702-703`, `:746`), alors que #51 est fusionnée et que le schéma est le défaut. Il manque une validation PI écrite. **MAJEUR**
2. Fusion de la PR #52, et dépôt OSF ou SWH de la règle M5. Aujourd'hui, l'horodatage indépendant n'est que la date de création de la PR GitHub. **MINEUR**
3. Le recalcul certifié du balayage, du run paper-scale et de la préreg (c) est estimé à 8–11 jours sur ES avec 4 workers (`ERRATUM.md:889-893`). Il est explicitement hors périmètre de M5 (`PREREG:68-71`).
4. Une version v0.14 du papier et de Zenodo est à décider (voir §2.5).
5. Issues périmées : #32 (réinjection, déjà faite par défaut depuis #47) et #29 (NH-58, tranchée par #27) restent ouvertes. **MINEUR**

### Où tourne le calcul

ES (Xeon X5680, nice 19, ≤ 4 workers) jusqu'au 30/10 à 13:58, puis macM3, d'après nos notes. Le pilote Lie/Strang n'a pas d'hôte vérifiable.

---

## 2. Relecture critique

### 2.1 Le nouveau pas est-il un vrai pas JKO ? **OK, avec réserves**

Oui, au sens d'un prox de F en géométrie W2 entropique, et non d'un prox KL euclidien :

- L'objectif est `Q_h(q) = F(q) + Σ_i OT_reg(q_i, ρ_τ,i)/(2h)`, avec un coût euclidien au carré sur le support (`master_equation.py:136-139` ; `wasserstein_ops.py:147`).
- Le prox KL de F n'intervient que comme brique interne du Sinkhorn généralisé de Peyré (2015), avec un poids `τ = 2h/reg` (`wasserstein_ops.py:148`, `:158`). C'est bien la forme `OT_reg + 2h·F` divisée par `reg`.
- La constante additive abandonnée dans `kl_prox_log` (`paper_f.py:189-194`) et la renormalisation `log_a − max` (`wasserstein_ops.py:159`) reviennent à ajouter un terme linéaire en la masse. Ce terme est constant sur le simplexe, donc le point fixe ne change pas. Vérifié à la main.
- Les termes non séparables (J_sym, Turing) sont relinéarisés au point courant, et l'algorithme ne s'arrête que si `T_0(q) = q` est vérifié à deux tolérances (TV < 1e-6 et log < 1e-5, `master_equation.py:548-561`). Avec un gradient exact, c'est la condition KKT de Q_h.

Réserves :

- **MAJEUR. Le certificat porte sur F_δ, pas sur F.** Le défaut `turing_smoothing = 1e-5` (`paper_f.py:69`, `:112-119`) change l'énergie, et l'entropie passe aussi de « plancher 1e-12 » à « 0 log 0 = 0 ». Tous les résultats committés restent sur l'énergie historique (`ERRATUM.md:803-816`). La borne 9,6e-5·γ (≈ 1e-2 à γ = 100) est petite devant les ΔQ observés (0,26 à (5, 30)). En revanche, toute comparaison entre schémas mélange deux problèmes.
- **MAJEUR. Stationnarité certifiée, optimalité non certifiée, et pas de référence indépendante dans le régime M5.** Q_h n'est pas convexe (Turing), et la doc le dit (`master_equation.py:177-179`). La vérification indépendante (L-BFGS-B + POT) ne tourne que sur [−0,5 ; 0,5], h = 0,2, coût/reg ≤ 25 (`VALID:83-85`). La PR #51 reconnaît qu'à coût/reg ≈ 400 et plus, les potentiels duaux ne sont pas identifiables. Or M5 tourne à coût/reg = 16/0,0025 = **6 400** (h = 0,05) et **25 600** (h = 0,025). Là, le certificat est celui de l'application du solveur sur elle-même. Le seul contrôle externe est `operating`, des transferts finis de 1e-4 qui ne prouvent rien (`ERRATUM.md:913-915`), et il n'a pas de résultat committé.
- **MAJEUR (hypothèse, non testée). Blocage sur la grille de 16 points.** Sur [−2, 2] avec 16 points, dx = 0,267 et dx² = 0,0711. Le noyau entre deux voisins vaut `exp(−dx²/reg)` : 4,6e-13 à h = 0,05 et environ 1e-49 à h = 0,025. L'OT est donc quasi discret et non régularisé, et son coût est **linéaire** dans la masse déplacée vers un voisin. Une zone morte apparaît : tout état où la variation de δF/δρ entre voisins reste sous dx²/(2h) est quasi stationnaire. Le seuil vaut **0,71** à h = 0,05 et **1,42** à h = 0,025, soit un rapport ρ_j/ρ_{j+1} décalé de Gibbs d'un facteur e^0,71 ≈ 2 sans que le pas bouge. À comparer à l'écart de potentiel entre bins, α·dx = 0,53 / 1,33 / 2,67 pour α = 2 / 5 / 10. L'ERRATUM a déjà vu ce « grid pinning » à 48 points pour h ≤ 0,0125 (`ERRATUM.md:558-559`). À 16 points, il se manifeste dès h = 0,05. La grille de 64 points du papier n'est pas concernée (seuil 0,04, reg/dx² = 0,62). Test peu coûteux, non lancé : partir de Gibbs (γ = 0, environ 4 s par pas), perturber par e^{±0,5}, itérer 20 pas, et vérifier si l'état revient.
- **MINEUR. Biais entropique non débiaisé** (`OT_reg(r, r) ≠ 0`, `master_equation.py:138-139`). Avec reg = h², le point fixe est un Gibbs à température 1 + O(h). La « Gibbs de référence » de l'excès devrait l'intégrer (c'est la piste R3-B2, désormais applicable au schéma par défaut avec α = h).
- **MINEUR.** Le gradient du terme de Turing utilise `np.gradient` à pas unité, sur des masses par bin (`paper_f.py:16-18`, `:133`). γ n'a donc pas le même sens sur 16 et sur 64 points.

### 2.2 Énergie, pas, convergence : contrôles ponctuels

- Le pas est `epsilon=self.h` dans le prox et `/(2h)` dans `_map` (`master_equation.py:381`, `:404`). C'est cohérent. **OK**
- L'arrêt sur `underflow` à 1e-280 (`:551-555`) fait que les états très creux échouent explicitement plutôt que silencieusement. **OK**. En revanche, les entrées de M5 sont des tirages Dirichlet(1) (`VALID:420-424`), pas les histogrammes de particules réinjectées du pipeline réel. Les cas avec des bins vides (`sparse_histogram`) n'apparaissent que dans `reference`. **MAJEUR** pour la portée de M5 (voir §3).
- Le message du commit `dd1efde` est périmé, mais l'ERRATUM le signale (`:897-899`). **OK**

### 2.3 Règle de verdict M5

- **Antériorité : OK.** `run_certify` soumet les jobs par γ décroissant (`VALID:553-559`) à un pool d'au plus 4 workers. Avec 13 configurations terminées, au plus 17 avaient démarré, toutes à γ ∈ {100, 70}. Aucune donnée à γ ≤ 30 ne pouvait donc exister sur ES à 12:28Z. Cela s'appuie sur la structure du code et sur `PREREG:16-19`. Il reste à confirmer que macM3 n'a rien lancé avant ce moment. Le tag (date locale) ne prouve rien seul ; la création de la PR #52 à 12:28:41Z est l'ancre serveur.
- **MAJEUR. La frontière des strates a été fixée après avoir vu les échecs à γ ≥ 70** (3 configurations certifiées sur 13). La règle le dit honnêtement, mais placer γ = 50 dans la strate descriptive, sans aucune donnée à 50, retire du critère la seule cellule où un excès positif avait survécu au contrôle α = 0, (5, 50) (`paper/main.tex:490-494`). Même un M5 « passed » ne rouvrira pas la question Turing fort.
- **MAJEUR. Fausse déclaration de provenance.** `PREREG:56` dit « Each record carries its platform », or `RUN_KEY` (`VALID:135-141`) ne contient ni hôte ni plateforme (grep `platform|host|uname` : aucun résultat). La mise en commun ES + macM3 devra s'appuyer sur la séparation des fichiers. Il faut amender avant de mettre en commun. De plus, l'ERRATUM note des trajectoires qui diffèrent jusqu'à 5e-3 d'une machine à l'autre (`ERRATUM.md:832-835`). Près des seuils, l'hôte peut changer un statut.
- **MAJEUR, potentiellement BLOQUANT pour le verdict. Arithmétique de couverture.** La grille compte 96 configurations et une configuration absente compte comme non certifiée (`PREREG:56-58`). Nos notes donnent 13 sur ES et 37 relancées sur macM3, soit 50. Les 46 restantes, dont les γ ∈ {0, 5, 10}, sont-elles planifiées ? Si non, le verdict principal est mécaniquement `failed`. Ce n'est pas vérifiable depuis le dépôt.
- **MINEUR.** La règle ne dit pas quoi faire des doublons : un `job_error` sans clé `alpha/gamma` sera relancé à la reprise (`VALID:548-551`), ce qui produit deux lignes pour une configuration. L'heure de décision « 13:30 » est postérieure à celle du commit, 13:28:19.

### 2.4 PR fusionnées sans revue

Aucune des PR #40 à #51 n'a de revue GitHub. Délais entre ouverture et fusion : 9 min pour #45 (le correctif du cœur JKO), 14 min pour #46, 9 min pour #48 (données de la préreg), 54 min pour #50 (défaut implicite, ensuite invalidé). La PR #51 a eu quatre passes Codex/Claude documentées dans le corps de la PR, mais **les trois derniers commits** (`82f1c7a`, `521b1fb`, `cd61610`, bornes d'arrondi des crochets OT) précèdent la fusion de 4 à 13 minutes, et rien ne montre qu'ils aient été relus. Le schéma par défaut a donc changé deux fois en 48 h sans revue enregistrée. **MAJEUR** (processus) : la règle « fusion sur revue + CI verte » n'est appliquée qu'à moitié (la CI était verte).

### 2.5 Papier v0.13 / Zenodo face au code

- Le tag `paper-v0.13-draft` pointe sur `c484b7d` (25/10 00:49), avant les §11–16. `main.pdf` a été reconstruit pour la dernière fois à `a09492a` (24/10). Le dépôt Zenodo 10.5281/zenodo.23636477 (CITATION.cff:37-38) archive donc un texte qui appelle « rigorous JKO path » un schéma qui n'est pas un pas JKO (§12), avec seulement les §1–10 de l'ERRATUM. **BLOQUANT pour toute diffusion ou citation externe** tant qu'une v0.14 ou une note Zenodo n'existe pas.
- `paper/main.tex` sur `main` (une seule retouche depuis v0.13, `137331b`) :
  - l. 20 et l. 24 : « implicit JKO step » et « full entropic-Wasserstein JKO path, 13 min » renvoient au split historique ;
  - l. 27-34 : 2,72 / 3,53 bits viennent du schéma **explicite**, plus le défaut ; « small positive excess… γ ≥ 20 » est retiré par le §14 ;
  - l. 340-345 : le « rigorous path with the full JKO scheme » n'est pas amendé comme le demande le §12 ;
  - l. 466-497 : paragraphe d'excès, explicite, γ ≥ 20 non interprétable ;
  - l. 578 : « decreases monotonically… consistent with the JKO scheme's descent property », dit d'un schéma non JKO ;
  - l. 801 : surrogate T3 distillé du chemin historique ;
  - l. 840-862 : préconditions de propagation du chaos calculées sur l'ancienne énergie ;
  - l. 951-959 : conclusion.

  **MAJEUR.** Les sections restées valides : finding négatif sous potentiels plats, latence T3, et la conclusion qualitative « pas d'excès au-delà de Gibbs à γ ≤ 5 », qui reste à requalifier sous le schéma certifié (décalage attendu de −0,02 à −0,04 bit, `ERRATUM.md:689-690`, mesuré avec le #50 invalidé).

---

## 3. Analyses : ordres de grandeur

**Ce que M5 peut décider.** M5 teste la **fiabilité du solveur**, pas une hypothèse scientifique.

- S'il passe (60/60), la borne supérieure à 95 % du taux d'échec est ≈ 3/60 = 5 % par configuration, ou ≈ 3/180 ≈ 1,7 % par pas (règle de trois). Les configurations sont corrélées par α et h, donc c'est optimiste.
- Le recalcul du balayage demande environ 330 runs × 30 pas lents ≈ 10⁴ pas. À 1,7 % d'échec par pas, cela fait encore jusqu'à environ 170 pas non certifiés. **M5 ne garantit pas la faisabilité du recalcul.**
- 3 pas depuis un tirage Dirichlet ne couvrent ni les trajectoires longues, ni la grille 64, ni les histogrammes réinjectés. **MAJEUR**
- Puissance contre un solveur médiocre : avec p = 0,95 de succès par configuration, P(passed) = 0,95⁶⁰ ≈ 0,05. Le test est sévère, et c'est bien.

**Strate de stress.** 3 configurations certifiées sur 13, soit 23 %, à γ ∈ {70, 100}. C'est descriptif, mais cela annonce déjà que le schéma ne sert à rien au-delà de γ ≈ 50 sans changement de budget.

**Coût CPU (estimations, base : B1 et horaires du PREREG).**

- ES : 13 configurations en ≈ 11,25 h avec 4 workers, soit ≈ 3,5 worker·h par configuration à γ ≥ 70.
- Strate principale : à γ ≤ 30, un pas coûte 4 à 440 s (B1), soit au plus ≈ 22 min par configuration, et 60 configurations font ≤ 22 worker·h (≈ 6 h sur 4 cœurs).
- Reste de la strate de stress : 23 configurations × 3,5 h ≈ 80 worker·h.
- **L'analyse secondaire est le poste le plus lourd** : budgets ×5 en interne et ×4 en externe. Pour environ 30 configurations en échec, cela donne jusqu'à ≈ 30 × 14 h ≈ 400 worker·h, environ 4 jours sur 4 cœurs, sans critère d'arrêt déclaré. **MINEUR**, mais à cadrer.
- Recalcul du papier : 8–11 jours sur ES (ERRATUM).

**Couche « rapide ».** Avec les paramètres par défaut (`noise_scale` 0,05, `dt_fast` 1e-3, `N_FAST` 200 : `mlx_particle_simulator.py:34,59`, `multiscale_loop.py:113`, `rigorous_specialisation_2026_10_24.py:46`), l'écart-type de déplacement d'une particule par pas lent vaut √(200·1e-3)·0,05 ≈ **0,022**, soit environ 8 % d'un bin (0,267). Avec 500 particules, soit environ 125 par espèce, le biais de l'entropie plug-in vaut ≈ (16−1)/(2·125·ln 2) ≈ 0,09 bit, du même ordre que le gap témoin α = 0 de 0,17 à 0,22 bit. La « dynamique multi-échelle » à 16 points se réduit à des pas JKO itérés plus un bruit de ré-échantillonnage. **MAJEUR** pour l'interprétation (voir §4).

---

## 4. Suppositions

- **La conjecture « un seul flot » est non établie et le code l'affaiblit.** La critique astra B5 tient toujours. S'y ajoute ce qui suit : le système simulé est un splitting (mouvement brownien sans dérive, réinjection multinomiale, JKO de F_δ espèce par espèce, dérive J_asym optionnelle non gradient, `paper/main.tex:887-896`). Aucun résultat ne montre que la composition approche *un* flot de gradient de *une* énergie. À reformuler en question explicite (générateur limite du splitting) ou à abandonner. **MAJEUR**
- **La spécialisation serait-elle un artefact du schéma ?** Trois explications plus simples doivent être éliminées avant d'invoquer une « spécialisation » :
  - (a) les potentiels l'imposent (déjà acté par l'excès sur Gibbs) ;
  - (b) un **blocage de grille**, qui fige les états sous Gibbs, ce qui est compatible avec « l'excès est négatif, on approche l'équilibre par en dessous » (§2.1) ;
  - (c) un **biais de ré-échantillonnage** des particules, compatible avec le gap témoin α = 0 (§3).

  L'excès de −0,39 bit à (10, 0) peut venir de (b) + (c) sans aucune dynamique « intéressante ». Test discriminant : refaire la mesure à 32 et 64 points, avec N = 500 et 5 000 particules, et vérifier que l'excès tend vers 0. **MAJEUR**
- **Les excès à γ fort** relèvent, outre le défaut de dissipation (§14), du lissage δ et de la grille (Turing à pas unité). Il ne faut pas les rouvrir avant que le test du blocage soit fait.
- **NH-60 (coarsening en t^{1/3})** n'est pas testable sur 16 ou 64 points avec ce schéma, à cause du blocage et faute d'énergie interfaciale. Il faut d'abord redéfinir l'énergie, ce qui est acté.

---

## 5. Pistes d'utilité hors labo, et ce qu'il faudrait arrêter

**À valoriser**

1. **Une note méthodologique « certifier un pas JKO entropique » (forte valeur).** La chaîne de défauts documentés forme un catalogue rare de pièges reproductibles, chacun avec un test de non-régression : prox ignorant la référence, ε et `max_iter` non transmis, split ≠ JKO, linéarisation non dissipative, point fixe non convergé accepté, faux stationnaire en TV absolue, crochet OT perdu par annulation. Le format visé est un article court ou un rapport technique. C'est cohérent avec la roadmap, qui prévoit une note méthodologique « nuls + errata » comme premier papier. La rédaction peut commencer sans calcul neuf.
2. **`entropic_ot` certifié et `objective_bounds`** (`wasserstein_ops.py:534`, `master_equation.py:406-443`) : un encadrement certifié de OT_reg, utile hors labo pour qui valide un solveur Sinkhorn. On peut l'extraire en petit module avec ses tests.
3. **DriftTrigger** (`track1_perf/trigger_heuristic.py:32`) : un hystérésis avec cooldown et état persistant, propre mais banal. Sa calibration reste synthétique (AR(1)) ; l'utilité est faible tant qu'il n'est pas calibré sur les taux Aeon réels. **MINEUR**
4. **« Solveur JKO MLX » : à ne pas présenter comme tel.** MLX ne sert qu'au split historique, qui n'est pas JKO (`full_jko_solver.py:78-81` ; PR #51 : « MLX is used by the legacy split only »). Le solveur certifié est en NumPy/POT et tourne sur CPU. Un portage MLX du solveur certifié serait un projet neuf. **MAJEUR** si l'idée est mise en avant comme acquise.

**À arrêter ou geler**

- Toute nouvelle préreg ou tout balayage à γ ≥ 10 sur la grille de 16 points, tant que le test du blocage n'est pas fait.
- NH-60 et NH-59 sous l'énergie actuelle.
- Le pilote Lie/Strang tant que le lien opérateurs–générateurs n'est pas écrit (astra, splitting). De plus, sa préreg n'est pas dans ce dépôt.
- L'analyse secondaire M5 sans plafond de temps.
- Le recalcul du papier (8–11 jours) **avant** la décision sur la grille, puisque c'est 64 points qui compte pour le papier.
- Le surrogate T3 tant qu'il est distillé du chemin historique.
- La branche `exp/implicit-recompute` et le tag `prereg-turing-strong-implicit-20261027` : à marquer clairement comme obsolètes.

---

## Résumé (≤ 250 mots)

1. **BLOQUANT.** Le DOI Zenodo 10.5281/zenodo.23636477 (tag `paper-v0.13-draft` = `c484b7d`, PDF de `a09492a`) publie encore le split non JKO sous le nom « rigorous JKO path », sans les §11–16. Sur `main`, `paper/main.tex:20-34, 340-345, 466-497, 578, 801` reste périmé (2,72 bits explicites, excès γ ≥ 20 retiré).
2. **MAJEUR.** Le nouveau pas est bien un JKO entropique de F (`master_equation.py:136-139`, `wasserstein_ops.py:147-158`). Il porte sur F_δ et certifie une stationnarité sans référence indépendante à coût/reg = 6 400–25 600. **Hypothèse non testée** : sur 16 points, une zone morte de grille (seuil dx²/2h = 0,71 / 1,42) pourrait expliquer l'excès négatif sur Gibbs. Un test de 20 pas à γ = 0 suffit à trancher.
3. **MAJEUR.** La règle M5 (`f2f146e`, PR #52 brouillon, créée à 12:28:41Z) précède bien toute donnée à γ ≤ 30. Mais la coupure à 30 a été choisie après les échecs à γ ≥ 70, ce qui exclut (5, 50). La phrase « Each record carries its platform » est fausse (`VALID:135-141`). 13 + 37 = 50 configurations sur 96 : si les autres ne tournent pas, le verdict sera `failed` d'office.
4. **MAJEUR.** M5 (3 pas, Dirichlet, grille 16) ne garantit pas le recalcul : même à 1,7 % d'échec par pas, environ 170 pas sur 10⁴ échoueraient. L'analyse secondaire coûte environ 400 worker·h sans plafond.
5. **MAJEUR.** Les PR #45, #48 et #50 ont été fusionnées en 9–54 min sans revue. Les trois derniers commits de #51 ont été fusionnés 4–13 min après leur écriture. `ERRATUM.md:702,746` dit encore « PROPOSED / not merged ».

Fichier : `/private/tmp/claude-501/-Users-electron/0f498106-d704-4923-a519-0570c7642247/scratchpad/inventory/kiki-flow-research.md`
