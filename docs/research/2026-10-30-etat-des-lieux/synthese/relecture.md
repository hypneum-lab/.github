# Hypneum Lab — relecture scientifique du 30/10/2026

Sources : six inventaires critiques et relevé calcul du 30/10 (`scratchpad/inventory/*.md`, relevé hôtes 14:22–14:23 CET), revue du 24/10 (`.github/docs/research/2026-10-24-revue-hypotheses/README.md`), notes de session `project_hypneum_sota_prs_2026_10_23`, `project_n10c_campaign_2026_10_24`, `project_hypneum_roadmap_2026_10_25`. Lecture seule, aucun calcul. Les chemins sont relatifs à la racine de chaque dépôt ; `PR55:` et `PR9:` désignent la branche de la PR.

Convention : la colonne « Constat » ne contient que des faits cités. « Conséquence » et « Action » sont des jugements du relecteur.

---

## A. Constats classés

| # | Dépôt | Constat | Preuve | Conséquence pratique | Action minimale (≤ 1 soirée) | Vérifié par |
|---|---|---|---|---|---|---|
| 1 | dream-of-kiki | **BLOQUANT.** La règle GO du 35B se déclenche si H14-A est SUPERIOR ou POSITIVE-BELOW-SESOI. Or H14-A compare `p_min` (SGD replay, RECOMBINE no-op) au template sans réponses. Le smoke donne +0,037 à +0,067. **Fait nouveau** : le log vivant du confirmatoire affiche des scores par cellule (`p_max|7 pre=0.290 post=0.383`). | `docs/milestones/e1-35b-go-rule-2026-10-28.md:43-44` ; `docs/osf-prereg-e1-small-2026-10-25.md:140-154` ; `compute-status.md` §1 | Location GB300 ou 18–20 j de Studio (431–482 h) déclenchables sans opération de rêve. La note promet « not changed after any E1-small number is seen », mais des chiffres sont déjà lisibles par quiconque lit le log. | Committer ce soir une règle révisée (GO = H14-B SUPERIOR seulement) avec heure, et déclarer l'exposition du log (qui, quand, quelles cellules). | Claude (inv. dok + relevé) / Codex : — |
| 2 | bouba_sens | **BLOQUANT.** Aucune grille B-3 depuis le 24/10 ne passe `--k-steps`. Avec le défaut k = 5000, le SNR final reste à 19,2 dB et le bruit vaut environ 1,2 % de la puissance. Sur la diagonale lésée = interrogée, le décodage n'est pas dégradé (audio 0,660 contre 0,66). PR #55 (v0.7 ActionSense, 600 cellules) reproduit le défaut. | `scripts/run_grid_probe_v2.sh:73-76`, `src/bouba_sens/cli.py:388`, `reports/b3_lesion_interaction_gaussian.json`, `README.md:60`, `PR55:docs/osf/amendment-v0.7-actionsense.md:366-381` | La formulation publique « aucun effet de lésion » n'est pas soutenue. ActionSense produirait 600 verdicts déterminés d'avance. C'est le **même défaut** que celui que la revue du 24/10 notait pour B-1 (« SNR plafonné ~19,8 dB »). | Remplacer `README.md:60` par « non concluant, lésion non effective ». Ajouter `K_STEPS` dans `run_grid.sh` sur main. Ne pas signer #55. | Claude (inv. bouba) / Codex : — |
| 3 | nerve-wml | **BLOQUANT (construit).** Le succès d'équipe vaut environ le taux de pièce individuel (0,94–0,97 près ; indépendance → taux² ≈ 0,74). Le bras à messages permutés `gtm_mis` atteint 0,81, au-dessus de `gtm` (0,54–0,73). Une politique scriptée sans message atteint 43 %. | `docs/milestones/n10c-…-amendment-2026-10-25.md:32,141-153` ; `2026-10-25-n10c-bis-control-arms.md:302` ; `coop_env.py:11-13,229-230` | Les contrastes θ et NI attendus sont ≈ 0 ou « inconclusive », avec un IC de Fieller non borné. Coût engagé : ≈ 950 h pour N10-C, plus ≈ 21 j KXKM pour bis. | Ajouter au texte bis, non gelé, une porte de nécessité (`eng` − `nocomm` ≥ 0,2, condition `closed`, développement). Présenter N10-C comme « borne sur une tâche sans besoin d'information ». | Claude (inv. nerve) / Codex : — |
| 4 | kiki-flow-research | **BLOQUANT (diffusion).** Le DOI Zenodo 10.5281/zenodo.23636477 (tag `paper-v0.13-draft` = `c484b7d`) publie le split non JKO sous le nom « rigorous JKO path », sans les §11–16 de l'ERRATUM. `main.tex` reste périmé (2,72 bits explicites ; excès γ ≥ 20 pourtant retiré). | `CITATION.cff:37-38` ; `paper/main.tex:20-34,340-345,466-497,578` ; `ERRATUM.md:485-570` | Toute citation externe propage un résultat retiré. | Ajouter une note Zenodo « superseded, voir ERRATUM §12–16 » et une bannière en tête de `main.tex`. | Claude (inv. kfr) / Codex : — |
| 5 | .github | **BLOQUANT (public).** Le profil de l'organisation affiche encore « top-1 70.7 %, top-3 89.5 % » pour le routeur. Le chiffre a été retiré le 25/10 par E-03 (46,4 % mesuré). | `.github/profile/README.md:54` ; `micro-kiki/docs/ERRATA.md` (E-03) | M0 ne peut pas être déclaré tenu. C'est la page publique la plus vue. | Supprimer la ligne (5 min). | Claude (inv. mk) / Codex : — |
| 6 | kiki-flow-research | **BLOQUANT (verdict M5).** La grille compte 96 configurations, et une configuration absente compte comme non certifiée. ES a fini 13 configurations puis s'est arrêté. macM3 n'a que 37 configurations (γ 20–100), non démarrées à 14:23. Rien n'est planifié pour γ ∈ {0, 5, 10}. « Each record carries its platform » est faux : `RUN_KEY` n'a ni hôte ni plateforme. | `docs/prereg/2026-10-30-m5-certify-reading-rule.md:56-58` (branche) ; `experiments/implicit_jko_certified_validation_2026_10_27.py:135-141` ; `compute-status.md` §3–4 | Le verdict sera `failed` mécaniquement. Le pool ES + macM3 n'aura pas de provenance par ligne, alors que les trajectoires diffèrent jusqu'à 5e-3 entre machines. | Avant toute donnée γ ≤ 30 : amender (champ hôte, plan des 46 configurations restantes, traitement des doublons) et horodater via PR #52. | Claude (inv. kfr + relevé) / Codex : — |
| 7 | bouba_sens | **BLOQUANT (dépôt).** Le brouillon TOST (PR #9) a été piloté dans le régime qui n'apprend pas, sans citer ADR-0024, alors qu'il a été modifié après l'erratum. Le passage à Hodges–Lehmann est décidé quand la queue « switch » rend la TOST sur la moyenne impossible. Le test de signe conclut à l'équivalence dans 77 % des cas à la borne. | `PR9:docs/osf/amendment-v0.7-tost-equivalence-2026-10-23.md` ; `PR9:reports/pilots/v07_sign_power_r4_n150.json` ; `docs/adr/0024…md:65-66` | Une équivalence sur un canal effondré est acquise d'avance. Le seul signal observé (switch) serait effacé. | Geler le texte. Publier B-1/B-2 comme nuls d'un régime non apprenant, sans TOST. | Claude (inv. bouba) / Codex : — |
| 8 | nerve-wml (calcul) | **MAJEUR.** Sur macM1, `registered-gtm-s0` est `trained` mais `eval_done=false`, `archived=false`, `synced=false`. Le cron de synchronisation lit `~/scratch/n10c-run/` (campagne n°1), pas `n10c-run2` : « synced 0 ». L'archive ES ne contient que les 2 runs exclus de la campagne n°1. Le SWHID du tag 29/10 n'est pas dans le dépôt. | `compute-status.md` §2–3 et anomalie 5 ; `campaign/README.md:178` | La seule copie des runs n°2 est sur macM1, une machine bloquée du 26 au 28/10. L'évaluation, prévue sur KXKM, n'a pas de chemin. | Repointer le cron vers `n10c-run2`, vérifier un pull ES, committer le SWHID (connu des notes : visite SWH 2588832). | Claude (relevé) / Codex : — |
| 9 | nerve-wml | **MAJEUR (aveuglement).** Le texte bis interdit de lire tout champ de courbe d'entraînement N10-C avant son tag. Or les notes de session citent « registered-gtm-s0 … succès final 0,96 ». | `2026-10-25-n10c-bis-control-arms.md:42` ; mémoire `project_n10c_campaign_2026_10_24` (MAJ 30/10) | Seconde brèche possible, non déclarée. | La déclarer dans le texte bis avant son tag, comme la première (`:273,288`). | Claude (inv. nerve + notes) / Codex : — |
| 10 | nerve-wml (NH-01) | **MAJEUR.** À T = 0,2, c(t) < 1 par construction, donc le théorème 2 donne un rapport ≤ 1 : C3′ ne peut pas réfuter. #87 annonce « 44,4× confirmé » avec un dénominateur interpolé (10–20 motifs) et des graines retirées du bootstrap. Les « 4 MAJEUR Codex » sont introuvables. | `nh01…downscale.md:26-27` ; `confirmatory-n1000.md:19,40,47` ; `correlated-patterns.md:28` ; PR #86, #87, #90 | Le « confirmé » se réduit à répliquer la règle de projection régularisée (Kanter–Sompolinsky 1987 ; Fachechi et al. 2019). Pilier B non testé. | Réétiqueter #87 « non calculable ». Fermer #90. Écrire le contrôle non uniforme (J − εJ², élagage) en préreg. | Claude (inv. nerve) / Codex : — |
| 11 | dream-of-kiki (E1) | **MAJEUR (mesure).** La précision de base Daily Oracle vaut 0,185 (n = 146, hasard 0,25). La bonne réponse est la plus longue dans 34 % des cas. DOWNSCALE (×0,99 sur tous les paramètres) pèse environ 35 fois la mise à jour SGD. Le bras LR-matched est calé à c = 5,0, en bord de grille. Il n'y a aucune sonde d'oubli. | `docs/milestones/e1-small/corpus-manifest-frozen-2026-10-28.json` ; `scripts/pilot_cycle3_cuda.py:282-291,463-466` ; `e1-tuning-amendment-2026-10-29.json` | Tout Δ peut venir d'artefacts de rédaction des items. E1 ne mesure pas la consolidation. | Préparer, sans GPU lourd, le contrôle « options seules » sur le modèle de base, à lancer après le run. Lire par source avant de poolier. | Claude (inv. dok) / Codex : — |
| 12 | micro-kiki (NH-81) | **MAJEUR.** La voie « fused » = calcul dense + boucle LIF de 6 ticks, donc R ≤ 1 quasi par construction. Effet d'ordre : R̂ = 0,82 (dense d'abord) contre 1,01 (spiking d'abord), soit un écart plus grand que la demi-largeur de l'IC [0,83 ; 1,01]. En 5 jours : 6 tags, 3 tentatives KXKM refusées, une 3e plateforme. | `nh81br/docs/prereg/2026-10-25-nh81-joules-per-token.md:97-100` ; `nh81br/docs/results/2026-10-25-nh81-joules.md:82-85` | Faible information marginale, coût de pilotage élevé. NH-81 était prévu en S8 (`ROADMAP.md:45`). | Analyser l'ordre en covariable. Pas de r5 si le waiter échoue le 04/11. Clore en « withdraw, provisional ». | Claude (inv. mk) / Codex : — |

**Contradictions entre inventaires**

- **Occupation de KXKM.** L'inventaire dok écrit « KXKM partagé avec N10-C (lancé le 24/10), bis vers le 7/11 ». Le relevé montre zéro processus N10-C sur KXKM (`campaign/status/` vide) et E1-small qui tient 21,9 Go sur 24,5. L'inventaire nerve situe le début de bis vers le 20/11. L'inventaire dok est périmé.
- **macM3.** L'inventaire dok le dit « absent de l'inventaire d'infra, non vérifiable ». Le relevé le joint : uptime 40 min, redémarré vers 13:42. La mémoire `reference_macm1_procgen_mlx_build_2026_10_23` et la compétence `hypneum-campaign` le décrivent (M3 Pro, 18 Go, mises à jour macOS automatiques au redémarrage). Il manque seulement dans `~/CLAUDE.md` et dans les dépôts.
- **NH-81 sur M3 Pro.** « Aucune paire » (dépôt, inv. mk) contre 61 lignes en cours (relevé) : décalage dépôt/machine, pas une contradiction. Idem adaptateurs micro-kiki : 35 (README) contre 41 (note 23/10).
- **Fin d'E1-small.** Dok : « 1er/11 au soir ». Relevé : 290/1410 cellules, fin vers le 01/11 21:30. Mk : « 02/11 au soir ». Le relevé fait foi.

**Autres constats, en bref** (MAJEUR de second rang, puis MINEUR)

- **MAJEUR.**
  - G4 se lit déjà dans le smoke 3 : A ≈ +0,005, unmixed ≥ cross ; CDPA est confondu avec le biais de la tête et DOA est figé à 0,5.
  - Les FAILS H13-C/D de DR-3 sont garantis par τ et la normalisation par quantile (`kiki_oniric/eval/relational_probe.py:167-179`).
  - kiki-flow : PR #45/#48/#50 fusionnées en 9–54 min sans revue ; `ERRATUM.md:702,746` dit encore « PROPOSED / not merged ».
  - kiki-flow : blocage de grille possible à 16 points (seuil dx²/2h = 0,71 à h = 0,05).
  - Sondes ActionSense dégénérées : fenêtres contiguës, aucune séparation entraînement/test.
  - baby-brain « 1b refuted » doit devenir « critère non valide » (LP mesuré sur le plateau final, estimateur remplacé 1 h après les runs).
  - Le délai de #79 (NH-03) confond récence et interférence.
- **MINEUR.**
  - Titre de PR #19 : « 2 attempts » au lieu de 3.
  - `FILING-NOTE.md:6` (E1) obsolète.
  - Collisions de numéros ADR (0023–0025).
  - `c5-info-bound.json` sans champ `withdrawn`.
  - micro-kiki-quantum non archivé sur GitHub.
  - Projet n° 1 : 80/80 items « À valider ».
  - Spotlight indexe le T7 de macM1 pendant N10-C (load 15–20, checkpoint à 33 min au lieu de 21).

---

## B. Errata des affirmations antérieures

| Affirmation | Source | Réalité constatée | Preuve |
|---|---|---|---|
| « 47 issues, toutes `a-valider-pi` » | note roadmap 25/10 | Le projet compte 80 items. 78 portent `a-valider-pi`, dont 65 ouverts ; 13 fermés gardent l'étiquette. | inv. mk §1 (`gh project item-list`) |
| PR #19 micro-kiki : « not measured, 2 attempts » | titre de PR, `nh81-kxkm-nvml.md:1` | 3 tentatives KXKM refusées et 6 tags NH-81 | `nh81br/…nh81-kxkm-nvml.md:158-180` |
| « B-3 requalifié non calibré » (ADR-0022) | note roadmap 25/10 09:40 ; revue §7.1 | ADR-0022 classe le gaussien « calibré : compatible avec le nul ». La formulation finale vient d'ADR-0023/0024 et repose elle-même sur une lésion non effective (A2). | `docs/adr/0022-me6-paired-null.md:274-277` ; `0023…:168-177` |
| « mock (0,31) et ECG (0,45) nettement au-dessus » du nul | revue 24/10 §0 | Médiane mock 0,3047 : rejetée par blocs de 8 (p = 1e-4), pas par blocs de 16 (p = 0,06) ni de 32 (p = 0,31). La grille ECG n'a pas été recalculée. | `docs/adr/0022-me6-paired-null.md:189-195,242-252` |
| « 4 MAJEUR Codex » sur NH-01 | notes de départ | Absents des PR, des revues et des commentaires GitHub | inv. nerve §1 |
| Le rapport s'appelle `rapport.md` | brief Codex astra, note revue 25/10 | Publié sous `README.md`. `synthese/rapport.md` n'existe que dans le scratchpad de l'époque. | `codex/astra-prompt.md:3` ; `ls` du dossier |
| macM3 « absent / non vérifiable » | inv. dok, #79 | Hôte réel et joignable, décrit en mémoire et dans la compétence, absent de `~/CLAUDE.md` | relevé §4 ; `reference_macm1_procgen_mlx_build_2026_10_23.md:17` |
| N10-C fini « ≈ 15 nov » ; bis « ≈ 7 nov », fin « ≈ 29/11 » ; KXKM « réservé jusqu'à mi-novembre » | ROADMAP S3–S4 ; note roadmap ; revue §7 | macM1 vers le 20–21/11 ; KXKM : N10-C après E1-small (≥ 02/11) pendant 17,6 j, puis bis environ 21 j, soit mi-décembre | `n10c-freeze-plan-2026-10-28.md:84-97` |
| N10-C KXKM s73/101/131 « lancé le 24/10 » | note N10-C 24/10 | Campagne n°1 arrêtée le 25/10 (tronc mort). La campagne n°2 KXKM n'a pas démarré. | `amendment-2026-10-25.md:12-36` ; relevé §1 |
| Résultats M5 (13 configurations certifiées sur ES) | notes | Aucun `certify.jsonl` committé ; seulement `b1_*` | `results/implicit_jko_certified_2026_10_27/` |
| Préreg pilote Lie/Strang (4 cœurs) | notes | Introuvable : seuls `ROADMAP.md` S7 et un amendement nerve citent Strang | inv. kfr §1 |
| « Nuls Me6 calibrés acceptés sur KXKM CPU » | notes | Aucune trace, ni dans le dépôt ni sur KXKM (`/ai/saisail/`) | inv. bouba (d) ; relevé §1 |
| « Spécialisation rigoureuse 1,35 contre 2,03 bits : tient » | revue §1.1 item 6 | Le chemin « rigoureux » n'est pas un pas JKO (erreur W2 0,60–0,94). À retirer de « ce qui tient ». | PR #40 ; `ERRATUM.md:485-570` |
| NH-01 : « si shrink ≥ 2× → pilier B = downscale » | revue §4.1 (l. 182) | Le contrôle shrink est inerte à T = 0 et ≤ 1 par théorème à T = 0,2 : la règle ne peut pas trancher | `nh01…downscale.md:26-27` |
| NH-81 : « M1 + 4090, heures » | revue §7.3 | 5 jours, 6 tags, 3 refus KXKM, 3e plateforme | inv. mk §2.1 |
| « PI to file E1-small, G4, DR-3 on OSF » (28/10) | note 23/10 (MAJ) | Aucun des trois n'est déposé. E1 tourne depuis le 30/10 00:05:29, soit 19 s après la fusion de #77. | inv. dok §1 ; relevé §1 |

---

## C. Analyses et suppositions par chantier

Notation : **F** = fait cité ; **J** = jugement ; **S** = supposition.

**N10-C / N10-C-bis.**
- *Décidable* :
  - F : σ ≈ 0,13 (`gtm`) et 0,09 (`eng`) sur les runs de développement ; n = 6 graines par bras.
  - J : erreur-type ≈ 0,065 et demi-largeur de l'IC à 98,33 % ≈ 0,19. Puissance pour Δ = 0,10 ≈ 0,20 (approximation normale). Seuls des |Δ| ≥ 0,2–0,3 sont tranchés.
  - F : aucune variance n'existe sur les 200 niveaux de test.
- *Hypothèse fragile* : « le succès d'équipe mesure la coordination par le canal ».
- *Alternative la plus simple* : même niveau et paramètres partagés, donc la synchronisation est gratuite (A3). S'y ajoute un possible plancher de généralisation à 16 niveaux d'entraînement (S).

**NH-01.**
- *Décidable* :
  - F : C1 = 3,86 [3,79 ; 3,93], C3′ = 0,975 [0,967 ; 0,982] (N = 1000, 10 graines).
  - J : la précision n'est pas le problème. Le seul critère capable d'échouer teste un résultat analytique connu.
- *Hypothèse fragile* : « le rétrécissement uniforme de Frobenius représente SHY ».
- *Alternative* : la projection régularisée par ridge (λ = 1/t) bat Hebb. Rien n'est dit du rêve ni du substrat WML/VQ.

**E1-small / E1-35B.**
- *Décidable* :
  - F : 141 graines, SD proxy 0,0286, δ = 0,01, n_eval = 162 (1 item = 0,0062).
  - J : erreur-type ≈ 0,0024 et demi-largeur ≈ ±0,005, soit moins d'un item. Puissance de SUPERIOR à μ = δ : 0,50 par construction ; BOUNDED/NI : 0,98.
  - J : pour H14-B, les suites de mises à jour sont identiques, donc la SD sera bien plus faible et un effet de 0,002 sera « détecté ».
  - F : rien ne permet d'extrapoler du 4B au 35B (§0 de la préreg).
- *Hypothèse fragile* : « un Δ cloze sur ce QCM mesure une capacité, et ×0,99 opérationnalise SHY ».
- *Alternative* : apprentissage d'artefacts (longueur, style des distracteurs), plus un changement global d'échelle des logits.

**G4 / DR-3 / NH-03.**
- *G4* :
  - F : N = 95 ; SD des différences 0,0015–0,0024 ; MDE d_z = 0,308.
  - J : demi-largeur ≈ 0,0005. L'issue POSITIVE-NEGLIGIBLE / BOUNDED / EQUIVALENT est quasi certaine. CONFIRMED exige un effet environ 7 fois plus grand que l'effet observé.
  - Alternative : recalibrage du biais de la tête (unmixed ≥ cross).
- *DR-3* :
  - F : n = 20 ; MDE d_z = 0,739 ; SD de planification tirée de 3 graines (IC ×0,5 à ×6) ; puissance de FAILS 0,44 si SD = 0,05.
  - J : SURVIVES et FAILS sont prévisibles ; seule H13-B est incertaine.
  - Alternative : la structure k-NN vient des 1 024 entrées partagées (le nul non entraîné vaut déjà 8 fois le hasard). Le contrôle décisif manque : un nul à labels permutés.
- *NH-03* :
  - F : effets de 4 à 19 points, SD ≈ 4, N = 30.
  - J : décidable. Mais le plancher binaire est à ≈ 51 et la récence agit par construction ; le délai de #79 ajoute de l'interférence.

**B-3 / v0.7 / v0.9 (bouba_sens).**
- *B-3, test d'interaction* :
  - F : RMS ≈ 0,0045, donc une interaction de 0,01–0,015 serait détectée.
  - J : la puissance n'est pas en cause ; c'est la manipulation qui manque (SNR 19,2 dB).
- *v0.7 TOST* :
  - F : N = 150, erreur-type 0,0030, marge 0,045, N₀,₈ = 7–11.
  - J : N est surdimensionné d'environ 15 fois. Si la fraction de graines « switch » p_s ≥ 0,08, la puissance de la TOST sur la moyenne tombe à ≈ 0. HL passe presque sûrement. L'estimation pilote de p_s est compatible avec 0,3 % à 45 % : seule l'issue E-2s porte de l'information.
- *v0.9* : F : la porte d'apprentissage échoue en rev. B, C et D. Rien n'est décidable.
- *Hypothèse fragile* : « la lésion agit, et le réseau straight-through apprend ».
- *Alternative* : pas de lésion effective, et un canal de code limité à 1–8 codes actifs. La capacité du canal, et non la plasticité, borne tout.

**JKO / M5 (kiki-flow).**
- *Décidable* :
  - J : un 60/60 borne le taux d'échec à ≈ 5 % par configuration (règle de trois). P(pass | p = 0,95) ≈ 0,05 : le test est sévère.
  - F : la couverture réelle est de 50 configurations sur 96, donc `failed` mécanique (A6).
  - J : même un succès laisse ≈ 170 pas non certifiés sur les ≈ 10⁴ pas du recalcul du papier.
- *Hypothèse fragile* : « stationnarité certifiée = bon pas JKO » à coût/reg = 6 400–25 600, sans référence indépendante.
- *Alternative* :
  - un blocage de grille (zone morte dx²/2h = 0,71 / 1,42) ;
  - un biais du plug-in d'entropie de ≈ 0,09 bit, du même ordre que le gap témoin α = 0 (0,17–0,22).
  - Ces deux effets suffisent à expliquer l'excès négatif sur Gibbs (−0,39 bit). Un test de 20 pas à γ = 0 depuis un Gibbs perturbé le tranche (≈ 4 s par pas).

**NH-81.**
- *Décidable* :
  - F : 12 paires, R̂ = 0,91 [0,83 ; 1,01], demi-largeur ≈ 0,09 ; écart d'ordre ≈ 0,19.
  - J : par ordre, avec 6 paires chacun, la demi-largeur monte à ≈ 0,13. Le verdict « ≤ 1,1 » tient, mais il ne pouvait guère échouer.
  - F : sur KXKM, la traîne P2 (≈ 69 W pendant ≈ 17 s) domine la soustraction du repos.
- *Hypothèse fragile* : « la voie fused est une comparaison iso-qualité qui peut échouer ».
- *Alternative* : dense + LIF ⇒ R ≤ 1 par construction, et l'effet d'ordre vient d'un report thermique ou de fréquence.

**Vérifiable aujourd'hui, contre notes non committées**

- *Vérifiable dans les dépôts* :
  - tag `n10c-freeze-20261029` et SHA du manifeste recalculé ;
  - résultats pilotes et confirmatoires NH-01 (branches #86/#87) ;
  - ADR-0021 à 0024 et JSON de l'interaction de lésion (diagonale non dégradée) ;
  - smokes G4 et DR-3, manifeste du corpus E1, règle GO, avenant de réglage ;
  - ERRATUM kiki-flow §11–16, tag M5 et horodatage de la PR #52 (12:28:41Z) ;
  - mesure NH-81 sur macM1 ;
  - comptages du projet n° 1.
- *Observé en direct le 30/10, sans trace committée* :
  - progression d'E1-small (290/1410, lancement 00:05:29) ;
  - N10-C `closed-gtm-s0` à 72 % ;
  - NH-81 M3 Pro (61 lignes) ;
  - reruns de provenance NH-01 sur ES ;
  - téléchargement ActionSense S02 ;
  - état de la synchronisation N10-C.
- *Notes seules, non vérifiables dans les dépôts* :
  - « succès 0,96 » de `registered-gtm-s0` ;
  - SWHID et visite SWH du tag 29/10 ;
  - les 13 configurations M5 certifiées ;
  - préreg Lie/Strang ;
  - nuls Me6 sur KXKM ;
  - « 4 MAJEUR Codex » ;
  - sha256 d'ActionSense S02–S05 ;
  - heures de décision PI données « à la minute » (Adam, M5 13:30).

J : la discipline de gel (tags, SHA, déviations déclarées) est réelle et vérifiable. Ce qui manque, c'est la **validité des manipulations et des mesures** : lésion à 19 dB, tâche sans besoin de communication, contrôle tautologique, score sous le hasard, voie fused dense. Le motif est le même dans cinq dépôts sur six. Chaque nouveau gel le fige au lieu de le corriger.
