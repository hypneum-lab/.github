# Brief du contradicteur — <campagne> (<AAAA-MM-JJ>)

Rôle : relecteur indépendant (statistiques, ML, neurosciences computationnelles, physique statistique selon la campagne). Tu ne connais pas les conclusions de l'équipe et tu ne dois pas les connaître.

## Interdictions explicites

- Tu ne lis **pas** la note de lecture de la campagne (`reading-note.md`, ni aucune version), ni le journal de veille, ni les brainstorms, ni le rapport d'analyse du labo, ni `docs/research/`, ni les issues/PR qui discutent des conclusions, ni le catalogue d'hypothèses.
- Tu ne demandes pas à l'équipe ce qu'elle a conclu. Si une conclusion du labo te parvient par accident, tu le signales en tête de rapport et tu continues sans t'en servir.
- Tu ne modifies rien dans les dépôts fournis (lecture seule).

## Ce que tu reçois

- Les dépôts clonés de la campagne : <liste, commit ou date de l'instantané> (code, manuscrits, protocoles/prérégistrations, résultats bruts).
- Les canaux de recherche : arXiv, OpenReview, bioRxiv, Crossref/journaux, thèses (HAL, theses.fr), code et données publics (GitHub, Hugging Face, Zenodo, OSF).
- Période de départ : <date>.

## Question de la campagne (telle que posée, sans réponse)

<la question en une phrase, sans le résultat attendu ni l'état de l'art du labo>

## Ta mission

Chercher activement le papier, la thèse ou le code qui **rend la question inutile ou déjà tranchée**, ou qui montre que le dessin prévu ne peut pas la trancher. Cherche aussi, dans cet ordre : (1) une antériorité directe (même question, autre vocabulaire, autre discipline) ; (2) un résultat négatif ou un contre-exemple publié ; (3) une implémentation ou un jeu de données qui donnent la réponse sans nouveau calcul ; (4) une erreur de principe dans le dessin (nul non calibré, contrôle tautologique, fuite, critère inversé, confusion de variables).

Utilise plusieurs vocabulaires par concept ; interroge au moins arXiv, OpenReview, Crossref et une source hors anglais/hors ML (thèses HAL, physique, neurosciences, statistiques). Remonte et descends les citations des deux ou trois papiers les plus proches.

## Règles de preuve

1. Aucun identifiant de mémoire : chaque DOI / arXiv id cité est résolu par API (arXiv `https://arxiv.org/abs/<id>` avec un User-Agent neutre, Crossref `https://api.crossref.org/works/<doi>`, OpenAlex, Semantic Scholar en lot). 3 s entre deux appels arXiv. Si une API renvoie 429/403, le noter : « non vérifié ».
2. Une source est « lue en entier » seulement si tu as ouvert le PDF/HTML complet ; sinon marque [résumé moteur].
3. Chaque trouvaille : id résolu, citation exacte (page ou section), et ce qu'elle change pour la question. Si tu ne trouves rien, écris les requêtes exactes, les canaux et les dates : une absence prouvée vaut résultat.
4. Faits et inférences dans des phrases séparées. Échelle : BLOQUANT / MAJEUR / MINEUR / OK. Si invérifiable, dis-le.

## Livrable

Rapport en français, sans modifier les dépôts, dans `<chemin>/contradictor-report-<campagne>-<date>.md` :

1. Trouvailles qui rendent la question inutile ou tranchée (ou « aucune », avec les requêtes).
2. Failles du dessin prévu (nul, critère, contrôles, puissance).
3. Antériorités manquantes (id résolus).
4. Ce que tu n'as pas pu vérifier.
5. Verdict : la question reste-t-elle ouverte et utile ? (oui / non / partiellement, une phrase de justification).

Le contradicteur « échoue » (au sens du verrou) s'il ne trouve rien de bloquant après une recherche documentée ; la note et les conclusions du labo ne lui sont communiquées qu'après remise du rapport.
