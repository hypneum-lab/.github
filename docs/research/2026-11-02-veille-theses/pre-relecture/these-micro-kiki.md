# micro-kiki — thèse, veille et relecture (2026-11-02)

*Passe du 02/11/2026 (19:10-19:40 CET). Clone `clones/micro-kiki` au SHA 61056d9 ; `clones/micro-kiki-quantum` au SHA 236239f (borne C5). Aucun calcul lancé, aucune préreg touchée, aucun verdict de campagne. Chemins `mk/` = clone micro-kiki ; `cat/` = `clones/.github/docs/research/2026-11-01-analyse-profonde/catalogue-v2.md` ; `bs/` = `…/brainstorm-micro-kiki.md` du même dossier ; `inv/` = `inventory/micro-kiki.md`.*

- **Fenêtre** : soumissions du 2026-10-24 au 2026-11-02 ; trois sources plus anciennes entrent marquées « ancien, non vu » parce qu'elles tranchent une ligne de la section 2.
- **Requêtes (résumé)** : arXiv (20 + 5 requêtes datées, 11 recherches par titre), OpenReview (5 requêtes `term=`), OpenAlex en repli de Semantic Scholar (6 requêtes), Crossref et DataCite (5 DOI), bioRxiv (balayage complet de la fenêtre, filtre par mots-clés), GitHub (5), Hugging Face (4), Zenodo (4), OSF (4). Requêtes exactes au §8.
- **Comptes** : 687 bruts (dont 23 touches bioRxiv sur 2 034 prépublications balayées) → 64 non vus et lus en résumé après tri par titre → **19 gardés** (16 entrées au §3, plus 3 citées en contexte).
- **Lecture** : 4 sources lues en partie (texte intégral ouvert, sections indiquées) : arXiv:2411.19379, arXiv:2610.41508, arXiv:2409.08290, arXiv:2605.11999. Toutes les autres le sont en résumé seulement, marquées « [résumé moteur] » ou « [titre seul] ». Aucune n'a été lue en entier de la première à la dernière page.

## 1. La thèse en une phrase, telle que le dépôt la formule

« 35 v4 domain-expert LoRA stacks + 6 v2 retrains = 41 adapter artefacts, cognitive layer on Qwen3.6-35B-A3B (native MoE, 256 experts, 3B active) » (`mk/README.md:3`). Le résumé du papier système parle d'un « production system that serves 35 domain-specialized LoRA adapters » avec un pipeline cognitif en sept étages (`mk/paper/micro-kiki.tex:50`). Le dépôt porte aussi deux lignes satellites : la borne C5 de Paper A (`mk/docs/paper-a/c5-info-bound.tex:22-30`) et la mesure J/token NH-81 (`mk/docs/prereg/2026-10-25-nh81-joules-per-token.md:22,97-100`).

## 2. État de la thèse au 02/11

| Affirmation | Statut 24/10 | Requalification 01/11 (catalogue v2) | Ce que la veille du 02/11 change | Source résolue |
|---|---|---|---|---|
| Routeur 46,4 % top-1, « 2,2× » mieux que mots-clés, couche cognitive « +7 pp » (`mk/README.md:9` ; `mk/paper/micro-kiki.tex:50`) | claims descriptifs (MK-01, MK-02, MK-09) | rapport technique ; A/B nul Δ = −0,0102 ; routage saturé (`cat/` table C l.44 ; table A l.209, 210, 216) | **confirme** la saturation. Trois soumissions ARR d'octobre 2026 proposent encore un routeur de bibliothèque LoRA sans entraînement dédié. Rien n'infirme la requalification | OpenReview r0fc1l2JMi, kR7Pgb9O8c, J6w08Ak7au [résumé moteur] |
| Null-space « superflue sur MoE », « novel finding » (`mk/paper/micro-kiki.tex:273-274`) | MK-03 non concluant ; NH-84 PRÊT | MK-03 inchangé (`cat/` table A l.211) ; NH-84 inchangé (table B l.326) | **rien** de décisif. NP-LoRA, révisé le 30/10, traite des sous-espaces LoRA qui se recouvrent sans être orthogonaux, en fusion d'images. La contradiction par Chowdhury et al. reste à une seule source. Une copie OpenReview de cette prépublication existe, mais ce n'est pas une version revue | arXiv:2511.11051 [résumé moteur] ; arXiv:2609.03150 (déjà vu, rappelé) ; OpenReview BUUiqKt6OZ |
| Borne C5 : I(M;Y) ≤ S(ρ_Y) ≤ N (`mk/docs/paper-a/c5-info-bound.tex:24`) | MK-23 confirmé (cohérent, non serré) | DPI I ≤ H(Y) seulement (`cat/` table C l.45 ; table A l.229) | **rien**. Sur la fenêtre, arXiv renvoie deux résultats « Holevo », tous deux hors sujet. OpenReview renvoie une soumission ICLR 2026 de 2025 (bornée par Holevo-Hayashi, autoencodeur à un qubit), sans rapport avec un plafond appliqué à des espérances. `micro-kiki-quantum` ne contient aucune borne Holevo ni Fano (grep vide au SHA 236239f), ce qui confirme `inv/:345` | — |
| NH-81 : J/token impulsionnel contre dense, négatif « vendable » | PRÊT (décisif) | clos par erratum : R ≤ 1 par construction de la voie fused (`cat/` table C l.46 ; table B l.323) | **confirme la direction** par une source revue. D'après Yan et al. (TCAD 2026), les évaluations analytiques négligent le mouvement de données. Toujours selon eux, à T = 5 un SNN ne bat un QNN de même capacité que sous un taux de décharge de 5,7 %, et seulement sur matériel neuromorphe. Le taux mesuré par NH-81 est de 13,8 % (`inv/:199`), sur GPU et Apple Silicon. Inférence : aucun avantage n'était attendu, quelle que soit l'implémentation | arXiv:2409.08290 ; DOI 10.1109/tcad.2026.3718799 |
| SNN 35B sur Loihi-2 : 0,032 mJ/token, 91,6× moins d'opérations | MK-17 non testé (théorique) | inchangé (`cat/` table A l.224, qui cite `README.md:322`) | **confirme le retrait déjà fait** dans le dépôt (`mk/README.md:332,386`, « withdrawn »). Yan et al. montrent que le comptage AC/MAC sans accès mémoire produit des conclusions trompeuses, et MK-17 reposait sur ce comptage. Le catalogue devrait passer MK-17 de « non testé » à « rétracté » et corriger sa ligne (322 → 332) | arXiv:2409.08290 |
| Niche « J/token sur Apple Silicon » (`bs/:15`) | piste R9 | en partie prise (GreenBench, Alfarizy et al., acte IEEE) | **rien de neuf** sur Apple dans la fenêtre. Ma et al. (v2 du 29/10) fixent une convention utile à l'erratum : prefill mesuré sans cache de préfixe, decode limité par la mémoire. Un outil GitHub de mesure en direct est apparu (§5) | arXiv:2605.11999 ; arXiv:2608.28667 (déjà vu, rappelé) |
| PR #6, snapshot du cache à la frontière du prompt sur modèle hybride (`mk/docs/research/2026-10-31-prefix-cache-related-work.md:8-13`) | — (outillage) | hors catalogue ; note du 31/10 | **dépasse** la note. Marconi (MLSys 2025) pose déjà le même constat : l'état récurrent mis à jour en place ne se rembobine pas et seules les correspondances exactes sont réutilisables. Marconi garde l'état « at the last decoded token » dans tous les cas (légende de sa Fig. 4). PR #6 en est le cas à une seule entrée. HiState (30/10) le confirme et décrit Marconi de la même manière. La note du dépôt ne cite pas Marconi. La veille du 31/10 qualifiait SuffixReplay d'« exactement le mécanisme » (`clones/.github/docs/research/veille-2026-10-31.md:44`), alors que la note du dépôt le dit « neighbouring, not the same one » (`…prefix-cache-related-work.md:27`). Marconi est plus proche que l'un et l'autre | arXiv:2411.19379 ; arXiv:2610.41508 ; arXiv:2609.33477 (déjà vu, rappelé) |
| Partage d'un cache de préfixe entre piles LoRA (point ouvert, `…prefix-cache-related-work.md:35-36`) | — | hors catalogue | **précise le contrôle**. Selon Loos et al. (30/10), le cache KV d'un modèle LoRA transporte une partie du comportement appris : greffé sur la base, il le transfère, et le chemin inverse l'efface en partie. LRAgent (ICML 2026) traite du partage KV multi-LoRA pour agents | arXiv:2610.41480 [résumé moteur] ; arXiv:2602.01053 [titre seul] |
| micro-kiki#6 contre Juno#128 (`…prefix-cache-related-work.md:37-38`) | — | hors catalogue | **rien**. Aucune comparaison de code n'a été faite. Juno#128 (commit 4f09487, `veille-2026-10-31.md:42`) n'a pas été ouvert dans cette passe | — |
| Échelle effective 20, et non α/r = 2 (`mk/README.md:83` ; `mk/paper/micro-kiki.tex:197`) | MK-26 confirmé | inchangé (`cat/` table A l.231) | **rien** dans la fenêtre : deux requêtes datées sur le facteur d'échelle LoRA donnent 0 résultat. Relecture : `mk/README.md:83` dit encore « alpha = 2 × rank everywhere » avant le caveat qui le contredit. Le catalogue cite `README.md:81` et `tex:207`, alors qu'au SHA 61056d9 les lignes sont 83 et 197. L'identifiant cité à `mk/README.md:83` résout vers Chen et Villar, « Learning Rate Scaling across LoRA Ranks… » ; la loi r^(−1/2) qui lui est attribuée n'a pas été vérifiée | arXiv:2602.06204 [titre seul] ; arXiv:2606.12883 (déjà vu, rappelé) |
| NH-65 (spécialisation MI calibrée) ; NH-85 (Aeon contre RAG) | PRÊT ; PRÊT/SPÉC | NH-65 inchangé (l.307) ; NH-85 reporté après M3 (l.327) | **rien** pour NH-65. Pour NH-85, deux entrées d'information (Routed CL ; CLIK, contexte converti en LoRA en une passe). Le report n'est pas remis en cause | arXiv:2610.38796, arXiv:2610.38356 [résumé moteur] |

## 3. Veille 02/11 par axe R

### R2 / outillage (routage LoRA, cache KV multi-LoRA, préfixe)

- **2411.19379** (MLSys 2025, v3 du 2025-04-10 ; ancien, non vu) — Marconi: Prefix Caching for the Era of Hybrid LLMs, Rui Pan. Premier système de cache de préfixe pour modèles hybrides : états récurrents non rembobinables, correspondances exactes seulement, état gardé aux points de branchement et au dernier jeton décodé, admission et éviction pondérées par le calcul économisé. [lu en partie : résumé, §1, Fig. 4 et sa légende]
  → Hypneum : **dépasse** la note prefix-cache. C'est l'antériorité la plus proche de PR #6, plus proche que SuffixReplay. Impact : **Haut** (outillage, pas une hypothèse).
- **2610.41508** (2026-10-30) — HiState: Hierarchical Prefix Cache Management for Hybrid LLM Serving in Agentic Workloads, Zaifeng Pan. Les agents tronquent ou rembobinent le contexte, ce qui crée des correspondances internes sans état sauvegardé. HiState garde les états historiques sur SSD (un seul état lu par correspondance), adapte l'intervalle de sauvegarde et unifie l'éviction. Gain annoncé jusqu'à 5,73× sur le p99 du TTFT contre vLLM-Marconi. [lu en partie : résumé, §1, §2.1-2.2]
  → Hypneum : confirme que le snapshot à la frontière est l'état de l'art de base, et décrit le cas « rewind » que PR #6 ne couvre pas (un seul snapshot). Impact : **Haut** (outillage).
- **OpenReview JEqGNBEHNR** (soumission ICLR 2027, déposée le 2026-09-13) — CatchUp: Replay the First, Reuse the Rest for Prefix Caching in Hybrid LLMs. Charge l'état sauvegardé, puis rejoue une queue récente à travers les seules couches récurrentes situées avant la première couche d'attention complète. [résumé moteur ; PDF non vérifié, 403]
  → Hypneum : variante de SuffixReplay, troisième mécanisme publié sur le même problème. Impact : Moyen.
- **OpenReview bvIsNkUVdL** (soumission ICLR 2027, déposée le 2026-09-19) — Rewind: Restoring Evicted Prefix States for Hybrid LLM Agents. Garder les états complets aux frontières découple la réutilisation du préfixe de la durée de vie du cache. [résumé moteur ; PDF non vérifié]
  → Hypneum : c'est le principe du snapshot de PR #6, à l'échelle d'un serveur multi-requêtes. Impact : Moyen.
- **2610.41480** (2026-10-30) — KV-Cache Patching: Tracing How and Where Fine-Tuned Behaviors Arise, Jonas Loos. Greffer le cache KV d'un modèle affiné par LoRA sur la base transfère certains comportements (réponse en allemand, désalignement émergent). Le chemin inverse les retire en partie, et l'effet se concentre sur quelques positions. [résumé moteur]
  → Hypneum : tranche partiellement le point ouvert « K candidats du Negotiator sur un même cache de préfixe ». Partager un cache entre piles n'est pas neutre. Le protocole de contrôle de arXiv:2609.17109 (déjà vu, rappelé) reste requis. Impact : Moyen.
- **2602.01053** (ICML 2026 ; ancien, non vu) — LRAgent: Efficient KV Cache Sharing for Multi-LoRA LLM Agents. [titre seul : titre et lieu lus sur OpenReview ooRukY3zjQ, résumé non lu]
  → Hypneum : à ajouter à côté de PReCache dans la note prefix-cache. Impact : Info.
- **OpenReview qENP8ycm8b, mU0g4UJ3TC** (soumissions ICLR 2027) — AuLoRA (partage automatique du cache KV de la base entre experts LoRA, sans étiquettes) ; MuLA (« One Prefill, Many Agents »). [résumé moteur]
  → Hypneum : confirme que le partage KV multi-LoRA est un champ actif. Impact : Info.
- **OpenReview r0fc1l2JMi, kR7Pgb9O8c, J6w08Ak7au** (ARR octobre 2026) — Zero-Route LoRA (le modèle gelé choisit l'adaptateur par génération contrainte) ; LoRAWeaver (routage sans entraînement dans l'espace de sortie LoRA) ; Routing Before Training (initialisation structurelle du routeur d'un LoRA-MoE). [résumé moteur]
  → Hypneum : **confirme** « routage saturé » (catalogue table C l.44). Impact : Info.
- **2511.11051** (v révisée le 2026-10-30) — NP-LoRA: Null Space Projection for Subject-Style LoRA Fusion, Chuheng Chen. Les LoRA de contenu et de style occupent des sous-espaces qui se recouvrent, non orthogonaux. La projection sert d'opérateur de fusion. [résumé moteur]
  → Hypneum : ne tranche pas MK-03. L'article reste dans le cadre géométrique « recouvrement = conflit », hors MoE. Impact : Info.

### R6 (quantique : C5, DPI)

- Aucune entrée gardée. Sur la fenêtre, arXiv « Holevo » donne 2 résultats (diagnostics d'intrication, distribution d'intrication), tous deux hors sujet. arXiv « data processing inequality quantum » donne 1 résultat, une révision de arXiv:2608.13204 sur la tensorisation des DPI fortes. Il n'y a pas de rapport avec la DPI simple de C5. OpenReview, OSF et Zenodo : zéro résultat pertinent.
  → Hypneum : la requalification C5 → DPI I ≤ H(Y) tient. L'option « Holevo de l'ensemble » reste sans antériorité trouvée (« à recouper », une seule absence constatée par canal). Impact : Info.

### R9 (thermodynamique de l'apprentissage, J/token)

- **2409.08290** (v6 du 2026-08-04 ; version revue IEEE TCAD, DOI 10.1109/tcad.2026.3718799 ; ancien, non vu) — Reconsidering the Energy Efficiency of Spiking Neural Networks Inference from Analytical Perspectives, Zhanglu Yan. Les auteurs comparent un SNN à T pas de temps et un QNN de capacité égale (⌈log2(T+1)⌉ bits), avec un modèle d'énergie qui inclut le mouvement de données. Résultat : avantage SNN seulement si le taux de décharge est inférieur à 5,7 % à T = 5, sur matériel neuromorphe typique. [lu en partie : résumé, §I, liste de références]
  → Hypneum : **confirme** la clôture de NH-81 par une source revue (prépublication et version revue : deux natures). Donne la raison de méthode du retrait de MK-17, déjà fait dans `mk/README.md:332`. Impact : **Haut**.
- **2605.11999** (v2 du 2026-10-29) — The Illusion of Power Capping in LLM Decode: A Phase-Aware Energy Characterisation Across Attention Architectures, Bole Ma. Sur H200 et vLLM, le decode est limité par la mémoire et le plafond de puissance n'y agit presque pas. Verrouiller l'horloge SM récupère jusqu'à 32 % de l'énergie du decode. Prefill mesuré sans cache de préfixe : les architectures récurrentes n'y paient pas de pénalité. [lu en partie : résumé, §1]
  → Hypneum : convention de mesure à citer dans l'erratum NH-81 (prefill et decode séparés, cache de préfixe désactivé). Impact : Moyen.
- **2610.34763** (2026-10-25) — The Physical Cost of Context: Quality-Constrained Resource Accounting for Coding Agents, Zhongming Yu. Le prefill exécuté y est décomposé en prompt logique moins préfixe réutilisé, avec résidence KV, temps et énergie, sous une porte de non-infériorité. [résumé moteur]
  → Hypneum : la même comptabilité vaut pour PR #6 si une économie d'énergie lui est un jour attribuée. Impact : Info.
- **2610.38012** (2026-10-27) — Finite-step statistical mechanics of scale-invariant learning: spectral equations of state and curvature transport, Alexander Itin. Relations d'allure thermodynamique tirées de la symétrie d'échelle et non de l'équilibre, pour la SGD discrète. [résumé moteur]
  → Hypneum : thermodynamique de l'apprentissage, sans lien direct avec J/token. Impact : Info.
- **DOI** 10.1016/j.joule.2026.102430 (Joule, 2026-04 ; ancien, non vu) — Energy use of AI inference, efficiency pathways, and test-time scaling, Oviedo et al. [titre seul, Crossref]
  → Hypneum : référence de cadrage pour toute phrase « J/token » d'un rapport. Impact : Info.

### Thèses et HAL (couverture)

- **DOI** 10.26240/heal.ntua.33427 (2026, NTUA, DataCite) — Attention-aware routing in mixture of experts language models, Kosmopoulou. [titre seul]
  → Hypneum : routage MoE, sans lien avec le routage d'adaptateurs. Impact : Info. HAL n'a pas été interrogé (§7).

## 4. Hypothèses déjà faites ailleurs (risque de scoop)

1. **Snapshot d'état récurrent à la frontière du prompt** (PR #6) : publié par Marconi (MLSys 2025) et repris par HiState, CatchUp, Rewind et SuffixReplay. Recoupement : article revu (arXiv:2411.19379) et prépublication indépendante (arXiv:2610.41508). Aucune ligne du catalogue n'est touchée (outillage). Toute phrase « notre correctif » doit citer Marconi.
2. **« Le comptage analytique surestime le gain des SNN »** : publié (arXiv:2409.08290, et sa version TCAD). Lignes touchées : `cat/` table B l.323 (NH-81) et table A l.224 (MK-17). NH-81 n'avait pas de priorité à défendre sur ce point ; l'erratum doit le dire.
3. **Routage de bibliothèque LoRA sans entraînement** : trois soumissions ARR d'octobre s'ajoutent à Arrow, PHATGOOSE et aux quatre soumissions ICLR 2027 déjà vues. Ligne touchée : `cat/` table C l.44. Recoupement : soumissions OpenReview et articles revus (arXiv:2405.11157, arXiv:2402.05859, déjà vus, rappelés).

## 5. Outils ou jeux de données à adopter

- **Marconi** (arXiv:2411.19379) : la politique d'admission par point de branchement est le comparateur naturel si PR #6 évolue vers plusieurs snapshots. Code non vérifié dans cette passe.
- **depthark/wattllama** (GitHub, MIT, 6 étoiles, poussé le 2026-11-01) : puissance, température et énergie par jeton en direct pour un LLM local. Utile pour recouper `powermetrics` sur macM1. Toute adoption passe par la revue HITL des dépendances (`~/CLAUDE.md`, politique supply-chain). Impact : Info.
- **Protocole de arXiv:2609.17109** (déjà vu, rappelé) et **KV-Cache Patching** (arXiv:2610.41480) : le contrôle à faire avant tout partage de cache entre piles.
- Hugging Face et Zenodo : rien à adopter (dépôts LoRA génériques sans rapport, bruit plein texte côté Zenodo).

## 6. Ce qui reste ouvert et le prochain pas sous le verrou (pas de run)

1. **Note prefix-cache** : ajouter Marconi comme antériorité la plus proche et HiState pour le cas « rewind ». Corriger la phrase de la veille du 31/10 (`veille-2026-10-31.md:44`), qui confond SuffixReplay et PR #6. Coût : 1 h de rédaction, une PR documentaire.
2. **micro-kiki#6 contre Juno#128 contre Marconi** : lecture de code comparée (snapshot `tokens[:-1]` + `deepcopy`, commit 4f09487 de Juno, état au dernier jeton chez Marconi). Coût : 2 h de lecture. Ce qui est encore ouvert relève de l'ingénierie : le coût mémoire du `deepcopy` d'un `ArraysCache`. Ce n'est pas une question scientifique.
3. **Erratum NH-81** (idée 1 de `bs/:28`) : citer arXiv:2409.08290 (seuil de 5,7 % contre 13,8 % mesurés) et arXiv:2605.11999 (convention prefill/decode). Citer la même source pour le retrait de MK-17 (déjà fait dans `mk/README.md:332,386`) et corriger son statut dans le catalogue. Coût : 1 h. L'écart 0,67/0,91 entre plateformes reste une observation d'ingénierie.
4. **Lectures intégrales manquantes** avant toute décision : GreenBench (arXiv:2608.28667, en attente depuis le 01/11), KV-Cache Patching (arXiv:2610.41480), Marconi §4-5 (politiques). Coût : 4 h.
5. **Hygiène** : corriger `mk/README.md:83` (« alpha = 2 × rank everywhere » contredit son propre caveat) ; mettre à jour les numéros de ligne de MK-26 dans le catalogue (README:83, tex:197) ; vérifier la loi r^(−1/2) attribuée à arXiv:2602.06204. Coût : 1 h.
6. **Borne de Holevo de l'ensemble** (idée 3 de `bs/:30`) : toujours optionnelle, sans antériorité trouvée. Rien à lancer.

Aucun de ces pas n'est un run. Le contrôle numérique des idées 2 à 4 du brainstorm reste un pilote CPU non citable tant qu'il n'a pas sa note de lecture.

## 7. Non vérifié / inaccessible

- **OpenReview** : `api2.openreview.net/notes?id=` renvoie 403 (« ChallengeRequiredError ») pour les 14 notes demandées. Les résumés viennent de `notes/search`, et aucun PDF n'a été ouvert. Pas de version arXiv trouvée par titre pour CatchUp, Rewind, HiServe, AuLoRA, MuLA, LoRAWeaver ni Routing Before Training.
- **arXiv export API** : 13 requêtes sur 14 en HTTP 429 à 19:11, puis encore 429 après 6 essais à 19:12. Repli : `arxiv.org/search/advanced` (HTML, filtre de date de soumission), qui ne trie pas par pertinence. Une requête comme « adapter routing » sort en OU (100 résultats, dont la plupart hors sujet).
- **Semantic Scholar** : 429 sur les 6 recherches, repli automatique de `s2.py` sur OpenAlex. Aucun appel `lookup` en lot nécessaire.
- **HAL / thèses** : non interrogés directement. Une seule thèse est arrivée par OpenAlex (NTUA).
- **Juno#128** et le code vLLM-Marconi n'ont pas été ouverts. LRAgent : titre seul. Joule 2026 et la thèse NTUA : titre seul.
- Le résumé de arXiv:2602.06204 n'a pas été récupéré : seul le titre est vérifié.

## 8. Journal

| Date-heure (CET) | Canal | Requête exacte | Brut → non vu → gardé |
|---|---|---|---|
| 02/11 19:11:06 | arXiv API | `(abs:LoRA AND (abs:routing OR abs:router OR abs:mixture)) AND submittedDate:[202610240000 TO 202611022359]` | 7 → 7 → 0 (doublons de la recherche HTML) |
| 02/11 19:11-19:12 | arXiv API | 13 autres requêtes (multi-LoRA, prefix caching, KV cache LoRA, linear attention cache hybrid, Holevo, DPI quantique, QML classification, energy per token, spiking LM, Apple Silicon, thermodynamique, model merging LoRA, MoE specialization) | 429 → non exécutées |
| 02/11 19:12-19:30 | arXiv API (relance avec attente croissante) | 7 des requêtes ci-dessus (multi-LoRA, prefix caching, KV cache + LoRA/adapter, linear attention cache hybrid, Holevo, DPI quantique, QML classification) | 3 en 429 définitif ; 16 bruts → 12 non vus → 0 nouveau gardé (2610.41480 déjà retenu par la recherche HTML) |
| 02/11 19:15:25 | OpenReview `notes/search?term=…&source=forum&limit=25` | `LoRA routing` ; `multi-LoRA KV cache` ; `prefix caching hybrid` ; `Holevo bound` ; `energy per token` | 125 → 22 → 10 |
| 02/11 19:17:15 | GitHub `gh search repos … --sort updated --limit 20` | `lora router` ; `multi-lora serving` ; `prefix cache hybrid` ; `mlx prompt cache` ; `energy per token` | 55 → 1 (≥ 5 étoiles, poussé ≥ 24/10) → 1 |
| 02/11 19:17:22 | Hugging Face | models `lora router`, `multi-lora` ; datasets `energy per token`, `llm energy` | 60 → 0 → 0 |
| 02/11 19:17:22 | Zenodo `records?q=…&sort=mostrecent&size=20` | `LoRA routing` ; `Holevo bound machine learning` ; `energy per token LLM` ; `prefix caching` | 80 → 0 → 0 (bruit plein texte) |
| 02/11 19:17:22 | OSF `registrations/?filter[title]=…` | `LoRA` ; `energy per token` ; `Holevo` ; `spiking language` | 25 → 0 → 0 |
| 02/11 19:18:25 | Semantic Scholar → OpenAlex (`s2.py search --year 2026-`) | `prefix caching hybrid linear attention recurrent state` ; `KV cache sharing multi-LoRA` ; `LoRA adapter routing library` ; `Holevo bound quantum classifier` ; `energy per token LLM inference measurement` ; `spiking language model energy` | 90 → 7 → 3 |
| 02/11 19:19-19:23 | bioRxiv `details/biorxiv/2026-10-24/2026-11-02/<cursor>` | filtre : metabolic cost of learning/plasticity/memory, energy cost of learning/synaptic, thermodynamic, Landauer, mixture of experts, low-rank adapt, Holevo, joule | 2 034 balayées → 23 → 0 |
| 02/11 19:20 | Crossref / DataCite | 10.1109/tcad.2026.3718799 ; 10.1016/j.joule.2026.102430 ; 10.1007/s11128-026-05356-1 ; 10.26240/heal.ntua.33427 (DataCite) | 4 → 4 → 3 |
| 02/11 19:21:10-19:22:42 | arXiv `search/advanced`, champ all, date de soumission 2026-10-24 → 2026-11-02 | `LoRA routing` ; `LoRA router` ; `multi-LoRA` ; `mixture of LoRA experts` ; `adapter routing` ; `prefix caching` ; `KV cache LoRA` ; `hybrid linear attention cache` ; `recurrent state checkpoint prefix` ; `Holevo` ; `data processing inequality quantum` ; `quantum machine learning classification bound` ; `energy per token` ; `joules per token` ; `Apple Silicon` ; `spiking language model` ; `spiking neural network energy efficiency` ; `thermodynamics of learning` ; `Landauer learning` ; `LoRA orthogonal subspace interference` | 195 → 155 non vus (≈ 30 pertinents au titre) → 9 |
| 02/11 19:24 | arXiv `search`, champ titre, sans date | CatchUp ; Rewind ; HiServe ; Marconi ; AuLoRA ; MuLA ; LRAgent ; Reconsidering the Energy Efficiency of SNN ; Zero-Route LoRA ; LoRAWeaver ; Routing Before Training | 4 → 4 → 3 (2411.19379, 2409.08290, 2602.01053) |
| 02/11 19:26:21-19:26:46 | arXiv `search/advanced` (même filtre) | `LoRA scaling factor` ; `LoRA alpha` ; `expert specialization mixture of experts` ; `router calibration mixture of experts` ; `Apple M-series inference energy` | 7 → 4 → 0 |

- **Dédoublonnage** : `veille-0211/seen-arxiv.txt` et `seen-doi.txt`. Les titres OpenReview ont été cherchés par grep dans `clones/.github/docs`, `veille/`, `inventory/` et `library/`. InvisibleLoRA, PAIR, COACH et Parametric Memory Decoding étaient déjà vus et ont été écartés.
- **Téléchargements** (`veille-0211/dl-micro-kiki/`) : `2411.19379.pdf`, `2610.41508.pdf`, `2409.08290.pdf`, `2605.11999.pdf` (et leurs extractions .txt) ; JSON `arx1.json`, `arx2.json`, `arxs.json`, `arxs2.json`, `or_*.json`, `biorxiv.json`, `cr_*.json` ; `s2search.txt`. Scripts dans `veille-0211/scripts-mk/`, lancés avec `python3 -I`.
- **Résolution** : `python3 -I clones/.github/scripts/resolve_ids.py veille-0211/these-micro-kiki.md`, sortie dans `veille-0211/resolve-these-micro-kiki.tsv`. Les identifiants OpenReview ont été résolus par l'API `notes/search` (titre et lieu lus dans la réponse).
