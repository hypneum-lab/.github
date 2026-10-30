# Hypneum Lab : priorités, travaux à intégrer, hypothèses (30/10/2026)

Conseil scientifique et stratégique, en lecture seule. Sources (chemins relatifs au scratchpad) : `inventory/*.md` (6 inventaires et `compute-status.md`), `research/{lit-R6-R11,opensource-landscape,utilite}.md`, `repos/github/docs/ROADMAP.md`, le rapport du 24/10 (`…/2026-10-24-revue-hypotheses/README.md`) et son `synthese/02-catalogue`, ainsi que les mémoires roadmap, revue et visibilité. `research/lit-R1-R5.md` **n'existait pas** au moment de la rédaction (vérifié deux fois) : les axes R1–R5 reposent sur la revue du 24/10.

Convention : **[F]** = fait, avec sa source ; **[O]** = opinion du conseiller.

---

## 1. Gestion des priorités

### 1.1 La roadmap n'est pas tenable à 10 h/semaine

**[F]** Le budget de novembre à janvier est d'environ 130 h, et la roadmap l'attribue déjà en totalité (`utilite.md`). Le projet GitHub compte **80 items, dont 65 ouverts** avec `a-valider-pi`, et non 47. Les 80 sont au statut « À valider » et aucun ne porte d'étiquette `verdict:*` (`micro-kiki-babybrain-github.md` §1).

**[F]** Le 30/10 à 14:23, six chantiers tournent ou sont armés (`compute-status.md`) :
- N10-C run 2 sur macM1 ;
- E1-small sur KXKM, 290 cellules sur 1 410, fin estimée au 01/11 vers 21:30 ;
- deux reruns NH-01 sur ES ;
- NH-81 et la grille M5 v2 sur macM3 ;
- le fetch ActionSense sur macM1.

La roadmap pose pourtant « pas plus d'une campagne lourde à la fois ».

**[F]** Plusieurs dates de la roadmap sont périmées :
- N10-C finira vers le **20–21/11** ;
- N10-C-bis ira de ≈ 20/11 à mi-décembre (`nerve-wml.md` §1) ;
- E1 (≈ 70 h de 4090) est absent de la roadmap ;
- NH-81 et NH-03 ont été tirés en S1, alors qu'ils étaient prévus en S8 et S10 (`dream-of-kiki.md` §2.5).

**[O]** Le goulot n'est pas le calcul, c'est **l'attention du PI**. NH-81 a produit à lui seul 6 tags, 4 décisions et 3 tentatives KXKM en cinq jours. Compter 65 issues à ≈ 2 h donne ≈ 130 h, soit tout le trimestre sans écrire une ligne. La surcharge structurelle est donc d'environ **2×**, et la phase 2 (10 hypothèses en 5 semaines) n'aboutira pas.

### 1.2 Règle de priorisation

**[O]** Les règles s'appliquent dans l'ordre. La première qui s'applique tranche.

1. **Faux en public d'abord** : profil, README, DOI.
2. **Un BLOQUANT sur une dépense engagée passe avant une nouvelle campagne.** Corriger une règle de décision *avant* l'arrivée des données coûte 1 h ; après, une déviation, voire la campagne.
3. **Un verdict qui dort sur des données existantes passe avant une nouvelle mesure.**
4. **Pas de calcul pour un critère qui ne peut pas échouer** : C3′ de NH-01, H14-A d'E1, voie « fused » de NH-81, FAILS de H13.
5. **Encours maximal** : une campagne lourde, un pilote CPU de 6 h au plus, trois issues « En cours ».
6. **Une heure d'écriture qui capitalise passe avant une heure de pilote neuf**, tant que des négatifs propres attendent leur publication (cinq aujourd'hui).

### 1.3 Les 10 prochaines actions (≈ 21 h de PI)

| # | Action | Pourquoi maintenant [F] | h | Hôte | Débloque |
|---|---|---|---|---|---|
| 1 | Retirer « 70,7 % / 89,5 % » du profil `.github` ; micro-kiki README et tex au passé ; baby-brain 1b → « critère non valide » ; B-3 → « non concluant, lésion non effective » | règle 1 ; M0 ne peut pas fermer sinon (`micro-kiki-babybrain-github.md` §2.3, `bouba_sens.md` B1) | 1,5 | — | M0 |
| 2 | **Réécrire et dater la règle GO 35B** : ne retenir que H14-B SUPERIOR ; déposer E1-small sur OSF avec sa déviation ; horodater par un tiers le brouillon, l'avenant et le manifeste | E1-small finit le **01/11** ; H14-A est positif sans rêve (smoke +0,04 à +0,07) (`dream-of-kiki.md` §2.1) | 1,5 | — | décision GB300 / Studio 18–20 j |
| 3 | **Porte de nécessité de la communication** dans le texte N10-C-bis avant le gel : `eng − nocomm ≥ 0,2`, `closed`, 10 M de pas ; déclarer la brèche N3 si elle est avérée | gel avant le 06/11 ; `gtm_mis` 0,81 > `gtm` (`nerve-wml.md` N1, N3) | 2 | KXKM après E1 (~40 min GPU) | évite 21 j de KXKM sur un nul prévisible |
| 4 | M5 : vérifier que 13 + 37 = 50 configurations couvrent la strate primaire (le PREREG en dit 96) ; ajouter l'hôte à `RUN_KEY` **avant** la mise en commun | la grille v2 démarre aujourd'hui vers 15:35 (`kiki-flow-research.md` §2.3) | 1 | macM3 | un verdict qui ne soit pas `failed` d'office |
| 5 | kiki-flow : test de **blocage de grille** (γ = 0, Gibbs perturbé, 20 pas, 16 contre 64 points) ; note Zenodo « superseded » sur 23636477 | le seuil dx²/2h = 0,71 peut expliquer l'excès négatif ; le DOI publie un split non JKO (`kiki-flow-research.md` §2.1, §2.5) | 2 | ES < 1 h | choix de grille pour le recalcul de 8–11 j ; NH-60 |
| 6 | bouba_sens : `K_STEPS=50` sur `main`, puis relance de l'interaction gaussienne avec **la diagonale comme contrôle de manipulation** préenregistré | lésion à 19 dB, diagonale non dégradée (`bouba_sens.md` B1) | 2 | ES 1–2 h | un vrai test de B-3 ; v0.7 corrigeable |
| 7 | Clore NH-81 : pas de r5 ; modéliser l'effet d'ordre (0,82 contre 1,01) ; M3 Pro en descriptif ; erratum BSK (taux de décharge 13,8 %) | les waiters expirent le 04/11 ; la réplication n'apporte plus d'information (`micro-kiki-babybrain-github.md` §2.1) | 2 | — | KXKM, attention, matériau pour la note |
| 8 | NH-01 : **arrêter #90**, marquer #87 « non calculable », lancer un seul pilote non tautologique : noyau rêvé contre désapprentissage itératif, écrêtage spectral et élagage, à norme de Frobenius égale | C3′ ne peut pas réfuter ; J(t) = projection ridge (`nerve-wml.md` H1–H3) | 3 | ES ≤ 4 h | « rêve ≠ décorrélation » devient testable |
| 9 | Lundi : tri du projet, 65 → **25 issues ouvertes au plus**, le reste en `gelé-2027`, avec des statuts réels | le tableau ne pilote rien | 2 | — | rend la règle 5 applicable |
| 10 | Jeudi : plan et figures de la note méthodo (B-3, prox kiki-flow, récence NH-03, NH-81, garde NVML), choix de la revue | cinq négatifs propres attendent (`utilite.md` §1) | 3 | — | M3 ; argument CDI |

Les dépôts OSF de G4-nono et de DR-3 se font en un clic, à placer juste après les 10 actions, mais une fois NH-100 tranché (§4).

### 1.4 Pause ou non-relance (coût d'opportunité)

| Campagne | Décision [O] | Raison [F] | Ce qu'on libère |
|---|---|---|---|
| N10-C | la laisser finir, présentée comme « borne sur une tâche sans besoin d'information » | IC ± 0,19 à n = 6 : seuls des effets ≥ 0,2–0,3 sont décidables | 0 (déjà payé) |
| **N10-C-bis** | à lancer seulement si l'action 3 passe ; sinon N10-D (NH-96) | même défaut de construit | ≈ 21 j de 4090, 10–15 h de PI |
| **E1 35B** | pause jusqu'à H14-B et au contrôle « options seules » | Daily Oracle à 0,185, sous le hasard ; E1 ne mesure pas l'oubli | 18–20 j de Studio ou une location GB300 non chiffrée |
| **M5 secondaire** | plafond de 40 worker·h, ou annulation | ≈ 400 worker·h sans critère d'arrêt | ≈ 4 j de KXKM CPU |
| **NH-81 r5** | non | réplication quasi certaine | ≈ 6 h de garde |
| NH-01 #90 | arrêter | limite analytique déjà connue | 90–190 h cœur sur ES |
| v0.9 bouba, brouillon TOST | geler, arrêter | trois portes échouées ; équivalence garantie sur un canal effondré | macM1 ; ≈ 10 h d'écriture |
| v0.7 ActionSense | ne pas signer avant les 6 corrections, puis une seule grille | `K_STEPS` absent, sondes dégénérées | 150–190 Go sur le T7 (laisser finir le fetch) |
| G4-nono N = 95 | basse priorité, seulement pour clore DR-4, avec une AUROC par paire | issue lisible dès le smoke 3 | ≈ 6 h de macM1 |
| Recalcul du papier kiki-flow | attendre l'action 5 | 8–11 j d'ES | ES |

---

## 2. Travaux existants à intégrer

### 2.a Internes

| Quoi, où [F] | Intégration [O] | Effort | On arrête de… |
|---|---|---|---|
| **Garde de campagne**, nerve-wml `campaign/guards.py` (890 l.) | l'appliquer à NH-81, M5 et E1 au lieu des waiters `pgrep` faits main | 4–6 h | trois scripts d'attente ; tags posés avant le code |
| **Nul apparié par inversion de signe**, bouba_sens `scripts/me6_paired_null.py` | l'appliquer à D(S_mKNN) de DR-3, à G4 et à NH-03 | 2 h par usage | réinventer un nul par préreg |
| **Sonde DR-3 et exporteur**, `kiki_oniric/eval/relational_probe.py` (nerve-wml v1.9.0) | ajouter les nuls « labels permutés » et « sous-ensembles de classes » | 3 h | lire FAILS là où c'est τ |
| **Corpus E1**, `scripts/e1_corpus_*.py` | contrôle « options seules » et analyse « réponse la plus longue » | 3 h + 1 soirée GPU | prendre un Δ cloze pour de la connaissance |
| **OT certifié**, kiki-flow `wasserstein_ops.py:534`, `objective_bounds` | en faire l'oracle des GW et Sinkhorn de DR-3, validé contre POT | 4 h | un second Sinkhorn non certifié |
| **Garde de vivacité PPO** (`harness/train.py`) + **diagnostic d'effondrement** (ADR-0024) | les brancher sur N10-D et sur le bras `vq` ; tester PFO (2405.00662) | 3 h | redécouvrir les troncs morts et les VQ effondrés |
| **Mesure NH-81** (IOReport sans sudo) | la recouper avec `zeus-apple-silicon` sur 3 paires | 2 h | maintenir un lecteur maison |

### 2.b Externes

| Quoi [F] | Usage [O] | Effort | On arrête de… |
|---|---|---|---|
| Rejeu par relaxation d'un Hopfield gelé, Cook 2610.37139 | **référence à battre** pour NH-01 et DR-4 | 3 h | présenter « rêve = relaxation » comme neuf |
| Apprentissage physique résistif : Dillavou PNAS 10.1073/pnas.2604421123 ; Dangol 2608.20426 et 2608.00097 ; Liu & Grollier 2610.18058 | socle de NH-92 ; `scipy.sparse` suffit | 6 h | faire l'axe matière par analogies |
| Capacités analytiques sur motifs corrélés, Stojnic 2610.38437 | remplacent la simulation #87 | 2 h | resimuler la théorie |
| `prereg` 0.6.1 / `preregister` 0.1.0 | tester `prereg freeze --osf` sur DR-3 avant tout `prereg-guard` | 3 h | coder un outil qui existe |
| `zeus-apple-silicon` + protocole asiai + wattmètre | mesures J/token ; ⚠ `powermetrics` sous macOS 27 (non vérifié) | 3 h | écrire `jpt` de zéro |
| Wang 2607.26648 (plafond de sparsité) ; Abkin 2610.32417 (J par tâche) | clore BSK ; NH-98 | 1 h | rouvrir l'argument énergie |
| EGG / JaxMARL | jeux référentiels asymétriques pour N10-D et NH-95 | 4 h | 950 h de GPU sur une tâche sans besoin de message |
| geomloss / OTT-JAX (Sinkhorn débiaisé), POT | contrôle du biais entropique, oracle | 2 h | défendre le « Peyré floor » |
| Khaous & Wisniewski 2610.13476 | nul « sous-ensembles de classes » pour DR-3 | 1 h | une préreg DR-3 fragile |

---

## 3. Abandonner, requalifier

### 3.1 Abandonner (on garde un négatif publiable)

| Hypothèse | Raison | Négatif conservé |
|---|---|---|
| Borne C5 | k-NN en d = 384 avec n = 500 : artefact d'estimateur | encadré « Fano sur une MI non validée » |
| B-3 au seuil 0,02 | P(passe \| H0) = 1 pour n ≤ 1 024 (ADR-0021) | cas d'école du seuil sans nul |
| Brouillon TOST B-2 | équivalence garantie sur un canal effondré | B-1/B-2 comme « nuls d'un régime non apprenant » |
| v0.9 bouba_sens | trois portes échouées ; tâche construite à partir des entrées | ligne d'erratum |
| Énergie BSK / triple hybride | R̂ = 0,91 ; plafond de sparsité | protocole NH-81 et garde NVML inutilisable |
| GTM comme *mécanisme* | 3W/5L/1T ; γ ≈ θ ≈ GTM | « tied » ; porteuse seulement (NH-28) |
| « Un seul flot » | aucune équation commune ; le système simulé est un splitting | question reformulée : générateur limite du splitting |
| Turing fort γ ≥ 10 sur 16 points ; NH-59/60 sous l'énergie actuelle | non-dissipatif, lissage δ, grille | ERRATUM §11–16 |
| SP6 baby-brain ; R8-lite « bio » ; micro-kiki-quantum | 0 run ; aucun lien avec DR-3 ; bac à sable | archivage documenté |

### 3.2 Requalifier

| Énoncé actuel | Requalification |
|---|---|
| B-3 « aucun effet de lésion » | **non concluant**, lésion non effective |
| NH-01 « confirmé » | **réplication à N fini** de Fachechi–Agliari–Barra / ridge ; « rêve ≠ SHY » **non testé** |
| NH-01 #87 « confirmé (formel) » | **non calculable** |
| NH-81 « withdraw definitively » | **withdraw, provisoire** ; test peu sévère, effet d'ordre ±20 % |
| baby-brain 1b « refuted » | **critère non valide, non testé** |
| N10-C | **borne sur une tâche sans besoin d'information** |
| DR-3 H13-C/D « FAILS » | **propriété de τ et de la normalisation** |
| G4-nono | **nul attendu**, métrique confondue avec le biais de la tête |
| E1 H14-A | **adaptation au format QCM** |
| kiki-flow v0.13 « rigorous JKO » ; pas certifié | **split non JKO** ; stationnarité certifiée **sur F_δ**, sans référence indépendante à coût/reg ≥ 6 400 |
| M5 | **test du solveur**, pas une hypothèse |
| Adam « sans correction » | **choix de continuité**, contraire au signal |

---

## 4. Hypothèses nouvelles (11)

Numérotation à la suite du catalogue (NH-01 à NH-90). **[VARIANTE]** = proche d'un travail externe, donc risque de scoop. **[NEUVE]** = aucun antécédent trouvé dans les veilles, ce qui ne prouve pas qu'il n'en existe pas. Chaque hypothèse passe en L1 (`hypneum-prereg`) avant son premier run.

**NH-91 — Le rêve algébrique est un recuit thermique.** [VARIANTE : R7-B, Hopfield–Feinstein–Palmer 1983]
- *Mécanisme* : un désapprentissage J ← J − ε s sᵀ, appliqué à des états de Glauber tirés à température T, reproduit J(t).
- *Prédiction* : une région (T, ε·n_u) atteint au moins **80 %** du gain de capacité algébrique (N = 1 000, motifs corrélés r = 0,3).
- *Nul* : désapprentissage sur des états uniformes non relaxés. Il doit rester sous 30 % ; au-delà de 60 %, la relaxation ne sert à rien.
- *Pilote* : 20 points, 5 graines, 2–4 h de CPU sur ES.
- *Apport* : le rêve devient une température et une durée, réalisables sur p-bits.

**NH-92 — Rêve contrastif dans un réseau résistif.** [VARIANTE : Cook 2610.37139, Ibrahim PRE]
- *Mécanisme* : entre deux tâches, on n'applique que le terme libre (anti-hebbien) du coupled learning, sur du bruit.
- *Prédiction* : à budget dissipé B = 10, l'oubli de la tâche 1 baisse d'au moins **0,10** par rapport à B = 0.
- *Nul* : signes aléatoires à budget égal. La réfutation tient si l'écart reste sous 0,05 (TOST, 5 graines).
- *Pilote* : 5 topologies, N = 64–256, ≤ 5 h de CPU sur ES.
- *Apport* : un premier « rêve » qui soit une opération physique locale.

**NH-93 — Courbe universelle d'efficacité du rêve.** [NEUVE]
- *Prédiction* : le gain normalisé croît comme log B, avec des pentes à 20 % près entre Hopfield (B = ‖ΔJ‖²_F) et réseau résistif (B = joules).
- *Nul* : des budgets aléatoires, qui donnent des pentes à plus de 50 % l'une de l'autre. La réfutation tient si l'écart réel dépasse aussi 50 %.
- *Pilote* : aucun calcul supplémentaire, on réutilise NH-91/92.
- *Apport* : un premier test empirique de « substrat-agnostique » pour DR-0, hors LLM.

**NH-94 — Le rêve efficace visite les mélanges parasites.** [NEUVE comme test quantitatif]
- *Prédiction* : sur la grille de NH-91, le gain est corrélé à la fraction des états rêvés qui tombent dans des mélanges de 3 motifs, avec ρ ≥ **0,7**.
- *Nul* : états mélangés entre points de grille. La réfutation tient si ρ < 0,3.
- *Pilote* : aucun calcul supplémentaire.
- *Apport* : un mécanisme, qui répond à la critique « projection ridge, pas un rêve » (`nerve-wml.md` H2).

**NH-95 — Bouba/kiki émerge d'un canal contraint.** [VARIANTE partielle : NH-72 ; aucun concurrent ML trouvé]
- *Mécanisme* : dans un jeu de Lewis entre vision (formes rondes ou pointues) et audio (sons d'impact simulés), la forme et le son ne s'alignent de façon cohérente entre graines que si l'alphabet est petit et bruité.
- *Prédiction* : cohérence ≥ **0,8** avec A = 4 et ≤ 0,6 avec A = 64, sur 10 graines.
- *Nul* : sons indépendants de la forme, cohérence ≈ 0,5. La réfutation tient si l'écart A4 − A64 reste sous 0,1.
- *Pilote* : EGG, CPU ≤ 6 h.
- *Apport* : la symbolique sonore comme compression de canal. Une seule expérience relie nerve-wml et bouba_sens.

**NH-96 — Le canal n'est utilisé que si l'information est privée.** [VARIANTE : résultat attendu, Lowe 2019]
- *Prédiction* : `eng − nocomm` ≥ **0,3** sur une tâche référentielle asymétrique, ≤ 0,05 sur la tâche symétrique.
- *Nul qui peut échouer* : si la tâche asymétrique donne aussi moins de 0,1, c'est l'architecture qui bloque (canal branché sur le latent de politique).
- *Pilote* : JaxMARL ou EGG, une soirée de GPU sur KXKM.
- *Apport* : conditionne 21 j de KXKM ; c'est le pivot de N10-D.

**NH-97 — La durée du rêve est fixée par validation croisée.** [NEUVE à notre connaissance]
- *Mécanisme* : J(t) est une projection ridge avec λ = 1/t ; la GCV sur les motifs stockés devrait prédire t* sans paramètre libre.
- *Prédiction* : le t* de la GCV tombe à ±30 % du t* empirique (pic vers 10), pour N ∈ {256, 1 000} et 3 charges.
- *Nul* : GCV sur des motifs permutés. La réfutation tient si l'écart dépasse 50 %.
- *Pilote* : quelques minutes de CPU sur ES, sur les données NH-01 existantes.
- *Apport* : une règle d'arrêt du rêve calculable par le substrat, c'est-à-dire un déclencheur endogène (NH-13).

**NH-98 — Seuil de densité du dividende de la sparsité sur Apple Silicon.** [VARIANTE : Wang 2607.26648, roofline 2607.24841]
- *Prédiction* : avec un noyau gather, R = J_sparse/J_dense passe sous 0,7 seulement pour une activité de **2–5 %** au plus ; avec un noyau dense masqué, R reste dans [0,9 ; 1,1].
- *Nul* : absence de croisement, ce qui arrive si l'overhead mémoire domine.
- *Pilote* : 2 h sur macM3 avec `zeus-apple-silicon` et un wattmètre.
- *Apport* : clôt NH-81 et BSK par un mécanisme ; une courbe utile à la communauté MLX.

**NH-99 — Triage mnésique par démagnétisation d'hystérons.** [VARIANTE : Preisach, Rajput 2607.15122]
- *Prédiction* : des cycles d'amplitude décroissante gardent la mémoire la plus ancienne (rappel ≥ **0,8**) et effacent la plus récente (≤ 0,3).
- *Nul* : même énergie, ordre d'amplitude aléatoire, pour un écart d'âge sous 0,1. La réfutation tient si l'ordre décroissant donne aussi moins de 0,2.
- *Pilote* : quelques minutes de CPU.
- *Apport* : DR-1 *sélective* testée dans un substrat sans poids.

**NH-100 — Le verdict DR-3 dépend plus des classes comparées que de la métrique.** [VARIANTE : 2610.13476]
- *Prédiction* : l'écart-type de D(S_mKNN) sur 50 tirages de 6 classes parmi 12 vaut au moins |D̄|/2.
- *Nul qui peut échouer* : un écart-type sous 0,25·|D̄| montre que DR-3 est robuste et peut être déposé.
- *Pilote* : < 1 h sur ES, avec les dumps G5.
- *Apport* : à trancher **avant** le clic OSF de DR-3.

**NH-101 — Le blocage de grille comme barrière de Peierls : une mémoire.** [NEUVE dans sa lecture ; probablement un artefact connu de l'OT discret]
- *Mécanisme* : la zone morte dx²/2h de kiki-flow est l'analogue numérique d'une dislocation bloquée par la discrétude d'un cristal.
- *Prédiction* : la rétention de la tâche 1 croît avec dx²/(2h), et cette dépendance disparaît avec une divergence de Sinkhorn débiaisée au même h.
- *Nul* : 64 points. La réfutation tient si l'écart 16 − 64 reste sous 0,05.
- *Pilote* : 2–4 h de CPU sur ES, en complément de l'action 5.
- *Apport* : soit une rétractation propre de l'excès négatif, soit le seul pont « cristal ↔ mémoire » calculable que le PI demande.

**[O] Ordre proposé.**
1. NH-100 et NH-97 : 0–1 h, sur données existantes.
2. NH-101, avec l'action 5.
3. Le bloc NH-91 → NH-94 : ≈ 10 h de CPU et 6 h de PI.
4. NH-96, avant toute décision sur bis ou D.
5. NH-95, NH-98 et NH-99, seulement s'il reste du budget.

---

## 5. Pistes inventives

1. **Jeu de données « errata d'un programme de recherche assisté par agents ».** Il couvrirait les ≈ 70 errata, chacun codé avec :
   - sa cause racine (paramètre ignoré, artefact gitignoré, contrôle tautologique, seuil sans nul, code poussé après le tag, PR fusionnée sans revue) ;
   - son délai de détection ;
   - son détecteur (agent, Codex, PI).

   Coût : 15–20 h. **[O] C'est la piste qui a la meilleure chance réelle.** La question des erreurs de la recherche assistée par LLM est brûlante, et personne ne publie de données longitudinales honnêtes. Ce jeu de données complète la note destinée à JOTE et sert l'argument CDI.
2. **Registre de nuls calibrés (« NullBench »).** Les nuls concernés : extrême d'un max de k différences, discrétisation pour la MI et PhiID, réseau non entraîné, contrôle de manipulation de lésion, sous-ensembles de conditions. Chacun serait accompagné de l'erreur qu'il aurait évitée. Coût : 20–30 h. Chance modérée, car il n'y a aujourd'hui aucun contributeur externe.
3. **Défi « consolidation par joule ».** Trois substrats jouets, un budget fixe et une métrique d'oubli standard, présentés comme un classement ouvert. Coût : 15 h une fois NH-91 à NH-93 faits. Chance faible, mais le projet est éligible comme commun NLnet.
4. **Deux courriels de collaboration**, l'un au groupe de Rome (Agliari/Barra ou Marinari/Zamponi), l'autre à Durian/Liu, avec NH-91 à NH-93 préenregistrés et leur code. Coût : 2–3 h. Chance faible, mais le gain est asymétrique.
5. **Contribuer à `prereg` plutôt que créer `prereg-guard`** : apporter la frontière dev/registered, le SWHID et l'attente GPU sous forme de PR en amont. Coût : 8–10 h au lieu de 25–35 h. Chance modérée.

---

## 6. QCM pour le PI (option recommandée en premier)

**Q1. Encours à partir de lundi ?**
- (a) **1 campagne lourde, 1 pilote CPU de 6 h au plus, 3 issues « En cours »** *(recommandé)*
- (b) 2 campagnes lourdes
- (c) Statu quo

**Q2. N10-C-bis ?**
- (a) **Porte de nécessité avant le gel du 06/11 ; en cas d'échec, N10-D asymétrique** *(recommandé)*
- (b) Geler tel quel et lancer vers le 20/11
- (c) Abandonner bis tout de suite

**Q3. E1 et 35B ?**
- (a) **Règle GO réduite à H14-B SUPERIOR, datée avant le 01/11 ; OSF et horodatage ; 35B en pause jusqu'au contrôle « options seules »** *(recommandé)*
- (b) Garder la règle et l'assumer
- (c) Abandonner le 35B

**Q4. Axe matière ?**
- (a) **GO restreint : NH-91 à NH-94 et NH-101, en CPU uniquement, plafond de 15 h de PI, décision en S13** *(recommandé)*
- (b) NO-GO par défaut (position de `utilite.md`)
- (c) GO/NO-GO de S13 sans plafond

*[O] Ce conseil diverge ici de `utilite.md` : les pilotes R7 sont les moins chers, les seuls réellement hors LLM, et ils s'appuient désormais sur une littérature avec des équations. Le plafond est là pour contenir la dérive.*

**Q5. Premier publiable ?**
- (a) **Note méthodo et jeu de données d'errata : arXiv fin janvier, puis JOTE** *(recommandé)*
- (b) TMLR
- (c) Billets seulement

**Q6. Tableau de projet ?**
- (a) **25 issues ouvertes au plus, le reste en `gelé-2027`, tri le lundi 2/11** *(recommandé)*
- (b) Tout garder et prioriser par étiquette
- (c) Recréer un projet limité aux phases 0–1
