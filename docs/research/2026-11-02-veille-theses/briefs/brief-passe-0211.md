# Brief commun — passe « dossier, thèses, veille avec relecture » (02/11/2026, 19:10 CET)

Demande du PI (02/11 19:02) : « dossier et thèse et veille scientifique avec relecture ». Une passe par thèse du laboratoire, une passe sur le dossier de présentation v3, puis une relecture indépendante de l'ensemble. Rien n'est lancé sur une machine de calcul, aucun verdict n'est écrit, aucune préreg n'est modifiée.

Racine : `/private/tmp/claude-501/-Users-electron/43b1fc75-d228-454b-8163-940c5a36373f/scratchpad/`

## À lire d'abord, en entier
1. `brief-verrou-commun.md` (règles absolues 1-8 : identifiants résolus par API avant d'être écrits, User-Agent neutre « hypneum-lab reading-gate », JAMAIS l'adresse e-mail du PI, 3 s entre deux appels arXiv, « [résumé moteur] » si le PDF n'est pas ouvert, ≥ 2 sources de nature différente sinon « à recouper », aucun verdict sur E1-small / N10-C run 2 / Me6, aucun tag, aucun calcul sur KXKM / macM1 / GrosMac, préregs intouchées, fichiers écrits avec l'outil Write, français dans les documents).
2. `/Users/electron/.claude/skills/hypneum-veille/SKILL.md` (axes R1-R11, format d'entrée, sections obligatoires, pièges).
3. `clones/.github/docs/superpowers/specs/2026-11-01-verrou-lecture-plan-trimestre-design.md` §4 (le verrou) et §6 (table des requalifications).
4. `clones/.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` : lis les lignes de TON dépôt dans les tables C, A et B (`grep -n "<dépôt>"`).
5. `inventory/<dépôt>.md` et `inventory/refs/<dépôt>-refs.md` (relecture du 01/11 et références déjà vérifiées).

## Dédoublonnage (obligatoire avant d'écrire une entrée)
- `veille-0211/seen-arxiv.txt` (3 371 identifiants arXiv déjà cités dans `.github/docs/research/` toutes branches, les veilles du 31/10 et 01/11, les inventaires et les notes de lecture).
- `veille-0211/seen-doi.txt` (2 837 DOI, même périmètre).
Un identifiant présent dans ces listes n'est repris que s'il a été accepté, révisé ou rétracté depuis, ou s'il tranche une ligne de la section 2 (alors marqué « déjà vu, rappelé »).

## Fenêtre et canaux
Fenêtre principale : soumissions du 2026-10-24 au 2026-11-02 (la dernière veille complète par axes date du 24/10 ; celles du 31/10 et 01/11 étaient ciblées). Une source plus ancienne absente des listes et qui tranche une ligne de ta thèse peut entrer, marquée « ancien, non vu ».
Canaux à interroger, requêtes exactes consignées dans le journal :
- arXiv API `search_query` (3 s entre appels) ; `id_list` pour vérifier.
- OpenReview `https://api2.openreview.net/notes?content.venueid=ICLR.cc/2027/Conference/Submission&...` et `?term=` ; si le PDF renvoie 403, noter « non vérifié » et chercher la version arXiv du même titre.
- bioRxiv `https://api.biorxiv.org/details/biorxiv/2026-10-24/2026-11-02/<cursor>` filtré par mots-clés.
- Semantic Scholar UNIQUEMENT en lot via `/Users/electron/.claude/skills/semantic-scholar/scripts/s2.py` (`python3 s2.py lookup ...`), jamais un GET par identifiant ; 429 → attendre, noter.
- Code et données : `gh search repos "<mots>" --sort updated --limit 20 --json fullName,pushedAt,stargazersCount,license`, Hugging Face `/api/models?search=` et `/api/datasets?search=`, Zenodo `https://zenodo.org/api/records?q=<mots>&sort=mostrecent`, OSF `https://api.osf.io/v2/registrations/?filter[title]=<mots>`.
- Outils fournis : `clones/.github/scripts/resolve_ids.py <fichier.md>` (sortie `id\tok|ko\ttitre\tauteur`, code de retour = nombre de ko) et `clones/.github/scripts/citation_snowball.py --ids <id,...> --depth 1 --out <tsv>`.
Téléchargements (PDF, JSON) : dans un sous-dossier vide `veille-0211/dl-<dépôt>/`, scripts ailleurs, `python3 -I` pour tout script qui les lit.

## Livrable par thèse : `veille-0211/these-<dépôt>.md`
```
# <Dépôt> — thèse, veille et relecture (2026-11-02)
Fenêtre, requêtes (résumé), bruts → dédoublonnés → gardés, sources lues en entier / en résumé.
## 1. La thèse en une phrase, telle que le dépôt la formule (path:line du README ou du manuscrit)
## 2. État de la thèse au 02/11
Tableau : affirmation | statut 24/10 | requalification 01/11 (catalogue v2, table et ligne) | ce que la veille du 02/11 change (confirme / infirme / dépasse / rien) | source résolue
## 3. Veille 02/11 par axe R (format hypneum-veille : id, date, titre, premier auteur, 2 lignes, → Hypneum : verdict, impact Haut / Moyen / Info)
## 4. Hypothèses déjà faites ailleurs (risque de scoop), avec la ligne du catalogue touchée
## 5. Outils ou jeux de données à adopter
## 6. Ce qui reste ouvert et le prochain pas sous le verrou (pas de run : un dessin, un coût en heures, une lecture)
## 7. Non vérifié / inaccessible
## 8. Journal (requêtes exactes avec date-heure, compte brut → dédup → gardé, identifiants résolus / échoués, fichiers téléchargés)
```
Règles : chaque identifiant écrit est résolu ; `python3 -I clones/.github/scripts/resolve_ids.py veille-0211/these-<dépôt>.md` doit sortir 0 ko (garde la sortie dans `veille-0211/resolve-these-<dépôt>.tsv`) ; faits et inférences dans des phrases séparées ; jamais « verrou passé », jamais de verdict sur une campagne ; chiffres repris avec leur `path:line`.

## Fin
Rien à committer : les fichiers restent dans `veille-0211/`, la session les assemble et ouvre la PR. Rapport final ≤ 250 mots : fichier produit (chemin absolu), canaux interrogés, bruts / dédup / gardés, lues en entier / en résumé, identifiants résolus / échoués, les 3 entrées qui changent le plus pour la thèse, ce qui n'a pas pu être fait.
