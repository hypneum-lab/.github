# Inventaire nerve-wml — refresh du catalogue (2026-11-06, soir)

Clone frais `refresh-hyp/repos/nerve-wml` (`--depth 300`), `master` @ `a1d1192` (PR #113 fusionnée). Branches lues en `git show`, sans checkout ni exécution :
- `P100` = `origin/prereg/n10d-skeleton` @ `324ec10` (PR #100, brouillon ; inclut #115) : `docs/prereg/n10d/protocol.md`, `nh96-null.md`, `analysis-4-points-2026-11-06.md` (abrégé `A4P`).
- `V1` = `origin/docs/n10d-veille-tour-1-2026-11-06` @ `6c9607d` (PR #116) : `docs/prereg/n10d/veille/tour-1-2026-11-06.md`.
- `BIS` = `origin/docs/n10c-bis-three-seeds-2026-11-06` @ `b7c0226` (PR #114) : `docs/prereg/n10c-bis/three-seeds-plan-2026-11-06.md`.
- `ADR3` = `origin/docs/adr-gate-exception-p1bis-p8c-2026-11-06` @ `2d2bf0f` (PR #118) : `docs/adr/0003-reading-gate-exception-p1bis-p8c.md`.
- `MK` = `origin/fix/mknn-floor-untrained-2026-11-06` @ `c5140b2` (PR #117) : `docs/research-notes/mknn-floor-untrained-arm.md`.
- Sur `master` : `docs/n10d/contradictor-2026-11-06/{SYNTHESE,VERIFICATION,verification-2026-11-06}.md` (`SYN`, `VER`, `VER2`) ; `docs/milestones/n10c-procgen-multiagent-gtm-comm-closure-2026-11-05.md` (`CL`) ; `docs/prereg/n10d/reading-note.md` (`RN`).
- Catalogue : `.github:docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` (`CAT`).

Identifiants résolus par API ce soir : `resolve-nerve-wml.tsv` (22 résolus ; `hukTsKYu8Y` non résolu, OpenReview 403, ne tranche rien). Aucun calcul hors arithmétique binomiale/hypergéométrique en `python3 -I` ; aucun code du dépôt importé ni exécuté. Aucun score des campagnes P1bis/P8c, A+ ou N10-C n'a été lu au-delà de ce que `CL` publie.

---

## 1. Lignes du catalogue touchées par ce dépôt

### 1.1 Lignes N10 / communication (cœur de la tâche)

| identifiant (CAT:l.) | statut v2 | proposition | nouvel énoncé si reformulé | preuve | ce que ça change au trimestre |
|---|---|---|---|---|---|
| **N10-D** (C, l.39) | préreg PR #100, « passe le verrou en premier ; sym hors de H1, covariance de graine, bras causal attendu » | **reformuler** (identifiant gardé) | « N10-D = test de tuyauterie et d'apprentissage PPO sur un jeu de Lewis asymétrique (K = 16, C = 4, A = 16) ; la nécessité du message y est fixée par construction (contraste oracle 0,75 / 0) ; H1 enregistrée = `eng − nocomm` (NH-96, VARIANTE, résultat attendu). La question scientifique restante (usage causal du canal appris) est NWML-N1. » Nature : de « étude de nécessité » à « contrôle de chaîne + porteur de NWML-N1 ». | `P100:protocol.md:52-62` (« does not test whether the message is informationally necessary ») ; `VER:14,16-18` (0,75 / 0 reproduit ; seul BLOQUANT = porte `sym`, corrigée `P100:protocol.md:117-124`) ; `VER2:43` (0 fait réfuté) ; `V1:305-324` (verdict provisoire « tranché par construction ; question réduite ouverte ») ; arXiv:1612.07182, arXiv:2410.18806 | Verrou N10-D : 19 corrections faites, tour 2 de veille et trois tests restent (`.github ROADMAP.md:87,91`). Si NWML-N1 devient primaire, k et la règle sont à refaire (§2), avant le gel S6. |
| **NH-96** (absente de CAT ; `.github:2026-10-30-etat-des-lieux/synthese/priorites-hypotheses.md:179-183`) | — (jamais reportée en table B) | **reformuler et inscrire** sous un identifiant non ambigu (voir constat C3) | « Sur le jeu asym N10-D, le bras à code ingénié dépasse `nocomm` de ≥ 0,30 (L de l'IC 95 % apparié ≥ 0,30 et test des signes, k = 20 par backend) ; `sym` hors H1 (contrôle de fuite, cas D). » Étiquette proposée : **rapport technique** (contrôle de chaîne, résultat attendu) — pas une hypothèse scientifique. L'ancien « nul » (« si < 0,1, c'est l'architecture ») est remplacé par le nul apparié de `nh96-null.md` et le cas C devient une hypothèse séparée (voir NH-37). | `P100:nh96-null.md:3-6,20-28` ; `P100:protocol.md:216-223` (table A/B/C, B = rejet de magnitude) ; `A4P:199-206` (deux B → B global, intersection-union) | Aucune heure en plus ; évite qu'un A soit lu « nécessité confirmée » (`P100:protocol.md:221`). |
| **NWML-N10C** (A, l.165) | « en attente (en cours) », inchangé | **fermer** — étiquette **non-test** (campagne arrêtée, exploratoire) | — | `CL:43-45` (arrêt définitif, 9 cellules de graine 0, « No verdict, positive or negative, is drawn on GTM communication ») ; `CL:53` (fondement antérieur à la lecture : la tâche ne requiert pas la communication, `gtm_mis` 0,81 > `gtm` 0,54-0,73, politique scriptée sans message ≈ 43 %) ; `CL:58-61` (nocomm 0,94 / 0,415 held-out ; `time_to_half` dégénéré ; écart de généralisation 0,40-0,54 ; `gtm − nocomm` +0,025 / +0,060, une graine, exploratoires, décision non aveugle) ; `CL:68` (R3 : ininterprétable comme preuve de communication) | Libère toute analyse N10-C prévue (le rapport descriptif #63 reste à écrire, `.github ROADMAP.md:30`). Aucun calcul. |
| **NH-32** (B, l.274) sensibilité/contenu sur agents N10-C | PRÊT, inchangé | **reformuler** (substrat et précondition) | « Sur les paires `learned` de N10-D qui passent la porte d'apprentissage, effet(canal mis à zéro vs intact) contre effet(message dérangé entre épisodes vs intact) : la présence/timing pèse-t-elle plus que le contenu ? » Précondition : tâche où le message est nécessaire (N10-D asym) ; sur N10-C l'objet n'existe plus. Devient le volet « contenu contre présence » de NWML-N1. | `CL:43-45,58-61` (policies N10-C : une graine, tâche sans besoin de message, S de `gtm` compatible avec 0) ; `RN:244-248` (Cheng et al. : « zéro » mêle présence et contenu, le dérangement est le contraste de contenu) ; `P100:protocol.md:89-97` (`derange_episodes` déjà codé, mais seulement sur la paire `eng`) | Évaluation seule sur des runs déjà budgétés ; coût marginal ≈ 0 GPU (inférence). |
| **NH-31** (B, l.273) cadence d'échange, « éval-only sur policies N10-C » | PILOTE/SPÉC, inchangé | **reporter après M3** (précondition non remplie) | Énoncé gardé ; précondition ajoutée : policies d'une tâche où `eng − nocomm` ≥ 0,20 (porte A+ passée) ou paires N10-D. Le jeu N10-D à un pas (`P100:protocol.md:260-270`, « one step per episode ») ne permet pas de tester une cadence. | `CL:43-45,53` ; `P100:protocol.md:260` | Rien ce trimestre. |
| **NH-33** (B, l.275) cross-play GTM vs DIAL, « sonde déjà gelée (N10-C) » | PILOTE/PRÊT, inchangé | **reporter après M3** ; nuance de portée | Volet R2 : la sonde N10-C n'a jamais tourné (« no cross-play cell », `CL:19`). Nuance : Kim 2026 rapporte une intelligibilité mutuelle sans contact qui croît avec la taille de population ; « le cross-play s'effondre » ne vaut que pour des paires. | `CL:19` ; arXiv:2606.10582 [résumé moteur] ; `V1:156-163,259` (recoupement « non à la lettre », deux preprints) | Rien ce trimestre. |
| **NH-37** (B, l.279) goulot couplé, canal branché sur le latent de politique | PILOTE, inchangé | **reformuler** (précondition) | « Si N10-D asym donne le cas C (D̂ < 0,10), un canal branché sur l'entrée de politique (et non sur le latent) relève-t-il D ? » C'est exactement l'hypothèse réservée au cas C (`P100:protocol.md:220`) ; sa version N10-C (tie Q1/N10-C) perd son objet tant que la tâche Procgen ne requiert pas le message. | `P100:protocol.md:220` ; `CL:53` | Conditionnelle au verdict N10-D (S10 au plus tôt) ; aucun coût avant. |
| **Claim B** (C, l.36) ; **NWML-B** (A, l.133) ; **NWML-FE** (A, l.143) | artefact plausible ; « à refaire avec test causal » | **garder** l'étiquette ; préciser le test causal attendu | Le test causal d'usage du canal sur MLP↔LIF est NWML-N2 (§2), reporté après M3 ; il suppose NWML-N1 réussi d'abord sur substrat homogène. | `V1:263` (§ 4.2 « jamais de substrat impulsionnel », recoupement non) ; `RN:166-170` | Aucun. |
| **NWML-PRH** (A, l.140) ; **mKNN** (C, l.37) ; **NH-45** (B, l.287) | artefact plausible / utile, sous verrou | **reformuler** (portée : pas de dynamique impulsionnelle) | NWML-PRH : « alignement mKNN entre l'état MLP et une projection **affine** de l'entrée du LIF (`lif.input_proj(lif_encoder(x))`, aucun pas impulsionnel) ; 18,8× contre deux gaussiennes indépendantes ». NH-45 : énoncé gardé ; le bras non entraîné et le plancher k/(n−1) sont désormais codés (PR #117, aucun chiffre produit) ; le plancher est « non informatif » comme comparaison, le bras non entraîné est le contrôle qui peut faire échouer. | `MK:69-76` (fait : embedding LIF = deux `Linear`, pas de pas impulsionnel) ; `MK:50-56,78-90` ; `MK` script `_embed` (l. 123 de `scripts/platonic_rh_alignment.py` sur la branche) ; `papers/paper1/main.tex:104` (« ANN vs spiking LIF with surrogate-gradient ») ; arXiv:2602.14486 Prop. 4.2 ; issue #110 | Bras non entraîné : minutes CPU sur macM1 (3 graines) ; à lancer seulement sous verrou (test post hoc, `MK:9-15`) ; décision PI sur le texte de Paper 1. |
| **NH-35** (B, l.277) alignement MLP↔LIF relationnel | PRÊT/PILOTE, inchangé | **reformuler** (précondition) | Ajouter : « embeddings LIF pris **après** la dynamique impulsionnelle (sortie de membrane ou trains de spikes), sinon le test porte sur une fonction affine de x ». | `MK:69-76` | Aucun avant M3. |
| **canal PSK γ/θ** (C, l.38) | neuf, recouvert en partie | **garder** | — | rien de nouveau au 03-06/11 dans les sources lues | — |
| **NH-28** (B, l.270) alphabet dimensionné par le canal | PILOTE, inchangé | **garder** ; ajouter une source | Ajout de arXiv:2410.18806 (le jeu de Lewis se résout souvent avec un ou deux symboles) comme borne basse côté tâche, à distinguer de la borne côté canal (jitter). | `V1:81-91` [résumé moteur] | — |

### 1.2 Hopfield P1bis / P8c (absents du catalogue)

| identifiant | statut v2 | proposition | énoncé | preuve | trimestre |
|---|---|---|---|---|---|
| **NWML-P1bis** (à créer, table A) | — | **inscrire** avec l'étiquette nouvelle « préreg gelée, verrou non passé (ADR-0003) » ; nature **exploratoire** pour tout usage public | « Dans un Hopfield à couplages bornés (A = 0,4, P = 0,15 N), le rêve de Marinari stabilise plus de motifs que deux contrôles à budget de Frobenius égal (désapprentissage d'états aléatoires d′ ; bruit gaussien g). » | `docs/prereg/hopfield-p1bis-ext/prereg.md:16-28` ; `ADR3:96-103,107-117` (aucune note, aucun contradicteur, aucun tour ; aucun langage confirmatoire, aucun « first/novel/necessary ») | Gate post hoc ≈ 19-25 h PI par étude, non budgété (`ADR3:159-163`). |
| **NWML-P8c** (à créer, table A) | — | idem | Même question, sans plafond de bisection, N = 4096 et 16384 (relance du 05/11, fin prévue 08-10/11). | `docs/prereg/hopfield-p8c-nocap/prereg.md` ; `ADR3:47-53,173-180` | idem ; le KPI « tags sans verrou » vaut 2 en S2 (`ADR3:100-103`) contre 0 dans `.github ROADMAP.md:198`. |
| **NH-01** (B, l.243) | artefact plausible (C1 dépend de la diagonale) | **garder** ; ajouter un renvoi | P1bis/P8c sont « du côté science » de NH-01 mais ne testent aucune affirmation de NH-01 (autre réseau). Ils ne peuvent ni réhabiliter ni fermer NH-01. | `hopfield-p1bis-ext/prereg.md:30-32,262` | — |

### 1.3 Autres lignes nerve-wml (tables A et B) : **garder**, aucune source du 03-06/11 ne les touche

Table A : NWML-INV (l.130, utile sous verrou), N3, A, RT, SL, DIR, ORTH, TEMP, GEN, MIE, DVNC, MC, EEG, CKA, KD, GATES, M2, EWC, L1a, BIO, Q1, Q1x, ABL, PAC, CH, R1, R2, R3, R45, R6, GPU, N10A, N11A, N11C, N13-14 (l.131-168). Table B citant nerve-wml : NH-10, 18, 24, 27, 29, 30, 34, 36, 38-44, 46-57, 63, 74, 83, 89, 90. « Garder » ne vaut pas validation (`CAT` règle « inchangé »).

---

## 2. Nouvelles hypothèses à poser

Numérotation provisoire préfixée (voir constat C3 : la plage NH-92 à NH-101 est déjà prise par `priorites-hypotheses.md`).

### NWML-N1 — usage causal du canal appris par PPO (question centrale)

- **Énoncé falsifiable.** Sur le jeu asym N10-D (K = 16, C = 4, A = 16, un pas, récompense commune ; `P100:protocol.md:260-270`), une paire locuteur-auditeur entraînée de zéro par le tronc PPO N10-C avec canal (`learned`) (i) dépasse la paire entraînée de zéro sans canal (`nocomm`), appariée par graine, et (ii) **utilise ce gain par le contenu du message** : sur la paire `learned` figée, dériver les messages entre épisodes du même lot ramène le succès au plafond aveugle 1/C, et la restauration le rend.
- **Statistiques (par backend, JaxMARL et EGG, conjonction).** D_L,s = S_learned,s − S_nocomm,s ; C_s = S_learned,intact,s − S_learned,dérangé,s ; S sur n_eval = 500 épisodes neufs (`P100:protocol.md:99-105`).
- **H1.** Borne basse de l'IC 95 % apparié de D_L > P99 du nul apparié **et** test des signes de D_L rejette ; **et** borne basse de l'IC 95 % de C > 0 avec S_dérangé ≤ L99 (nul de niveau).
- **Nul.** Permutation des étiquettes de bras à l'intérieur de chaque graine (covariance de graine conservée), recalibrée avec une composante de graine commune (`RN:231-233` ; PI-2, `P100:protocol.md:41`) ; contrôle de bruit `nocomm_rep` (second `nocomm` sur un autre flux), comme `BIS:44`.
- **Réfutation (deux issues publiables).** (a) D_L ≤ nul : canal inutilisé alors que nécessaire par construction — issue déjà publiée ailleurs (Chauhan & Bera, couplage partiel, appris 2 bits indistinguable du silence, `RN:79,202-209`). (b) D_L > nul mais IC de C contient 0 : gain sans usage du contenu (`RN:236-238`).
- **Contrôles.** `eng` comme borne haute et porte d'apprentissage ; `msg_shuffle` sur `eng` ; auditeur scripté ≥ 0,95 ; `sym` en contrôle de fuite (cas D) ; distribution des D_L,s par graine rapportée (bimodal ou partiel, `P100:protocol.md:225-230`). « Canal inutilisé » séparé de « canal inutilisable » par la porte sur `eng` (`RN:255-257`).
- **Substrat.** MLP (tronc PPO N10-C adapté), environnement custom JaxMARL v0.2.0 épinglé et fork EGG `54eb11c6` (`P100:protocol.md:31,273-282`) ; EGG archivé (`V1:227-231`).
- **Coût.** Les cellules `learned` sont déjà au budget N10-D (6 cellules × k × 2 backends ; 240 runs à k = 20, `A4P:49`) ; interventions = évaluation seule (3 modalités × 500 épisodes). Heures non mesurées (TBD-11 ouvert, `P100:protocol.md:43`) ; l'hypothèse de travail ≤ 1 h GPU par run (`RN:242`) donnerait ≤ 240 h GPU [inférence, non mesurée]. **Puissance [calcul]** : π_learned (fraction de graines qui apprennent) est inconnu et dépend du dessin (Eccles Table 1 : 0 à 1 ; Chaabouni 25/48, `A4P:29`). Sous le mélange bimodal de `P100:protocol.md:148-154`, q = π + (1 − π)/2 ; test des signes unilatéral à k = 20 (m = 15) : puissance par backend 0,62 à π = 0,5, 0,93 à π = 0,7, 0,99 à π = 0,8. Pour 0,90 par backend : k = 33 à π = 0,5, k = 23 à π = 0,6, k = 16 à π = 0,7. Une marge de magnitude sur D_L (type 0,30) est déconseillée : avec un code partiel la borne supérieure du succès est fixée par la taille du code (NWML-N3).
- **Antériorité.** Aucune source du tour 1 ne combine PPO + bras `nocomm` entraîné + nul apparié par graine + intervention sur `learned` (`V1:122-127,314-319`) ; la plus proche (OpenReview uyIn9jZ70C) fait une attaque PGD sur messages continus sans `nocomm` (`V1:131-139`). Chauhan & Bera apparient déjà les **tests** par graine entre appris et silence (25 graines, Holm) sans permuter de messages sur agents appris (`RN:139-141`). L'absence reste une inférence (`RN:151-152`). L'énoncé de nouveauté doit donc être la **combinaison**, pas « premier test apparié ».
- **Lien.** Remplace la question de C l.39 ; absorbe NH-32 ; conditionne NWML-N2 ; NH-37 sur cas C.

### NWML-N2 — même test entre substrats hétérogènes (MLP → LIF)

- **Énoncé.** Avec un locuteur MLP et un auditeur LifWML (embedding pris après la dynamique impulsionnelle), les volets (i) et (ii) de NWML-N1 tiennent.
- **Nul, contrôle.** Ceux de NWML-N1 ; plus une paire MLP→MLP de même graine comme référence homogène.
- **Coût.** Ordre de NWML-N1 par backend, × 1 condition ; surrogate-gradient LIF plus lent [inférence, non mesuré].
- **Source.** `V1:263` (aucun substrat impulsionnel dans la littérature lue) ; Claim B l.36 « à refaire avec un test causal ».
- **Statut proposé.** **Reporté après M3**, et seulement si NWML-N1 conclut A sur le substrat homogène.

### NWML-N3 — le succès des paires partielles suit la taille effective du code (prédiction analytique)

- **Énoncé.** Pour une paire `learned` dont le locuteur partitionne les 16 identités en M classes de taille égale, le succès attendu vaut E[1/(1 + X)], X = nombre de distracteurs de la même classe (hypergéométrique). [calcul] M = 1 : 0,25 ; 2 : 0,481 ; 4 : 0,728 ; 8 : 0,900 ; 16 : 1,0. Prédiction : le succès mesuré de chaque graine est à ± 0,05 de la valeur prédite par la partition mesurée (classes empiriques du locuteur).
- **Nul.** Succès indépendant de la partition (auditeur qui n'exploite pas les classes) ; au moins 3 graines hors de ± 0,10.
- **Contrôle.** Paire `eng` (M = 16, 1,0 attendu).
- **Coût.** Nul en GPU : lecture des messages des runs NWML-N1. À enregistrer comme secondaire descriptif avant le gel.
- **Source.** arXiv:2410.18806 (un ou deux symboles suffisent, [résumé moteur]) ; Eccles 2019 Table 2 (optima partiels, lu par `A4P:192`). Note : M = 2 classes donne 0,48 < 0,55, donc un code à un bit ne passe jamais la marge A de N10-D.
- **Lien.** Lit le cas B de N10-D (« apprend en partie ») sans le confondre avec C.

---

## 3. À fermer

| identifiant | preuve | ce que l'on peut dire publiquement |
|---|---|---|
| **NWML-N10C** (A, l.165) | `CL:43-45` (arrêt définitif, aucun verdict) ; `CL:53` (fondement antérieur à la lecture : tâche sans besoin de message, données de développement) ; `CL:58-63` (fondements postérieurs, non aveugles) | Rapport descriptif exploratoire d'une campagne arrêtée à la graine 0 : ni positif ni négatif sur la communication GTM ; le constat « la tâche Procgen telle que réglée ne requiert pas le message » est publiable comme leçon de dessin (avec la mention de rupture d'aveugle, `CL:73-97`). Pas un résultat négatif sur NWML-N10C. |
| **N10-D « nécessité du message »** (lecture de C l.39 et de NH-96 « le canal n'est utilisé que si l'information est privée ») | Fermée **par construction** : contraste oracle 0,75 / 0 calculable sans entraînement (`P100:protocol.md:52-58` ; `VER:14`) ; antériorité lue : Lazaridou 2017 (99-100 %), Eccles 2019 §4.1 (Pl) (`SYN:39`) | « La nécessité informationnelle est analytique ; N10-D ne la teste pas. » Rien d'empirique à publier sur ce volet. |

Rien d'autre n'est fermé : NH-31, NH-33 sont reportées (précondition absente), pas fermées.

---

## 4. Constats nouveaux depuis le 02/11

| n° | sévérité | constat | preuve |
|---|---|---|---|
| C1 | **MAJEUR** | La H1 enregistrée de N10-D porte sur `eng − nocomm`, un contrôle de chaîne au résultat attendu. La seule question ouverte (usage causal de `learned`) reste un secondaire. Elle n'a ni nul propre, ni critère, ni calcul de puissance. Le dérangement n'est appliqué qu'à la paire `eng`. Le dessin minimal de la note de lecture (interventions sur `learned`, critère, réfutation) n'est pas porté dans le protocole. | `P100:protocol.md:88-89,105` ; `P100:nh96-null.md:20-24` ; `RN:227-238` ; `V1:314-319` |
| C2 | **MAJEUR** | La formule « aucune antériorité » ne vaut que pour la combinaison. Chauhan & Bera comparent déjà appris et silence entraîné avec des tests appariés par graine, et rapportent un appris indistinguable du silence. | `RN:79,139-141,202-209` ; arXiv:2609.34373 (résolu) |
| C3 | **MAJEUR** | Les identifiants NH-91 à NH-101 sont en collision. Dans `priorites-hypotheses.md` (30/10), NH-91 = rêve algébrique et NH-96 = canal/information privée. Dans le catalogue v2, NH-91 = ex-NH-03 « quand dormir ». NH-96 n'a aucune ligne au catalogue v2 (0 occurrence de NH-92 à NH-99). Une numérotation « NH-92 et suivantes » recollisionnerait. | `.github:…/2026-10-30-etat-des-lieux/synthese/priorites-hypotheses.md:146-210` ; `CAT:24,35,239` ; `P100:protocol.md:20` |
| C4 | **MAJEUR** | Dans le Test (6), l'embedding LIF est une fonction affine de x (deux `Linear`, aucun pas impulsionnel). Or Paper 1 situe le résultat comme une validation PRH « ANN vs spiking LIF with surrogate-gradient ». La portée de NWML-PRH, NH-35 et NH-45 est donc plus étroite qu'écrite. | `MK:69-76` ; `scripts/platonic_rh_alignment.py:84,112` (master) ; `papers/paper1/main.tex:104` |
| C5 | MINEUR | Dans N10-D, à k = 20, la puissance globale vaut 0,808 à π = 0,75 et 0,599 à π = 0,70. C'est sous la cible de 0,90. π reste un choix du PI, aucune source ne le donne. | `P100:protocol.md:185-195,486-489` ; `A4P:225` |
| C6 | MINEUR | ADR-0003 n'est pas signé et la PR #118 est ouverte. Le KPI « tags sans verrou » vaut 0 dans la roadmap, alors que l'ADR compte 2 pour S2. | `ADR3:100-103,197` ; `.github ROADMAP.md:198` |
| C7 | MINEUR | La closure N10-C a encore un enregistrement ouvert : la table des machines du plan du 01/11. | `CL:103` |
| C8 | MINEUR | Plan N10-C-bis : à k = 3, le test des signes ne peut pas rejeter (p minimale 1/8) et l'équivalence est hors d'atteinte. A+ est une porte de décision, pas un test. Ses valeurs sont scellées jusqu'au gel. La porte ne tranche pas « le GTM communique-t-il ». Elle tranche seulement si `eng` laisse une marge ≥ 0,20 dans le harnais N10-C en `closed`. C'est la précondition de NH-31, NH-33 et NH-37 version Procgen. Les graines 9104/9105 sont « regardées » pour `registered` à 1 M pas. | `BIS:25-27,34-36,153-156,158-166` |
| C9 | OK | Contradicteur N10-D vérifié en source : 0 fait réfuté, 1 BLOQUANT commun (porte `sym`), corrigé dans `P100`. | `VER:7-18` ; `P100:protocol.md:117-124` |
| C10 | OK | La closure N10-C déclare la décision non aveugle et sépare ses fondements par date. Elle ne tire aucun verdict. | `CL:3,47-63` |

---

## 5. Résumé (≤ 250 mots)

Voir le message de retour (identique).
