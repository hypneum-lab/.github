# Hypneum Lab — Roadmap 2026-11 → 2027-10

Version 2.2 du 10 novembre 2026, complétée le 11 novembre au soir (décisions du PI du 10/11 et du 11/11, voir §« Décisions du PI du 10 novembre 2026 » ; remplace la v2.1 du 6 novembre pour S3 à S13). La v2.1 (point de reprise anticipé du 06/11) remplaçait la v2 du 1er novembre pour S3 à S13. La v2 remplaçait la version 1 du 25 octobre pour les semaines S2 à S13. Chercheur : Clément Saillant (indépendant). Sources : conception « Verrou de lecture et plan du trimestre » (`docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md`, ci-après **spec**) ; analyse profonde du 01/11 (PR hypneum-lab/.github #23, `docs/research/2026-11-01-analyse-profonde/README.md`, ci-après **rapport**) ; décisions du PI du 01/11 (QCM 20:15-20:30 et 21:00 CET). Suivi : GitHub Projects « Hypneum — Programme 2026-27 » + ce fichier + page Outline.

> Note de révision — 2026-11-06 : NH-91 « quand dormir » renuméroté NH-102 (collision avec la liste du 30/10 ; catalogue v3, PR #30, décision PI).

> Note de révision — 2026-11-07 : décisions R1-R9 du point de reprise (refresh README §7) ; jalon Q3 (B-1/B-2) reformulé en non-test / non mesurable ; BB-N1 reste reporté ; §16 non recalculé ; NH-85 (H9) fermée pour antériorité (eLife 112891), reformulée en extension de H10.

> Note de révision — 2026-11-10 : Zuse-2 devient la seule campagne lourde du trimestre, gelée et lancée seulement après le dépôt arXiv de la note méthodo ; N10-D v2 et N10-C-bis sont reportées après M3 (la porte A+ et sa dérogation du 06/11 n'ont plus d'objet) ; H14 reste ouverte pour un modèle plus grand, après M3 et sous verrou ; M1 est redéfini. Les numéros de ligne cités par d'autres documents (`RM:n`) valent pour la v2.1.

Ce qui change par rapport à la v1 : un **verrou de lecture** conditionne désormais tout gel (spec §4) ; la phase « Dix hypothèses » disparaît ; le trimestre se répartit en 185 h décidées par le PI (rapport:303) autour de ce verrou, des corrections et de l'écriture (spec:74-79). Les semaines S2 à S5 sont écrites en détail ; S6 à S13 sont **provisoires** et seront réécrites au point de reprise « roadmap v2 » (spec:118).

## Principes

1. **Vérité avant nouveauté.** On ne lance rien de neuf tant qu'un chiffre faux reste dans un README, un papier ou un fichier Zenodo.
2. **Falsifiable avant testé.** Une hypothèse entre en phase de test seulement si elle a un nul calibré, un critère de réfutation écrit et un verdict informatif en cas de négatif.
3. **Une campagne, un verdict.** Pas de nouveau **gel** tant que la précédente campagne n'a pas rendu son verdict ; la lecture n'est pas un gel (spec:140). Exception inchangée : un addendum de contrôle sur une campagne en cours.
4. **Le calcul suit les machines.** Une seule campagne lourde à la fois. Aucune nouvelle campagne GPU avant S6 ; depuis le 10/11, aucune campagne lourde avant le dépôt arXiv de la note méthodo. CPU léger sur electron-server, CPU lourd sur KXKM en `nice 19`, jamais sur GrosMac.
5. **Dix heures par semaine, sauf exception datée.** La règle reste 10 h par semaine : deux soirées (arbitrage lundi, écriture jeudi) et un demi-week-end. Le trimestre S1-S13 est une **exception datée** : 185 h (≈ 14 h par semaine), décidée par le PI le 01/11 (rapport:303), mesurée chaque mois et comparée à la règle. La réconciliation avec le plafond de 10 h du plan pro 3 ans appartient au PI (spec:32). Les agents rédigent et exécutent ; le chercheur décide, lance, valide, signe.
6. **Lire avant de geler.** Aucun tag de gel sans note de lecture, contradicteur et trois tests passés (saturation, recoupement, couverture ; spec §4.2). Le verrou s'applique à toute campagne lourde (GPU, ou > 6 h CPU, ou > 1 semaine calendaire) et à toute préreg L3. Les campagnes déjà gelées (E1-small, N10-C run 2, Me6, GB300 g7) ne sont pas re-soumises.

## Le verrou de lecture en une page

| Temps | Contenu | Où |
|---|---|---|
| 1. Note de lecture | sources primaires lues en entier (identifiant résolu par API) ; déjà publié, phrase par phrase ; la seule question qui reste ouverte ; le dessin minimal qui la tranche | dépôt de la campagne, à côté de la préreg |
| 2. Contradicteur | un tiers (Codex en aveugle par défaut, Claude à contexte vierge en secours) reçoit dépôts, veilles et canaux, **pas** la note ni les conclusions du labo, et cherche ce qui rend la question inutile ou déjà tranchée | rapport archivé avec la note |
| 3. Tours de veille | plusieurs tours datés, chacun sur des sources différentes du précédent ; la note est amendée entre deux tours | journal de veille du dépôt |

Ordre de passage révisé le 10/11 : **Zuse-2** d'abord (note de lecture, contradicteur aveugle, tours de veille : aucune de ces pièces n'existe au 10/11), puis bouba_sens v0.7.1 et NH-20 ; N10-D v2 et N10-C-bis repassent le verrou après M3. Ordre de la v2.1, pour mémoire (spec §5.1) : **N10-D** (nerve-wml) d'abord, puis **bouba_sens v0.7.1** avant K1/K3 Me6, puis **NH-20** Lie contre Strang (lecture mathématique, sans contradicteur obligatoire). N10-C-bis n'est **pas gelée** (issue nerve-wml #62 ouverte, aucun tag `n10c-bis-freeze-*` ; spec:136) : elle passe aussi le verrou, et l'issue #62 est reformulée « geler après verrou ».

## Jalons du trimestre

| Jalon | Date | Contenu (spec §7) |
|---|---|---|
| **M0 Vérité** | 8 nov 2026 | commentaire ReScience #147 (posté le 04/11) ; deux PR de corrections publiques (`.github` #23-#25, kiki-flow-research #65, fusionnées le 06/11) + note « superseded » Zenodo par le PI ; citations #87 portées dans la `.tex` et Paper 2 (dok #86, #90) ; clôture de N10-C run 2 (PR #109, 05/11 ; rapport descriptif #63 à suivre) ; note de lecture N10-D (#102, fusionnée le 06/11, au-delà du « début » prévu) |
| **M1 Verrou engagé pour Zuse-2** (redéfini le 10/11 ; était « Verrou passé pour N10-D ») | 29 nov 2026 | Zuse-2 : note de lecture, brief et rapport du contradicteur aveugle, trois corrections avant gel (rééchantillonnage par lignée de systèmes, plus petit effet d'intérêt nommé, calcul rechiffré pour ≈ 84 bases) ; FOSDEM corrigé (16/11) ; note méthodo en brouillon complet |
| **M2 Trois verrous, un calcul** | 3 jan 2027 | note méthodo sur arXiv avant le 15/12, **puis** gel de Zuse-2 (L1, OSF par le PI) et lancement si son verrou est passé (décision 10/11 ; remplace « N10-D ou N10-C-bis ») ; bouba v0.7.1 taguée et K1/K3 lancés sur electron-server ; NH-20 rejoué sous sa note ; note méthodo sur arXiv avant le 15/12 |
| **M3** | 24 jan 2027 | v2 ReScience soumise (fin novembre visée, M3 au plus tard) ; JOTE ; GO/NO-GO axe matière sur NH-01 et la lecture seule (pilotes kiki-flow reportés, voir « Ce que le trimestre ne fait plus ») ; décision N10-D v2 ou N10-C-bis et cadrage de H14 à plus grande échelle (reportés le 10/11) ; bilan des heures ; roadmap v3 |

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

## Décisions du PI du 10 novembre 2026

Prises en séance (QCM, ≈ 12:10 CET) après l'état des lieux et la relecture du 10/11. Constats cités : R1 à R7 de cette relecture.

| Question | Décision | Conséquence dans ce fichier |
|---|---|---|
| Place de calcul lourd du trimestre | **Zuse-2 sous verrou**, et **aucune campagne lourde avant que la note méthodo soit sur arXiv** | Zuse-2 est la seule campagne lourde ; gel et lancement au plus tôt après le dépôt arXiv (15/12 au plus tard). N10-D v2 (dont le verrou repart : nouvel axe primaire du 08/11, nouveau contradicteur et descente de citations exigés par `nerve-wml:docs/prereg/n10d/protocol.md` §15) et N10-C-bis à 3 graines passent après M3. La porte A+ et la dérogation du 06/11 à la règle 4 n'ont plus d'objet. M1, M2, S4 à S10, calendrier des machines et indicateurs révisés ci-dessous. |
| Écriture | **En parallèle** de la préparation de Zuse-2 | Pas de gel des nouvelles préregs ; les heures d'écriture de S3 à S7 sont inchangées. Les heures sont consignées chaque semaine (elles ne l'étaient pas au bilan partiel du 08/11). |
| Axe rêve sur LLM après les contrôles E1-small (rejeu avec ou sans DOWNSCALE : même gain, `dream-of-kiki:docs/osf-addendum-e1-small-controls-2026-11-06.md` §10) | **Rejouer plus grand** | H14 n'est pas fermée ; reprise après M3, sous verrou. La note de lecture devra dire pourquoi un effet nul à 4B apparaîtrait à plus grande échelle, et à quelle taille (le 35B a été abandonné le 30/10). |

Avant tout gel de Zuse-2 (relecture du 10/11) : (R3) note de lecture et contradicteur aveugle, la critique L0 du 09/11 ayant lu le brouillon ; (R4) le panel contient des lignées de systèmes (GLiDE 2B, 9B, 27B ; Qwen3.5 4B, 9B et mammoth-1 sur base Qwen3.5-27B) que le plan d'analyse rééchantillonne comme indépendantes ; (R5) la puissance de 85 % vaut pour l'effet ×1, « borne haute plausible » selon le protocole, et tombe à 44 % à ×0,5.

**Pilotes déclarés (ligne ajoutée le 11/11 à la demande du PI)** : les passes du banc de décision clef-mlx (L2c et L5, terminées le 10/11 à 12:44) et le pilote LoRA du bras L4 (Qwen3.5-4B-Base, graines 0 à 4, au plus 3,1 h de GPU par graine, décision PI du 10/11 16:15 citée par `l4-lora-seeds-chain.sh`, fin prévue le 11/11 au soir) sont des **pilotes exploratoires**, hors campagne lourde. Leurs données n'entrent dans aucun test confirmatoire ; le bras L4 garde sa préreg séparée (`zuse-2:docs/prereg/zuse-2/protocol.md` §11).

**Reste à arbitrer** : la file « eb_jepa » qui a occupé le GPU de KXKM dans la nuit du 10 au 11/11 (à rattacher ou non à l'issue #43, hors des trois lignes du recentrage) ; inscription de Zuse-2 au catalogue ; plafond de calcul de Zuse-2 (`tbd-by-pi.md` n° 8, proposé pour 17 bases).

### Second tour, 10 novembre 2026 (QCM, ≈ 13:45 CET)

| Question | Décision | Conséquence |
|---|---|---|
| Hypothèses candidates C1 à C8 de l'état des lieux du 10/11 | **C1 à C7 inscrites**, C8 (rotation des options) reste proposée | À inscrire au catalogue à partir de NH-114 (prochain numéro libre), dans l'ordre C1 à C7 : C1 DOWNSCALE quasi-symétrie du réseau (dose-réponse contre bruit de même norme, sans rejeu) ; C2 DOWNSCALE comme température (précision inchangée, confiance en baisse) ; C3 bande de charge où le noyau rêveur bat le désapprentissage à meilleure dose, avec porte de mesurabilité ; C4 apport du contradicteur aveugle d'une autre famille, sur les relectures archivées ; C5 part des préregs gelées avant le verrou qui finissent non informatives ; C6 lignée (secondaire de Zuse-2) ; C7 exposition à l'entraînement (secondaire de Zuse-2). Seuils à fixer avant toute lecture. |
| Recentrage du trimestre | **Trois lignes**, un livrable par ligne : méthode (note sur arXiv avant le 15/12 ; C4, C5) ; calibration des modèles de décision (Zuse-2 ; C6, C7 ; C2 en pont) ; mémoire associative (v2 ReScience, NH-01 et lecture P8c ; C3 ; C1) | **En veille, sans heure avant M3** : communication émergente (N10), bouba_sens (verrou v0.7.1 et K1/K3 compris), kiki-flow hors NH-20, baby-brain, micro-kiki, axe matière, R8-lite. |
| Axe rêve sur LLM | **C1 d'abord** (remplace « rejouer plus grand » de 12:10) | Aucun rejeu de H14 à plus grande échelle tant que C1 n'a pas montré que DOWNSCALE agit à une dose donnée ; si C1 conclut à une quasi-symétrie, pas de rejeu. Motif : sur les 564 cellules de contrôle E1-small, DOWNSCALE change la norme de 8,36 contre 0,35 pour le rejeu seul, sans changer ni la précision ni la divergence des réponses (0,134 contre 0,137 ; lecture descriptive du 10/11). |

**Lignes de ce fichier que le second tour rend caduques et qui restent à réécrire** (non modifiées ici) : M2 et S7 à S10 pour bouba v0.7.1 et K1/K3 ; S13 et M3 pour les GO/NO-GO axe matière et R8-lite ; l'indicateur « verrous passés » (cible 3, dont bouba v0.7.1) ; l'ordre de passage du verrou.

Trois règles proposées avec le recentrage, **à confirmer par le PI** (elles n'étaient pas dans le QCM) : toute entrée au plan nomme ce qu'elle en sort ; avant toute campagne, un test d'une heure montre que la manipulation agit ; les heures sont consignées chaque lundi.

## Décisions du PI du 11 novembre 2026 (soir)

Prises par QCM entre 18:40 et 19:20 CET, après les lectures intégrales du 11/11 (Lyle 2024 ; Gardner, Derrida, Mottishaw 1987 ; annexes de Fachechi 2019 ; Clark 2026 ; Hernandez-Garcia 2026 ; Han 2026 ; Bidel 2023 ; Pophale 2023), l'essai d'une heure sur l'arrondi bf16 et la proposition de roadmap du doc « état des lieux ». Règle appliquée dès cette section : toute entrée nomme ce qu'elle retire du plan.

| Question | Décision | Conséquence dans ce fichier et ailleurs |
|---|---|---|
| Verrou de lecture pour S1 (rappel transitoire, nerve-wml PR #135) et P3r | **Oui** ; calcul CPU autorisé avant M3 ; résultats lus seulement après la note méthodo sur arXiv, comme Zuse-2 | S1 et P3r rejoignent la ligne « mémoire associative » comme tests CPU sous verrou ; retire « S1 avant M3 ? » des questions ouvertes. Lectures faites : GDM 1987, annexes Fachechi 2019 ; à récupérer (péage) : Amari-Maginu 1988, Parisi 1986, Tononi-Cirelli 2003, Kinzel 1986 (`library/references/to-fetch/veille-2026-11-11.md`) |
| P3r | **P3r-b seule** (à poids retiré égal, la remise à l'échelle préserve mieux les anciennes mémoires que la remise à zéro aléatoire) ; P3r-a devient le **contrôle positif de l'instrument** ; P3r-c abandonnée | Un seul numéro de catalogue à terme. Retire P3r-a et P3r-c comme hypothèses. Avant tout gel : estimation analytique de l'effet (terme de variance binomiale) ; s'il est sous la marge 0,05, P3r-b redevient une note |
| Jeu d'items extérieur pour C1/C2 | **Les trois** : SciQ (test, 1 000), OpenBookQA (test, 500), CommonsenseQA (validation, 1 221, 5 options) ; tous rejetés par la revue des jeux de Zuse-2, donc hors de son échantillon | Rapportés à part du corpus E1 ; pas dans le verdict C1 sauf amendement ; le harnais doit lire le nombre d'options du jeu (hasard 0,20 pour CommonsenseQA). Retire « jeu extérieur non choisi » des points ouverts |
| Arrondi bf16 pour C1/C2 | **Décidé après un essai d'une heure** (CPU kxkm-ai, 281 s, 738 tenseurs, aucun item scoré) : **bf16 gardé**, part d'arrondi rapportée par dose, **dose signalée si l'arrondi dépasse 10 % du pas** (seule la dose 0,01 : 18 %) | Règle écrite au prereg (dream-of-kiki PR #100 §7) ; script et résultat au dépôt. L'essai a aussi révélé que le snapshot est un hybride Gated DeltaNet + attention complète avec tour visuelle : la section 2 du prereg le dit et nomme les paramètres (décroissances, portes) pour lesquels la remise à l'échelle n'est pas une symétrie |
| Daydreaming (Serricchio 2024-2025) jamais comparé au noyau rêveur | **Bras Daydreaming dans C3**, sous verrou, CPU | C3 (NH-115) gagne un bras ; **absorbe K1** (anti-hebbien en ligne), qui n'est plus une candidate à part. Coût : quelques heures de CPU sur la grille de P8c et une préreg |
| Suite de l'axe rêve sur LLM après C1 | **A1 en test court après C1**, sans en faire une ligne : version CPU d'abord, puis 1 à 3 h de GPU sur le harnais E1 si l'effet existe | Retire définitivement « reprise de H14 à plus grande échelle » du trimestre (déjà après M3 le 10/11 ; devient conditionnelle à A1). A1 n'est pas inscrite au catalogue avant sa préreg L0 et sa note de lecture (Ash-Adams 2020, Oh 2025 à lire) |
| Étude de cas « nul prévisible » pour la note méthodo | **Reformulée** : « effet cherché au mauvais endroit » ; dans la note | La lecture Lyle (11/11) ne prédit pas le nul : elle borne l'effet attendu et le place sur l'apprentissage suivant, pas sur la rétention. La veille du 11/11 (PR #46) est corrigée en ce sens ; paper-methodo-2026 PR #5 reçoit l'étude de cas (section 7) |
| Numéros de catalogue de C1/C2 | **Un seul numéro, NH-114, type « contrôle d'instrument »** (C1, C2, bras Hopfield S5) | Catalogue v3 : NH-114 à NH-119 inscrits ce soir (C1+C2, C3, C4, C5, C6, C7) ; prochain numéro libre NH-120 ; NH-114 ne compte pas comme hypothèse dans le chiffre C5 |
| Trois règles du 10/11 | **Confirmées : (1) toute entrée au plan nomme ce qu'elle en sort ; (2) test d'une heure avant toute campagne.** Non confirmée : heures consignées chaque lundi (la consigne hebdomadaire du 10/11 reste) | Les deux règles passent dans « Principes » à la prochaine révision ; la (2) est déjà dans le skill `hypneum-prereg` |
| Tri des 22 candidates | **Tri du doc validé**, avec deux amendements : **S2** (phase hors ligne et changement brusque de stratégie) passe par une vérification d'antériorité avant d'être écartée ; **C8** (artefact d'ordre des options) devient une **analyse secondaire pré-déclarée de Zuse-2**, comme K4 | Ce trimestre : C1-C7 (NH-114 à 119), S5 dans NH-114, A1 en test court. Après la note méthodo, CPU, sous verrou : P2 avec A4, P3r-b, A2, S1. Après M3, un banc : P1, K2, K3. À fondre : K4 et C8 dans Zuse-2 (`tbd-by-pi.md` n° 41-42), A3 avec NH-03. Non inscrites : P4, A5, K5, S3, S4. S2 : antériorité lue en entier le 11/11 au soir (Löwe et al. 2024, PLOS Comput. Biol., doi:10.1371/journal.pcbi.1012505 ; note en bibliothèque) : **partiellement publiée** — modèle réduit, tâche à règle cachée, déclic par bruit sur les poids sous L1 sur les portes sont publiés ; **aucune phase hors ligne** (les auteurs écrivent qu'il n'y a « nor an off-task incubation period » et renvoient le sommeil à de futurs travaux). Reste neuf : la phase sans données elle-même, son placement et la comparaison des opérations. Dernier risque : bioRxiv « N2 Sleep Inspires Insight » (même groupe), à résoudre avant verdict définitif. S2 reste candidate non inscrite, horizon après M3 |

Calcul relevé le 11/11 à 18:31 CET, rien touché : kxkm-ai GPU occupé par un run `eb_jepa` (contrib, 14,5 Go) et `decision-bench` phase 4 ; le pilote L4 LoRA (clef-l4, 5 graines) est terminé (JEVCHAINDONE 17:38) ; macM1 : 11 processus `zuse-2` orphelins depuis le 9/11 21:39 (0 % CPU, parent mort), disque à 93 % ; macM3 injoignable. Leur sort est une décision du PI.

## Études en cours (pré-enregistrées)

- **Zuse-2** — miscalibration structurée par la tâche des modèles de décision : étude confirmatoire pré-enregistrée (L0 rév. 2 le 2026-11-09, dépôt privé `hypneum-lab/zuse-2`, passage public au gel L1). Pilote exploratoire = banc public clef-mlx L2c (11 modèles × 6 bases, 2026-11-09) : motif suggestif non confirmé (p apparié 0,041), fragilité à la rotation des identifiants d'options. Statistique primaire : part de variance famille (nuls appariés N1/N2/N2s/N3, Holm). Décision PI n° 15 : ≈ 12 bases par famille (puissance simulée 85 %). Prochaines étapes : inventaire des 60 bases, gel L1 (tag + SWH), OSF (PI). **10/11 : devient la campagne lourde du trimestre (décision 14 bases par famille du 09/11, ≈ 84 bases) ; verrou de lecture à passer ; gel et lancement après le dépôt arXiv de la note méthodo.**

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
| | Zuse-2 : note de lecture et brief du contradicteur aveugle (remplace le tour 2 N10-D, décision 10/11) | V | 2 | zuse-2 | aucun | note et brief commis |
| | **Total S4** | | **14** | | | |
| **S5 (23-29 nov)** | v2 ReScience soumise (fin novembre) | É | 7 | rescience-nh01 | aucun | v2 déposée |
| | Note méthodo : brouillon complet visé | É | 4 | paper-methodo-2026 | aucun | brouillon v0.1 |
| | Zuse-2 : rapport du contradicteur lu, corrections R3 à R5 portées au protocole (remplace les trois tests N10, décision 10/11) | V | 1 | zuse-2 | aucun | protocole révisé |
| | Relecture ReScience C n° 1 (acceptée le 04/11 sur #147 ; la séance « point de reprise » a eu lieu le 06/11) | Rés | 2 | rescience-nh01 | aucun | relecture déposée |
| | **Total S5** | | **14** | | | **M1 (29 nov)** |

Somme S2-S5 : 56 h = 14 × 4. Par poste (v2.1) : É 40 (#147 18 sur 18, FOSDEM 1, PR 3, citations 3, méthodo 15 sur 45), V 8, A 4, R 2, Rés 2, C 0.

**Report explicite** (ce qui ne tient pas dans S2-S5 et part en S6-S13, à 14 h par semaine soit ≈ 112 h) : note méthodo 30 h (arXiv avant le 15/12, donc S6-S7) ; NH-102 (ex-NH-03 « quand dormir ») en section de la note 4 h ; amendement bouba v0.7.1 6 h ; verrou N10-D 19 h, bouba 15 h, NH-20 10 h ; analyse Me6 4 h ; retraits textuels 8 h (micro-kiki « +7 pp » et table des latences, bouba `main.tex`, bannières) ; calcul 15 h ; réserve 18 h. Total 129 h contre ≈ 112 h de capacité : l'écart (≈ 17 h) correspond à ce que S1 a déjà couvert, non mesuré, ou à la réserve. Au 06/11 (v2.1) : le verrou N10-D a reçu en S2, en heures-agent, ce qui était prévu pour S3-S4 (note, contradicteur, vérification, PR #100 corrigée) ; il ne reste au PI que les tours de veille, les trois tests et la décision de gel. Les échéances externes tiennent (v2 ReScience, FOSDEM, arXiv 15/12) ; M1 reste au 29 nov ; le calcul (N10-D ou N10-C-bis, une seule) au plus tôt S6.

## S6 à S13 — révisé au point de reprise du 06/11 (v2.1), à relire à M1

| Sem. | Contenu indicatif | Postes | Jalon |
|---|---|---|---|
| S6 (30 nov-6 déc) | Note méthodo (NH-102 ex-NH-03 en section, sans run) ; retraits textuels restants ; Zuse-2 : tours de veille et trois tests ; relecture ReScience C n° 2 | É, R, V, Rés | — |
| S7 (7-13 déc) | Note méthodo soumise sur arXiv (cs.DL + stat.ME) avant le 15/12, **puis** gel de Zuse-2 (L1, OSF par le PI) si son verrou est passé ; note de lecture bouba v0.7.1 finie ; amendement v0.7.1 ; brief du contradicteur bouba (sans la note) | É, V | M1 au plus tard si glissé |
| S8 (14-20 déc) | Verrou bouba (rapport du contradicteur, tours) ; verrou NH-20 (lecture mathématique) ; analyse Me6 selon sa préreg ; calcul Zuse-2 (lecture interdite avant la fin des systèmes) | V, A, C | — |
| S9 (21-27 déc) | Tampon (Noël) : relectures ReScience, réponses éditeur, aucun gel | Rés | — |
| S10 (28 déc-3 jan) | bouba v0.7.1 taguée après verrou ; K1/K3 sur electron-server ; NH-20 rejoué sous sa note (CPU) ; verdict Zuse-2 rendu par script selon sa préreg | C, V, A | **M2 (3 jan)** |
| S11 (4-10 jan) | Réponses aux relecteurs de la note méthodo ; soumission JOTE | É | — |
| S12 (11-17 jan) | Rapport descriptif N10-C run 2 (issue #63) ; v2 ReScience (si pas encore soumise) | É, A | — |
| S13 (18-24 jan) | GO/NO-GO axe matière (NH-01 et lecture seule) ; GO/NO-GO R8-lite ; N10-D v2 ou N10-C-bis ; cadrage de H14 à plus grande échelle ; bilan des heures ; roadmap v3 | Rés | **M3 (24 jan)** |

## Ce que le trimestre ne fait plus

Retirés de la phase 2 (S6-S10) de la roadmap v1, à reprendre après M3 et seulement sous verrou (spec §5.3) :

- NH-63, NH-59, NH-60 (kiki-flow) ;
- NH-28 (alphabet par le jitter) ;
- NH-77 (WML-JEPA) ;
- NH-07 (RECOMBINE inter-domaines) ;
- R8-H1 (NcaWML) ;
- NH-102 « quand dormir » (ex-NH-03 de la spec ; devenue NH-91 le 01/11 pour lever la collision avec le NH-03 du 24/10, puis NH-102 le 06/11, collision avec la liste du 30/10 ; corrigé le 07/11) comme run (reste comme section de la note méthodo, décision PI Q6) ;
- NH-85 (RAG contre Aeon) : reporté après M3, décision PI du 01/11 21:00 (spec:143) — le routage de LoRA est saturé dans la littérature et Aeon est d'Arslan ;
- **N10-D v2 et N10-C-bis à 3 graines** (décision PI du 10/11) : reportées après M3, sous verrou ; la porte A+ n'est pas lancée ;
- **H14 à plus grande échelle** (décision PI du 10/11) : après M3, sous verrou.

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
| KXKM GPU | fin d'E1-small (déjà gelée, aucune nouvelle campagne) puis libre ; contrôles E1-small par addendum dès le 06/11 | porte A+ sans objet (10/11) ; banc de décision clef-mlx en cours le 10/11, statut à arbitrer ; aucune donnée confirmatoire | Zuse-2 après gel, au plus tôt après le dépôt arXiv (S7-S8), fenêtres accordées par le PI | verdict rendu par script (S10) ; rien de neuf avant M3 |
| KXKM CPU (`nice 19`) | libre | libre | NH-20 CPU possible sous sa note | selon le point de reprise |
| macM1 | N10-C run 2 (≈ 02/11), puis second cerveau ; cache bouba phase 1 régénéré (06/11) | second cerveau ; analyses et simulations Zuse-2 (CPU) | second cerveau | second cerveau |
| electron-server (CPU sans AVX) | aucune campagne | aucune campagne | K1/K3 bouba après v0.7.1 taguée ; NH-20 CPU possible | selon le point de reprise |
| Studio | allumé au 01/11 18:10 (corrigé le 02/11 : 7 j d'uptime, processus tiers actif, a servi au rejeu M5 secondaire fini le 31/10 18:42 ; `docs/research/2026-11-02-veille-theses/dossier-relecture.md:26`, PR #25) ; aucune campagne prévue | aucune campagne prévue | aucune campagne prévue | aucune campagne prévue |
| GrosMac | rien | rien | rien | rien |

## Ce que l'on ne fait pas en 2026-27

Pas de nouveau dépôt ni de nouveau « lab » ; pas de nouvel axe ni de nouvelle hypothèse hors catalogue (exception datée du 10/11 : Zuse-2, dépôt `hypneum-lab/zuse-2`, à inscrire au catalogue) ; pas de QPU ; pas de wet-lab ; pas d'achat de matériel ; pas d'axe conscience ; pas de relance BSK ; pas de dépôt OSF d'une préreg sans nul calibré ; pas de gel sans verrou de lecture ; pas plus d'une campagne lourde à la fois.

## Indicateurs mensuels

| Indicateur | Cible fin janvier 2027 |
|---|---|
| Verrous passés (note + contradicteur + trois tests, avant le tag) | 3 (Zuse-2, bouba v0.7.1, NH-20) ; Zuse-2 avant son gel, S7 au plus tôt |
| Verdicts rendus (campagnes analysées selon leur préreg) | E1-small, N10-C run 2, Me6 ; plus Zuse-2 s'il est lancé |
| Tags de gel posés sans verrou | 0 |
| Chiffres sans artefact dans README/papiers | 0 |
| Préregs gelées après verrou (L1 gel + L2) | bouba v0.7.1 ; Zuse-2 |
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
