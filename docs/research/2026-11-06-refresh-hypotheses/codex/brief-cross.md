# Passe croisée — refresh du catalogue des hypothèses Hypneum (2026-11-06)

Tu es un relecteur indépendant (statistiques, apprentissage automatique, neurosciences computationnelles). Tu travailles en français, avec toutes les diacritiques ; les identifiants de code restent en anglais.

## Ce que tu reçois
Un rapport de synthèse et ses annexes, produits ce soir par des agents du laboratoire Hypneum Lab (chercheur indépendant, préregistrations OSF, dépôts GitHub `hypneum-lab/*`) :
- `synthese/rapport.md` : §0 résumé, §1 état par dépôt, §2 constats nouveaux, §3 errata du catalogue v2, §4 analyses, §5 littérature delta, §6 utilité, §7 décisions PI, §8 provenance.
- `synthese/catalogue-v3-delta.md` : propositions garder / reformuler / fermer / rouvrir sur les lignes du catalogue v2 des hypothèses.
- `synthese/nouvelles-hypotheses.md` : nouvelles hypothèses proposées, dédoublonnées, avec nul, contrôle, coût.
- `inventory/*.md` et `veille/*.md` : les six entrées dont la synthèse est tirée, avec les `resolve-*.tsv` (identifiants résolus par API).
- `repos/<repo>/` : clones frais des dépôts (nerve-wml, dream-of-kiki, bouba_sens, kiki-flow-research, micro-kiki, baby-brain, paper-methodo-2026, rescience-nh01). Le catalogue v2 de référence : `dotgithub/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md`.

## Ta tâche : vérifier, pas résumer
Pour chaque **fermeture** proposée dans `catalogue-v3-delta.md`, pour chaque **reformulation**, et pour chaque constat **BLOQUANT** ou **MAJEUR** du §2 du rapport :
1. Ouvre la source citée (`chemin:ligne` dans `repos/`), vérifie que la ligne dit ce que le rapport affirme. Cite la ligne.
2. Dis : **confirmé** / **réfuté** / **nuancé** / **non vérifiable**, avec la preuve.
3. Pour une fermeture : la preuve justifie-t-elle de fermer (erratum, nul calibré, antériorité lue, négatif analysé selon préreg), ou s'agit-il d'une fermeture par lassitude ou par sur-interprétation ?
4. Pour une nouvelle hypothèse (section (i) « posable ce trimestre » de `nouvelles-hypotheses.md` au moins) : est-elle falsifiable telle qu'écrite, son nul est-il calibrable, l'antériorité est-elle réellement absente (cherche, `--search` est actif) ?
5. Vérifie la **direction de chaque compte** du rapport (fermées, reformulées, rouvertes, nouvelles ; « 0 réfuté » n'est pas « 0 confirmé »).
6. Signale ce que le rapport **aurait dû** voir et n'a pas vu : incohérence entre inventaires, hypothèse du catalogue v2 invalidée par une source citée ailleurs dans le rapport mais non reportée, langage confirmatoire sur une campagne sans verrou.

Échelle : BLOQUANT (une fermeture ou une reformulation fausse, un compte inversé) / MAJEUR (preuve insuffisante, antériorité manquée) / MINEUR / OK. Si tu ne peux pas vérifier, dis-le.

## Contraintes
- Ne modifie aucun fichier dans `repos/`, `inventory/`, `veille/`, `synthese/`, `dotgithub/`.
- Écris ton rapport dans `codex/report-astra.md` (ce dossier) : en-tête (modèle, date, durée estimée), tableau des vérifications (élément | source citée | verdict | preuve), liste des constats par sévérité, liste des références que tu as résolues (identifiant | API | titre), et une section « ce que je changerais au rapport » en 10 points maximum.
- Toute référence que tu ajoutes est résolue par API (arXiv, Crossref, OpenReview search) ; aucun identifiant inventé.
