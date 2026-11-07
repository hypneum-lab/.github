# Passe croisée de remplacement — refresh du catalogue des hypothèses (06-07/11/2026)

## Provenance

Passe croisée de remplacement — Claude Opus (Fable 5.1 session, sous-agent Opus), remplace la passe Codex gpt-6-astra xhigh échouée sur quota le 07/11 09:17 CET (prochaine fenêtre 12/11 06:47) ; brief `codex/brief-astra-cross.md` ; début 2026-11-07 09:30 CET, fin ≈ 09:50 CET ; modèle `claude-opus-5-5`. Rapport rendu en texte par le sous-agent (outil Write refusé aux sous-agents), transcrit ici sans modification par la session principale à 09:50 CET.

HEADs lus : `.github` 90b1e97 (FETCH_HEAD de la PR #33), baby-brain b784430, bouba_sens b9443bb, dream-of-kiki 0e0e3bf, kiki-flow-research 39b6419, library 2760027, micro-kiki 34a65f6, nerve-wml 36fab29, paper-methodo-2026 ea086a9. Têtes de PR nerve-wml : #100 c0f6760, #116 ca3f07e, #117. État GitHub lu par `gh` vers 09:40. Scripts : `scratchpad/xreview/recount.py`, `arxparse.py`.

Même famille de modèles que les relectures du 06/11 : il n'y a toujours pas eu de relecture par une autre famille. `critique/` et `codex/` lus après rédaction des constats. Rejoint C-B1, C-M4, C-M5, X-M2 et X-M6 ; contredit X-B1 (KFR-H2) ; nuance X-M9 (nouveauté de NWML-N1). B-1 et M-1 sont nouveaux.

## En bref

- **Comptes : 1 BLOQUANT, 6 MAJEUR, 7 MINEUR.**
- **Recomptage : aucun écart.** Script sur les tables : 19 fermés / 59 reformulés / 25 gardés / 1 abandonné / 187 non touchés.
  - Par table : C = 2/11/5/0/2 ; A = 17/27/11/1/124 ; B (lignes v2) = 0/21/9/0/61, plus 22 « inscrite ».
  - Table B : 113 lignes. Contrôles : 2. Proposées non inscrites : 14.
  - Verdicts table A identiques à ceux annoncés : v2 = 55/24/7/27/13/20/12/18/4 et v3 = 48/21/6/35/16/23/10/17/4 (confirmé / réfuté / nul / non concluant / rétracté / amendé / en attente / non testé / non vérifiable).
  - 23 lignes changent de classe, comme annoncé.
  - Seul écart de chiffres : `README.md:17` (§0) dit encore « 103 lignes, 58 à reformuler » ; c'est 104 et 59 depuis l'ajout de MK-17 à 21:10.
- **Décisions du 07/11 (§7 du README).** R1 à R4, R6, R8 et R9 cohérentes avec le catalogue et la ROADMAP. Nouveaux numéros de ligne ROADMAP exacts (:28, :132, :164). R7 et NH-113 posent problème (B-1, M-4, M-6). NH-32 hérite de B-1.

## Les 5 désaccords principaux

1. **B-1 (BLOQUANT, nouveau) — Ce que la préreg N10-D appelle « NWML-N1 » n'est pas ce que le catalogue inscrit sous NH-113.**
   - Préreg : NWML-N1 = contraste `eng − msg_shuffle` sur la paire `eng`, et « applying it to the `learned` arm is not decided here » (PR #100 c0f6760, `protocol.md:106-107` et `:495` ; commit e48cc6e du 06/11 20:56).
   - Catalogue : `catalogue-v3.md:361` (NH-113) et `:44` (N10-D) parlent de la paire `learned` et de son usage causal du canal. `:280` (NH-32) et la veille tour 2 (§3.1) font de même.
   - Inférence : le test réellement enregistré est le contrôle 2 sur un code idéal fixé, à résultat attendu. La question centrale n'est enregistrée nulle part ; l'application de la décision Q3 (« secondaire exploratoire déclaré ») ne vaut pas en l'état.
   - Réparable : PR #100 est un brouillon L0, pas gelé.
2. **M-1 (nouveau) — Catalogue et rapport du 07/11 disent « à signer » deux ADR déjà signés.**
   - ADR-0003 nerve-wml signé 06/11 21:13 (882b567), PR #118 fusionnée (36fab29). ADR-0001 dream-of-kiki (dérogation principes 4 et 6 pour #92 et concurrence P8c) signé 21:14 (3f635b3), PR #93 fusionnée (0e0e3bf).
   - Encore « non signé » / « à signer » dans `catalogue-v3.md:38, 102, 360, 398, 444` et `README.md:23, 29, 66, 73, 220`. Le catalogue ne cite jamais l'ADR-0001 de dream-of-kiki.
   - Conséquence : condition « aucune lecture avant les deux signatures » remplie ; valeurs de #92 lisibles à la fin du run (07-08/11) ; P8c en lecture non confirmatoire, plafond de mur au 10/11 19:34Z.
3. **M-2 — Verdicts incohérents sous ADR-0024 : les négatifs les plus défectueux gardent « réfuté ».**
   - BS-B1, BS-HB1, BS-LOCK passent « réfuté » → « non concluant » par P1 au seul motif d'ADR-0024.
   - BS-COMP, BS-TAU, BS-S14c, BS-N12 gardent « réfuté » (`catalogue-v3.md:180-183,191`) ; même périmètre ADR-0024 (`:32-40` : « lock, gating, τ and codebook-freeze scans, N12 ») et cumulent le pont Studyforrest perdu et mal lu.
   - BS-SF45 et BS-CBF passent « rétracté » alors que l'erratum garde leurs chiffres « as historical results » (`main.tex:538-539`).
   - On retire les positifs et garde les négatifs ; ADR-0024 dit « not evidence for or against » (symétrique). Lecture cohérente avec P1 : les quatre lignes → « non concluant ». Effet : réfuté 21 → 17, non concluant 35 → 39.
4. **M-3 (contredit X-B1) — KFR-H2 ne devrait pas être « réfuté ».**
   - L'inventaire motivant la fermeture dit « nul attendu par construction » (`inventory/kiki-flow-research.md:46,112`).
   - Par la supposition S2 du rapport et par P1, un négatif qui ne pouvait pas sortir autrement est un non-test → « non concluant ». À défaut, garder « amendé ».
5. **M-4 — La nouveauté de NWML-N1 est plus étroite que ce qu'écrit le rapport.**
   - Le rapport dit que la nouveauté « se réduit au dérangement » des messages (N-8, colonne référence de NH-113).
   - `nerve-wml:docs/prereg/n10d/reading-note.md:115` range déjà le dérangement parmi les protocoles publiés ; résumé de arXiv:2610.28905 (Gazzaev et al. 2026) vérifié.
   - Reste neuf : la combinaison décrite au tour 2 (§6) : `learned` sous PPO contre `nocomm` entraîné de zéro, nul apparié par graine. NH-113 doit citer 2610.28905 et 2607.26773.

## Autres constats

### MAJEUR
- **M-5** — NH-01 ne cite pas Vinci, Galluzzi, Mattia 2025 (arXiv:2504.04560) : les auto-couplages (autapses) changent qualitativement le paysage d'énergie. Connu du labo, noté « à récupérer avant la v2 » (`library/references/INDEX.md:780` ; `ANALYSE-2026-11-04…:163,328`). Source unique, à recouper.
- **M-6** — R7 ferme le volet H9 sur une note de lecture hors dépôt (`scratchpad/r7-elife-112891/note-lecture-2026-11-07.md`). Les chiffres (99,5 / 86,8 et ≤ 73 / 59) ne sont vérifiables dans aucun dépôt. L'eLife (Pan, Hahami, Siegelmann, Sompolinsky) et arXiv:2504.21239 (Pan, Hahami, Zhang, Sompolinsky) n'ont ni le même titre ni les mêmes auteurs : « première version » à recouper. Si les chiffres sont justes, l'écart ≈ 26 pp dépasse le seuil de réfutation de H9 (> 10 pp) : la littérature va contre la prédiction, plus qu'une antériorité.

### MINEUR
- **m-1** — Compteurs du §0 du README (103/58 → 104/59).
- **m-2** — N-10 cite `papers/paper1/main.tex:104` ; la phrase « surrogate-gradient spiking LIF » est à `:152`.
- **m-3** — `ROADMAP.md:125` : « NH-102, renumérotée le 01/11 » est faux (le 01/11 elle est devenue NH-91).
- **m-4** — Puissance du test des signes en dents de scie. À π = 0,7 : 0,958 (k = 18), 0,946 (19), 0,933 (20), 0,971 (21). « k = 18 » = premier franchissement, pas un plancher. Pour rester ≥ 0,9487 à tout k au-dessus : k ≥ 21 (π = 0,7), 28 (0,6), 44 (0,5).
- **m-5** — Venue de PEAM incohérente : « CoRR 2026 » (C-3) contre « Findings EMNLP 2026 » (R7).
- **m-6 / m-7** — Citations d'ADR-0003 et contrainte de lecture de NH-112 périmées (suite de M-1).

## Vérification constat par constat (livrable 1)
- **Confirmés** : N-1, N-2, N-5 (dépassé depuis R8), N-6, N-10, N-11, N-12, N-13, N-14, N-15 ; n-1, n-6, n-8, n-10 (résolu : #82 fermée, #83 ouverte), n-11, n-14, n-15, n-17, n-18 ; E-1, E-2, E-3 (pour E1), E-5, E-7, E-8, E-9.
- **Confirmés et aggravés** : N-7 (voir B-1).
- **Faits confirmés, inférence nuancée** : N-8 (M-4) ; N-16, juste à 18:57, dépassé à 21:13 (M-1).
- **Réfuté depuis 21:13 le 06/11** : n-2 (ADR-0003 signé).
- **Non vérifiés faute de temps** : N-3, N-4, partie de N-9 ; n-3, n-4, n-5, n-7, n-9, n-12, n-13, n-16 ; E-4, E-6. B22 invérifiable ici (`rescience-nh01` non cloné).

## Recalculs (livrable 4)
- **§4.1 (N10-D)** : tous les chiffres retrouvés. k = 20, m = 15, α réel 0,021. Puissance par backend 0,617 / 0,804 / 0,933 / 0,989 à π = 0,5 / 0,6 / 0,7 / 0,8. k au premier franchissement de 0,90 : 33 / 23 / 16 ; de 0,95 : 42 / 28 / 18. Code à un bit : succès attendu 0,4808.
- **« +7 pp » micro-kiki** : sous inversion de signe sur les 30 paires, P(max des six domaines ≥ observé) = 0,424 (B = 100 000) ; domaine `power` seul p ≈ 0,094.
- **§4.2 (B-3)** : confirmé. Fait absent du rapport : même à n = 4 096, la règle 0,02 se déclenche sur le mock dans 0,748 et 0,981 des cas.
- **§4.3 (B-2)** : confirmé. Fait absent : sur la sonde stratifiée, une graine dépasse le seuil (MINE +0,74 bit) sur un réseau qui échoue la porte ; le dépôt n'interprète pas ces p.

## Ce qui manque au rapport (livrable 5)
- Signatures et fusions du 06/11 au soir (M-1), et ce qui devient lisible à la fin de #92.
- Relecture de la préreg N10-D après Q3 contre le catalogue (B-1).
- Préparation de la fin de P8c (plafond 10/11) et libération de KXKM.
- Vinci et al. 2025 sur J_ii (M-5), avant la v2 ReScience.
- Les deux faits de dépôt du livrable 4 (mock n = 4 096 ; graine 2 de B-2 stratifiée).
- Provenance hors dépôt de R7 (M-6).

## Références 2025-2026 (livrable 6)
20 références résolues par l'API arXiv ou Crossref le 07/11 entre 09:35 et 09:45.

| Référence | Ligne touchée | Motif |
|---|---|---|
| arXiv:2504.04560, Vinci, Galluzzi, Mattia 2025 (à recouper) | NH-01 | M-5 |
| arXiv:2610.28905, Gazzaev et al. 2026 | NH-113 | M-4 |
| arXiv:2607.26773, Zhang, Emu 2026 | NH-113 | M-4 |
| arXiv:2610.37849, Denamganaï 2026 (à recouper) | NH-32 | mettre le message à zéro en test décale la distribution |
| arXiv:2609.34373, Chauhan, Bera 2026 | NH-113, NH-33 | chiffres de N-8 confirmés au résumé ; cadre MuJoCo, pas un jeu de Lewis |
| arXiv:2611.01666, Xu, Chen 2026 | NH-113, NH-32 | soutient la reformulation du 07/11 |
| arXiv:2602.14486, Gröger, Wen, Brbić 2026 | NWML-PRH, NH-111 | E[mKNN] = k/(n−1) sous H0 ; fonde le plancher de la PR #117 |
| arXiv:2610.20286, Shi et al. 2026 (à recouper) | NWML-PRH, NH-45 | portée de l'excès mKNN |
| arXiv:2604.18572, Koepke et al. 2026 | NWML-PRH | mKNN à k fixe dépend de n |
| arXiv:2609.27252, You et al. 2026 | N10-D | identifiant confirmé |
| 10.7554/eLife.112891.1, Pan, Hahami, Siegelmann, Sompolinsky 2026 | NH-85 | M-6 |
| arXiv:2504.21239, Pan, Hahami, Zhang, Sompolinsky 2025 | NH-85 | auteurs différents de l'eLife |
| arXiv:2606.08447, Bazhenov, Delanois, Krishnan 2026 (à recouper) | DOK-N3 | effet d'ordre des tâches |
| arXiv:2508.14081, Kubo, Delanois, Bazhenov 2025 | NH-102, DOK-H14 | rejeu de type sommeil sur RNN |
| arXiv:2606.03979, Behrouz et al. 2026 | DOK-H14 | voisin direct d'E1-small |
| arXiv:2611.04338, Chen et al. 2026 | T-N1 | confirmé |
| arXiv:2611.05577, Modgil 2026 | NH-77 | confirmé |
| arXiv:2602.12035, Calvano et al. 2026 | N10-D §4.4 | résolu, non lu par cette passe (lu en entier par l'agent §4.4, PR #125) |
| arXiv:2611.00516, 2611.08258, 2603.09384 | NH-12, NH-112 | identifiants confirmés |
| 10.1016/j.neunet.2025.107216, Serricchio et al. 2025 (à recouper) | NH-112 | comparateur pour le désapprentissage rêvé |

## Décisions à prendre par le PI
1. **B-1** : (a) étendre `protocol.md:495` à la paire `learned` ; (b) réécrire NH-113 en « non enregistrée » ; (c) noter seulement la divergence. Avant le gel S6.
2. **M-1** : passer Q4 en « appliquée » partout et fixer ce qui sera lu à la fin de #92 et de P8c.
3. **M-2** : COMP, TAU, S14c, N12 → « non concluant », ou règle asymétrique écrite et justifiée.
4. **M-3** : KFR-H2 « non concluant » ou « réfuté ».
5. **M-5** : lire Vinci et al. 2025 avant la v2 ReScience, oui ou non.
6. **M-6** : versionner la note R7 dans un dépôt ; dire si l'écart ≈ 26 pp compte comme évidence contre H9.
