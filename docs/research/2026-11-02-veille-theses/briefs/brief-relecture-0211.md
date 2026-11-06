# Brief — relecture indépendante de la passe du 02/11 (dossier, thèses, veille)

Tu es le relecteur à contexte vierge. Tu n'as pas participé à la rédaction. Tu lis d'abord en entier `brief-verrou-commun.md` et `veille-0211/brief-passe-0211.md` (racine `/private/tmp/claude-501/-Users-electron/43b1fc75-d228-454b-8163-940c5a36373f/scratchpad/`), puis les huit livrables :
`veille-0211/these-{dream-of-kiki,nerve-wml,kiki-flow-research,bouba_sens,micro-kiki,baby-brain,rescience-methodo}.md` et `veille-0211/dossier-relecture.md`.

## Ce que tu vérifies, à la source, pour chaque fichier
1. **Identifiants** : relance `python3 -I clones/.github/scripts/resolve_ids.py <fichier>` ; pour un échantillon de 5 entrées par fichier (les 3 d'impact Haut + 2 au hasard), ouvre la page arXiv / Crossref et vérifie titre, premier auteur, date, et que le résumé dit bien ce que l'entrée lui fait dire. Une entrée dont le résumé ne porte pas l'affirmation = constat MAJEUR.
2. **Dédoublonnage** : chaque identifiant de la section 3 est absent de `veille-0211/seen-arxiv.txt` / `seen-doi.txt`, ou marqué « déjà vu, rappelé » / « ancien, non vu ». Sinon MINEUR.
3. **Verdicts interdits** : aucun verdict sur E1-small, N10-C run 2, Me6, M5 ; jamais « verrou passé » ; aucune phrase qui déclare une hypothèse confirmée ou infirmée par la veille seule (la veille confirme ou infirme une ligne « déjà publié », pas un résultat du labo). Toute violation = BLOQUANT.
4. **Recoupement** : chaque phrase « déjà publié » / « reste ouvert » tient par ≥ 2 sources de nature différente ou porte « à recouper ». Compte les manquantes.
5. **Chiffres** : tout chiffre repris du rapport ou d'un dépôt porte un `path:line` ; vérifie 3 chiffres par fichier dans les clones (`clones/<dépôt>`). Un chiffre faux = BLOQUANT ; sans source = MAJEUR.
6. **Section 2 (état de la thèse)** : les requalifications citées correspondent bien aux lignes du `catalogue-v2.md` (table et ligne) ; un statut inventé = BLOQUANT.
7. **Dossier** : pour `dossier-relecture.md`, vérifie que chaque « affirmation du dossier » est bien attestée par l'une des trois sources du 31/10 citées (mémoire, tracking-astra-v3 §6, relecture-suite) et que l'« état au 02/11 » est attesté par la source donnée (ouvre-la). Une correction qui corrigerait une phrase que le dossier ne contient pas = MAJEUR.
8. **Sens et direction** : inversions (« rejeté » / « accepté », « supérieur » / « inférieur »), pourcentages contre points, intervalles mal recopiés.
9. **Scoop** : les sections 4 ne manquent-elles pas une entrée évidente que tu trouves en 10 minutes (une requête arXiv par thèse, 3 s entre appels, User-Agent neutre « hypneum-lab reading-gate », jamais l'adresse e-mail du PI) ? Ajoute-la en constat avec son identifiant résolu.

## Livrable : `veille-0211/relecture-0211.md`
```
# Relecture indépendante — passe du 02/11
## 0. Verdict d'ensemble (10 lignes : publiable tel quel / après corrections / à refaire, par fichier)
## 1. Constats BLOQUANT (fichier, ligne, citation, preuve à la source, correction proposée)
## 2. Constats MAJEUR (même format)
## 3. Constats MINEUR (liste courte)
## 4. Vérifications faites qui n'ont rien trouvé (pour que le PI sache ce qui a été regardé)
## 5. Provenance (fichiers lus, requêtes, identifiants revérifiés, durée)
```
Faits et inférences dans des phrases séparées. Tu ne modifies aucun des huit fichiers. Aucun calcul, aucun SSH, aucun verdict de campagne. Rapport final ≤ 250 mots : fichier (chemin absolu), comptes BLOQUANT / MAJEUR / MINEUR par fichier, les 3 constats les plus graves.
