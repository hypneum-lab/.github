# Brief commun — refresh du catalogue des hypothèses Hypneum (2026-11-06, soir)

Demande du PI (18:53 CET) : « refais une analyse avec la veille scientifique, les relectures et les hypothèses, et reformule : les nouvelles à poser, celles à fermer ».

## Baseline (lecture seule, déjà clonée)
- `.github` clone : `/private/tmp/claude-501/-Users-electron/a95571c0-eed8-48a6-93c0-5a0478ec873e/scratchpad/dotgithub-review/` (main c8967a2).
  - **Catalogue v2 (fait foi)** : `docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` (349 l.) : table C (20 requalifications §6 spec, l. 28-52), table A (180 lignes maîtresse du 24/10 + requalifications, l. 53-238), table B (NH-01…NH-91, l. 239-334), addendum 02/11 (l. 335+). Étiquettes : réplication inter-substrats | exploratoire | non-test | artefact plausible | rapport technique | clos par erratum | utile, sous verrou | reporté après M3 | reformulé | inchangé.
  - Revue 24/10 : `docs/research/2026-10-24-revue-hypotheses/synthese/01-table-maitresse-hypotheses.md`, `02-catalogue-nouvelles-hypotheses.md` (colonnes d'origine, verdicts).
  - Analyse profonde 01/11 : `docs/research/2026-11-01-analyse-profonde/README.md` (§2 constats B/M, §3 errata, §5 littérature) et `inventaires/<repo>.md`.
  - Veille thèses 02/11 : `docs/research/2026-11-02-veille-theses/` (`these-<repo>.md`, `relecture-0211.md`, `resolve-*.tsv`).
  - Roadmap v2.1 : `docs/ROADMAP.md` (principe 6 verrou de lecture ; Q8 « les deux » ; point de reprise).
- **Nouveautés du 03-06/11 à intégrer** (GitHub, org hypneum-lab, `gh`) :
  - nerve-wml : contradicteur aveugle N10-D + vérifications (`master:docs/n10d/contradictor-2026-11-06/` : SYNTHESE.md, VERIFICATION.md, verification-*.md) ; protocole N10-D réconcilié (PR #100 brouillon, tête 324ec10 : `docs/prereg/n10d/protocol.md` §8-9, `analysis-4-points-2026-11-06.md`) ; tour de veille 1 N10-D (PR #116 brouillon, `docs/prereg/n10d/veille/tour-1-2026-11-06.md`, 17 entrées) ; clôture N10-C run 2 graine 0 (PR #105/#107/#109, `docs/n10c-closure-20261105*`) ; plan N10-C-bis 3 graines (PR #114 brouillon) ; ADR-0003 exception verrou P1bis/P8c (PR #118) ; mKNN issue #110 / PR #117.
  - dream-of-kiki : analyse E1-small selon préreg (PR #91 fusionnée 06/11 14:04), H14-B signée (#88), contrôles addendum (#92 brouillon, KXKM, fin 07-08/11), NH-91.
  - bouba_sens : défauts physio phase 2 (#72, PR #82 brouillon) et phase 1 (#74, PR #75 fusionnée, recalcul B-2 PR #81), note v0.7.1 (#68 fusionnée), Me6 large-n (#66 brouillon), erratum #67.
  - kiki-flow-research : note NH-20 Lie/Strang (#61 fusionnée), bannière superseded (#64 fusionnée), M5 failed + rejeu 10/38 (01/11).
  - micro-kiki : erratum routeur E-2026-10-25-03, #34 fusionnée ; baby-brain #291 fusionnée ; paper-methodo-2026 #4.

## Règles
- Tout chiffre et toute affirmation : relus à la source, cités `chemin:ligne` (clone frais `git clone --depth 200 https://github.com/hypneum-lab/<repo>` dans ton propre sous-dossier du scratchpad ; les copies `~/Documents/Projets/` sont périmées). GitHub via `gh`, jamais Gitea. Zéro compute local hors arithmétique légère ; aucune exécution du code des dépôts.
- Identifiants (arXiv, DOI, OpenReview) : résolus par API (`export.arxiv.org/api/query?id_list=`, `api.crossref.org/works/`, `api2.openreview.net/notes/search`), fichier `resolve-<repo>.tsv` ; un identifiant non résolu est marqué et ne tranche rien.
- Hypneum rules : lab = « Hypneum Lab », framework = « GENIAL » ; aucun langage confirmatoire sur ce qui n'a pas passé le verrou ; une hypothèse « fermée » doit l'être par une preuve (erratum, nul calibré, antériorité lue, résultat négatif analysé selon préreg), pas par lassitude ; une hypothèse « nouvelle » doit être falsifiable, avec son nul, son contrôle, et un coût d'ordre de grandeur ; une « reformulation » garde l'identifiant et dit ce qui change (portée, nature, précondition).
- Faits et inférences dans des phrases séparées. Français, diacritiques complets, identifiants techniques inchangés. Sévérité des constats nouveaux : BLOQUANT / MAJEUR / MINEUR / OK.

## Format de sortie par dépôt (`inventory/<repo>.md`, ≤ 400 lignes)
1. **Lignes du catalogue touchées par ce dépôt** (tables A, B, C) : identifiant | statut v2 | **proposition** (garder / reformuler / fermer / rouvrir) | nouvel énoncé si reformulé | preuve (chemin:ligne, identifiant résolu) | ce que ça change au trimestre (heures, verrou, calcul).
2. **Nouvelles hypothèses à poser** (NH-92 et suivantes, numérotation provisoire préfixée par le dépôt pour éviter les collisions, ex. NWML-N1) : énoncé falsifiable, nul, contrôle, substrat, coût, source qui la motive (veille/relecture du 03-06/11), lien avec une ligne existante.
3. **À fermer** : identifiant, preuve, ce que l'on peut encore en dire publiquement (négatif publiable ?).
4. **Constats nouveaux** depuis le 02/11 (sévérité, chemin:ligne).
5. **Résumé ≤ 250 mots** à me rendre en fin de tâche.
