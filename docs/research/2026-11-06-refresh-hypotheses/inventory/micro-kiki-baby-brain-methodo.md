# Refresh du catalogue v2 — micro-kiki, baby-brain, note méthodo, rescience-nh01 (2026-11-06, soir)

*Passe du 06/11/2026. Clones frais `--depth 300` dans `refresh-hyp/repos/`. Aucun calcul autre que de l'arithmétique sur des JSON déjà versionnés (moyennes et médianes de latence). Aucune exécution du code des dépôts, aucun verdict de campagne.*

Abréviations des chemins :
- `mk/` = micro-kiki au SHA 34a65f6 (PR #35, 06/11) ;
- `bb/` = baby-brain au SHA b784430 (PR #291, 06/11) ;
- `pm/` = paper-methodo-2026 au SHA ea086a9 (PR #4, 06/11) ;
- `rn/` = rescience-nh01 au SHA bce080c (PR #7, 04/11) ;
- `nw/` = nerve-wml au SHA a1d1192 ;
- `cat:` = `.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` (main c8967a2) ;
- `vt/` = `.github/docs/research/2026-11-02-veille-theses/` ;
- `RM:` = `.github/docs/ROADMAP.md` ;
- `ap/` = `.github/docs/research/2026-11-01-analyse-profonde/`.

Les identifiants externes sont résolus dans `inventory/resolve-mk-bb-methodo.tsv` : 31 arXiv et 8 DOI résolus ; 3 OpenReview résolus par `notes/search` ; 2 OpenReview non résolus (`notes?id=` en 403), qui ne tranchent rien.

## 0. Ce qui a changé depuis le 02/11 (faits)

- **micro-kiki** : depuis 61056d9, seulement deux PR de bibliographie et d'attribution (#34, fusionnée le 06/11 06:08 UTC ; #35, fusionnée le 06/11 15:57 UTC). 15 fichiers sont touchés, tous dans `docs/` et `paper/` (`git diff --stat 61056d9 HEAD`). Ces PR :
  - ajoutent la citation d'Arslan pour Aeon dans `docs/papers/paper-a-draft-v1.md` (référence [21]) ;
  - corrigent LeCun (OpenReview au lieu de arXiv:2206.15331) et MoLA ;
  - adoucissent la borne de Caro.
  - Elles ne retirent pas « +7 pp », ni la table des latences, ni la description CAMP/KnowBias. Issues ouvertes : #11 (C5), #13 (NH-85), #17 (« Publier le routeur mpnet V4 (70,7 %) ou corriger le README »).
- **Erratum E-2026-10-25-03** (`mk/docs/ERRATA.md:144-194`) :
  - 70,7 / 89,5 retirés : seul le message du commit `10c7b6e` porte ces chiffres, sans JSON, et ses poids sont perdus au merge `bf986ba` (`:165-178`) ;
  - valeurs gardées : 46,4 / 69,6 (MiniLM-L6, 34 classes, n = 5 377 ; `:180-182`) ;
  - « 2,2× » déclaré « unaffected » (`:186-188`) ;
  - MK-01 reste « non concluant (provenance) » (`:193-194`).
- **baby-brain PR #291** : bibliographie, attributions et citations de Rome. Elle ajoute aussi trois paragraphes de fond au brouillon, sans changer le protocole :
  - (a) « The flat control is not neutral » : E0 subit la perte de plasticité de Dohare et al. 2024 (commit 44515e9) ;
  - (b) « Single-frame latent targets » : la vitesse n'est pas identifiable depuis une cible à une seule image (Zhang et al., arXiv:2610.04585 ; commit 44515e9) ;
  - (c) E0 non apparié en cadence et en balayage d'hyperparamètres, comme dans Wu et al. 2021 (commit 4bb2510) ;
  - (d) deux options E4 laissées au PI (commit 46feb38) : un contrôle ridge / arrêt précoce apparié au bras rêve (Agliari et al. 2024, DOI 10.1016/j.neunet.2024.106389), et un régularisateur anti-effondrement du prédicteur JEPA (arXiv:2610.06805, arXiv:2610.07540).
  - Aucun code n'est touché : seuls `docs/paper/*.md` et `references.bib` changent (`git diff --stat 376fe83 HEAD`).
- **paper-methodo-2026 PR #4** : références de la liste en ligne seulement (Vaccaro : lieu ; Fachechi ; Kanter et Sompolinsky ; Simmons ; Gelman et Loken). Le texte est inchangé.
- **rescience-nh01** :
  - Commentaire de déclaration posté le 04/11 17:47 UTC sur ReScience/submissions#147 (ablation diagonale et recalcul).
  - Deux relecteurs se sont proposés : ByungwoongYoo (04/11) et j45856021-dev (06/11). Étiquettes au 06/11 : `NEED: Editor`, `NEED: Reviewer 1`, `NEED: Reviewer 2`.
  - Amendement post hoc de la reproduction aarch64 (GB300, `rn/docs/prereg/arm-reproduction/amendment-2026-11-04.md`, PR #7) : verdict gelé INCONCLUSIVE_STRICT ; tolérance post hoc 1e-10 choisie par le PI.

## 1. Lignes du catalogue touchées

### 1.1 micro-kiki

| Id | Statut v2 | Proposition | Nouvel énoncé ou changement | Preuve | Effet sur le trimestre |
|---|---|---|---|---|---|
| MK-01 (`cat:209`, table C `cat:44`) | rapport technique | **fermer la part « 70,7 / 89,5 » par erratum ; garder la part 46,4 / 69,6 en rapport technique** | « Routeur MiniLM-L6 : 46,4 % top-1, 69,6 % top-3, 34 classes, n = 5 377 ; aucun gain V3→V4 revendiqué. » Le chiffre 70,7 est clos par erratum, et la ligne n'a plus d'hypothèse à tester. | `mk/docs/ERRATA.md:165-194` ; `mk/README.md:9,266-271` ; `mk/paper/micro-kiki.tex:155,339` | 0 h de calcul. Issue #17 à fermer, puisque la branche « corriger le README » est faite (0,25 h). |
| MK-02 (`cat:210`) | rapport technique | **reformuler** | « 2,2× contre une baseline mots-clés réduite au nom du domaine (homme de paille), sur une autre validation (14 423 ex., 35 dom.) que les 46,4 %. » L'erratum dit « unaffected », mais il ne traite pas la baseline. | `ap/inventaires/micro-kiki.md:145` ; `ap/README.md:104` (M18) ; `mk/docs/ERRATA.md:186-188` ; `mk/paper/micro-kiki.tex:50,187` | Retrait textuel, compris dans les 8 h de `RM:97`. |
| MK-09 « +7 pp » (`cat:216`) | rapport technique | **fermer comme non-test** | La comparaison est nulle : Δ = −0,0102 sur 30 paires (14 contre 16). « +7 pp » est un Δ de composite lexical sur n = 5 (power). Le bras « full » tourne en plus avec un juge et un détecteur neutralisés. Ce n'est pas un test de la couche cognitive. | `mk/results/eval_cognitive_ab.json` (summary) ; `mk/paper/micro-kiki.tex:50,309-329` (toujours présents au 34a65f6) ; `mk/src/serving/full_pipeline_server.py:823-824,890` ; `mk/src/cognitive/judge.py:53-54` ; `mk/src/cognitive/rbd.py:40-41` | Le retrait textuel reste à faire (`RM:97`). Aucun run. |
| Table des latences (pas de ligne : constat M16 / MK-M2) | — | **retrait textuel ; aucune hypothèse** | Aucun artefact versionné ne porte 8 / 10 / 62 / 32 ms. Le seul JSON mesure 12,04 s (full) contre 12,62 s (raw) en moyenne, 13,3 contre 15,1 s en médiane (arithmétique sur 30 paires, ce tour). Le résumé (l.50) et §8 (l.495) disent encore « 4–6 s ». | `mk/paper/micro-kiki.tex:50,371-390,495` ; `mk/README.md:282-292` ; `mk/results/eval_cognitive_ab.json` (`latency_s`) | Compris dans `RM:97`. |
| MK-10 (`cat:217`) | inchangé | **reformuler** | « 36+ rappels par dialogue de 14 tours, contre un LLM sans mémoire. C'est un compte, pas une utilité. » La limite est désormais écrite dans le papier. Un RAG naïf est le meilleur système dans 6 des 7 réglages comparés par Bao et al. (cité `tex:493`, résumé moteur). | `mk/paper/micro-kiki.tex:293,493` ; arXiv:2610.30755 (Bao et al., résolu) | Aucun ; alimente NH-85. |
| MK-11 (`cat:218`) | inchangé (réfuté sur données réelles) | garder | — | `ap/README.md:104` (M18 : le null hors distribution dépasse le prédictif) | — |
| MK-12 KnowBias (`cat:219`) | inchangé | **reformuler** | « P 0,765 / R 0,383 sur une évaluation hors ligne. Dans le serveur déployé, RBD ne signale jamais rien (`generate_fn=None`) et KnowBias n'est pas branché. » La métrique ne décrit pas le chemin servi. | `mk/src/cognitive/rbd.py:40-41` ; `mk/src/serving/full_pipeline_server.py:890` ; grep « knowbias » vide dans ce fichier ; `mk/paper/micro-kiki.tex:117,303` | Retrait textuel (CAMP et KnowBias décrits comme actifs, `tex:116-117,297,303`). |
| CAMP / Catfish (pas de ligne propre ; MK-B4) | — | **retrait textuel** | Le juge CAMP renvoie toujours `winner_idx 0` et Catfish n'a pas de générateur. Le bras « full » de l'A/B a donc tourné sans négociation active (inférence tirée du code au 34a65f6 ; le code d'avril n'a pas été relu). | `mk/src/serving/full_pipeline_server.py:822-824` ; `mk/src/cognitive/judge.py:53-54` | Ajouter à la liste des retraits de `RM:97` ; la liste n'en dit rien. |
| MK-17 (`cat:224`) | clos par erratum (ajout 02/11) | **garder** (à valider par le PI, comme noté) | — | `mk/README.md:331-335` ; `mk/docs/ERRATA.md:23` ; arXiv:2409.08290 = DOI 10.1109/tcad.2026.3718799 (résolus) | — |
| MK-23 C5 (`cat:229`, `cat:45`) | reformulé (DPI) | **garder** | Le dépôt écrit « refuted » (`mk/docs/ERRATA.md:126-130`), alors que le catalogue écrit « reformulé ». Les deux sont compatibles : la borne de 0,911 est réfutée ; ce qui reste vrai est la DPI I ≤ H(Y). PR #34 et #35 adoucissent Caro (« negligible »). | `mk/docs/paper-a/c5-literature-notes.md:32` ; `mk/docs/ERRATA.md:126-140` | Issue #11 toujours ouverte (cache `.c1-cache.npz` non versionné). |
| MK-26 échelle 20 (`cat:231`) | inchangé (renvois décalés) | **garder ; constat toujours ouvert** | `README.md:83` dit encore « alpha = 2 × rank everywhere » au 34a65f6. | `mk/README.md:83` | 0,25 h (hygiène, `vt/these-micro-kiki.md:97`). |
| MK-03, MK-04 / NH-84 null-space (`cat:211,212,326`) | inchangé | **garder ; NH-84 non posable sans Studio** | Inférence : NH-84 exige des passes bf16 contre fp32 sur la base 35B. Le Studio est éteint, et la base BF16 (~70 Go) ne tient pas dans les 24 Go de la 4090. Le contrôle M19 (angles de ΔW contre des matrices aléatoires de même rang) est CPU, posable sur ES ou KXKM si les 41 adaptateurs sont accessibles hors Studio (à vérifier : la carte HF n'a pas été ouverte). | `ap/README.md:105` (M19) ; `RM:185,216` | M19 : ≈ 2 h CPU, après M3 ou en réserve. |
| NH-65 (`cat:307`) | inchangé | **garder ; reporté de fait** | Inférence : il faut une passe de la base 35B avec les adaptateurs. La seule voie sans Studio serait la base Q4 GGUF de KXKM (backend `fc-35b`) avec conversion des LoRA MLX, jamais faite. | — | Rien ce trimestre. |
| NH-81 (`cat:323`, `cat:46`) | clos par erratum | **garder** | Constat MINEUR : `mk/docs/results/2026-10-25-nh81-joules.md:13-21` dit encore « the catalogue reading is "NH-81 supported" » et ne mentionne pas R ≤ 1 par construction (`mk/docs/prereg/2026-10-25-nh81-joules-per-token.md:22,97-99`), ni Yan et al. Le statut unifié promis (`RM:124`) n'est pas écrit dans le dépôt. Les préregs GB300 (`docs/prereg/nh81-gb300/`, `demo-35b-lora-gb300/`, PR #30-#33) sont descriptives (L0) ; aucun résultat GB300 n'est versionné. | fichiers cités | Erratum NH-81 : 1 h (`vt/these-micro-kiki.md:95`). |
| NH-85 (`cat:327`) | reporté après M3 | **reformuler (portée) ; rester reporté** | H10 devient : « Aeon (Atlas + Trace de micro-kiki) ne dépasse pas un RAG naïf (dense + rerank sur l'historique brut) à budget de contexte égal, sur LoCoMo et LongMemEval. » C'est une réplication ciblée de Bao et al. sur un système de plus, pas une question ouverte (antériorité lue en résumé seulement). H9 (LoRA d'épisodes) garde PEAM, CLIK et Routed CL comme voisins. | arXiv:2610.30755 ; arXiv:2606.29914 (MemDelta) ; arXiv:2605.27762 (PEAM) ; arXiv:2610.38356 ; arXiv:2610.38796 (tous résolus) ; `mk/paper/micro-kiki.tex:493` ; issue micro-kiki #13 | Posable sans Studio (voir Q1) : KXKM 4090, modèles ≤ 8B de trois familles, code `mk/src/memory/`. ≈ 16 h (`issue #13`) + 1 j de 4090. Après M3. |
| NH-89 (`cat:331`) | inchangé | garder | Substrat MLP sur M1 : pas de dépendance au Studio. | — | — |

### 1.2 baby-brain

| Id | Statut v2 | Proposition | Nouvel énoncé ou changement | Preuve | Effet sur le trimestre |
|---|---|---|---|---|---|
| BB-01 Claim A (`cat:193`, `cat:49`) | artefact plausible | **reformuler (préconditions)** | « Claim A ne devient testable qu'avec : (1) une porte sur le pas après l'optimiseur, car la porte actuelle multiplie les gradients avant AdamW ; (2) un E0 apparié en cadence et en balayage d'hyperparamètres ; (3) des diagnostics de plasticité (unités dormantes, rang effectif, norme des poids) sur les deux bras, faute de quoi un écart E1−E0 peut venir d'une dégradation d'E0. » Il faut aussi citer les deux côtés du débat développemental. | `bb/baby_brain/ontogeny/integration.py:93-109` ; `bb/baby_brain/ontogeny/__main__.py:1519` (AdamW) ; commits 44515e9 et 4bb2510 ; DOI 10.1038/s41586-024-07711-7 ; arXiv:2012.03107 ; `vt/these-baby-brain.md:84` | Aucun run. La porte sur le pas reste reportée (`RM:128`). Voir BB-N1 pour un test de harnais de quelques minutes CPU. |
| Mécanisme de Claim A dans le brouillon | (B18) | **constat MAJEUR** | Le brouillon dit toujours « the gate snapshot is applied for real to the gradients via `mlx.utils.tree_map` — this is the mechanism Claim A tests ». Il ne mentionne nulle part l'invariance d'échelle d'Adam (grep « adam » : seule occurrence l.729, celle de Dohare). PR #291 a ajouté les limites d'E0 sans celle-ci. | `bb/docs/paper/2026-05-22-ontogenetic-wml-draft.md:406-408,729` | 0,5 h de texte. |
| BB-03 Claim C (`cat:195`) | inchangé | **reformuler** | « E4 est nul par construction (le rêve renvoie les latents tels quels). S'il est rouvert, il doit écrire réellement dans les poids et comparer à un contrôle ridge / arrêt précoce de force 1/t_d, faute de quoi "rêve" et "régularisation" ne se séparent pas. » Sleep-CWM devance le dessin. | `ap/README.md` B20 ; commit 46feb38 ; DOI 10.1016/j.neunet.2024.106389 ; OpenReview KdVy927FLx (résolu par recherche) | Reporté (décision PI, `46feb38` : « to be decided by the PI »). |
| BB-02, BB-05 à BB-18 (`cat:194,196-208`) | inchangé | garder | Rien de neuf (aucun code touché depuis 376fe83). | `git diff --stat 376fe83 HEAD` | — |
| NH-77 WML-JEPA (`cat:319`) | reporté après M3 | **garder le report ; reformuler la précondition** | « Le ratio d'échantillons ≥ 2 (JEPA contre reconstructif) ne se lit que si le prédicteur JEPA a un régularisateur anti-effondrement explicite et une cible qui identifie la vitesse (transition ou code de mouvement). » Sinon, un JEPA peut atteindre son minimum en écartant les modes utiles, et le ratio mesure l'effondrement. | arXiv:2610.06805 Prop. 1 ; arXiv:2610.07540 Lemma 2 ; arXiv:2610.04585 Prop. 1 (cités par `bb` 46feb38 et 44515e9 ; lus par le dépôt, pas par cette passe) ; arXiv:2603.19312 (LeWM) | Garde son sens. La jalon Q5 (`RM:162`) doit hériter des deux préconditions. |
| NH-78 (`cat:320`) | inchangé | **reformuler (précondition)** | Même précondition que BB-01 (porte sur le pas, E0 apparié). Licence AXIOM toujours à vérifier. | comme BB-01 | — |
| NH-79 copie d'efférence (`cat:321`) | inchangé | **reformuler** | Selon Zhang et al., Prop. 1 (lu via `bb` 44515e9), une fenêtre d'entrée seule ne change pas la cible. Injecter action et proprioception dans le prédicteur ne rend donc la vitesse identifiable que si la proprioception la contient déjà, ce qui serait trivial sur Reacher. Énoncé : « À cible fixée (une image), l'action seule ne restaure pas R² vitesse ≥ 0,6 ; prédire la transition, ou ajouter une cible de mouvement, la restaure. » Bras proprioception sans vitesse obligatoire. | arXiv:2610.04585 (résolu) ; `bb/docs/paper/2026-05-22-ontogenetic-wml-draft.md` (paragraphe « Single-frame latent targets », 44515e9) | Aucun ce trimestre. |
| NH-86, NH-88, NH-90 | inchangé | garder | — | — | — |
| NH-87 (`cat:329`) | inchangé (« seule question neuve ») | **garder** | Toujours sans scoop trouvé (absence à recouper, `vt/these-baby-brain.md:90`). Le bras (b) doit choisir entre deux contrôles BabyCL : le budget apparié de l'arXiv v1, ou le flux partageant rejeu, calendrier et exposition de la version ICLR. Il hérite aussi de la critique d'E0 (Dohare). | `vt/these-baby-brain.md:48-49` ; arXiv:2606.05115 ; arXiv:2604.10333 ; DOI 10.1111/cogs.12390 | Dessin 2 h (`vt/these-baby-brain.md:108`). |

### 1.3 rescience-nh01 et note méthodo

| Id | Statut v2 | Proposition | Nouvel énoncé ou changement | Preuve | Effet sur le trimestre |
|---|---|---|---|---|---|
| NH-01 / C1 (`cat:243`, table C `cat:50`) | artefact plausible ; « à déclarer à l'éditeur » | **reformuler (portée) ; la part « déclaration » est faite** | « Sous la convention de l'article (J_ii = 0 dans les deux bras), C1 se réplique sur graines neuves : 3,90 (graines 200-209 ; 3,86 sur 0-9). Avec la diagonale gardée dans les deux bras : 1,90 [1,85 ; 1,96], ni confirmé ni réfuté par la règle C1. 3,05 [2,99 ; 3,10] est un rapport mixte qui ne correspond à aucun protocole publié. » C5 : inconclusive ; C6 : ΔD positif. | commentaire #147 du 04/11 17:47 UTC, §2 ; `nw/docs/results/2026-10-31-nh01-diagonal-ablation.md:15-16,31-33` | Voir le constat C-1. v2 ReScience : tableau aux deux conventions (`RM:78`) ; 4 h inchangées. |
| Table C « paper-methodo » (`cat:51`) | reformulé (« bit-exact » → reproduction interne) | **garder la reformulation et l'étendre** | « Reproduction bit-exacte intra-hôte x86-64 (bruit 0,0 sur 9 120 cellules). Inter-ISA (GB300 aarch64) : INCONCLUSIVE_STRICT sous le protocole gelé (écart maximal 3,759e-12 > 1e-12) ; REPRODUCED seulement sous une tolérance post hoc de 1e-10. » | `rn/docs/prereg/arm-reproduction/amendment-2026-11-04.md:10-13,31-38,64-89` | La note ne peut plus écrire « bit-exact » sans qualificatif (constat C-2). |
| Hypothèses de la note (aucune ligne A/B) | — | **poser deux lignes** (T-N1, T-N3 ci-dessous) | Voir Q3. | — | — |

## 2. Nouvelles hypothèses à poser (numérotation provisoire)

**MK-N1 — Le gain cognitif est un effet de longueur.**
- Énoncé : sur les 30 paires de l'A/B, le Δ du composite s'explique par le Δ de longueur.
- Prédiction : la pente de Δcomposite sur Δlongueur est positive, et le Δ résiduel à longueur égale est nul.
- Nul : permutation des étiquettes full/raw au sein des paires (B = 10 000).
- Contrôle : sous-score « coherence » seul.
- Substrat : JSON versionné `mk/results/eval_cognitive_ab.json` (scores `length`, `keyword_*`, `coherence`) ; aucun modèle.
- Coût : 1 h, arithmétique CPU.
- Source : `ap/inventaires/micro-kiki.md:142` (composite = 0,5 recouvrement + 0,3 mots-clés + 0,2 longueur) et le code du juge neutralisé (§1.1).
- Lien : MK-09.
- Nature : contrôle d'artefact. Il ne rouvre pas MK-09 ; il dit pourquoi « +7 pp » n'est pas un signal. Non citable comme résultat confirmatoire.

**BB-N1 — La porte actuelle est un placebo sous AdamW (test de harnais).**
- Énoncé : avec la porte sur le gradient (`integration.py:93-109`) et AdamW, une porte g = 0,5 laisse le pas ‖Δθ‖ du module à ±5 % de celui à g = 1 ; à g = 0, le pas n'est pas nul si les moments sont déjà accumulés.
- Prédiction inverse pour une porte appliquée après le pas : ‖Δθ‖(g) = g·‖Δθ‖(1) à ±1 %.
- Nul : rapport de pas dans [0,95 ; 1,05] pour la porte actuelle.
- Contrôle : SGD sans moment, où la porte actuelle doit donner le rapport g.
- Substrat : CPU, MLX ou NumPy, quelques minutes, sur ES (pas sur GrosMac).
- Coût : 4-6 h de code et de tests (`vt/these-baby-brain.md:110`).
- Source : B18 ; patron UPGD-W (OpenReview 0OjuBwn9tu) ; arXiv:2610.41130 (tests de régression de harnais).
- Lien : BB-01, NH-78.
- Statut : test de manipulation, pas un run de Claim A ; il ne passe pas le verrou de lecture. À décider par le PI : `RM:128` reporte « la porte » après M3, mais le test de harnais coûte quelques minutes de CPU.

**BB-N2 — L'écart E1−E0 est porté par la perte de plasticité d'E0.**
- Énoncé : à curriculum par stades identique, E0 à plasticité constante montre une hausse de la fraction d'unités dormantes et une baisse du rang effectif. L'écart E1−E0 diminue d'au moins 50 % quand E0 est remplacé par un E0 qui préserve la plasticité (shrink-and-perturb ou continual backprop), à cadence et balayage appariés.
- Nul : écart inchangé (TOST ±20 % de l'écart initial).
- Contrôle : E0 apparié (Wu et al.).
- Substrat : bras MiniGrid SP7, macM1 ou KXKM, 5 graines.
- Coût : ≈ 2 j-machine après BB-N1.
- Source : PR #291 (44515e9, 4bb2510) ; DOI 10.1038/s41586-024-07711-7 ; arXiv:2012.03107.
- Lien : BB-01, NH-87.
- Statut : reporté après M3, sous verrou.

**T-N1 — Les errata du programme sont détectés hors de la chaîne.**
- Énoncé : dans les registres d'errata des cinq dépôts, au moins 70 % des corrections publiques sont détectées par relecture externe ou recalcul, et non par un garde, un tag ou un nul de la chaîne.
- Prédiction : proportion ≥ 0,7.
- Nul : proportion ≤ 0,5, l'unité de compte étant fixée avant le comptage (« une affirmation publique corrigée = une ligne », `pm/paper/manuscript.md:40`).
- Contrôle : codage du détecteur à l'aveugle par un second lecteur (agent sans contexte).
- Substrat : lecture, aucun calcul.
- Coût : 3-4 h.
- Source : `pm/paper/sections/03-chain.md:336-342` (« the chain cannot save a measurement that does not measure ») ; E-01 à E-03 de micro-kiki, détectés par la revue du 24/10 (`mk/docs/ERRATA.md:14-19`) ; NH-01 diagonale, détectée par recalcul de la revue du 01/11.
- Lien : la ligne paper-methodo de la table C (`cat:51`).
- Effet : fait de « errata comme résultats » une affirmation testée et préenregistrable (L1 avant comptage).

**T-N2 — Tolérance inter-plateformes du noyau NH-01, en prédiction.**
- Énoncé : sur une troisième plateforme (x86-64 AVX2 de KXKM, ou arm64 Apple du macM1), le run confirmatoire reproduit `data/` à moins de 1e-10 sur tous les champs bornés, avec des champs discrets identiques.
- Nul et réfutation : un champ discret diffère, ou l'écart dépasse 1e-10.
- Contrôle : second run intra-hôte (attendu : 0,0).
- Substrat : CPU, ≈ 2,8 h à 2 workers (`amendment-2026-11-04.md:28`).
- Source : amendement du 04/11. La tolérance 1e-10 y est post hoc (`:10-13`) ; elle ne devient prédictive que figée avant le troisième hôte.
- Lien : NH-01, `cat:51`.
- Coût : 1 h de gel + 3 h CPU. Ne touche ni le verrou N10-D ni le Studio.

**T-N3 — Les nuls calibrés changent des verdicts.**
- Énoncé : sur les verdicts du programme où un nul fixe et un nul calibré ou apparié existent tous deux, au moins trois verdicts changent de catégorie.
- Cas candidats, à recenser avant lecture des catégories :
  - mKNN 18,8× contre ≈ 2,5-3× sous nul intra-cluster (agent seul, à refaire) ;
  - Me6 sur grille historique contre grand n ;
  - NH-01 m = 0,30, « non calculable » plutôt que « 44× » (`pm/paper/manuscript.md:52`).
- Nul : aucun changement.
- Coût : 3 h de lecture.
- Source : `pm/paper/manuscript.md:29-31` (§3.3) ; table C `cat:37`.
- Effet : sans cette ligne, §3.3 de la note est une description, pas une affirmation testée.

**T-N4 — Les descriptions de pipeline dérivent du code servi.**
- Énoncé : dans les papiers « système » du programme, au moins un module décrit comme actif est neutralisé dans le code servi.
- Cas connus : CAMP, RBD et KnowBias dans micro-kiki ; porte de plasticité et rêve-identité dans baby-brain (B18, B20).
- Nul : 0 cas sur un échantillon fixé (micro-kiki, baby-brain, nerve-wml).
- Contrôle : les tests de manipulation de arXiv:2610.41130.
- Coût : 4 h de lecture.
- Lien : alimente §7 de la note méthodo (« a measurement that does not measure », `pm/paper/manuscript.md:68`) et T-N1.

## 3. À fermer

| Id | Preuve | Ce qu'on peut en dire publiquement |
|---|---|---|
| MK-01, part 70,7 / 89,5 | `mk/docs/ERRATA.md:144-194` (erratum E-2026-10-25-03) | Erratum publiable tel quel : chiffre non reproductible depuis le dépôt (message de commit seul, poids perdus au merge). Cas d'étude pour T-N1 (« estimation présentée comme mesure »). |
| MK-09 « +7 pp » | A/B nul (Δ −0,0102, 14/16) ; n = 5 par domaine ; composite lexical ; juge et RBD neutralisés (§1.1) | Négatif : l'A/B ne montre aucun effet global de la couche cognitive et ne pouvait pas tester la négociation. Pas un résultat sur la mémoire épisodique. |
| MK-17 | E-2026-10-25-01 ; arXiv:2409.08290 | Clos (déjà, à valider par le PI). |
| NH-81 | prereg `:22,97-99` (R ≤ 1 par construction de la voie fused) | Note d'ingénierie : J/token mesuré sur M1 et M3 Pro, R ≤ 1 attendu ; aucune priorité sur « le comptage analytique trompe » (Yan et al.). |
| NH-01, part « à déclarer à l'éditeur » | commentaire #147 du 04/11 | Fait. Il reste la v2 avec le tableau aux deux conventions. |

Rien n'est fermé côté baby-brain : aucune hypothèse n'y a été testée, et aucune antériorité lue n'en ferme une. Sleep-CWM devance le dessin d'E4 sans fermer Claim C (une seule source, atelier).

## 4. Constats nouveaux depuis le 02/11

| Id | Sévérité | Constat (fait) | Chemin |
|---|---|---|---|
| C-1 | **MAJEUR** | Le catalogue (`cat:50`, `cat:243`) et la roadmap (`RM:70`, « recalcul aux deux bases (1,90 et 3,05) ») présentent 1,90 et 3,05 comme les deux bases. La déclaration envoyée à l'éditeur le 04/11 dit autre chose : les deux conventions sont 3,90 (J_ii = 0 des deux côtés, la convention de l'article, répliquée) et 1,90 (diagonale des deux côtés) ; 3,05 est « a mixed ratio [that] corresponds to no published protocol ». Inférence : le vocabulaire public interne n'est plus aligné sur ce que l'éditeur a reçu ; la v2 et la note méthodo doivent reprendre celui du commentaire. | #147, commentaire du 04/11 §2 ; `nw/docs/results/2026-10-31-nh01-diagonal-ablation.md:31-33` |
| C-2 | **MAJEUR** | La note méthodo dit encore « one bit-exact replication » (résumé), « A bit-exact replication » (§5.2) et « replicates … bit-exactly at two loads ». Or la reproduction aarch64 préenregistrée est INCONCLUSIVE_STRICT sous le protocole gelé, et REPRODUCED seulement sous une tolérance post hoc. Les deux verdicts doivent être cités ensemble (`:87-89`). | `pm/paper/manuscript.md:10,51` ; `pm/paper/sections/03-chain.md:340-342` ; `rn/docs/prereg/arm-reproduction/amendment-2026-11-04.md:82-89` |
| C-3 | **MAJEUR** | Le brouillon baby-brain décrit toujours la porte multiplicative sur les gradients comme « the mechanism Claim A tests », sans mentionner AdamW. PR #291 a ajouté deux limites (E0 et cibles) et pas celle-ci. | `bb/docs/paper/2026-05-22-ontogenetic-wml-draft.md:406-408` |
| C-4 | **MAJEUR** | Le papier micro-kiki garde, au 34a65f6, « +7 pp composite », « 4–6 s » et une couche CAMP/KnowBias décrite active, dans le résumé et le corps. Aucun retrait textuel n'est commencé (prévu S6-S13, `RM:97`). Le README dit encore « Router (mpnet + MLP) » dans la table des latences et pour la carte HF, contre MiniLM-L6 dans le papier et l'erratum. | `mk/paper/micro-kiki.tex:50,116-117,297,303,329,377,495` ; `mk/README.md:286,299` |
| C-5 | MINEUR | La note méthodo et son plan visent toujours cs.LG en primaire, alors que la roadmap demande cs.DL en primaire (stat.ME croisé). | `pm/paper/manuscript.md:4` ; `pm/docs/plan-2026-10-31-v2.md:23,237` ; `RM:73` |
| C-6 | MINEUR | Le résultat NH-81 du dépôt garde « the catalogue reading is "NH-81 supported" » sans la clôture par construction. Le statut unifié (`RM:124`) n'est pas écrit dans le dépôt. | `mk/docs/results/2026-10-25-nh81-joules.md:13-21` |
| C-7 | MINEUR | Issue micro-kiki #17 encore ouverte, alors que sa branche « corriger le README » est faite (E-03). | `gh issue list` du 06/11 |
| C-8 | MINEUR | `mk/README.md:83` (« alpha = 2 × rank everywhere ») est inchangé depuis le relevé du 02/11. | `mk/README.md:83` |
| C-9 | OK | Aeon d'Arslan est désormais cité dans `paper-a-draft-v1.md` (MK-B2 BLOQUANT du 01/11, levé pour ce fichier ; le reframe et la version FR n'ont pas été relus ici). LeCun AMI est corrigé (MK-B1). | `git diff 61056d9 HEAD -- docs/papers/paper-a-draft-v1.md` |
| C-10 | OK | baby-brain cite Fachechi 2019 et Agliari 2024 aux emplacements demandés le 01/11 (corps de PR #291). | PR #291 |

## 5. Réponses aux quatre questions

**(1) micro-kiki : ce qui est clos, ce qui reste posable sans Studio.**
- Clos par erratum : MK-01 (part 70,7), MK-17 (E-01), MK-23 (E-02 : la borne de 0,911 est réfutée, seule la DPI reste) et NH-81.
- À fermer comme non-test, sans erratum formel : MK-09 « +7 pp ». La table des latences relève du retrait textuel, pas d'une hypothèse.
- Posable sans Studio :
  - NH-85 H10, sur la 4090 de KXKM (modèles ≤ 8B de trois familles, LoCoMo et LongMemEval, code `mk/src/memory/`). L'antériorité de Bao et al. en fait une réplication ciblée ; la décision de report du 01/11 tient.
  - MK-N1 (JSON seul) et le contrôle M19 des angles (CPU, si les adaptateurs sont accessibles).
- Non posable : NH-84, NH-65 et les réévaluations MK-05 à MK-07, qui exigent la base 35B.

**(2) baby-brain : les reports après M3 ont-ils encore un sens ?** Oui, à condition d'en changer les préconditions.
- NH-77 hérite de deux préconditions publiées (régularisateur anti-effondrement ; cible identifiant la vitesse).
- La porte sur le taux reste le prérequis de Claim A. Son test de harnais (BB-N1) est assez petit pour être sorti du report si le PI le veut.
- Claim A elle-même est fragilisée sur son contrôle (E0 non neutre, Dohare). BB-N2 l'opérationnalise.
- NH-79 est à reformuler (Prop. 1 de Zhang et al.).
- NH-87 reste la seule question neuve.

**(3) Méthodo : ce qui est déjà testé, ce qui reste à poser.**
- Déjà des affirmations testées :
  - les comptes de la chaîne (tags, amendements ; vérifiés par le plan v2, `pm/docs/plan-2026-10-31-v2.md:41`, « à confirmer au moment de la soumission ») ;
  - la reproduction intra-hôte (bruit 0,0) ;
  - le verdict aarch64 INCONCLUSIVE_STRICT, un résultat préenregistré, négatif au sens strict.
- Pas encore testées :
  - « errata comme résultats » (une description ; T-N1) ;
  - « les nuls calibrés changent les verdicts » (des cas isolés, pas de recensement ; T-N3) ;
  - la reproduction inter-plateformes en prédiction (T-N2).
- « La chaîne protège contre le p-hacking par agent » doit rester une non-affirmation (`pm/paper/manuscript.md:10`, dernière phrase).

**(4) Hypothèses transverses** : T-N1 à T-N4 ci-dessus. T-N2 et T-N4 sont motivées par les nouveautés du 04-06/11 ; T-N1 et T-N3 par la veille du 02/11 (Gracia, arXiv:2610.34379, sur le genre « rapport solo préenregistré » ; Vaccaro, arXiv:2606.11217).
