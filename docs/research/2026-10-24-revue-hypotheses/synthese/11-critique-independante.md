# 11 — Critique indépendante du rapport-v2

Relecteur : Claude Opus 4.6 (remplacement du passage gpt-6-astra, quota épuisé).
Date : 24 octobre 2026. Méthode : vérification des affirmations *load-bearing* dans les dépôts (`repos/`), simulation indépendante du nul Me6, vérification de 15 références arXiv, comparaison avec le rapport Codex et les inventaires.

---

## Vérifications factuelles effectuées

| Affirmation | Résultat | Preuve |
|---|---|---|
| (a) `master_equation.py:101` passe `epsilon=self.h` sans `reg` | **CONFIRMÉ** | `:101 epsilon=self.h` ; `prox_w2:56` a bien un param `reg` mais non passé → fallback `:79 sink_reg = max(epsilon, 1e-3)` = 0,05 |
| (a') `FullJKOSolver.epsilon` jamais relu | **CONFIRMÉ** | `full_jko_solver.py:30 self.epsilon = epsilon` (=0,01) ; `paper_run.py:112,115` passe `epsilon=0.01` mais `JKOStep._step()` utilise `self.h` (=0,05) |
| (b) `query_accuracy(batch_size=64)` | **CONFIRMÉ** | `loop.py:310` |
| (b) Me6 = max \|off-diag\|, seuil 0,02, médiane par cellule | **CONFIRMÉ** | `aggregate_grid.py:28` (B3_ME6_THRESHOLD=0.02), `:127-162` (_compute_me6), `:219-223` (median > threshold) |
| (b) Nul simulé E[Me6 \| H0, n=64] ≈ 0,10–0,17 | **CONFIRMÉ** (simulation indépendante 10 000 réplicats, base_acc ∈ {0,2…0,9}) : E[Me6] = 0,100 (p=0,9) à 0,166 (p=0,5) |
| (b) Rapports JSON disponibles | **PARTIEL** : `v0.5_s14c_joint_aggregate.json` existe (median_me6=0,109, 30 cellules) ; les valeurs 0,148/0,141/0,141/0,313/0,445 proviennent de l'inventaire ADR-0008/-0009, non vérifiables dans un JSON versionné |
| (c) baby-brain README/ROADMAP « LP PASS » vs JSON false | **CONFIRMÉ** | `README.md:49` « LP PASS », `ROADMAP.md:190` « PASS » ; `2026-05-30-sp7-vizdoom-learning-curve.json:15` `gate_1b_lp_pass: false` |
| (d) N10-C A=16, K=4 | **CONFIRMÉ** | `stage2-manifest.md:59`, `test_comm.py:196`, `n10c-…-amendment-2026-10-23.md:70` |
| (d) N-3 ablation n_received=0, apply_consolidation=false | **CONFIRMÉ** | `ablation_n3_guard.json:26…156` (n_received=0 ×13) ; `ablation_n3_predictive.json:11…66` (apply_consolidation=false ×6) |
| (e) Absence Hopfield/Fachechi/Crick-Mitchison dans 3 dépôts | **CONFIRMÉ** | `grep -ri` sur *.py/*.md/*.tex/*.bib = 0 occurrence |
| (f) OSF Q6JYN = dream-of-kiki H1–H4 seulement | **CONFIRMÉ** | API OSF : titre « dreamOfkiki », description H1–H4 / mega-v2 / Studyforrest, aucune mention bouba/B-1/B-2/B-3 |
| (f) bouba_sens revendique Q6JYN | **CONFIRMÉ** | `CITATION.cff:16`, `README.md:79`, `.zenodo.json:28` |
| 15 références arXiv | **15/15 existent, titres cohérents** | curl arxiv.org/abs/ : titres vérifiés pour 2609.31630, 2609.27252, 2610.04226, 2610.04585, 2610.14409, 2610.15146, 2610.17434, 2610.18038, 2610.19210, 2610.20286, 2610.23718, 2610.31339, 2609.29755, 2610.10977, 2608.16025 |

---

## Constats BLOQUANTS (faux ou non étayé)

### B1. §9 (ligne 342) : la critique croisée gpt-6-astra est déclarée faite, mais rapport-v2 est byte-identique à rapport-v1

`diff rapport-v1.md rapport-v2.md` : aucune différence. §9 écrit : « *puis une critique croisée (gpt-6-astra) du présent rapport* ». C'est factuellement faux au moment de la publication : la relecture gpt-6-astra a échoué sur quota et n'a jamais produit de corrections. Le rapport ne peut pas affirmer qu'elle a eu lieu.

**Correction :** Remplacer la phrase par : « *puis une critique croisée prévue (gpt-6-astra) qui a échoué sur quota ; remplacée par un passage indépendant Claude Opus 4.6 (cf. annexe 11).* »

### B2. §0 et §2.4 : le verdict B-3 « compatible avec le bruit » est trop fort pour 2 mondes sur 5

Le rapport écrit « valeurs observées 0,14–0,15 » (§0) comme résumé. Les cinq valeurs per-monde sont 0,148 / 0,141 / 0,141 / **0,313** / **0,445** (Gauss/XOR/Sinu/mock/ECG, inventaire l. 84). Ma simulation indépendante donne :
- À p=0,5 (variance max) : P95 = 0,250 ; P99 = 0,297.
- Mock (0,3125) est au-dessus du P99 ; ECG (0,4453) est très au-dessus.

Le rapport conclut que B-3 « est l'espérance du maximum de dix bruits ». C'est vrai pour Gauss/XOR/Sinu, **pas pour mock ni ECG**. Le résumé §0 omet ces deux valeurs hautes, ce qui biaise le verdict global vers le négatif. L'action proposée (augmenter n) est juste, mais le lecteur doit savoir que 2/5 mondes survivent au nul *a priori*.

**Correction §0 :** « *valeurs observées : 0,14–0,15 sur les trois mondes synthétiques (Gauss/XOR/Sinu, dans la plage du nul), 0,31 et 0,45 sur mock et ECG (au-dessus du P99 ≈ 0,30), seuil 0,02 non comparé à un nul* ». **Correction §2.4 :** ajouter « *mock et ECG dépassent le P99 simulé ; le test par n croissant tranchera si ce signal est réel ou dû à des confondants (monde synthétique construit, propriétés spécifiques de l'ECG)* ».

---

## Constats MAJEURS (rework significatif nécessaire)

### M1. Simulation du nul Me6 : exactitudes de base non spécifiées

Le rapport dit « E[Me6 | n=64] = 0,10 à 0,17 *selon l'exactitude de base* » sans préciser quelles valeurs de p ont été simulées. L'agrégat JSON montre me1 ≈ 0,23 (proche du hasard pour 5 classes). Ma simulation à p=0,2 donne E[Me6]=0,133 ; à p=0,25, E[Me6]=0,144. La fourchette 0,10–0,17 est correcte en balayage large, mais le lecteur devrait connaître les exactitudes réelles des cellules. Manque de reproductibilité.

**Correction :** Ajouter à §2.4 les exactitudes de base simulées et les comparer aux me1 mesurés.

### M2. Implication de l'ablation N-3 sous-développée

Le rapport relève `n_received: 0` et `apply_consolidation: false` dans les JSON d'ablation mais conclut prudemment « à vérifier ». Or ces deux champs signifient que la consolidation était **éteinte** et qu'aucun message n'a été reçu : le Δ=0 est trivial (les conditions ablation et contrôle sont identiques). Le rapport devrait affirmer explicitement : « l'ablation N-3 ne teste pas l'invariant car les conditions actives sont désactivées ; les résultats sont non informatifs ».

**Correction :** Renforcer §2.2 avec : « *Avec `apply_consolidation: false` et `n_received: 0`, l'ablation mesure l'effet d'une modification sur un mécanisme inactif : Δ=0 est tautologique.* »

### M3. §2.3 : explication du biais ε techniquement imprécise

Le rapport écrit que le « rapport α = ε/τ vaut 1 au lieu de 0,2 » et qu'il y a un « terme diffusif parasite de poids 0,5 ». La chaîne réelle est plus subtile : `prox_w2` utilise `epsilon` comme force de rappel proximal ET comme régularisation de Sinkhorn (quand `reg=None`, `sink_reg = max(epsilon, 1e-3)` à la ligne 79). Le mélange de ces deux rôles (proximal vs. entropique) est le vrai problème. La PDE limite décrite n'est pas étayée par un calcul ; « poids 0,5 » n'a pas de source.

**Correction :** Remplacer « terme diffusif parasite de poids 0,5 face au prior KL de poids 1 » par la mécanique vérifiée : « *`prox_w2` utilise `epsilon` à la fois comme poids proximal et comme régularisation Sinkhorn (`reg=None` → `sink_reg = epsilon = h = 0,05`) ; les deux rôles sont confondus. La conséquence quantitative (sur la PDE limite) reste à dériver.* »

### M4. Valeurs per-monde de B-3 non traçables à un artefact versionné

Les cinq valeurs (0,148/…/0,445) sont tracées à « ADR-0008 :46, ADR-0009 :78 » dans l'inventaire, mais aucun JSON dans `reports/` ne les contient directement (`v0.5_s14c_joint_aggregate.json` donne une seule médiane 0,109). Les ADR sont des documents de décision, pas des artefacts reproductibles. Ce problème reprend un défaut transversal que le rapport lui-même signale (§2.7, point 3 : artefacts gitignorés) — mais il ne devrait pas le reproduire dans son propre verdict.

**Correction :** citer le fichier source exact ou noter l'absence : « *valeurs rapportées dans ADR-0008/-0009, sans artefact JSON commis correspondant* ».

### M5. §0 : « 57 confirmés dont les deux tiers descriptifs, mono-graine ou sur chemin rapide »

« Deux tiers » = ≈38 claims. Ce chiffre n'est ni justifié dans le corps ni croisé avec la table maîtresse (annexe 01). Le lecteur ne peut pas vérifier quels 38 claims sont visés.

**Correction :** Ajouter une note ou une colonne dans l'annexe 01 qui marque « descriptif / mono-graine / chemin rapide ».

---

## Constats MINEURS

1. **§5, ajout #2 (« registre de nuls comme produit »)** : c'est un conseil stratégique, pas un concept nouveau au même rang que les ajouts #1 (transaction) et #3 (lésion de substrat). Le présenter séparément (encadré « recommandation stratégique ») serait plus honnête.

2. **Anglicisme « claims »** utilisé 20+ fois en texte français sans italique ni guillemets. Uniformiser avec « affirmations » ou mettre systématiquement en italique.

3. **§3 reformulation #7** (JKO = flot de gradient de l'énergie libre) : c'est un résultat classique (Ambrosio-Gigli-Savaré 2005, Jordan-Kinderlehrer-Otto 1998). Le présenter comme une découverte des revues est injustement généreux envers les revues et injuste envers le chercheur (qui utilise déjà JKO). La reformulation utile est la lecture *comme thermostat* (ε/(2τ)), pas le fait que JKO est un flot de gradient.

4. **§7 plan d'action** : les durées sont optimistes et non justifiées. « Corriger epsilon : 1 h + 30 min calcul » sous-estime le temps de relecture/erratum/CI. « WML-JEPA : 1–2 semaines » pour porter un substrat et implémenter des stades développementaux est ambitieux.

5. **§1 table** : les totaux cochent (57+45+24+19+12+19 = 176 ≠ 180 ; il manque 4 lignes, probablement dues à des recouvrements amendé/confirmé). Ajouter une note sur la comptabilité.

6. **Ton** : le rapport est sévère mais jamais pompeux. La seule phrase trop indulgente est « L'avantage comparatif réel d'Hypneum est de produire des négatifs calibrés » (§5) — c'est vrai, mais cela masque que les négatifs calibrés sont surtout des retraits d'affirmations fausses antérieures, pas un choix méthodologique initial.

7. **Clarté pour un lecteur externe** : le rapport est remarquablement lisible pour sa densité. Deux points gêneraient un lecteur neuf : (a) la terminologie interne (DR-0, B-3, C+, Me6) n'est définie qu'implicitement ; un glossaire d'une dizaine de lignes aiderait ; (b) §3 saute de la table des reformulations aux « trois faits nouveaux » sans transition.

8. **§10 (second regard Codex)** : l'affirmation « aucune [référence] introuvable » pour Codex est la déclaration du rapport, pas une vérification de ce rapport-ci. (Confirmée par l'annexe 10, qui a vérifié.)

---

## Les quatre axes et les trois ajouts (§5)

**Bioélectricité, thermodynamique, conscience, maths structurales** : le traitement est équilibré. Le verdict « ne pas ouvrir conscience » est le plus solide (bien argumenté, interdiction lexicale justifiée). Les maths structurales comme prérequis est la recommandation la plus structurante. La thermodynamique en « annexe formelle » est un compromis sensé. La bioélectricité (NCA) souffre d'un manque de baselines citées (Lenia, GoL neural).

**Les trois ajouts de §5 :**
1. Transaction ACID — défendable et original. L'analogie n'est pas parfaite (durabilité ≠ conformité) mais le pont TLA+ est concrètement actionnable. **Solide.**
2. Registre de nuls comme produit — défendable comme recommandation, mais ce n'est pas un concept (voir mineur #1). **À reclasser.**
3. Lésion de substrat — le plus fort des trois. Expérience falsifiable, réunit deux dépôts, test unique de « substrat-agnostique ». **Fort.**

---

## Résumé chiffré

| Sévérité | Nombre |
|---|---|
| BLOQUANT | 2 |
| MAJEUR | 5 |
| MINEUR | 8 |

### Les 5 corrections les plus importantes

1. **B1** : §9 — retirer la mention de la critique gpt-6-astra comme effectuée ; la remplacer par la mention de la présente relecture.
2. **B2** : §0 et §2.4 — préciser que 2/5 mondes (mock, ECG) dépassent le P99 du nul ; le verdict « compatible avec le bruit » ne couvre que Gauss/XOR/Sinu.
3. **M2** : §2.2 — conclure explicitement que l'ablation N-3 est non informative (mécanisme éteint → Δ=0 tautologique).
4. **M3** : §2.3 — corriger l'explication du biais ε en décrivant la chaîne réelle (`reg=None` → fallback) ; retirer le « poids 0,5 » non sourcé.
5. **M5** : §0 — sourcer « deux tiers » à la table maîtresse ou retirer la fraction.
