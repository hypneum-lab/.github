# Brief — relecture du dossier de présentation v3 au 02/11/2026

Lis d'abord en entier `veille-0211/brief-passe-0211.md` et `brief-verrou-commun.md` (même racine). Les règles absolues s'appliquent : aucun identifiant de mémoire, aucun verdict sur E1-small / N10-C run 2 / Me6, aucun SSH vers une machine de calcul, aucune préreg touchée, fichiers écrits avec Write, français.

## Objet
Le « Dossier de présentation et demande de ressources (v3, 31 octobre 2026) » est un Claude Doc (rev 101) que cette session ne peut pas ouvrir. Son contenu est connu par trois sources, à lire en entier :
1. `/Users/electron/.claude/projects/-Users-electron/memory/project_hypneum_manifeste_v3_2026_10_31.md` (description des sections 1-12, corrections appliquées, 8 arbitrages du PI, engagements envers des tiers, plan semaine 1-2).
2. `/Users/electron/Documents/Projets/hypneum-next-handoff-2026-10-31/verif/tracking-astra-v3.md` §6 « liste finale des corrections » (texte avant / après des 40 corrections) et §5 (questions d'un rapporteur).
3. `/Users/electron/Documents/Projets/hypneum-next-handoff-2026-10-31/verif/relecture-suite-2026-10-31.md` et `README.md` du même dossier.

Depuis le 31/10, le laboratoire a produit (à lire, c'est la matière de ta relecture) :
- l'analyse profonde du 01/11 : rapport `readme-pr23.md` (racine du scratchpad ; = README de la PR .github #23, 19 constats BLOQUANT, errata, 11 décisions PI) ;
- la conception du verrou de lecture et le plan du trimestre : `clones/.github/docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md` (185 h, ordre N10-D → bouba v0.7.1 → NH-20, §6 requalifications, §7 jalons) ;
- la roadmap v2 validée par le PI le 01/11 21:50 : `clones/.github/docs/ROADMAP.md` ; le catalogue v2 : `clones/.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` (en-tête et table C suffisent, plus la ligne NH-91) ;
- les notes de lecture : `clones/nerve-wml/docs/prereg/n10-d/reading-note.md` (v0.3, concurrent ICLR `hukTsKYu8Y` lu en entier ; cherche le dossier exact avec `ls clones/nerve-wml/docs/prereg/`), `clones/bouba_sens/docs/prereg/actionsense-v0.7/reading-note.md` (v0.2), `clones/kiki-flow-research/docs/prereg/nh20/reading-note.md` (v0.2) ;
- l'état des machines au 01/11 18:10 : `inventory/compute-status.md` (ne pas remettre à jour par SSH ; dire « au 01/11 18:10 ») ;
- l'état GitHub du jour : `gh pr list -R hypneum-lab/<dépôt> --state all --limit 30` et `gh issue list` pour .github, nerve-wml, bouba_sens, kiki-flow-research, dream-of-kiki, micro-kiki, baby-brain, rescience-nh01, paper-methodo-2026 (lecture seule).

## Livrable : `veille-0211/dossier-relecture.md`
```
# Dossier v3 — relecture au 02/11/2026
Sources lues (liste), limite : le texte intégral du doc n'a pas été ouvert, la relecture porte sur son contenu tel que documenté le 31/10.
## 1. Affirmations du dossier à corriger
Tableau : section du dossier | affirmation (telle que documentée, avec sa source parmi les trois) | état au 02/11 | source qui tranche (path:line ou identifiant résolu) | correction proposée (texte prêt à coller) | gravité BLOQUANT / MAJEUR / MINEUR
## 2. Ce que le dossier doit ajouter (verrou de lecture, roadmap v2, 185 h, concurrent hukTsKYu8Y, NH-91, PR ouvertes), avec pour chaque ajout la section cible et un paragraphe prêt à coller
## 3. Ce que le dossier promettait et qui a bougé (engagements E1-E6, plan semaine 1 : fait / pas fait / inconnu, source)
## 4. Cohérence avec la demande de ressources (2 000 h A100 ; le trimestre v2 ne lance aucune campagne GPU avant S6 : dire ce que cela change pour les guichets GENCI / EuroHPC / constructeur / labo, sans décider)
## 5. Questions au PI (QCM prêts, option recommandée en premier)
## 6. Provenance (fichiers lus, commandes gh, ce qui n'a pas pu être vérifié)
```
Gravité : BLOQUANT = chiffre ou affirmation fausse au 02/11 ; MAJEUR = vraie mais périmée ou incomplète ; MINEUR = forme. Faits et inférences dans des phrases séparées. Tout identifiant écrit est résolu ; `python3 -I clones/.github/scripts/resolve_ids.py veille-0211/dossier-relecture.md` doit sortir 0 ko.

## Fin
Rien à committer. Rapport final ≤ 250 mots : fichier (chemin absolu), nombre de corrections par gravité, les 3 plus importantes, ce qui n'a pas pu être vérifié.
