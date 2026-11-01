# Verrou de lecture et plan du trimestre — plan d'exécution

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** mettre la roadmap, le catalogue d'hypothèses et les trois premiers chantiers (N10-D, bouba v0.7.1, NH-20) sous le verrou de lecture décidé le 01/11, avec une note de lecture v0 et un brainstorm par chantier.

**Architecture:** documents Markdown dans `hypneum-lab/.github` (gabarits, catalogue v2, roadmap v2, brainstorms des autres thèses) et dans le dépôt de chaque campagne (note de lecture v0, journal de veille tour 1). Un script Python de remontée de citations alimente les notes. Aucune préreg n'est gelée, aucun calcul n'est lancé.

**Tech Stack:** Markdown ; Python 3 stdlib + `scripts/s2.py` du skill semantic-scholar ; APIs Crossref, Semantic Scholar (lot), OpenAlex, arXiv (3 s entre appels) ; `gh` pour les PR brouillons.

**Spec:** `docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md`

## Global Constraints

- Hypneum reste sur GitHub ; commits en anglais, sujet ≤ 50 caractères, corps ≤ 72, pas d'attribution IA, pas de `--no-verify`.
- Aucun identifiant bibliographique cité de mémoire : chaque DOI ou arXiv id est résolu par API avant d'être écrit ; « [résumé moteur] » quand le texte n'a pas été lu.
- Aucun verdict sur E1-small, N10-C run 2, Me6 ; aucun tag de gel ; aucun job sur KXKM, macM1, GrosMac.
- Chaque chiffre repris du rapport du 01/11 porte son `path:line` d'origine.
- Langue : français dans les documents du labo, anglais dans les commits.

## Review Focus

- Une note de lecture qui cite une source non lue en entier sans la marquer « [résumé moteur] » → test : grep des identifiants de la note contre le journal de lecture (section « lu en entier »).
- Un identifiant arXiv ou DOI qui ne résout pas → test : `scripts/resolve-ids.py` renvoie 0 échec sur la note.
- Un tour de veille qui réutilise les mêmes canaux que le précédent → test : le journal porte des canaux différents par tour.
- La roadmap v2 qui garde une case GPU avant S6 ou une tâche S3-S5 reportée → test : grep « KXKM GPU » dans les lignes S2-S5, grep des hypothèses du §5.3 dans les tableaux S2-S13.
- Le catalogue v2 qui modifie un verdict des 9 classes du 24/10 au lieu d'ajouter une colonne → test : diff des colonnes d'origine entre la table du 24/10 et la v2 = vide.

---

### Task 1: Gabarits du verrou et script de remontée de citations

**Files:**
- Create: `docs/templates/reading-note.md`, `docs/templates/contradictor-brief.md`, `docs/templates/veille-journal.md`
- Create: `scripts/citation_snowball.py`, `scripts/resolve_ids.py`
- Test: `scripts/tests/test_resolve_ids.py` (stdlib `unittest`, appels réseau réels sur 2 identifiants connus)

**Interfaces:**
- Produces: `resolve_ids.py <fichier.md>` → lignes `id\tstatut(ok|ko)\ttitre` sur stdout, code de sortie = nombre de `ko` ; `citation_snowball.py --ids <id,...> --depth 1 --out <tsv>` → TSV `direction(amont|aval)\tid\tannee\ttitre\tpremier_auteur\tsource_api`.
- Gabarit de note : sections fixes « Sources primaires lues en entier », « Déjà publié (phrase → ≥ 2 sources) », « Reste ouvert », « Dessin minimal », « Journal des tours de veille », « Rapport du contradicteur », « Trois tests (saturation / recoupement / couverture) ».

- [ ] **Step 1:** écrire `test_resolve_ids.py` : `arXiv:1903.05168` → ok avec titre contenant « Pitfalls », `10.1103/PhysRevLett.109.268101` → ok avec « Agliari » en premier auteur, `arXiv:9999.99999` → ko.
- [ ] **Step 2:** lancer `python3 -m unittest scripts/tests/test_resolve_ids.py` → FAIL (module absent).
- [ ] **Step 3:** implémenter `resolve_ids.py` (arXiv `https://arxiv.org/abs/<id>` avec User-Agent neutre, Crossref `works/<doi>`, 3 s entre appels arXiv) et `citation_snowball.py` (Semantic Scholar `paper/<id>/references` et `/citations` en lot via `s2.py` si présent, repli OpenAlex `referenced_works` et `cited_by_api_url`).
- [ ] **Step 4:** relancer les tests → PASS ; lancer `citation_snowball.py --ids arXiv:2201.00032 --depth 1` et vérifier que Plakhov-Semenov 1992 ou Fachechi 2019 apparaît en amont.
- [ ] **Step 5:** écrire les trois gabarits à partir de `docs/research/2026-11-01-analyse-profonde/brief-commun.md` et `codex/brief-blind.md` ; le brief du contradicteur interdit explicitement la lecture de la note et des conclusions du labo.
- [ ] **Step 6:** commit `docs(templates): reading gate templates and scripts`.

### Task 2: Catalogue v2 des hypothèses

**Files:**
- Create: `docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`
- Read-only: `docs/research/2026-10-24-revue-hypotheses/` (table maîtresse, `02-catalogue-nouvelles-hypotheses.md`), spec §5.3 et §6.

**Interfaces:**
- Produces: table avec les colonnes d'origine du 24/10 **inchangées** + colonnes `Requalification après lecture` (réplication inter-substrats | exploratoire | non-test | artefact plausible | rapport technique | clos par erratum | utile, sous verrou | reporté après M3 | inchangé), `Source qui tranche` (id résolu), `Référence rapport 01/11` (B/M/E/C).

- [ ] **Step 1:** extraire la table du 24/10 telle quelle (copie, pas d'édition) ; vérifier par `diff` que les colonnes d'origine sont identiques.
- [ ] **Step 2:** appliquer les 20 lignes du §6 de la spec et les reports du §5.3 et de la réponse 1 du §9 (DR-3/H13, test 6, DR-0/DR-1, invariants N/W, préregs bouba v0.8-0.9 → « utile, sous verrou ») ; NH-81 → « clos par erratum » ; NH-85 → « reporté après M3 ».
- [ ] **Step 3:** lancer `scripts/resolve_ids.py` sur le fichier → 0 ko.
- [ ] **Step 4:** en-tête : date, source, règle de correspondance avec les 9 verdicts (réplication → amendé ; exploratoire → en attente ; non-test et artefact plausible → non concluant ; rapport technique → amendé).
- [ ] **Step 5:** commit `docs(research): hypothesis catalogue v2 after reading`.

### Task 3: Roadmap v2

**Files:**
- Modify: `docs/ROADMAP.md` (version 2, date 2026-11-01, tout le fichier)
- Read-only: spec §3, §5, §7, §9 ; `docs/PROJECT-MANAGEMENT.md`.

**Interfaces:**
- Produces: principes 1-6 (3 réécrit « pas de nouveau gel », 5 = 10 h règle + 185 h exception datée, 6 = « Lire avant de geler ») ; tableau S2-S5 détaillé (≈ 14 h/semaine, postes de la spec §5.2) ; S6-S13 marqués « provisoire, réécrit au point de reprise roadmap v2 » ; jalons M0-M3 du §7 ; calendrier machines sans case GPU avant S6 ; indicateurs « verrous passés » + « verdicts rendus » ; section « Ce que le trimestre ne fait plus » (§5.3) ; risque « verrou passé pour la forme » avec sa parade.

- [ ] **Step 1:** réécrire le fichier ; garder Q1-Q7 et T3-T4 tels quels avec la mention « à relire à M3 ».
- [ ] **Step 2:** vérifications : `grep -n "KXKM GPU" docs/ROADMAP.md` ne montre aucune ligne S2-S5 avec une campagne ; `grep -n -E "NH-63|NH-59|NH-60|NH-28|NH-77|NH-07|NH-85|R8-H1" docs/ROADMAP.md` ne renvoie que la section « ne fait plus » ; somme des heures S2-S5 ≤ 14 × 4 + report explicite.
- [ ] **Step 3:** commit `docs(roadmap): v2 with reading gate and 185 h plan`.

### Task 4: Note de lecture v0 et brainstorm — N10-D (nerve-wml)

**Files:**
- Create dans le clone `nerve-wml`, branche `docs/n10d-reading-note`: `docs/prereg/n10d/reading-note.md`, `docs/prereg/n10d/veille-journal.md`, `docs/prereg/n10d/brainstorm-2026-11-01.md`
- Read-only: PR #100 (`docs/prereg/n10d/protocol.md`), `papers/paper1/main.tex`, `docs/milestones/2026-10-25-n10c-bis-control-arms.md`, veilles du 01/11 (thèse 2, axe R2), rapport 01/11 B3, B4, M5, M7, M8, M9, C1, C4.

**Interfaces:**
- Consumes: gabarits de la Task 1 (copier la structure, pas d'import).
- Produces: note v0 avec sources lues en entier : Lowe 2019 (1903.05168), IC3Net (1812.09755), DVNC (2107.02367), CommFormer (2405.08550), You et al. 2609.27252, Rome 2610.08612 et 2609.32605 ; soumission `hukTsKYu8Y` en [résumé moteur] si le texte est inaccessible ; tour 1 de veille sur arXiv + OpenReview ; brainstorm : au moins cinq dessins alternatifs pour la question ouverte, dont le bras « usage causal du canal », chacun avec nul, coût et ce qu'il tranche, puis classement.

- [ ] **Step 1:** lire les sources en entier (PDF arXiv), journal de lecture avec date et pages.
- [ ] **Step 2:** écrire la note v0 ; chaque phrase « déjà publié » ou « reste ouvert » avec ≥ 2 sources ou la marque « à recouper ».
- [ ] **Step 3:** `resolve_ids.py` → 0 ko ; `citation_snowball.py` sur les 7 sources, dépôt du TSV dans `docs/prereg/n10d/snowball-tour1.tsv`.
- [ ] **Step 4:** brainstorm ; intégrer les corrections déjà décidées (sym hors H1, covariance de graine, 3 graines ou abandon de bis).
- [ ] **Step 5:** PR brouillon `docs(n10d): reading note v0 and brainstorm`, sans toucher `protocol.md`.

### Task 5: Note de lecture v0 et brainstorm — bouba_sens v0.7.1

**Files:**
- Create dans le clone `bouba_sens`, branche `docs/v071-reading-note`: `docs/prereg/actionsense-v0.7/reading-note.md`, `veille-journal.md`, `brainstorm-2026-11-01.md`
- Read-only: `docs/osf/amendment-v0.7-actionsense.md`, ADR-0019 à 0027, PR #66, veilles (thèse 5, axe R4), rapport 01/11 B15, B16, B17, M24-M28, C7.

**Interfaces:**
- Produces: sources lues en entier : Kleinman-Achille-Soatto 2210.04643, Alper 2310.16781, Sourav 2019, Piller 2023, Ćwiek 2022, Collignon 2013 ; arbitrage Sourav/Piller écrit avec les deux voies de recoupement ; brainstorm : dessins pour une lésion effective (k_steps, porte de manipulation mesurée en dB atteints), H0 sur résidus d'interaction, contrôle 2 refait ; liste des éléments de l'amendement v0.7.1 (sans le rédiger, ni le taguer).

- [ ] Steps 1-5 comme Task 4, PR brouillon `docs(v0.7.1): reading note v0 and brainstorm`.

### Task 6: Note de lecture v0 et brainstorm — NH-20 Lie contre Strang (kiki-flow-research)

**Files:**
- Create dans le clone `kiki-flow-research`, branche `docs/nh20-reading-note`: `docs/prereg/nh20/reading-note.md`, `veille-journal.md`, `brainstorm-2026-11-01.md`
- Read-only: `docs/notes/2026-11-01-jko-splitting-results.md`, `paper/main.tex` §splitting, ERRATUM, veilles (thèse 3, axe R3), rapport 01/11 B7-B10, M10-M15, C2, C5.

**Interfaces:**
- Produces: sources lues en entier : Gallouët-Monsaingeon 1602.04457, Carlier-Duval-Peyré-Schmitzer 2017 (théorème 3.16 et hypothèses, recopiées), Hernandez 2501.14660, Caucheteux-Bonet-Korba 2605.31369, Laborde 2017, Salim 2020 ; condition explicite sous laquelle l'ordre Lie/Strang est identifiable (pas h, ε, convergence de S) ; brainstorm : au moins quatre protocoles numériques pour rendre l'ordre identifiable, avec coût CPU.

- [ ] Steps 1-5 comme Task 4 (pas de contradicteur obligatoire, spec §5.1), PR brouillon `docs(nh20): reading note v0 and brainstorm`.

### Task 7: Requalification et brainstorm des autres thèses

**Files:**
- Create: `docs/research/2026-11-01-analyse-profonde/brainstorm-dream-of-kiki.md`, `brainstorm-micro-kiki.md`, `brainstorm-baby-brain.md`, `brainstorm-rescience-methodo.md`
- Read-only: veilles du 01/11 (thèses 1, 4, 6, 7, 8 ; axes R1, R5, R9, R11), rapport 01/11 §4 et §6, catalogue v2 (Task 2).

**Interfaces:**
- Produces: par thèse, 1 à 2 pages : ce que la lecture a changé (avec sources résolues), ce qui reste ouvert, trois à cinq idées classées par « ce que ça tranche / coût », et la mention explicite « aucune ne part avant un verrou » ; pour dream-of-kiki : H14 en réplication, NH-03 à budget égal, DR-2/DR-4 reformulés ; pour micro-kiki : rapport technique, NH-81 clos ; pour baby-brain : porte sur le taux d'apprentissage et NH-87 ; pour rescience/méthodo : v2 aux deux bases, note cs.DL.

- [ ] **Step 1:** écrire les quatre fichiers ; `resolve_ids.py` → 0 ko.
- [ ] **Step 2:** commit `docs(research): brainstorms per thesis after reading`.

### Task 8: Issues GitHub et pages Outline (après validation PI de la roadmap v2)

**Files:**
- Modify: `scripts/issues-manifest.json`, `scripts/milestones.json` (jalon « Après M3 », étiquette `sous-verrou`)
- Outline : pages « Roadmap 2026-27 » et « Gestion de projet » (collection Hypneum Lab).

- [ ] **Step 1:** ajouter au manifeste les issues « note de lecture » et « contradicteur » pour N10-D, bouba v0.7.1, NH-20 (dépôt de campagne) ; relancer `setup-project.sh`.
- [ ] **Step 2:** avec `gh` : fermer NH-81 (micro-kiki) par commentaire d'erratum ; reporter les issues du §5.3 et de la réponse 1 du §9 au jalon « Après M3 » + `sous-verrou` ; reformuler nerve-wml #62 « geler après verrou ».
- [ ] **Step 3:** aligner les deux pages Outline sur `docs/ROADMAP.md` v2.
- [ ] **Step 4:** commit `chore(project): issues for the reading gate`.
