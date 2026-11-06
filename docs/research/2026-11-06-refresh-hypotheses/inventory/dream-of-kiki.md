# dream-of-kiki — refresh du catalogue des hypothèses (2026-11-06, soir)

*Dépôt `hypneum-lab/dream-of-kiki`, clone frais `--depth 300` dans `refresh-hyp/repos/dream-of-kiki`, `main` = `365bf14` (fusion PR #91, 2026-11-06). PR #92 lue au head `9333898` (brouillon, `gh pr view/diff 92`, branche récupérée en `pr92`). Baseline : `.github` `c8967a2`. Chemins : `dok/` = clone dream-of-kiki ; `cat` = `.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` ; `veille` = `.github/docs/research/2026-11-02-veille-theses/these-dream-of-kiki.md` ; `brainstorm` = `.github/docs/research/2026-11-01-analyse-profonde/brainstorm-dream-of-kiki.md` ; `inv0111` = `.github/docs/research/2026-11-01-analyse-profonde/inventaires/dream-of-kiki.md` ; `RM` = `.github/docs/ROADMAP.md`. Aucun calcul lancé ; seule arithmétique : différences de moyennes appariées déjà publiées. Identifiants : `resolve-dream-of-kiki.tsv` (13 résolus, 1 non résolu : OpenReview O2IGIHRtWc).*

**Règle de lecture.** Rien de ce qui suit n'est confirmatoire. E1-small est entièrement exploratoire depuis le 31/10 (`dok/docs/osf-amendment-e1-small-2026-10-30.md:98-108`). Les contrôles de #92 sont « exploratoires et informés » (`pr92:docs/osf-addendum-e1-small-controls-2026-11-06.md:21-35`) et ne sont pas terminés : aucune de leurs valeurs n'est lue ici.

---

## 0. Ce que rapporte l'analyse E1-small (PR #91), exactement

Faits (`dok/docs/results/2026-11-06-e1-small-analysis.md`, abrégé `ana`) :

- Complétude : 9 profils enregistrés × 141 graines = 1 269 cellules complètes ; le bras exploratoire `p_ctrl_lr_matched` s'arrête à 2/141 sur `math domain error` dans `choice_kl`, fin le 2026-11-01 à 20:20:33 CET, `rc=1`, 1 271 cellules (`ana:44-54`). Intégrité : 0 violation d'invariant, un seul `code_commit` `e93ea81`, `n_eval = 162` (`ana:56-62`).
- Porte d'apprentissage : Δ > 0 avec p d'inversion de signe 1,0·10⁻⁴ pour tous les profils de rejeu sauf `p_ctrl_sft` (Δ −0,0004, p = 0,62) ; Δ par profil : `p_min` +0,057, `p_equ` +0,063, `p_ctrl_vanilla_replay_tuned` +0,063, OPR +0,045, `p_max` +0,037, template +0,013, shuffle +0,013 (`ana:153-162`).
- **H14-A** (`p_min` − `p_ctrl_template`, supériorité) : D̄ = +0,0432, [L, U] = [+0,0383 ; +0,0481], D_s > 0 sur 131/141 graines ; état du code enregistré SUPERIOR ; nul apparié P99 +0,0097, p = 1,0·10⁻⁴, taux de passage du seuil sous H0 1,6 % (α ≈ 1,7 %) ; formulation « va dans le sens de », réserves : format et contenu de réponse non séparés, bras `p_min` connu du PI avant la fin du run, contrôle « options seules » non calculé (`ana:164-186`).
- **H14-B** (`p_equ` − `p_ctrl_vanilla_replay_tuned`) : D̄ = −2·10⁻¹⁸ (somme des écarts en items exactement 0), [L, U] = [−0,0018 ; +0,0018] ; état BOUNDED-NO-GAIN ; nul p = 0,52 ; discordance post 0,016, 13/141 graines à réponses post identiques ; classé « contrôle à faible pouvoir de falsification » (`ana:188-214`).
- **H14-C** (`p_equ` − OPR, non-infériorité à δ = 0,01) : D̄ = +0,0187, [L, U] = [+0,0129 ; +0,0245] ; état NON-INFERIOR ; nul (H0 μ = −δ) p = 1,0·10⁻⁴ ; réserve : OPR reçoit moins de jetons de mise à jour (comparaison à calcul total égal, pas à jetons de mise à jour égaux) (`ana:216-235`).
- Aucun titre conjoint ; le « J2 » imprimé par le script est écarté (`ana:237-240`).
- Signature de défendabilité `dream > sft > shuffle ≈ noise` **non observée** (`sft − shuffle` = −0,0134) (`ana:244-255`).
- Bras de même norme et « options seules » non calculés ; encadrement ρ ∈ [8,321 ; 8,328] contre ‖θ_r − θ₀‖ ≈ 0,325, rapport ≈ 25,6 (l'amendement annonçait ≈ 35) (`ana:270-293`).

**Ce que l'ordre des phases donne : rien, par construction.** Faits : dans E1-small, les opérations sont appliquées dans un ordre fixe après le rejeu (DOWNSCALE puis RESTRUCTURE), et RECOMBINE est « a weight-neutral no-op on this backend » (`dok/scripts/e1_harness.py:214-223`) ; RESTRUCTURE est l'échange de deux blocs adjacents, évalué puis annulé (`dok/scripts/pilot_cycle3_cuda.py:463-484`, `dok/scripts/e1_harness.py:267-268`) ; aucun profil ne permute l'ordre (`dok/scripts/e1_profiles.py:52-57,135-141`). Il n'y a donc ni phase REM-like, ni manipulation d'ordre. Ce qu'E1-small donne sur la **composition cumulée à ordre fixe** (arithmétique sur les contrastes secondaires appariés contre le même contrôle, `dok/docs/results/2026-11-06-e1-small-decision.json`, champ `secondary`) : `p_equ − p_min` = 0 − (−0,0069) = +0,0069 (confondu avec le réglage : `p_min` tourne au réglage par défaut (1e-4, 5), `p_equ` au réglage sélectionné (3e-4, 2), `dok/scripts/e1_profiles.py:41,121-123`) ; `p_max − p_equ` = −0,0263 − 0 = −0,0263 (RESTRUCTURE dégrade) ; bornes de ces différences non dérivables sans recalcul. Inférence : l'ordre descriptif `p_equ ≈ vanilla réglé > p_min > p_max` ne suit pas l'ordre DR-4 `P_max ≥ P_equ ≥ P_min`, comme G4-ter/quater (`cat:73-74`) ; ce n'est pas un test (aucun test d'ordre n'est enregistré dans la préreg E1-small).

---

## 1. Lignes du catalogue touchées

| Identifiant (ligne `cat`) | Statut v2 | Proposition | Nouvel énoncé si reformulé | Preuve | Effet sur le trimestre |
|---|---|---|---|---|---|
| **DOK-H14** (A l.97 ; C l.33) | exploratoire ; « apport = réplication de l'ordre des phases NREM/REM » | **fermer** comme hypothèses de la campagne E1-small (analysées selon la préreg) ; **retirer** l'étiquette « réplication de l'ordre des phases » | « H14-A/B/C : lues selon la préreg gelée, toutes exploratoires (PR #91) ; A et C vont dans le sens des lectures préenregistrées, B est borné sous δ par un contraste peu sensible. E1-small ne contient ni phase REM-like ni manipulation d'ordre. » | `ana:164-235,302-313` ; `dok/scripts/e1_harness.py:214-223` ; amendement `:98-108` | Ferme une ligne de « verdicts rendus » (`RM:197`) ; la ligne d'heures « relecture PI du rapport » (`RM:79`, 1 h) devient « fait » ; aucune heure de calcul ajoutée hors #92 |
| H14-A seule | (dans DOK-H14) | **fermer** (lecture exploratoire faite) ; suite possible = DOK-N1 (§2) | — | `ana:180-186` ; réserve format/contenu prereg `:150-156` | 0 h ; DOK-N1 seulement après M3 |
| H14-B seule | (dans DOK-H14) | **fermer après #92** (fin prévue 07-08/11) : négatif exploratoire à faible sensibilité | « DOWNSCALE ×0,99 après rejeu réglé sur Qwen3.5-4B : apport < δ, contraste peu sensible (discordance 0,016) ; aucune lecture attribuable au contenu de DOWNSCALE (règle de la déclaration du 02/11, signée 06/11 13:17) » | `ana:188-214,270-282` ; `dok/docs/osf-declaration-h14b-same-norm-control-2026-11-02.md:134-139,206-207` | ≈ 3 h humaines de lecture de #92 (S2-S3) ; GPU KXKM déjà engagé 28-49 h (`pr92:…addendum…:281-284`) |
| H14-C seule | (dans DOK-H14) | **fermer** (lecture exploratoire faite) | portée écrite : « non-infériorité à calcul total égal, pas à jetons de mise à jour égaux » | `ana:230-235` | 0 h |
| DOK-E1 (A l.93) | inchangé ; « remplacé par préreg H14 » | **fermer** : étude 35B abandonnée le 30/10 | — | amendement `dok/docs/osf-amendment-e1-small-2026-10-30.md:82-90` (§2bis, décision 35B retirée) | 0 h |
| **DOK-DR2** (A l.59 ; C l.34) | reformulé — propriété sous précondition [P] | **reformuler** (précondition sur l'état, pas sur le mot) ; **aucune nouvelle ligne** | « Pour tout mot ω dont chaque préfixe laisse l'état dans le domaine de l'opération suivante [P_S], (C), (B) et (F) tiennent par définition de φ. [P] (aucun RESTRUCTURE avant REPLAY) est le cas particulier de [P_S] sur le substrat MLP MLX à entrée (2, 4). » Nature : définition + test de conformité par substrat, pas théorème ni hypothèse | `dok/docs/proofs/dr2-compositionality.md:23-38,118-135` ; `dok/docs/specs/amendments/2026-04-21-dr2-empirical-falsification.md:29-37,52-60` ; non-clôture `.github/…/README.md:56` (B1) | 1 h de texte (Paper 1, refonte Q2, `RM:159`) ; correctif de code ci-dessous |
| DOK-DR2p (A l.60) | inchangé | **garder** | — | contrat effectivement utilisé (E1-small, G4) : ordre canonique fixe `dok/scripts/e1_harness.py:214-223` | 0 h |
| **DOK-DR4** (A l.62 ; C l.34) | reformulé — garantie d'espace de recherche | **reformuler** en écrivant les trois préconditions ; **une ligne candidate** DOK-N2 (§2), reportée | « DR-4.L : si (a) P_min satisfait les invariants sur S, (b) la métrique est monotone en capacité, (c) le profil riche peut désactiver ses opérations et canaux supplémentaires, alors best(P_equ, S) ≥ best(P_min, S). (c) est faux pour les profils d'exécution, qui appliquent toujours leurs opérations (E1-small : `p_max` applique toujours RESTRUCTURE). La garantie porte donc sur l'espace de configurations à opérations optionnelles, pas sur les profils figés ni sur l'espérance. » | `dok/docs/proofs/dr4-profile-inclusion.md:62-82` ; `dok/scripts/e1_profiles.py:139-141` ; constat C3 `.github/…/README.md:151` | 1 h de texte ; DOK-N2 après M3 |
| **recombine = séparation de mélanges** (C l.32) | réplication inter-substrats ; GENIAL = axiomatisation | **requalifier en non-test** ; garder une seule variante neuve (DOK-N4), reportée | « dream-of-kiki n'a jamais montré de séparation de mélanges : RECOMBINE est un no-op sur le substrat E1 et un canal vide (non-rejets) sur G4-quater…septimo. L'énoncé est une interprétation, à positionner après Agliari 2012 et 2501.16789. » | `dok/scripts/e1_harness.py:215` ; `cat:75,77-79` ; Agliari 2012 résolu (Crossref) mais lu en résumé seul (`brainstorm:11`) ; O2IGIHRtWc **non résolu** (ne tranche rien) | 0 h ; DOK-N4 ≈ 2-8 h CPU après M3 |
| DOK-H6C, DOK-G4qC/quC/s (A l.75-79) | inchangé (nuls par non-rejet) | **garder** ; ajouter « non-test de la séparation de mélanges » en note | — | idem | 0 h |
| **NH-91** « quand dormir » (B l.333 ; C l.35) | utile, sous verrou ; section de la note méthodo, pas de run | **garder comme section de la note** ; **absorber NH-13** ; pas d'hypothèse ce trimestre | Section : « une comparaison de déclencheurs n'est informative que si le budget est défini par l'histoire des mises à jour et la norme de changement, et si la position moyenne des écritures est appariée ; sur substrat non agent, l'effet de récence mesuré (NH-03 différé) domine sinon toute différence de déclencheur. » | 3gCeBuNNyT résolu par `notes/search` (PDF toujours en 403 : **à recouper**) ; arXiv:2610.36109 résolu ; `dok/docs/results/2026-10-30-nh03-deferred-eval.md:1-45` (R_d3 = +14,65 [+13,77 ; +15,51], 24 écritures fixes) ; `veille:25,71-72,88` | 4 h en S6 (`RM:97,103`), inchangé |
| **NH-13** déclencheur endogène (B l.255) | inchangé (SPÉC) | **reformuler par fusion dans NH-91** (dual coût de la même comparaison) ; ne pas fermer | « NH-13 = face coût de NH-91 : à rétention égale, nombre de DE ; même dessin, même antériorité (3gCeBuNNyT compare déjà exactitude et coût, point Pareto 49,7 ACC à 51 % des jetons, `veille:38`). » | `veille:38` (résumé moteur) | 0 h (supprime une ligne SPÉC) |
| NH-03 du 24/10 (B l.245) | reporté après M3 | **garder** ; ajouter arXiv:2610.36109 comme mise en garde sur « FLOPs égaux » | — | `veille:72` | 0 h |
| **NH-06** (B l.248) | inchangé (PRÊT G4-nono) | **garder**, inchangé | — | rien de nouveau depuis le 02/11 ; H12 G4-nono toujours brouillon (`cat:95`) | 0 h |
| **NH-07** (B l.249) | reporté après M3 | **garder** | — | spec §5.3 | 0 h |
| DOK-H13 (A l.96), NH-25 (B l.267) | utile, sous verrou | **garder** | — | rien de nouveau | 0 h |
| DOK-CPU (A l.89) | inchangé (non concluant) | **garder** ; c'est la seule mesure d'effet d'ordre du dépôt (stubs) → base de DOK-N3 | — | `cat:89` | 0 h |
| NH-01 (B l.243) | artefact plausible | **garder** ; citer Kubo et al. (contrôle de même total) | — | `veille:41,73` ; DOI 10.64898/2026.10.11.757684 résolu | 0 h |
| NH-02, NH-04, NH-05, NH-08 à NH-12, NH-14 à NH-26, NH-42, NH-54, NH-85 (B, colonne « dream-of-kiki ») | divers | **inchangé** : aucune évidence du 03-06/11 ne les touche | — | `git log --since=2026-11-02` sur `dok` : seuls #88, #90, #91 (déclaration, bibliographie, analyse E1) | 0 h |
| DOK-DR0/DR1/DR3, DOK-C1/C3, DOK-PB*, DOK-G4*, DOK-G5*, DOK-G6*, DOK-Q2, DOK-SYN, DOK-W3b, DOK-RT, DOK-R1, DOK-H12 (A l.57-95) | divers | **inchangé** | — | idem | 0 h |

---

## 2. Nouvelles hypothèses à poser (numérotation provisoire DOK-N*)

Aucune ne part ce trimestre : toutes passent le verrou de lecture (`RM:14`) et, sauf décision contraire du PI, après M3. Elles sont listées parce que les questions (1), (3) et (4) en ont besoin pour qu'une fermeture ne laisse pas un trou.

### DOK-N1 — contenu contre format de la réponse rejouée (suite de H14-A)

- **Énoncé.** À jetons de mise à jour égaux, rejouer la question avec la **bonne** réponse améliore `acc` par rapport au rejeu de la même question avec une **mauvaise** réponse de même format (option distractrice tirée de façon fixe), sur graines neuves.
- **Nul.** μ(D) ≤ 0, D_s = Δ_s(bonne) − Δ_s(mauvaise) ; nul apparié par inversion de signe (procédure de `ana:133-143`), seuil calibré sous H0.
- **Contrôle.** `p_ctrl_template` (question seule) comme troisième bras ; il permet de lire « mauvaise > template » (effet de format) séparément de « bonne > mauvaise » (effet de contenu). Le contrôle peut échouer (D_s < 0 possible, comme 5/141 graines en H14-A).
- **Substrat.** Instrument enregistré d'E1-small (Qwen3.5-4B, RTX 4090 de KXKM-AI), corpus FROZEN, **graines hors 0-140** (déjà lues).
- **Coût.** 141 graines × 3 bras ≈ 423 cellules × 177 s ≈ 21 h GPU ; préreg et verrou ≈ 8 h humaines.
- **Source.** Réserve de H14-A (`ana:183-186` ; prereg `:150-156`) ; la partie « par profil » du contrôle « options seules » n'est pas lancée (`pr92:…addendum…:108-112`), donc #92 ne sépare pas format et contenu dans Δ.
- **Lien.** DOK-H14 (H14-A), DOK-RT (`cat:92`).

### DOK-N2 — DR-4.L opérationnel : sélection dans l'espace inclusif hors échantillon

- **Énoncé.** Sur un substrat S, la configuration sélectionnée sur graines de réglage dans l'espace inclusif (opérations activables, profils P_min ⊂ P_equ ⊂ P_max) ne fait pas pire, sur graines de confirmation, que P_min sélectionné de la même façon, de plus de δ.
- **Nul.** μ(D) ≤ −δ, D = M(sélection inclusive) − M(sélection P_min) sur graines de confirmation ; test de non-infériorité apparié. Il peut échouer : un espace plus grand sur-ajuste davantage sur peu de graines de réglage (malédiction du gagnant).
- **Contrôle.** Même nombre de graines de réglage et même grille d'hyperparamètres pour les deux espaces ; sélection écrite avant la confirmation.
- **Substrat.** MLP G4-ter (MLX, CPU), où l'ordre DR-4 a déjà été réfuté en moyenne (`cat:73-74`).
- **Coût.** Ordre de grandeur CPU de quelques heures (cellules de minutes, 8 sous-ensembles × grille × 10 graines de réglage, 30 de confirmation ; à mesurer avant gel) ; 6 h humaines.
- **Source.** Constat C3 (`.github/…/README.md:151`) ; précondition (c) fausse pour les profils figés (`dok/scripts/e1_profiles.py:139-141`) ; E1-small montre `p_max − p_equ` = −0,026 en descriptif.
- **Lien.** DOK-DR4, NH-08.
- **Recommandation.** Basse priorité ; à n'ouvrir que si Paper 1 (Q2) garde DR-4 comme énoncé à portée empirique (`RM:159`).

### DOK-N3 — effet d'ordre des phases parmi les ordres admissibles, à budget et histoire égaux

- **Énoncé.** Sur un substrat où RECOMBINE n'est pas vide, l'ordre des phases admissibles sous [P] (REPLAY avant RESTRUCTURE) change la rétention au-delà du plancher de graine, à même budget et même histoire de mises à jour hors ordre.
- **Nul.** Aucune différence d'ordre : permutation des étiquettes d'ordre au sein de chaque graine (nul apparié), statistique = écart max entre ordres ; seuil calibré par simulation sous H0.
- **Contrôle.** Ordre canonique DR-2' comme référence ; bras « sans RECOMBINE » pour vérifier que le canal n'est pas vide (porte préalable : si RECOMBINE ≈ none comme en G4-quater, le test se réduit à 3 opérations et ne réplique pas Singh 2022 / Deperrois 2022).
- **Substrat.** MLP G4-ter ou substrat TTT, CPU.
- **Coût.** 3 à 12 ordres × 30 graines = 90-360 cellules ; < 10 h CPU (electron-server, `nice 19`) ; 6 h humaines.
- **Source.** L'étiquette « réplication de l'ordre des phases » du catalogue (`cat:33,97`) ne correspond à aucun bras d'E1-small (§0) ; DOK-CPU (`cat:89`, stubs, max g = 0,079) ; Deperrois 2022 et Singh 2022 résolus (Crossref).
- **Lien.** DOK-DR2/DR2p, DOK-CPU, DOK-H14 (remplace son « apport »).

### DOK-N4 — RECOMBINE contre le rappel parallèle d'Agliari 2012 (variante neuve de « séparation de mélanges »)

- Reprise de l'idée 3 du brainstorm (`brainstorm:40`), inchangée : dans le régime dilué où la théorie prédit un rappel parallèle sans états parasites, l'opérateur `recombine` retrouve plus de constituants que le nul (motifs permutés à charge égale), et échoue là où la théorie prédit l'échec. CPU < 2 h (electron-server) / 8 h humaines.
- Précondition de lecture : lire Agliari 2012 en entier (aujourd'hui résumé seul) avant le gel ; O2IGIHRtWc reste non résolu.
- Lien : ligne C l.32 ; NH-06, NH-22.

---

## 3. À fermer

| Identifiant | Preuve | Ce que l'on peut dire publiquement |
|---|---|---|
| H14-A | Analyse selon la préreg gelée, code enregistré inchangé, nul apparié calibré (`ana:164-186`) | Négatif ? Non : lecture exploratoire positive. Publiable comme : « sur Qwen3.5-4B, rejouer questions et réponses améliore `acc` de +0,043 par rapport au rejeu des questions seules, à jetons égaux ; lecture exploratoire, bras connu avant la fin du run ; format et contenu non séparés ». Inférence : c'est la direction attendue d'un ajustement supervisé sur les réponses ; l'intérêt est méthodologique (nul calibré, exposition déclarée). |
| H14-B | Idem (`ana:188-214`) ; règle de restriction de la déclaration signée (`declaration:134-139`) ; **attendre #92** pour la formulation finale | Négatif publiable avec sa réserve : « DOWNSCALE ×0,99 n'ajoute pas δ = 0,01 au rejeu réglé ; contraste peu sensible ; aucune lecture d'un mécanisme de sommeil ». Si la variante R de #92 change beaucoup plus de réponses que DOWNSCALE, l'inférence « DOWNSCALE compensé par la normalisation RMS » (`ana:200-206`) gagne un appui exploratoire ; elle reste non testée. |
| H14-C | Idem (`ana:216-235`) | « non pire que le rejeu MC-OPR restreint de δ ou plus, à calcul total égal » ; lecture exploratoire. |
| DOK-E1 (35B) | Décision PI du 30/10, amendement §2bis | Étude abandonnée ; rien à publier hors la note méthodo (décision prise après exposition, indépendance non démontrable, amendement `:82-90`). |
| « E1-small = réplication de l'ordre des phases » (étiquette, pas une hypothèse) | §0 : ordre fixe, RECOMBINE no-op (`dok/scripts/e1_harness.py:214-223`) | À retirer de `cat:33,97` et de la spec `2026-11-01-verrou-lecture-plan-trimestre-design.md:90`. Rien à publier. |
| NH-13 | Fusion dans NH-91 (même comparaison, face coût) | Ce n'est pas une fermeture scientifique ; l'identifiant renvoie à NH-91. |

**Non fermés, et pourquoi.** `recombine` = séparation de mélanges : aucune antériorité lue en entier (Agliari 2012 et 2609.32605 en résumé moteur, `brainstorm:11`), O2IGIHRtWc non résolu → on ne peut pas fermer « comme réplication » ; on requalifie en « non-test » (dok n'a jamais produit l'effet). NH-91 : 3gCeBuNNyT toujours lu en résumé seul (PDF 403 au 06/11) → reste « à recouper », pas de fermeture par antériorité.

---

## 4. Constats nouveaux depuis le 02/11

| # | Sévérité | Constat | Source |
|---|---|---|---|
| 1 | **MAJEUR** | Fait : E1-small n'a ni phase REM-like (RECOMBINE no-op) ni bras d'ordre. Inférence : l'« apport = réplication de l'ordre des phases NREM/REM » attribué à H14 par le catalogue v2 et la spec n'a aucun support dans la campagne ; il vient du brainstorm (« au mieux… une réplication… de résultats de composition et d'ordre des phases », `brainstorm:12`), transformé en étiquette. | `dok/scripts/e1_harness.py:214-223` ; `cat:33,97` ; spec `:90` |
| 2 | **MAJEUR** | Fait : #92 est un run GPU de 28-49 h lancé le 06/11, justifié par l'exception « addendum de contrôle sur une campagne en cours » (`RM:10,57`) ; E1-small était finie depuis le 01/11 et lue le 06/11, et le principe 4 interdit toute nouvelle campagne GPU avant S6 (`RM:11`). Inférence : la décision du PI (06/11 13:58) est datée dans l'addendum mais ne correspond pas à la lettre de l'exception ; elle devrait être enregistrée comme dérogation datée, comme l'ADR-0003 de nerve-wml pour P1bis/P8c. L'addendum ne relit pas la ligne de la roadmap qu'il invoque (`pr92:…addendum…:8-9`). | `pr92:…addendum…:3-4,232-284` ; `RM:10-11,57` |
| 3 | MAJEUR (déjà relevé le 01/11, **non corrigé** au `365bf14`) | `_dr2_precondition` lit la première occurrence (`permutation.index`) : (REPLAY, RESTRUCTURE, REPLAY) viole [P] mais est admis. | `dok/kiki_oniric/axioms/__init__.py:67-80` ; `inv0111:69,170` |
| 4 | MINEUR | Fait : `ROADMAP` dit « campagne finie le 02/11 » puis, dans la même cellule, « arrêt… le 01/11 à 20:20 ». | `RM:42` ; `ana:44-46` |
| 5 | MINEUR | Fait : le rapport DOWNSCALE / rejeu annoncé « ≈ 35 fois » (amendement, déclaration) vaut ≈ 25,6 à l'encadrement. Déjà dit par #91 ; les deux textes sources ne sont pas annotés. | amendement `:151-155` ; déclaration `:130-132` ; `ana:277-278` |
| 6 | MINEUR | Fait : après les correctifs bibliographiques du 04-05/11 (PR #90), Paper 1 ne cite toujours ni « When to Sleep », ni SIESTA, ni Kubo et al., ni la Control Map, ni Agliari 2012 (`git grep` vide au `365bf14`) ; 2501.16789 et 2609.32605 sont cités. Le pas 4 de la veille du 02/11 reste ouvert. | `dok/docs/papers/paper1/full-draft.md:264,1083` ; `veille:95` |
| 7 | MINEUR (déclaré) | La signature de défendabilité du code enregistré échoue sur `sft > shuffle` parce que `p_ctrl_sft` n'apprend pas (Δ −0,0004 ; perte de rejeu 0,19). Inférence : ce maillon ne contrôle rien sur ce substrat ; à noter dans toute réutilisation du harnais. | `ana:246-255` |
| 8 | MINEUR | Fait : #92 ne peut, par sa propre règle, que restreindre la lecture de H14-B, et l'issue est « quasi certaine » vu D̄ ≈ 0 (`pr92:…addendum…:149-152`). Inférence : sa valeur informative est descriptive : (i) variantes R/U contre vanilla, ce qui éprouve l'inférence « invariance d'échelle » de #91 ; (ii) « options seules » au niveau de la base, qui borne l'artefact de format de la précision de base mais pas celui de Δ (partie par profil non lancée). Il ne peut fermer ni la réserve format/contenu de H14-A, ni un mécanisme de sommeil. Seuils de sensibilité et porte de conformité choisis après #91 : déclaré. | `pr92:…addendum…:21-35,108-122,143-167` |
| 9 | OK | Chronologie : déclaration H14-B signée le 06/11 à 13:17 (`b66d658`) ; commit d'analyse `60d5efe` à 13:46:59 ; fusion #91 à 14:04 ; addendum #92 écrit après lecture et déclaré « informé ». Les expositions antérieures (30/10) sont déclarées dans l'amendement et rappelées par la déclaration et le rapport. | `git show b66d658 60d5efe` ; `declaration:143-161` ; `ana:99-131` |
| 10 | OK | Le garde-fou `choice_kl` (log-sum-exp quand b = 0) reproduit bit pour bit les valeurs antérieures (test dédié) et ne relance pas `p_ctrl_lr_matched`. | `pr92:…addendum…:189-207` |

---

## 5. Réponses aux quatre questions

1. **H14-A/B/C après E1-small.** Les fermer comme hypothèses de la campagne E1-small : elles ont été analysées selon la préreg (PR #91), c'est la preuve requise. Pas de reformulation en « effet d'ordre des phases à budget égal » : la campagne ne contient ni phase REM-like ni ordre variable. Pas de fermeture « comme réplication » non plus : rien n'est répliqué. H14-B attend #92 (07-08/11) pour sa formulation finale. La suite utile de H14-A est DOK-N1 (contenu contre format), celle de l'ordre des phases est DOK-N3 ; les deux viennent après M3.
2. **NH-91.** Une section de la note seulement (4 h en S6, inchangé). 3gCeBuNNyT couvre les agents. Sur substrat non agent, le NH-03 différé montre déjà que la position des écritures domine à compte égal. Tout test de déclencheur devrait donc apparier la position moyenne et la norme de changement, ce qui est une règle de méthode plutôt qu'une hypothèse. NH-13, face coût de la même comparaison, est fusionné dans NH-91.
3. **DR-2/DR-4.** DR-2 : la précondition honnête porte sur l'état (chaque préfixe laisse l'opération suivante définie), dont [P] est le cas MLX. Elle se vérifie par un test de conformité, et les conjoncts sont vrais par définition : pas de nouvelle ligne, mais le code de [P] est à corriger. DR-4 : trois préconditions, dont (c), la désactivation des opérations, est fausse pour les profils figés. La forme testable est DOK-N2 (hors échantillon), en option et reportée.
4. **`recombine` = séparation de mélanges.** La requalifier en « non-test » : dok n'a jamais produit l'effet, et aucune antériorité n'est lue en entier, donc on ne peut pas la fermer comme réplication. La seule variante neuve est DOK-N4 (régime d'Agliari 2012, < 2 h CPU), à garder pour après M3.
