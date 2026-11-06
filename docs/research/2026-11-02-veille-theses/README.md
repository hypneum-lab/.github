# Thèses, veille et relecture du dossier — 2026-11-02

Passe demandée par le PI le 02/11/2026 à 19:02 (« dossier et thèse et veille scientifique avec relecture »), exécutée de 19:10 à 20:30 CET. Un fichier par thèse, une relecture du dossier de présentation v3, une relecture indépendante à contexte vierge, le suivi de ses constats. Aucun calcul lancé, aucune préreg touchée, aucun verdict sur E1-small, N10-C run 2, Me6 ou M5 ; le verrou de lecture n'est déclaré passé pour aucun chantier.

## Contenu du dossier

| Fichier | Objet |
|---|---|
| `these-dream-of-kiki.md`, `these-nerve-wml.md`, `these-kiki-flow-research.md`, `these-bouba_sens.md`, `these-micro-kiki.md`, `these-baby-brain.md`, `these-rescience-methodo.md` | thèse en une phrase (path:line), état des hypothèses face au catalogue v2, veille 24/10 → 02/11, risques de scoop, outils, ce qui reste ouvert et le prochain pas sous le verrou, journal des requêtes |
| `dossier-relecture.md` | relecture du dossier de présentation du 31/10 (Claude Doc non ouvrable depuis la session ; relu à partir de ses trois sources documentaires) contre la roadmap v2, le catalogue v2, les notes de lecture et l'état GitHub du 02/11 |
| `relecture-0211.md` | relecture indépendante (Claude Opus, contexte vierge) des huit fichiers |
| `tracking-0211.md` | verdict constat par constat (confirmé / réfuté / nuancé) et corrections appliquées |
| `pre-relecture/` | copies des huit fichiers avant corrections |
| `resolve-*.tsv` | sortie de `scripts/resolve_ids.py` sur chaque fichier (0 échec partout) |
| `codex/` | brief de la passe croisée Codex et ses notes intermédiaires (passe interrompue, voir provenance) |
| `briefs/` | briefs donnés aux agents |

## Ce qui change pour chaque thèse (faits de la veille ; les inférences sont dans les fichiers)

- **dream-of-kiki** : la soumission OpenReview `3gCeBuNNyT` (« When to Sleep », atelier NeurIPS 2026) fait le dessin de NH-91 sur des agents LLM, déclencheur seul variable ; l'espace restant se réduit au substrat et au contrôle de norme, à recouper (PDF en 403). Un préprint bioRxiv (Kubo, Delanois, Bazhenov) donne une antériorité directe au contrôle « même norme » de H14-B, à déclarer avant l'analyse d'E1-small. La « Control Map » (arXiv:2610.36109) montre qu'un budget défini par le nombre de mises à jour ne fixe pas l'état final.
- **nerve-wml** : deux articles lus en entier (arXiv:2609.39243, arXiv:2511.04638) montrent qu'une intervention peut donner la bonne réponse par le mauvais mécanisme et que la restauration seule ne le détecte pas ; le critère « restauration » du dessin D1 de N10-D n'établit donc pas seul l'usage du message. Le nul « réseau à poids aléatoires » est une norme publiée (arXiv:2512.18792). Le concurrent `hukTsKYu8Y` n'a ni version arXiv ni code au 02/11. La référence Karlsson est résolue (OpenReview `iu9dbz2lB9`, poster ICLR 2026). Scoop relevé par le relecteur : arXiv:2610.33495 (alignement inter-architectures sous nul par permutation).
- **kiki-flow-research** : aucune antériorité de NH-20 dans la fenêtre ; `pmRC8xTiym` est un splitting WFR pour l'inférence variationnelle sans ordre annoncé (PDF en 403) ; arXiv:2610.38129 limite la condition C6 (courbure entropique −∞ dès que le diamètre ≥ 3, par inférence) ; « Strang + JKO ordre 1 » reste ni prouvé ni contredit.
- **bouba_sens** : la veille ne modifie aucune affirmation de la thèse ; le dépôt Kleinman est inchangé depuis 2023, la Fig. 8 reste « à recouper » ; deux soumissions ICLR 2027 devancent en partie la note méthodologique « seuil sans nul » ; arXiv:2602.09234 impose de déclarer la forme du calendrier de lésion (rampe ou marche).
- **micro-kiki** : Marconi (MLSys 2025, arXiv:2411.19379) est l'antériorité la plus proche du correctif de cache de préfixe PR #6, confirmée par HiState ; la phrase de la veille du 31/10 (« exactement le mécanisme ») est à corriger. Yan et al. (arXiv:2409.08290, version TCAD, une seule source) donnent sur matériel neuromorphe un seuil d'activité de 5,7 % sous lequel seul un SNN bat un réseau quantifié ; la transposition aux 13,8 % mesurés par NH-81 sur GPU et Apple Silicon est une inférence. Rien de neuf sur C5 ni sur l'échelle 20 ; le routage de bibliothèque LoRA est encore plus saturé.
- **baby-brain** : la prémisse de Claim A a un débat publié des deux côtés (TMLR `QFw0sg52VV` contre Lu 2026 et arXiv:2511.14440) ; Sleep-CWM (`KdVy927FLx`) devance E4 / Claim C ; le contrôle de la version ICLR 2027 de BabyCL n'est plus la comparaison à budget égal de l'arXiv, ce qui touche le bras (b) de NH-87. Les constats B18-B20 tiennent au SHA 376fe83.
- **rescience-nh01 et paper-methodo** : Takeuchi et al. (J. Phys. A 2026) et la note 4 d'Agliari 2024 donnent ses deux sources à la phrase de B21 sur la diagonale ; ReScience #147 n'a ni éditeur ni relecteur, et l'éditeur en chef demande que l'auteur fasse deux relectures (pas qu'il en propose) et confirme sur ReScience#118, ce qui n'est pas fait ; la PR rescience-nh01 #6 est fusionnée et gelée (plus un brouillon) ; les règles d'endossement arXiv de 2026 et le refus des articles de position non relus en CS mettent en question le choix cs.DL (à recouper).

## Dossier v3 : 17 corrections (5 BLOQUANT, 9 MAJEUR, 3 MINEUR), 6 ajouts prêts à coller, 7 QCM

Les cinq bloquants : M5 présenté « en brouillon » alors que les PR kiki-flow #52 et #60 sont fusionnées depuis le 01/11 ; NH-81 encore promis « à répliquer sous NVML » dans l'accroche NVIDIA alors qu'il est clos par erratum (décision PI du 01/11, issue micro-kiki #14 fermée) ; B-3 compté comme verdict négatif alors que le catalogue v2 le classe en non-test (lésion arrêtée à 19 dB) ; NH-01 présenté avec le seul 3,86 alors que l'ablation de la diagonale est enregistrée (C5 inconclusive, C6 positif) ; le Mac Studio dit « éteint depuis le 25 octobre » alors qu'il tournait au 01/11 18:10. Les justifications des 2 000 h A100 (48 runs N10, ligne E1) ne correspondent plus à aucune campagne planifiée avant M3 ; la roadmap v2 ne prévoit aucun calcul GPU avant S6.

## Relecture et provenance

- Relecteur Claude (Opus, contexte vierge) : aucun fichier à refaire ; 4 BLOQUANT (tous des « confirme / infirme » posés sur une hypothèse du labo à partir de la seule veille), 8 MAJEUR, 8 MINEUR ; 24 chiffres revérifiés dans les clones sans erreur ; 39 identifiants revérifiés à la source. Intégration : 18 constats confirmés, 1 nuancé, 1 réfuté ; 94 corrections appliquées (détail dans `tracking-0211.md`).
- Passe croisée Codex (`gpt-6-astra`, effort xhigh, recherche web) : lancée 19:54, limite d'usage atteinte à 20:08 après 353 447 jetons, **aucun rapport écrit** ; réinitialisation annoncée le 03/11 à 00:31. Ses six messages intermédiaires (`codex/salvage-astra-0211.md`) convergent avec la relecture Claude (formulations « confirme », renvois de lignes, préprint et version revue comptés deux fois) ; 7 pistes confirmées, 4 nuancées. Cette passe est à refaire.
- Agents de rédaction : sept Opus (thèses) et un Opus (dossier), 19:10 → 19:53 ; canaux arXiv, OpenReview, bioRxiv (2 034 prépublications balayées), OpenAlex en repli de Semantic Scholar (429 sur toute la passe), Crossref, DataCite, HAL, GitHub, Hugging Face, Zenodo, OSF. Aucune source lue en entier sauf quatre PDF pour nerve-wml ; les PDF OpenReview répondent 403 sur toute la passe.
- Non vérifié : le Claude Doc v3 lui-même, les brouillons Mail.app, l'état pretalx FOSDEM, les machines après le 01/11 18:10.

## Renvois vers les PR #23 et #24 (relecture croisée du 02/11)

- Les chemins `clones/.github/docs/…` des fichiers de ce dossier désignent la branche de la PR #24 (`docs/verrou-lecture-2026-11-01`), lue au commit 0de2b66. Les corrections du 02/11 (commit 3711088) sont faites dans les lignes existantes : les renvois `catalogue-v2.md:N`, `ROADMAP.md:N` et `spec:N` cités ici restent valides.
- `readme-pr23.md` (cité **[RAP]**) est identique au `README.md` de la PR #23 (`docs/research/2026-11-01-analyse-profonde/`) au commit e932a61 ; `inventory/<dépôt>.md` et `inventory/refs/` sont identiques à `inventaires/<dépôt>.md` et `inventaires/refs/` de la même PR (vérifié par `cmp` le 02/11). Les errata de la PR #23 sont en fin de son README (commit 0012574).
- Suites données dans les PR #23 et #24 : ReScience #147 (deux relectures à faire, pas deux relecteurs à proposer), Studio allumé au 01/11, catalogue v2 (3gCeBuNNyT et arXiv:2610.36109 pour NH-91, arXiv:2610.33495 pour NWML-PRH et NH-45, débat publié des deux côtés pour BB-01, état enregistré de M5, MK-17, MK-26, Marconi en addendum). La phrase « exactement le mécanisme » de `docs/research/veille-2026-10-31.md:44` porte un erratum daté du 02/11 sous la ligne (cette PR).

## Pour le PI

1. Relire `dossier-relecture.md` §5 (sept QCM) et appliquer les corrections au Claude Doc v3 avant tout envoi.
2. ReScience #147 : faire les deux relectures demandées et confirmer sur ReScience#118.
3. Avant l'analyse d'E1-small : déclarer dans un fichier daté le contrôle de même norme pour H14-B, en citant Kubo et al.
4. Relancer la passe Codex après le 03/11 00:31.
5. Les prochains pas sous le verrou (lectures, dessins, aucun run) sont au §6 de chaque fichier ; aucun ne fait passer un verrou.
