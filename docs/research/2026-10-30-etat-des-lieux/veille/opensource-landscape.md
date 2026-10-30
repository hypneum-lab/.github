# Veille open source et données ouvertes pour Hypneum Lab (2026-10-30)

Méthode : requêtes réelles le 2026-10-30 (`gh api`, API HF, API Zenodo, API OSF, API Software Heritage, PyPI, Exa). Les chiffres GitHub (étoiles, `pushed_at`, licence) viennent de `gh api repos/...`. Les entrées marquées **[Exa]** n'ont été lues que via le moteur de recherche (résumé de page ou résumé arXiv) : l'URL existe dans les résultats, mais je n'ai pas relu la page entière. Les dates arXiv sont celles de l'identifiant ou de la date affichée.

Limites générales : (1) `gh search` trié par étoiles avec filtre `pushed>2026-04-01` écarte les bibliothèques établies mais dormantes, donc je les ai interrogées une par une. (2) Papers with Code n'existe plus : `paperswithcode.com` répond 302 vers `https://huggingface.co/papers/trending`. Le module « papers » de HF est donc la seule source équivalente, et son API de recherche n'a pas été exploitée ici. (3) OpenReview n'a pas été interrogé directement (liens code relevés via Exa seulement). (4) Aucun accès SSH, rien n'a été modifié.

---

## A. État public de hypneum-lab (mesuré)

**GitHub** (org `hypneum-lab`, 11 repos, tous poussés du 24 au 30 octobre 2026) :

| Repo | Étoiles | Forks | Licence | Dernier push |
|---|---|---|---|---|
| micro-kiki | 4 (acivilis, nightscape, mike7seven, jessefrye) | 1 | Apache-2.0 | 2026-10-30 |
| nerve-wml | 1 | 0 | MIT | 2026-10-30 |
| dream-of-kiki, kiki-flow-research, bouba_sens, baby-brain, micro-kiki-quantum | 0 | 0 | MIT / Apache | 2026-10-23 à 30 |
| BabyBrain, whisperx-server, moshivis, .github | 0 | 0 | variée / absente | 2026-10-24/25 |

URL : https://github.com/hypneum-lab (vérifiée via `gh api orgs/hypneum-lab/repos`). Releases : micro-kiki v0.3.0 (2026-04-20), nerve-wml v1.8.1 (2026-05-10). Les vues sur 14 jours (endpoint traffic) : micro-kiki 14, nerve-wml 15, dream-of-kiki 13, bouba_sens 6, kiki-flow-research 1. Ordre de grandeur : trafic quasi nul, et une partie vient sans doute de vos propres visites.

**Citations et forks externes** : aucune trouvée. `gh search repos "nerve-wml OR dreamOfkiki OR kiki-flow"` ne renvoie que `hypneum-lab/*` et du bruit sans rapport (des « KIKI-flower »). `gh search code "hypneum-lab" -org:hypneum-lab` renvoie vos propres dépôts personnels (electron-rare, ailiance) et un repo tiers (`1h0lde4/ocbrain-v4.1`) qui ne mentionne qu'un document de veille. Semantic Scholar ne connaît pas le DOI nerve-wml (« not found »). Conclusion : zéro citation détectable, zéro fork externe.

**Hugging Face** (org `hypneum-lab`) : 6 modèles (`micro-kiki-v35b`, `micro-kiki-router-v3-minilm`, `micro-kiki-v4-sota`, `micro-kiki-stack-chat-fr`, `micro-kiki-stack-spice`, `spikingkiki-v4-lif-metadata`), 0 dataset, 0 space. Téléchargements affichés : 0, likes : 0. URL : https://huggingface.co/api/models?author=hypneum-lab. Le dépôt `micro-kiki-v35b` est créé le 2026-04-19 (tags « historical », base Qwen3.6-35B-A3B). Aucun dataset publié côté HF : les datasets sont sous `clemsail/...` (hors org), donc non visibles par une recherche sur l'org.

**Zenodo** (requête `q=...` sur les noms de projets, 5 enregistrements) :
- nerve-wml v1.8.0, DOI 10.5281/zenodo.20108695, 57 téléchargements uniques, 177 vues uniques (maj 2026-05-10), licence MIT.
- kiki-flow-research, DOI 10.5281/zenodo.23636477, 8 téléchargements, 32 vues (maj 2026-10-25).
- micro-kiki, DOI 10.5281/zenodo.19666760, 3 téléchargements, 19 vues.
- bouba_sens, DOI 10.5281/zenodo.20108830, 5 téléchargements, 12 vues.
- dreamOfkiki, DOI 10.5281/zenodo.19701356, 4 téléchargements, 7 vues. Il est lié à OSF 10.17605/OSF.IO/Q6JYN et à `github.com/hypneum-lab/dream-of-kiki`.

**OSF** (API `api.osf.io/v2/registrations`, filtre titre) : 2 préregistrations publiques « dreamOfkiki » : https://osf.io/q6jyn (2026-04-19) et https://osf.io/tpm5s (amendement n°1 « Bonferroni family restructure (pre-data) », 2026-04-21). Aucune pour « Hypneum », « nerve », « GENIAL » (les 4 résultats « GENIAL » sont des faux amis : « congeniality »). Je n'ai pas pu confirmer par titre l'existence publique d'une préreg OSF pour bouba_sens : la recherche « bouba » renvoie 15 registrations, j'ai lu les 10 premières, toutes d'autres équipes. À vérifier à la main (peut être enregistrée sous un autre titre ou en embargo).

**Software Heritage** : `nerve-wml` est archivé (visite n°2 le 2026-10-29, statut full, snapshot `01242c8b...`), vérifié via `archive.softwareheritage.org/api/1/origin/https://github.com/hypneum-lab/nerve-wml/visit/latest/`. `dream-of-kiki` n'est **pas** archivé (réponse `NotFoundExc`). Action : déclencher « Save code now » pour les autres repos (le `save` est une action en écriture externe, non faite ici).

**Ce que ça change** : la visibilité externe est quasi nulle, donc le risque de scoop ne vient pas de gens qui vous copient mais de gens qui font la même chose indépendamment. Il y a un levier peu coûteux : archiver tous les repos sur SWH et mettre des DOI Zenodo à jour avant tout dépôt arXiv.

---

## 1. Hopfield modernes, dreaming, unlearning

**Bibliothèques établies (dormantes, à connaître)**
- `ml-jku/hopfield-layers` https://github.com/ml-jku/hopfield-layers : 1 969 étoiles, dernier push 2023-04-23, licence NOASSERTION (fichier de licence non standard, à lire avant réutilisation). Référence PyTorch de Ramsauer et al. Plus maintenue. Pour Hypneum : bon étalon d'équivalence attention-Hopfield, pas une base de code vivante.
- `bhoov/energy-transformer-jax` https://github.com/bhoov/energy-transformer-jax : 69 étoiles, push 2023-12-14, Apache-2.0. Plus maintenu non plus. Aucune implémentation MLX de Hopfield/DAM trouvée (`gh search "hopfield mlx"` : 0 résultat). Pour Hypneum : un port MLX d'un module DAM serait inédit, donc exploitable, mais ce n'est pas un trou que quelqu'un d'autre comble.
- `alexiglad/EBT` https://github.com/alexiglad/EBT : 664 étoiles, push 2026-04-21, Apache-2.0. Energy-Based Transformers (PyTorch). Voisin conceptuel, pas du Hopfield au sens strict.

**Littérature récente sur le dreaming/unlearning (tous 2026, théorie surtout)**
- Marinari, Rossi, Zamponi, « Dreaming improves memorization in a Hopfield model with bounded synaptic strength », arXiv 2603.09384 (2026-03-10) https://arxiv.org/abs/2603.09384 (HTTP 200) **[Exa pour le résumé]**. Alternance apprentissage/rêve avec synapses bornées. Pas de code annoncé.
- « Do Hopfield Networks Dream of Stored Patterns? » (DLAM, théorie statistique du rêve dans les mémoires associatives multidirectionnelles), arXiv 2605.13721, code https://github.com/andrea-ladiana/dlam-mc-core (0 étoile, MIT, push 2026-10-16, repo existant vérifié par `gh api`). **[Exa]** Résultat qui compte : « off-line consolidation substitutes for additional training data », c'est-à-dire un compromis données/calcul pour le sommeil, exactement le terrain de dream-of-kiki. Auteurs non vérifiés par moi.
- « Analysis of the Hopfield Model Incorporating the Effects of Unlearning », arXiv 2602.08428 https://arxiv.org/html/2602.08428 **[Exa]**.
- « Daydreaming Hopfield Networks », Neural Networks 2025 (Serricchio, Cammarota et al.), DOI 10.1016/j.neunet.2025.107216 **[Exa]**. Hors fenêtre (2025) mais c'est la référence « dreaming non destructif ».
- Petits repos de reproduction : `takesyu1928/hopfield_unlearning_reproducibility` (MIT, push 2026-06-15, 0 étoile), `MachineLearning-Nerd/icml26-dense-associative-memory-gaussian-distributions` (reproduction de arXiv:2509.23162, push 2026-08-19), `thinkthoughts/lean-dense-associative-memory` (formalisation Lean, Apache-2.0, push 2026-10-29, 1 étoile). Intéressant pour vous : une formalisation Lean de DAM existe déjà, utile si dream-of-kiki vise une preuve formelle.

**Ce que ça change** : le sujet est actif côté physique statistique (Rome, Italie), avec des théoriciens qui publient des résultats analytiques sur « sommeil = filtrage spectral de la matrice de couplage ». Pas d'implémentation MLX concurrente. Il faut citer ces travaux et se positionner sur le terrain que la théorie ne couvre pas (substrat, LLM réel, mesure).

---

## 2. Émergence de communication multi-agent

- `facebookresearch/EGG` https://github.com/facebookresearch/EGG : 323 étoiles, MIT (+ LARC BSD-3), **archivé**, push 2025-05-06. PyTorch, canal discret REINFORCE / Gumbel-Softmax, jeux de Lewis et référentiels. Base solide mais gelée.
- `google-deepmind/emergent_communication_at_scale` https://github.com/google-deepmind/emergent_communication_at_scale : 39 étoiles, Apache-2.0, JAX/Haiku/Jaxline, code ICLR 2022 **[Exa pour les détails]**. Seule base JAX de jeu de Lewis en population.
- `FLAIROx/JaxMARL` : le repo a déménagé, `gh api` renvoie maintenant `bold-lab-ai/JaxMARL`, 869 étoiles, Apache-2.0, push 2026-10-26. https://github.com/bold-lab-ai/JaxMARL. Environnements et algos MARL en JAX (IPPO/MAPPO). À vérifier : le nom de l'org a changé, anciennes URLs `FLAIROx` redirigent probablement.
- `instadeepai/Mava` 940 étoiles, Apache-2.0, push 2026-09-09. `Farama-Foundation/PettingZoo` 3 544 étoiles, MIT, push 2026-10-09.
- Autres : `TimotheeMickus/LEMURIA` (boîte à outils de métriques pour jeux de signalement, **[Exa]**), `Near32/ReferentialGym` (23 étoiles, MIT), `y4sh-codes/abstractComm` (Apache-2.0, push 2026-10-12, canal discret pour LLM Qwen), `naomipitzer/heterogeneous-emergent-communication` (EvoLang 2026, MIT, communication entre modalités hétérogènes). Tous petits (0 à 3 étoiles).
- Survey : « The Five Ws of Multi-Agent Communication », arXiv 2602.11583 (2026-02) **[Exa]**.

**« Dead-ReLU trunk collapse » avec récompense d'équipe creuse** : je n'ai trouvé **aucun rapport portant ce nom ou ce phénomène exact en communication émergente**. Ce qui s'en approche : Lyle/Moalla et al. « No Representation, No Trust » (arXiv 2405.00662, 2024, hors fenêtre) https://arxiv.org/html/2405.00662v1 : chute de rang des features et perte de plasticité dans PPO, aggravées par un tronc partagé acteur-critique **quand la récompense est creuse** (le rang du critique s'effondre en environnement à récompense creuse, cas Gravitar), avec correctif PFO (code CLAIRE-Labo/no-representation-no-trust). Les papiers MARL 2026 relevés évoquent seulement l'effondrement du gating (« toujours actif / jamais actif ») et la variance de crédit sous récompense creuse (SCoUT arXiv 2603.04833). **Pour Hypneum** : le papier de 2024 est la citation à utiliser pour votre observation, et PFO (régularisation des features) est le premier remède à tester. Votre cas serait donc un résultat négatif/descriptif nouveau dans le cadre communication, pas une redite, mais à formuler avec prudence puisque je n'ai pas fait une revue exhaustive.

**Ce que ça change** : pour reproduire un jeu à canal discret, partir d'EGG (pour la comparabilité) mais ne pas compter sur sa maintenance ; JaxMARL est la seule base vivante pour PPO multi-agent rapide (JAX, pas MLX).

---

## 3. Flots de Wasserstein, JKO, Sinkhorn

- `PythonOT/POT` https://github.com/PythonOT/POT : 2 860 étoiles, MIT, push 2026-10-28. Référence, toujours très active.
- `ott-jax/ott` https://github.com/ott-jax/ott : 770 étoiles, Apache-2.0, push 2026-09-18. Sinkhorn, bas rang, Gromov-Wasserstein, tutoriel flot de gradient de la divergence de Sinkhorn dans la doc (https://ott-jax.readthedocs.io/tutorials/linear/200_sinkhorn_divergence_gradient_flow.html). Pas de solveur JKO dédié dans la liste de modules lue.
- `jeanfeydy/geomloss` 714 étoiles, MIT, push 2026-05-12. Sinkhorn débiaisé, exactement le remède au biais entropique que vous mesurez (KL 0 → 8,3 bits).
- `MuXauJl11110/iJKOnet` https://github.com/MuXauJl11110/iJKOnet : ICLR 2026, apprentissage de dynamiques de population par optimisation inverse du schéma JKO **[Exa]** (étoiles non vérifiées). `clbonet/Sliced-Wasserstein_Gradient_Flows` : JKO en espace Sliced-Wasserstein (**[Exa]**). `gpeyre/2015-SIIMS-wasserstein-jko` : approximation entropique de référence (Matlab). `hanjq17/W-Flow` (87 étoiles, MIT, push 2026-06-09) : génération en un pas par flot de Wasserstein.
- Aucun solveur JKO ou Sinkhorn en MLX hors du vôtre : `gh search "sinkhorn mlx"` : 0 résultat. Votre `kiki-flow-research` (README lu via Exa : « MLX Sinkhorn 5,13 fois plus rapide que POT sur le solveur JKO T2, GrosMac M5 ») est donc, à ma connaissance, le seul. Réserve : mesure à lire dans `bench/T2_backend_speedup.jsonl` du repo, que je n'ai pas relancée.

**Ce que ça change** : (a) remplacer ou doubler vos calculs Sinkhorn par la divergence de Sinkhorn de `geomloss`/`ott` pour tester si le « biais entropique » mesuré disparaît (contrôle peu coûteux) ; (b) garder POT comme oracle de vérification numérique pour le backend MLX ; (c) positionnement : l'application « consolidation de LLM par flot de Wasserstein » n'a pas de concurrent direct trouvé.

---

## 4. Oubli dans MoE et apprentissage continu sur LLM 4B–35B

**Benchmarks de connaissances temporelles et contamination**
- Daily Oracle : dataset HF `agentic-learning-ai-lab/daily-oracle`, 236 téléchargements, modifié 2026-07-19. https://huggingface.co/datasets/agentic-learning-ai-lab/daily-oracle.
- MMLU-CF : `microsoft/MMLU-CF`, 5 158 téléchargements, modifié 2025-01-08 ; un miroir `budecosystem/mmlu_cf` (226 téléchargements, 2026-07-14). Un dataset d'embeddings `clm-project/jev-boost-kn2-mmlu-cf-qwen3.6-35b-a3b-fp8-embeddings` (49 téléchargements, 2026-10-25) montre quelqu'un qui travaille sur MMLU-CF avec Qwen3.6-35B-A3B : même modèle que micro-kiki, **à surveiller**.
- RealTime QA : seulement des dérivés (`SKIML-ICL/CRRAG_realtimeqa*`, `prajaktakini/realtime_qa`, 2 à 17 téléchargements, 2025). Pas de dépôt officiel actif retrouvé sur HF.
- Outils de contamination : peu de choses sérieuses en open source. `stef41/datacrux` (2 étoiles, Apache-2.0, push 2026-04-10), le reste est constitué de petits projets d'étudiants. L'article Nature Human Behaviour « How Registered Reports can improve trust in ML research » (2026-09-10) https://www.nature.com/articles/s41562-026-02586-2 **[Exa]** donne le principe utile : valider sur des données **postérieures à la date de coupure** du modèle ou sur des modèles à corpus connu.

**Oubli dans MoE (articles 2026, code partiel)**
- MH-MoE, arXiv 2602.12587 (2026-02-13) : même avec routage clairsemé et équilibré, un MoE oublie (LoRAMoE : BWT −11,2 % sur Qwen3-0.6B, −5,5 % sur Qwen3-8B, benchmark TRACE) ; l'attention multi-têtes avant le routeur est incriminée **[Exa]**.
- PASs-MoE (ACL 2026 long) https://aclanthology.org/2026.acl-long.1474/ code `yueluoshuangtian/PASs-MoE` ; CP-MoE arXiv 2605.20247 code `YangLiu-Lewis/CP-MoE` ; « Routing Is Not Enough », EMNLP Findings 2026 https://aclanthology.org/2026.findings-emnlp.414.pdf (interférence à l'intérieur du sous-espace d'un même adaptateur malgré routage disjoint) ; MoE²-LoRA arXiv 2607.21978 (2026-07-24) testé sur Qwen3-30B-A3B et Qwen3.5-35B-A3B **[Exa pour tous]**. Ce dernier fait exactement du fine-tuning LoRA sur MoE de la famille de votre base.
- Replay planifié : FOREVER (arXiv 2601.03938, code `WoodScene/FOREVER`), MSSR (arXiv 2603.09892) **[Exa]**.

**Sommeil/replay appliqué aux LLM** (voir aussi section B, risque de scoop) : Behrouz et al. (Google), « Language Models Need Sleep », arXiv 2606.03979 (2026-07-10) https://arxiv.org/abs/2606.03979 (HTTP 200) ; version CMU de même titre, arXiv 2605.26099 ; SleepGate arXiv 2603.14517 ; SCM arXiv 2604.20943 ; « Not Just After One » arXiv 2606.08447 ; `mrG7/sleeping-llm` (MEMIT puis consolidation LoRA, **[Exa]**).

**Ce que ça change** : votre résultat « oubli 0,361 ± 0,010 à 5 000 échantillons contre 0,085 à 500 » (README kiki-flow-research, via Exa) est du même type que les diagnostics de MH-MoE et « Routing Is Not Enough ». Utiliser TRACE (8 tâches, protocole standard, métriques OP et BWT) comme banc commun plutôt qu'un banc maison permettrait de comparer à LoRAMoE/O-LoRA/MH-MoE. Pas de preuve que TRACE tourne sur Qwen3.6-35B-A3B : à vérifier.

---

## 5. Audio-visuel cross-modal auto-supervisé

- ActionSense (NeurIPS 2022 D&B, MIT CSAIL) : site https://action-sense.csail.mit.edu répond 200. Capteurs : EMG avant-bras, gants tactiles, oculométrie, caméras, micros, cuisine. Je n'ai pas vérifié la licence ni la taille actuelle du dataset sur le site.
- Studyforrest : https://www.studyforrest.org répond 200 (IRM fonctionnelle sur film et audio ; licence non relue ici, historiquement PDDL/CC0).
- Autres corpus relevés **[Exa]** : dataset multimodal de cuisine 17 outils / 20 sujets, ~11 h, 7 modalités (Scientific Data, 2025-03-21) https://www.nature.com/articles/s41597-025-04798-z ; SoundingActions arXiv 2404.05206 (embedding contrastif audio-langage-vision, Ego4D et EPIC-Sounds) ; RepLAI arXiv 2209.13583 (code public).
- bouba/kiki côté ML : rien de sérieux sur GitHub (4 petits repos de jeux ou synthés, 1 à 3 étoiles, p. ex. `charlesvestal/schwung-bouba-kiki`). Côté sciences cognitives, OSF contient 15 préregistrations « bouba-kiki » (par ex. https://osf.io/2szma « Preregistered Replication of the Kiki/Bouba Effect », https://osf.io/s8prt, nourrissons de 18 à 20 mois). **Ce que ça change** : ces préregs humaines sont des cibles de comparaison (effet attendu, tailles d'échantillon, stimuli) et aucun concurrent ML n'a été trouvé sur « bouba_sens ».
- CKA : `RistoAle97/centered-kernel-alignment` (83 étoiles, MIT, PyTorch, push 2026-10-24) ; `ryusudol/Centered-Kernel-Alignment` (6 étoiles, MIT, 2026-10-07, « le plus rapide »). Aucun port MLX vu.

---

## 6. Mesure d'énergie GPU / Apple Silicon

- `ml-energy/zeus` https://github.com/ml-energy/zeus : 385 étoiles, Apache-2.0, push 2026-10-29. Mesure NVML, protocole de référence ML.ENERGY.
- `ml-energy/zeus-apple-silicon` https://github.com/ml-energy/zeus-apple-silicon : 10 étoiles, Apache-2.0, push 2026-04-02 ; PyPI `zeus-apple-silicon` 1.1.0. Lit les compteurs IOReport (Energy Model) sans sudo, énergie par cœur, DRAM, GPU, ANE. D'après un récapitulatif **[Exa, source secondaire llms-explorer.com]** : support M5 depuis 2026-03-29, Ultra multi-die 2026-04-02. Blog de présentation https://ml.energy/blog/energy/measurement/profiling-llm-energy-consumption-on-macs/.
- `mlco2/codecarbon` https://github.com/mlco2/codecarbon : 1 939 étoiles, MIT, push 2026-10-28. Estimation carbone, utile pour le rapport, moins précis que des compteurs directs.
- `asiai` https://asiai.dev/methodology/ (page répond 200) **[Exa]** : CLI de benchmark d'inférence sur Apple Silicon, 10 moteurs dont oMLX et vllm-mlx ; protocole : garde pré-vol, échauffement, 3 passes, température 0, refroidissement adaptatif ; puissance via IOReport validée contre `powermetrics` (écart moyen 0,9 % à 1,3 % sur 10 échantillons appariés par moteur). Précision à retenir : le total SoC n'a aucune contre-mesure logicielle, seul un wattmètre mural le vérifie.
- `john-rocky/apple-silicon-llm-bench` (`measure_energy.py` enveloppe `powermetrics`, avertit si moins de 4 échantillons) **[Exa]**.
- Intelligence Per Watt (Stanford Hazy Research) https://hazyresearch.stanford.edu/intelligence-per-watt/benchmarking/platform-support/ **[Exa]** : sur Apple Silicon, `power_watts` ne contient que le rail GPU ; utiliser les métriques `soc_*` pour comparer des backends.
- **Alerte à vérifier sur votre parc** : un récapitulatif secondaire (llms-explorer, **non vérifié à la source**) rapporte que sur une bêta macOS 27, `powermetrics` affiche `CPU Power: 0 mW` sur 288 échantillons sur 288 et que le sampler CPU est capricieux (2 cellules sur 8). Votre macM1 est sous macOS 27 : tester avant de publier des joules/token avec `powermetrics`, préférer IOReport/zeus-apple-silicon, et signaler le choix des rails dans le protocole. GreenBench (arXiv 2608.28667) est cité par la même source comme proposant l'énergie par token comme métrique standard, mais sa part « système » est une constante supposée de 10 W : ne pas la prendre pour une mesure.

**Ce que ça change** : un protocole reproductible = (1) rails explicitement nommés, (2) fenêtre de mesure avec au moins 4 échantillons, (3) état thermique initial enregistré, (4) 3 passes minimum, (5) mesure sur la même machine uniquement (jamais de comparaison inter-machines), (6) un wattmètre mural pour borner le total.

---

## 7. SNN, codage prédictif, modèles du monde

- `fangwei123456/spikingjelly` https://github.com/fangwei123456/spikingjelly : 2 177 étoiles, Apache-2.0, push 2026-10-30. V2 en développement : 2.0.0.dev0 (2026-07-09), 2.0.0.dev1 (2026-08-14) avec conversion ANN vers SNN d'un Qwen2.5 couche par couche (« ne revendique aucun gain de latence ni d'énergie »). Échange NIR et Lava.
- `jeshraghian/snntorch` 2 082 étoiles, MIT, push 2026-10-20, import/export NIR.
- `lava-nc/lava` : 742 étoiles, **archivé**, push 2026-05-13, licence NOASSERTION ; `lava-nc/lava-dl` 183 étoiles, BSD-3-Clause, 2026-05-13. Lava est donc figé : ne pas bâtir dessus.
- Codage prédictif : `ComputationalPsychiatry/pyhgf` (167 étoiles, MIT, push 2026-10-30), réseaux de filtres gaussiens hiérarchiques, JAX. Pas de bibliothèque PC généraliste dominante trouvée.
- Modèles du monde spiking : `Brain-Cog-Lab/Spiking-WM` (8 étoiles, Apache-2.0, PNAS déc. 2025, DeepMind Control Suite) ; `Oooorca/SpikeWorld` (0 étoile, MIT, créé 2026-08-07, arXiv 2608.07712) avec `spikeworld-verify` qui reconstruit chaque nombre du papier, bon exemple de provenance **[Exa pour ces deux]**. Rien en MLX.

**Ce que ça change** : l'écosystème SNN est PyTorch/CUDA. Pour votre substrat MLX, la voie réaliste est NIR pour l'échange et spikingjelly comme oracle de comparaison, pas comme dépendance.

---

## 8. Outils de science ouverte

- **`prereg` (reproducible-science)** https://pypi.org/project/prereg/ : 0.6.1 sur PyPI (licence MIT), suite de 4 outils (`prereg`, `results`, `citations`, `repro`) + plugin Claude Code, version 0.5.0 de l'ensemble déposée sur Zenodo le 2026-10-07 https://zenodo.org/records/23198893 (HTTP 200). `prereg freeze` fige un plan lié à un commit et à un hash, `prereg freeze --osf` pousse en brouillon sur OSF avec les intitulés d'OSF. **Adoption immédiate possible**, d'autant que votre flux est déjà « préreg OSF + git ».
- **`preregister`** https://pypi.org/project/preregister/ : 0.1.0 publié le 2026-09-18 (vérifié PyPI). Registre JSONL chaîné par SHA-256, portes d'admissibilité (assez de seeds, puissance, contrôle présent, aucun run avant l'enregistrement), verdicts CONFIRMED/REFUTED/INCONCLUSIVE/INADMISSIBLE/DEVIATED, plugin pour W&B et MLflow. Très proche de votre notion de nuls calibrés et de la règle multi-seed. Jeune (0.1.0), à tester avant de s'y engager.
- **PRML** (spécification de manifeste de préreg ML, hash SHA-256, implémentations Python/JS/Go/Rust, MIT et Community Specification License) https://oecd.ai/en/catalogue/tools/prml-%E2%80%94-pre-registered-ml-manifest-specification **[Exa]**. La page signale elle-même que l'adoption indépendante n'est pas établie.
- **RegCheck** arXiv 2601.13330 (Oxford, Bennett Institute) https://ar5iv.labs.arxiv.org/html/2601.13330 **[Exa]** : compare préreg et papier avec un LLM, avec jugement humain gardé. Utile pour l'audit des écarts préreg-papier avant soumission. Attention : cet outil envoie les textes à un embedding commercial (OpenAI text-embedding-3-large) d'après la description, ce qui ne colle pas avec une politique de souveraineté.
- **Registered Reports en ML** : Nature Human Behaviour 2026-09-10 (lien en section 4). Recommande une séparation calibration/confirmation et des données postérieures à la coupure du modèle.
- **Software Heritage** : API répond 200, `nerve-wml` déjà archivé (voir section A). **Octopus** https://www.octopus.ac (302 puis 200) : plateforme de publication par unités de travail ; je n'ai pas évalué son adéquation ni son état actuel. **ReScience** https://rescience.github.io répond 200 ; état éditorial et délais non vérifiés. **TMLR** : non interrogé.
- Registre de recherche de mots-clés OSF : 0 préregistration pertinente trouvée avec les titres « emergent communication », « hopfield », « memory consolidation language model », « replay catastrophic forgetting » (le filtre OSF est sur le titre seulement, donc absence de preuve plutôt que preuve d'absence). Seul « Wasserstein » renvoie 1 résultat : https://osf.io/2j765 « WAM-Flow » (2026-04-20), VLA, sans rapport direct. Conséquence : les préregs ML publiques sont rares, vos deux préregs « dreamOfkiki » sont sans doute parmi les premières de ce genre sur OSF, un point de différenciation honnête (mais à ne pas surévaluer, la recherche par titre est limitée).

---

## B. Risque de scoop : 5 projets ou labos

1. **Google Research (Behrouz, Hashemi, Javanmard, Mirrokni), « Language Models Need Sleep »**, arXiv 2606.03979 (2026-07-10), annonce une version publique sur OpenReview depuis septembre 2025. Paradigme « sommeil » à deux phases : consolidation par distillation montante (« Knowledge Seeding ») et « Dreaming » (données synthétiques auto-générées par RL). Même vocabulaire que dream-of-kiki. Ils ont les moyens et un an d'avance de visibilité. Aucun repo code trouvé. **Risque élevé sur le cadrage, faible sur les mécanismes** (modèles et méthode différents : vous êtes sur LoRA/MoE, eux sur architecture à fréquences multiples).
2. **CMU, « Language Models Need Sleep »** arXiv 2605.26099 (même titre, autre approche : poids rapides SSM après passes récurrentes hors ligne). Confusion de titre possible dans les citations : citer précisément les numéros arXiv.
3. **Groupes de physique statistique des mémoires associatives (Rome : Marinari/Zamponi ; DLAM `andrea-ladiana`)**. Ils sont plus rigoureux sur le « sommeil = filtrage spectral » et le compromis données/calcul de sommeil. Risque : une référence que les relecteurs vous opposeront comme état de l'art théorique.
4. **Équipes sommeil-replay en continual learning** (« Not Just After One », arXiv 2606.08447 ; SleepGate arXiv 2603.14517 ; `mrG7/sleeping-llm` MEMIT+LoRA). Moindre ampleur, mais ils ciblent exactement « oubli + sommeil + LLM ». Les auteurs de 2606.08447 n'étaient pas affichés ; la filiation Bazhenov est mon inférence à partir des références, non vérifiée.
5. **Lignée « MoE + LoRA + oubli » (MH-MoE Fudan, PASs-MoE, CP-MoE, MoE²-LoRA)**. Pas des concurrents sur le sommeil, mais ils publient des diagnostics d'oubli sur Qwen3 MoE avec code, et pourraient rendre « micro-kiki oublie » banal. Surveiller MoE²-LoRA, qui teste Qwen3.5-35B-A3B.

Compensation : aucun de ces cinq ne combine (a) préreg OSF avec amendements pré-données, (b) Wasserstein/JKO en MLX, (c) communication émergente et (d) mesure d'énergie. Votre avantage est la rigueur et l'intégration, pas la vitesse.

## C. Cinq outils à adopter tout de suite

1. **`prereg` 0.6.1** (MIT) pour figer chaque plan, journaliser amendements et écarts, et pousser en brouillon OSF : https://pypi.org/project/prereg/ .
2. **`zeus-apple-silicon` 1.1.0** (Apache-2.0) pour les mesures d'énergie macM1/GrosMac, avec `asiai` comme protocole de référence (garde thermique, 3 passes, cooldown) : https://github.com/ml-energy/zeus-apple-silicon .
3. **Divergence de Sinkhorn de `geomloss` ou `ott-jax`** comme contrôle du biais entropique de kiki-flow-research (réalisable sans nouvelle infrastructure) et **POT** comme oracle numérique du backend MLX.
4. **TRACE comme banc d'oubli commun** pour comparer micro-kiki à LoRAMoE/O-LoRA/MH-MoE avec leurs métriques OP et BWT, et **Daily Oracle** (HF, 2026-07-19) pour des questions postérieures à la coupure du modèle.
5. **Software Heritage « Save code now »** pour les repos non archivés (dream-of-kiki confirmé absent) et dépôt Zenodo des versions finales avant tout arXiv ; ajouter `JaxMARL` (JAX, Apache-2.0) si la communication émergente passe à un banc MARL rapide.

## D. Inaccessible ou non vérifié

- Papers with Code : service arrêté, redirige vers HF Papers (ici non interrogé).
- OpenReview, Papers HF, TMLR, Octopus (état de la plateforme) : non interrogés ou non évalués.
- Aucun accès au détail de la licence de ActionSense et Studyforrest (sites répondent 200, licence non relue).
- Pages **[Exa]** : contenus lus via résumé du moteur, pas relus intégralement ; étoiles non récupérées pour la plupart des repos recherchés par Exa.
- Affirmation « macOS 27 : `powermetrics` CPU = 0 mW » : source secondaire, à reproduire sur macM1.
- Préreg OSF de bouba_sens : introuvable par titre, existence non confirmée.
- Le fichier de préreg OSF q6jyn n'a pas été ouvert (seul le titre et la date viennent de l'API).
