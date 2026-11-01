# Journal des tours de veille — <campagne>

> Un bloc par tour. Les requêtes sont écrites telles que lancées (copiables). Tout id gardé est résolu par `scripts/resolve_ids.py`. Si une API renvoie 429/403, le noter et marquer « non vérifié ».

## Tour <n> — <AAAA-MM-JJ>

- **Canaux interrogés** (parmi arXiv / OpenReview / bioRxiv / Crossref-journaux / thèses-HAL / code-données) : …
- **Requêtes exactes** :
  - <canal> : `<requête>` (filtres, dates)
- **Comptes** : brut <n> → dédoublonné <n> → gardé <n>
- **Entrées gardées** :

  | id résolu | auteurs, année | titre | pourquoi gardé | statut de lecture (entier / [résumé moteur]) |
  |---|---|---|---|---|
  | | | | | |

- **Snowball** : sources de départ, fichier TSV (`scripts/citation_snowball.py`), entrées amont/aval retenues.
- **Ce que le tour a changé dans la note** : sections touchées, phrases ajoutées/retirées/marquées « à recouper ».
- **Saturation** : entrées nouvelles pertinentes ce tour : <n>.
