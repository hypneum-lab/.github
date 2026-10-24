# R1 — Consolidation par rêve/sommeil : revue critique pour GENIAL (dream-of-kiki)

2026-10-24 · Hypneum Lab · revue de littérature axe R1 (sommeil, replay génératif, wake-sleep CL, « dreaming » des modèles du monde, sleep-time compute, neurosciences 2025–2026, substrats non-LLM).
Périmètre : va au-delà de la veille du 23/10 (160 arXiv déjà vérifiés) — réfutations, fondements antérieurs à avril 2026, GitHub, Hugging Face, actualités sept.–oct. 2026.
Méthode : lecture seule du dépôt `dream-of-kiki` (axiomes, preuves, bib), 12 recherches web (budget WebSearch de la session épuisé ensuite — les blogs éditeurs de sept.–oct. n'ont pas pu être balayés exhaustivement), API arXiv (listes + fiches `abs/` lues une à une), Europe PMC (PMID/DOI), `gh api`, API Hugging Face (papers/models/datasets). Toute référence ci-dessous a été ouverte (fiche arXiv, Europe PMC, page éditeur ou blog primaire) ; aucune n'est reprise de mémoire.
Étiquettes : **[NOUVEAU]** = absent de la veille du 23/10 et des bib du dépôt ; **[déjà veille]** = dans la veille du 23/10 ; **[déjà cité]** = dans `references.bib` / docs du dépôt avant la veille.

Déjà couverts par la veille du 23/10 (non dupliqués ici, cités seulement en relation) : 2603.01935 Dream2Learn, 2401.08623 WSCL, 2607.16256 Zahn (Discovery by Dreaming), 2609.31630 Zhang (silent DOF), 2606.03979 Behrouz (LM Need Sleep), 2606.08447 Bazhenov (Not Just After One), 2605.29495 on-policy replay, 2607.01763 Denser≠Better, 2608.06216 CL in Transition, 2609.27252 You (structure/géométrie), 2605.28870, 2609.24209, 2604.18572, 2602.14486, 2610.20286 ; et dans la bib : 2504.13171 sleep-time compute, 2507.02901 SESLR, 2511.01553 CLP-SNN, 2603.03529 mlx-snn, 2209.05245 Robinson 2022, 2606.00732 SHARP, 2501.00663 Titans, Tononi 2014, Klinzing 2019, Rasch 2025, eLife 2025 (K2), Neuron 2025 « large SWR ».

---

## 1. Hypothèses Hypneum ciblées (énoncés verbatim EN, `kiki_oniric/axioms/__init__.py` + `docs/axioms/AXIOMS.md`, C-v0.25.0+PARTIAL)

| ID | Énoncé verbatim | Statut dépôt |
|---|---|---|
| DR-0 Accountability | `∀ δ ∈ dream_output_channels, ∃ DE ∈ History : budget(DE) < ∞ ∧ δ ∈ outputs(DE)` — « no "ambient dreaming" » | Proven/Exec |
| DR-1 Episodic conservation | `∀ e ∈ β_t, ∃ t' ∈ [t, t + τ_max] : e ∈ inputs(DE_{t'})` — « every buffered episode gets a chance at consolidation within the window τ_max before purge » | Proven/Exec |
| DR-2 (weakened) | `∀ permutation π over Op such that ¬∃ i < j : (π_i = RESTRUCTURE ∧ π_j = REPLAY), π is composable … ∧ budget(π) = Σ_k budget(π_k) ∧ effect(π, s) = effect(π_{n-1}, …, effect(π_0, s))` ; « Commutativity is NOT claimed » | Weakened 2026-04-21 |
| DR-2' | « canonical order = replay < downscale < restructure < recombine » | Fallback, Exec |
| DR-3 | « ∀ substrate S, if S satisfies the Conformance Criterion … then DR-0, DR-1, DR-2 (or DR-2') are empirically validated on S (operational sense …) » ; `conforms(S) ≜ typed(S) ∧ axiom_tests_pass(S) ∧ invariants_enforced(S,{S1,S2,S3,I1})` ; Paper 1 §8.4 : « DR-3 is therefore anchored to relational structure, not metric geometry » | À reformuler (veille) |
| DR-4 | `ops(P_min) ⊆ ops(P_equ) ⊆ ops(P_max) ∧ channels(P_min) ⊆ channels(P_equ) ⊆ channels(P_max)` ; Lemma DR-4.L : « if P_min is valid … then P_equ does not strictly worsen metrics monotone in capacity » ; prédiction « richer ops yield richer consolidation » | **Empiriquement réfutée** mono-domaine (RECOMBINE-empty sur {FMNIST, CIFAR-10, CIFAR-100, Tiny-IN} × 4 architectures) ; G4-nono cross-domain (CDPA/WDPA, stratégies cross/within/none) en préenregistrement (PR #41, doc absent de ce checkout) |
| DE | « DE (dream-episode) — atomic dream unit: 5-tuple (trigger, input_slice, operation_set, output_delta, budget) » ; ops = {REPLAY, DOWNSCALE, RESTRUCTURE, RECOMBINE} ; canaux 1–4 | — |
| Pilier B (Paper 1 §3.2) | « SHY corresponds to the `downscale` operation : multiplicative shrinkage of weights by a factor in (0, 1] … commutative but not idempotent » | — |
| Pilier C (§3.3) | « `recombine` operation : sample latents from the δ snapshot, apply a VAE-light or interpolation kernel, emit new latent samples on canal 2 » | — |
| H1–H4 (OSF Q6JYN) | H1 `mean(forgetting_P_equ) < mean(forgetting_baseline)` ; H2 `|mean(acc_P_max) − mean(acc_P_equ)| < 0.05` (TOST) ; H3 `mean(acc_P_min) < mean(acc_P_equ) < mean(acc_P_max)` ; H4 `mean(energy_dream / energy_awake) < 2.0` | Gain LLM rétracté 19/06/2026 (fuite fixture mega_v2) ; H9-B nul Helium-2B |
| §8.4 (déjà acté) | Zhang silent-DOF : « such a substrate would need dream-episode boundaries that are logical (DR-0 log) rather than temporal — an open conformance question, not addressed here » | Question ouverte |

---

## 2. État de l'art 2024 → oct. 2026 (vérifié ; relation à GENIAL : appuie / contredit / dépasse / neutre)

### 2.1 Neurosciences du sommeil (2025–2026)

| Réf | Date | Résultat clé | Relation |
|---|---|---|---|
| Feng et al., *Neuron*, doi 10.1016/j.neuron.2026.09.031 (PMID 42896555) **[NOUVEAU]** | 10/2026 | Interneurones hippocampiques Chrm2 (inhibés par l'ACh) actifs en NREM **et veille calme**, inhibent tout l'hippocampe à un rythme infra-lent ~0,015 Hz et *gatent* la génération des ripples ; leur suppression altère mémoire spatiale/sociale | **Dépasse** la dichotomie éveil/rêve : la fenêtre de consolidation est un *gate* rythmique (~1 min) présent aussi en veille → DE = fenêtre gated, pas « phase nocturne » |
| Vöröslakos … Buzsáki, bioRxiv 10.64898/2026.03.27.714843 **[NOUVEAU]** | 03/2026 | Les ripples s'organisent en **clusters** (cSPW-R) dans les UP-states corticaux, verrouillés aux creux des spindles ; les séquences rejouées s'étendent sur plusieurs ripples ; « syntactic unit » de la communication hippocampo-corticale ; rejeu préférentiel des trajectoires apprises | **Dépasse** : l'unité atomique biologique du replay est un cluster imbriqué (SO ⊃ spindle ⊃ cluster ⊃ ripple) → plaide pour des DE *imbriqués* multi-échelles |
| Denis et al., *PLoS Biol* 24(8) e3003938 (PMID 42658809) **[NOUVEAU]** | 08/2026 | N=31 ; thêta (3–8 Hz) à l'encodage *étiquette* les items consolidés en sommeil (d=0,70), prédit la densité de spindles couplés aux SO (r≈0,45), qui seule prédit la rétention (R² ajusté 0,19) ; pas d'effet direct thêta→rétention | **Contredit** DR-1 lu comme « tout épisode a sa chance » : la biologie *sélectionne* à l'encodage (tag) ; appuie un DR-1 pondéré par un signal d'étiquetage |
| Sheng et al., *Cell Rep* 10.1016/j.celrep.2026.117810 (PMID 42566310) **[NOUVEAU]** | 08/2026 | Décalage de phase progressif gamma-HPC / thêta-PFC pendant l'apprentissage, **réémergence** du même motif pendant SWR + spindles NREM ; passage d'une cohérence gamma pilotée par HPC (récent) à un contrôle basse fréquence PFC (ancien) ; chaîne causale par optogénétique en boucle fermée | **Appuie** DR-2' (replay HPC *puis* prise de relais corticale = restructure) ; donne une signature mesurable d'« ordre » |
| He et al. (Liu lab), *Nat Neurosci* 10.1038/s41593-026-02291-3 (PMID 42092183) **[NOUVEAU]** | 05/2026 | iEEG 28 patients, tâches d'inférence « LEGO » : les ripples hippocampiques déplacent les représentations mPFC vers la configuration relationnelle inférée ; **recombinaison compositionnelle** d'éléments familiers autour des ripples | **Appuie** la réouverture de DR-4 : `recombine` est un opérateur réel mais son produit est *compositionnel/inférentiel*, pas la rétention intra-domaine |
| Konkoly … Paller, *Neurosci Conscious* niaf067 (PMID 41659884) **[NOUVEAU]** | 02/2026 | N=20 (rêveurs lucides), TMR en REM de puzzles non résolus : incorporation conceptuelle prédit la résolution (17 % → 42 %) ; **pas d'effet global** du cue seul (p>0,6) ; limites : post hoc, pas de contrôle NREM/éveil | **Appuie** (faiblement) `recombine` REM pour l'*insight*, pas pour la rétention ; métrique M4.a devrait être un score de résolution/transfert |
| Wu et al., *Neuroscience* 10.1016/j.neuroscience.2026.03.021 (PMID 41856238) **[NOUVEAU]** | 03/2026 | Revue : NREM = imbrication SPW-R/SO/spindles ; REM & éveil = couplage thêta-gamma HPC–PFC ; les deux reposent sur un « oscillation-timed offline replay » | **Appuie** opérateurs distincts par stade (cf. zhang2026nremremreactivation déjà cité) et le pont nerve-wml (GTM) |
| Robinson et al., *Neuron* 10.1016/j.neuron.2025.10.003 (PMID 41205608) [déjà cité `neuron2025largeswr`] | 11/2025 | Seule une minorité de SWR (les plus grands) porte la réactivation ; boost optogénétique en boucle fermée améliore réactivation et rappel | **Appuie** une DR-1 *sélective* ; donne une manipulation causale du budget (nb de grands SWR) |
| Widloski & Foster, *Nat Commun* 10.1038/s41467-025-65181-5 (PMID 41271694) **[NOUVEAU]** | 11/2025 | Replay **sans** ripple chez le rat ; les ripples « marquent » les replays liés à l'apprentissage/nouveauté | **Neutre/affine** : le replay (contenu) et le marqueur (trigger) sont dissociables → le `trigger` du 5-uplet DE n'est pas le replay lui-même |
| Kinoshita, Yamada, Ode, Ueda, *PLoS Biol* 10.1371/journal.pbio.3003198 (PMID 40504782) **[NOUVEAU]** | 06/2025 | Cadre **WISE** (Wake Inhibition / Sleep Excitation) : sous Hebb/STDP classiques, le tir de type sommeil *potentialise* ; la dépression de type SHY n'apparaît que sous anti-Hebb ou si l'éveil tire bien plus vite (nouveauté) ; réconcilie SHY et données de potentiation NREM | **Contredit** le pilier B tel qu'écrit (« factor in (0, 1] ») : le signe de l'homéostasie dépend de la règle et du contraste de taux → `downscale` doit devenir `rescale` (signe indéfini) |
| Reich, Cook, Obermayer, Aceituno, arXiv:2608.21814 **[NOUVEAU]** | 08/2026 | Champ neuronal CA3 à délais : replay avant/arrière à vitesses variables après une seule exposition, avec plasticité symétrique **ou** asymétrique | **Neutre/affine** : le replay est une propriété dynamique (délais), pas d'une règle de plasticité → compatible DR-3 (structure, pas mécanisme) |
| Lober, Bouhadjar, Diesmann, Tetzlaff, arXiv:2605.22523 **[NOUVEAU]** | 05/2026 | sTM à impulsions : la vitesse de replay est contrôlée par une oscillation d'horloge (parallèle éveil/sommeil) | **Appuie** un paramètre `speed` du replay piloté par horloge (lien θ–γ nerve-wml) |

### 2.2 IA : sommeil, replay, wake-sleep, consolidation hors-ligne (fondements + 2026)

| Réf | Date | Résultat clé | Relation |
|---|---|---|---|
| Tadros, Krishnan, Ramyaa, Bazhenov, *Nat Commun* 13 (PMID 36522325) ; code `tmtadros/SleepReplayConsolidation` **[NOUVEAU]** | 12/2022 | **SRC** : phase sommeil = Hebb local non supervisé + bruit, récupère les tâches oubliées ; activité ancienne plus sparse/forte | Fondement antérieur manquant dans la bib ; `replay` + `downscale` réalisés *sans* gradient ni données |
| Hayes, Krishnan, Bazhenov, Siegelmann, Sejnowski, Kanan, arXiv:2104.04132 (*Neural Computation*) **[NOUVEAU]** | 2021 | Revue « éléments biologiques manquants » du replay en DL | Cadre de référence à citer en §2 Paper 1 (antériorité du constat « replay = pilier isolé ») |
| Fachechi, Agliari, Barra, arXiv:1810.12217 **[NOUVEAU]** | 10/2018 | **Dreaming Hopfield** : phase sommeil = désapprentissage des états parasites + renforcement des purs ; noyau → projecteur sur les motifs ; capacité α 0,14 → 1 ; estimation explicite du « sleep rate » | **Dépasse** : seul cadre où un opérateur de rêve a une *preuve* de capacité → candidat substrat pour prouver (pas seulement tester) DR-0..DR-2 |
| Barra, Durante, Ladiana, Marra Solazzo, arXiv:2605.13721 **[NOUVEAU]** | 05/2026 | DLAM (mémoire L-directionnelle « rêvante ») : énergie libre réplica-symétrique ; temps de sommeil t = paramètre de contrôle ; **le rêve hors-ligne se substitue à des données** ; un état mélange est *séparé* en ses motifs, un par couche | **Appuie** DR-4 côté théorie : la séparation de mélanges est littéralement un `recombine` prouvé ; donne un plan (ρ,t) data↔compute |
| Takeda, Oizumi, Karakida, arXiv:2605.27975 **[NOUVEAU]** | 05/2026 | **Oubli intrinsèque = hausse d'énergie Hopfield** ; les échantillons à haute énergie (bassins isolés) sont les plus oubliés ; replay sélectionné par énergie ; vérifié sur MHN, Stable Diffusion 1.5 et DDPM pixel (Split-CIFAR-10) | **Dépasse** : métrique d'oubli *substrat-agnostique* (énergie) transférée MHN→diffusion ; s'applique directement au substrat Wave 3b latent-diffusion |
| Kubo, Delanois, Bazhenov, arXiv:2508.14081 **[NOUVEAU]** | 08/2025 | SRC dans des RNN entraînés par **Equilibrium Propagation** : égale BPTT sur MNIST, le dépasse sur FMNIST/KMNIST/CIFAR-10/ImageNet en class-incremental ; replay éveillé en plus | **Appuie** DR-3 (même op sur substrat énergie-based) et ouvre la voie physique |
| Delanois, Ahuja, Krishnan, Bazhenov, arXiv:2603.07867 **[NOUVEAU]** | 03/2026 | SRC post-entraînement améliore la **calibration** (Brier, entropie) d'AlexNet/VGG19, complémentaire au temperature scaling | **Neutre→appuie** : effet du rêve sur une métrique non-rétention → candidate M-nouvelle |
| Massey, Hubin, Nichele, Sæbø, arXiv:2601.08447 **[NOUVEAU]** | 01/2026 | Phases sommeil (décroissance stochastique vers baseline + activité spontanée, 10–20 % du temps) stabilisent un SNN **STDP** ; **aucun bénéfice** pour un SNN à gradient surrogate | **Contredit** la transférabilité d'effet DR-3 (confirme G5-bis) : même op, même famille de substrat, effet dépendant de la règle d'apprentissage |
| Tonielli … Paolucci (INFN APE), arXiv:2601.17523 **[NOUVEAU]** | 01/2026 | SNN thalamo-cortical multicouche éveil/sommeil profond ; plasticité inter-couches pendant le sommeil ↑ précision et ↓ taux de tir/force synaptique ; **estimateur de puissance en ATP** | **Appuie** H4/M3.c : premier estimateur énergétique bio-plausible pour un substrat E-SNN comparable à celui du dépôt |
| Trappe, arXiv:2601.04362 **[NOUVEAU]** | 01/2026 | **Phasor Agents** : graphe d'oscillateurs Stuart-Landau, plasticité à 3 facteurs, fenêtres d'écriture cadencées ; phase sommeil-profond (commit gated) puis phase **REM** (replay perturbé) ; +67 % de plage d'apprentissage stable, +45,5 pp succès labyrinthe, signature Tolman (apprentissage latent) | **Appuie** DR-2' (commit avant REM) et le substrat oscillatoire (pont nerve-wml) ; code annoncé ouvert (dépôt non localisé) |
| Zhang (Qi), arXiv:2602.04095 **[NOUVEAU]** | 02/2026 (texte de 2009) | Modèle cognitif : des signaux hippocampiques aléatoires suffisent à produire apprentissage et consolidation | **Neutre** : antériorité du « rêve = continuation du traitement éveillé » |
| Smith, Kuhlmann, Roy, Kowadlo, arXiv:2608.19514 **[NOUVEAU]** | 08/2026 (v2 09/2026) | **4MAS** : deux hémisphères asymétriques + replay + sommeil REM ; Split-CIFAR-100 29,3 % ; oubli réduit de plus de moitié vs meilleur generative replay | **Dépasse/compare** : baseline directe pour Wave 3b sur Split-CIFAR-100 ; la redondance bilatérale est un canal absent de GENIAL |
| Mouchon, arXiv:2606.31495 **[NOUVEAU]** | 06/2026 | Surprise (erreur de prédiction latente) **gate** l'écriture épisodique ; replay hors-ligne périodique → lecteur lent ; *rejouer seulement une fenêtre récente fait pire que pas de replay* ; 99,2 % de rappel après vidage du store rapide | **Contredit** DR-1 par fenêtre τ_max uniforme ; appuie un DE à `trigger` = surprise |
| Yu, arXiv:2505.08727 (NeurIPS 2025 NEGEL ws) **[NOUVEAU]** | 05/2025 | Cycles émergents mémorisation/compression en pré-entraînement ; GAPT alterne les phases ; −50 % entropie de représentation, +4,8 % CE, +97 % séparation en oubli catastrophique | **Appuie** l'alternance éveil/consolidation comme *dynamique émergente* (pas imposée) — mais substrat LLM |
| Ji & Song, MyGO arXiv:2508.21296 (v2 **retiré** 01/2026) **[NOUVEAU]** | 08/2025 | Wake-sleep avec G-mem génératifs ; retiré pour instabilité du replay génératif en haute dimension | **Neutre (alerte)** : fragilité du replay génératif = risque pour P_max canal 2 |
| Zhang, Zhang, Xu, arXiv:2609.31630 v2 (NeurIPS 2026 CL ws) [déjà veille] | 09→10/2026 | k-WTA + replay écrit sur synapses silencieuses ; refractory rule double le canal ; bat le rehearsal hors-ligne en 1 passe (+1,6 vs DER++) mais −1,5 à 5 époques, et −2/−3 vs ER-ACE/DER++ sur Split-CIFAR-10 | **Contredit** la nécessité d'une phase hors-ligne, mais dépend d'un substrat sparse compétitif (cf. §3.6) |
| Filat et al., arXiv:2604.21930 **[NOUVEAU]** | 04/2026 | La **taskification** (où couper le flux) change à elle seule erreur, oubli et BWT ; indice BPS calculable avant entraînement | **Contredit** l'innocuité des frontières de DE/tâches : à préenregistrer et à reporter (BPS) |
| Nalagatla & Grandhe, arXiv:2512.00619 **[NOUVEAU]** | 11/2025 | Replay génératif par **codage prédictif** retient +15,3 % vs replay par BP | **Appuie** DR-3 structurel, **contredit** la transférabilité d'effet (taille d'effet dépend du substrat) |
| Masano, Bellitto, … Spampinato, arXiv:2603.09576 **[NOUVEAU]** | 03/2026 | Routing without Forgetting : couches de récupération associative (Hopfield modernes) génèrent des prompts en une passe ; gains Split-ImageNet-R/S | **Neutre** (transformer) mais montre Hopfield comme *routeur* sans oubli — pont avec le groupe Bellitto (WSCL) |

### 2.3 Modèles du monde, « dreaming » et agents (2025–2026)

| Réf | Date | Résultat clé | Relation |
|---|---|---|---|
| Hafner, Yan, Lillicrap, **Dreamer 4**, arXiv:2509.24527 **[NOUVEAU]** | 09/2025 | RL entièrement en imagination ; premier agent à obtenir des diamants Minecraft depuis des données hors-ligne uniquement ; shortcut forcing ; 100× moins de données que VPT ; **rien** sur mémoire/CL | **Neutre** : le « rêve » est un simulateur, pas une consolidation ; baseline de substrat `restructure` (§8.4 déjà) |
| DeepMind **Genie 3** (blog deepmind.google, 08/2025 ; non lu, URL via recherche) **[NOUVEAU]** | 08/2025 | Mondes interactifs 24 fps/720p, cohérence « quelques minutes », mémoire visuelle ~1 min émergente | **Neutre** : horizon de mémoire court, pas de consolidation |
| Nijjer, arXiv:2607.19749 **[NOUVEAU]** | 07/2026 | **« The world model remembers, the actor forgets »** : avec replay illimité, le WM garde récompense/valeur (ratio ≈1,0), l'acteur s'effondre ; RL en imagination **ne** récupère pas (0/3), l'auto-imitation supervisée sur rêves notés récupère (3/3) ; 8 tâches 3/3 ; +0,13 vs clonage réel [0,07;0,24] ; 3 graines | **Dépasse** : l'oubli est un problème de *canal* (quel objectif lit le rêve), pas de mémoire → appuie l'ontologie typée canaux 1–4 de GENIAL ; protocole préenregistré |
| Tharwat … Valada, **D2R**, arXiv:2610.13816 **[NOUVEAU]** | 10/2026 | Politique généraliste gelée + module de steering ; WM gelé rejoue les tâches passées ; CALVIN 63,7 → 74,8 % (LoRA : 11,7 %) ; Franka réel 3 tâches | **Appuie** `replay` via WM génératif sans buffer ; le WM gelé = W_dream (snapshot figé) |
| Govind … Das, **REGEN**, arXiv:2606.27374 **[NOUVEAU]** | 06/2026 | WAM synthétise des pseudo-trajectoires des tâches passées ; oubli −50 % vs fine-tuning séquentiel ; goulots : dégradation visuelle longue, incohérence action/observation | **Appuie** avec réserve : le replay génératif se dégrade sans vérificateur |
| Fang … Gao, **R²-WAM**, arXiv:2610.18038 **[NOUVEAU]** | 10/2026 | Rollouts bruts auto-générés marchent mal (pas de fin de tâche, dérive actions/obs) ; **rectification** (évaluateur agentique + filtre de cohérence physique) → oubli −90 % ; l'oubli se concentre dans la dynamique inverse | **Contredit** DR-4.L sans garde : plus d'ops génératives *non filtrées* = pire ; appuie un invariant d'admission par échantillon |
| Zhou, Watson, Lei, Posner, arXiv:2609.22055 **[NOUVEAU]** | 09/2026 | Benchmark WM-CL **compositionnel** (axes action/perception) ; la modularité équilibre réutilisation/oubli ; aucune méthode ne résout | **Appuie** la logique G4-nono : seul un test compositionnel sépare réutilisation et nouveauté |
| Wen … Cheng, **LucidWM**, arXiv:2609.37156 **[NOUVEAU]** | 09/2026 | Doute par transition (logique subjective) → confiance multipliée le long des rollouts ; 362 → 190 pas | **Neutre→appuie** : un rêve doit porter sa propre *incertitude* (métadonnée de DE) |
| King et al., **Echo-Memory**, arXiv:2606.09803 **[NOUVEAU]** | 06/2026 | Dans les WAM, « la fidélité du replay ne prédit pas si le modèle se souvient de la scène » ; récurrence d'espace d'état bloc-wise la meilleure pour le retour en domaine ouvert | **Appuie** la reformulation DR-3 (structure relationnelle ≠ fidélité métrique) |
| Lin et al., Sleep-time Compute arXiv:2504.13171 [déjà cité] ; Letta docs « Dreaming »/`/sleeptime` (docs.letta.com, lu) **[NOUVEAU]** | 04/2025 ; 2026 | Letta : sous-agents de fond relisent les sessions, révisent la mémoire dans **MemFS (git)** ; déclencheur = nb d'étapes ou compaction de contexte | **Appuie** DR-0 en production : provenance par commit = log de DE |
| Anthropic, « New in Claude Managed Agents: dreaming, outcomes… » (claude.com/blog, lu) **[NOUVEAU]** | 05/2026 | Processus planifié *entre sessions* ; détecte erreurs récurrentes/workflows convergents ; revue humaine optionnelle ; Harvey « ~6× » (auto-rapporté) ; poids inchangés | **Appuie** DR-0/DR-1 (séparation veille/rêve, traçabilité) ; aucune métrique indépendante |
| OpenAI « Dreaming » (source secondaire theplanettools.ai ; **primaire non confirmée**) | 06/2026 | Mémoire reconstruite entre sessions ; chiffres internes non vérifiables | **Neutre** (à ne pas citer sans primaire) |
| Google Research, Nested Learning / HOPE (blog research.google, lu ; NeurIPS 2025) **[NOUVEAU]** | 11/2025 | Modèle = problèmes d'optimisation imbriqués à fréquences différentes ; **Continuum Memory System** ; aucune mention de sommeil | **Contredit** l'idée d'un rêve binaire : la mémoire est un *spectre* de fréquences de mise à jour (cf. DE imbriqués §3.5) |
| Kang et al., arXiv:2607.17545 **[NOUVEAU]** | 07/2026 | **Retain or Consolidate ?** utilité d'un opérateur = couverture + remplacement signé ; **crossover** avec le budget : consolidation +48 % en budget serré, rétention meilleure en budget large (LongMemEval, LoCoMo) | **Dépasse** DR-0 : le budget n'est pas qu'une borne, c'est la variable qui *choisit* l'opérateur |
| Zhang (Dylan) et al., arXiv:2605.12978 **[NOUVEAU]** | 05/2026 (v2 08/2026) | « Useful memories become faulty » : utilité **non monotone** de la consolidation ; GPT-5.4 échoue sur 54 % d'items ARC-AGI déjà résolus après consolidation ; garder les épisodes bruts = double de la précision ; consolidation à *gater* | **Contredit** DR-4.L (plus de consolidation ≠ mieux) et la purge β de DR-1 ; impose une baseline « rétention épisodique brute » |
| Ye … You, **Auto-Dreamer**, arXiv:2605.20616 **[NOUVEAU]** | 05/2026 | Consolidateur hors-ligne appris par GRPO ; +7 pts ScienceWorld, mémoire active 12× plus petite ; transfert ALFWorld/WebArena | **Appuie** l'apprentissage de l'opérateur de consolidation (politique) — LLM |
| Lu et al., **MemDream**, arXiv:2609.34545 **[NOUVEAU]** | 09/2026 | Cycles de rêve hors-ligne (Dreamer/Analyst/Consolidator), décroissance douce réversible ; +4,5 F1 LoCoMo, +9,1 MAB | **Appuie** DE discrets *proactifs* (auto-sondage) — LLM |
| Zhang (Jintian) et al., **Cortex**, arXiv:2610.20399 **[NOUVEAU]** | 10/2026 | Consolider le contexte en **poids** (LoRA/FFN structurel) via requêtes prospectives ; 50 éditions séquentielles : 88,9 % du gain récupéré, 99,8 % de rétention | **Neutre** (LLM) : canal 1 (weight_delta) à l'échelle, sans phase de sommeil nommée |
| O'Neill, Kirkby, Liu, Psenka, arXiv:2607.11020 (v3 10/2026) **[NOUVEAU]** | 07→10/2026 | 20 écritures séquentielles de faits : ~1 % de rappel avec énoncés répétés vs ~46 % avec 24 reformulations ; la *diversité des données* domine méthode et paramétrisation | **Appuie** `recombine` comme *générateur de variations* (la diversité, pas la répétition, protège) |
| Uemura & Suzuki, arXiv:2610.05200 **[NOUVEAU]** | 10/2026 | Théorie : auto-distillation on-policy = mises à jour *sparses* (sans écrasement) ; SFT = denses (écrasement) | **Appuie** la distinction replay « on-policy » (veille, Chen 2026) ; mécanisme formel de l'oubli par densité d'update |
| Chen et al., arXiv:2610.25858 **[NOUVEAU]** | 10/2026 | Agents auto-évolutifs (prompts/mémoire) : plasticité ↑ ⇒ stabilité ↓ ; édition globale écrase, retrieval collisionne | **Neutre** : les agents LLM restent des « continual learners incomplets » |
| Wu et al., **MemHarness**, arXiv:2607.28272 **[NOUVEAU]** | 07/2026 | « Memory is reconstructed, not replayed » : reconstruction conditionnée à l'état avant action (GRPO) | **Dépasse** : une 5ᵉ primitive candidate `reconstruct` entre replay (verbatim) et recombine (libre) |
| Chen (Lungchuan), **Mela**, arXiv:2605.10537 **[NOUVEAU]** | 05/2026 | Consolidation **au test-time** (modules rapide/lent, transformation hypothesis) | **Contredit** DE discrets (consolidation continue en inférence) |
| Kyrkewood, arXiv:2608.11775 **[NOUVEAU]** | 08/2026 | Compression « gist » (sleep-inspired) perd les dates : 3,05 % → 62,39 % d'expressions temporelles préservées par un seul changement de prompt | **Appuie** : le `restructure` sémantique a un coût sur l'axe *temps* → métrique à ajouter |
| Palma … Wenkel, **Trajectory Replay**, arXiv:2610.26749 **[NOUVEAU]** | 10/2026 | Replay génératif **sans échantillonnage** : apparier le champ de vitesse historique gelé et celui de la tâche nouvelle ; l'optimum = mélange pondéré par densités ; coefficient stabilité/plasticité | **Dépasse** : `replay` devient une combinaison *linéaire* de champs → compositionnalité DR-2 littérale sur un flow-matching (substrat Wave 3b) |
| Khadangi, TRC², arXiv:2602.22479 **[NOUVEAU]** | 02→04/2026 | Colonnes corticales routées thalamiquement + voie hippocampique (écriture par surprise retardée, replay) ; contrôleur de replay en ligne piloté par l'oubli mesuré | **Appuie** un `trigger` par oubli mesuré (LM) |
| Xie, SleepGate, arXiv:2603.14517 **[NOUVEAU]** | 03/2026 | Micro-cycles de sommeil sur le cache KV (793 K params) ; horizon d'interférence O(n)→O(log n) | **Neutre** (jouet LLM) ; notion de *micro*-DE |

### 2.4 Substrats non-LLM : physiques, neuromorphiques, organoïdes

| Réf | Date | Résultat clé | Relation |
|---|---|---|---|
| Howe, arXiv:2607.06924 **[NOUVEAU]** | 07/2026 | Consolidation par **transformée de Doob** conditionnée à une barrière ; le bruit intrinsèque analogique devient une ressource ; Split-MNIST +10,9 pts à un optimum **en U inversé** (absent pour OU/EWC/MESU) ; preuve de concept sur **BrainScaleS-2** (+15,6 pts, 1 graine) | **Appuie** DR-3 sur silicium analogique ; prédiction falsifiable spécifique (non-monotonie) |
| Dillavou et al., PNAS 121(28) 2024, arXiv:2311.00537 **[NOUVEAU]** | 2024 | Réseau analogique non linéaire auto-apprenant sans processeur (XOR, régression), ré-entraînable en secondes, pJ/transistor | Fondement « réseau physique » comme substrat candidat |
| Kim … Schwarz, PCPL arXiv:2606.09756 **[NOUVEAU]** | 06/2026 | Apprentissage physique contrastif perturbatif unifiant EqProp et FreqProp ; réseaux de ressorts et circuits photoniques | **Appuie** l'existence d'une famille « contraste libre/nudgé » = `replay` physique |
| Li & Mao, arXiv:2609.05977 **[NOUVEAU]** | 09/2026 | Matériaux mécaniques apprenant **in situ** par signal adjoint inversé dans le temps (local) | **Neutre→substrat** : un `replay` = rejouer l'adjoint ; pas de CL testé |
| Gower, **PotentialEP**, arXiv:2610.14409 **[NOUVEAU]** | 10/2026 | Modèle génératif CIFAR-10 entraîné **sans backprop** (EqProp, FID 3,64 vs 3,54) ; l'échantillonnage = relaxation physique unique | **Dépasse** : rend possible un replay *génératif* sur substrat énergie-based/analogique — toutes les ops GENIAL exprimables hors gradient |
| Tammali & Olin-Ammentorp, Lock-in EP arXiv:2610.07283 **[NOUVEAU]** | 10/2026 | EqProp in situ pour matériel oscillatoire (règle à 3 facteurs) ; réseaux peu profonds seulement | **Appuie** le substrat oscillatoire (nerve-wml) |
| Kerjan, Høier, Scellier, arXiv:2606.03584 **[NOUVEAU]** | 06/2026 | PCN 10 couches entraîné par EqProp sur ImageNet (top-5 13,23 % vs 12,2 % BP) | **Appuie** : l'énergie-based passe à l'échelle ; les blocages sont côté physique |
| Roy et al., ISI-CV arXiv:2604.16496 **[NOUVEAU]** | 04/2026 | Importance **sans gradient** par CV des ISI ; oubli 0,000 Split-MNIST/FMNIST, meilleur sur Split-N-MNIST (DVS) où les méthodes à gradient échouent | **Appuie** un `downscale` sélectif neuromorphique (entiers + compteurs) |
| Guo & Pasqualetti, arXiv:2607.18439 **[NOUVEAU]** | 07/2026 | Mémoire **séquentielle** Kuramoto + hystérésis + attention lente, capacité exponentielle | **Appuie** substrat oscillatoire pour δ (snapshots hiérarchiques) |
| Corradetti & Corradetti, arXiv:2604.20679 **[NOUVEAU]** | 04/2026 | CA3 bio-détaillé (10 populations, 47 compartiments, cycle cholinergique encodage/consolidation) ; effets modestes (d=0,71, p=0,08) | **Neutre** : substrat « E-SNN riche » possible mais sous-puissant |
| Lou, arXiv:2603.27188 (v3 09/2026) **[NOUVEAU]** | 03→09/2026 | Mémoire persistante malgré turnover d'unités (triple boucle, borne Foster-Lyapunov) ; MoE requis | **Neutre** : consolidation sous *mort cellulaire* = invariant absent de GENIAL |
| Kagan et al., *Neuron* 10.1016/j.neuron.2022.09.001 (PMID 36228614) **[NOUVEAU]** ; revues SBI arXiv:2509.23896 (09/2025), arXiv:2604.27933 (04/2026) | 10/2022 ; 2025–26 | Neurones in vitro en boucle fermée (Pong) ; revues : plateformes cloud, abstractions système ; **aucun résultat d'apprentissage organoïde pair-review 2026 trouvé** (couverture = presse/vendeurs) | **Neutre** : substrat hors de portée falsifiable à l'échelle Hypneum ; conformité DR-3 énonçable, pas testable |

---

## 3. Preuves POUR / CONTRE par axiome et hypothèse

### 3.1 DR-0 (accountability, budget fini)
- **POUR** : Letta (MemFS git) et Anthropic (revue humaine optionnelle) implémentent de fait un log de DE en production ; Kang 2026 montre que le budget est *décisionnel* (crossover retain/consolidate) ; Zhang 2605.12978 : les épisodes bruts doivent rester la preuve primaire — exactement la fonction du log DR-0.
- **CONTRE** : Zhang silent-DOF, Mela (test-time) et Nested Learning (spectre de fréquences) rendent le « DE borné » mal défini si la consolidation est continue ; Feng 2026 : la fenêtre biologique est un gate rythmique (~0,015 Hz), pas une session.
- **Verdict** : l'axiome tient si « DE » est *logique* (déjà noté §8.4) ; à étendre : le budget doit **sélectionner** l'opérateur (DR-0 → DR-0+ « operator-selection policy »).

### 3.2 DR-1 (conservation épisodique dans τ_max, puis purge)
- **POUR** : Anthropic/Letta relisent *toutes* les sessions récentes ; Bazhenov 2026 (un sommeil après plusieurs tâches restaure tout).
- **CONTRE** : Denis 2026 (étiquetage thêta sélectif), Robinson 2025 (minorité de SWR), Mouchon 2026 (fenêtre récente < pas de replay), Takeda 2026 (priorité aux hauts niveaux d'énergie), Zhang 2605.12978 (ne pas purger : rétention brute > consolidation). La biologie et les agents convergent : **sélection + rétention brute**, pas « chacun sa chance puis purge ».
- **Verdict** : reformuler DR-1 en conservation *pondérée* (`∀ e, weight(e) > θ ⇒ …`) et rendre la purge optionnelle (invariant « episodic primacy »).

### 3.3 DR-2 / DR-2' (compositionnalité, ordre)
- **POUR** : Sheng 2026 (replay HPC puis relais PFC = replay<restructure) ; Trappe 2026 (commit sommeil-profond avant REM = recombine en dernier) ; Wu 2026 (opérateurs par stade) ; Trajectory Replay (composition = mélange linéaire de champs, budget additif trivial).
- **CONTRE** : WISE change le *signe* de `downscale` selon la règle → « commutative mais non idempotente » n'est plus la seule propriété pertinente ; Zhang silent-DOF : ops concurrentes sur sous-espaces disjoints → l'ordre est vide de sens quand les supports ne se recouvrent pas ; test Robertson interne (|g|<0,2) : effet d'ordre faible sur petits substrats.
- **Verdict** : DR-2 pourrait être **renforcé** plutôt qu'affaibli : « π_i et π_j commutent ssi supp(Δ_i) ∩ supp(Δ_j) = ∅ » (§9, C1) — testable.

### 3.4 DR-3 (substrat-agnosticisme, structure relationnelle)
- **POUR (niveau axiome)** : la même op « rêve » existe avec garanties sur Hopfield (Fachechi 2018, Barra 2026), EqProp (Kubo 2025), CNN (Delanois 2026), SNN (Tadros 2022, Tonielli 2026), oscillateurs (Trappe 2026), silicium analogique (Howe 2026) ; Takeda 2026 transfère une *métrique* (énergie) MHN→diffusion ; Echo-Memory : fidélité ≠ mémoire → structure, pas géométrie.
- **CONTRE (niveau effet)** : Massey 2026 (STDP oui / surrogate non), Nalagatla 2025 (PC +15,3 % vs BP), Nijjer 2026 (RL en imagination 0/3 vs auto-imitation 3/3) : la *taille d'effet* dépend de la règle d'apprentissage et du canal de lecture. Ceci confirme G5-bis/G5-ter et prédit un troisième échec si on refait le cycle sur un nouveau substrat sans déclarer la règle.
- **Verdict** : DR-3 doit déclarer la **classe de règle d'apprentissage** (gradient global / local-Hebb / énergie-based) comme partie du Conformance Criterion (C4), et garder la revendication relationnelle.

### 3.5 DR-4 (inclusion de profils, « richer ops → richer consolidation »)
- **POUR réouverture inter-domaines** : He 2026 (recombinaison compositionnelle autour des ripples), Konkoly 2026 (rêver du puzzle ↑ résolution), Zhou 2026 (seuls les tests compositionnels séparent réutilisation et nouveauté), Barra 2026 (séparation de mélanges prouvée), O'Neill 2026 (la diversité protège).
- **CONTRE DR-4.L** : Zhang 2605.12978 (utilité non monotone), R²-WAM (générations brutes nuisent), REGEN (dégradation sans vérificateur), Massey (op neutre/nuisible), Howe (U inversé), Mouchon (replay récent < rien). Le lemme « ne fait pas strictement pire » n'est vrai que si l'op riche peut être *ignorée* ; dès qu'elle écrit, il faut une **admission par échantillon**.
- **Verdict** : DR-4 (inclusion d'ensembles) reste vrai ; la prédiction doit devenir conditionnelle : richer ops ⇒ richer consolidation **ssi** (a) métrique compositionnelle/transfert, (b) gate de rectification.

### 3.6 DE discrets vs continus
- **POUR discret** : Bazhenov 2026, Trappe 2026, Letta/Anthropic/MemDream (cycles planifiés), Kang 2026 (crossover de budget), Massey (10–20 % du temps).
- **CONTRE** : Zhang silent-DOF (mais : nécessite k-WTA et perd 2–3 pts vs ER-ACE/DER++ sur CIFAR-10 à 5 époques — l'avantage est en *une passe*), Mela, Nested Learning, Feng 2026 (gate infra-lent en veille calme), Buzsáki 2026 (clusters imbriqués), Filat 2026 (les frontières sont une variable d'évaluation).
- **Verdict** : ni l'un ni l'autre — **DE imbriqués** multi-échelles (cluster ⊂ cycle ⊂ session) avec `trigger` endogène (surprise/énergie/gate).

### 3.7 Replay vs recombinaison
- Replay génératif via WM : −50 % (REGEN) à −90 % (R²-WAM, rectifié) d'oubli ; D2R apprend même en imagination seule ; Trajectory Replay supprime l'échantillonnage. Rétention brute + compression reste la baseline la plus dure (Zhang 2605.12978).
- Recombinaison : utile pour inférence/insight/planification (He, Konkoly, Trappe +45,5 pp), nulle pour la rétention intra-domaine (dépôt, G4-ladder). MemHarness suggère un intermédiaire `reconstruct` (épisode réécrit conditionné à l'état courant).

### 3.8 Substrat non-LLM le mieux adapté comme banc GENIAL
1. **Mémoires associatives denses / Hopfield modernes (recommandé #1)** : théorie analytique du rêve (Fachechi, Barra), énergie = métrique d'oubli transférable à la diffusion (Takeda → relie directement Wave 3b), les 4 ops ont des réalisations canoniques : replay = clamp-relax sur motifs, downscale = noyau de désapprentissage (sleep rate), restructure = ajout de couches/motifs DLAM, recombine = séparation de mélanges ; PotentialEP montre qu'un générateur CIFAR peut vivre dans le même cadre énergie-based. Coût : numpy/MLX sur M1 en minutes.
2. **SNN (E-SNN du dépôt)** : SRC (Tadros), SESLR, ISI-CV, estimateur ATP (Tonielli) → H4/M3.c mesurable ; piège Massey (déclarer STDP vs surrogate).
3. **Oscillateurs (Phasor/Kuramoto)** : lien nerve-wml GTM ; Lock-in EP pour le matériel.
4. **Analogique (BrainScaleS-2)** : Howe 2026 ; non disponible localement → simuler le bruit.
5. **Organoïdes** : non falsifiable à notre échelle ; aucune publication d'apprentissage 2026 vérifiée.

---

## 4. Dépôts GitHub pertinents (`gh api`, 2026-10-24)

| Dépôt | ★ | Dernier push | Licence | Réutilisation |
|---|---|---|---|---|
| tmtadros/SleepReplayConsolidation | 15 | 2022-10-28 | — (aucune) | Référence SRC (Nat Commun 2022) ; porter l'algo (licence à demander) |
| czesito/sleep-replay-consolidation-python | 2 | 2024-10-22 | — | Port Python de SRC (vérifier vs original) |
| GMvandeVen/continual-learning | 1 890 | 2025-11-05 | MIT | Harnais Split-CIFAR-100, generative replay, EWC/SI/XdG — baseline canonique |
| GMvandeVen/brain-inspired-replay | 253 | 2023-07-06 | MIT | BI-R (déjà cité vandeven2020brain) |
| aimagelab/mammoth | 847 | 2026-05-20 | MIT | DER++, ER-ACE (comparateurs exigés par Zhang silent-DOF) |
| ContinualAI/avalanche | 2 114 | 2025-03-11 | MIT | Benchmarks/scénarios ; `continual-learning-baselines` (356★) |
| jeshraghian/snntorch | 2 078 | 2026-10-20 | MIT | SNN PyTorch (STDP vs surrogate pour H-R1.4) |
| fangwei123456/spikingjelly | 2 170 | 2026-10-24 | Apache-2.0 | SNN, Split-N-MNIST |
| norse/norse | 827 | 2026-07-07 | LGPL-3.0 | Déjà wrapper Norse dans le dépôt (cycle 3) |
| ml-jku/hopfield-layers | 1 968 | 2023-04-23 | custom (NOASSERTION) | Couches Hopfield modernes (substrat #1) |
| neuromorphs/NIR | 188 | 2026-09-28 | BSD-3 | Déjà cité (pedersen2024nir) ; cible de compilation E-SNN |
| lava-nc/lava | 741 | 2026-05-13 | NOASSERTION | Loihi 2 (si accès matériel) |
| electronicvisions/pynn-brainscales | 9 | 2026-09-16 | LGPL-2.1 | BrainScaleS-2 (substrat de Howe 2026) |
| danijar/dreamerv3 | 3 904 | 2026-10-04 | MIT | Répliquer Nijjer 2026 (dream rehearsal) |
| next-state/open-dreamer | 395 | 2026-08-05 | NOASSERTION | Dreamer JAX |
| letta-ai/letta | 25 241 | 2026-10-18 | Apache-2.0 | Dreaming/sleeptime, MemFS git = log DR-0 industriel |
| mem0ai/mem0 | 67 736 | 2026-10-23 | Apache-2.0 | Baseline mémoire d'agent (paradigme LLM) |
| hypneum-lab/dream-of-kiki ; nerve-wml | 0 ; 1 | 2026-10-24 | MIT | — |
Non localisés : code Phasor Agents (annoncé ouvert), Dream2Learn (`PeRCeiVe-Lab/Dream2Learn` 404), Takeda 2026, Nijjer 2026, R²-WAM/REGEN. `gh search code "sleep replay consolidation"` : seuls czesito et des projets amateurs (anima, meok-ai).

## 5. Ressources Hugging Face (API, 2026-10-24)

- **Papers** (upvotes) : 2510.18866 LightMem (116), 2610.20399 Cortex (73), 2606.09803 Echo-Memory (33), 2606.03979 LM Need Sleep (28), 2605.12978 Useful Memories Faulty (18), 2607.28272 MemHarness (17), 2504.13171 Sleep-time Compute (16), 2605.26099 « Language Models Need Sleep » v1 (12, 05/2026 — à réconcilier avec iclr2026lmsleep), 2607.19749 Dream Rehearsal (1), 2610.26749 Trajectory Replay (0), 2606.27374 REGEN (0), 2602.22479 TRC² (0), 2610.14409 PotentialEP (0), 2610.07283 Lock-in EP (0). Aucune fiche pour SRC/Hopfield dreaming/organoïdes.
- **Modèles** : `electron-rare/spikingkiki-27b` (122 dl) et `-122b-a10b` (17 dl) + GGUF `mradermacher/spikingkiki-*` (1 623 dl) — substrat K2 du dépôt ; `Fleurrr/A2World-World-Model` (474 dl) = WM utilisé par D2R ; `yyuncong/MindJourney-World-Model` (1 182 dl) ; `continuallearning/dit_*` (checkpoints LIBERO, arXiv 2601.09512). Les « Dreamer-7B » (osunlp) sont des agents web, sans rapport.
- **Datasets** : `uoft-cs/cifar100` (99 571 dl), `zh-plus/tiny-imagenet` (25 984), `Blackrose900/N-MNIST` (27 625, DVS pour SNN), `continual-learning-bench/database-exploration` (491), `elvishelvis6/CLEAR-Continual_Learning_Benchmark` (811), `continuallearning/libero_*`. Aucun dataset « Split-CIFAR-100 » publié : les splits restent côté code (occasion de publier le loader Wave 3b avec graines).

## 6. Actualités sept.–oct. 2026 (vérifiées)
- 19/10 *Neuron* Feng et al. : interneurones Chrm2 gate infra-lent des ripples (NREM + veille calme).
- 19/10 arXiv Trajectory Replay (replay sans échantillonnage) ; Chen et al. « Are Self-Evolving Agents Continual Learners? ».
- 14/10 Cortex (contexte → poids, 4B–120B) ; 13/10 R²-WAM (rectification, −90 % oubli) ; 10/10 PotentialEP (générateur CIFAR sans backprop) ; 09/10 D2R ; 05/10 Lock-in EP ; 05/10 O'Neill v3 ; 04/10 Uemura & Suzuki ; 03/10 Zhang silent-DOF v2 accepté NeurIPS 2026 CL workshop.
- 29/09 LucidWM ; 28/09 MemDream ; 27/09 4MAS v2 ; 24/09 Lou v3 ; 18/09 benchmark WM-CL compositionnel ; 05/09 matériaux apprenant in situ.
- Industrie : dreaming Anthropic (05/2026, research preview), OpenAI (06/2026, non confirmé), Letta (« Dreaming » dans les docs) — rien de nouveau sept.–oct. trouvé avant épuisement du budget de recherche web.

## 7. Réfutations possibles et tests critiques (M1 Max 32 Go / RTX 4090 24 Go)

| # | Ce qui serait réfuté | Test (coût) |
|---|---|---|
| T1 | `downscale` ≡ « sommeil homéostatique » | Hopfield N=1 000 : noyau de rêve Fachechi vs shrink multiplicatif uniforme à budget égal ; mesurer la capacité α (numpy, M1, minutes). Si shrink uniforme ≥ 2× capacité, le pilier B est bien un `downscale` ; sinon c'est un *désapprentissage sélectif* |
| T2 | DR-1 uniforme | Wave 3b latent-diffusion Split-CIFAR-100 : replay uniforme vs priorisé par énergie Hopfield des latents (Takeda) à budget égal, N≥30 graines (M1, ~1–2 h) |
| T3 | Nécessité des DE discrets | Petit CNN G4 : DE discrets (P_min) vs replay silent-DOF k-WTA (Zhang) à FLOPs de replay égaux, 1 passe et 5 époques (M1, ~80 min/N=30 d'après G4-sexto) ; TOST g=0,29 |
| T4 | Transférabilité d'effet DR-3 | snntorch Split-N-MNIST : phase sommeil Massey sur SNN STDP vs surrogate, 5 graines (4090, heures) |
| T5 | Signe du pilier B | E-SNN numpy du dépôt : facteur optimal de rescale en fonction du contraste de taux éveil/sommeil (WISE) ; cross-over attendu (M1, heures) |
| T6 | RECOMBINE nul partout | G4-nono : CDPA/WDPA cross vs within vs none, N≥30 (M1) — déjà scaffoldé |
| T7 | DR-4.L sans garde | `recombine_cross` avec/sans gate d'admission (cohérence S1 par échantillon) ; prédiction : ungated ≤ none < gated (M1) |
| T8 | Budget = simple borne | Grille budget×profil (P_min/P_equ/P_max) ; chercher le crossover de Kang (M1/4090) |
| T9 | Innocuité des frontières | Recouper Split-CIFAR-100 en 5/10/20 tâches, calculer BPS (Filat) et la variance des verdicts H1 (M1, minutes) |
| T10 | « Le rêve consolide le WM » | DreamerV3 petit (danijar), chaîne 4 tâches, replay illimité : rétention WM vs acteur, puis auto-imitation sur rêves notés (Nijjer) — 3 graines (4090, jours) |
| T11 | Hors-ligne = seule option énergie-based | Reproduire Kubo 2025 (SRC dans EqProp) sur FMNIST/CIFAR-10 (4090, ~jour) |
Non faisable localement : organoïdes ; BrainScaleS-2 réel (simuler le bruit additif de Howe) ; runs 35B (hors consigne « sortir du LLM »).

## 8. Brainstorm : hypothèses falsifiables nouvelles (≥3 hors paradigme LLM ; **[PRÊT]** = préenregistrable maintenant, **[SPÉC]** = exploratoire)

| ID | Énoncé | Prédiction quantitative | Test | Critère de réfutation | Appui |
|---|---|---|---|---|---|
| H-R1.1 **[PRÊT, non-LLM]** Rêve ≠ downscale | Dans une mémoire dense, l'op de rêve (désapprentissage sélectif) et `downscale` uniforme ne sont pas équivalents | capacité α : rêve ≥ 3× le Hebb pur ; shrink uniforme < 1,1× ; N=1 000, 10 graines | T1 | shrink uniforme ≥ 2× | Fachechi 2018 ; Barra 2026 |
| H-R1.2 **[PRÊT, non-LLM]** Ledger d'énergie | L'énergie Hopfield des latents prédit l'oubli par classe sur le substrat Wave 3b ; replay priorisé par énergie bat l'uniforme | ρ Spearman ≥ 0,5 ; oubli −20 % relatif à budget égal | T2 | ρ < 0,2 ou gain < 5 % | Takeda 2026 |
| H-R1.3 **[PRÊT]** DE discrets vs silent-DOF | À FLOPs égaux, un DE discret n'apporte rien de plus que le replay silencieux en 1 passe, mais le dépasse à 5 époques | 1 passe : TOST équivalence (g<0,29) ; 5 époques : discret +≥1,5 pt | T3 | discret > silent en 1 passe (g≥0,5) ou ≤ en 5 époques | Zhang 2609.31630 |
| H-R1.4 **[PRÊT, non-LLM]** Règle d'apprentissage | L'effet d'une phase sommeil dépend de la classe de règle, pas du substrat | STDP : +≥5 pp rétention ; surrogate : |Δ| < 1 pp ; 5 graines | T4 | les deux gagnent ou aucun | Massey 2026 ; Nalagatla 2025 |
| H-R1.5 **[PRÊT, non-LLM]** Homéostasie à signe indéfini | Le facteur optimal de rescale pendant le rêve est >1 en veille calme et <1 en veille « nouveauté » | existence d'un cross-over du facteur optimal avec le contraste de taux | T5 | facteur optimal toujours < 1 | Kinoshita 2025 (WISE) |
| H-R1.6 **[PRÊT]** RECOMBINE compositionnel | `recombine` cross-domaine améliore l'exactitude compositionnelle, pas la rétention | CDPA cross − none ≥ +3 pp ; Δ rétention |g| < 0,2 ; N≥30 | T6 | CDPA gain < 1 pp | Zahn 2026 ; He 2026 ; Zhou 2026 ; Konkoly 2026 |
| H-R1.7 **[PRÊT]** Gate de rectification | Sans vérificateur, la recombinaison est ≤ none ; avec gate d'admission elle devient positive | ungated ≤ none ; gated ≥ none + 2 pp | T7 | gated ≤ none | R²-WAM ; REGEN ; Nijjer 2026 |
| H-R1.8 **[PRÊT]** Budget décisionnel (DR-0+) | Le profil optimal change avec le budget : P_min domine en budget serré (≤10 % FLOPs éveil), P_equ en budget large | interaction budget×profil significative ; crossover | T8 | pas de crossover | Kang 2026 ; Zhang 2605.12978 |
| H-R1.9 **[SPÉC]** DE imbriqués | n sous-épisodes courts imbriqués dans un cycle lent battent 1 DE long à budget égal | rétention +≥2 pp ; effet ∝ nombre de clusters jusqu'à saturation | variante de T3 | Δ ≤ 0 | Buzsáki 2026 ; Feng 2026 ; Nested Learning |
| H-R1.10 **[SPÉC, non-LLM]** Substrat oscillatoire | Dans un réseau de phaseurs, le replay REM-like améliore le transfert (détour) sans améliorer la rétention | détour +≥20 pp ; rétention |Δ| < 2 pp | réimplémenter Trappe 2026 minimal (M1) | les deux bougent ensemble | Trappe 2026 ; Guo & Pasqualetti 2026 |
| H-R1.11 **[PRÊT]** Primauté épisodique | Sans purge τ_max (épisodes bruts compressés + consolidation gated) la rétention bat purge-après-consolidation sur ≥20 tâches à mémoire égale | +≥3 pp | harnais du dépôt, flux long | Δ ≤ 0 | Zhang 2605.12978 ; O'Neill 2026 |
| H-R1.12 **[SPÉC, non-LLM]** Bruit en U inversé | Avec consolidation à barrière (Doob), la rétention est non monotone en bruit synaptique ; monotone sous EWC | optimum intérieur +≥5 pp vs bruit nul | simulation Split-MNIST (M1) | monotone | Howe 2026 |

## 9. Concepts et intuitions nouveaux (tous **spéculatifs**, étiquetés)

- **C1 Commutation par disjonction de support** — DR-2 renforcé : deux ops commutent ssi leurs masques de mise à jour sont disjoints (silent-DOF, k-WTA). L'ordre compte proportionnellement au recouvrement. Test : mesurer |supp(Δ_i) ∩ supp(Δ_j)| et corréler à l'effet d'ordre (Robertson). Transforme DR-2 d'une liste d'interdits en une loi mesurable. [SPÉC → T3 étendu]
- **C2 Recombinaison rectifiée** — tout `recombine` doit passer par un critique interne (évaluateur de fin, cohérence physique, non-régression S1 par échantillon), comme R²-WAM et les « rêves notés » de Nijjer. Hypothèse : la nullité RECOMBINE du dépôt est un artefact d'absence de gate. [→ H-R1.7]
- **C3 Ledger d'énergie** — l'énergie d'une mémoire associative comme *monnaie* substrat-agnostique : budget (DR-0), priorité (DR-1), comparaison de substrats (DR-3 par statistiques de paysage, pas par géométrie). [→ H-R1.2]
- **C4 Horloge infra-lente endogène** — remplacer le déclencheur de DE par un gate interne (~0,015 Hz-équivalent) piloté par l'accumulation de surprise/énergie ; les DE existent en « veille calme ». [→ H-R1.9]
- **C5 Homéostasie à signe indéfini** — `downscale` → `rescale(f)` avec f de part et d'autre de 1 selon le contraste de taux éveil/sommeil (WISE/SHY unifiés). [→ H-R1.5]
- **C6 Le rêve comme désapprentissage d'attracteurs parasites** — relier `downscale` (unlearning) et `recombine` (séparation de mélanges DLAM) dans une seule énergie libre : premier chemin vers des axiomes *prouvés* sur substrat. [→ H-R1.1]
- **C7 Baseline « rétention épisodique brute »** — toute revendication de rêve doit battre la rétention brute + compression (Zhang 2605.12978) ; à inscrire comme baseline obligatoire des préenregistrements.
- **C8 Rêve physique** — un DE = une relaxation physique (PotentialEP/EqProp) ; budget = énergie dissipée mesurée (M3.c réel, non modélisé) ; les 4 ops exprimables sans gradient global. [SPÉC, matériel non disponible]
- **C9 `reconstruct` comme 5ᵉ générateur** — entre replay verbatim et recombinaison libre : réécriture d'un épisode conditionnée à l'état courant (MemHarness). À tester : est-il réductible à replay∘restructure ? Sinon, le semigroupe passe à 5 générateurs.
- **C10 Métrique temporelle du restructure** — mesurer ce que la compression « gist » perd sur l'axe temps (Kyrkewood : 3 % → 62 %) ; ajouter une M-temps à E3.

Limites de cette revue : budget WebSearch de la session épuisé après 12 requêtes (annonces éditeurs sept.–oct. non balayées exhaustivement) ; API arXiv passée en 429 après ~10 requêtes (vérifications terminées via fiches `abs/` et Europe PMC) ; Hugging Face rate-limité une fois (relancé). Aucun calcul lancé, aucun dépôt modifié.
