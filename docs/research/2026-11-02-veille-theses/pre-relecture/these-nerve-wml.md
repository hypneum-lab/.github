# nerve-wml — thèse, veille et relecture (2026-11-02)

Clone `clones/nerve-wml`, branche `docs/n10d-reading-note`, HEAD `ea6ab8f`. Rien n'est écrit dans la PR #102 : ce document reste dans `veille-0211/`. Aucun verdict sur N10-C run 2, E1-small ou Me6. Aucun calcul : les seuls scripts exécutés sont des appels d'API et une extraction de texte de PDF sur GrosMac.

- **Fenêtre** : soumissions du 2026-10-24 au 2026-11-02. Les sources plus anciennes ne sont gardées que si elles sont absentes de `seen-arxiv.txt` / `seen-doi.txt` et touchent une ligne du § 2 (marque « ancien, non vu »).
- **Axes** : R2 (communication inter-modules émergente, canal, test causal), R5 (codage prédictif, SNN) et R10 (seulement si la source est testable).
- **Requêtes** : arXiv (20 requêtes thématiques, dont 4 relancées après un 429, et un `id_list` de vérification), OpenReview (11 appels), bioRxiv (balayage complet de la fenêtre), GitHub (11 requêtes), Hugging Face (15 appels), Zenodo (5), OSF (4). Il y a eu deux boules de neige : sur les références du concurrent `hukTsKYu8Y`, puis en aval sur 6 sources. Détail au § 8.
- **Brut → dédoublonné → gardé** :
  - arXiv : 461 → 381 notices distinctes → 5 dans la fenêtre → 3 hors des listes → **1 gardée** ;
  - OpenReview : 450 notes → 138 forums → 12 hors des notes précédentes → **4 gardés**, plus l'état de `hukTsKYu8Y` ;
  - bioRxiv : 2 034 notices → 11 correspondances de mots-clés → **2 gardées** ;
  - boules de neige : 46 références du concurrent → 11 arXiv hors listes → 3 gardées ; en aval, 573 lignes → 547 distinctes → 324 hors listes → 21 après filtre de titre → **3 gardées** ;
  - code et données : **0 gardé**.
- **Total gardé : 13 entrées.**
- **Lecture** :
  - corps lu en entier (PDF) pour 4 sources : arXiv:2511.04638 pp. 1-10 sur 27 ; arXiv:2512.18792 pp. 1-10 sur 24 ; arXiv:2609.39243 pp. 1-14 sur 22 ; arXiv:2610.41604 pp. 1-18 et 31-33 sur 40. Annexes non lues ;
  - les 9 autres sont en `[résumé moteur]`.
  - Le PDF de `hukTsKYu8Y` n'a pas été relu. Seule sa liste de références (pp. 10-13) a été reprise depuis le texte extrait le 01/11 (`hk-txt/hk.txt:1405-1700`).

## 1. La thèse en une phrase, telle que le dépôt la formule

« **Substrate-agnostic nerve protocol for inter-module communication in hybrid neural systems.** » (`README.md:6`). Le résumé de Paper 1 dit plus précisément : un protocole de neurolettres discrètes (alphabet de 64), multiplexées sur des rythmes γ/θ et routées sur une topologie apprise, permet à des modules hétérogènes « *exchange information* » sans partager de substrat. Deux affirmations sont annoncées : (A) polymorphisme inter-substrats ; (B) information partagée (`papers/paper1/main.tex:18-30`).

## 2. État de la thèse au 02/11

| affirmation | statut 24/10 | requalification 01/11 (catalogue v2) | ce que change la veille du 02/11 | source résolue |
|---|---|---|---|---|
| Claim B : MI/H 0,91-0,96, codes « post-VQ » (`papers/paper1/main.tex:370-378`) | résultat, amendé (« over-stated ~10× ») | accord de classifieurs ≠ canal ; à refaire avec un test causal (Table C l. 36 ; Table A NWML-B l. 133, NWML-FE l. 143) | **confirme la requalification**, par la méthode et non par un nouveau résultat sur nerve-wml : un nul « réseau à poids aléatoires » est désormais recommandé pour toute mesure de représentation interne ; être décodable n'est pas être utilisé | arXiv:2512.18792 (corps lu) ; arXiv:2604.22128 `[résumé moteur]` ; arXiv:2610.41604 (corps lu, analogie « called-but-content-blind ») |
| mKNN 0,174 = « 18,8× » le nul (`papers/paper1/main.tex:431-480`) | résultat, amendé (« local, relational ») | excès ≈ 2,5-3× sous nul intra-cluster, agent seul, à refaire (Table C l. 37 ; NWML-PRH l. 140 ; NH-45 l. 287) | **confirme** l'exigence d'un nul calibré, mais aucun chiffre nouveau. Le nul « non entraîné » prédit par NH-45 (l. 287) correspond exactement au contrôle que recommande arXiv:2512.18792 § 4 (inférence) | arXiv:2512.18792 (corps lu) |
| canal PSK γ/θ (Test 12) et correspondance π→γ, ε→θ (`papers/paper1/main.tex:74,76-78,89-93,176-180`) | « neuf » | neuf, mais recouvert en partie par arXiv:2609.32605 ; association inverse de Bastos (Table C l. 38, M5, M7) | **nuance M5, à recouper** : un preprint iEEG du groupe Bastos confirme que les erreurs passent par le γ (et que les prédictions augmentent α-β) dans le cortex temporal. Il rapporte en même temps un signal d'erreur de prédiction en **θ** dans le cortex frontal (condition McGurk). π→γ reste l'inverse de la biologie citée. ε→θ trouve un appui partiel, frontal seulement, dans un échantillon de n = 7 | DOI 10.64898/2026.10.30.760243 `[résumé moteur]` |
| N10-D : sym hors de H1, covariance de graine, bras causal attendu (PR #100) | préreg L0 en brouillon | passe le verrou en premier (Table C l. 39 ; spec §5.1) | **dépasse en partie le dessin D1** (brainstorm § 2) : une intervention en test peut produire « la bonne réponse par le mauvais mécanisme », et les distances au point d'intervention ne le détectent pas (AUROC 0,21-0,46). Le critère « la restauration ramène l'intact » de `reading-note.md` § 5 ne suffit donc pas, seul, à établir l'usage du message | arXiv:2511.04638 (corps lu) ; arXiv:2609.39243 (corps lu) ; OpenReview `7IkH0oITID` `[résumé moteur]` |
| Concurrent `hukTsKYu8Y` (6 891 784 paramètres, 4 modules, coupure / substitution / restauration) | — | lu en entier pp. 1-38 le 01/11 (`reading-note.md` § 2, v0.3) | **rien de neuf sur le fond** : pas de version arXiv, pas de code, note OpenReview inchangée depuis le 2026-10-05 (version 2). Deux voisins de ses références, non cités jusqu'ici, touchent son échelon « restauration » (voir § 4) | OpenReview `hukTsKYu8Y` (métadonnées API) ; arXiv:2511.04638 |
| Référence Paper 1 `karlsson2026diffpc` (refs n° 32, « introuvable par API », `inventory/refs/nerve-wml-refs.md:49`) | KO | — | **résolue** : OpenReview `iu9dbz2lB9` est un poster ICLR 2026, Karlsson, Fianda, Kämäräinen, « Difference Predictive Coding for Training Spiking Neural Networks ». L'entrée bib passe de « introuvable » à « existe », à vérifier sur la forme | OpenReview `iu9dbz2lB9` (API `notes/search`, venue ICLR 2026 Poster) |

## 3. Veille 02/11 par axe R

### R2 — communication inter-modules, canal, test causal

- **arXiv:2609.39243** (2026-09-30, v2 du 2026-10-04 ; ancien, non vu) — *Right Answer, Wrong Mechanism: Detecting Pernicious Divergence in Causal Interventions*, Beiming Liu.
  - Les auteurs plantent des voies cachées, silencieuses sur toutes les entrées naturelles, dans GPT-2, Pythia-1.4B, Pythia-6.9B et Qwen2.5-7B : 928 configurations, 1 405 500 interventions.
  - Les distances au point d'intervention identifient sous le hasard les succès obtenus par la voie plantée (AUROC 0,21-0,46 sur la tâche genre). Un test aval par clampage (HPC) atteint 0,82-1,00 quand la voie est visible unité par unité, mais échoue sur les voies « dans la plage ».
  - Le DAS optimisé emprunte la voie plantée dans 81-100 % de ses succès sur la tâche genre (corps lu pp. 1-14).
  - → Hypneum : **dépasse** — N10-D D1 et le critère de restauration de `reading-note.md` § 5. Inférence : un message permuté ou substitué peut agir sur l'auditeur par une voie que le message naturel n'emprunte jamais. Un contrôle aval du régime naturel de l'auditeur est à ajouter au dessin, en complément du nul apparié. **Impact : Haut.**
- **arXiv:2511.04638** (2025-11-06, v5 du 2026-04-22, ICLR 2026 ; ancien, non vu, cité par `hukTsKYu8Y`) — *Addressing divergent representations from causal interventions on neural networks*, Satchel Grant.
  - Les interventions courantes (patch de coordonnées, différence de moyennes, SAE, DAS) poussent les représentations hors de la distribution naturelle ; c'est démontré pour le patch de coordonnées (§ 3.1) et constaté empiriquement pour les autres (§ 3.2).
  - Les divergences sont soit inoffensives (espace nul comportemental), soit pernicieuses (voies cachées, changements dormants).
  - Recommandation : rapporter la divergence hors de l'espace nul et tester la sensibilité au contexte (§ 4.2.2). Code public : `grantsrb/rep_divergence` (note de bas de page p. 1). Corps lu pp. 1-10.
  - → Hypneum : **confirme**, et recoupe avec 2609.39243 (théorie + benchmark, deux équipes) la limite de Lowe §6.2 déjà retenue (« couper le canal en test est biaisé »), cette fois pour la substitution elle-même. **Impact : Haut.**
- **OpenReview `7IkH0oITID`** (soumission ICLR 2027, auteurs masqués) — *What Can Activation-Patching Evidence Establish?* `[résumé moteur]`. Une restauration réussie peut laisser indistinguables des alternatives qui changent la conclusion (« target-relative observability »). Résultats sur GPT-2 et six familles de modèles.
  - → Hypneum : **confirme** — même point que ci-dessus, au niveau formel. À lire avant de figer le critère « restauration » de N10-D. **Impact : Moyen.**
- **OpenReview `Gfh4EJoWTV`** (atelier NeurIPS 2026 TAE, Kadu, Kalyanasundaram, Krishnan) — *What Can Activation Patching Actually Establish? Reachable-State Geometry and the Limits of Mechanistic Evidence* `[résumé moteur]`. L'« espace aveugle » d'une famille d'interventions est calculable. Les auteurs ont fait une réplication préenregistrée sur 24 prompts et retirent deux affirmations après avoir trouvé des pièges.
  - → Hypneum : **outil réutilisable** (méthodo) — R11/N10-D. **Impact : Info.**
- **arXiv:2610.41604** (2026-10-30, dans la fenêtre) — *Real Computation or Merely Naming? A Pre-Registered Mechanism Audit of 25 Cognitive-Architecture Modules in an LLM-Based Agent System*, Peter Chen.
  - Sur 25 modules (dont un « global workspace »), 18 n'atteignent jamais la sortie.
  - 61 critères gelés et préenregistrés : 53 confirmés, 5 réfutés.
  - Trois formes de câblage inerte sont décrites, dont « called-but-content-blind » (corps lu pp. 1-18 et 31-33).
  - → Hypneum : **confirme** par analogie le cadrage « présence ≠ usage » de Claim B. C'est un audit logiciel, pas un réseau appris : pas une antériorité de N10-D. **Impact : Info.**
- **arXiv:2604.22128** (2026-04-24 ; ancien, non vu) — *Dissociating Decodability and Causal Use in Bracket-Sequence Transformers*, Aryan Sharma `[résumé moteur]`. Profondeur, distance et sommet de pile sont tous décodables, mais leurs rôles causaux divergent sous intervention.
  - → Hypneum : **confirme** la distinction « décodable ≠ utilisé » sur laquelle repose la requalification de Claim B. Deuxième source, de nature différente (expérience), à côté de l'argument de position de 2512.18792. **Impact : Moyen.**
- **Déjà vu, rappelé** : arXiv:2610.37849 (PoPLi, Denamganaï, 2026-10-27, dans la fenêtre) est déjà dans `seen-arxiv.txt` et lu pp. 1-6 au tour 2 de la note N10-D. Le dépôt `Near32/PartnerOutsiderPositiveListening` a été poussé le 2026-10-26 (GitHub). Aucune nouvelle version arXiv n'est constatée.

### R5 — codage prédictif, SNN

- DOI 10.64898/2026.10.30.760243 (bioRxiv, 2026-11-01) — *Human iEEG recordings during audiovisual speech violations support and extend predictive routing models*, Collado, …, Bastos `[résumé moteur]`.
  - Les données viennent de 7 patients.
  - En cortex temporal supérieur, la déviance et la condition McGurk augmentent le γ haut et diminuent l'α-β.
  - En cortex frontal, l'α-β diminue sans signal γ, mais un signal d'erreur de prédiction apparaît en θ.
  - → Hypneum : **infirme en partie / nuance** M5 (Table C l. 38). Inférence : π→γ reste l'inverse du routage prédictif. ε→θ n'est plus sans aucun appui, mais l'appui est frontal et vient d'un seul preprint. Il faut le citer comme tel si le Test 12 garde sa correspondance biologique, avec la marque « à recouper ». **Impact : Moyen.**
- DOI 10.64898/2026.10.29.762424 (bioRxiv, 2026-10-30) — *Item-specific clustering of high gamma-band activity on theta phase during speech categorization*, Ten Oever `[résumé moteur]`. En ECoG, le γ propre à chaque item se regroupe à des phases θ distinctes, et la phase θ pré-stimulus prédit la perception.
  - → Hypneum : **confirme** le principe d'un code de phase γ-sur-θ, source biologique pour NWML-PAC (Table A l. 156, « non testé »). Ce n'est pas un test du protocole. **Impact : Info.**
- **OpenReview `iu9dbz2lB9`** (ICLR 2026 Poster) — *Difference Predictive Coding for Training Spiking Neural Networks*, Karlsson, Fianda, Kämäräinen `[résumé moteur]`. Codage prédictif natif en impulsions ternaires, données réduites de plus de deux ordres de grandeur.
  - → Hypneum : **outil réutilisable** et correction de bibliographie (refs n° 32). **Impact : Moyen** pour la propreté de Paper 1, Info pour la science.

### R10 — testable seulement

- **OpenReview `U9WMEU4Zac`** (soumission ICLR 2027) — audit du « Jacobian lens » `[résumé moteur]`. La localisation d'une « bande de workspace » dépend de conventions non déclarées. Seule une transition de dimension effective survit, et son début varie de 28,6 % à 78,7 % de la profondeur selon la famille de modèles.
  - → Hypneum : **Info** pour NH-48 (Table B l. 290). C'est un exemple de mesure « workspace » qui ne résiste pas à un contrôle de convention.
- **arXiv:2610.31955** (2026-10-22, deux jours avant la fenêtre, non vu) — *A Mathematical Theory of the Jacobian Lens*, Mitchell Ostrow `[résumé moteur]`. Pas testable pour nerve-wml. **Info.**
- **arXiv:2512.18792** (2025-12-21 ; ancien, non vu, cité par `hukTsKYu8Y`) — *The Dead Salmons of AI Interpretability*, Maxime Méloux.
  - Attribution, sondes, SAE et analyses causales produisent des explications plausibles sur des réseaux à poids aléatoires.
  - Les auteurs proposent de traiter les explications comme des estimateurs, testées contre un nul « réseau randomisé » (§ 4, test formalisé en annexe A, non lue) (corps lu pp. 1-10).
  - Classé ici parce que c'est la source méthodo citée par le concurrent R10, mais son usage pour Hypneum est R11.
  - → Hypneum : **confirme** — Claim B, mKNN, NH-45. **Impact : Haut** (c'est le contrôle que la requalification B3/B4 demande, sous forme de norme publiée).

## 4. Hypothèses déjà faites ailleurs (risque de scoop)

- **`hukTsKYu8Y` (Table C l. 36 et l. 39)** :
  - *Faits* :
    - Aucune version arXiv : `ti:"Does the Workspace Do the Work"` donne 0 (deux fois, dont la relance de 19:41) ; recherche OpenAlex par titre sans résultat ; Hugging Face Papers sans résultat.
    - Aucun code : GitHub, 6 requêtes ciblées, 0 dépôt ; la note OpenReview n'a ni champ `code` ni `supplementary_material`.
    - Note `version 2`, créée le 2026-09-19, ouverte le 2026-10-03, dernière modification le 2026-10-05.
    - `notes?id=` et le PDF répondent toujours 403.
  - *Inférence* : le risque de scoop reste celui du 01/11, sans aggravation. La ligne « plan 2 × 2 nécessité / suffisance » de `reading-note.md` § 3 reste « à recouper » faute de code.
  - Voisins de ses 38 pages non encore cités chez Hypneum : arXiv:2511.04638, arXiv:2512.18792, arXiv:2602.16698 (*Causality is Key for Interpretability Claims to Generalise*, Joshi, `[résumé moteur]`). Les deux premiers sont lus (§ 3). Ils ne sont pas des antériorités de N10-D : ce sont des limites de la méthode d'intervention que N10-D et le concurrent partagent.
- **Soumissions ICLR 2027 voisines du concurrent** : `FwNyRCul6v`, `Xrp8mNku6R`, `lEQbDxjVmf`, `zaTTfwGdRw`, `EwfPUo0f4x`. Elles figurent déjà dans `veille/revue/orz.tsv` ou dans les veilles précédentes. Aucune ne fait de bras entraîné sans canal ni de nul apparié par graine, d'après les résumés lus au 01/11. Pas de nouvelle soumission de ce type dans les 450 notes du 02/11.
- **Bras « usage causal » de N10-D (D1)** : la critique de la méthode (2511.04638, 2609.39243) **précède** N10-D. *Inférence* : ce n'est pas un scoop de l'hypothèse, mais une condition de validité que le relecteur demandera (Table C l. 39).
- **NH-32 (Table B l. 274, décomposition sensibilité / contenu)** et **NH-45 (l. 287, artefact du 18,8×)** : aucun scoop trouvé ce jour.

## 5. Outils ou jeux de données à adopter

1. **Test aval HPC** (arXiv:2609.39243 § 5) : clamper les unités de l'auditeur au régime des épisodes naturels qui donnent la même sortie, puis mesurer la marge perdue. Ce serait le contrôle « bonne réponse, mauvais mécanisme » pour le message permuté de D1. Code : l'article mentionne un dépôt ; non vérifié ici, voir § 7.
2. **`grantsrb/rep_divergence`** (arXiv:2511.04638) : mesure de divergence (EMD naturel / intervenu) et perte CL. Existence affirmée par le PDF ; dépôt non ouvert ici (§ 7).
3. **Nul « réseau randomisé »** (arXiv:2512.18792 § 4) : à appliquer à Claim B et au mKNN, en plus du nul intra-cluster. Inférence : c'est le nul « non entraîné » de NH-45, déjà écrit dans le catalogue et jamais exécuté.
4. Aucun jeu de données nouveau. Hugging Face, Zenodo et OSF n'ont rien donné de pertinent. Zenodo montre seulement le dépôt propre au laboratoire (`nerve-wml v1.10.0`, 2026-10-31).

## 6. Ce qui reste ouvert et le prochain pas sous le verrou

- **Question ouverte n° 1 de la note N10-D** (usage causal du canal appris, nul apparié par graine, bras sans canal entraîné) : **inchangée**. Aucune source du 02/11 ne la tranche.
  - *Fait* : 2609.39243 et 2511.04638 portent sur des modèles pré-entraînés figés, sans bras sans canal ni graines d'entraînement indépendantes.
  - *Inférence* : l'absence constatée le 01/11 tient toujours. C'est une inférence sur 7 canaux interrogés, et non une preuve.
- **Prochain pas (dessin, pas de run)** : amender sur le papier le dessin D1 du brainstorm (`brainstorm-2026-11-01.md` § 2), dans un fichier à côté et non dans la PR #102 ni dans la préreg :
  - (a) ajouter un contrôle aval du régime naturel de l'auditeur, de type HPC ;
  - (b) ne pas retenir la restauration seule comme critère d'usage ;
  - (c) choisir les cas où les sorties intact / donneur / hybride sont distinctes (piste déjà notée au § 5 de la note).
  - Coût estimé : ≈ 3-4 h humaines de rédaction, 0 h machine.
- **Lectures à faire** : annexes de 2609.39243 (Tables 8-13, pp. 15-22) et annexe A de 2512.18792 (test contre réseau randomisé) ; ≈ 2 h. Ensuite le texte de `7IkH0oITID` s'il devient accessible.
- **Claim B / mKNN** : refaire le calcul avec le nul « réseau randomisé » et le nul intra-cluster sur un hôte autorisé. **Pas avant le verrou** ; dessin D6 du brainstorm, ≈ 4-6 h humaines.
- **M5 (γ/θ)** : réécrire la phrase de correspondance biologique de Paper 1 en citant le preprint Collado/Bastos comme appui partiel frontal de ε→θ et comme contradiction de π→γ. ≈ 1 h. Marque « à recouper » tant qu'il n'existe qu'un preprint.
- **N10-C run 2 : aucun verdict**, rien de ce document ne s'y applique.

## 7. Non vérifié / inaccessible

- OpenReview : `notes?id=hukTsKYu8Y`, `notes?forum=hukTsKYu8Y` et les PDF de `hukTsKYu8Y` et `7IkH0oITID` répondent 403 (19:13-19:23). Seules les métadonnées de `notes/search` sont lues.
- Semantic Scholar `search` : 429 persistant, repli sur OpenAlex (19:18). Le lot S2 de la boule de neige est passé à la troisième tentative.
- arXiv : 429 au premier passage (19:12), puis 4 requêtes en 429 persistant au second passage, toutes relancées avec succès à 19:41.
  - La date de soumission la plus récente renvoyée est le 2026-10-30. Les soumissions des 31/10-02/11 ne sont peut-être pas encore indexées par l'API : la fenêtre arXiv est **incomplète** sur ses 3 derniers jours.
- bioRxiv : l'API déclare 2 034 notices pour la fenêtre, toutes parcourues. Le filtre est fait par mots-clés sur titre et résumé, sans restriction de catégorie.
- Dépôts de code de 2609.39243 et 2511.04638 (`grantsrb/rep_divergence`) : non ouverts.
- Les annexes de 2511.04638, 2512.18792, 2609.39243 et 2610.41604 n'ont pas été lues.
- arXiv:2604.22128, arXiv:2602.16698, arXiv:2607.00267 (*Validating Causal Abstraction Metrics on Simulated Complex Systems*, Méloux ; pertinent pour R11, non utilisé) et arXiv:2610.31955 sont lus en résumé seulement.
- Thèses / HAL et revues via Crossref : non réinterrogés ce jour (couverts au tour 2 de la note N10-D, 01/11).

## 8. Journal

| date-heure (CET) | canal | requête exacte | brut | gardé |
|---|---|---|---:|---:|
| 2026-11-02 19:12-19:40 | arXiv API (`sortBy=submittedDate`, 60 max, 6 s entre appels, backoff 20-100 s) | `ti:"Does the Workspace Do the Work"` (429) ; `abs:"global workspace" AND abs:causal` ; `abs:AFGW` ; `abs:"global workspace" AND abs:transplant` ; `abs:"emergent communication"` ; `abs:"multi-agent communication" AND abs:causal` ; `abs:"latent communication" AND (abs:causal OR abs:audit OR abs:derang*)` (429) ; `abs:"communication channel" AND abs:"multi-agent" AND (abs:ablation OR abs:intervention OR abs:counterfactual)` ; `abs:"referential game"` ; `abs:"positive listening" OR abs:"positive signalling" OR abs:"positive signaling"` ; `abs:"inter-module communication" OR abs:"inter-area communication" OR abs:"communication subspace"` ; `abs:"predictive coding" AND (abs:spiking OR abs:SNN)` ; `abs:"predictive coding" AND abs:"error neurons"` ; `abs:"global workspace"` (429) ; `abs:"theta" AND abs:"gamma" AND abs:"phase" AND (abs:code OR abs:coding) AND abs:network` (429) ; `abs:"mutual k-nearest" OR abs:"mutual nearest neighbor" AND abs:alignment` ; `abs:"representational alignment" AND (abs:null OR abs:permutation OR abs:baseline)` ; `abs:"phase-shift keying" OR abs:"phase shift keying" AND abs:neural` ; `abs:"cross-play" AND abs:communication` | 386 → 381 distinctes → 5 dans la fenêtre → 3 non vues | 1 |
| 2026-11-02 19:41 | arXiv API (relance) | `ti:"Does the Workspace Do the Work"` (0) ; `abs:"latent communication" AND (abs:causal OR abs:audit)` (6) ; `abs:"global workspace"` (60) ; `abs:theta AND abs:gamma AND abs:"phase" AND abs:coding` (2) ; `id_list` de 7 identifiants (vérification) | 75 | +1 hors fenêtre (2610.31955) |
| 2026-11-02 19:13-19:14 | OpenReview `api2` | `notes?id=hukTsKYu8Y` (403) ; `notes?forum=hukTsKYu8Y` (403) ; `notes/search?term=` × 9 : titre du concurrent ; `global workspace causal protocol` ; `workspace broadcast transplant restoration` ; `emergent communication causal intervention message` ; `learned communication channel no-communication baseline seeds` ; `spiking predictive coding error neurons` ; `inter-module communication discrete messages` ; `referential game listener uses message` ; `activation patching distribution shift intervention` | 450 notes → 138 forums → 12 hors veilles | 4 + état du concurrent |
| 2026-11-02 19:15-19:16 | GitHub `gh search repos --sort updated --limit 20` | `global workspace causal protocol` (0) ; `workspace do the work` (0) ; `AFGW` (20, homonymes) ; `global workspace transplant` (0) ; `global workspace language model causal` (0) ; `emergent communication causal` (0) ; `emergent communication` (20) ; `latent communication audit` (1) ; `positive listening` (2) ; `spiking predictive coding` (6) ; `message derangement` (0) ; `gh search code "Does the Workspace Do the Work"` (0) | 69 | 0 |
| 2026-11-02 19:16-19:17 | Hugging Face `/api/models`, `/api/datasets`, `/api/papers/search` | `global workspace`, `emergent communication`, `workspace causal`, `spiking predictive coding`, `referential game` | 0 modèle, 0 jeu de données, 125 papiers | 0 |
| 2026-11-02 19:16-19:17 | Zenodo `records?sort=mostrecent&size=25` | `"global workspace" causal` ; `"emergent communication"` ; `"workspace" broadcast transplant` ; `"predictive coding" spiking` ; `"inter-module communication"` | 113 | 0 |
| 2026-11-02 19:17 | OSF `registrations?filter[title]=` | `global workspace` (0) ; `emergent communication` (0) ; `communication` (25, hors sujet) ; `predictive coding` (21) | 46 | 0 |
| 2026-11-02 19:17 | bioRxiv `details/biorxiv/2026-10-24/2026-11-02/<curseur>` | filtre regex titre + résumé : inter-areal communication, communication subspace, inter-module, emergent communication, global workspace, predictive coding, prediction error neurons, spiking neural network, θ…γ, phase-amplitude coupling, predictive routing, ignition, broadcast | 2 034 → 11 | 2 |
| 2026-11-02 19:18 | OpenAlex (repli S2 `search`) | `Does the Workspace Do the Work causal protocol global workspace` | 10, aucun ne correspond | 0 |
| 2026-11-02 19:24 | S2 en lot (`citation_snowball.py --depth 1`) | graines : arXiv:2511.04638, arXiv:2512.18792, arXiv:2607.15495, arXiv:2503.01906, arXiv:1903.05168, arXiv:2609.34373 | 573 lignes → 547 distinctes → 324 hors listes et hors snowballs N10-D → 21 (titres 2026 filtrés) | 3 |
| 2026-11-02 19:20 | références de `hukTsKYu8Y` (`hk-txt/hk.txt:1405-1700`) | 46 entrées ; 25 arXiv ; 11 hors `seen-arxiv.txt` | 11 | 3 |

- **Identifiants** : tous ceux écrits ici ont été résolus par API avant écriture (`id_list` arXiv, Crossref / DataCite via `resolve_ids.py`, OpenReview `notes/search`). Sortie conservée dans `veille-0211/resolve-these-nerve-wml.tsv`. Les identifiants OpenReview (`hukTsKYu8Y`, `7IkH0oITID`, `Gfh4EJoWTV`, `U9WMEU4Zac`, `iu9dbz2lB9`) ont été résolus par la réponse 200 de `notes/search` contenant titre, venue et résumé.
- **Fichiers téléchargés** (`veille-0211/dl-nerve-wml/`) :
  - `arx1.json`, `arx2.json`, `or-*.json` (11), `gh.txt`, `misc.json`, `biorxiv.json`, `snowball-hk-neighbors.tsv` ;
  - PDF et texte extrait : `grant-2511.04638.pdf` / `grant.txt`, `meloux-2512.18792.pdf` / `meloux.txt`, `2609.39243.pdf/.txt`, `2610.41604.pdf/.txt`, `2604.22128.pdf/.txt` ;
  - deux pages 403 d'OpenReview enregistrées sous `or-<hash>.pdf` (HTML, non lues).
- **Scripts** : dans `work-nerve-0211/` (`arx.py`, `orq.py`, `misc.py`, `biorxiv.py`), tous lancés avec `python3 -I` sauf `arx.py`, qui ne lit aucun téléchargement.
