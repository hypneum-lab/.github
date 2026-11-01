# Utilité — revue Hypneum Lab du 2026-11-01 (étape 6)

Agent « utilité », lecture seule. Sources : les 7 inventaires `scratchpad/inventory/*.md` (bouba_sens inclus, rendu à 18:39), `synthese/verification.md`, la baseline `clones/.github/docs/research/2026-10-30-etat-des-lieux/README.md` (ci-après « baseline »), `inventory/compute-status.md`, `veille/rome-2026-11-01.md`, `veille/revue-de-fond-2026-11-01.md` (la `veille-2026-11-01.md` est un squelette vide, non exploitée). J'ai aussi relu à la source, en lecture seule : le profil `.github/profile/README.md` au clone `efa7b86` (31/10 17:17), le `README.md` et le `.zenodo.json` de nerve-wml (`fee6aba`), `dream-of-kiki/docs/results/2026-10-30-nh03-deferred-eval.md`, et dans `~/Documents/Projets/hypneum-next-handoff-2026-10-31/` le plan FOSDEM (`fosdem/fosdem-2027-talk-outline.html`) et le corps du mail 50142 (`mail/sapienza-50142-body.txt`).

Convention. Les **faits** citent un `path:line`. Les **inférences** sont dans des phrases distinctes qui commencent par « Inférence ». Les heures sont des heures PI : le calcul machine n'est pas compté.

---

## 0. Ce qui a changé depuis la baseline du 30/10

- **Fait.** L'ablation diagonale de NH-01 existe (nerve-wml, 31/10 16:39 UTC). Avec la convention de l'article original (Éq. 2.16, auto-couplage gardé), C1 tombe à 1,90 [1,86 ; 1,95], sous le seuil 3. L'article soumis à ReScience (#147) dit pourtant « we did not run an ablation with the diagonal kept » (`rescience-methodo.md:146` ; `verification.md`, ligne « nerve-wml/results/nh01_diagonal_ablation », CONFIRMÉ). La baseline classait ReScience en X, « format inadapté » (README baseline l. 229). La soumission est partie quand même, le 31/10.
- **Fait.** NH-81 : le chemin « fused » donne R ≤ 1 par construction. La réplication M3 Pro donne 0,670, contre 0,91 sur macM1, avec des IC disjoints. La PR #19 parle pourtant d'accord (« agrees ») (`micro-kiki.md:301`). La baseline en faisait « le négatif le plus vendable » (README baseline l. 219). **Inférence** : ce n'est plus un négatif sur la neuromorphie. C'est une propriété de l'implémentation, plus un écart entre plateformes.
- **Fait.** Pour nerve-wml Claim B, la baseline retenait que « le chiffre dépend de l'estimateur ». C'est pire : les « codes post-VQ » sont l'argmax d'une tête de classification. Le MI/H de 0,99 mesure l'accord de deux classifieurs sur l'étiquette de cluster (`nerve-wml.md:166` ; `verification.md`, CONFIRMÉ).
- **Fait.** M5 n'a pas échoué « mécaniquement par couverture » : il échoue sur le fond, avec 96/96 configurations exécutées (`kiki-flow-research.md:160`, infirme le constat #6 de la baseline).
- **Fait.** La borne de Holevo mal appliquée est dans micro-kiki, pas dans micro-kiki-quantum (`micro-kiki.md:287`).
- **Fait.** E1-small : la règle GO est retirée et H14-A/B/C sont toutes exploratoires (`dream-of-kiki.md:16`, constat 18). L'action n° 2 de la baseline est donc close.
- **Fait.** bouba_sens : `--k-steps` n'est toujours pas transmis à HEAD, et la préreg v0.7 a été taguée sans les corrections (`bouba_sens.md:176`, B3). L'addendum de la baseline (l. 357) qui requalifiait ce point est infirmé.
- **Fait.** Au clone `efa7b86`, le profil public garde « top-1 70.7 %, top-3 89.5 % » (`.github/profile/README.md:55`). L'action n° 1 de la baseline n'est donc pas faite à ce SHA. **À vérifier à HEAD** : le profil a pu changer depuis le 31/10 17:17.
- **Fait.** Rome 2609.32605 ne devance pas N10-C, contrairement à ce que la veille annonçait (« 1 cellule sur 4 ») ; il recouvre le Test 12 de Paper 1 (`nerve-wml.md:101-112`). En revanche, Agliari et al. 2024 (NN 177, 106389 : rêve = ridge + arrêt précoce) devance l'interprétation de NH-01 (`nerve-wml.md:136` ; `rome-2026-11-01.md`, R1).

---

## A. Actifs réels

| # | Actif | Dépôt | Preuve | Ce qu'il vaut / limite |
|---|---|---|---|---|
| A1 | Chaîne de gel : tag annoté + manifeste SHA-256 + SWHID. Les 22 tags de la Table 1 existent avec le commit indiqué. | tous, documentée dans paper-methodo-2026 | `rescience-methodo.md:209-214` (22/22 vérifiés), OK3 l. 280 | **Fait** : vérifiable par un tiers. **Inférence** : c'est l'ossature de la note méthodo. La table est périmée (7 tags du 31/10 manquent, M4 l. 263). |
| A2 | Gardes de lancement automatiques (refus d'un budget enregistré hors contexte de gel) | nerve-wml `campaign/guards.py` | `rescience-methodo.md:235` ; baseline l. 205 (2 625 lignes, maturité T) | **Inférence** (agent rescience) : c'est la seule nouveauté défendable face à Vaccaro 2026 et Masters 2026 (`revue-de-fond-2026-11-01.md:528-532`). Il manque un cas montré où la garde a bloqué un run. |
| A3 | Nul apparié par inversion de signe + calibration du max de différences | bouba_sens `scripts/me6_paired_null.py` | `bouba_sens.md:156`, o1-o2 l. 207-208 | **Fait** : discipline Me6 propre (règle poussée 22 s avant la première cellule, Bonferroni exact). Limite **démontrée** : le nul par blocs est sur-dispersé sous un prédicteur quasi constant (M2 l. 188). Le contrôle 2 du brouillon #66 est tautologique, p ≡ 1 (M3 l. 189). Ces deux défauts sont eux-mêmes de la matière publiable. |
| A4 | Code NH-01 : reproduction interne bit-exacte (9 120 et 29 640 cellules), tous les chiffres recalculés, J(t) vérifié à la main | rescience-nh01 + nerve-wml | `rescience-methodo.md:163-164` (OK3, OK4), OK1 | **Fait** : implémentation fiable. **Inférence** : c'est la qualité de l'outil qui a permis de trouver l'effet de la diagonale. L'actif est l'outil, pas le résultat « 3,86 ». |
| A5 | Ablation diagonale NH-01 (préenregistrée, tag `prereg-nh01-diagonal-20261031`) | nerve-wml | `rescience-methodo.md:93-97`, B1 l. 146 | **Inférence** : c'est le meilleur cas d'erreur trouvée après le gel pour la thèse de la note méthodo (`rescience-methodo.md:249`). |
| A6 | NH-03 différé : préreg taguée, porte de contrôle empirique, nul de signe calibré (p = 1/10 001), verdict `recency_survives`, « pas d'avantage TTT » | dream-of-kiki | `dream-of-kiki/docs/results/2026-10-30-nh03-deferred-eval.md:1-90` ; `dream-of-kiki.md:180` (OK 20) | **Fait** : propre, mais un seul benchmark jouet (Split-FMNIST, l. 82-90). La confusion récence / interférence reste réelle (constat 20). |
| A7 | `ERRATUM.md` §1-16, M5 FAILED avec règle gelée avant run, algèbre Lie/Strang vérifiée | kiki-flow-research | `kiki-flow-research.md:174-177` (OK 23, 24, 26), l. 160 | **Fait** : documentation des défauts jugée exemplaire. **Inférence** : c'est le deuxième pilier de la note méthodo (« la reproductibilité n'est pas la validité »). |
| A8 | Paper A, VQC : C1 négatif solide ; C2 VQC < random (IC [−1,02 ; −0,05]) | micro-kiki | `micro-kiki.md:322-324` | **Fait** : négatif solide, à condition de retirer la borne de Holevo partout (MK-B3 l. 287). |
| A9 | §5.8 : la couche structurelle du critère de conformité laisse passer 22/25 substrats adverses | dream-of-kiki | `dream-of-kiki.md:181` (OK 21), l. 139 | **Fait** : conclusion juste. **Inférence** : c'est le seul contenu de Paper 1 qui survit à la relecture. Une page de la note méthodo. |
| A10 | Jeu de données d'errata (Table 2 : 31 corrections, commits existants) | paper-methodo-2026 | `rescience-methodo.md:216-224`, OK4 l. 281 | **Fait** : 13 commits vérifiés. Erreurs : mauvais commit aux lignes 29-31 (M1), comptes faux (M2). **Inférence** : c'est le livrable le plus réutilisable, après correction et publication en CSV sur Zenodo. |
| A11 | Dispositif de mesure J/token (IOReport, NVML) et écart entre plateformes M1 Max / M3 Pro | micro-kiki NH-81 | `micro-kiki.md:189-200`, 301 | **Inférence** : l'outil est réutilisable (« `jpt` » dans la baseline l. 207). La conclusion scientifique ne l'est pas, puisque R ≤ 1 par construction. |

Restent internes, sans valeur extérieure démontrée : Paper 2 de dream-of-kiki (prédicteur factice, `dream-of-kiki.md:172`), les deux brouillons système et Aeon de micro-kiki (MK-B1, MK-B2, MK-B4), le manuscrit baby-brain (« sans aucun résultat », `baby-brain.md:15-17`), micro-kiki-quantum (train = test, `micro-kiki.md:386`) et BabyBrain (copie divergente du cockpit, `baby-brain.md:177`).

---

## B. Négatifs publiables tels quels

**Inférence générale** : à 10 h/semaine, un seul véhicule est réaliste avant le 15/12 : la note méthodo. Les négatifs ci-dessous y entrent comme études de cas. Seuls B6 et B7 se justifient en standalone, et seulement plus tard.

| # | Négatif | Dépôt / preuve | Où | Format | Effort PI |
|---|---|---|---|---|---|
| B1 | NH-01 : la conclusion change d'un facteur 2 selon la convention de la diagonale ; erreur trouvée après le gel par une ablation préenregistrée | `rescience-methodo.md:146, 249` | note méthodo, cas phare (remplace « bit-exact replication », B1 l. 259) + ReScience v2 | 1,5 page + 1 tableau | 4 h dans la note |
| B2 | kiki-flow : prox W2 défectueux, pas non-JKO, CI qui reproduisait à l'octet un calcul faux ; M5 FAILED 96/96 ; Lie/Strang non substituables | `kiki-flow-research.md:140, 160, 174-177` | note méthodo §cas | 1,5 page | 4 h |
| B3 | bouba_sens B-3 : seuil sans nul, lésion inopérante (k_steps), H0 de symétrie mal posée, nul par blocs sur-dispersé, contrôle par dérangement tautologique | `bouba_sens.md:156, 188-190, 111-116` | note méthodo §« nuls calibrés » (3.3) | 1,5 page + preuve de la tautologie | 5 h |
| B4 | nerve-wml Claim B : MI/H 0,99 = accord de classifieurs ; le nul mKNN non conditionné gonfle l'effet (2,5-3× au lieu de 18,8×) | `nerve-wml.md:166-167` | note méthodo, encadré « nul qui ne conditionne pas sur le confondant » | 0,5 page | 3 h, à condition de refaire le contrôle intra-cluster (≈ 30 lignes, `nerve-wml.md:149-152`) |
| B5 | RECOMBINE : g ≈ 0 sur 6 couples, rapporté **en non-rejet avec MDE** (d ≈ 0,74 détectable à N = 30), pas en « confirmed » | `dream-of-kiki.md:136, 169` | note méthodo, 1 paragraphe (exemple « non-rejet ≠ équivalence », TOST) | ½ page | 2 h |
| B6 | NH-03 : l'avantage d'écriture tardive survit à un délai sans écriture (R_d3 = +14,65) ; aucun avantage propre au TTT | nh03-deferred-eval.md l. 32-43, 57-80 | section de la note, ou note courte séparée (voir D4) | 1 page / 4 p. | 4 h (section) / 12-15 h (note) |
| B7 | Paper A VQC négatif (C1, C2), sans Holevo, avec IC appariés | `micro-kiki.md:257-260, 270-271` | atelier de type « I Can't Believe It's Not Better » (dates 2027 **non vérifiées**) | 4 p. | 12-15 h ; hors trimestre sauf scénario ambitieux |
| B8 | baby-brain Phase 1 : LP négatif sur 3 environnements, critère redéfini après coup ; LPM sous AR(1) donnant 15 % et 35 % de faux positifs | `baby-brain.md:127, 159-161` | note méthodo, 1 paragraphe | ¼ page | 1 h |

**Fait** : NH-81 ne figure plus dans cette liste comme négatif sur la neuromorphie (voir §0).

---

## C. Ce qu'il faut arrêter ou retirer

### C.1 Retraits sur des textes publics ou soumis (priorité 1, règle de la baseline : « ce qui est faux en public »)

| Texte | Ce qui est faux | Preuve | Correction | Coût de ne pas le faire |
|---|---|---|---|---|
| **ReScience #147** (article gelé au tag `submission-20261031`) | « no ablation with the diagonal kept » ; « supports the central qualitative claims » ; C3′ présenté comme « calibrated null » ; « spurious removed » dans le corps de l'issue | `rescience-methodo.md:146-147, 154` (B1, M1, m8) | Commentaire sur #147 qui déclare l'ablation et C1 = 1,90 ; puis tag v2 avec le tableau diagonale + Fig. 10 de l'original. Ou retrait temporaire. | **Inférence** : un relecteur physicien demandera la Fig. 10 avec diagonale (`rescience-methodo.md:112`) et trouvera le facteur 2 lui-même. Une erreur découverte par le relecteur plutôt que déclarée par l'auteur coûte la crédibilité de toute la chaîne, y compris de la note méthodo qui s'appuie sur ce cas. |
| **Mail 50142** à Fachechi / Agliari / Barra (non envoyé) | **Fait** : il mentionne l'ablation, mais seulement sous l'angle de t* (ΔD = 0,038). Il ne dit pas que C1 passe sous 3 avec la convention des destinataires, et maintient « consistent with your claims » (`sapienza-50142-body.txt:6`). | ci-contre | Réécrire le paragraphe avec C1 diag = 1,90, **après** le commentaire sur #147 | **Inférence** : ce sont les auteurs dont on emprunte la convention. Ils verront l'écart immédiatement ; c'est le contact le plus coûteux à rater. |
| **FOSDEM PYVZXW** (modifiable jusqu'au 16/11) | « confirmed at two of three memory loads … re-run bit-exact on 29 640 cells » | `fosdem/fosdem-2027-talk-outline.html:57` | « partial replication ; the headline ratio halves under the original's diagonal convention — found after freeze by a pre-registered ablation » | **Inférence** : c'est un talk « Open Research ». Le même fait devient un exemple vertueux s'il est déclaré, et une contradiction s'il est découvert par l'audience. |
| **paper-methodo-2026** (squelette public) | NH-01 « replicates … bit-exactly at two loads », « not computable, never 44× » ; comptes du résumé incohérents (20/12/12/sept contre 22/15/31/cinq) | `rescience-methodo.md:259, 261-262` | Réécrire le cas NH-01 ; générer les comptes par script | La note se contredit sur son propre cas phare. |
| **Profil `.github`** (au clone `efa7b86`, à vérifier à HEAD) | routeur « top-1 70.7 %, top-3 89.5 % » (retiré en E-03) ; « submission pending the PI's proofread » (soumis le 31/10) ; « polymorphism gap decays with N » (substrats non convergés, C3) ; NH-01 « confirmed at m ∈ {0, 0.15} » sans réserve sur la diagonale ; « Two substrates pass all three conformance conditions » alors que Paper 1 §9.1 dit l'E-SNN différé | `.github/profile/README.md:32, 42, 44, 55` ; `nerve-wml.md:168` (C3) ; `dream-of-kiki.md:165` (constat 5) | Une PR, 1 h | **Inférence** : c'est la page qu'un recruteur ou un rapporteur lit en premier, en pleine recherche de CDI. |
| **README nerve-wml** | « null-calibrated 18.8× random » ; « submission pending PI proofread » | `nerve-wml/README.md:132, 181` ; `nerve-wml.md:167` (C2) | même PR | idem |
| **Zenodo** | (a) kiki-flow 23636477 : la note « superseded » n'est pas posée (action PI de 5 min, en attente depuis le 31/10). (b) nerve-wml v1.10.0 : `.zenodo.json` dit NH-01 « confirmed » sans réserve sur la diagonale. (c) bouba_sens : le DOI pointe vers v1.1.1 (`bouba_sens.md`, m2). (d) arxiv_bundle et zip v0.5 de kiki-flow périmés (`kiki-flow-research.md:141`, constat 12). | ci-contre | (a) maintenant ; (b) au prochain dépôt, avec une phrase dans la description ; (c), (d) note « superseded » | **Fait** : un DOI ne s'efface pas. **Inférence** : une note de description est le seul correctif possible ; chaque semaine sans note, c'est une citation possible d'un chiffre faux. |
| **`.tex` contre `.md`** | dream-of-kiki Paper 1 : la `.tex` de build a 6 mois de retard (16 refs, pas de Rome, « free semigroup ») ; les citations de #87 ne sont que dans le `.md` ; les deux divergent. kiki-flow : arxiv_bundle ≠ main.tex. micro-kiki : la conclusion de paper-a-v2 revendique 0,91, que la l. 111 retire. | `dream-of-kiki.md:167` (constat 7) ; `verification.md` (#87, paper-a-v2 l.111/175) | Décider d'une source unique par papier. Archiver la `.tex` périmée (pas de PDF circulant). | **Inférence** : toute personne qui compile la `.tex` cite un papier que le labo a déjà corrigé. |

### C.2 Arrêter (chantiers internes)

| Arrêter | Preuve | Gain estimé |
|---|---|---|
| Présenter DR-2 comme un « théorème » (l'ensemble n'est pas un semigroupe) ; Paper 2 en l'état (zéro contenu empirique) | `dream-of-kiki.md:153, 161` ; `verification.md` (CONFIRMÉ) | 45 h de la baseline (« Paper 1 GENIAL, A T1-T2 2027 ») à reporter en 2027 |
| NH-01 #90 (balayage en N) : il mesure surtout la décroissance du dénominateur Hebb | `rescience-methodo.md:91, 138` | 90-190 h machine ; confirme la baseline |
| Porte N10-C-bis à 1 graine (≈ 8 % de faux succès, ≈ 24 % de faux échecs) | `nerve-wml.md:113-119, 175` (C10) | évite une décision fausse sur 21 j de KXKM |
| Grilles v0.7 ActionSense et K1/K3 Me6 « piste C » avant un amendement v0.7.1 (k_steps, porte de manipulation, H0 sur résidus, correction du contrôle 2) | `bouba_sens.md:157, 176-189` | évite des grilles non interprétables ; **contredit le plan de la semaine 1** (« lancer K1/K3 », mémoire 31/10) |
| NH-81 r-suivants et préreg GB300 NH-81 en tant que test neuromorphique | `micro-kiki.md:301` (MK-M8) | waiters KXKM (échéance 04/11) ; attention PI |
| Papier système micro-kiki, brouillon Aeon-AMI, couche cognitive (neutralisée en production, A/B nul) | `micro-kiki.md:283-292` | confirme la baseline (« triple hybride ») ; 15-20 h |
| baby-brain : portes fractionnaires sous AdamW, E4 (rêve sans effet sur le WML) | `baby-brain.md:141-153` ; `verification.md` (CONFIRMÉ) | rien à lancer tant que le mécanisme est un placebo |
| kiki-flow : λ̂ et le renvoi au Thm 3.4, E1b tel qu'écrit, papier d'atelier (oracle sans prox W2 ni couplage) | `kiki-flow-research.md:141` ; `verification.md` | 8-11 j de recalcul à ne pas lancer avant la note |
| micro-kiki-quantum : laisser archivé, ajouter une phrase sur la fuite train = test dans `ARCHIVED.md` | `micro-kiki.md:380-381` | 10 min |

---

## D. Ce qui manque pour chaque soumission visée (tâches datées)

Calendrier ancré sur : FOSDEM modifiable jusqu'au 16/11, réponse le 1/12 ; arXiv avant le 15/12 ; talk le 30/01/2027 (mémoire du 31/10, `project_hypneum_manifeste_v3`). **Fait** : le relevé de calcul montre macM1 en swap 40,7/42 Go, et KXKM partageant son GPU avec ComfyUI pendant la confirmatoire (`compute-status.md`). **Inférence** : aucun calcul neuf n'est nécessaire pour D1-D3, sauf la Fig. 10 de D2 (CPU electron-server, libre).

### D1. ReScience #147
| Date | Tâche | h |
|---|---|---|
| 02/11 | Commentaire sur #147 : déclarer l'ablation diagonale (C1 = 1,90 [1,86 ; 1,95]) ; proposer les 2 relecteurs demandés par l'éditeur le 01/11 09:52 (`rescience-methodo.md:20`, m4) | 1,5 |
| 02/11 | Fusionner PR #5 ; nommer le modèle IA dans `docs/ai_use.md` (m7) ; corriger « Ludovica » Serricchio (m3) ; label de domaine (m6) | 0,5 |
| 03-08/11 | Préreg L0 + tag : reproduction Fig. 10 (et 9) de l'original avec N = 1 000, P = 50, dynamique parallèle et diagonale incluse ; lancement CPU electron-server (`rescience-methodo.md:134`) | 3 |
| 09-22/11 | v2 de l'article : tableau diagonale, Fig. 10, C3′ décrit comme « contrôle d'échelle, non réfutable à T = 0 » (M1), P4 → état « résiduel », pas « mélanges » (M4), monotonie du noyau contre la cloche (M5) ; citer JSTAT 2019, NN 106389, DLAM, Dotsenko 1991, Gardner 1988, Plakhov 1992 (M3 ; `revue-de-fond-2026-11-01.md:546-547`) ; nouveau tag `submission-v2` | 8 |
| après le tag | Réponses aux relecteurs (non prévisible) | 4 (réserve) |
| — | Étiqueter « post-soumission » la repro ARM GB300 (tag `arm-repro-gb300-freeze-20261031`), sans la mélanger à l'article | 0,5 |

### D2. Note méthodo arXiv (< 15/12), puis JOTE
**Fait** : squelette de 88 lignes ; §1-2 et §5-7 vides (`rescience-methodo.md:182`). L'endossement cs.LG n'est pas demandé. L'endossement envoyé le 31/10 vise cond-mat.dis-nn, pour le preprint NH-01. **Inférence** (agent rescience, l. 232) : cs.LG serait probablement reclassé ; cs.DL ou cs.SE en primaire, avec stat.ME en croisé, conviennent mieux.

| Date | Tâche | h |
|---|---|---|
| 03-07/11 | Plan figé ; heure de coupure de la Table 1 (+ 7 tags, typologie gel / provenance / démo) ; script qui génère les comptes du résumé | 5 |
| 03-07/11 | Demander l'endossement de la catégorie choisie (même procédure que le 31/10) ; relancer le 14/11 si silence | 0,5 |
| 08-21/11 | §3 chaîne + §4 errata : corriger la Table 2 (lignes 9, 14, 19, 22, 29-31) ; détecteurs sourcés ou retirés (M7) ; thèse « détection, pas prévention » (M6) | 10 |
| 08-21/11 | Études de cas B1 (NH-01 diagonale), B2 (kiki-flow), B3 (B-3 nuls), B4, B5, B8 | 14 |
| 22/11-05/12 | §1-2 travaux voisins : Nosek 2018, Chambers 2013/2022, Rougier 2017, Pineau 2021, Bouthillier 2021, Kapoor 2023, Vaccaro 2026, Masters 2026, Jankowsky 2026 ; §3.3 : Westfall-Young, Nichols-Holmes, Phipson-Smyth, Lakens 2017 (`revue-de-fond-2026-11-01.md:524-532`) ; figures | 9 |
| 06-10/12 | Relecture croisée Codex + critique Opus (skills `codex-cross-review`, `ship-critic`) ; corrections | 4 |
| 11-14/12 | Dépôt arXiv ; Table 2 en CSV sur Zenodo | 2 |
| janv. | Mise au format JOTE et soumission | 6 |

### D3. FOSDEM 2027 (PYVZXW, devroom Open Research)
| Date | Tâche | h |
|---|---|---|
| avant le 16/11 | Modifier la ligne NH-01 du plan sur pretalx (voir C.1) ; vérifier qu'aucune autre ligne ne cite Claim B, NH-81 ou M5 au-delà de ce que disent les inventaires | 1 |
| 01/12 | Lire la réponse | 0 |
| si accepté, 04-25/01 | Slides tirées de la note méthodo ; checklist CC BY 4.0 ; répétition | 10 |
| 30/01 | Talk (déplacement non compté) | — |

### D4. NH-03, note courte
**Fait** : le résultat est propre, mais limité à un benchmark jouet, un délai, une variante TTT et N = 30 (`nh03-deferred-eval.md:82-90`). Le contraste primaire compare deux calendriers en plus de deux substrats (l. 72-75). La confusion récence / interférence reste réelle (`dream-of-kiki.md:180`). Rome NN 106389 donne une relation t ↔ temps d'entraînement qui recouvre partiellement « quand dormir » (`rome-2026-11-01.md`, scoops, ligne NH-03).
**Inférence** : en standalone, un relecteur demandera le délai « nouvelles classes » et un délai de 2-3 tâches (suite proposée l. 94-97), soit un nouveau run. Le moins cher est d'en faire une section de la note méthodo (exemple « verdict préenregistré qui dément l'interprétation optimiste »).
| Date | Tâche | h |
|---|---|---|
| 22/11-05/12 | Section dans la note : verdict, nul calibré, limites, citation NN 106389 | 4 |
| T1 2027 (optionnel) | Note de 4 p. : préreg du délai « nouvelles classes » (CPU macM3, < 10 min par lot d'après le run du 30/10, l. 9-12) + rédaction | 12-15 |

---

## E. Trois scénarios à 3 mois (02/11 → 31/01, 13 semaines, ≤ 130 h)

Postes communs à tous : pilotage du lundi, 13 × 1 h = 13 h ; corrections publiques C.1, 4 h ; lecture sous `hypneum-nulls` des campagnes déjà payées (E1-small exploratoire, N10-C run2), 7 h.

| | Conservateur | Médian | Ambitieux |
|---|---|---|---|
| Heures PI | ≈ 95 h | ≈ 128 h | ≈ 185 h (14 h/sem.) |
| ReScience #147 | déclaration + relecteurs (2 h), pas de v2 ; si l'éditeur demande la Fig. 10, retrait | D1 complet (≈ 18 h) | D1 + reproduction Fig. 9 + 3-mélanges (+6 h) |
| Note méthodo | arXiv 15/12 (≈ 45 h), JOTE en janvier (6 h) | idem + section NH-03 (4 h) | idem |
| FOSDEM | correction du plan (1 h) ; slides si accepté (10 h) | idem | idem |
| Science neuve | aucune ; campagnes en cours lues, pas relancées | amendement bouba v0.7.1 (6 h, sans grille) ; décision N10-C-bis / N10-D (3 h) | + Claim B refait (10 h) + porte N10-C-bis à 3 graines (6 h + GPU) + Paper A ICBINB (15 h) + note courte NH-03 (15 h) + `jpt` (15 h) |
| Marge | 15 h | 13 h | 0 |
| Livrables au 31/01 | profil assaini ; #147 honnête ; 1 preprint ; 1 soumission JOTE ; talk éventuel | + ReScience v2 défendable ; bouba prêt à relancer ; décision N10 documentée | + 2 à 3 manuscrits courts, 1 outil |
| Risques | #147 refusée faute de Fig. 10 ; aucun résultat neuf à montrer en entretien | rapports ReScience qui tombent en décembre, en concurrence avec la note ; endossement arXiv tardif | dépasse le plafond de 10 h ; concurrence avec la recherche de CDI ; nouvelle dette d'errata (mode « livrer vite ») ; macM1 saturé |

**Recommandation : le scénario médian.** Arguments :
1. **Fait** : les deux engagements publics (#147 et FOSDEM) reposent sur le même cas NH-01, et l'erreur de convention est maintenant connue. **Inférence** : le conservateur laisse #147 dans un état que la première relecture fera tomber. Les 16 h de différence avec le médian achètent la seule réplication externe du labo, et elle sert aussi de cas phare à la note.
2. **Inférence** : la note méthodo est le seul livrable qui capitalise sur six mois. Elle sert aussi d'argument d'embauche (« je trouve mes propres erreurs »). Elle a besoin du cas NH-01 réécrit (B1), pas de nouvelle science.
3. **Fait** : l'ambitieux demande environ 14 h/semaine, au-dessus du plafond fixé dans le plan pro (mémoire `project_plan_pro_3_ans_2026_10_30`). **Inférence** : tenter l'ambitieux reproduirait le schéma que la relecture documente partout (affirmations publiées avant contrôle).
4. **Inférence** : la différence avec la baseline est que ReScience passe de X à « obligatoire ». Il est soumis, donc il faut le rendre défendable. La part « carrière » de la baseline (portfolio, billet NH-81, `jpt`) recule : le billet NH-81 n'a plus de message.

---

## F. QCM pour le PI

1. **ReScience #147 et l'ablation diagonale** (constat B1, `rescience-methodo.md:146`)
   - (a) **(Recommandé)** Commenter #147 le 02/11 (ablation déclarée, C1 = 1,90) + proposer les 2 relecteurs + v2 avec tableau diagonale et Fig. 10 avant fin novembre
   - (b) Retirer #147 et resoumettre en janvier avec la v2
   - (c) Déclarer seulement, sans v2
   - (d) Ne rien faire avant les rapports
2. **Mail 50142 au groupe de Rome** (`sapienza-50142-body.txt:6` : C1 avec diagonale absent)
   - (a) **(Recommandé)** Le garder en attente, le réécrire avec C1 diag = 1,90 et l'envoyer après le commentaire sur #147
   - (b) L'envoyer cette semaine avec une phrase ajoutée
   - (c) Ne pas l'envoyer avant la v2 acceptée
3. **Plan FOSDEM PYVZXW** (`fosdem-2027-talk-outline.html:57`)
   - (a) **(Recommandé)** Corriger avant le 16/11 : « réplication partielle ; le ratio est divisé par 2 avec la convention de l'original, trouvé après gel » (cas vertueux du talk)
   - (b) Retirer la proposition
   - (c) Laisser tel quel
4. **Catégorie arXiv et revue de la note méthodo** (`rescience-methodo.md:232`)
   - (a) **(Recommandé)** cs.DL en primaire, stat.ME en croisé, puis JOTE ; endossement demandé cette semaine
   - (b) cs.LG, puis JOTE
   - (c) ReScience « editorial » sans arXiv
5. **Corrections publiques** (profil l. 32/42/44/55 ; README nerve-wml l. 132/181 ; Zenodo)
   - (a) **(Recommandé)** Une PR `.github` + une PR nerve-wml cette semaine (70,7/89,5, « pending proofread », écart de polymorphie, 18,8×, NH-01 avec réserve diagonale) + note « superseded » Zenodo 23636477 par le PI
   - (b) Attendre la v2 ReScience pour tout corriger d'un coup
   - (c) Profil seulement
6. **NH-03** (`nh03-deferred-eval.md:82-97`)
   - (a) **(Recommandé)** Section de la note méthodo, sans nouveau run
   - (b) Note courte séparée au T1 2027 avec le délai « nouvelles classes »
   - (c) Rien avant 2027
7. **NH-81** (R ≤ 1 par construction, M3 Pro 0,67 contre macM1 0,91 ; `micro-kiki.md:301`)
   - (a) **(Recommandé)** Clore : erratum « propriété de l'implémentation fused + écart entre plateformes », statut unifié sur main / PR #19 / GB300, pas de run KXKM le 04/11
   - (b) Lancer KXKM comme prévu, puis décider
   - (c) Garder la note courte NH-81 de la baseline
8. **Porte N10-C-bis** (`nerve-wml.md:113-119`, C10)
   - (a) **(Recommandé)** 3 graines appariées, ou abandon de bis au profit de N10-D une fois corrigé (sym hors de H1, effet de graine partagé)
   - (b) 1 graine, avec les taux d'erreur (8 % / 24 %) écrits dans la préreg
   - (c) Geler bis tel quel
9. **bouba_sens, K1/K3 Me6 « piste C » prévus en semaine 1** (`bouba_sens.md:157, 188-189`)
   - (a) **(Recommandé)** Rien avant un amendement v0.7.1 tagué (k_steps, porte de manipulation, H0 sur résidus, contrôle 2 de #66 refait)
   - (b) Lancer K1/K3 maintenant sur electron-server, l'amendement suivra
   - (c) Arrêter bouba_sens après la note
10. **Scénario du trimestre** (§E)
    - (a) **(Recommandé)** Médian (≈ 128 h : #147 v2 + note + FOSDEM + amendements sans calcul neuf)
    - (b) Conservateur (≈ 95 h)
    - (c) Ambitieux (≈ 185 h)

---

**Limites de ce document.** Je n'ai lancé aucun calcul et touché aucune machine. Le profil `.github` est lu à `efa7b86` (31/10 17:17), pas à HEAD. Les dates d'appels ICBINB et JOTE ne sont pas vérifiées. Les heures sont des estimations, calées sur celles de la baseline (note 35-45 h) et des inventaires. Le C1 = 1,90 est un recalcul de l'agent rescience, CONFIRMÉ dans `verification.md`, mais pas refait par moi.
