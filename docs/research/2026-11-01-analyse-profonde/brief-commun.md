# Brief commun — analyse profonde Hypneum Lab (2026-11-01, 18:10 CET)

Tu es un relecteur scientifique indépendant (statistiques, ML, neurosciences computationnelles, physique statistique). Le PI (Hypneum Lab, un chercheur indépendant) demande une **analyse profonde des travaux**, avec insistance sur : **lire les papiers eux-mêmes, aller chercher les références citées et les prépublications voisines**.

## Règles
- Clones FRAIS dans `/private/tmp/claude-501/-Users-electron/43b1fc75-d228-454b-8163-940c5a36373f/scratchpad/clones/<repo>` (SHA en tête de ton rapport : `git -C <repo> rev-parse HEAD`). Ne modifie RIEN dans les clones.
- Baseline à lire APRÈS avoir formé ton propre avis : `clones/.github/docs/research/2026-10-30-etat-des-lieux/README.md` (revue du 30/10) et `clones/.github/docs/research/2026-10-24-revue-hypotheses/README.md`. Ton livrable est le **delta** : ce qui est nouveau, ce que la baseline a mal dit, ce qu'elle a raté. Ne recopie pas ses constats ; cite-les par numéro si tu les confirmes/infirmes.
- Chaque fait cité = `path:line` dans le clone. Chaque chiffre relu à la source (jamais depuis la baseline).
- Faits et inférences dans des phrases séparées. Sévérité : BLOQUANT / MAJEUR / MINEUR / OK. Si non vérifiable, dis-le.
- Écriture en français ; termes techniques et identifiants en l'état.
- Compute : zéro job lourd local (GrosMac 16 Go) ; pas de SSH vers les hôtes de campagne sauf si ton brief le dit (lecture seule).
- Pas d'accès web hors appels API de vérification bibliographique (arXiv export API, Crossref, Semantic Scholar via `~/.claude/skills/semantic-scholar/scripts/s2.py lookup` en batch, OpenReview, bioRxiv, HF papers). Respecte 3 s entre appels arXiv. Si le skill s2.py n'existe pas ou échoue, utilise l'API Crossref/arXiv directement avec curl et dis-le.

## Livrable : `inventory/<repo>.md` (chemin absolu donné dans ton brief), structure imposée
0. En-tête : repo, SHA, fichiers lus (liste), durée approximative.
1. **État des lieux** (≤ 15 lignes) : objet scientifique, papiers présents (titre, version, longueur, état : brouillon/soumis/déposé), hypothèses actives, campagnes en cours ou récentes.
2. **Lecture des papiers** : pour chaque manuscrit (tex/md/pdf) — thèse centrale, résultats revendiqués (chiffres exacts, path:line), ce que le code/les résultats du dépôt supportent réellement (code≠texte, prereg modifiée après coup, fuites, nuls non calibrés, contrôles tautologiques, erreurs de signe/inversions), qualité de l'argument mathématique (dérivations vérifiées à la main si courtes : dis lesquelles tu as vérifiées).
3. **Vérification des références** : construis la liste complète des entrées .bib / références inline ; pour CHAQUE entrée : (a) existe-t-elle (DOI/arXiv résolu par API, pas de mémoire) ; (b) auteurs/année/venue corrects ; (c) l'affirmation qui lui est attribuée dans le texte est-elle bien dans ce papier (lis l'abstract au minimum ; pour les 5–10 références porteuses, lis plus loin via arXiv abs/HTML) ; (d) références manquantes évidentes (antériorités non citées, prépublications 2025-2026 qui font la même chose). Produis un tableau `inventory/refs/<repo>-refs.md` : clé | DOI/arXiv résolu | statut (OK / introuvable / mauvaise attribution / attribution douteuse / année-venue fausse) | note courte. Donne les comptes.
4. **Analyses** : ordres de grandeur, puissance statistique, capacité/complexité, ce qu'un rapporteur de revue dirait en 3 points ; positionnement vs littérature (quelle est la contribution réellement neuve une fois les références lues).
5. **Suppositions** implicites du travail (listées, avec le risque si fausse).
6. **Pistes d'utilité** : ce qui est publiable tel quel (y compris les négatifs), ce qu'il faut arrêter, ce qui manque pour une soumission.
7. **Constats classés** BLOQUANT → OK, chacun avec path:line, « nouveau vs baseline » ou « confirme/infirme baseline #n ».

Renvoie-moi dans ta réponse finale un résumé ≤ 250 mots : comptes (constats par sévérité, références OK/KO), les 3 points les plus importants, ce que tu n'as pas pu vérifier.

## EXIGENCE DU PI (ajoutée 18:06) : « il faut lire le contenu des papiers ! »
Lis le texte INTÉGRAL de chaque manuscrit (fichiers .tex / .md ; pour un .pdf sans source, `pdftotext -layout` puis lecture). Pas de lecture d'abstract seule, pas de survol. Dans la section 2 du rapport, ajoute pour chaque papier un **condensé section par section** (une ligne par section : ce qu'elle affirme, ce qu'elle prouve, ce qui manque), puis la liste des **équations/théorèmes/figures clés** avec ton verdict (vérifié / plausible / faux / invérifiable). Cite les lignes du .tex. Un relecteur qui n'a pas lu le papier entier ne peut pas rendre ce rapport.

## EXIGENCE DU PI (18:07) : le groupe de Rome (Sapienza/Salento : Agliari, Barra, Fachechi, Alemanno, Aquaro, Albanese, Alessandrelli, Lepre…) a plusieurs papiers « à utiliser et à citer »
La veille du 01/11 (21 identifiants résolus) est dans `/private/tmp/claude-501/-Users-electron/43b1fc75-d228-454b-8163-940c5a36373f/scratchpad/veille/rome-2026-11-01.md`. Pour chaque manuscrit que tu relis : (a) lesquels de ces papiers de Rome devraient être cités et où (section/ligne du .tex) ; (b) lesquels le sont déjà (dream-of-kiki a fusionné le 01/11 des citations Crick-Mitchison 1983, Hopfield-Feinstein-Palmer 1983, Fachechi-Agliari-Barra 2019 : vérifie qu'elles sont correctes) ; (c) lesquels **contredisent ou devancent** un résultat revendiqué (ex. spécialisation modulaire spontanée 2501.16789 vs nul kiki-flow ; recuit partiel 2605.10304 vs « le rêve a une formule propre » NH-01 ; rêve appris = ridge+early-stopping 10.1016/j.neunet.2024.106389). Lis les abstracts via l'API arXiv (et le texte HTML arXiv pour les 3–4 les plus pertinents à ton dépôt).
