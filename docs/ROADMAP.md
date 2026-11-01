# Hypneum Lab — Roadmap 2026-11 → 2027-10

Version 2 du 1er novembre 2026 (remplace la version 1 du 25 octobre pour les semaines S2 à S13). Chercheur : Clément Saillant (indépendant). Sources : conception « Verrou de lecture et plan du trimestre » (`docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md`, ci-après **spec**) ; analyse profonde du 01/11 (PR hypneum-lab/.github #23, `docs/research/2026-11-01-analyse-profonde/README.md`, ci-après **rapport**) ; décisions du PI du 01/11 (QCM 20:15-20:30 et 21:00 CET). Suivi : GitHub Projects « Hypneum — Programme 2026-27 » + ce fichier + page Outline.

Ce qui change par rapport à la v1 : un **verrou de lecture** conditionne désormais tout gel (spec §4) ; la phase « Dix hypothèses » disparaît ; le trimestre se répartit en 185 h décidées par le PI (rapport:303) autour de ce verrou, des corrections et de l'écriture (spec:74-79). Les semaines S2 à S5 sont écrites en détail ; S6 à S13 sont **provisoires** et seront réécrites au point de reprise « roadmap v2 » (spec:118).

## Principes

1. **Vérité avant nouveauté.** On ne lance rien de neuf tant qu'un chiffre faux reste dans un README, un papier ou un fichier Zenodo.
2. **Falsifiable avant testé.** Une hypothèse entre en phase de test seulement si elle a un nul calibré, un critère de réfutation écrit et un verdict informatif en cas de négatif.
3. **Une campagne, un verdict.** Pas de nouveau **gel** tant que la précédente campagne n'a pas rendu son verdict ; la lecture n'est pas un gel (spec:140). Exception inchangée : un addendum de contrôle sur une campagne en cours.
4. **Le calcul suit les machines.** Une seule campagne lourde à la fois. Aucune nouvelle campagne GPU avant S6. CPU léger sur electron-server, CPU lourd sur KXKM en `nice 19`, jamais sur GrosMac.
5. **Dix heures par semaine, sauf exception datée.** La règle reste 10 h par semaine : deux soirées (arbitrage lundi, écriture jeudi) et un demi-week-end. Le trimestre S1-S13 est une **exception datée** : 185 h (≈ 14 h par semaine), décidée par le PI le 01/11 (rapport:303), mesurée chaque mois et comparée à la règle. La réconciliation avec le plafond de 10 h du plan pro 3 ans appartient au PI (spec:32). Les agents rédigent et exécutent ; le chercheur décide, lance, valide, signe.
6. **Lire avant de geler.** Aucun tag de gel sans note de lecture, contradicteur et trois tests passés (saturation, recoupement, couverture ; spec §4.2). Le verrou s'applique à toute campagne lourde (GPU, ou > 6 h CPU, ou > 1 semaine calendaire) et à toute préreg L3. Les campagnes déjà gelées (E1-small, N10-C run 2, Me6, GB300 g7) ne sont pas re-soumises.

## Le verrou de lecture en une page

| Temps | Contenu | Où |
|---|---|---|
| 1. Note de lecture | sources primaires lues en entier (identifiant résolu par API) ; déjà publié, phrase par phrase ; la seule question qui reste ouverte ; le dessin minimal qui la tranche | dépôt de la campagne, à côté de la préreg |
| 2. Contradicteur | un tiers (Codex en aveugle par défaut, Claude à contexte vierge en secours) reçoit dépôts, veilles et canaux, **pas** la note ni les conclusions du labo, et cherche ce qui rend la question inutile ou déjà tranchée | rapport archivé avec la note |
| 3. Tours de veille | plusieurs tours datés, chacun sur des sources différentes du précédent ; la note est amendée entre deux tours | journal de veille du dépôt |

Ordre de passage (spec §5.1) : **N10-D** (nerve-wml) d'abord, puis **bouba_sens v0.7.1** avant K1/K3 Me6, puis **NH-20** Lie contre Strang (lecture mathématique, sans contradicteur obligatoire). N10-C-bis n'est **pas gelée** (issue nerve-wml #62 ouverte, aucun tag `n10c-bis-freeze-*` ; spec:136) : elle passe aussi le verrou, et l'issue #62 est reformulée « geler après verrou ».

## Jalons du trimestre

| Jalon | Date | Contenu (spec §7) |
|---|---|---|
| **M0 Vérité** | 8 nov 2026 | commentaire ReScience #147 (02/11) ; deux PR de corrections publiques (`.github`, kiki-flow-research) + note « superseded » Zenodo par le PI ; citations #87 portées dans la `.tex` et Paper 2 ; analyse de N10-C run 2 ; début de la note de lecture N10-D |
| **M1 Verrou passé pour N10-D** | 29 nov 2026 | note, rapport du contradicteur, trois tests, décision N10-C-bis (3 graines appariées) ou N10-D corrigé (décision PI Q8, rapport:290-304) ; FOSDEM corrigé (16/11) ; note méthodo en brouillon complet ; **point de reprise « roadmap v2 »** (livrable de M1, voir plus bas) |
| **M2 Trois verrous, un calcul** | 3 jan 2027 | N10-D lancé sur KXKM si le verrou passe (au plus tôt S6) ; bouba v0.7.1 taguée et K1/K3 lancés sur electron-server ; NH-20 rejoué sous sa note ; note méthodo sur arXiv avant le 15/12 |
| **M3** | 24 jan 2027 | v2 ReScience soumise (fin novembre visée, M3 au plus tard) ; JOTE ; GO/NO-GO axe matière sur NH-01 et la lecture seule (pilotes kiki-flow reportés, voir « Ce que le trimestre ne fait plus ») ; bilan des heures ; roadmap v3 |

### Point de reprise « roadmap v2 »

Demande du PI (01/11 21:00 : « après les relectures et analyses, on va devoir refaire la roadmap et les plans »). Une séance d'arbitrage réécrit S6-S13 quand trois choses sont connues : l'analyse de N10-C run 2 (tag d'analyse), la fin d'E1-small et son analyse selon sa préreg, le rapport du contradicteur N10-D. Datée au plus tôt S5 (fin novembre), c'est un **livrable de M1**. Le PI peut y remonter une des tâches reportées (réponse 1 du §9 de la spec).

## S1 à S5 — détail semaine par semaine

S1 (26 oct-1 nov) est consommée : fusions du 25/10, revue des hypothèses, analyse profonde du 01/11, décisions du PI. Ses heures ne sont pas mesurées dans ce fichier ; le bilan de novembre les reportera.

Budget : ≈ 14 h par semaine (rapport:303), soit 56 h pour S2-S5. Postes (spec:74-79) : **É** écriture et corrections (80 h), **V** verrou de lecture (50 h), **A** analyse des runs en cours (10 h), **C** calcul (15 h), **R** retraits textuels (10 h), **Rés** réserve (20 h).

| Sem. | Tâche | Poste | h | Dépôt | Hôte | Fait quand |
|---|---|---|---|---|---|---|
| **S2 (2-8 nov)** | Commentaire ReScience #147 le 02/11 : déclarer l'ablation diagonale préenregistrée et le recalcul aux deux bases (1,90 et 3,05 ; rapport:294) ; proposer deux relecteurs | É | 2 | rescience-nh01 | aucun | commentaire posté |
| | Deux PR de corrections publiques (`.github`, kiki-flow-research : bannière `main.tex`, `CITATION.cff`) ; note « superseded » sur Zenodo par le PI | É | 3 | .github, kiki-flow | aucun | PR fusionnées, note Zenodo publiée |
| | Citations Rome/unlearning de #87 portées dans `build/full-draft.tex` et Paper 2 | É | 3 | dream-of-kiki | aucun | PR fusionnée |
| | Note méthodo : demande d'endossement arXiv (cs.DL primaire, stat.ME croisé, puis JOTE) ; plan de la section NH-01 réécrite | É | 2 | paper-methodo-2026 | aucun | endossement demandé |
| | Analyse de N10-C run 2 selon sa préreg (appariée par graine, tag d'analyse) ; aucun nouveau calcul | A | 3 | nerve-wml | aucun (lecture des artefacts) | tag d'analyse posé |
| | Note de lecture N10-D v0 : ouverture, liste des sources imposées | V | 1 | nerve-wml | aucun | fichier ouvert |
| | **Total S2** | | **14** | | | **M0 (8 nov)** |
| **S3 (9-15 nov)** | Plan FOSDEM PYVZXW corrigé avant le 16/11 (formulation Q3 (a) v3) | É | 1 | .github (talks) | aucun | plan corrigé |
| | v2 ReScience : tableau diagonale aux deux bases | É | 4 | rescience-nh01 | aucun | tableau rédigé |
| | Analyse d'E1-small selon sa préreg (H14 exploratoires, déclaré le 30/10), après sa fin | A | 3 | dream-of-kiki | aucun | rapport d'analyse commis |
| | Note méthodo : NH-01 réécrit, 7 tags, C8 | É | 4 | paper-methodo-2026 | aucun | sections rédigées |
| | N10-D : note v0 rédigée ; brief du contradicteur envoyé (sans la note) | V | 2 | nerve-wml | aucun | brief archivé |
| | **Total S3** | | **14** | | | |
| **S4 (16-22 nov)** | v2 ReScience : Fig. 10 et texte | É | 5 | rescience-nh01 | aucun | figure et texte prêts |
| | Note méthodo : Vaccaro et Thomas au résumé, sections errata | É | 5 | paper-methodo-2026 | aucun | sections rédigées |
| | Retraits textuels kiki-flow : λ̂ = 67,8 et la référence au Thm 3.4 (spec:78) ; aucun rejeu | R | 2 | kiki-flow | aucun | PR fusionnée |
| | N10-D : tour de veille 1 ; rapport du contradicteur reçu ; note amendée | V | 2 | nerve-wml | aucun | journal du tour 1 commis |
| | **Total S4** | | **14** | | | |
| **S5 (23-29 nov)** | v2 ReScience soumise (fin novembre) | É | 7 | rescience-nh01 | aucun | v2 déposée |
| | Note méthodo : brouillon complet visé | É | 4 | paper-methodo-2026 | aucun | brouillon v0.1 |
| | N10-D : tour de veille 2 (autres canaux) ; trois tests constatés | V | 1 | nerve-wml | aucun | tests écrits dans la note |
| | Séance « point de reprise roadmap v2 » | Rés | 2 | .github | aucun | roadmap v3 provisoire datée |
| | **Total S5** | | **14** | | | **M1 (29 nov)** |

Somme S2-S5 : 56 h = 14 × 4. Par poste : É 40 (#147 18 sur 18, FOSDEM 1, PR 3, citations 3, méthodo 15 sur 45), V 6, A 6, R 2, Rés 2, C 0.

**Report explicite** (ce qui ne tient pas dans S2-S5 et part en S6-S13, à 14 h par semaine soit ≈ 112 h) : note méthodo 30 h (arXiv avant le 15/12, donc S6-S7) ; NH-03 en section de la note 4 h ; amendement bouba v0.7.1 6 h ; verrou N10-D 19 h, bouba 15 h, NH-20 10 h ; analyse Me6 4 h ; retraits textuels 8 h (micro-kiki « +7 pp » et table des latences, bouba `main.tex`, bannières) ; calcul 15 h ; réserve 18 h. Total 129 h contre ≈ 112 h de capacité : l'écart (≈ 17 h) correspond à ce que S1 a déjà couvert, non mesuré, ou à la réserve. **Ce tableau montre déjà que le verrou N10-D ne recevra que 6 h sur 25 avant M1.** Règle appliquée d'ici le point de reprise (spec:139) : les échéances externes tiennent (commentaire #147, v2 ReScience, FOSDEM, arXiv 15/12) et c'est le verrou N10-D qui glisse — M1 au plus tard en S7, calcul N10-D au plus tôt en S8. À arbitrer par le PI au point de reprise.

## S6 à S13 — provisoire, réécrit au point de reprise roadmap v2

| Sem. | Contenu indicatif | Postes | Jalon |
|---|---|---|---|
| S6 (30 nov-6 déc) | Note méthodo (NH-03 en section, sans run) ; retraits textuels restants ; verrou N10-D (fin si glissé) ; calcul N10-D sur KXKM **seulement** si le verrou est passé | É, R, V, C | — |
| S7 (7-13 déc) | Note méthodo soumise sur arXiv (cs.DL + stat.ME) avant le 15/12 ; note de lecture bouba v0.7.1 ; amendement v0.7.1 | É, V | M1 au plus tard si glissé |
| S8 (14-20 déc) | Verrou bouba (contradicteur, tours) ; verrou NH-20 (lecture mathématique) ; analyse Me6 selon sa préreg | V, A | — |
| S9 (21-27 déc) | Tampon (Noël) : relectures ReScience, réponses éditeur, aucun gel | Rés | — |
| S10 (28 déc-3 jan) | bouba v0.7.1 taguée après verrou ; K1/K3 sur electron-server ; NH-20 rejoué sous sa note (CPU) | C, V | **M2 (3 jan)** |
| S11 (4-10 jan) | Réponses aux relecteurs de la note méthodo ; soumission JOTE | É | — |
| S12 (11-17 jan) | Rapport descriptif N10-C run 2 et E1-small ; v2 ReScience (si pas encore soumise) | É, A | — |
| S13 (18-24 jan) | GO/NO-GO axe matière (NH-01 et lecture seule) ; GO/NO-GO R8-lite ; bilan des heures ; roadmap v3 | Rés | **M3 (24 jan)** |

## Ce que le trimestre ne fait plus

Retirés de la phase 2 (S6-S10) de la roadmap v1, à reprendre après M3 et seulement sous verrou (spec §5.3) :

- NH-63, NH-59, NH-60 (kiki-flow) ;
- NH-28 (alphabet par le jitter) ;
- NH-77 (WML-JEPA) ;
- NH-07 (RECOMBINE inter-domaines) ;
- R8-H1 (NcaWML) ;
- NH-03 comme run (reste comme section de la note méthodo, décision PI Q6) ;
- NH-85 (RAG contre Aeon) : reporté après M3, décision PI du 01/11 21:00 (spec:143) — le routage de LoRA est saturé dans la littérature et Aeon est d'Arslan.

Clos ou terminés : **NH-81** est clos par erratum, statut unifié main/PR #19/GB300, pas de run KXKM le 04/11 (décision PI Q7). **NH-01** est fait ; sa suite est la v2 ReScience, pas un nouveau run.

Tâches S3-S5 de la v1 reportées après M3 avec le statut « utile, sous verrou » (réponse 1 du §9 de la spec, choix de la session à vérifier par le PI) : DR-3/H13 sur G5 (H13 devra passer le verrou : CKNNA à petit n piégé, question structure contre géométrie), test 6 → treillis Π et DR-0/DR-1 (refonte de Paper 1, Q2), invariants N/W (rigueur d'ingénierie), préregs bouba_sens v0.8-v0.9 (dépendent de v0.7.1). Seule v0.7.1 reste ce trimestre.

Rejeux reportés après M3, sous verrou (réponse 3 du §9) : mKNN intra-cluster, Claim B causal, porte baby-brain sur le taux d'apprentissage.

## Décisions du PI du 01/11 et où elles tombent

| Décision (rapport:290-304 ; spec §9) | Où |
|---|---|
| Q1 : commenter #147 le 02/11, v2 avant fin novembre, texte aux deux bases | S2, S3-S5, M0, M3 |
| Q2 : mail Rome 50142 envoyé seulement après acceptation de la v2 | après M3 au plus tôt (brouillon non envoyé) |
| Q3 : FOSDEM corrigé avant le 16/11 | S3, M1 |
| Q4 : note méthodo cs.DL + stat.ME, puis JOTE ; endossement cette semaine ; arXiv avant le 15/12 | S2-S7, M2, S11 |
| Q5 : deux PR (`.github`, kiki-flow) + note Zenodo par le PI | S2, M0 |
| Q6 : NH-03 en section de la note méthodo, sans run | S6 ; « ne fait plus » |
| Q7 : NH-81 clos par erratum, pas de run KXKM le 04/11 | « ne fait plus » |
| Q8 : N10-C-bis à 3 graines appariées ou N10-D corrigé, avant tout gel ; N10-C-bis non gelée, sous verrou, issue nerve-wml #62 reformulée « geler après verrou » | M1 |
| Q9 : bouba K1/K3 rien avant v0.7.1 taguée | S7-S10, M2 |
| Q10 : trimestre ambitieux ≈ 185 h | principe 5 |
| Q11 : citations #87 dans la `.tex` et Paper 2 maintenant | S2, M0 |
| §9 Q1 (question du PI « toujours utile ? ») : tâches S3-S5 v1 reportées, sous verrou | « ne fait plus » ; point de reprise |
| §9 Q3 : retraits textuels ce trimestre (10 h), rejeux après M3 | S4, S6 ; « ne fait plus » |
| §9 Q5 : la roadmap sera refaite après les relectures et analyses | point de reprise, M1 |
| §9 Q9 : RAG contre Aeon reporté après M3 | « ne fait plus » |

## Mois 4 à 6 (par quinzaine, février → avril 2027) — à relire à M3

Tableau gardé tel quel depuis la v1 ; plusieurs lignes dépendent d'hypothèses désormais reportées (voir « Ce que le trimestre ne fait plus »). À relire à M3.

| Quinzaine | Objectif | Dépend de |
|---|---|---|
| Q1 (25 jan–7 fév) | Réponses aux relectures de la note méthodo ; préreg des hypothèses survivantes de la phase 2 (niveau L3 : Octopus ou OSF) | verdicts phase 2 |
| Q2 (8–21 fév) | Paper 1 GENIAL reformulé : DR-0 budget, DR-1 sélective, DR-3 avec test H13 + indice relationnel, DR-4 inter-domaines, prior art Hopfield rêveurs ; « axiomes » gardés comme hypothèses de cadre à portée empirique délimitée | H13 (S3), NH-01, NH-20 |
| Q3 (22 fév–7 mars) | bouba_sens : publication de B-1/B-2 comme nuls (équivalence TOST seulement si marges justifiées) + calibration appariée de Me6 ; v0.7 exécutée si déposée en S5 | S5 |
| Q4 (8–21 mars) | nerve-wml : papier N10-C/N10-C-bis ; décision sur le GTM (garder comme porteuse physique ou retirer) | N10-C-bis |
| Q5 (22 mars–4 avr) | baby-brain : premier résultat WML-JEPA à 5 graines ; décision Path-B | NH-77 |
| Q6 (5–18 avr) | Si GO matière : deuxième vague (machine d'Ising à oscillateurs simulée comme porteuse du GTM, NH-28/NH-31) ; sinon fermeture documentée | S13 |
| Q7 (19 avr–2 mai) | Bilan semestriel ; roadmap v3 ; décision BSK (relance seulement si J/token favorable) | NH-81 |

## Mois 7 à 12 (trimestres, mai → octobre 2027) — à relire à M3

Tableau gardé tel quel depuis la v1. À relire à M3.

| Trimestre | Jalons |
|---|---|
| T3 2027 (mai–juil.) | Deuxième campagne préenregistrée (une seule, choisie parmi : RECOMBINE inter-domaines à l'échelle, WML-JEPA développemental complet, GTM sur substrat oscillant) ; Paper 1 soumis ; registre public des nuls calibrés (bibliothèque) publié |
| T4 2027 (août–oct.) | Résultats de la deuxième campagne ; Paper 2 (substrats) ou nerve-wml selon verdicts ; revue annuelle des hypothèses (comme le 24/10/2026) ; roadmap 2027-28 |

## Dépendances et calendrier des machines

Aucune nouvelle campagne GPU avant S6. Une seule campagne lourde à la fois. État au 01/11 18:10 : E1-small à 1 227/1 410 cellules sur KXKM, N10-C run 2 sur macM1 jusqu'à ≈ 02/11 02:00 (rapport:13).

| Hôte | S1-S2 (26 oct → 8 nov) | S3-S5 (9 → 29 nov) | S6-S10 (30 nov → 3 jan), provisoire | S11-S13 (4 → 24 jan), provisoire |
|---|---|---|---|---|
| KXKM GPU | fin d'E1-small (déjà gelée, aucune nouvelle campagne) puis libre | libre — aucune campagne | N10-D seulement si son verrou est passé (au plus tôt S6 ; S8 si le verrou glisse) | selon le point de reprise |
| KXKM CPU (`nice 19`) | libre | libre | NH-20 CPU possible sous sa note | selon le point de reprise |
| macM1 | N10-C run 2 (≈ 02/11), puis second cerveau | second cerveau (RAM serrée) | second cerveau | second cerveau |
| electron-server (CPU sans AVX) | aucune campagne | aucune campagne | K1/K3 bouba après v0.7.1 taguée ; NH-20 CPU possible | selon le point de reprise |
| Studio | éteint | éteint | éteint | éteint |
| GrosMac | rien | rien | rien | rien |

## Ce que l'on ne fait pas en 2026-27

Pas de nouveau dépôt ni de nouveau « lab » ; pas de nouvel axe ni de nouvelle hypothèse hors catalogue ; pas de QPU ; pas de wet-lab ; pas d'achat de matériel ; pas d'axe conscience ; pas de relance BSK ; pas de dépôt OSF d'une préreg sans nul calibré ; pas de gel sans verrou de lecture ; pas plus d'une campagne lourde à la fois.

## Indicateurs mensuels

| Indicateur | Cible fin janvier 2027 |
|---|---|
| Verrous passés (note + contradicteur + trois tests, avant le tag) | 3 (N10-D, bouba v0.7.1, NH-20) ; 1 à M1 (N10-D), ou S7 au plus tard |
| Verdicts rendus (campagnes analysées selon leur préreg) | E1-small, N10-C run 2, Me6 ; plus N10-D s'il est lancé |
| Tags de gel posés sans verrou | 0 |
| Chiffres sans artefact dans README/papiers | 0 |
| Préregs gelées après verrou (L1 gel + L2) | bouba v0.7.1 ; N10-D ou N10-C-bis (une seule) |
| Errata publiés avec cause racine | 100 % des rétractations |
| Soumissions | commentaire #147 (02/11) ; v2 ReScience ; note méthodo sur arXiv avant le 15/12 puis JOTE |
| Temps chercheur, **mesuré** chaque mois | règle ≤ 10 h/semaine ; exception du trimestre : ≈ 14 h/semaine, 185 h en tout, écart affiché chaque mois |
| Heures par poste, **mesurées** | É 80, V 50, A 10, C 15, R 10, Rés 20 (spec:74-79) |

## Risques et parades

| Risque | Parade |
|---|---|
| Récidive du « jamais testé » (nouvelles préregs sans exécution) | principe 3 ; une seule campagne lourde à la fois ; KPI « verrous passés » et « verdicts rendus » |
| **Verrou passé pour la forme** : note écrite après le gel, tiers qui relit sans chercher à contredire, tours de veille sur la même source | la note est commise avant le tag (date git vérifiable) ; le contradicteur ne reçoit ni la note ni les conclusions et son rapport est archivé avec elle ; chaque tour de veille porte ses canaux et ses comptes brut → gardé, différents du tour précédent ; les trois tests sont constatés par écrit (saturation : un tour sans nouvelle entrée ; recoupement : ≥ 2 sources de nature différente par phrase ; couverture : six canaux) ; tout identifiant résolu par API ; un tag posé sans ces pièces est déclaré non valide par ADR |
| Veille sans condition d'arrêt (tours sans fin, listes de papiers non lus) | condition d'arrêt = trois tests, pas un compte ; « [résumé moteur] » pour ce qui n'est pas lu ; heures du poste V plafonnées à 50 h |
| Le verrou absorbe tout et l'écriture glisse | les échéances externes tiennent (commentaire #147, v2 ReScience, FOSDEM, arXiv 15/12) ; c'est le verrou N10-D qui glisse (M1 → S7 au plus tard, calcul au plus tôt S8) |
| Surcharge déjà visible (postes S2-S7 au-dessus de 14 h/semaine) | report explicite ci-dessus ; arbitrage au point de reprise ; heures mesurées chaque mois |
| Quotas API (Claude, OpenAI) en pleine campagne | agents longs en début de fenêtre ; briefs sauvegardés ; contradicteur Claude à contexte vierge en secours de Codex |
| Machines : Tower mort, Studio éteint, macM1 pris par le second cerveau | calendrier ci-dessus ; CPU sur ES/KXKM ; aucune case GPU avant S6 |
| Temps : recherche d'emploi, imprévus | tampon S9 ; réserve 20 h ; S6-S13 provisoires |
| Re-interprétation post hoc d'un résultat | règle d'interprétation écrite dans chaque préreg ; verdict rendu par script, pas par lecture ; aucun verdict sur E1-small, N10-C run 2, Me6 hors de leur préreg |
| Artefacts gitignorés | definition of done : JSON commis ou DOI Zenodo, sinon le chiffre n'existe pas |
| Dispersion vers les nouveaux axes | track M et R8-lite sans pilote ce trimestre ; GO/NO-GO daté S13 |
