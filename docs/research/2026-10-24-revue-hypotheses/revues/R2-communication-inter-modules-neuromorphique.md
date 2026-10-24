# R2 — Communication discrète inter-modules et substrats neuromorphiques : revue critique de nerve-wml

Hypneum Lab · revue R2 · 2026-10-24 · périmètre : nerve-wml HEAD `a3810cc` (v1.9.0 + erratum L1a du 24/10, tag `n10c-freeze-20261024`).
Lecture seule du dépôt ; aucune machine touchée, aucun calcul lancé.

**Méthode et limites.** Lecture de la veille du 23/10 puis du dépôt (README, `papers/paper1/main.tex`, `refs.bib`, `nerve_core/invariants.py`, `track_p/multiplexer.py`, `track_w/bio_field_wml.py`, 9 préenregistrements/avenants, 8 notes `docs/superpowers/research/`, manifeste N10-C). 16 recherches web (quota de session épuisé ensuite), 25 requêtes GitHub (`gh search`/`gh api`), ~40 requêtes Hugging Face (modèles, jeux de données, papiers), 27 pages arXiv/éditeurs vérifiées une à une (titre, auteurs, dates). **L'API arXiv (`export.arxiv.org`) a répondu 429 pendant toute la session** : les identifiants ci-dessous ont été vérifiés sur `arxiv.org/abs/<id>` et non via l'API. Les sources éditeurs bloquées (direct.mit.edu, globenewswire, pubmed : 403) sont marquées « verrou ». Marquage : **[NOUVEAU]** = absent de la veille du 23/10 ; **[veille]** = déjà couvert ; **[fondement]** = antérieur à 2026, cité pour l'ancrage.

**Déjà couverts par la veille du 23/10 (non dupliqués, seulement rappelés quand ils éclairent un claim) :** Ruffini et al. Neural Comput. 38(8) 2026 ; Kim–Lee–Choi–Battaglia bioRxiv 2026.04.30.721821 ; Shang 2609.24209 ; KoPE 2604.07904 ; WONN 2605.20922 ; Kuramoto Attention 2606.11585 ; PCL+ 2605.12732 ; DiffPC ICLR 2026 ; Vock & Meisel 2608.28431 ; Chauhan & Bera 2609.34373 ; H-JEPA 2610.06805 ; ITC 2605.16457 ; NIR v1.0.8 ; You et al. 2609.27252 ; Keshavarzi bioRxiv 2026.06.05.730524 ; platoscave 2604.18572 ; Gröger–Wen–Brbić 2602.14486.

---

## 1. Hypothèses ciblées (verbatim EN, source dans le dépôt)

| # | Énoncé exact | Source | Statut interne au 24/10 |
|---|---|---|---|
| H-A | « Claim A — Substrate-agnostic polymorphism (task competence converges). Three structurally distinct substrates (stateless MLP, spiking LIF with surrogate-gradient, attention-based Transformer) reach comparable accuracies via the shared Nerve Protocol. » | README §Status v1.8.0 | Confirmé (plateau 2–3 %, n=50) |
| H-B | « Claim B — Substrate-agnostic information transmission (codes align). Independent substrates share a high fraction of their emitted post-VQ discrete code information (MI/H ≈ 0.93 …) ; a frozen LIF can recover a trained MLP's task competence via a learned linear transducer. » + caveat ADR-0001 : « debiased Kraskov–KSG on the pre-VQ continuous embeddings … gives MI/H ≈ 0.10. The argmax quantisation manufactures most of the apparent alignment » | README, ADR-0001 | Requalifié : convergence = prior art (ADR-0002) ; mesure post-VQ = contribution |
| H-NL | « A neuroletter is a tuple (code, role, phase, src, dst, t) with code ∈ {0,…,63}, role ∈ {π, ε}, phase ∈ {γ, θ} … Each WML owns a local codebook of 64 embeddings ; per-edge transducers map between neighbours' codebooks. » ; spec : « learned alphabet, \|Σ\| = 64 codes, ~6 bits per letter » ; « γ (40 Hz) carries predictions, θ (6 Hz) carries errors, no collision by phase » | `main.tex` §Method ; spec §1 | Alphabet 64 non justifié empiriquement (voir §3.2) |
| H-N3 | « N-3: role == ERROR ⟺ phase == THETA in strict mode » ; papier : « functions as a formal correctness contract — a type-checker for letter well-formedness at composition time — rather than a differential computational mechanism » ; « the experiments in this draft run … with the θ phase inactive throughout training — only the γ pathway is stressed » | `invariants.py` ; `main.tex` §Method, §Limitations | Δ = 0 à 4 chiffres (ablations) ; honnêtement rétrogradé |
| H-N4/N5 | « N-4: routing_weight(i, j) ∈ {0, 1} post-pruning ; continuous Gumbel during training. » « N-5: Each WML owns its codebook ; cross-codebook mapping via transducers. » ; « The topology is a learned directed graph with K ≪ N active out-edges per WML, sampled via Gumbel-softmax top-K » | `invariants.py` ; `main.tex` | γ-priority : 26 % de collisions sans règle (P3) |
| H-GTM | Q1 H0 : « The GammaThetaMultiplexer (GTM) outperforms classical latent-space bridge architectures on HardFlowProxyTask N=2, with statistically significant wins on at least 2 of 3 metrics (mutual information per unit budget H, round-trip fidelity, bandwidth efficiency) versus each of 3 baselines » | `docs/milestones/q1-…` | **tied** 3W/5L/1T ; gamma-only ≈ theta-only ≈ GTM complet |
| H-BF | « BioFieldWML SNN-PC belief substrate has a measured substrate-intrinsic edge … genuine (μ,σ) belief-state edge is +0.14 (CI95 [0.12, 0.16], 48/50 …) ; μ-driven (σ adds nothing) … Honest scope: substrate-INTRINSIC on HardFlowProxyTask; NOT agnostic/SOTA. » | README finding 8 | +0.30 brut dont ~0.16 raccourci \|error\| ; erratum L1a 24/10 : porte **non passée** à n=1024 (13,1 % > 10 % non entraîné) |
| H-N10A | « GTM top-1 accuracy at code_dim=32 exceeds VQ-VAE top-1 by ≥1.5 percentage points (Bonferroni-corrected, 5 seeds). » | `n10a-…-2026-05-11` | Avenant 23/10 : estimation seule, comparateur oscillatoire (KoPE/WONN-style), spécificité PAC « not addressed » |
| H-N10C | « GTM as a multi-agent communication channel in cooperative Procgen environments achieves higher coordinated team reward at fixed bandwidth (16 bits/step/agent) than 3 baseline communication architectures (broadcast MLP, cross-attention ATOC-style, discrete DIAL). Specifically: GTM team reward (median across 5 seeds) exceeds best baseline by ≥10% of dynamic range … on at least 2 of 3 cooperative Procgen tasks. » | `n10c-…-2026-05-11` | **Gelé 24/10** : estimation, succès seul, bras `eng`+`nocomm`, condition « side-channel-closed », sonde de dérangement, 6 graines, 2 hôtes, **K=4 × A=16** (pas 64) |
| H-N11A | « GTM-predictor I-JEPA at standard ViT-B/16 scale exceeds vanilla MLP-predictor I-JEPA top-1 by ≥1.0 percentage point » | `n11a-…` | Avenant : estimation ; ImageNet-100 |
| H-N11C | « GTM-dynamics Dreamer V3 normalized human score (mean across 6 representative Atari-100k games) exceeds baseline Dreamer V3 score by ≥10% » | `n11c-…` | Avenant : estimation ; ITC remplace IRIS |
| H-POS | « NIR governs the model, AER governs the wire; nerve-wml governs the learned message in between, and is orthogonal to both by construction rather than by competition. » ; Untested scope : « No head-to-head performance benchmark versus prior work (DVNC, NIR, AER) » | `main.tex` §Related Work, §Untested | Positionnement tient ; aucun banc comparatif |

---

## 2. État de l'art (réf. vérifiée | date | résultat | relation au claim)

Relation : **appuie** / **contredit** / **dépasse** (rend obsolète ou déplace la cible) / **neutre**.

### 2.1 Communication discrète, goulots VQ, langage émergent

| Réf. | Date | Résultat | Relation |
|---|---|---|---|
| Farooq & Iqbal, *Bandwidth-Efficient MAC through IB and VQ*, arXiv:2602.02035 (ICRA 2026) [NOUVEAU] | 02/2026, v2 08/2026 | IB + VQ + porte « quand communiquer » ; +181,8 % vs sans-com, −71,4 % de bande (chiffre **corrigé** de 41,4 % en v2) | **dépasse** N10-C : baseline VQ discrète plus forte que DIAL/MLP ; **appuie** le choix discret |
| Farooq & Iqbal, *Formal Verification of Learned MAC Policies*, arXiv:2606.19632 [NOUVEAU] | 06/2026 | VQ-VIB 5–7 drones ; messages discrets : fidélité de distillation +11,6–13,6 pp vs continu, vérification 3–4× plus rapide | **appuie** « neuroletters discrètes » (vérifiabilité, pas performance) |
| Kapoor, Bhisikar, Freed, Peters, Sun, *DDCL*, arXiv:2511.01554 [NOUVEAU] | 11/2025 | Communication discrète différentiable à précision binaire **apprise** ; bande ÷>10 à performance égale, plug-in sur 4 algos MARL | **dépasse** le budget fixe 16 bits de N10-C (la précision devrait être une variable) |
| Kaszyński, *Emergent Compositional Communication for Latent World Properties*, arXiv:2604.03266 [NOUVEAU] | 03/2026 | Goulot Gumbel-softmax + apprentissage itéré : PosDis 0,999 sur 80 graines ; « la structure multi-agent, pas la capacité du canal » produit la compositionnalité | **appuie** la lecture « Emergence, Not Bandwidth » ; invite à mesurer la compositionnalité des codes GTM |
| Canesse, Goupil, Read, Vanier, *Decoupling Communication from Policy (SLIM)*, arXiv:2605.21085 [NOUVEAU] | 05/2026 | Budget β normalisé (parcimonie × tours × dimension) ; découpler canal et latent de politique évite la dégradation à bande réduite | **contredit** l'architecture N10-C (comm encoder branché sur le hidden 64 de la politique : goulot couplé) |
| Chen, Yang, Liu, Joe-Wong, *Five Ws of MAC*, arXiv:2602.11583 (TMLR 2026) [NOUVEAU] | 02/2026 | Taxonomie MARL → langage émergent → LLM | **neutre** (cadrage related work) |
| Montes-Gonzalez, arXiv:2609.38527 [NOUVEAU] | 29/09/2026 | Protocole co-évolué 2D→robots 3D : 1/30 graines réussit ; persistance comportementale, transfert fonctionnel incomplet | **appuie** l'alerte « protocoles mutuellement inintelligibles » pour la sonde cross-play N10-C |
| Chauhan & Bera, arXiv:2609.34373 [veille] | 28–29/09/2026 | Chiffres (vérifiés) : émetteur ingénieur 1,000 vs appris 0,482 (p=0,400, n=25) ; warm-start récepteur 0,857 vs 0,562 ; 2 bits/décision ; 3 arènes MuJoCo | **contredit** la logique « GTM > baselines » ; déjà intégré à l'avenant N10-C (bras `eng`) |
| Tang et al., *StableVQ*, arXiv:2609.26774 [NOUVEAU] | 22/09/2026 | Instabilité VQ = intrication encodeur/codebook ; Dynamic STE, Region VQ loss, schedules découplés ; faible utilisation du codebook | **appuie** la « code-usage manipulation check » de l'avenant N10-A ; à appliquer au VQ-VAE baseline |
| Lowe et al., *On the pitfalls of measuring emergent communication* (AAMAS 2019 ; repo fb) [fondement] | 2019 | Métriques CIC / IC : le succès de tâche ne prouve pas la communication | **appuie** la sonde de dérangement N10-C ; fournit CIC comme métrique complémentaire |
| Tucker et al., VQ-VIB (NeurIPS 2022, repo) [fondement] | 2022 | Goulot VQ + IB pour langage émergent | baseline naturelle manquante dans Q1/N10-C |
| Han, Dastani, Wang, *ISA*, arXiv:2505.08630 (v2 08/2026) [NOUVEAU] | 05/2025–08/2026 | Attribution de crédit par « influence scope » en récompense parcimonieuse | **appuie** le choix « succès seul » mais signale le risque d'exploration non focalisée à 50 M pas |

### 2.2 Communication latente entre agents (hors texte) et audits causaux

| Réf. | Date | Résultat | Relation |
|---|---|---|---|
| Du et al., *Interlat*, arXiv:2511.09149 (ACL 2026) [NOUVEAU] | 11/2025, v5 07/2026 | États cachés transmis directement, compression apprise, ×24 vitesse | **neutre/dépasse** : le champ LLM a son « nerf » continu ; nerve-wml se distingue par le discret |
| Liu, *Beyond tokens*, arXiv:2606.05711 [NOUVEAU] | 06/2026, v3 07/2026 | 18 méthodes, 3 axes (quoi, alignement, fusion), 5 patrons | **neutre** : grille de lecture pour positionner transducteurs/N-5 |
| Liu et al., *Vision Wormhole*, arXiv:2602.15382 [NOUVEAU] | 02/2026, v3 28/09/2026 | Codec universel par modèle → espace de référence partagé (carte affine) → décodage chez le récepteur ; hub-and-spoke O(N) ; +6,0 pp, ×1,69 | **dépasse** le transducteur par arête (O(N²)) : l'espace pivot = relative representations appliquées à la communication |
| Chen et al., *Dense Latent Communication Across Heterogeneous Agents*, arXiv:2606.13594 [NOUVEAU] | 06/2026, v2 05/10/2026 | Alignement KV-cache inter-modèles (désintrication positionnelle, reconstruction puis génération) ; transfert Mistral→Qwen | **dépasse** (hétérogénéité LLM) ; **appuie** l'idée d'alignement appris entre substrats |
| Cheng, Das, Ramnath, *When Does Latent Communication Pay?*, arXiv:2608.04893 [NOUVEAU] | 08/2026 | Audit par cache **désapparié / nul / aléatoire** : 100 % vs 23–25 % quand l'info est nécessaire ; équivalence à 2,8 pts sinon | **appuie et étend** la sonde de dérangement N10-C (ajouter le bras « message désapparié ») |
| Zhang & Emu, *Do Latent Channels Actually Communicate?*, arXiv:2607.26773 [NOUVEAU] | 07/2026 | 4 réglages de message → 5 mesures (info émetteur, sensibilité récepteur, valeur du contenu) ; effets inversés entre 4B et 8B | **contredit** toute lecture d'un gain agrégé comme « communication » ; **appuie** une décomposition |
| Gazzaev et al., *Hidden Messages Between Diffusion LM Agents*, arXiv:2610.28905 [NOUVEAU] | 20/10/2026 | Dérangement efface 63,6–100 pts ; effet de contenu 34,0 pts ; **un seul transfert tardif (87,8 %) bat 4 échanges** | **dépasse** : le *timing* du message compte plus que la fréquence — directement testable avec θ |
| Rossi et al., *CacheBack*, arXiv:2609.32046 [NOUVEAU] | 25/09/2026 | Conditionnement par le récepteur : −75 % d'état transmis, +14,7 pp, latence ÷3,2 | **appuie** un canal ERROR (requête du récepteur) — c'est le rôle ε rendu utile |
| Huzaifa, Mavali, Eisenhofer, *Safety of Latent Communication*, arXiv:2609.39788 [NOUVEAU] | 30/09/2026 | Liens latents : compliance nocive 27,9 → 76,9 sous attaque RL | **appuie** un argument de sûreté pour un goulot discret à 6 bits inspectable |

### 2.3 Couplage phase–amplitude, communication-through-coherence, routage oscillatoire

| Réf. | Date | Résultat | Relation |
|---|---|---|---|
| Ruffini et al., *Cross-Frequency Coupling as a Neural Substrate for Prediction Error Evaluation*, Neural Comput. 38(8):1299–1343, doi:10.1162/neco.a.1537 [veille] | 2026 | DOI résout vers direct.mit.edu (403 au fetch ; vol./pages confirmés par la redirection) | **appuie** N-3 comme ancrage mécanistique ; l'entrée bib du dépôt est déjà la version journal |
| Srinivas & Canavier, *Mean Field Theory Based on the Spike Time Response Curve … Two Alternating Populations … with Delays*, arXiv:2610.10977 [NOUVEAU] | 07/10/2026 | Existence/stabilité du verrouillage de phase entre deux populations **alternantes** avec délais, mieux prédites que par la PRC instantanée à haute fréquence | **appuie** une modélisation PRED/ERROR comme deux populations alternantes ; donne un test de stabilité 40/6 Hz |
| Dan & Wu, *S2-Net*, arXiv:2605.01656 [NOUVEAU] | 05/2026 | Synchronisation partielle et transitoire (délais) qui module les spikes top-down | **appuie** l'intuition « routage par synchronie partielle » ; pas de bande nommée |
| Nissel et al., arXiv:2609.33006 [NOUVEAU] | 26/09/2026 | Ondes IF à couplage modulé : loi de vitesse récursive, échec de propagation | **neutre** (physique des réseaux IF, utile pour un nerf spatial) |
| Revue *Adv. Psychol. Sci.* 10.3724/SP.J.1042.2026.0499 [NOUVEAU] | 03/2026 | θ–γ PAC comme mécanisme d'intégration PFC–HPC–septum ; oppose CTC et gating-by-inhibition | **neutre** (cadrage) |
| Préprints cliniques 2026 : medRxiv 10.64898/2026.02.06.26345635 (Alzheimer, MEG), bioRxiv 10.64898/2026.08.03.742656 (adaptation sensorimotrice : PAC **minimal** pendant l'apprentissage) [NOUVEAU] | 02–08/2026 | PAC baisse pendant l'adaptation | **contredit** une lecture « PAC = canal d'erreur toujours actif » : la PAC chute quand l'erreur est maximale |
| Tort MI : dMI (*Direct Modulation Index*), comparaisons PLV/MVL/MI (bioRxiv 290361), NARX He et al. 2603.08866 [veille/memo 04/2026] | — | Aucun nouveau métrique 2026 trouvé ; MI surestime sous la fréquence cible | **neutre** ; conserver phase préférée + surrogate (recommandation veille) |
| Harris & Gong *Nat Commun* 2026, Huang et al. *PNAS* 2026, Nour et al. *Nature* 2024 [memo 04/2026] | — | 7±2 paquets γ par cycle θ ; neurones PAC dédiés | **appuie** `symbols_per_theta=7`, cap K≤9 |

### 2.4 Réseaux d'oscillateurs appris et oscillateurs physiques

| Réf. | Date | Résultat | Relation |
|---|---|---|---|
| WONN, arXiv:2605.20922 — **NeurIPS 2026 Spotlight** (README du dépôt) [veille + détail NOUVEAU] | 09/2026 | Compétitif ImageNet-1K | **dépasse** AKOrN comme comparateur ; déjà fallback N10-A |
| Hays, *Selective Synchronization Attention*, arXiv:2602.14445 [NOUVEAU] | 02/2026 | Attention = solution stationnaire de Kuramoto ; parcimonie par condition de verrouillage de phase | **appuie** H-N4 : la topologie sparse peut **émerger** du verrouillage de phase, sans Gumbel top-K |
| KuraNet, arXiv:2105.02838 [fondement] | 2021 | Oscillateurs couplés qui apprennent à se synchroniser | base pour un transducteur par verrouillage |
| Tammali & Olin-Ammentorp, *Lock-in EP*, arXiv:2610.07283 [NOUVEAU] | 05/10/2026 | Equilibrium propagation « lock-in » pour matériel oscillatoire analogique ; règle à 3 facteurs ; réseaux peu profonds seulement | **appuie** la faisabilité d'un apprentissage local *sur* substrat oscillatoire |
| Cheng, Dai, Stan, Lin, *Delayed Coupling Restores Ising Phase Dynamics*, arXiv:2607.16634 [NOUVEAU] | 07/2026 | Les oscillateurs physiques ne suivent pas l'Ising attendu (harmoniques pairs) ; délai compensateur | **contredit** l'idée qu'un PSK idéal se transpose tel quel sur oscillateurs physiques |
| Haverkort & Todri-Sanial, Front. Neurosci. 19, doi:10.3389/fnins.2025.1658490 (publié 15/01/2026 ; arXiv:2504.20680) [NOUVEAU] | 01/2026 | 506 oscillateurs numériques tout-connectés sur Zynq-7020, **poids 5 bits, phase 4 bits**, mise à l'échelle ~1,2 | **contredit** 64-PSK sur ONN numérique : 4 bits de phase = 16 niveaux → alphabet ≤ 16 (cohérent avec A=16 de N10-C) |
| Florio et al., *Programmable Integrated Magnonic Meshes*, arXiv:2605.00290 [NOUVEAU] | 04–06/2026 | Mailles YIG : démultiplexeurs de fréquence, routeurs 2×2 commandés en phase, 6 E/S, 7 étages, sans amplification | **appuie** (spéculatif) un « nerf physique » à multiplexage fréquence/phase |
| Leo et al., *Asynchronous Mixed-Signal Resonate-and-Fire Neuron*, arXiv:2512.07361 [NOUVEAU] | 12/2025 | Neurone RF CMOS fabriqué, handshake asynchrone, détection de fréquence | **appuie** un démodulateur γ matériel ; node/fréquences non lus |
| Chiavazza et al., *Adaptive-Frequency RF Neurons*, arXiv:2606.13516 [NOUVEAU] | 06/2026 | Neurones RF à fréquence adaptative verrouillant plusieurs cibles | **appuie** un récepteur multi-porteuse sans FFT |
| STO couplés (PMC13218320, date à confirmer) ; Nature Rev. Phys. s42254-025-00918-1 [fondement] | 2025– | Verrouillage par injection ; arrays 8×8 / 50 en chaîne | faisabilité d'un porteur γ spintronique : échelle ≤ 64 oscillateurs atteinte en labo |

### 2.5 Codage prédictif à impulsions, apprentissage local, interopérabilité

| Réf. | Date | Résultat | Relation |
|---|---|---|---|
| Attar & Rossi, *Predictive Suppression Layers*, arXiv:2609.21583 (NeuroPHY 2026 / EWSN) [NOUVEAU] | 18/09/2026 | Couches qui ne transmettent que l'activité **imprévisible** (résidus signés) : activité communiquée ÷3, précision ↑ sur N-MNIST et SHD | **appuie** un régime « ERROR-only » du nerf ; **dépasse** la symétrie π/ε actuelle |
| EchoSpike 2405.13976 ; PC-SNN 2211.15386 ; N'dri et al. survey 2409.05386 [fondement] | 2022–24 | Règles locales prédictives pour SNN | ancrage de BioFieldWML (Lee et al. 2024 reste la bonne réf. SNN-PC) |
| NIR : dépôt `neuromorphs/NIR` (push 28/09/2026), `NIRTorch` (18/09), **`Limen-Neural/nir-rs` Rust (18/10/2026)** [NOUVEAU] | 09–10/2026 | Toujours **aucune primitive de message inter-modules** | **appuie** H-POS ; ouvre une contribution upstream (« message port ») |
| Lava archivé (gh api `archived: true`, dernier push 13/05/2026 ; README : « next-generation Loihi architecture and SDK … physical AI ») [NOUVEAU] | 05/2026 | Toute la pile Lava (lava, lava-dl, lava-optimization) en lecture seule | **contredit** le chemin documenté `PyTorch → lava-dl SLAYER → netx → Loihi 2` du memo 04/2026 et de `loihi_stub.py` |

---

## 3. Preuves POUR / CONTRE par claim

### 3.1 GTM vs baselines (Q1 tied ; N10-A/C/N11 en estimation)
**POUR.** (i) Le `mi_h` dominant (1,197 vs 0,40–0,43) est robuste ; (ii) l'entropie spectrale sépare GTM de `simple_gating` à toute taille de lot (Renf 10, 13) ; (iii) la verifiabilité des canaux discrets (2606.19632) et la sûreté (2609.39788) donnent au discret une valeur hors performance.
**CONTRE.** (i) Les ablations gamma-only / theta-only ≈ GTM complet : la **PAC n'est pas porteuse** sur HardFlow ; (ii) les baselines de Q1 (MLP, cross-attention, RecursiveLink) sont faibles face aux goulots discrets 2026 : IB+VQ+porte (−71 % bande, 2602.02035), DDCL à précision apprise (2511.01554), VQ-VIB ; **N10-C n'a aucune baseline VQ moderne** ; (iii) SLIM (2605.21085) montre que brancher le canal sur le latent de politique (ce que fait l'architecture N10-C, Linear 256→64→comm) crée un goulot couplé qui pénalise toutes les arches à bande réduite — le « tie » peut être un artefact d'architecture ; (iv) 2610.28905 : le *moment* d'un message pèse plus que sa fréquence — N10-C émet à chaque pas ; (v) Chauhan & Bera : l'émetteur appris est indistinguable du silence sous couplage partiel — l'avenant répond (bras `eng`, `nocomm`), mais le récepteur **warm-start** (0,857 vs 0,562) n'est pas repris.
**Verdict.** Le tie est solide ; la question n'est plus « GTM gagne-t-il ? » mais « qu'apporte la structure γ/θ que `simple_gating` n'a pas ? ». Réponse mesurable aujourd'hui : seulement une signature spectrale.

### 3.2 Codebook 64 symboles
**POUR.** 64 = 6 bits/lettre, PSK 64 avec distance min 0,098 ; `learned` ≈ `relative_rep` à `n_anchors=64` (Δ 0,0001, p=0,627, n=50) — le transducteur appris atteint le plafond d'une méthode géométrique fermée ; alphabet 128 / K=9 : GTM et `simple_gating` saturent encore (Renf 13).
**CONTRE.** (i) Aucune mesure ne **sélectionne** 64 : la MI sature à 2,22 bits (A=64, K=7) puis 3,55 (A=128, K=9) — la tâche, pas l'alphabet, fixe le plafond ; (ii) **N10-C utilise A=16, K=4** : le protocole gelé contredit déjà « 64 symboles » ; (iii) matériel : 4 bits de phase sur ONN numérique (Haverkort 2026) ⇒ 16 niveaux ; jitter ~ms sur SpiNNaker2 à 40 Hz (période 25 ms) ⇒ pas de phase 5,6° (0,39 ms) distinguable : **64-PSK est irréaliste hors Loihi 2 (~200 ns)** ; `HardwareJitterNoise` reste `NotImplementedError` ; (iv) StableVQ : utilisation réelle du codebook à surveiller (la manipulation check N10-A est bonne, à étendre à N10-C) ; (v) Lisman–Idiart 7±2 porte sur des *créneaux*, pas sur 64 symboles par créneau.
**Verdict.** 64 est une constante d'ingénierie, pas un résultat ; la dimensionner par le substrat (A = f(jitter, f_γ)) est une hypothèse falsifiable (§8, H5).

### 3.3 Rôles PRED γ / ERROR θ (N-3)
**POUR.** Ancrage renforcé : Ruffini 2026 (journal), Kim 2026 (salves multi-fréquences routant l'information), Canavier 2026 (stabilité de deux populations alternantes avec délais). CacheBack (récepteur conditionnant l'émetteur) et Predictive Suppression (ne transmettre que l'imprévu) montrent que le canal « erreur/requête » est **le** canal utile en 2026.
**CONTRE.** (i) Le dépôt l'admet : θ inactif dans toutes les expériences ; N-3 = type-checker ; (ii) la PAC **baisse** pendant l'adaptation sensorimotrice (bioRxiv 2026.08.03) — si la θ-PAC portait l'erreur, on l'attendrait maximale ; (iii) Keshavarzi : MI aveugle à la polarité de phase ; (iv) aucune ablation « ERROR-only » n'existe.
**Verdict.** Le rôle ε n'est ni testé ni réfuté ; c'est la ligne la plus prometteuse (§8, H7).

### 3.4 Topologie sparse apprise (N-4, Gumbel top-K, γ-priority)
**POUR.** 26 % de collisions sans règle de priorité (P3) ; routeur connecté à N=32.
**CONTRE.** Selective Synchronization Attention (2602.14445) et S2-Net : la parcimonie peut émerger d'une **condition de verrouillage de phase** sans paramètres de routage — la CTC de Fries est précisément cela. Vision Wormhole : un espace pivot partagé rend O(N) ce qui est O(N²) en transducteurs par arête (N-5 tel qu'implémenté).
**Verdict.** Le routeur Gumbel est une solution ML standard ; la version « hors LLM » (routage par cohérence) n'a pas été essayée.

### 3.5 BioFieldWML (SNN-PC, VMP gaussien) et LIF
**POUR.** Edge +0,14 μ-driven, 48/50, > null ; Lee et al. 2024 bien cité (la veille a corrigé la confusion avec N'dri).
**CONTRE.** (i) Phase 2 = **VMP gaussien fermé sur des comptes de spikes** ; les phases 3–5 (STDP triplet, IE, E/I) sont différées : « spike-native » est encore nominal ; (ii) le probe complet +0,30 contient 0,16 de raccourci \|error\| = \|input_proj(x)\| ; (iii) **erratum 24/10 : la porte L1a Full-LIF n'a pas passé à n=1024 (13,1 % non entraîné > 10 %)** — CHANGELOG et PR #48 affirmaient « all 4 sizes pass » ; v1.9.0 jamais archivé sur Zenodo ; (iv) Predictive Suppression (2609.21583) fait du PC à impulsions **communication-efficient** mesuré sur N-MNIST/SHD : c'est le comparateur externe manquant.
**Verdict.** Résultat intrinsèque honnête ; la revendication « substrat biologique » doit attendre les phases 3–5 et une graine supplémentaire pour L1a.

### 3.6 N10/N11
**POUR.** L'avenant N10-C est méthodologiquement au niveau 2026 : estimation, succès seul, référence à contenu connu, condition sans canal latéral, dérangement, cross-play, manifeste gelé par tag, SWHID.
**CONTRE.** (i) Il manque le bras **« message désapparié »** (Cheng 2608.04893 ; Zhang & Emu) : le dérangement mesure la *sensibilité*, pas la *valeur du contenu* ; (ii) pas de récepteur warm-start (Chauhan & Bera) ; (iii) pas de baseline VQ/IB ni DDCL ; (iv) le canal est émis à chaque pas (cf. 2610.28905 : timing > fréquence) ; (v) alphabet 16×4 ≠ 64 : le résultat ne portera pas sur « neuroletters 64 » ; (vi) puissance : 18 % à d=1 pour le contraste primaire (table de l'avenant) — c'est bien un pilote ; (vii) N11-A/C : H-JEPA/ITC déjà notés par la veille ; aucun code n'existe.

### 3.7 Le protocole a-t-il un sens sur un substrat physique réel ?
Oui pour la **couche logique** (symbole discret typé, rôle, phase), non pour la **couche physique telle qu'écrite** : (a) 64-PSK à 40 Hz exige une résolution de phase que ni les ONN numériques (4 bits), ni SpiNNaker2 (jitter ms), ni les oscillateurs Ising physiques (harmoniques pairs, 2607.16634) n'offrent ; Loihi 2 le permettrait mais sa pile logicielle (Lava) est archivée ; (b) les neurones resonate-and-fire (Leo 2025 ; Chiavazza 2026 ; Orchard 2021 sur Loihi 2) sont le démodulateur naturel d'une porteuse γ ; (c) les mailles magnoniques (Florio 2026) réalisent physiquement démultiplexage fréquentiel + routage par phase — un GTM en ondes de spin est **concevable** ; (d) NIR/AER restent orthogonaux : le « message port » n'existe nulle part. **Conclusion : le protocole a un sens physique si l'alphabet devient une fonction du substrat et si la démodulation passe par des résonateurs plutôt que par un LSTSQ.**

---

## 4. Dépôts GitHub (★, dernier push, licence — `gh api` au 24/10/2026)

| Dépôt | ★ | Push | Licence | Réutilisation pour nerve-wml |
|---|---|---|---|---|
| lucidrains/vector-quantize-pytorch | 4021 | 2026-10-24 | MIT | Baselines VQ/FSQ/LFQ modernes pour Q1/N10-A (remplacer le VQ-VAE maison) |
| fangwei123456/spikingjelly | 2170 | 2026-10-24 | Apache-2.0 | LIF/RF neurons, surrogate ; alternative à `LifWML` maison |
| jeshraghian/snntorch | 2078 | 2026-10-20 | MIT | Idem ; export NIR natif |
| openai/procgen | 1199 | 2026-03-27 | MIT | Base de CoinRun-coop (build arm64 patché dans le dépôt) |
| uoe-agents/epymarl | 741 | 2024-09-24 | Apache-2.0 | Baselines MARL (QMIX/MAPPO) — N10-C n'a que PPO-MA maison |
| lava-nc/lava, lava-dl, lava-optimization | 741/183/67 | 2026-05-13 | NOASSERTION/BSD-3 | **ARCHIVÉS** : chemin Loihi 2 de `loihi_stub.py` à réécrire |
| facebookresearch/EGG | 323 | 2025-05-06 | MIT | **archivé** ; toujours la référence pour jeux de communication émergente (Lewis, référentiel) |
| open-neuromorphic/open-neuromorphic | 330 | 2025-07-12 | GPL-2.0 | Liste de projets |
| neuromorphs/NIR · NIRTorch · Limen-Neural/nir-rs | 188 · 26 · 0 | 2026-09-28 · 09-18 · 10-18 | BSD-3 · BSD-3 · Apache | Export `LifWML`→NIR ; proposer une primitive « message port » ; nir-rs = cible Rust/embarqué |
| autonomousvision/akorn | 135 | 2025-10-22 | **aucune** | AKOrN de référence (le dépôt n'a qu'une version « minimal ») ; licence absente = risque |
| synsense/sinabs | 127 | 2026-02-05 | Apache-2.0 | Cible Speck/Xylo ; support NIR |
| SpiNNakerManchester/sPyNNaker | 121 | 2026-10-23 | Apache-2.0 | Cible SpiNNaker2 (jitter ms : test de l'alphabet) |
| EtienneCmb/tensorpac · pactools · tortlab/phase-amplitude-coupling · voytekresearch/pacpy | 121 · 109 · 44 · 27 | 2024-07-30 · 2026-06-16 · 2026-10-16 · 2026-02-02 | BSD-3 · BSD-3 · — · MIT | Métriques PAC (MI, MVL, surrogates) pour valider le proxy « pic θ sur enveloppe γ » |
| Jiawen-Dai/WONN | 42 | 2026-09-26 | **aucune** | Comparateur oscillatoire N10-A (fallback) ; licence absente |
| google-deepmind/emergent_communication_at_scale | 40 | 2024-07-30 | Apache-2.0 | Protocoles à l'échelle (populations) |
| facebookresearch/measuring-emergent-comm | 35 | 2019 | — | **archivé** ; métriques CIC/IC à réimplémenter (numpy) pour N10-C |
| Brainchip-Inc/akida_examples | 35 | 2026-08-13 | Apache-2.0 | Cible Akida (pas d'oscillateur : hors GTM) |
| mycal-tucker/vqvib_neurips2022 | 9 | 2023-03-28 | MIT | Baseline VQ-VIB (couleurs) |
| samim23/oscnet | 9 | 2026-07-26 | MIT | ONN en JAX (Kuramoto/Stuart-Landau) pour un transducteur par verrouillage |
| NACLab/ngc-lava | 5 | 2026-06-24 | BSD-3 | Codage prédictif (NGC) → Lava, utile malgré l'archivage |
| Recherches sans résultat | — | — | — | « phase amplitude coupling encoder pytorch », « theta gamma multiplexing », « procgen multi-agent », « DIAL » : **aucun dépôt** → GTM et CoinRun-coop restent sans équivalent public |

## 5. Ressources Hugging Face (téléchargements au 24/10)

| Type | Ressource | Note |
|---|---|---|
| Modèles | `electron-rare/spikingkiki-27b` (122 ; 2026-05-11), `-122b-a10b` (17) ; GGUF `mradermacher/spikingkiki-*` (jusqu'à 1623) | Propres au lab ; tags `leaky-integrate-fire` ; aucun modèle « emergent communication » sur le Hub |
| Modèles | `hamingsi/SpikingLM`, `PulseNet-Labs/spiking-sentence-embedder`, `maujim/spikingbrain-v1-7b-base` | Substrats SNN tiers possibles pour un WML |
| Jeux de données | `Blackrose900/N-MNIST` (27 625), `neuromorphic-polito/siddha` (479), `neuromorphic-polito/Roshambo` (15), `rmems/neuromorphic-event-language-bridge` (190) | N-MNIST = jeu de 2609.21583 ; SHD **absent** du Hub (prendre Zenodo) |
| Jeux de données | `EpicPinkPenguin/procgen` (6 519), `edwhu/coinrun_agent_episodes` (400), `p-doom/coinrun-dataset` (212) | Trajectoires CoinRun single-agent (pré-entraînement visuel / contrôle) |
| Jeux de données | `WymanYYY/Sleep-EDF-V2` (905), `EEGDash/eeg-mi-datasets` (6 479), `TKQXX/THINGS-EEG-MEG_CVPR2026` (1 349) | Test (9) Sleep-EDF et PAC sur EEG réel |
| Papiers (HF) | 2610.28905 (12 ↑), 2609.32046 (13), 2609.39788 (10), 2609.26774 StableVQ (56), 2605.07637 *Learning to Communicate Locally for Large-Scale MAPF* (19), 2609.32019 *Decentralized Master-Mind* (66) | Fil « latent communication » très actif en sept.–oct. 2026 |

## 6. Actualités septembre–octobre 2026

- **Intel** : Lava **archivé le 13/05/2026** (vérifié `gh api`) ; le 18/09 Mike Davies (LinkedIn) annonce une « commercialization phase » (streaming / embodied AI) — **source unique** : *Supercomputing News* 09/10/2026, qui note aussi des offres d'emploi « product stack edge/robotics » (01/09–05/10) et l'absence de réponse d'Intel. **Toujours aucune source officielle « Loihi 3 »** (les articles circulants restent promotionnels). Conséquence : le chemin Loihi 2 du dépôt n'a plus de SDK maintenu.
- **BrainChip** : AKD1500 PCIe (17/09), **Sequora** Core IP pour LLM embarqués (14/10), **AKD1500 SPI** (22/10, disponible via DigiKey ; GlobeNewswire 403, confirmé via stocktitan). Pas d'oscillateur : hors cible GTM, cible possible pour `LifWML` INT8.
- **SpiNNcloud** : site encore « © 2025 », SpiNNext « available soon » (78× GPU, sans méthodologie) ; Jülich (ESAB, FEDER) lancé 2026, UTSA THOR (02/2026, ~400 k PE), Sandia 175 M neurones ; *Communications Chemistry* 21/07/2026 : puce SpiNNaker2 vs Jetson Orin Nano (−86 % énergie). Cible réaliste pour tester le jitter ms.
- **Innatera** : blog « Robotics Requires A Softer Touch » (19/10) ; Pulsar « en production » (CEO, 02/2026, non vérifié) ; présence electronica 2026. **SynSense** : Aeveon (24/06, hors fenêtre).
- **Académique** : WONN **Spotlight NeurIPS 2026** ; StableVQ (22/09) ; Lock-in EP (05/10) ; Canavier (07/10) ; Predictive Suppression (18/09) ; Vision Wormhole v3 (28/09) ; Dense Latent Comm v2 (05/10) ; CacheBack (25/09) ; sûreté latente (30/09) ; diffusion-LM latent (20/10) ; nir-rs Rust (18/10) ; *Nature Rev. Electr. Eng.* 19/08 (métriques unifiées, cité par SCN, non lu).

## 7. Réfutations possibles / tests critiques réalisables (Mac M1 32 Go · RTX 4090) — propositions, rien lancé

| # | Test | Ce qu'il réfuterait | Coût |
|---|---|---|---|
| T1 | Implémenter `HardwareJitterNoise` (σ_jitter 200 ns « Loihi 2 », 1 ms « SpiNNaker2 », 4 bits de phase « ONN numérique ») et mesurer le taux d'erreur symbole (SER) du démodulateur GTM pour A ∈ {8,16,32,64} | « Neuroletters 64 symboles » comme protocole portable | CPU M1, minutes |
| T2 | Rejouer Q1 avec baselines **VQ-VIB** et **DDCL** (précision apprise) à budget de bits égal, n=50 | Le « tie » (GTM pourrait perdre sur mi_h face à un goulot VQ moderne) | CPU, ~1 h |
| T3 | Variante SLIM de l'arche N10-C (canal découplé du latent de politique) en **smoke** sur niveaux d'entraînement, hors manifeste gelé, étiquetée exploratoire | Le tie attendu de N10-C comme artefact de goulot couplé | M1, heures |
| T4 | Après campagne : bras **message désapparié** (épisode donneur de même longueur) et **message nul** en évaluation seule → décomposer sensibilité vs valeur du contenu (Cheng 2608.04893) | Lecture « GTM communique » si l'effet nul ≈ effet désapparié | KXKM, minutes/modèle ; dévier = le déclarer |
| T5 | Métrique CIC de Lowe et al. 2019 sur les logs N10-C (actions du récepteur \| message) | Toute communication si CIC ≈ 0 malgré S > 0 | numpy, minutes |
| T6 | Routage par **cohérence de phase** (CTC) vs Gumbel top-K dans `SimNerve` à N ∈ {16,32} : précision, collisions, nombre de paramètres de routage | N-4 comme nécessité (si CTC fait aussi bien sans routeur) | CPU, heures |
| T7 | Régime **ERROR-only** (π locales, seules ε transitent, cf. 2609.21583) sur HardFlow : lettres/pas vs précision | Symétrie π/ε du protocole ; donne enfin un rôle mesurable à θ | CPU, heures |
| T8 | Squelette relationnel H₀ (You et al.) MLP vs LIF pré-VQ contre nul calibré (piste 3 de la veille, quantifiée) | L'explication « déplacement » du 0,93/0,10 si le squelette est au niveau du nul | CPU, minutes |
| T9 | Prédiction datée avant résultats : écart cross-play GTM < écart DIAL (constellation PSK partagée) — note horodatée, pas un test préenregistré | « Protocoles mutuellement inintelligibles » s'applique aussi au GTM | 0 |
| T10 | Stabilité du verrouillage 40/6 Hz de deux populations alternantes (Canavier 2026) en snnTorch/Brian2, délais 2–10 ms | Faisabilité d'un PRED/ERROR alternant physique | M1 MPS, heures |
| T11 | L1a : rejouer n=1024 sur 5 graines avec la condition 3 (erratum) | La porte L1a elle-même | 4090 ou CPU, heures |
| T12 | Comparer `Transducer` (par arête) à un **espace pivot** à la Vision Wormhole (codec par WML → référence partagée) sur le pool N=16 : MI/H et nombre de paramètres | N-5 « mapping via transducers » comme seule architecture viable | CPU, heures |

## 8. Brainstorm — nouvelles hypothèses falsifiables (≥ 8 ; hors paradigme LLM marquées ◆)

| # | Énoncé | Prédiction quantitative | Test | Critère de réfutation | Référence d'appui |
|---|---|---|---|---|---|
| H1 ◆ **Alphabet dimensionné par le substrat** | La taille d'alphabet portable est A* = ⌊2π / (k·σ_φ)⌋ avec σ_φ = 2π·f_γ·σ_jitter ; k ≈ 3 | σ_jitter = 1 ms, f_γ = 40 Hz ⇒ σ_φ ≈ 14° ⇒ A* ≈ 8 ; 200 ns ⇒ A* > 1000 (64 OK) ; 4 bits de phase ⇒ A* = 16 | T1 | SER(64-PSK) < 1 % à 1 ms de jitter | Haverkort 2026 ; Moradi 2025 (jitter) |
| H2 ◆ **Transducteur par verrouillage d'injection** | Deux bancs d'oscillateurs (un par WML) couplés par Kuramoto apprennent la permutation de codebooks sans gradient | Paramètre d'ordre r > 0,9 en ≤ 100 cycles θ quand MI/H post-VQ > 0,8 ; échec (r < 0,5) quand MI/H < 0,3 | oscnet/KuraNet sur les codes MLP↔LIF existants | r indépendant de MI/H | KuraNet 2105.02838 ; Lock-in EP 2610.07283 |
| H3 ◆ **Routage par cohérence (CTC) sans routeur** | La parcimonie N-4 émerge d'une condition de verrouillage de phase (SSA) | À N=32, ≥ 95 % de la précision du routeur Gumbel avec 0 paramètre de routage et ≤ 30 % de collisions | T6 | Chute > 5 pp ou collisions > 40 % | Hays 2602.14445 ; Fries CTC [fondement] |
| H4 **Timing > fréquence** | Un seul message GTM émis à la phase θ « fenêtre ouverte » (team-summary) vaut 4 messages/cycle | Succès(1 message au bon moment) ≥ succès(message à chaque pas) − 0,02 à 16 bits | Variante éval-only sur policies N10-C (exploratoire) | Perte > 0,05 de taux de succès | Gazzaev 2610.28905 |
| H5 **Décomposition sensibilité / contenu** | Les agents N10-C utiliseront la *présence/timing* du message plus que son contenu | Effet(nul vs intact) ≥ 2 × effet(désapparié vs intact) pour GTM, MLP, DIAL | T4 | Effet de contenu ≥ effet de présence | Cheng 2608.04893 ; Zhang & Emu 2607.26773 |
| H6 **Constellation partagée ⇒ meilleure interopérabilité inter-graines** | L'init PSK commune + alphabet fixe réduit l'inintelligibilité | Écart cross-play GTM ≤ 0,5 × écart DIAL (taux de succès) | Sonde cross-play déjà gelée | Écart GTM ≥ écart DIAL | Chauhan & Bera ; Montes-Gonzalez 2609.38527 |
| H7 ◆ **Nerf ERROR-only (suppression prédictive)** | Ne transmettre que les lettres ε réduit le trafic sans perte | Lettres/pas ÷ ≥ 3 à précision −≤ 2 pp sur HardFlow, N=16 | T7 | Réduction < 2× ou perte > 2 pp | Attar & Rossi 2609.21583 ; CacheBack 2609.32046 |
| H8 **Structure relationnelle, pas géométrie** | Le 0,93 post-VQ / 0,10 pré-VQ s'explique par la préservation des déplacements | Recouvrement de squelette H₀ (calibré) ≥ 0,6 alors que CKA calibré ≈ 0 | T8 | Squelette au niveau du nul | You 2609.27252 ; Shang 2609.24209 |
| H9 **PAC non porteuse à l'échelle** | Sur ImageNet-100, GTM gamma-only ≈ GTM complet | \|Δ top-1\| ≤ 0,5 pp, IC95 contenant 0 | Ablation déclinée par l'avenant N10-A → étude séparée | GTM complet > gamma-only de ≥ 1 pp, IC excluant 0 | Q1 ablation ; KoPE |
| H10 ◆ **Goulot couplé** | Le tie Q1/N10-C vient du canal branché sur le latent de politique | Arche SLIM : +≥ 0,05 de succès pour **toutes** les arches, écarts inter-arches inchangés | T3 | Gain nul ou spécifique à une arche | Canesse 2605.21085 |
| H11 ◆ **Deux populations alternantes** | PRED/ERROR réalisés par deux populations spiking alternant à 40/6 Hz sont stables pour des délais synaptiques ≤ 10 ms | Verrouillage prédit par la théorie STRC ; perte au-delà d'un délai critique d* ∈ [8, 15] ms | T10 | Pas de région stable, ou d* < 2 ms | Srinivas & Canavier 2610.10977 |
| H12 **Espace pivot O(N)** | Un codec par WML vers un espace de référence (ancres) égale les transducteurs par arête | MI/H ≥ 0,95 × transducteur appris avec ≤ 1/N des paramètres à N=16 | T12 | Perte > 10 % de MI/H | Vision Wormhole 2602.15382 ; Moschella 2022 |

## 9. Concepts et intuitions nouveaux (tous **spéculatifs**, étiquetés)

1. **« Le nerf est un bus de phase, pas un bus de symboles »** [spéculatif, testable via H3/H4]. Remplacer « 64 symboles PSK dans 7 créneaux » par « adressage temporel » : la phase θ à laquelle un paquet γ arrive **est** l'adresse (CTC), et le contenu se réduit à présence/absence + petite amplitude. Cela réconcilie Lisman–Idiart (créneaux), Gazzaev (timing > fréquence) et la faible résolution de phase des substrats réels.
2. **« Audit de dérangement comme invariant de conformité (N-6) »** [prêt à préenregistrer]. Importer les audits causaux des canaux latents LLM (Cheng ; Zhang & Emu ; Gazzaev) dans la suite de conformité C+ : un substrat n'est « communicant » que si message nul, message désapparié et message intact se séparent (sensibilité ET contenu). Formulation exécutable immédiate dans `nerve_core/invariants.py`-style, données déjà prévues par la sonde N10-C.
3. **« Codebook flottant »** [spéculatif → H1]. L'alphabet n'est pas une constante du protocole mais une capacité négociée au handshake selon le jitter mesuré du lien (comme le débit adaptatif en Wi-Fi) : A = f(σ_jitter, f_γ). Déjà un embryon avec `AdaptiveCodebook` / `active_mask` (gate-adaptive).
4. **« Transducteur physique par verrouillage d'injection »** [spéculatif ++ → H2]. Deux populations d'oscillateurs (STO, RF-CMOS, Kuramoto numérique) se « traduisent » en se verrouillant ; la permutation de codebooks devient une phase relative apprise par Lock-in EP, sans rétropropagation.
5. **« Un GTM en ondes de spin »** [spéculatif +++]. Les mailles magnoniques programmables (Florio 2026) réalisent démultiplexage fréquentiel et routage 2×2 commandé en phase : un nerf physique où γ et θ sont deux bandes magnoniques et le routeur une maille reprogrammable par champ. Première étape : simuler le GTM avec 6 E/S et 7 étages de couplage, puis mesurer la diaphonie.
6. **« ERROR comme requête »** [prêt à préenregistrer → H7]. CacheBack montre que la seule chose qui vaille d'être transmise est ce que le récepteur demande ; la suppression prédictive (Attar & Rossi) montre que seul l'imprévu vaut d'être émis. Le rôle ε de nerve-wml devient : *le récepteur émet en θ ce qu'il n'a pas pu prédire ; l'émetteur n'envoie en γ que ce qui répond*. C'est la version « hors LLM » du canal récepteur-conditionné.
7. **« Primitive NIR “message port” »** [contribution d'ingénierie, pas de test]. NIR (et nir-rs) n'ont pas de primitive de message inter-graphes ; proposer un nœud `MessagePort{alphabet, roles, phases}` sérialisable en HDF5 rendrait le positionnement « couche entre NIR et AER » concret et vérifiable par un tiers.
8. **« Deux populations alternantes comme microcircuit minimal »** [spéculatif → H11]. Modéliser PRED/ERROR non comme deux rôles d'une lettre mais comme deux populations spiking en anti-phase (Canavier 2026) ; la stabilité du verrouillage sous délais devient la condition d'existence du protocole sur un substrat réel.

**Prêt à préenregistrer** : N-6 (concept 2, avec H5), H7 (ERROR-only), H8 (squelette relationnel), H9 (PAC-disabled à l'échelle, étude séparée de N10-A). **Spéculatif avec test** : H1–H4, H6, H10–H12. **Spéculatif sans test proche** : concepts 5 et 7.

---

## Résumé (≤ 15 lignes)

1. **Claim A** tient ; **Claim B** reste une mesure post-VQ dont la convergence sous-jacente est prior art (ADR-0002) ; Vision Wormhole (2602.15382) montre qu'un espace pivot O(N) remplace les transducteurs par arête — N-5 est une option d'implémentation, pas un invariant physique.
2. **GTM à égalité** confirmé, mais les baselines sont dépassées : IB+VQ+porte (−71 % bande, ICRA 2026), DDCL (précision apprise, bande ÷10), SLIM (découplage canal/politique). N10-C n'a aucune baseline VQ moderne et son canal est un goulot couplé.
3. **Codebook 64** : constante d'ingénierie, non sélectionnée par les données ; **N10-C gelé utilise A=16, K=4** ; 4 bits de phase (ONN numérique, Front. Neurosci. 01/2026) et le jitter ms (SpiNNaker2) rendent 64-PSK irréaliste hors Loihi 2 — dont la pile Lava est **archivée depuis le 13/05/2026**.
4. **PRED γ / ERROR θ** : ancrage renforcé (Ruffini 2026, Canavier 10/2026) mais θ jamais stressé ; la littérature 2026 (CacheBack, suppression prédictive) indique que le canal « erreur/requête » est le seul qui compte — à tester en régime ERROR-only.
5. **N10-C** : avenant au niveau de l'état de l'art ; manquent le bras « message désapparié » (audits causaux 2607.26773, 2608.04893, 2610.28905), le récepteur warm-start et une baseline VQ.
6. **BioFieldWML** : edge +0,14 honnête ; « spike-native » reste nominal (VMP gaussien) ; erratum L1a du 24/10 à propager dans la prochaine release.
7. **Actualités** : Intel en « commercialization phase » (18/09, source unique), BrainChip AKD1500 SPI (22/10), SpiNNext « soon », WONN Spotlight NeurIPS 2026, nir-rs (18/10).
8. **Hors LLM** : alphabet dimensionné par le jitter (H1), transducteur par verrouillage d'injection (H2), routage par cohérence sans routeur (H3), nerf ERROR-only (H7), deux populations alternantes (H11), GTM magnonique (concept 5).
9. **Limites de cette revue** : API arXiv en 429 toute la session (vérifications faites page par page), quota WebSearch épuisé après 16 requêtes, pages direct.mit.edu/GlobeNewswire/PubMed verrouillées (403).
