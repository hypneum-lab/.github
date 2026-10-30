# Inventaire 30/10/2026 : micro-kiki, micro-kiki-quantum, baby-brain, profil .github et projet GitHub

Relecture en lecture seule. Sources : clones frais sous `scratchpad/repos/`, branche `exp/nh81-kxkm-nvml` extraite dans `scratchpad/nh81br/` (PR #19 non fusionnée), `gh` (PR, issues, projet n° 1). Pas de SSH ni de calcul. Les chemins `nh81br/...` désignent le contenu de la branche de la PR #19.

Sévérités : **BLOQUANT** (faux en public ou validité compromise), **MAJEUR**, **MINEUR**, **OK**.

---

## 1. État des lieux

### micro-kiki (public)

- **Fait.**
  - Phase 0 fusionnée le 25/10 (PR #16) : errata E-01 (énergie), E-02 (C5) et E-03 (routeur), `docs/ERRATA.md:23-176`.
  - Issues #10 et #12 fermées le 25/10.
  - NH-81 mesuré sur macM1 (PR #18, fusionnée le 28/10) : R̂ = 0,91 [0,83 ; 1,01].
- **En cours.** PR #19 (brouillon, titre « not measured, 2 attempts »). La branche compte en réalité **3 tentatives KXKM refusées** et **6 tags de préenregistrement** NH-81 :
  - `prereg-nh81-20261025` ;
  - `-kxkm-20261028`, puis `-r2` (28/10 15:45) et `-r3` (29/10 06:17) ;
  - `-r4` (30/10 06:26) ;
  - `prereg-nh81-m3pro-20261030` (30/10 13:53, déjà posé).

  Sur M3 Pro, seule la sonde de repos existe (`results/nh81-m3pro/idle_probe_prereg.json`) : aucune paire n'a été mesurée. Les deux « waiters » (KXKM r4, M3 Pro) abandonnent le 04/11 à 12:00.
- **Bloqué.**
  - KXKM est occupé par E1-small (phase confirmatoire) jusqu'au 02/11 au soir environ (`nh81br/docs/results/2026-10-28-nh81-kxkm-nvml.md:178-180`).
  - #11 (C5) reste ouverte : le code est corrigé, mais le JSON et la figure ne sont pas recalculés, faute du cache d'embeddings non versionné (`docs/ERRATA.md:119-123`).
  - #17 (routeur mpnet 70,7 %) est ouverte **hors projet**.
- **Décisions PI en attente.** Elles portent sur #11, #13 (NH-85 RAG contre Aeon), #14 (NH-81) et #17. Il faut aussi trancher le sort de la réplication KXKM (voir §2.1).

### micro-kiki-quantum (privé)

- Inactif depuis le 20/04. Rationale d'archivage ajoutée le 23/10 (`ARCHIVED.md:26-64`).
- Le dépôt n'est **pas archivé côté GitHub** (`isArchived: false`). Sa description annonce encore « IonQ/IBM… Budget $250/experiment ».
- Aucune issue ouverte, rien en cours.

### baby-brain (privé)

- **Fait.** PR #289 (25/10, 3 commits) : verdicts de phase 1 corrigés et SP6 marqué « no results » (`README.md:54-66`, `ROADMAP.md:152-157`). Issues #284 et #285 fermées.
- **En attente.** #288 (critère LP, M1), #286 (NH-77 WML-JEPA, M2), #287 (NH-87, M2). Décision PI sur SP6 : lancer E0–E2 préenregistrés ou retirer le brouillon (`ROADMAP.md:156-157`).
- **Activité réelle.** Aucun commit de code depuis le 04/06. Seulement 9 commits documentaires entre le 23 et le 25/10.

### .github et projet n° 1 « Hypneum — Programme 2026-27 »

Comptage du 30/10 (`gh project item-list`, croisé avec l'état des issues) :

- **80 items**, tous des issues : nerve-wml 18, dream-of-kiki 18, bouba_sens 15, kiki-flow-research 13, .github 6, baby-brain 5, micro-kiki 5.
- **Champ Statut = « À valider » pour les 80**, y compris les 13 issues déjà fermées. Aucune n'est « En cours », alors que NH-81 tourne depuis cinq jours.
- 78 items portent `a-valider-pi`, dont **65 ouverts** (13 fermés le portent encore). Le chiffre de « 47 issues » de nos notes est **faux ou périmé**.
- Ouverts / fermés par phase :

  | Phase | Ouverts | Fermés |
  |---|---|---|
  | 0 Vérité | 25 | 13 |
  | 1 Falsifiable | 10 | 0 |
  | 2 Hypothèses | 14 | 0 |
  | 3 Écrire | 5 | 0 |
  | Sans phase (hygiène CI, tests) | 13 | 0 |

- Aucune issue fermée ne porte d'étiquette `verdict:*`. La vue « Verdicts » de `PROJECT-MANAGEMENT.md:31` est donc vide.

**Jalon M0 (8 nov).**

- 18 issues au jalon, **12 fermées** (11 le 25/10, bouba_sens #22 le 27/10), **6 ouvertes** : .github #5 (e-Soleau/Zenodo), .github #6 (verdict B-3), kiki-flow #33 et dream-of-kiki #55 (README/CITATION), nerve-wml #62 (gel N10-C-bis avant le 6/11), micro-kiki #11.
- Quatre d'entre elles sont des tâches documentaires d'une heure ou deux. M0 est **tenable sur le papier** si le PI y consacre une soirée.
- Deux risques restent :
  1. #62 dépend de l'état de KXKM et de la campagne N10-C (non vérifié ici).
  2. M0 se déclare fermé alors qu'un chiffre retiré reste publié sur le profil (BLOQUANT ci-dessous).
- Par ailleurs, 20 issues « 0 Vérité » n'ont pas de jalon : la « vérité » ne sera donc pas close au 8/11, seul le jalon le sera.

---

## 2. Relecture critique

### 2.1 NH-81 (énergie par token, spiking contre dense)

**OK : la chronologie préreg → données est respectée.**
- macM1 : tag à 19:31, code `fedacd0` à 19:36, mesure de 20:15 à 22:27 le 25/10 (`nh81br/docs/results/2026-10-25-nh81-joules.md:33-41`).
- KXKM : aucune paire n'a été mesurée sous r2, r3 ni r4. Les révisions de garde ont donc changé avant toute donnée d'énergie, ce qui est déclaré (`nh81br/docs/prereg/2026-10-29-nh81-kxkm-replication-r3.md:94-100`).
- Les tags r4 et M3 Pro pointent sur des commits qui contiennent le code. En revanche, **pour le tag macM1 et le tag r2, le code de mesure a été poussé après le tag** (5 et 36 minutes plus tard) : la préreg gèle le protocole, pas le code. MINEUR, à dire dans la note.
- L'amendement 1, écrit après les résultats, levait l'étiquette « provisoire ». La règle PI du 28/10 l'a rétablie. C'est transparent et bien géré.

**MAJEUR : le test est peu sévère.**
- La voie primaire « fused » applique `down` au taux de spikes (`nh81br/docs/prereg/2026-10-25-nh81-joules-per-token.md:97-100`). Sur noyaux denses, c'est le calcul dense plus une boucle LIF de 6 ticks : R ≤ 1 est quasi garanti par construction. La prédiction « R ≤ 1,1 » ne pouvait guère échouer que par erreur d'instrument.
- Le résultat sert surtout à remplacer le 91,6× analytique, et c'est utile. Mais ce n'est pas une corroboration forte, et la note ne devrait pas dire « NH-81 supported » sans cette réserve.
- La règle de décision est aussi asymétrique (`prereg:157-161`) : « withdraw » sur le seul R̂ ≤ 1,1, sans condition sur l'IC, alors que « reopen » exige une borne basse de l'IC. Ici l'IC [0,83 ; 1,01] reste sous 1,1, donc la décision tient.

**MAJEUR : un effet d'ordre de la taille de l'effet mesuré.**
- R̂ vaut 0,82 quand le dense passe en premier et 1,01 quand le spiking passe en premier (`nh81br/docs/results/2026-10-25-nh81-joules.md:82-85`). C'est un écart d'environ 20 %, plus large que la demi-largeur de l'IC.
- Il signe un report thermique, de fréquence ou de cache entre les deux runs d'une paire. L'alternance l'équilibre en moyenne, mais l'IC bootstrap sur 12 paires ne modélise pas ce facteur.
- À ajouter : un modèle avec l'ordre en covariable, ou un repos plus long que 20 s.

**MAJEUR : sur KXKM, la soustraction du repos dominera la mesure.**
- La carte reste en P2 à environ 69 W pendant environ 17 s après chaque run, puis descend à 18 W en P8 (`r3.md` §2). Le repos de 20 s mélange donc la traîne P2 et la chute vers P8.
- W1 à batch 1 laisse le GPU largement inactif. L'énergie nette sera alors une petite différence entre deux grands nombres, multipliée par des durées inégales (le spiking est 1,6× plus lent). L'erreur de référence pèse donc davantage sur le bras spiking.
- r3 prévoit des lectures de sensibilité « descriptives qui ne peuvent pas changer la décision » (`r3.md:84-91`). Si le ratio brut et le ratio net divergent de part et d'autre de 1,1, le verdict « définitif » reposera sur un choix de référence fait à l'aveugle.
- Le seuil de repos de 90 W (`r3.md:60-62`) laisse aussi passer une charge étrangère légère.

**Ce que signifie « non mesuré » après plusieurs tentatives.**
- Rien sur l'hypothèse : 0 paire valide, et chaque bloc est déclaré non concluant (`nh81-kxkm-nvml.md:16-21`). C'est la branche préenregistrée, appliquée correctement.
- En revanche, c'est un **résultat sur le protocole** : une garde fondée sur l'utilisation NVML est inutilisable sur cette carte, car on lit environ 40 % à P8 avec un ensemble résident inactif (`nh81-kxkm-nvml.md:80-94`). Ce constat est publiable dans une note méthodologique.
- Le titre de la note (`:1`) et celui de la PR #19 disent encore « 2 attempts » alors que la tentative 3 est documentée (`:158-180`). MINEUR.

**MINEUR : statuts incohérents.**
- `docs/results/2026-10-25-nh81-joules.md:14` titre « Withdraw … definitively », alors que `:24-29` dit « provisional ».
- `docs/ERRATA.md:61-67` (sur main) dit « withdrawn » sans le mot « provisional ».

**OK : la règle M3 Pro est conservatrice et fixée d'avance.** M3 Pro est descriptif et ne peut que bloquer en cas de divergence (`nh81br/docs/prereg/2026-10-30-nh81-m3pro-replication.md:96-115`). C'est un second IOReport sur Apple Silicon, pas une réplication indépendante, et la préreg le dit.

**MAJEUR : coût et rythme.**
- La ROADMAP place NH-81 en S8 (14–20 déc., `ROADMAP.md:45`). Il a été tiré en S1, alors que M0 n'est pas fermé.
- Résultat sur cinq jours : 6 tags, 4 décisions PI, 3 tentatives KXKM (plus de 6 h de garde), une 3e plateforme ajoutée le 30/10, et une concurrence sur KXKM avec N10-C et E1-small.
- Cela contredit le budget de 10 h par semaine (`ROADMAP.md:11`) et la règle des trois tâches en cours (`PROJECT-MANAGEMENT.md:25`).
- Le résultat scientifique est déjà acquis à l'échelle visée : 27 M de paramètres, dense, et le spiking ne gagne pas. La réplication NVML ne pourra que le confirmer ou rester « provisoire ».

**Constat collatéral (MAJEUR, BSK).** Le taux de décharge mesuré est de **13,8 %**, et non les 1–3 % du README BSK (`nh81-joules.md:63-64`). Le dépôt BSK est privé et n'a pas été vérifié ici. Il lui faut un erratum.

### 2.2 Borne C5

- **OK sur le fond.** L'erratum `docs/ERRATA.md:71-117` est exact et note bien que la borne de Holevo ne mord jamais quand N = 4 et K = 10 (N ≥ log₂ K).
- **MAJEUR : la correction remplace un estimateur faux par un estimateur non fiable.** La version corrigée utilise le k-NN de Ross en d = 384 sur n = 500 (`src/routing/info_bound.py:15-18, 99-140`). En haute dimension, cet estimateur est fortement biaisé : vers le bas pour des données bien séparées, très variable sinon. Le plafonnement à H(Y) masque le biais sans le corriger, et une MI saturée donne une borne vide (`:80-82`).
  - Toute « borne C5 » future reste donc un artefact d'estimateur.
  - La seule issue honnête est d'**abandonner C5** comme contribution. Le code peut l'admettre explicitement (le Fano corrigé ne vaut que si l'estimateur est validé sur des données synthétiques à MI connue).
- **MINEUR.** `results/c5-info-bound.json:17` publie encore `bound_vqc_4qubit: 0.911` sans marqueur dans le fichier. Garder la trace est voulu, mais un champ `"status": "withdrawn"` éviterait une citation accidentelle. #11 peut être fermée avec un renvoi vers cette dette plutôt que rester bloquée sur un cache perdu.

### 2.3 Affirmations restantes de micro-kiki

- **BLOQUANT : le chiffre retiré du routeur est toujours public.** Le profil de l'organisation (`.github/profile/README.md:54`, vérifié sur main via l'API) affiche encore « top-1 70.7 %, top-3 89.5 % », retiré le 25/10 par E-03. M0 ne peut pas être déclaré tenu tant que la page d'accueil publique porte ce chiffre.
- **MAJEUR : le README décrit un système éteint au présent.**
  - « Router V4 live », « Full 7-stage cognitive pipeline deployed », « Stress test 10/10 » (`README.md:9`), alors que le Studio est éteint (`:13`).
  - L'article dit « a production system that serves 35… adapters » (`paper/micro-kiki.tex:50`).
  - La note d'hébergement donne `kxkm-ai` comme chemin de référence, ce qui n'est pas vérifié et peu plausible vu l'occupation du 4090.
- **MAJEUR : des affirmations sans IC ni n.**
  - « 3/10 domains show measurable improvement » et « HumanEval pilot: base 0.80, cpp 0.90 (+10%) » (`README.md:325-327`).
  - « 36+ episode recalls… the real differentiator » (`:325`) compte des rappels, pas une qualité, alors que la revue du 24/10 relevait un recall@5 d'Aeon de 0,02.
  - NH-85 (#13) est le bon test, mais tant qu'il n'est pas fait, « differentiator » est à retirer.

### 2.4 baby-brain

- **OK.** Les « PASS » de README et ROADMAP sont retirés (`README.md:54-66`, `:112-132`).
- **MINEUR.** Des ✅ restent sur les titres des phases 1b et 1c (`ROADMAP.md:199, 213`), avec une note explicative (`:177-181`), et `README.md:44` dit « shipped ». C'est lisible, mais ambigu pour un lecteur pressé.
- **MAJEUR : « 1b refuted » est un mauvais verdict.**
  - Dans le JSON ViZDoom, ε passe de 1,04 à 0,0049, donc le modèle prédictif apprend massivement. Pourtant `mean_lp` vaut −0,0014.
  - Les runs du 30/05 (10:05–10:59) ont été calculés avec l'ancien LP (fenêtre 8, formule demi-fenêtre). L'estimateur a été remplacé à 11:36 le même jour (commit `44d49bf`, `baby_brain/loop/curiosity.py:41`, fenêtre 50, pente OLS).
  - Dans les deux versions, le LP est évalué **à la fin** du run, sur le plateau (`scripts/sp7_vizdoom_smoke.py:121-122`, `curiosity.py:59-73`). Il mesure du bruit post-convergence, pas l'apprentissage.
  - Le verdict correct est donc « **critère non valide, non testé** », ni « réfuté » ni « non atteint ». Le README mélange d'ailleurs « not met » (1a) et « refuted » (1b).
  - Second point : les chiffres publiés ne sont pas reproductibles avec le code actuel, et le README ne le signale pas.
- **MAJEUR : #288 prévoit un biais post hoc.** L'issue propose de préenregistrer un LP multi-échelles puis de « l'appliquer d'abord aux logs SP7 existants ». Des logs déjà vus ne peuvent pas servir de confirmation, seulement de calibration déclarée. Il faut de nouveaux runs à au moins 5 graines. Par ailleurs, #288 parle d'une « fenêtre de 8 » alors que le code actuel utilise 50 : il faut préciser.
- **MuJoCo 1c.** « Inconclusive » est juste. Le `gate_1c_epsilon_pass: true` sur une pente ajustée négative alors que ε monte de bout en bout montre que la pente EMA n'est pas un critère fiable non plus.
- **Routeur.** Il n'y a pas de claim de routeur dans baby-brain ; le 70,7/46,4 relève de micro-kiki (§2.3).

### 2.5 micro-kiki-quantum : hypothèse falsifiable ou bac à sable ?

**C'est un bac à sable.**
- L'hypothèse écrite (« Pauli PEFT égale LoRA r=16 avec environ 1000× moins de paramètres », `docs/specs/quantum-peft-experiment.md:28`) serait falsifiable.
- Mais les critères de succès (`:49-53`) ne la testent pas : convergence sur simulateur, moins de 5 pp d'écart QPU contre simulateur, moins de 1 K paramètres. Il n'y a **aucune comparaison de précision avec LoRA**.
- Le seul résultat sur données réelles porte sur 15 prompts et une graine. QMoE à 6 qubits donne 0,333 contre 1,000 pour la ligne de base classique (`ARCHIVED.md:31-41`).
- **OK** pour l'archivage. **MINEUR** : poser le drapeau GitHub « archived » et corriger la description « Budget $250/experiment ».

---

## 3. Analyses et suppositions

1. **Le motif dominant est la qualité de l'instrumentation, pas les hypothèses.** NH-81 (garde NVML), C5 (estimateur de MI) et LP baby-brain (fenêtre de fin de run) échouent tous trois sur la **validité de mesure** avant toute question de fond. Une note méthodologique « nuls calibrés + errata » (.github #7) a là trois cas concrets, mieux documentés que la plupart des exemples publiés.
2. **Supposition, non vérifiée.** Les 35 adaptateurs V4 de micro-kiki (Qwen3.6-35B-A3B, rang 16, échelle 20) semblent de la même lignée que les adaptateurs `qwen36-*` évalués par iact-bench en juin. Le routage de la passerelle avait alors été basculé sur le modèle de **base**, sauf pour html-css (+0,11). Si c'est la même famille, le README (« 3/10 domains ») est cohérent avec un apport faible ou nul des adaptateurs. À confirmer par hash des `adapter_config.json`.
3. **Supposition.** La réplication KXKM, si elle aboutit, donnera probablement un R̂ W1 encore plus bas que sur M1. La référence P2 de 69 W et la lenteur du spiking jouent dans ce sens. La confirmation est donc quasi certaine, et son information marginale faible.
4. **Hygiène du projet.** Le tableau ne sert pas encore d'outil de pilotage : 80/80 items sont « À valider », il n'y a aucun verdict, et `a-valider-pi` reste posé sur des issues fermées. Le lundi d'arbitrage (`PROJECT-MANAGEMENT.md:21`) n'a visiblement pas eu lieu, ou n'a pas été reporté dans le projet.
5. **Non vérifiable ici** : état réel de N10-C et N10-C-bis, contenu du dépôt BSK, cartes HF `micro-kiki-v35b`, occupation réelle de KXKM et de M3 Pro aujourd'hui.

---

## 4. Utilité hors labo, et ce qu'il faut arrêter

| Élément | Piste | Avis |
|---|---|---|
| Mesure énergie NH-81 (code IOReport sans sudo, garde NVML, jeu `measure.jsonl`) | Note méthodologique courte : « mesurer des J/token sur Apple Silicon et RTX ; pourquoi l'utilisation NVML n'est pas un test de repos » + jeu de données HF | **Oui**, c'est la meilleure sortie de la semaine. Coût faible : tout est déjà écrit. |
| Adaptateurs micro-kiki comme produit | ailiance est abandonné (10/10), le Studio est éteint, l'apport par rapport à la base est faible (3/10) | **Non** comme produit. Au mieux, une publication HF « en l'état » avec une carte honnête. |
| Runtime micro-kiki (swap LoRA en environ 10 ms, cache de préfixe MLX) | Brique technique réutilisable, article de blog | Possible, faible priorité. |
| baby-brain comme démo pédagogique | Boucle perception-action sur ESP32 Box, babillage auto-écouté, cockpit SwiftUI | **Plausible** comme démo de médiation ou de formation, mais le dépôt est **privé** et la démo dépend du matériel. À extraire seulement si la piste formation (Qualiopi) est retenue. |
| micro-kiki-quantum | — | **Archiver** sur GitHub, sans suite. |

**À arrêter ou geler :**
1. **La réplication NH-81 sur KXKM au-delà du 04/11.** Si le waiter r4 échoue, ne pas écrire de r5. Clore NH-81 en « withdraw, provisional (IOReport, 2 plateformes Apple) » avec la mesure M3 Pro, et documenter la garde NVML comme résultat méthodologique.
2. **C5** comme contribution : la retirer de Paper A.
3. **Le récit « production / live »** de micro-kiki : réécrire le README et l'article au passé.
4. **SP6 baby-brain** : retirer le brouillon tant que E0–E2 ne sont pas planifiés. NH-77 reste le seul chemin crédible, en M2.
5. **BSK** : pas de relance (`ROADMAP.md:69`). Ajouter l'erratum sur le taux de décharge.

**Actions immédiates par sévérité :**
- BLOQUANT : retirer « 70.7 % / 89.5 % » de `.github/profile/README.md:54`.
- MAJEUR :
  - corriger le verdict 1b en « critère non valide » ;
  - noter dans le README de baby-brain que les JSON du 30/05 ont été calculés avec l'ancien LP ;
  - réécrire `micro-kiki/README.md:9` et `paper/micro-kiki.tex:50` au passé ;
  - analyser l'effet d'ordre de NH-81 ;
  - recadrer « NH-81 supported » en test peu sévère ;
  - rédiger l'erratum BSK sur le taux de décharge.
- MINEUR :
  - titres « 2 attempts » ;
  - « definitively » contre « provisional » (`nh81-joules.md:14`, `ERRATA.md:61-67`) ;
  - drapeau `withdrawn` dans `c5-info-bound.json` ;
  - archiver micro-kiki-quantum ;
  - mettre à jour les statuts du projet et retirer `a-valider-pi` des issues fermées ;
  - ajouter micro-kiki #17 au projet.

---

## Résumé (≤ 250 mots)

**micro-kiki.** La phase 0 est faite le 25/10 : errata énergie, C5 et routeur ; #10 et #12 fermées. NH-81 est mesuré sur macM1 (R̂ = 0,91 [0,83 ; 1,01]) avec des tags antérieurs aux données. La PR #19 compte en réalité 3 tentatives KXKM refusées (le titre en annonce 2) et 6 tags, dont r4 et M3 Pro déjà posés le 30/10. Sur M3 Pro, seule la sonde de repos existe ; les waiters abandonnent le 04/11.

**Critiques principales :**
- le test NH-81 est peu sévère (la voie « fused » est dense plus LIF, donc R ≤ 1 par construction) ;
- l'effet d'ordre (0,82 contre 1,01) est de la taille de l'IC ;
- sur KXKM, la soustraction d'un repos P2 à 69 W dominera la mesure ;
- « non mesuré » ne dit rien sur l'hypothèse, mais montre que la garde NVML est inutilisable : c'est publiable ;
- C5 corrigée reste vide (k-NN en d = 384).

**BLOQUANT.** Le profil `.github/profile/README.md:54` affiche toujours « 70,7 % / 89,5 % ».

**baby-brain.** Les PASS sont retirés, mais « 1b refuted » est faux : ε chute 200× et le LP est mesuré sur le plateau final, avec un estimateur remplacé une heure après les runs. #288 prévoit de recalibrer sur des logs déjà vus.

**quantum.** Bac à sable : les critères de succès ne comparent jamais à LoRA. À archiver sur GitHub.

**Projet n° 1.** 80 items, tous « À valider », 65 ouverts portent `a-valider-pi` (et non 47). M0 : 12/18 fermés, 6 ouverts, tenable si le profil est corrigé.

**À arrêter :** la réplication KXKM au-delà du 04/11, C5, le récit « production » de micro-kiki et SP6 sans plan. **À valoriser :** une note méthodo sur la mesure d'énergie.
