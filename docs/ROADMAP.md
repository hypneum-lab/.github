# Hypneum Lab — Roadmap 2026-11 → 2027-10

Version 2.1 du 6 novembre 2026 (point de reprise anticipé, voir §« Point de reprise » ; remplace la v2 du 1er novembre pour S3 à S13). La v2 remplaçait la version 1 du 25 octobre pour les semaines S2 à S13. Chercheur : Clément Saillant (indépendant). Sources : conception « Verrou de lecture et plan du trimestre » (`docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md`, ci-après **spec**) ; analyse profonde du 01/11 (PR hypneum-lab/.github #23, `docs/research/2026-11-01-analyse-profonde/README.md`, ci-après **rapport**) ; décisions du PI du 01/11 (QCM 20:15-20:30 et 21:00 CET). Suivi : GitHub Projects « Hypneum — Programme 2026-27 » + ce fichier + page Outline.

> Note de révision — 2026-11-06 : NH-91 « quand dormir » renuméroté NH-102 (collision avec la liste du 30/10 ; catalogue v3, PR #30, décision PI).

> Note de révision — 2026-11-07 : décisions R1-R9 du point de reprise (refresh README §7) ; jalon Q3 (B-1/B-2) reformulé en non-test / non mesurable ; BB-N1 reste reporté ; §16 non recalculé ; NH-85 (H9) fermée pour antériorité (eLife 112891), reformulée en extension de H10.

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
| **M0 Vérité** | 8 nov 2026 | commentaire ReScience #147 (posté le 04/11) ; deux PR de corrections publiques (`.github` #23-#25, kiki-flow-research #65, fusionnées le 06/11) + note « superseded » Zenodo par le PI ; citations #87 portées dans la `.tex` et Paper 2 (dok #86, #90) ; clôture de N10-C run 2 (PR #109, 05/11 ; rapport descriptif #63 à suivre) ; note de lecture N10-D (#102, fusionnée le 06/11, au-delà du « début » prévu) |
| **M1 Verrou passé pour N10-D** | 29 nov 2026 | note, rapport du contradicteur, trois tests, décision N10-C-bis (3 graines appariées) ou N10-D corrigé (décision PI Q8, rapport:290-304) ; FOSDEM corrigé (16/11) ; note méthodo en brouillon complet ; **point de reprise « roadmap v2 »** (livrable de M1, voir plus bas) |
| **M2 Trois verrous, un calcul** | 3 jan 2027 | N10-D **ou** N10-C-bis à 3 graines (une seule, décision 06/11 « préparer les deux ») lancé sur KXKM si son verrou passe (au plus tôt S6) ; bouba v0.7.1 taguée et K1/K3 lancés sur electron-server ; NH-20 rejoué sous sa note ; note méthodo sur arXiv avant le 15/12 |
| **M3** | 24 jan 2027 | v2 ReScience soumise (fin novembre visée, M3 au plus tard) ; JOTE ; GO/NO-GO axe matière sur NH-01 et la lecture seule (pilotes kiki-flow reportés, voir « Ce que le trimestre ne fait plus ») ; bilan des heures ; roadmap v3 |

### Point de reprise « roadmap v2 » — tenu le 6 novembre 2026 (anticipé de S5 à S2)

Demande du PI (01/11 21:00 : « après les relectures et analyses, on va devoir refaire la roadmap et les plans »). La séance devait attendre trois entrées ; elles sont arrivées plus tôt que prévu, et le PI a tenu la séance le 06/11 (13:45 CET) :

| Entrée | État au 06/11 |
|---|---|
| Analyse de N10-C run 2 | campagne arrêtée après la graine 0 (déviation nerve-wml PR #105, 04/11), pré-analyse exploratoire de la graine 0 lue le 05/11, clôture PR #109 (05/11). Reste le rapport descriptif de l'issue #63 (≈ 15 nov), sans tag d'analyse. |
| Fin d'E1-small et analyse selon sa préreg | campagne finie le 02/11 ; **aucune analyse n'existait au 06/11** ; analyse lancée le 06/11 selon la préreg gelée (H14 toutes exploratoires, amendement du 30/10), rapport en PR brouillon dream-of-kiki #91 (06/11). Constats : la campagne a tourné sur **KXKM** (cache `/ai/saisail/e1-small/out/run-2026-10-29/`), pas sur le GB300 ; arrêt sur erreur (`math domain error` dans `choice_kl`, bras exploratoire `p_ctrl_lr_matched`) le 01/11 à 20:20 après 1 271 cellules sur 1 410 ; les 9 profils enregistrés × 141 graines sont complets (0 violation d'invariant, code `e93ea81`). Trois hypothèses, toutes exploratoires : H14-A D̄ = +0,043 (nul apparié P99 0,010, p = 1·10⁻⁴) va dans le sens de l'effet ; H14-B D̄ = 0,000, borne U < δ atteinte, va dans le sens d'un apport de DOWNSCALE inférieur à δ ; H14-C D̄ = +0,019 va dans le sens de la non-infériorité. Réserves déclarées : bras `p_min` connu du PI avant la fin du run ; contrôle `sft > shuffle` échoue (−0,013) ; bras `lr_matched` non calculable (n = 2) ; bras de même norme et contrôle « options seules » non lancés (GPU). |
| Rapport du contradicteur N10-D | rendu le 06/11 (Codex sol + Claude Opus, « partiellement » ×2, nerve-wml PR #113), **vérifié en source le jour même** (0 constat réfuté, 5 reclassés, 1 BLOQUANT commun : porte d'apprentissage impossible en `sym`), 19 corrections portées dans la PR #100 le 06/11 (`1ccb78b`, `e5fbe88` : porte et `msg_shuffle` sur `asym` seulement, `sym` hors H1, nul apparié, métrique en politique figée, dérangement d'épisodes, règle de k sans facteur 2 ; 17 tests verts). Sept TBD (10-16 : divergence entre backends, budget du pilote, marge 0,30 ou 0,675, règle de k, source de σ_D, ε de la porte `sym`, règle IC ou ponctuelle) **bloquent le gel** et reviennent au PI. |

Décisions du PI du 06/11 (QCM, 13:45) :

- **Q8 tranchée « les deux »** : la PR #100 (N10-D) est corrigée des 19 points, **et** un plan N10-C-bis à 3 graines appariées est rédigé (nerve-wml, brouillon). Le choix entre les deux se fait au gel, sur le coût et sur ce que chacune peut trancher ; **une seule** sera gelée et calculée (indicateur inchangé). Plan N10-C-bis (nerve-wml PR #114, brouillon) : à k = 3 le test des signes ne peut jamais rejeter (p minimale 1/8) et l'équivalence à marge 0,10 est hors d'atteinte ; seule une porte à seuil avec ses taux d'erreur écrits a un sens. Coût estimé : porte A+ (G2 rejouée à 3 graines + `nocomm_rep`) 9 runs ≈ 19 h GPU KXKM et ≈ 8 h PI ; campagne B' ensuite 18 runs ≈ 194 h KXKM (≈ 8 jours) et ≈ 30 h PI ; B complète (54 runs, ≈ 583 h) ne tient pas avant M2. Cinq questions PI dans le plan (porte sous verrou ou non, graines hors pilote G7, critère, hôte).
- **E1-small** : analyse lancée immédiatement, strictement selon la préreg.
- **bouba_sens issue #74** (physio phase 1 : 4 colonnes à 100 Hz lues comme 3 colonnes à 500 Hz, distinct de #72) : acceptée, PR code + texte sans recalcul de B-2 ; le recalcul est une décision séparée (voir « à arbitrer »).
- **Heures libérées en S3-S4** par l'avance du verrou N10-D (note, contradicteur et vérification faits en S2 au lieu de S3-S4) : vers la note méthodo, la note de lecture bouba v0.7.1 (dès S3) et les deux relectures ReScience C acceptées le 04/11 sur #147, qui entrent dans le plan.

Ce que S2 a livré en plus du plan : lecture intégrale de la bibliothèque (417 notes, library #1-#3), passe croisée Codex sur 43 notes (143 constats, 0 bloquant), sept PR de corrections bibliographiques fusionnées le 06/11, notes NH-20 et bouba v0.7.1, veille thèses (#25), bouba #71 (localizer vérifié) et issues #72/#74.

Décisions du PI du 06/11, second tour (13:58) :

- **Dérogation datée à la règle 4** (« aucune nouvelle campagne GPU avant S6 ») : la **porte A+ de N10-C-bis** (G2 rejouée à 3 graines + `nocomm_rep`, 9-12 runs) tourne en **S3-S5 comme runs de développement**, résultats non lus avant le gel ; hôte **mixte macM1 + KXKM** avec déviation de substrat déclarée a priori (nerve-wml PR #114 amendé, runbook, go PI daté au lancement). B' ensuite seulement si A+ passe et si le PI le choisit à M1.
- **E1-small** : PR dream-of-kiki #91 fusionnée le 06/11 (analyse exploratoire) ; les deux contrôles GPU manquants (bras de même norme H14-B, « options seules ») sont lancés sur KXKM dès le 06/11 par **addendum de contrôle** (principe 3, exception « addendum sur une campagne en cours »), sans gel nouveau.
- **B-2 bouba** : recalcul **maintenant** (S2-S3) avec le cache phase 1 régénéré (run 01, 900 s, code de la PR #75), même commande que l'ADR-0019 ; les valeurs §(d) seront mises à jour avant la note de lecture bouba v0.7.1. La case S9 « recalcul B-2 si décidé » disparaît. **Fait le 06/11** (bouba PR #75 code, #76 recalcul, #78 amendement de sonde, empilées) : avec le cache corrigé, aucune graine ne dépasse +0,10 bit ; la sonde contiguë de 512 trames ne portait qu'une classe d'étiquette dans 4 graines sur 5 (issue #77, contrôle qui ne pouvait pas échouer, ancien verdict compris) ; avec une sonde stratifiée (amendement daté de l'ADR-0019), la porte d'apprentissage échoue sur les 10 graines : B-2 sur Studyforrest est **non mesurable**, Null sur CC-film et sur le monde gaussien ; la phrase « ne dépend pas de la moitié réelle » est retirée (§(e), ADR, README erratum 12). Piste ouverte : les lots d'entraînement du lecteur sont eux aussi contigus.

**Reste à arbitrer** : tag d'analyse N10-C run 2 ; placement des 8-12 h de relectures ReScience C au-delà de S5-S6 ; graines (9104, 9105 + neuve, hors pilote G7) et critère (G2 inchangé) de la porte A+, appliqués comme hypothèses de travail, à confirmer au go.

## S1 à S5 — détail semaine par semaine

S1 (26 oct-1 nov) est consommée : fusions du 25/10, revue des hypothèses, analyse profonde du 01/11, décisions du PI. Ses heures ne sont pas mesurées dans ce fichier ; le bilan de novembre les reportera.

Budget : ≈ 14 h par semaine (rapport:303), soit 56 h pour S2-S5. Postes (spec:74-79) : **É** écriture et corrections (80 h), **V** verrou de lecture (50 h), **A** analyse des runs en cours (10 h), **C** calcul (15 h), **R** retraits textuels (10 h), **Rés** réserve (20 h).

| Sem. | Tâche | Poste | h | Dépôt | Hôte | Fait quand |
|---|---|---|---|---|---|---|
| **S2 (2-8 nov)** | Commentaire ReScience #147 le 02/11 : déclarer l'ablation diagonale préenregistrée et le recalcul aux deux bases (1,90 et 3,05 ; rapport:294) ; confirmer sur ReScience/ReScience#118 que l'auteur fera les deux relectures pour ReScience C demandées par l'éditeur en chef le 01/11 09:52 UTC (corrigé le 02/11 : il ne s'agit pas de proposer deux relecteurs ; `docs/research/2026-11-02-veille-theses/these-rescience-methodo.md:93`, PR #25 ; les deux relectures, 8-12 h estimées par inférence, ne sont pas budgétées ici : à arbitrer par le PI) | É | 2 | rescience-nh01 | aucun | commentaire posté |
| | Deux PR de corrections publiques (`.github`, kiki-flow-research : bannière `main.tex`, `CITATION.cff`) ; note « superseded » sur Zenodo par le PI | É | 3 | .github, kiki-flow | aucun | PR fusionnées, note Zenodo publiée |
| | Citations Rome/unlearning de #87 portées dans `build/full-draft.tex` et Paper 2 | É | 3 | dream-of-kiki | aucun | PR fusionnée |
| | Note méthodo : demande d'endossement arXiv (cs.DL primaire, stat.ME croisé, puis JOTE) ; plan de la section NH-01 réécrite | É | 2 | paper-methodo-2026 | aucun | endossement demandé |
| | Analyse de N10-C run 2 selon sa préreg (appariée par graine, tag d'analyse) ; aucun nouveau calcul | A | 3 | nerve-wml | aucun (lecture des artefacts) | tag d'analyse posé |
| | Note de lecture N10-D v0 : ouverture, liste des sources imposées | V | 1 | nerve-wml | aucun | fichier ouvert |
| | **Total S2** | | **14** | | | **M0 (8 nov)** |
| **S3 (9-15 nov)** | Plan FOSDEM PYVZXW corrigé avant le 16/11 (formulation Q3 (a) v3) | É | 1 | .github (talks) | aucun | plan corrigé |
| | v2 ReScience : tableau diagonale aux deux bases | É | 4 | rescience-nh01 | aucun | tableau rédigé |
| | E1-small : relecture par le PI du rapport d'analyse du 06/11 (agent, selon la préreg) et fusion | A | 1 | dream-of-kiki | aucun | rapport fusionné |
| | bouba v0.7.1 : note de lecture ouverte (avancée de S7, décision 06/11) | V | 2 | bouba_sens | aucun | fichier ouvert |
| | Note méthodo : NH-01 réécrit, 7 tags, C8 | É | 4 | paper-methodo-2026 | aucun | sections rédigées |
| | N10-D : tour de veille 1 (fait en avance : note #102, contradicteur #113 et PR #100 corrigée le 06/11) | V | 2 | nerve-wml | aucun | journal du tour 1 commis |
| | **Total S3** | | **14** | | | |
| **S4 (16-22 nov)** | v2 ReScience : Fig. 10 et texte | É | 5 | rescience-nh01 | aucun | figure et texte prêts |
| | Note méthodo : Vaccaro et Thomas au résumé, sections errata | É | 5 | paper-methodo-2026 | aucun | sections rédigées |
| | Retraits textuels kiki-flow : λ̂ = 67,8 et la référence au Thm 3.4 (spec:78) ; aucun rejeu | R | 2 | kiki-flow | aucun | PR fusionnée |
| | N10-D : tour de veille 2 (autres canaux) ; décision gel N10-D ou N10-C-bis sur le plan à 3 graines | V | 2 | nerve-wml | aucun | journal du tour 2 commis, décision datée |
| | **Total S4** | | **14** | | | |
| **S5 (23-29 nov)** | v2 ReScience soumise (fin novembre) | É | 7 | rescience-nh01 | aucun | v2 déposée |
| | Note méthodo : brouillon complet visé | É | 4 | paper-methodo-2026 | aucun | brouillon v0.1 |
| | N10-D ou N10-C-bis : trois tests constatés (saturation, recoupement, couverture) | V | 1 | nerve-wml | aucun | tests écrits dans la note |
| | Relecture ReScience C n° 1 (acceptée le 04/11 sur #147 ; la séance « point de reprise » a eu lieu le 06/11) | Rés | 2 | rescience-nh01 | aucun | relecture déposée |
| | **Total S5** | | **14** | | | **M1 (29 nov)** |

Somme S2-S5 : 56 h = 14 × 4. Par poste (v2.1) : É 40 (#147 18 sur 18, FOSDEM 1, PR 3, citations 3, méthodo 15 sur 45), V 8, A 4, R 2, Rés 2, C 0.

**Report explicite** (ce qui ne tient pas dans S2-S5 et part en S6-S13, à 14 h par semaine soit ≈ 112 h) : note méthodo 30 h (arXiv avant le 15/12, donc S6-S7) ; NH-102 (ex-NH-03 « quand dormir ») en section de la note 4 h ; amendement bouba v0.7.1 6 h ; verrou N10-D 19 h, bouba 15 h, NH-20 10 h ; analyse Me6 4 h ; retraits textuels 8 h (micro-kiki « +7 pp » et table des latences, bouba `main.tex`, bannières) ; calcul 15 h ; réserve 18 h. Total 129 h contre ≈ 112 h de capacité : l'écart (≈ 17 h) correspond à ce que S1 a déjà couvert, non mesuré, ou à la réserve. Au 06/11 (v2.1) : le verrou N10-D a reçu en S2, en heures-agent, ce qui était prévu pour S3-S4 (note, contradicteur, vérification, PR #100 corrigée) ; il ne reste au PI que les tours de veille, les trois tests et la décision de gel. Les échéances externes tiennent (v2 ReScience, FOSDEM, arXiv 15/12) ; M1 reste au 29 nov ; le calcul (N10-D ou N10-C-bis, une seule) au plus tôt S6.

## S6 à S13 — révisé au point de reprise du 06/11 (v2.1), à relire à M1

| Sem. | Contenu indicatif | Postes | Jalon |
|---|---|---|---|
| S6 (30 nov-6 déc) | Note méthodo (NH-102 ex-NH-03 en section, sans run) ; retraits textuels restants ; gel de **N10-D ou N10-C-bis** (une seule, après trois tests) et lancement sur KXKM ; relecture ReScience C n° 2 | É, R, V, C, Rés | — |
| S7 (7-13 déc) | Note méthodo soumise sur arXiv (cs.DL + stat.ME) avant le 15/12 ; note de lecture bouba v0.7.1 finie ; amendement v0.7.1 ; brief du contradicteur bouba (sans la note) | É, V | M1 au plus tard si glissé |
| S8 (14-20 déc) | Verrou bouba (rapport du contradicteur, tours) ; verrou NH-20 (lecture mathématique) ; analyse Me6 selon sa préreg ; calcul N10-D/N10-C-bis en cours (lecture interdite) | V, A, C | — |
| S9 (21-27 déc) | Tampon (Noël) : relectures ReScience, réponses éditeur, aucun gel | Rés | — |
| S10 (28 déc-3 jan) | bouba v0.7.1 taguée après verrou ; K1/K3 sur electron-server ; NH-20 rejoué sous sa note (CPU) ; verdict N10-D/N10-C-bis rendu par script selon sa préreg | C, V, A | **M2 (3 jan)** |
| S11 (4-10 jan) | Réponses aux relecteurs de la note méthodo ; soumission JOTE | É | — |
| S12 (11-17 jan) | Rapport descriptif N10-C run 2 (issue #63) ; v2 ReScience (si pas encore soumise) | É, A | — |
| S13 (18-24 jan) | GO/NO-GO axe matière (NH-01 et lecture seule) ; GO/NO-GO R8-lite ; bilan des heures ; roadmap v3 | Rés | **M3 (24 jan)** |

## Ce que le trimestre ne fait plus

Retirés de la phase 2 (S6-S10) de la roadmap v1, à reprendre après M3 et seulement sous verrou (spec §5.3) :

- NH-63, NH-59, NH-60 (kiki-flow) ;
- NH-28 (alphabet par le jitter) ;
- NH-77 (WML-JEPA) ;
- NH-07 (RECOMBINE inter-domaines) ;
- R8-H1 (NcaWML) ;
- NH-102 « quand dormir » (ex-NH-03 de la spec ; devenue NH-91 le 01/11 pour lever la collision avec le NH-03 du 24/10, puis NH-102 le 06/11, collision avec la liste du 30/10 ; corrigé le 07/11) comme run (reste comme section de la note méthodo, décision PI Q6) ;
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
| Q6 : NH-102 (ex-NH-03) en section de la note méthodo, sans run | S6 ; « ne fait plus » |
| Q7 : NH-81 clos par erratum, pas de run KXKM le 04/11 | « ne fait plus » |
| Q8 : N10-C-bis à 3 graines appariées ou N10-D corrigé, avant tout gel ; N10-C-bis non gelée, sous verrou, issue nerve-wml #62 reformulée « geler après verrou » | M1 |
| Q9 : bouba K1/K3 rien avant v0.7.1 taguée | S7-S10, M2 |
| Q10 : trimestre ambitieux ≈ 185 h | principe 5 |
| Q11 : citations #87 dans la `.tex` et Paper 2 maintenant | S2, M0 |
| §9 Q1 (question du PI « toujours utile ? ») : tâches S3-S5 v1 reportées, sous verrou | « ne fait plus » ; point de reprise |
| §9 Q3 : retraits textuels ce trimestre (10 h), rejeux après M3 | S4, S6 ; « ne fait plus » |
| §9 Q5 : la roadmap sera refaite après les relectures et analyses | point de reprise, M1 |
| §9 Q9 : RAG contre Aeon reporté après M3 | « ne fait plus » |
| **06/11 Q8 : « les deux »** — PR #100 corrigée (19 points) et plan N10-C-bis à 3 graines rédigé ; une seule gelée et calculée | S4-S6, M2 |
| **06/11** : analyse E1-small lancée selon la préreg ; bouba #74 acceptée (code + texte, sans recalcul) ; heures libérées → méthodo, note bouba dès S3, relectures ReScience C | S3-S6 |

## Mois 4 à 6 (par quinzaine, février → avril 2027) — à relire à M3

Tableau gardé tel quel depuis la v1 ; plusieurs lignes dépendent d'hypothèses désormais reportées (voir « Ce que le trimestre ne fait plus »). À relire à M3.

| Quinzaine | Objectif | Dépend de |
|---|---|---|
| Q1 (25 jan–7 fév) | Réponses aux relectures de la note méthodo ; préreg des hypothèses survivantes de la phase 2 (niveau L3 : Octopus ou OSF) | verdicts phase 2 |
| Q2 (8–21 fév) | Paper 1 GENIAL reformulé : DR-0 budget, DR-1 sélective, DR-3 avec test H13 + indice relationnel, DR-4 inter-domaines, prior art Hopfield rêveurs ; « axiomes » gardés comme hypothèses de cadre à portée empirique délimitée | H13 (S3), NH-01, NH-20 |
| Q3 (22 fév–7 mars) | bouba_sens : B-1/B-2 rapportés comme **non-test / non mesurable** (régime qui n'apprend pas, ADR-0024 ; B-2 non mesurable sur Studyforrest), pas comme nuls et sans TOST ; livrable : une section de la note méthodo (décision PI R8 du 07/11, refresh README §7 ; bouba_sens issue #24) + calibration appariée de Me6 ; v0.7 exécutée si déposée en S5 | S5 |
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
| KXKM GPU | fin d'E1-small (déjà gelée, aucune nouvelle campagne) puis libre ; contrôles E1-small par addendum dès le 06/11 | porte A+ N10-C-bis en développement (dérogation du 06/11), partagée avec macM1 ; deux jobs seulement si VRAM cumulée < 22 Go | N10-D ou N10-C-bis (une seule) si son verrou est passé (au plus tôt S6 ; S8 si le verrou glisse) | verdict rendu par script (S10) ; rien de neuf avant M3 |
| KXKM CPU (`nice 19`) | libre | libre | NH-20 CPU possible sous sa note | selon le point de reprise |
| macM1 | N10-C run 2 (≈ 02/11), puis second cerveau ; cache bouba phase 1 régénéré (06/11) | second cerveau + part macM1 de la porte A+ (un job lourd à la fois, `lockf`, jour de modèle en pause) | second cerveau | second cerveau |
| electron-server (CPU sans AVX) | aucune campagne | aucune campagne | K1/K3 bouba après v0.7.1 taguée ; NH-20 CPU possible | selon le point de reprise |
| Studio | allumé au 01/11 18:10 (corrigé le 02/11 : 7 j d'uptime, processus tiers actif, a servi au rejeu M5 secondaire fini le 31/10 18:42 ; `docs/research/2026-11-02-veille-theses/dossier-relecture.md:26`, PR #25) ; aucune campagne prévue | aucune campagne prévue | aucune campagne prévue | aucune campagne prévue |
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
| Soumissions | commentaire #147 (posté le 04/11) ; deux relectures ReScience C (acceptées le 04/11) ; v2 ReScience ; note méthodo sur arXiv avant le 15/12 puis JOTE |
| Temps chercheur, **mesuré** chaque mois | règle ≤ 10 h/semaine ; exception du trimestre : ≈ 14 h/semaine, 185 h en tout, écart affiché chaque mois |
| Heures par poste, **mesurées** | É 80, V 50, A 10, C 15, R 10, Rés 20 (spec:74-79) |

## Risques et parades

| Risque | Parade |
|---|---|
| Récidive du « jamais testé » (nouvelles préregs sans exécution) | principe 3 ; une seule campagne lourde à la fois ; KPI « verrous passés » et « verdicts rendus » |
| **Verrou passé pour la forme** : note écrite après le gel, tiers qui relit sans chercher à contredire, tours de veille sur la même source | la note est commise avant le tag (date git vérifiable) ; le contradicteur ne reçoit ni la note ni les conclusions et son rapport est archivé avec elle ; chaque tour de veille porte ses canaux et ses comptes brut → gardé, différents du tour précédent ; les trois tests sont constatés par écrit (saturation : un tour sans nouvelle entrée ; recoupement : ≥ 2 sources de nature différente par phrase ; couverture : six canaux) ; tout identifiant résolu par API ; un tag posé sans ces pièces est déclaré non valide par ADR |
| Veille sans condition d'arrêt (tours sans fin, listes de papiers non lus) | condition d'arrêt = trois tests, pas un compte ; « [résumé moteur] » pour ce qui n'est pas lu ; heures du poste V plafonnées à 50 h |
| Le verrou absorbe tout et l'écriture glisse | les échéances externes tiennent (commentaire #147, v2 ReScience, FOSDEM, arXiv 15/12) ; c'est le verrou N10-D qui glisse (M1 → S7 au plus tard, calcul au plus tôt S8) |
| Surcharge déjà visible (postes S2-S7 au-dessus de 14 h/semaine) | report explicite ci-dessus ; **décision PI 01/11 21:50 : trancher au point de reprise**, roadmap inchangée d'ici là ; heures mesurées chaque mois |
| Quotas API (Claude, OpenAI) en pleine campagne | agents longs en début de fenêtre ; briefs sauvegardés ; contradicteur Claude à contexte vierge en secours de Codex |
| Machines : Tower mort, Studio éteint, macM1 pris par le second cerveau | calendrier ci-dessus ; CPU sur ES/KXKM ; aucune case GPU avant S6 |
| Temps : recherche d'emploi, imprévus | tampon S9 ; réserve 20 h ; S6-S13 provisoires |
| Re-interprétation post hoc d'un résultat | règle d'interprétation écrite dans chaque préreg ; verdict rendu par script, pas par lecture ; aucun verdict sur E1-small, N10-C run 2, Me6 hors de leur préreg |
| Artefacts gitignorés | definition of done : JSON commis ou DOI Zenodo, sinon le chiffre n'existe pas |
| Dispersion vers les nouveaux axes | track M et R8-lite sans pilote ce trimestre ; GO/NO-GO daté S13 |
