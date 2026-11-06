# Brief Codex — passe croisée sur la veille et la relecture du dossier du 02/11/2026 (Hypneum Lab)

## Rôle
Tu es un relecteur indépendant (statistiques, apprentissage automatique, neurosciences computationnelles, bibliométrie). Tu n'as pas participé à la rédaction. Tu vérifies, tu ne réécris pas. Tu ne modifies aucun fichier des dépôts ni des livrables : tu écris un seul fichier, ton rapport.

## Ce que tu relis (chemins relatifs à ton répertoire de travail)
Huit livrables rédigés aujourd'hui par des agents Claude :
- `veille-0211/these-dream-of-kiki.md`, `veille-0211/these-nerve-wml.md`, `veille-0211/these-kiki-flow-research.md`, `veille-0211/these-bouba_sens.md`, `veille-0211/these-micro-kiki.md`, `veille-0211/these-baby-brain.md`, `veille-0211/these-rescience-methodo.md` : pour chaque dépôt, la thèse en une phrase, l'état des hypothèses au 02/11, une veille bibliographique (soumissions 2026-10-24 → 2026-11-02 et sources anciennes non vues), les risques de scoop, les outils, ce qui reste ouvert.
- `veille-0211/dossier-relecture.md` : relecture d'un dossier de présentation du 31/10 (dont le texte intégral n'est pas disponible : il est connu par trois sources documentaires citées en tête du fichier).

Matière pour vérifier (lecture seule) :
- les dépôts clonés : `clones/dream-of-kiki`, `clones/nerve-wml` (branche `docs/n10d-reading-note`), `clones/kiki-flow-research` (branche `docs/nh20-reading-note`), `clones/bouba_sens` (branche `docs/v071-reading-note`), `clones/micro-kiki`, `clones/micro-kiki-quantum`, `clones/baby-brain`, `clones/BabyBrain`, `clones/rescience-nh01`, `clones/paper-methodo-2026`, `clones/.github` (branche `docs/verrou-lecture-2026-11-01` : `docs/ROADMAP.md` v2, `docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`, `docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md`) ;
- le rapport d'analyse du 01/11 : `readme-pr23.md` ; les inventaires `inventory/*.md` et références `inventory/refs/*.md` ;
- les listes d'identifiants déjà cités : `veille-0211/seen-arxiv.txt`, `veille-0211/seen-doi.txt` ;
- le web (recherche activée) pour résoudre les identifiants : page arXiv `https://arxiv.org/abs/<id>`, Crossref `https://api.crossref.org/works/<doi>`, OpenReview, Semantic Scholar. Un User-Agent neutre ; ne transmets aucune adresse e-mail.

## Ce que tu vérifies, pour chaque fichier
1. **Chaque identifiant cité** (arXiv, DOI, OpenReview) existe et porte bien le titre, le premier auteur et la date écrits. Pour les entrées d'impact « Haut » et « Moyen », lis le résumé (ou le PDF si accessible) et dis si l'affirmation que le livrable lui prête est portée par la source. Une source qui ne dit pas cela = MAJEUR ; un identifiant inexistant ou attribué au mauvais article = BLOQUANT.
2. **Dédoublonnage** : une entrée de la section 3 déjà présente dans `seen-arxiv.txt` / `seen-doi.txt` et non marquée « déjà vu, rappelé » ou « ancien, non vu » = MINEUR.
3. **Chiffres et états** repris des dépôts (`path:line`) : ouvre le fichier cité, vérifie le chiffre et la ligne. Chiffre faux = BLOQUANT ; `path:line` absent ou erroné = MAJEUR.
4. **Section 2 (état de la thèse)** : chaque requalification citée existe bien dans `catalogue-v2.md` à la table et à la ligne indiquées, avec le même statut. Statut inventé ou inversé = BLOQUANT.
5. **Verdicts interdits** : les campagnes E1-small, N10-C run 2, Me6, M5 ne reçoivent aucun verdict (ni « confirmé », ni « infirmé », ni « passé ») ; l'expression « verrou passé » n'apparaît nulle part ; aucune hypothèse du labo n'est déclarée confirmée ou infirmée par la seule veille. Violation = BLOQUANT.
6. **Recoupement** : chaque phrase « déjà publié » ou « reste ouvert » est portée par au moins deux sources de nature différente, ou porte « à recouper ». Compte les manquantes par fichier.
7. **Sens et direction** : inversions (supérieur / inférieur, points / pour cent, accepté / rejeté), intervalles mal recopiés, dates fausses.
8. **Scoop manqué** : pour chaque thèse, fais toi-même une à trois recherches (arXiv, OpenReview ICLR 2027, bioRxiv, Semantic Scholar) sur la question centrale de la section 1 et dis si un travail 2025-2026 pertinent manque aux sections 3 et 4. Chaque ajout porte un identifiant que tu as résolu.
9. **Dossier** : pour `dossier-relecture.md`, vérifie que chaque « état au 02/11 » est attesté par la source donnée (ouvre-la), et que chaque « correction proposée » corrige une affirmation réellement documentée dans les trois sources citées en tête du fichier.

## Échelle
BLOQUANT (faux, inventé, verdict interdit) / MAJEUR (vrai mais non porté par la source, non daté, sans `path:line`) / MINEUR (forme, dédoublonnage) / OK (vérifié exact). Si tu ne peux pas vérifier, écris « non vérifiable » et pourquoi (403, 429, PDF absent). N'invente aucun identifiant : chaque identifiant de ton rapport doit avoir été résolu par toi.

## Rapport : `veille-0211/codex/report-astra-0211.md` (en français)
```
# Passe croisée Codex — 02/11/2026
## 0. Verdict par fichier (publiable / après corrections / à refaire) et comptes BLOQUANT / MAJEUR / MINEUR / OK
## 1. BLOQUANT (fichier, ligne, citation exacte, preuve à la source avec URL ou path:line, correction)
## 2. MAJEUR (même format)
## 3. MINEUR
## 4. Scoops manqués (par thèse, identifiant résolu, deux lignes, ligne du catalogue touchée)
## 5. Ce que tu as vérifié sans rien trouver
## 6. Provenance (modèle, requêtes, identifiants revérifiés, durée)
```
Faits et inférences dans des phrases séparées. Ne modifie rien d'autre que ce fichier.
