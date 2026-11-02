# Relecture indépendante — passe du 02/11

Relecteur à contexte vierge, 02/11/2026, 19:50-20:40 CET environ. Les huit livrables n'ont pas été modifiés. Aucun calcul, aucun SSH, aucun verdict de campagne. Racine : `/private/tmp/claude-501/-Users-electron/43b1fc75-d228-454b-8163-940c5a36373f/scratchpad/` ; chemins relatifs à `veille-0211/` sauf mention. Catalogue : `clones/.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` (table C l.28-51, table A l.53-238, table B l.239-333).

## 0. Verdict d'ensemble

| Fichier | BLOQUANT | MAJEUR | MINEUR | Verdict |
|---|---:|---:|---:|---|
| `these-dream-of-kiki.md` | 2 | 2 | 0 | publiable après corrections (formulation de deux lignes « → Hypneum ») |
| `these-nerve-wml.md` | 1 | 1 | 1 | publiable après corrections (une ligne + une entrée manquée) |
| `these-kiki-flow-research.md` | 0 | 0 | 1 | publiable tel quel |
| `these-bouba_sens.md` | 0 | 2 | 2 | publiable après corrections de forme |
| `these-micro-kiki.md` | 0 | 0 | 1 | publiable tel quel |
| `these-baby-brain.md` | 1 | 0 | 1 | publiable après corrections (une ligne) |
| `these-rescience-methodo.md` | 0 | 1 | 1 | publiable après corrections de forme |
| `dossier-relecture.md` | 0 | 2 | 0 | publiable après correction des renvois de lignes ; le fond est attesté |

Aucun fichier n'est à refaire. Aucun chiffre faux n'a été trouvé (24 chiffres vérifiés dans les clones). Aucun statut du catalogue n'a été inventé. Les quatre BLOQUANT sont des formulations « confirme / infirme » appliquées à une hypothèse du labo ; chacune se corrige en une phrase.

## 1. Constats BLOQUANT

**B1 — `these-baby-brain.md:39`.**
- Citation : « → Hypneum : **infirme** la prémisse de Claim A (`draft` §1) au niveau « curriculum de données » ».
- Preuve : Claim A est une hypothèse du labo, non testée (catalogue l.193, BB-01 « non testé »). Le résumé de QFw0sg52VV (API `notes/search`, 02/11) dit « none of these factor-wise curricula improved downstream classification performance compared with a stable training corpus ». Il établit un résultat externe. Il ne réfute pas une prémisse d'une hypothèse que le labo n'a pas testée. La règle 3 du brief l'interdit.
- Correction proposée : « → Hypneum : **déjà publié (résultat négatif externe)** : des curricula de données « développementaux » factoriels n'apportent pas de gain (QFw0sg52VV). Claim A n'est pas testée et cette source ne la teste pas ; elle interdit d'écrire « les stades aident » sans la citer. Impact : Haut. »

**B2 — `these-dream-of-kiki.md:45`.**
- Citation : « → Hypneum : **confirme** NH-04 en partie (`catalogue-v2:246`, sommeil sur règle STDP) ».
- Preuve : NH-04 est une hypothèse du labo (catalogue l.246 : « L'effet d'une phase sommeil dépend de la classe de règle d'apprentissage (STDP vs surrogate) »). Le dépôt Zenodo 10.5281/zenodo.23779408 (DataCite, relu le 02/11) n'a pas de bras surrogate. Le §4 du même fichier (l.72) le dit lui-même : « pas de bras surrogate ».
- Correction proposée : « → Hypneum : **antériorité partielle** de NH-04 (sommeil ciblé sur STDP sans données, préenregistré) ; ne compare pas STDP et surrogate, donc ne dit rien de NH-04 elle-même. »

**B3 — `these-dream-of-kiki.md:39`.**
- Citation : « → Hypneum : **confirme** l'idée 1 du brainstorm […] et NH-01 (« rêve ≠ shrink uniforme », `catalogue-v2:243`) ».
- Preuve : NH-01 est une hypothèse du labo (catalogue l.243), avec un résultat propre (C1 3,86, `clones/rescience-nh01/article/metadata.yaml:63`) que le rapport du 01/11 a requalifié (B21). Le résumé de Kubo et al. (Crossref, DOI 10.64898/2026.10.11.757684, relu) porte sur des réseaux récurrents entraînés par Equilibrium Propagation, pas sur le noyau de Hopfield de NH-01. « Confirme l'idée 1 » (un contrôle de dessin) est recevable ; « confirme NH-01 » ne l'est pas.
- Correction proposée : « → Hypneum : **déjà publié** : le contrôle « même changement total réparti uniformément » existe et abolit l'effet du sommeil ciblé (Kubo et al.) ; à reprendre pour H14-B (idée 1) et à citer pour NH-01, dont il ne teste pas le noyau. »

**B4 — `these-nerve-wml.md:83`.**
- Citation : « → Hypneum : **confirme** — Claim B, mKNN, NH-45. **Impact : Haut** ».
- Preuve : NH-45 est une hypothèse du labo (catalogue l.287 : « Le « 18,8× » du test (6) est un artefact : nul « non entraîné » déjà ≥ 0,05 »). Elle n'a jamais été calculée ; le fichier le dit lui-même l.103 (« jamais exécuté »). Le résumé de arXiv:2512.18792 (API arXiv, relu) établit que les méthodes d'interprétabilité produisent des explications plausibles sur des réseaux à poids aléatoires ; il ne mesure rien sur nerve-wml.
- Correction proposée : « → Hypneum : **outil réutilisable / norme publiée** : le nul « réseau randomisé » est le contrôle que demandent la requalification de Claim B et du mKNN, et que NH-45 prévoit sans l'avoir exécuté. Impact : Haut. »

## 2. Constats MAJEUR

**M1 — `dossier-relecture.md:6, 31-32, 34, 72, 80, 84, 133` (renvois [MEM]).**
- Citation : « [MEM] en entier (96 lignes) » (l.133) ; renvois « [MEM] l.49 », « l.64 », « l.69 », « l.73 », « l.75, l.94 ».
- Preuve : `/Users/electron/.claude/projects/-Users-electron/memory/project_hypneum_manifeste_v3_2026_10_31.md` compte 59 lignes (`wc -l`), modifié le 01/11 09:38, donc avant la relecture. Les lignes 64 à 94 n'existent pas. Le fond est attesté à d'autres lignes : note Zenodo « superseded » aux l.13, 28 et 39 ; engagements E1-E7 à la l.37 ; plans des semaines 1-2 aux l.39-40 et 58 ; rev 27→91 aux l.26-28. La l.49 porte sur la PR dream-of-kiki #87, pas sur le profil public (D12).
- Correction proposée : remplacer « (96 lignes) » par « (59 lignes) » et les renvois : D13 → l.28, 39 ; §3 engagements → l.37 ; plan semaine 1 → l.39, 58 ; « appliqué au doc » → l.26-28 ; D12 → retirer « [MEM] l.49 » (aucune ligne du fichier ne dit que le dossier renvoie au profil ; écrire « inférence : le §10 renvoie à l'organisation GitHub, TRK C37 l.158 »).

**M2 — `dossier-relecture.md:20-36` (renvois [TRK]).**
- Citation : « [TRK C10 l.122 …] », « C15 l.126 », « C04 l.118, C11 l.123, C24 l.146 », « C05 l.119 », « C02b l.117 », « C32 l.143, C26-C27 l.147-148 », « C31 l.142 », « C24b l.150 », « C14 l.130 », « C23b l.149 ».
- Preuve : dans `/Users/electron/Documents/Projets/hypneum-next-handoff-2026-10-31/verif/tracking-astra-v3.md`, `grep -n "^| C"` donne C02b l.119, C04 l.121, C05 l.122, C10 l.126, C11 l.127, C14 l.133, C15 l.130, C23b l.141, C24b l.142, C31 l.145, C32 l.146, C24 l.148, C26 l.149, C27 l.150. Justes : C33 l.154, C34 l.155, C35 l.156, C36 l.157. Un lecteur qui suit « C10 l.122 » tombe sur C05. Le texte des 17 affirmations est bien présent dans [TRK] (vérifié pour D01-D11, D15-D17) ou dans [RS] (D14, l.26 ; E1-E7, l.38-44).
- Correction proposée : remplacer les numéros par ceux ci-dessus. Aucune correction du dossier ne vise une phrase absente des trois sources.

**M3 — `these-dream-of-kiki.md:29` et `:54` (lecture d'un résultat du labo).**
- Citation : l.29 « **confirme** le cadre de lecture » du NH-03 différé ; l.54 « confirme la lecture récence du NH-03 différé ».
- Preuve : `recency_survives` est un résultat du labo (`clones/dream-of-kiki/docs/results/2026-10-30-nh03-deferred-eval.md:37,43`, chiffres justes : R_d3 +14,65 [+13,77 ; +15,51]). Le résumé de arXiv:2610.36109 dit que l'ordre des mises à jour à compte égal change l'exactitude ; il ne lit pas le NH-03 différé. C'est une inférence présentée comme une confirmation.
- Correction proposée : « Inférence : la Control Map donne un cadre où la lecture « récence » du NH-03 différé est attendue ; elle ne la teste pas. »

**M4 — `these-bouba_sens.md:48, 50` (NH-70).**
- Citation : l.50 « → Hypneum : confirme la forme « local oui, global conservé » de NH-70 chez l'animal, sans la tester en réseau artificiel ».
- Preuve : NH-70 est une hypothèse du labo sur des réseaux (catalogue l.312). La réserve « sans la tester » est écrite, mais le verbe reste « confirme ».
- Correction proposée : « → Hypneum : **antériorité biologique** de la forme posée par NH-70 (souris) ; ne teste pas NH-70. »

**M5 — Recoupement : phrases « déjà publié » / « reste ouvert » à une seule source ou à deux sources de même nature, sans « à recouper ».**
- `these-dream-of-kiki.md:70` (ligne §4 Control Map : « Montre que le compte ne fixe pas l'état final ») : une seule prépublication.
- `these-dream-of-kiki.md:71` (ligne §4 Kubo : « Le contrôle […] existe déjà ») : une seule prépublication bioRxiv. Le §2 (l.28) porte bien « à recouper », mais pas le §4.
- `these-bouba_sens.md:89` (« devancée en partie […] par OpenReview `ts0kgHyBfr` et `7l8JCIgUi8` ») : deux soumissions OpenReview, même nature.
- `these-rescience-methodo.md:76` (§4, risque de scoop sur le genre) : une seule source (arXiv:2610.34379).
- Compte : 4 phrases manquantes au total (dream-of-kiki 2, bouba_sens 1, rescience-methodo 1 ; 0 dans les quatre autres thèses). Correction : ajouter « à recouper » à chacune.

**M6 — Scoop manqué, `these-nerve-wml.md` §3-§4.**
- Fait : la requête arXiv `(abs:"emergent communication" OR …)` ne rend rien d'utile. Une requête voisine (thèse rescience-methodo) fait remonter **arXiv:2610.33495** (soumis le 2026-10-24, premier auteur Oladimeji Anthonio), *Five Architectures, One Shared Space: Cross-Model Representational Alignment Without Weight Merging*. Il est absent de `seen-arxiv.txt` et des huit livrables.
- Le résumé (API arXiv, relu) : alignement des activations de cinq modèles gelés d'architectures différentes (quatre transformeurs, un modèle d'espace d'états), tests de permutation, sonde de réplication indépendante, contrôles de confusion ; la paire la plus faible reste « 35-43 times chance » ; espace commun par Procrustes généralisé.
- Inférence : c'est un rapport « × le hasard » sous nul par permutation, de la même famille que le « 18,8× » du mKNN. Il touche NWML-PRH (catalogue l.140) et NH-45 (l.287). Impact proposé : Moyen. L'entrée est à ajouter en R2/R11 avec la marque [résumé moteur].

## 3. Constats MINEUR

- `these-bouba_sens.md:27, 29, 88` : étiquettes de table inversées. Les l.180 (BS-B3arch) et l.190 (BS-v07) sont en **table A**, pas en table B ; les l.310 (NH-68) et l.318 (NH-76) sont en **table B**, pas en table A. Les numéros de ligne et les statuts sont justes.
- `these-bouba_sens.md` §8 (tableau arXiv) : le tableau est cassé. Les lignes ont perdu leur préfixe « | 19: ». On lit des heures impossibles (« 29:05 », « 35:16 ») ou postérieures à la passe (« 22:30 »-« 22:57 »).
- `these-kiki-flow-research.md:249-251` : « 5 gardés (2610.38129, 2610.40942, 2610.33922, 2610.41321, et les 2 hits TOST écartés…) ». Le texte énumère 4 entrées gardées et 2 écartées ; le §3 en garde 4.
- `these-micro-kiki.md:5` : « trois sources plus anciennes » ; le §3 en marque quatre « ancien, non vu » (2411.19379, 2602.01053, 2409.08290, DOI 10.1016/j.joule.2026.102430).
- `these-rescience-methodo.md:43` : « presque la moitié dans les domaines clairsemés » est ambigu. La source (`dl-rescience-methodo/2610.33980.txt:90-93`) dit qu'en domaines clairsemés « nearly half of the expected new entrants failed to appear ». Elle ne dit pas que la moitié de la baisse vient de ces domaines.
- `these-nerve-wml.md:40` : les chiffres (928 configurations, 1 405 500 interventions, quatre modèles) sont ceux du PDF lu (`dl-nerve-wml/2609.39243.txt:25-27`). Le résumé servi par l'API arXiv le 02/11 (v2) dit « 72 configurations and 100,800 interventions on GPT-2 small ». Le chiffre vient donc bien du texte lu, mais il faut préciser la version et la date du PDF.
- `these-baby-brain.md:61, 84` : Sleep-CWM (OpenReview KdVy927FLx) est présenté comme nouveau (Impact Haut). Il figure déjà dans `veille/revue-de-fond-2026-11-01.md:605`. Il faut le marquer « déjà vu, rappelé ». Les listes `seen-*` ne couvrent pas les identifiants OpenReview, d'où l'oubli.

## 4. Vérifications faites qui n'ont rien trouvé

- **Identifiants** : `python3 -I clones/.github/scripts/resolve_ids.py` relancé sur les huit fichiers donne **0 ko partout** (18, 26, 23, 20, 22, 16, 25 et 5 identifiants ; sorties dans `veille-0211/relecture-work/resolve-*.tsv`). Pour l'échantillon, titre, premier auteur, date et résumé ont été relus à la source :
  - arXiv `id_list` (24 identifiants) ;
  - Crossref (10 DOI) ; DataCite (1) ;
  - OpenReview `notes/search` (3gCeBuNNyT, KdVy927FLx, QFw0sg52VV, ts0kgHyBfr).
  Dans chaque cas le résumé porte l'affirmation que l'entrée lui fait dire. Exemples : « fires as often as the schedule it beats by 2.1 ACC points » (3gCeBuNNyT) ; « Spreading the same total synaptic change evenly … abolished this recovery » (Kubo) ; « 24 schedules with the same update count yield 19.7%–34.2% » (2610.36109) ; « spike rate below 5.7% » à T = 5 (2409.08290) ; « finite global lower bound if and only if … diameter at most two » (2610.38129) ; seuil naturel « its null stays non-zero » (ts0kgHyBfr) ; théta frontal en condition McGurk chez sept patients (Collado/Bastos) ; « 5.73x » contre vLLM-Marconi (HiState) ; « approximately 13% » (2610.33980, texte).
- **Dédoublonnage** : script `relecture-work/dedup.py` sur les §3. Les identifiants arXiv et DOI présents dans `seen-arxiv.txt` / `seen-doi.txt` sont tous marqués « déjà vu, rappelé » ou cités comme déjà vus (2606.05115, 10.1098/rspb.2026.1209, 2610.37139, 2610.38437, 2607.04738, 2609.17109, 2610.37849, 2602.08428, 2606.11217, 2606.27687). Les entrées « ancien, non vu » sont bien absentes des listes.
- **Verdicts interdits** : aucun verdict sur E1-small, N10-C run 2, Me6 ou M5 dans les huit fichiers. Aucun « verrou passé » : la seule occurrence de « passe le verrou » (`these-nerve-wml.md:31`) décrit l'ordre du trimestre. Dans le dossier, D04 reprend le « confirmé au critère enregistré » existant et D03 écrit explicitement « ne dit rien de Me6 ».
- **Chiffres vérifiés dans les clones (3 par fichier ou plus, tous justes)** :
  - dream-of-kiki : 35×, `osf-amendment-e1-small-2026-10-30.md:151-155` ; R_d3 +14,65 [+13,77 ; +15,51] et `recency_survives`, `nh03-deferred-eval.md:37,43` ; SHARP en `full-draft.md:1067` ; absence de 2501.16789 / 2609.32605 / SIESTA / SleepGate par `git grep` au 8a7e846.
  - nerve-wml : MI/H 0,91-0,96 en `main.tex:370-378` ; 0,174 et 18,8 en `main.tex:431-480`.
  - kiki-flow : 67,79 ± 3,78 en `main.tex:263` ; 50/60 en `m5-certify-verdict.md:9-12` ; −0,72 et −0,03 en `jko-splitting-results.md:47-52` ; « vraisemblable » en `reading-note.md:168-174`.
  - bouba_sens : 19,21 / 19,41 / 19,80 dB en `adr/0020…:34-36`.
  - micro-kiki : 13,8 % en `inventory/micro-kiki.md:199` ; retrait « withdrawn » en `README.md:332,386` ; « alpha = 2 × rank » en `README.md:83` ; grep Holevo vide en `inv:345` ; SuffixReplay « neighbouring » en `prefix-cache-related-work.md:27`.
  - baby-brain : AdamW en `__main__.py:1519-1523`, conforme aux citations de l'inventaire.
  - rescience-methodo : 3,86 [3,79 ; 3,93] en `metadata.yaml:63` ; 3,05 [2,99 ; 3,10] en `synthese/rapport.md:72` ; C5 inconclusive et C6 positif en `nh01-diagonal-ablation.md:15-16` ; « We did not run an ablation » en `content.tex:220-222` ; citations `tk.txt:262` et `p.txt:253-256` ; « adds no hypothesis » en `protocol.md:10`.
  - dossier : 1,90 [1,85 ; 1,96], qui arrondit l'IC t [1,849 ; 1,959] de `readme-pr23.md:72`.
- **Section 2 (catalogue)** : toutes les lignes citées ont été ouvertes (32-51, 75, 79, 97, 116, 120, 133, 140, 143, 156, 180, 190, 193, 195-199, 209-231, 243-246, 262, 265, 274, 287, 290, 298, 300, 307-333). Les statuts recopiés correspondent ; la seule erreur est l'étiquette de table de bouba (MINEUR).
- **Dossier, état au 02/11** :
  - PR kiki-flow #52 fusionnée le 01/11 à 09:19:54Z et #60 à 09:23:53Z (`gh-dossier/pr-kiki-flow-research.json`) ;
  - micro-kiki #14 fermée le 01/11 à 20:46:34Z ;
  - ReScience #147 : un seul commentaire (rougier, 01/11 09:52Z, « make two reviews »), étiquettes NEED Editor / Reviewer 1-2 ;
  - Studio « 7 j, monsieurb actif, m5-secondary fini 31/10 18:42 » (`inventory/compute-status.md:9`) ;
  - .github #22, #23 et #24 ouvertes, non brouillon ;
  - B16 en `readme-pr23.md:67`, M21 en l.106, décisions Q7 et Q8 en l.300-301, « 34 et non 35 » en l.135, C5 en l.152.
- **Scoop, une requête arXiv par thèse** (fenêtre 24/10-02/11) : rien de nouveau et pertinent pour dream-of-kiki, kiki-flow, micro-kiki et baby-brain, en dehors de ce qui est déjà cité ou vu. Pour bouba_sens, la requête « privation sensorielle », qui avait échoué en 429 dans la passe, a cette fois répondu : 0 résultat dans la fenêtre. L'absence notée au §4 de bouba tient donc aussi sur arXiv. Pour rescience-methodo, rien qui change la thèse ; seul arXiv:2610.33495 a été retenu, et il concerne nerve-wml (M6).

## 5. Provenance

- **Fichiers lus en entier** : `brief-relecture-0211.md`, `brief-verrou-commun.md`, `brief-passe-0211.md`, `brief-dossier-0211.md` ; les huit livrables ; catalogue v2 (en-têtes et lignes citées) ; [TRK] l.100-165 ; [RS] l.20-46 ; [MEM] (recherche ciblée sur 59 lignes).
- **Fichiers lus en partie** : `readme-pr23.md` (l.9, 67, 72, 96, 106, 135, 152, 203, 300-301) ; `inventory/compute-status.md:5-10` ; sorties `gh-dossier/` (#52, #60, #14, #22-24, #147) ; extraits des clones listés au §4 ; textes PDF déjà téléchargés par les passes (`dl-nerve-wml/2609.39243.txt`, `dl-rescience-methodo/{2610.33980,2610.34379,tk}.txt`).
- **Requêtes** (User-Agent « hypneum-lab reading-gate », aucune adresse e-mail) :
  - arXiv `id_list` (1 appel, 24 identifiants) ;
  - arXiv `search_query` (7 appels, 4 s entre appels, sortie `relecture-work/dl/scoop.json`) ;
  - Crossref `works/<doi>` (10) ; DataCite (1) ; Zenodo API (302, non suivi) ;
  - OpenReview `notes/search` (4, 3 s entre appels).
- **Identifiants revérifiés à la source** : 24 arXiv, 11 DOI, 4 OpenReview. Échec : aucun.
- **Scripts** : `veille-0211/relecture-work/{dedup.py,scoop.py}`, lancés avec `python3 -I`.
- **Durée** : environ 50 minutes.
