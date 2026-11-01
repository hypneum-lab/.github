# Verrou de lecture et plan du trimestre — conception (2026-11-01)

Statut : v1 soumise au PI le 01/11 21:05 après relecture bâtisseur (agent à contexte vierge, 8 questions, traitées au §9). Auteur : session electron-94 (Claude Fable 5.1), à partir du brainstorming avec le PI du 01/11 20:43-20:55 CET, de l'analyse profonde du 01/11 (PR hypneum-lab/.github #23) et de ses trois veilles (`docs/research/2026-11-01-analyse-profonde/veille/`). Remplace, pour les semaines S3 à S13, les tableaux de phases de `docs/ROADMAP.md` v1 (25/10).

## 1. Intention et pourquoi

Le labo lance ses calculs avant d'avoir lu. Le PI l'a nommé comme la dérive principale : « trop vite des calculs et pas assez de lecture scientifique ». L'analyse du 01/11 le mesure : onze thèses, chacune devancée au moins en partie par un travail antérieur vérifié ; 21 papiers du groupe de Rome 2024-2026, aucun cité dans un `.tex` ; 77 références sur 332 avec un défaut, écrites depuis des résumés de veille ; Plakhov-Semenov 1992, le papier qui fixe la limite projecteur du noyau de rêve, absent de toutes les veilles et arrivé de seconde main.

Verdict campagne par campagne, posé par la session et accepté par le PI : NH-81 et M5 n'auraient pas dû partir (R ≤ 1 par construction ; hypothèses du théorème 3.16 de Carlier 2017 non remplies à ε = 0,01, h = 0,05) ; NH-03 et N10-C auraient dû repartir avec un autre dessin (déclencheurs adaptatifs déjà publiés : SIESTA 2023, SleepGate ; information mutuelle élevée sans preuve d'usage du canal : Lowe 2019) ; E1-small est à recadrer en réplication (Deperrois et Singh 2022) ; NH-01 était la bonne campagne mais la convention de diagonale (Fachechi 2019, Plakhov-Semenov 1992) devait être lue avant le gel.

Ce document fixe deux choses : un **verrou de lecture** qui conditionne tout gel de préenregistrement, et la **répartition des 185 h** du trimestre (décision PI du 01/11, scénario ambitieux) autour de ce verrou.

## 2. Buts, non-buts, anti-buts

**Buts.**
- Aucune campagne lourde ne part sans une note de lecture complète, contredite par un tiers et vérifiée par plusieurs tours de veille.
- Les hypothèses du catalogue sont requalifiées à partir de la littérature lue : réplication, question ouverte restante, ou abandon.
- Le calcul tombe à ≈ 8 % du trimestre, la lecture monte à ≈ 27 %, l'écriture et les corrections décidées le 01/11 prennent ≈ 43 %.

**Non-buts.**
- Pas de nouvel axe, pas de nouveau dépôt, pas de nouvelle hypothèse hors catalogue.
- Pas de réécriture de la roadmap au-delà de M3 (24 janvier 2027) : les quinzaines Q1-Q7 et les trimestres T3-T4 restent tels quels, à relire à M3.
- Le verrou ne remplace ni le gel L1-L3 ni les nuls calibrés (hypneum-prereg, hypneum-nulls) : il s'insère avant.

**Anti-buts** (ce qui ferait de ce plan un échec même s'il est exécuté).
- Une veille qui part elle-même dans tous les sens : tours sans condition d'arrêt, listes de papiers non lus.
- Un verrou passé « pour la forme » : note écrite après le gel, tiers qui relit sans chercher à contredire, tours de veille sur la même source.
- Un trimestre où la note méthodo, la v2 ReScience et les corrections publiques glissent parce que le verrou a tout absorbé.

## 3. Contraintes

- **Temps** : 185 h sur 13 semaines (S1 = 26 oct → S13 = 24 jan), soit ≈ 14 h par semaine. Le plan pro 3 ans fixe un plafond de 10 h ; le PI a choisi 185 h en connaissance de cause. Le document le note ; la réconciliation appartient au PI.
- **Machines** : KXKM occupé par E1-small (1 227/1 410 cellules au 01/11 18:10) puis libre ; macM1 occupé par N10-C run 2 jusqu'au ≈ 02/11 02:00, puis par le second cerveau (RAM serrée, swap plein) ; electron-server CPU sans AVX ; Studio éteint ; GrosMac jamais. Une seule campagne lourde à la fois.
- **Campagnes en cours** : E1-small, N10-C run 2 et Me6 ne reçoivent aucun verdict et ne sont pas touchées (hypneum-campaign). Leur analyse suit leur préreg.
- **Échéances externes** : ReScience #147 (commentaire 02/11, deux relecteurs attendus depuis le 01/11 09:52 UTC, v2 avant fin novembre) ; FOSDEM PYVZXW à corriger avant le 16/11 ; note méthodo sur arXiv avant le 15/12, JOTE en janvier.
- **Dépôts** : Hypneum reste sur GitHub ; commits en anglais, sujet ≤ 50 caractères, pas d'attribution IA ; les décisions de ce document sont des ADR ou des amendements datés, jamais des modifications silencieuses de préregs.

## 4. Le verrou de lecture (décidé)

### 4.1 Les trois temps

1. **Note de lecture** (1 à 2 pages, dans le dépôt de la campagne, à côté de la préreg). Elle contient : les sources primaires lues en entier, avec identifiant résolu par API ; ce qui est déjà publié, phrase par phrase ; la seule question qui reste ouverte ; le dessin minimal qui la tranche. Aucun résumé de veille n'y tient lieu de source.
2. **Contradicteur**. Un tiers (modèle ou humain) reçoit les dépôts, les veilles et les canaux de recherche, mais pas la note ni les conclusions du labo, et cherche le papier, la thèse ou le code qui rend la question inutile ou déjà tranchée. Son rapport est archivé avec la note. La passe aveugle Codex du 01/11 est le modèle du dispositif.
3. **Tours de veille**. Plusieurs tours, datés et consignés, chacun sur des sources différentes du précédent ; la note est amendée entre deux tours.

### 4.2 Condition d'arrêt : trois tests, pas un compte

Le PI a demandé « être sûr de ne rien oublier, d'avoir toutes les informations et les recoupements ». Le gel est permis quand les trois tests passent et que le contradicteur a échoué.

| Test | Ce qu'il vérifie | Comment on le constate |
|---|---|---|
| Saturation | Le tour de citations amont et aval (Crossref, Semantic Scholar, OpenAlex) à partir des sources primaires n'apporte plus aucun papier pertinent | Un tour complet sans nouvelle entrée retenue dans la note |
| Recoupement | Chaque phrase « déjà publié » ou « reste ouvert » tient par au moins deux sources de nature différente (article et code, article et thèse, preprint et version revue) | Phrase à une seule source = marquée « à recouper », non gelable |
| Couverture | Les six canaux ont été interrogés au moins une fois : arXiv, OpenReview, bioRxiv, journaux via Crossref, thèses et HAL, code et données (GitHub, Hugging Face, Zenodo, OSF) | Journal des requêtes dans la note, avec date et compte brut → gardé |

Règles de forme reprises de hypneum-veille : aucun identifiant cité de mémoire, 3 s entre appels arXiv, Semantic Scholar en lot, « [résumé moteur] » pour ce qui n'a pas été lu.

### 4.3 Portée

Le verrou s'applique à toute campagne lourde (GPU, ou > 6 h CPU, ou > 1 semaine calendaire) et à toute préreg L3. Un pilote CPU court en est exempt, mais ne peut pas être cité comme résultat. Les campagnes déjà gelées (E1-small, N10-C run 2, Me6, GB300 g7) ne sont pas re-soumises ; leur analyse mentionne les antériorités trouvées depuis. État vérifié le 01/11 21:00 : **N10-C-bis n'est pas gelée** (issue nerve-wml #62 « Geler N10-C-bis » ouverte ; seul le créneau GB300 porte un tag `n10c-bis-g7-gb300-freeze-20261031`) et **N10-D (PR nerve-wml #100) est un squelette L0 en brouillon** : toutes deux passent le verrou.

## 5. Ordre des chantiers et répartition des heures (décidé)

### 5.1 Qui passe le verrou en premier

1. **N10-D** (nerve-wml), cas d'école. Concurrent nommé : soumission ICLR 2027 `hukTsKYu8Y` (test causal d'usage du canal). Lectures imposées : Lowe 2019 (1903.05168), DVNC, IC3Net, CommFormer, You et al. 2609.27252, Rome 2610.08612 (RBM modulaire), 2609.32605 (Test 12). Corrections déjà décidées : sym hors de H1, nul tenant compte de la covariance de graine, 3 graines appariées ou abandon de N10-C-bis au profit de N10-D (décision PI Q8). Le bras « usage causal du canal » est la question ouverte attendue ; la note peut conclure autrement.
2. **bouba_sens v0.7.1** avant K1/K3 Me6. Littérature humaine contradictoire (Sourav 2019 contre Piller 2023 ; Ćwiek 2022 : 72 %, pas ≥ 95 %) : le test de recoupement a ici le plus de valeur. Corrections déjà décidées (Q9) : k_steps passé par les grilles, porte de manipulation, H0 sur les résidus d'interaction, contrôle 2 de #66 refait. Kleinman-Achille-Soatto 2210.04643 à lire en entier.
3. **NH-20** Lie O(τ) contre Strang O(τ²). Lecture mathématique sans tiers obligatoire : Gallouët-Monsaingeon 1602.04457, Carlier 2017 (théorème 3.16 et ses hypothèses), Hernandez 2501.14660, Caucheteux-Bonet-Korba 2605.31369. Le premier essai (M12 : ordre non identifiable, exposants −0,72 et −0,03) est déclaré dans la note.

### 5.2 Les 185 h

| Poste | Heures | Contenu | Semaines |
|---|---|---|---|
| Écriture et corrections décidées le 01/11 | 80 | commentaire #147 puis v2 avec tableau diagonale aux deux bases (1,90 et 3,05) et Fig. 10 (18) ; note méthodo cs.DL + stat.ME, NH-01 réécrit, 7 tags, C8, Vaccaro et Thomas (45) ; FOSDEM (1) ; NH-03 en section (4) ; deux PR de corrections publiques + note Zenodo (3) ; citations #87 dans la `.tex` et Paper 2 (3) ; amendement bouba v0.7.1 (6) | S1-S7 |
| Verrou de lecture | 50 | N10-D (25), bouba (15), NH-20 (10) : notes, contradicteur, tours de veille | S2-S9 |
| Analyse des runs en cours | 10 | N10-C run 2 (analyse appariée par graine, tag d'analyse), E1-small après sa fin, Me6 selon sa préreg ; aucun nouveau calcul | S2-S6 |
| Calcul | 15 | N10-D sur KXKM, seulement si le verrou passe ; K1/K3 bouba sur electron-server ; NH-20 CPU | S6-S10 |
| Retraits textuels décidés par la lecture (PI, 01/11 21:00) | 10 | retirer λ̂ = 67,8 et la référence au Thm 3.4 (kiki-flow), « +7 pp » et la table des latences (micro-kiki), rapport d'errata et non-tests dans `main.tex` de bouba, bannières ; **aucun rejeu** (mKNN intra-cluster, Claim B causal, porte baby-brain sur le taux d'apprentissage) : issues reportées après M3, sous verrou | S2-S6 |
| Réserve | 20 | relecteurs ReScience, réponses éditeur, imprévus | — |

### 5.3 Ce que le trimestre ne fait plus

Retirés de la phase 2 (S6-S10) de la roadmap v1, à reprendre après M3 et seulement sous verrou : NH-63, NH-59, NH-60 (kiki-flow), NH-28 (jitter), NH-77 (WML-JEPA), NH-07 (RECOMBINE inter-domaines), R8-H1 (NcaWML), NH-03 comme run (reste comme section de la note), NH-85 (RAG contre Aeon ; reporté, décision PI du 01/11 21:00 : le routage de LoRA est saturé et Aeon est d'Arslan). NH-81 est clos par erratum (Q7), pas de run KXKM le 04/11. NH-01 est fait ; sa suite est la v2 ReScience, pas un nouveau run.

## 6. Hypothèses requalifiées par la lecture (décidé au niveau du verdict, détail au bâtisseur)

| Dépôt | Hypothèse ou affirmation | Statut avant | Statut après lecture | Source qui tranche |
|---|---|---|---|---|
| dream-of-kiki | `recombine` = séparation de mélanges | découverte | réplication inter-substrats ; GENIAL = axiomatisation | Agliari 2012 PRL ; Rome 2609.32605 |
| dream-of-kiki | H14-A/B/C (E1-small) | confirmatoires | exploratoires (déclaré le 30/10) ; réplication de l'ordre des phases | Deperrois 2022, Singh 2022 ; amendement 30/10 |
| dream-of-kiki | DR-2 théorème ; DR-4 ordre en espérance | théorèmes | propriété sous précondition ; garantie d'espace de recherche | B1, C3 du rapport |
| dream-of-kiki | NH-91 (ex-NH-03, renumérotée le 01/11 21:50 : collision avec le NH-03 du 24/10) « quand dormir » | hypothèse à tester | politiques de déclenchement comparées à budget égal ; section de la note, pas de run ce trimestre | SIESTA 2303.10725 ; SleepGate ; SHARP 2606.00732 |
| nerve-wml | Claim B (MI/H 0,91-0,96, codes « post-VQ ») | résultat | accord de classifieurs ≠ canal ; à refaire avec test causal | B3 ; Lowe 1903.05168 ; `hukTsKYu8Y` |
| nerve-wml | mKNN 18,8× le nul | résultat | excès ≈ 2,5-3× sous nul intra-cluster (agent seul, à refaire) | B4 |
| nerve-wml | canal PSK γ/θ (Test 12) | neuf | neuf mais recouvert en partie par 2609.32605 ; association π→γ, ε→θ inverse de Bastos | M5, M7 |
| nerve-wml | N10-D | préreg PR #100 | passe le verrou en premier ; sym hors de H1, covariance de graine, bras causal attendu | §5.1 |
| kiki-flow | λ̂ = 67,8 « régime du Thm 3.4 » | résultat | artefact de grille plausible ; retirer | B7 |
| kiki-flow | E1b retrouve ε/(2τ) | « recovered » | REFUTED ; convention de noyau à fixer avant re-préreg | B8 |
| kiki-flow | M5 certification | échec mécanique (30/10) | échec de fond du critère γ ≤ 30 ; publiable en note numérique | E2, M15 |
| kiki-flow | NH-20 Lie contre Strang | hypothèse | seule contribution neuve de la ligne ; ordre non identifiable au premier essai | M12 ; Gallouët-Monsaingeon 2016 |
| micro-kiki | routage LoRA 46,4 %, « +7 pp » | résultats | rapport technique ; A/B nul (−0,0102) ; routage saturé dans la littérature | M16, M18 ; Arrow, PHATGOOSE, 2609.03150 |
| micro-kiki | borne C5 Holevo | borne | DPI I ≤ H(Y) seulement | B13 ; Banchi 2102.08991 |
| micro-kiki | NH-81 J/token | négatif « vendable » | R ≤ 1 par construction ; clos par erratum | M21, E12 |
| bouba_sens | « invariant architectural », « no lesion effect » | résultats | non-tests (lésion arrêtée à 19 dB) ; rapport d'errata | B15, B16 |
| bouba_sens | v0.7 ActionSense | gelée | v0.7.1 à taguer après verrou ; privation précoce/tardive déjà publiée | B17 ; Kleinman-Achille-Soatto 2210.04643 |
| baby-brain | Claim A (portes par stade) | hypothèse | placebo sous AdamW ; porte sur le taux d'apprentissage avant tout run ; NH-77 reporté | B18, B19, B20 ; BabyCL 2606.05115 |
| rescience-nh01 | C1 = 3,86 | résultat | 1,90 avec base de Hebb avec diagonale, 3,05 [2,99 ; 3,10] avec base standard ; à déclarer à l'éditeur, v2 | B21 ; Plakhov-Semenov 1992 ; Benedetti 2201.00032 |
| paper-methodo | « bit-exact replication » | affirmation | reproduction interne ; NH-01 comme erreur trouvée après gel ; cs.DL | B22, C8 ; Vaccaro 2606.11217, Thomas 2606.27687 |

## 7. Modifications de la roadmap (décidé au niveau des jalons)

- **M0 Vérité (8 nov)** inchangé dans l'esprit ; contenu : commentaire #147 (02/11), deux PR de corrections publiques, citations #87 dans la `.tex`, analyse N10-C run 2, début de la note de lecture N10-D.
- **M1 (29 nov)** devient « Verrou passé pour N10-D » : note, rapport du contradicteur, trois tests, décision bis ou N10-D. FOSDEM corrigé (16/11). Note méthodo en brouillon complet.
- **M2 (3 jan)** devient « Trois verrous, un calcul » : N10-D lancé sur KXKM si le verrou passe (au plus tôt S6), bouba v0.7.1 taguée et K1/K3 lancés sur electron-server, NH-20 rejoué sous sa note ; note méthodo sur arXiv avant le 15/12.
- **M3 (24 jan)** inchangé : v2 ReScience soumise (fin novembre visée, M3 au plus tard), JOTE, GO/NO-GO axe matière sur NH-01 et la lecture seule (NH-59/60 reportés), bilan des heures, roadmap v2.
- Le tableau « Dépendances et calendrier des machines » est à refaire : KXKM = E1-small puis libre jusqu'au verrou N10-D ; macM1 = N10-C puis second cerveau ; aucune case GPU avant S6.
- Principe 6 à ajouter aux principes de la roadmap : « Lire avant de geler : aucun tag de gel sans note de lecture, contradicteur et trois tests passés ».
- **Point de reprise « roadmap v2 »** (demande du PI, 01/11 21:00 : « après les relectures et analyses, on va devoir refaire la roadmap et les plans ») : les semaines S2-S5 sont écrites en détail ; S6-S13 restent provisoires et sont réécrites en une séance d'arbitrage quand trois choses sont connues : l'analyse de N10-C run 2 (tag d'analyse), la fin d'E1-small et le rapport du contradicteur N10-D. Ce point est daté au plus tôt S5 (fin novembre) et devient un livrable de M1.

## 8. Ce qui est laissé au bâtisseur

- Le gabarit de la note de lecture (fichier `docs/prereg/<campagne>/reading-note.md` ou équivalent par dépôt), le journal des tours de veille et le gabarit du brief du contradicteur ; s'appuyer sur `brief-commun.md` et `codex/brief-blind.md` de l'analyse du 01/11.
- Le script de remontée de citations (Crossref, Semantic Scholar en lot via `scripts/s2.py`, OpenAlex) et son format de sortie.
- La réécriture des tableaux S3-S13 de `docs/ROADMAP.md`, du calendrier des machines et des indicateurs (« verdicts rendus » devient « verrous passés » + « verdicts rendus »), avec version 2 et date.
- La mise à jour du catalogue d'hypothèses (statuts du §6) et des issues GitHub Project « Hypneum — Programme 2026-27 » (fermer NH-81 ; reporter les hypothèses du §5.3 ; créer les issues « note de lecture » et « contradicteur » pour N10-D, bouba, NH-20).
- Les pages Outline « Roadmap 2026-27 » et « Gestion de projet » à aligner.
- Le choix du contradicteur par campagne (Codex gpt-6.1-sol en aveugle par défaut ; Claude Opus à contexte vierge en secours quand le quota manque, comme le 01/11).

## 9. Relecture bâtisseur du 01/11 et réponses

Huit questions ; quatre tranchées par le PI (QCM 21:00), deux vérifiées, quatre réglées par la session comme ses propres choix.

| # | Question du relecteur | Réponse | Qui |
|---|---|---|---|
| 1 | Sort des tâches S3-S5 de la roadmap v1 (DR-3/H13 sur G5, test 6 → treillis Π, DR-0/DR-1, invariants N/W, préregs bouba v0.8-0.9, OSF) | Le PI demande « toujours utile ? ». Réponse de la session : utiles mais aucune n'est urgente une fois la littérature lue. H13 reste le plus utile (sonde DR-3), mais la veille montre que CKNNA à petit n est piégé (2602.14486, 2604.18572) et que You et al. 2609.27252 pose la question structure contre géométrie : H13 doit passer le verrou, ce serait un quatrième. Test 6, DR-0/DR-1 appartiennent à la refonte de Paper 1 (Q2, février). Invariants N/W = rigueur d'ingénierie, pas un verdict scientifique. Préregs v0.8-0.9 dépendent de v0.7.1. **Choix de la session : toutes reportées après M3 avec le statut « utile, sous verrou » dans le catalogue ; seul v0.7.1 reste.** Le PI peut en remonter une au point de reprise roadmap v2. | session (à vérifier par le PI) |
| 2 | N10-C-bis gelée ou non | Non gelée (issue #62 ouverte, pas de tag `n10c-bis-freeze-*`) ; sous verrou, KXKM libre après E1-small jusqu'au verrou N10-D ; l'issue #62 est reformulée « geler après verrou » | vérifié |
| 3 | Corrections dans les dépôts : enveloppe | Retraits textuels ce trimestre (10 h pris sur la réserve), rejeux après M3 sous verrou | PI |
| 4 | Vocabulaire du catalogue | Ajouter une colonne « requalification après lecture » à côté des 9 verdicts, sans les modifier ; correspondance : réplication → amendé, exploratoire → en attente, non-test et artefact plausible → non concluant, rapport technique → amendé. Fichier qui fait foi : une **v2 datée** dans `docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` ; la table du 24/10 n'est pas modifiée. Le champ Statut du GitHub Project garde ses valeurs ; le KPI devient « verrous passés » et « verdicts rendus » | session |
| 5 | Si S2-S5 déborde, qu'est-ce qui glisse | Le PI répond que la roadmap sera refaite après les relectures et analyses (→ §7, point de reprise). D'ici là, choix de la session : les échéances externes tiennent (commentaire #147, v2 ReScience, FOSDEM, arXiv 15/12) et c'est le verrou N10-D qui glisse (M1 → S7 au plus tard, calcul au plus tôt S8) | session |
| 6 | Principes 3 et 5, KPI « 10 h » | Principe 3 réécrit « pas de nouveau **gel** tant que la précédente campagne n'a pas rendu son verdict ; la lecture n'est pas un gel ». Principe 5 et le KPI gardent 10 h comme règle ; les 185 h du trimestre sont écrites comme exception datée (décision PI 01/11), mesurée chaque mois | session |
| 7 | Sources de l'analyse absentes du clone | Le bâtisseur part de la branche `docs/analyse-profonde-2026-11-01` (PR #23) ; la fusion de #23 avant ou après est au choix du PI, les gabarits y renvoient par chemin relatif | session |
| 8 | Mécanique des issues | Créations via le manifeste + `setup-project.sh` (idempotent) ; fermetures et reports en direct avec `gh` depuis electron-server (MCP GitHub en échec) ; report = jalon « Après M3 » + étiquette `sous-verrou` ; les issues « note de lecture » et « contradicteur » vont dans le dépôt de la campagne (nerve-wml, bouba_sens, kiki-flow-research), avec un renvoi dans `.github` | session |
| 9 | NH-85 | Reporté après M3 | PI |
| 10 | N10-D déjà gelée ? | Non (PR #100 brouillon L0) ; passe le verrou en premier, comme prévu | vérifié |
