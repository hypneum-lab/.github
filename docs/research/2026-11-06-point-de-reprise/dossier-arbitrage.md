# Point de reprise roadmap v2 — dossier d'arbitrage (6 novembre 2026)

**Statut :** dossier préparatoire, en lecture seule. Il ne décide rien. Chaque question de la §6 est rédigée pour un QCM du PI ; l'option la plus conservatrice vient en premier, ce qui ne vaut pas recommandation.
**Lecture des dépôts :** API GitHub, org `hypneum-lab`, le 06/11 entre ≈ 17:00 et 18:00 CET. Les heures GitHub (UTC) sont converties en CET (UTC+1).
**Sources principales :** `.github` `docs/ROADMAP.md` (v2.1, fusionnée par la PR #28 le 06/11 16:57 CET, ci-après **RM**) ; `docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md` (**spec**) ; `docs/research/2026-11-01-analyse-profonde/README.md` (**rapport**) ; nerve-wml PR #105, #107, #109, #111, #112, #113 (fusionnées), #100, #114, #115 (brouillons) ; dream-of-kiki PR #88, #91 (fusionnées), #92 (brouillon).

**Déjà décidé le 06/11, non rouvert ici :** verrou N10-D (rapport du contradicteur rendu et vérifié : 0 constat réfuté, 2 BLOQUANT confirmés dont la porte `sym`, 1 requalifié) ; amendements A1-A20 dans la PR #115 ; décisions de 16:55 (σ_D sur différences appariées, brèche déclarée ; n_eval = 500 ; lecture N10-C conditionnée) ; H14-B signée ; 17 PR fusionnées le matin ; bouba #72 en correction. **Q8 (N10-C-bis 3 graines, PR #114, contre N10-D corrigé, PR #115) est reportée à cette séance** : c'est l'objet central du dossier (§3).

**Remarque de cadrage.** RM v2.1 écrit déjà « Point de reprise tenu le 6 novembre 2026 » et y consigne Q8 « les deux » (préparer les deux, une seule gelée). Ce dossier sert la partie restante de la séance : le choix effectif de Q8 et la réécriture de S6-S13.

---

## 1. Où en est-on : les trois déclencheurs

La spec (§7, dernier point) fixe le point de reprise quand trois choses sont « connues » : l'analyse de N10-C run 2 (tag d'analyse), la fin d'E1-small et son analyse selon la préreg, le rapport du contradicteur N10-D.

| Déclencheur | Statut factuel au 06/11 ≈ 17:30 | Preuve | Ce qui manque pour dire « connu » |
|---|---|---|---|
| **(1) Analyse N10-C run 2** | Campagne arrêtée après la graine 0 (déviation du 04/11, signée 06:51), analyse intermédiaire déclarée et signée le 04/11, **arrêt définitif** décidé le 05/11 vers 06:33 après lecture du rapport intérimaire. Neuf cellules de graine 0 évaluées, sur un seul hôte (macM1) ; moitié KXKM jamais lancée. Toutes les valeurs sont exploratoires (option (b) de l'amendement intérimaire) ; sous R3, N10-C est rapporté comme ininterprétable en preuve de communication. | nerve-wml PR #105 (fusionnée 04/11 06:52), #107 (04/11 19:18), #109 (05/11 20:19) ; `docs/milestones/n10c-procgen-multiagent-gtm-comm-closure-2026-11-05.md` §2 ; tags `n10c-freeze-20261024` et `n10c-freeze-20261029` seulement. | **Aucun tag d'analyse** (`git ls-remote --tags` : aucun tag `n10c-*analysis*`). Rapport descriptif de l'issue #63 attendu ≈ 15 nov. Case de la closure §4 encore ouverte : « table des machines du plan du 01/11 corrigée ». Le tag d'analyse est un « reste à arbitrer » de RM (Q7 ci-dessous). |
| **(2) E1-small fini et analysé selon sa préreg** | Campagne finie le 01/11 à 20:20 sur erreur (`math domain error`, bras exploratoire), 1 271/1 410 cellules, 9 profils enregistrés × 141 graines complets. Analyse **selon la préreg gelée** faite et fusionnée le 06/11 (H14-A/B/C toutes exploratoires, aucun titre conjoint). Déclaration H14-B (contrôle de même norme) fusionnée et signée le 06/11 (fusion 13:12, signature 13:17). Addendum de contrôle lancé sur KXKM le 06/11 à 14:17. | dream-of-kiki PR #88 (fusionnée 06/11 13:12, commit de signature 13:17), #91 (fusionnée 06/11 14:04), `docs/results/2026-11-06-e1-small-analysis.md` ; PR #92 brouillon, `docs/osf-addendum-e1-small-controls-2026-11-06.md` §7. | Fin et lecture des **contrôles** de l'addendum (#92) : 564 cellules, fin estimée entre le 07/11 ≈ 18:30 et le 08/11 ≈ 16:00 ; « options seules » fini (14:25, rc = 0). La PR #92 reste à relire et fusionner. Les contrôles ne changent aucun état enregistré (ils ne dépensent pas d'α). Au sens de la spec, E1-small est **connu** ; ses contrôles ne le sont pas encore. |
| **(3) Rapport du contradicteur N10-D** | Deux passes aveugles (Codex `gpt-6.1-sol` xhigh, Claude Opus), verdict « partiellement » × 2 ; synthèse ; deux vérifications en source (22 constats, 0 réfuté). Corrections A1-A20 portées dans la PR #115 (6 commits, dernier `4158e72` à 16:59 : σ_D sur différences appariées). | nerve-wml PR #113 (fusionnée 06/11 16:57) : `docs/n10d/contradictor-2026-11-06/{SYNTHESE,VERIFICATION,verification-2026-11-06}.md` ; PR #115, `docs/prereg/n10d/protocol.md` §8. | Le **rapport** est connu ; le **verrou** ne l'est pas. Manquent : tours de veille après amendement (aucune branche `docs/n10d-veille-tour-1-2026-11-06` sur le dépôt distant à l'heure de lecture ; le journal `docs/prereg/n10d/veille-journal.md` compte deux tours, tous deux du 01/11, avant le contradicteur) ; les trois tests (note v0.3 §6 : saturation « non déclarée », recoupement non passé, couverture 5 canaux sur 6) ; TBD-10 et TBD-11 ouverts. |

**Trois points relevés en lisant, à signaler au PI (faits, sans verdict) :**

1. **Deux branches portent les corrections N10-D.** La PR #100 (`prereg/n10d-skeleton`) a reçu les commits `1ccb78b` et `e5fbe88` le 06/11 (« apply contradictor fixes ») ; la PR #115 (`prereg/n10d-skeleton-amend-2026-11-06`) porte A1-A20 et le commit de 16:59. RM cite la PR #100 comme « corrigée des 19 points ». Laquelle fait foi au gel n'est écrit nulle part.
2. **Brèche du pilote N10-D déclarée à moitié.** Le commit `4158e72` ajoute à `nh96-null.md` §2 un renvoi à « protocol section 4, "Pilot read-out (declared)" » ; à ce commit, `protocol.md` §4 ne contient pas cette sous-section (grep « breach », « read-out » : 0 occurrence). Le texte de §4 décrit encore la borne de Cauchy-Schwarz `sd(S_eng) + sd(S_nocomm)` « so no pairing is read », que la décision de 16:55 remplace.
3. **Jalon M0 (8 nov) : les deux PR de corrections publiques ne sont pas fusionnées.** RM (tableau des jalons) les dit « fusionnées le 06/11 » en citant `.github` #23-#25 et kiki-flow-research #65. Or #23-#25 sont l'analyse, la spec et la veille, et kiki-flow #65 corrige la bibliographie. Les PR de la décision Q5 du 01/11 sont kiki-flow-research **#64** (bannière `main.tex` et `CITATION.cff`, brouillon, dernière mise à jour 04/11) et `.github` **#26** (profil, chiffres micro-kiki retirés, brouillon). La note « superseded » sur Zenodo n'est pas vérifiable depuis git.

Un quatrième fait sort du périmètre des trois déclencheurs mais touche le calendrier des machines : **P1bis-ext et P8c-nocap** (Hopfield, nerve-wml PR #106) ont été gelés le 04/11 (tag `prereg-hopfield-p1bis-p8c-freeze-20261104`) et P8c relancé le 05/11 (tag `prereg-hopfield-p8c-relaunch-20261105`, PR #112 : plafond 36 h HU, 120 h de mur, 8 workers) sur le CPU de KXKM. Ni la PR #106 ni RM ne mentionnent une note de lecture ou un contradicteur pour ces deux préregs ; RM ne les inscrit dans aucune case du calendrier. Le principe 6 de RM vise toute campagne « > 6 h CPU » (question Q9).

---

## 2. Heures

### 2.1 Méthode et limites

**Il n'existe pas de feuille de temps.** Les chiffres ci-dessous sont une **estimation par activité git**, pas une mesure. Presque tous les commits sont écrits par des agents sous le compte `electron-rare` (645 sur 649 depuis le 26/10) : le nombre de commits mesure le travail des agents, pas celui du PI. L'estimation du temps PI part des **traces de présence** : fusions groupées, signatures datées, QCM consignés, lectures déclarées dans les déclarations, commentaires publics. Elle est donnée en fourchette, à l'ordre de grandeur.

Découpage : RM définit **S1 = 26 oct-1 nov** et **S2 = 2-8 nov**. Le brief de séance parlait de « S1 (1-7 nov) » ; ce dossier suit RM. S2 n'est comptée que jusqu'au 06/11 ≈ 17:00.

| | S1 (26/10-01/11) | S2 (02/11-06/11, 5 jours sur 7) |
|---|---:|---:|
| Commits (10 dépôts, branches par défaut et branches de PR ouvertes) | 422 | 227 |
| PR fusionnées | 103 | 30 |
| Heures d'horloge distinctes avec au moins un commit | 57 | 22 |
| Traces PI datées | soumission ReScience #147 (31/10), créneau GB300 (01/11), QCM 01/11 20:15-21:50 | 02/11 soir (veille des thèses) ; 04/11 06:41-06:52 (signature déviation N10-C), 18:14-19:46 (décisions P8c et tolérance NH-01, commentaire #147 à 18:47, réponse à 19:46, amendement intérimaire signé) ; 05/11 ≈ 06:25-06:45 (lecture du rapport intérimaire, arrêt de N10-C), 20:18 (relance P8c), fusions 20:19 ; 06/11 07:05-07:26 (fusions groupées), 13:12-13:17 (H14-B), 13:45 et 13:58 (QCM), 16:55 (décisions N10-D), 16:57 (fusions) |

### 2.2 Estimation par poste (heures PI, fourchettes)

Les postes de S1 précèdent la roadmap v2 ; ils sont rapprochés des postes v2 pour la comparaison.

| Poste | Budget trimestre | S1 estimé | S2 estimé (au 06/11) | Ce qui fonde l'estimation S2 |
|---|---:|---:|---:|---|
| **É** écriture et corrections | 80 | 6-9 | 4-5 | commentaire #147 et réponse à l'éditeur (04/11) ; PR v2 ReScience rescience-nh01 #8 (brouillon) ; relecture et fusion de 7 PR de corrections bibliographiques (06/11) ; plan FOSDEM régénéré (04/11). Note méthodo : aucun commit de manuscrit depuis le 31/10 (seul `docs(refs)` du 04/11) |
| **V** verrou de lecture | 50 | 6-8 | 4-6 | note N10-D v0.3 fusionnée (#102), contradicteur et vérification (#113) lus et tranchés ; notes bouba v0.7.1 (#68) et NH-20 (kiki-flow #61) fusionnées ; décision de lecture intégrale de la bibliothèque (04/11, travail des agents) |
| **A** analyse des runs | 10 | 3-5 | 3-4 | N10-C : déviation, amendement intérimaire, lecture du rapport, closure ; E1-small : analyse lue et fusionnée |
| **C** calcul | 15 | 6-9 | 2-3 | gel P1bis/P8c et relance P8c ; lancement des contrôles E1-small ; recalcul B-2 bouba (#75, #76, #78) ; préparation A+ |
| **R** retraits textuels | 10 | 1-2 | ≈ 1 | kiki-flow : « Conger Theorem 3.4 » retiré (05/11) ; micro-kiki : borne de Caro ; erratum README bouba |
| **Rés** réserve et pilotage | 20 | 3-4 | 2-3 | deux QCM du 06/11, roadmap v2.1, fusions groupées |
| **Total** | **185** | **≈ 25-37** | **≈ 16-22** | contre 14 h/semaine ; S2 projetée au 08/11 (demi-week-end) : ≈ 19-27 |

**Lecture :** S1 et S2 dépassent toutes deux les 14 h/semaine, dans ces fourchettes. Si S1 est comptée dans les 185 h, il reste environ 185 − (25 à 37) − (19 à 27) ≈ **121 à 141 h** pour S3-S13, contre 154 h à 14 h/semaine sur 11 semaines. RM ne tranche pas si S1 est dans les 185 h (« ses heures ne sont pas mesurées dans ce fichier »).

### 2.3 Ce que S1-S2 a couvert du « Report explicite »

Le « Report explicite » de RM chiffre à 129 h ce qui part en S6-S13 (contre ≈ 112 h de capacité).

| Ligne du report | h | Couvert en S1-S2 (estimation) | Reste |
|---|---:|---|---:|
| Note méthodo (arXiv avant le 15/12) | 30 | rien de visible dans git (endossement arXiv non tracé) | 30 |
| NH-91 en section de la note | 4 | rien | 4 |
| Amendement bouba v0.7.1 | 6 | rien (la note de lecture v0 relève du verrou) | 6 |
| Verrou N10-D | 19 | note v0.3, deux tours de veille (01/11), contradicteur, deux vérifications, A1-A20 : surtout en heures-agent ; ≈ 6-9 h PI | ≈ 10-13 |
| Verrou bouba | 15 | note de lecture v0 (#68) : ≈ 2 h | ≈ 13 |
| Verrou NH-20 | 10 | note de lecture (#61) et addendum de travaux connexes : ≈ 2 h | ≈ 8 |
| Analyse Me6 | 4 | rien | 4 |
| Retraits textuels | 8 | Thm 3.4 kiki-flow, Caro micro-kiki, erratum bouba : ≈ 1-2 h ; bannières (#64, #26) en brouillon | ≈ 6-7 |
| Calcul | 15 | hors report : calculs non prévus faits (P8c, contrôles E1-small, B-2) | 15 |
| Réserve | 18 | consommée en partie par du non prévu (bibliothèque, B-2, bouba #72/#74/#79, P1bis/P8c) | ≈ 12-15 |
| **Total** | **129** | **≈ 12-18** | **≈ 111-117** |

**Travail entré dans le plan depuis le 01/11, non chiffré dans le report :** deux relectures ReScience C promises « avant la mi-décembre » (commentaire #147 du 04/11 19:46 ; 8-12 h estimées par inférence, RM n'en budgète que 2 h en S5) ; réponses aux relecteurs de #147 (deux volontaires se sont proposés le 04/11 et le 06/11) ; porte A+ (≈ 8 h PI, plan #114 §3), qui n'apparaît dans aucun tableau S3-S5 ; lecture des contrôles E1-small (≈ 1-2 h) ; analyse P1bis/P8c (non chiffrée) ; suites de B-2 (issue #77, lots d'entraînement contigus) et défauts physio bouba #72/#79. Confirmation sur ReScience/ReScience#118 : aucun commentaire du compte `electron-rare` trouvé par l'API sur #118 (le 06/11) ; l'engagement figure sur #147.

---

## 3. Q8, dossier contradictoire

Rappel des règles en vigueur (RM) : **une seule** des deux études est gelée et calculée avant M2 (3 jan) ; **une seule campagne lourde à la fois** ; la porte A+ de N10-C-bis tourne en S3-S5 comme runs de développement, résultats non lus avant le gel (dérogation du 06/11 13:58) ; B' seulement si A+ passe et si le PI le choisit à M1.

### 3.1 Les deux candidats

| | **N10-C-bis à 3 graines (PR #114)** | **N10-D corrigé (PR #115)** |
|---|---|---|
| **Question réellement testée** | Deux objets. **A+** (porte G2 à 3 graines + `nocomm_rep`) : dans le harnais N10-C, avec le canal N10-C, en condition `closed`, sur les niveaux d'entraînement, le message idéal (`eng`) laisse-t-il une marge D̄ ≥ 0,20 sur le silence ? C'est une **règle de décision**, pas un test (à k = 3 le test des signes ne peut pas rejeter : p minimale 1/8). **B'** (6 cellules `closed` × 3 graines, 18 runs) : **estimation descriptive seulement** ; demi-largeur de l'IC apparié à 98,33 % ≈ 0,44 à σ_D = 0,10, donc « pilot-inconclusive » sauf effet > ≈ 0,5. Ni A ni B ne tranchent « le GTM communique-t-il » (R3 reste en vigueur). | Le contraste optimal est **analytique** (0,75 en `asym`, 0 en `sym`, Pl d'Eccles 2019) : N10-D ne teste pas la nécessité informationnelle. Il teste si la **tuyauterie du canal et l'apprentissage PPO** (tronc N10-C adapté) réalisent une part du contraste disponible dans un jeu de Lewis à un coup, K = 16, C = 4, sur deux backends (JaxMARL, EGG). Issue A = « plumbing and PPO learning validated on this task ». NH-96 est étiquetée VARIANT (résultat attendu : Lowe 2019 ; Lazaridou 2017 rapporte 99-100 %). Sans bras exécuté dans le harnais N10-C, aucun résultat N10-D ne se lit sur N10-C (A10). |
| **Ce que le verrou exige encore** | Pour **A+** : rien selon la décision du 06/11 (runs de développement). Pour geler **B'** : une **note de lecture propre** à N10-C-bis (contenu ou présence, départ à chaud, VQ), un **contradicteur** aveugle qui ne reçoit ni la note ni le plan, **au moins deux tours** de veille datés, les **trois tests** ; plus les corrections de `MS` avant tag (analyse appariée, graines neuves, métrique d'efficacité, comparateurs ré-entraînés, déclaration de non-aveuglement). Rien de cela n'est commencé. | **Note** : v0.3 (01/11) à amender après le contradicteur. **Contradicteur** : fait et vérifié. **Tours de veille** : deux tours datés du 01/11 ; un tour postérieur aux amendements n'est pas sur le dépôt. **Trois tests** : saturation non déclarée, recoupement non passé, couverture 5/6 (thèses et HAL interrogées au tour 2 en résumé ; bioRxiv et Crossref à vérifier dans le journal). **Avant le gel**, hors verrou : TBD-10 (règle de divergence) et TBD-11 (budget du pilote, encodage, règle d'action) ; pilote de 8 graines 9600-9607 pour fixer σ_D et k ; environnements hachés et réels sur les deux backends (`backends.py` lève une exception), émetteur conçu, auditeur scripté, audit de fuite a priori, adaptation du tronc. |
| **Coût GPU** | A+ : 9 runs, ≈ 12,5 h nominal sur KXKM (6 runs + 1 préentraînement) et ≈ 10,9 h sur macM1 (3 runs), mur ≈ 12,5 h, ≈ 21,8 h au pire avec une relance par run. B' : 18 runs, ≈ 194 h KXKM seul (≈ 8,1 j), ≈ 130 h en mixte (≈ 5,4 j). B complet : 54 runs, ≈ 583 h, incompatible avec M2. | **Non chiffré dans le protocole.** Ordre de grandeur, par inférence : k = 8 si σ_D ≤ 0,20, 13 à 0,25, 16 à 0,30 (table §4) ; bras `eng`, `nocomm`, `learned` (+ `msg_shuffle` en évaluation) × 2 conditions × 2 backends, plus le pilote (8 graines × 2 bras × 2 backends). Un jeu à un coup est a priori bien moins coûteux par run qu'un run Procgen de 10 M pas, mais aucune durée n'est mesurée. |
| **Coût PI** | A+ ≈ 8 h (S3-S5). B' ≈ 30 h (verrou ≈ 15-19, préreg et manifeste ≈ 7, suivi et analyse ≈ 6), plan #114 §3. | Verrou restant : ≈ 10-13 h des 19 h du report (§2.3). Ingénierie des deux backends, revue du fork EGG, manifeste, pilote : **non chiffré** ; le poste C de RM (15 h) devait couvrir le calcul N10-D. |
| **Calendrier** | A+ : go PI daté le jeudi 12/11, KXKM du 12 au 13/11 si aucun job E1 ne tient la carte, macM1 la nuit du 13 au 14/11, relances S4, verdict catégoriel S5. B' : gel au plus tôt S7, calcul S8-S9, fini avant M2 seulement à la place de N10-D. | M1 (29 nov) suppose verrou passé ; pilote nécessaire avant le gel pour fixer k ; gel au plus tôt S6 selon RM. |
| **KXKM libre ?** | Non avant le 07/11 ≈ 18:30 au plus tôt : contrôles E1-small (tmux `e1s-controls`, pic 19,4 Go, fin estimée 07/11 18:30 → 08/11 16:00) ; P8c sur CPU (jusqu'à 120 h de mur depuis le 05/11 au soir, contention CPU constatée : 1 262 s par graine contre 708-908 s attendues). `gpu_wait.sh` sérialise A+ derrière E1. Deux jobs GPU en parallèle exclus par G5. | Même carte, après A+ ; « une seule campagne lourde à la fois ». |
| **Brèches d'aveuglement** | **Troisième brèche** : lecture des résultats held-out de graine 0 le 05/11 (`…-amendment-2026-11-04-interim.md:94`) ; toute décision du plan est **non aveugle vis-à-vis de la graine 0**. Les deux précédentes : « 0,96 » lu le 30/10 vers 13:12 (closure §3), puis son report dans la revue de conception. Graines 9104 et 9105 « regardées » en `registered` à 1 M pas (4 runs `gate_dev` chacune, résultats lus le 25/10), pas pour le contraste G2. Le jeu de bras B' (retrait de `dial`, `mlp`, `atoc`, `eng_gtmrx`, `gtm_warm`) est déclaré **informé par les résultats**. | **Brèche n° 1 déclarée le 06/11 16:55** : le script du pilote apparie les bras et calcule σ_D sur les différences par graine (`4158e72`) ; il n'imprime que n_eval, sigma_seed, σ_D et k, jamais une moyenne de différences ni un score par graine. La déclaration renvoie à une section de `protocol.md` §4 qui n'existe pas encore (§1 ci-dessus, point 2). |
| **Résultat positif : ce que la note méthodo pourrait écrire** | A+ PASS puis B' : « dans le harnais N10-C, le message idéal laisse au moins 0,20 de marge sur le silence (porte à seuil, taux d'erreur publiés : type I ≈ 0,7 %, faux échec ≈ 11 % à D = 0,30 sous σ_D = 0,142 supposé) ; estimations descriptives à 3 graines appariées, non aveugles vis-à-vis de la graine 0 ». Exemple de porte de décision avant gel. | Issue A : « tuyauterie et apprentissage PPO validés sur un jeu où la nécessité est analytique » ; exemple d'une question requalifiée par le verrou (VARIANT, résultat attendu). |
| **Résultat négatif : ce que la note pourrait écrire** | A+ FAIL : application de G3, N10-C-bis non gelée ; « sur cette tâche et ce budget, le message idéal n'a pas laissé une marge de 0,20 » — pas « la communication est inutile ». B' inconclusive : cas d'école de « k = 3 ne peut rien trancher ». | Issue C : prédiction échouée, NH-96 rejetée ; « l'architecture bloque » devient une hypothèse pour un amendement séparé. Issue « non mesurable » si un contrôle `asym` échoue. Divergence entre backends : « non concluant » global (proposition A17). |
| **Risques** | B' n'existe que si A+ passe ; l'objet B' ne peut trancher ni supériorité ni équivalence ; contention KXKM ; pause du second cerveau sur macM1 ; déviation de substrat (mixte) ; le verrou B' tombe en S6-S7, avec la note méthodo. | Deux backends à construire ; fork EGG prévu dans l'org `ailiance` (TBD-1, commit 54eb11c6) ; deux branches de corrections (#100, #115) ; TBD-10/11 ouverts ; résultat sans retour sur N10-C/GTM. |

### 3.2 Trois options et leur calendrier

Hypothèses communes : A+ tourne en S3-S5 comme décidé ; le verdict catégoriel A+ est connu en S5 ; le poste C (15 h) couvre A+ ; « une seule » gelée avant M2.

| | **Option 1 — N10-C-bis gelé (B')** | **Option 2 — N10-D gelé** | **Option 3 — N10-D tuyauterie, puis N10-C-bis** |
|---|---|---|---|
| Contenu | B' gelé si A+ PASS ; N10-D après M3 | N10-D seul ; N10-C-bis (B') après M3, quelle que soit l'issue d'A+ | S6-S8 : N10-D réduit à sa tuyauterie (pilote, contrôles 1-4, porte `sym`) ou gelé en entier ; puis B' si A+ PASS |
| S3-S5 | A+ ; rien d'autre pour N10-C-bis | A+ (scellé) ; tours de veille N10-D, trois tests, TBD-10/11 ; construction des backends | comme l'option 2 |
| S6 | ouverture du verrou B' (note, brief du contradicteur) | pilote N10-D, k fixé, gel si verrou passé ; lancement | pilote et tuyauterie N10-D |
| S7 | contradicteur et tours B', trois tests ; **gel au plus tôt** ; en collision avec arXiv (15/12) | calcul N10-D | verrou B' |
| S8-S9 | calcul B' (≈ 8,1 j KXKM seul, ≈ 5,4 j mixte), lecture interdite ; S9 tampon | calcul ou fin ; S9 tampon | gel B' S8 au plus tôt ; calcul S8-S10 |
| S10 | verdict par script | verdict par script | verdict B' S11 ou après |
| M1 (29 nov) | tenu au sens « décision prise » ; le KPI « verrou N10-D passé à M1 » tombe et devient « verrou N10-C-bis passé, S7 » | tenu si le verrou N10-D passe d'ici le 29/11 | comme l'option 2 |
| M2 (3 jan) | tenu de justesse (calcul fini ≈ 22-25 déc si gel S7) ; glisse si le verrou glisse d'une semaine | tenu si l'ingénierie des backends tient en S3-S6 | tenu pour N10-D ; B' sort de « une seule avant M2 » (dérogation à décider) |
| M3 (24 jan) | tenu | tenu | menacé (deuxième campagne lourde, ≈ 30 h PI de plus) |

| | Ce qui plaide pour | Ce qui plaide contre |
|---|---|---|
| **Option 1** | Seule voie qui interroge le harnais N10-C lui-même (répond au constat 2.6 du contradicteur) ; A+ déjà décidé et outillé (≈ 19 h GPU, ≈ 8 h PI, commits `293877a`, `caba588`, `34dd433`) ; nécessite peu d'ingénierie nouvelle | Conditionnelle à A+ PASS ; B' coûte ≈ 194 h KXKM et ≈ 30 h PI pour une estimation **descriptive** (demi-largeur ≈ 0,44) ; trois brèches, non aveugle ; verrou B' entièrement à faire, gel au plus tôt S7 en même temps que la note méthodo |
| **Option 2** | Verrou le plus avancé (note, 2 tours, contradicteur, vérification, A1-A20) ; vrai test confirmatoire (k ≥ 8 : taille 0,035, puissance 0,81 à q = 0,9) ; calcul a priori léger ; cohérent avec l'ordre de passage de la spec (§5.1) et le KPI de M1 | Résultat attendu (VARIANT, 99-100 % chez Lazaridou) : faible valeur d'information ; aucun retour sur N10-C sans bras dans le harnais N10-C ; deux backends à construire, coût de calcul et d'ingénierie non chiffrés ; TBD-10/11 ouverts ; trois tests non passés |
| **Option 3** | Utilise A+ et la tuyauterie N10-D ; teste les deux questions ; la tuyauterie N10-D peut servir de contrôle positif du pipeline avant B' | Demande ≈ 30 h PI de plus que l'option 2 et une dérogation à « une seule avant M2 » ; capacité déjà dépassée (§4) ; deux campagnes lourdes successives sur KXKM d'ici M3 |

---

## 4. Surcharge S2-S7

### 4.1 Le « Report explicite » rejoué

| | h |
|---|---:|
| Capacité S3-S13 à 14 h/semaine (11 semaines, S9 tampon compris) | 154 |
| Capacité S3-S13 si S1 et S2 comptent dans les 185 h (§2.2) | ≈ 121-141 |
| Tableaux S3-S5 de RM tels qu'écrits | 42 |
| + porte A+ (absente des tableaux S3-S5) | ≈ 8 |
| Report S6-S13 restant (§2.3) | ≈ 111-117 |
| + relectures ReScience C au-delà des 2 h de S5 | ≈ 6-10 |
| + réponses aux relecteurs de #147 (v1) | ≈ 4-8 (inférence) |
| + lecture des contrôles E1-small, analyse P8c/P1bis, suites B-2 et bouba #72/#79 | ≈ 5-10 (inférence) |
| **Demande S3-S13, sans B'** | **≈ 176-195** |
| + B' (options 1 et 3) | + ≈ 30 |
| **Écart contre 154 h** | **≈ −22 à −41 (sans B') ; ≈ −52 à −71 (avec B')** |

### 4.2 Ce qui ne tient pas

- **S3-S5** : 42 h écrites + A+ ≈ 8 h + ce qui déborde de S2, sur 42 h de capacité. FOSDEM (16/11) et la v2 ReScience (fin novembre) sont dans ces semaines.
- **S6-S7** : la note méthodo (30 h avant le 15/12), les relectures ReScience C (avant la mi-décembre), le gel N10-D ou le verrou B', la note bouba v0.7.1 et son amendement tombent sur 28 h.
- **Le poste V** (50 h) doit encore couvrir le reste du verrou N10-D, bouba et NH-20, plus un verrou N10-C-bis complet si l'option 1 ou 3 est choisie (≈ 15-19 h).
- **Le poste C** (15 h) ne couvre que A+ ; un calcul B' ou N10-D complet le dépasse.

### 4.3 Scénarios de réécriture S6-S13

Échéances externes suivies : commentaire #147 (posté le 04/11, **tenu**), v2 ReScience (fin novembre visée, M3 au plus tard), FOSDEM PYVZXW (16/11), arXiv (15/12), relectures ReScience C (promises avant la mi-décembre), Néel 17/11 (échéance personnelle du plan pro, citée ici seulement parce qu'elle prend des heures en S3).

| Scénario | Contenu | Commentaire #147 | v2 ReScience | FOSDEM 16/11 | arXiv 15/12 | Relectures ReScience C | Néel 17/11 | M1 / M2 / M3 |
|---|---|---|---|---|---|---|---|---|
| **A — tenir arXiv, glisser le verrou** (règle de repli déjà écrite, spec §9 Q5) | gel N10-D ou B' en S8, calcul S8-S10 ; bouba v0.7.1 et NH-20 glissent en S10-S12 | tenu | tenue (fin novembre) | tenu | tenu | tenues | non touchée | M1 glisse à S7 ; M2 glisse (verdict mi-janvier) ; M3 tenu de justesse |
| **B — glisser arXiv** | note méthodo soumise en S11-S12 (janvier), JOTE après M3 ; S6-S7 rendus au verrou et au gel | tenu | tenue | tenu | **non tenu** (cible fixée par le PI, pas un engagement envers un tiers) | tenues | non touchée | M1 et M2 tenus ; M3 perd JOTE |
| **C — retirer un chantier** | bouba v0.7.1 (verrou 15 h, amendement 6 h, K1/K3) après M3 ; ou NH-20 (verrou 10 h, rejeu CPU) après M3 ; libère ≈ 21-25 h ou ≈ 10-12 h | tenu | tenue | tenu | tenu | tenues | non touchée | M1 tenu ; M2 réduit à « deux verrous, un calcul » ; KPI « 3 verrous » → 2 |

Les trois scénarios ne couvrent pas, à eux seuls, l'écart avec B' (−52 à −71 h). Avec B', il faut combiner deux scénarios ou réduire la réserve.

---

## 5. Tâches reportées (spec §9 et RM « Ce que le trimestre ne fait plus »)

Chaque ligne est une question ouverte : **remonter** ce trimestre, **laisser** après M3, ou **abandonner**. Le statut actuel est « reporté après M3, utile, sous verrou » sauf mention.

| Tâche | Où | Remarque factuelle | Remonter / laisser / abandonner |
|---|---|---|---|
| DR-3/H13 sur G5 | dream-of-kiki #47 (NH-25/NH-45) | devrait passer son propre verrou (CKNNA à petit n piégé ; You et al. 2609.27252) | ? |
| Test 6 → treillis Π | nerve-wml #66 | rattaché à la refonte de Paper 1 (Q2, février) | ? |
| DR-0 / DR-1 (amendement budget, sélective) | dream-of-kiki #48 | idem | ? |
| Invariants N/W (NH-46) | nerve-wml #65 | rigueur d'ingénierie, pas de verdict scientifique | ? |
| Préregs bouba v0.8-v0.9 ; dépôt L3 v0.7 | bouba_sens #23 | dépendent de v0.7.1 | ? |
| mKNN intra-cluster (rejeu) | nerve-wml #110 (plancher analytique k/(n−1)) | issue ouverte le 05/11, label `a-valider-pi` | ? |
| Claim B causal (rejeu) | nerve-wml (pas d'issue dédiée trouvée) | requalifié « accord de classifieurs ≠ canal » | ? |
| Porte baby-brain sur le taux d'apprentissage | baby-brain #288, #292, #293 | trois issues `a-valider-pi` récentes | ? |
| NH-85 RAG contre Aeon | micro-kiki #13 | reporté par le PI le 01/11 | ? |
| NH-63, NH-59, NH-60 (kiki-flow) | kiki-flow-research #30 (NH-59), #29 (NH-58) | — | ? |
| NH-28 (alphabet par le jitter) | nerve-wml #67 | — | ? |
| NH-77 (WML-JEPA) | baby-brain #286 | lot L40 AMI/JEPA lu le 04/11 | ? |
| NH-07 (RECOMBINE inter-domaines) | — | — | ? |
| R8-H1 (NcaWML) | nerve-wml #70 ; `.github` #9 (GO/NO-GO R8-lite) | GO/NO-GO daté S13 | ? |
| NH-91 comme run | dream-of-kiki #78 | reste section de la note méthodo (Q6) | ? |
| NH-01 balayage de taille N = 1000-4000 | nerve-wml #90 (brouillon) | hors listes de report ; la suite de NH-01 est la v2 ReScience | ? |

---

## 6. Questions à poser au PI (QCM)

Option la plus conservatrice en premier. Les dépendances sont indiquées.

**Bloc Q8 et N10**

1. **Q8 — quelle étude geler avant M2 ?**
   (a) Garder « les deux » jusqu'à M1 et choisir sur le verdict catégoriel A+ (S5) · (b) N10-D seul ; N10-C-bis après M3 quelle que soit l'issue d'A+ · (c) N10-C-bis B' si A+ PASS ; N10-D après M3 · (d) N10-D tuyauterie (S6-S8), puis B' si A+ PASS (dérogation à « une seule avant M2 »).
   *Commande Q2-Q6 et Q10.*
2. **Quelle branche fait foi pour le gel N10-D ?** *(si Q1 = a, b ou d)*
   (a) PR #115 seule ; la PR #100 est fermée sans fusion après report · (b) PR #100, en y reportant les commits de #115 · (c) fusionner #115 dans #100 puis une seule PR.
3. **TBD-10, divergence entre backends.** *(si Q1 = a, b ou d)*
   (a) Statut par backend, conclusion globale seulement si les deux concordent (proposition A17) · (b) JaxMARL primaire, EGG secondaire descriptif · (c) un seul backend (JaxMARL), EGG retiré.
4. **Fork EGG prévu dans l'org `ailiance` (TBD-1).** *(si Q3 ≠ c)*
   (a) Garder le fork tel que décidé le 31/10 · (b) déplacer le fork dans `hypneum-lab` · (c) dépendance épinglée par hash, sans fork.
5. **TBD-11 (budget du pilote, encodage, règle d'action ; n_eval = 500 déjà décidé).** *(si Q1 = a, b ou d)*
   (a) Laisser l'agent proposer les valeurs, validation par le PI au gel · (b) le PI fixe le budget du pilote maintenant · (c) pilote réduit à un seul backend d'abord.
6. **Go de la porte A+ (graines et critère, hypothèses de travail).** *(indépendante de Q1 ; A+ est déjà décidée)*
   (a) Confirmer 9104, 9105, 9106 et G2 inchangé (D̄ ≥ 0,20) · (b) trois graines neuves (9106-9108), sans 9104/9105 regardées en `registered` · (c) suspendre A+ si Q1 = b.

**Bloc analyses et calendrier des machines**

7. **Tag d'analyse N10-C run 2.**
   (a) Pas de tag d'analyse : closure #109 et rapport descriptif #63 suffisent ; KPI « verdicts rendus » ajusté · (b) tag posé sur le rapport descriptif #63 (≈ 15 nov) · (c) tag posé maintenant sur la closure #109.
8. **Contrôles E1-small (PR #92).**
   (a) Relire et fusionner #92 après la fin des contrôles (≈ 08/11), lecture exploratoire en S3 · (b) fusionner #92 maintenant (trace de lancement), lecture en S4 · (c) reporter la lecture après M1.
9. **P1bis/P8c, gelés le 04/11 sans note de lecture ni contradicteur visibles, en cours sur le CPU de KXKM.**
   (a) Laisser tourner ; déclarer par ADR une exception datée au principe 6, comme pour les campagnes déjà gelées · (b) laisser tourner ; verdict rapporté avec la mention « verrou non passé » · (c) arrêter P8c (fichier STOP) et soumettre P1bis/P8c au verrou.
10. **Créneau KXKM après les contrôles E1-small.** *(dépend de Q1 et Q9)*
    (a) A+ d'abord, puis N10-D ou B' selon Q1 ; P8c reste sur CPU · (b) A+ d'abord, P8c mis en pause pendant A+ · (c) attendre la fin de P8c avant A+.

**Bloc heures et surcharge**

11. **Les 185 h incluent-elles S1 ?**
    (a) Oui ; S1 et S2 comptés selon l'estimation git (§2.2), écart affiché · (b) non ; les 185 h partent de S2 · (c) non ; elles partent de S3, S1-S2 notées hors budget.
12. **Mesure des heures à partir de S3.**
    (a) Feuille de temps hebdomadaire minimale (poste et heures, saisie le lundi) · (b) estimation git mensuelle comme ici · (c) rien avant le bilan de novembre.
13. **Scénario de réécriture S6-S13.** *(dépend de Q1 : avec B', il faudra en combiner deux)*
    (a) A — tenir arXiv, glisser le verrou et le calcul (règle de repli déjà écrite) · (b) C — retirer un chantier · (c) B — glisser arXiv en janvier · (d) combinaison A + C.
14. **Si Q13 = b ou d : quel chantier retirer ?**
    (a) bouba v0.7.1 (verrou, amendement, K1/K3) après M3 · (b) NH-20 après M3 · (c) les deux.
15. **Relectures ReScience C (promises avant la mi-décembre, 8-12 h).**
    (a) S5 et S6, prises sur la réserve · (b) S6 et S7 · (c) une en S5, une en S8 (au-delà de la mi-décembre, à renégocier avec l'éditeur).
16. **Jalon M0 (8 nov) : PR de corrections publiques kiki-flow-research #64 et `.github` #26, en brouillon.**
    (a) Relire et fusionner les deux avant le 8/11 ; corriger la ligne M0 de RM · (b) fusionner en S3 et dater M0 à la fusion · (c) les fusionner avec la v2 ReScience.

**Bloc tâches reportées**

17. **Remonter une tâche reportée ce trimestre (§5) ?** *(dépend de Q13 : sans heures libérées, toute remontée creuse l'écart)*
    (a) Aucune ; toutes restent après M3 sous verrou · (b) en remonter une, sous verrou (préciser laquelle) · (c) en abandonner une ou plusieurs (préciser lesquelles).

Ordre de passage suggéré par les dépendances : Q1 → Q2-Q6 → Q9-Q10 → Q11-Q13 → Q14-Q15 → Q7, Q8, Q16 (indépendantes) → Q17.

---

## 7. Annexe : PR et issues ouvertes par dépôt

Une ligne par objet ; « bloque » dit ce qui retient la fusion ou la clôture, d'après la PR ou l'issue. `[b]` = brouillon ; `[PI]` = label `a-valider-pi`.

**nerve-wml**
- PR #115 [b] amendement N10-D A1-A20 — bloque : verrou non passé, TBD-10/11, section « Pilot read-out » à écrire, choix de branche (Q2).
- PR #114 [b] plan N10-C-bis 3 graines, runbook A+, code — bloque : go PI daté (Q6), amendement daté de G2, Q1.
- PR #100 [b] squelette N10-D L0 — bloque : doublon avec #115 (Q2).
- PR #90 [b] balayage NH-01 N = 1000-4000 — bloque : hors trimestre ; verrou.
- Issue #110 [PI] mKNN, plancher analytique k/(n−1) — décision PI (rejeu reporté).
- Issue #85 [PI] seuil `test_w2_hard` sous Python 3.14 — décision technique.
- Issue #83 [PI] installation Linux CPU (torch cu130) — décision technique.
- Issue #75 [PI] `tests/golden/README.md` — documentation.
- Issue #74 [PI] `CITATION.cff` résumé périmé — retrait textuel.
- Issue #70 [PI] R8-H1 NcaWML — reporté après M3.
- Issue #69 [PI] NH-34 nerf ERROR-only — hors trimestre.
- Issue #67 [PI] NH-28 jitter — reporté après M3.
- Issue #66 [PI] test 6 → treillis Π — reporté après M3.
- Issue #65 [PI] NH-46 invariants — reporté après M3.
- Issue #63 [PI] rapport descriptif N10-C (≈ 15 nov) — à rédiger ; lié à Q7.
- Issue #62 [PI] N10-C-bis « geler après verrou » — Q1.

**dream-of-kiki**
- PR #92 [b] addendum de contrôle E1-small — bloque : contrôles en cours sur KXKM (Q8).
- PR #89 [b] réserve sur la réplication NH-01 dans Paper 1 (B21) — bloque : relecture PI.
- PR #68 [b] préreg OSF E1-small 4B — bloque : campagne déjà gelée par ailleurs ; sort à décider.
- PR #41 [b] trois préregs d'octobre — bloque : antérieures au verrou ; sort à décider.
- Issues [PI] #78 (NH-91 évaluation différée), #67 (R1 Nightly inactif), #66 (CI `check_status_truth.py`), #65 (`dream-harness`), #63 (CONTRIBUTORS, politique IA), #62 (traduction FR), #49 (NH-20 splitting), #48 (amendement DR-0), #47 (RCI pour DR-3).

**bouba_sens**
- PR #78 [b] sonde B-2 stratifiée (amendement) et alignement du texte — bloque : relecture PI ; issue #77.
- PR #66 [b] nul B-3 au niveau réseau (ADR-0028) — bloque : révision demandée (Opus et Codex BLOQUANT, 31/10).
- PR #9 [b] préregs d'octobre — bloque : antérieures au verrou.
- Issues [PI] #79 (`_build_force` colonnes physio phase 1), #77 (sonde contiguë à une seule classe), #74 (physio phase 1 lue en 3 colonnes à 500 Hz ; correctif #75 fusionné, issue encore ouverte), #72 (en-tête physio mal lu ; correctif en cours), #45 (données `sf_phase2_adapted` perdues), #29 (tests de propriété Me6), #24 (nul B-1/B-2 en TOST), #23 (préreg v0.7, dépôt L3).

**kiki-flow-research**
- PR #64 [b] bannière « superseded » et `CITATION.cff` — bloque : relecture PI ; jalon M0 (Q16).
- Issues [PI] #44 (workflow `reproducibility.yml` inactif), #43 (11 tests MLX sous mlx-cpu), #42 (installation Linux depuis le lock), #32 (`MultiscaleLoop.run`), #30 (NH-59), #29 (NH-58).

**micro-kiki**
- PR #19 [b] réplications NH-81 KXKM et M3 Pro — bloque : NH-81 clos par erratum (Q7 du 01/11) ; sort de la PR à décider.
- Issues [PI] #17 (routeur mpnet V4 ou README), #13 (NH-85 RAG contre Aeon, reporté), #11 (borne C5 invalide).

**baby-brain**
- Aucune PR ouverte.
- Issues [PI] #293 (contrôle E0), #292 (contrôle ridge et arrêt précoce E4), #288 (critère LP multi-échelles), #287 (NH-87 bras chronologique), #286 (NH-77 WML-JEPA, reporté).

**.github**
- PR #27 veille du 06/11 — bloque : relecture PI.
- PR #26 [b] profil sans chiffres micro-kiki retirés — bloque : relecture PI ; jalon M0 (Q16).
- PR #22 veille du groupe de Rome (01/11) — bloque : relecture PI ; formulation « infirme partiellement » à corriger selon l'addendum du 04/11.
- Issues [PI] #10 (bilan mensuel des KPI), #9 (GO/NO-GO R8-lite), #8 (GO/NO-GO axe matière), #7 (note méthodo), #6 (coordination bouba, B-3), #5 (lot e-Soleau et Zenodo restreint).

**rescience-nh01**
- PR #8 [b] v2 « self-coupling convention » — bloque : accord PI et éditeur sur le mode de soumission (« do not merge »).
- PR #5 lien vers l'issue de soumission #147 — bloque : relecture PI.
- Aucune issue `a-valider-pi`.

**paper-methodo-2026**
- PR #3 [b] passages NH-01 alignés sur B21 — bloque : relecture PI ; rédaction de la section NH-01.
- Aucune issue `a-valider-pi`.

**library** (dépôt privé)
- Aucune PR ouverte ; aucune issue `a-valider-pi`.
