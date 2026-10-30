# Hypneum Lab — veille R1–R5, 15 sept. → 30 oct. 2026

2026-10-30 · veille ciblée R1–R5, complément de `veille-2026-10-23.md` et de la revue d'hypothèses du 24/10.

**Fenêtre.** Priorité 15/09 → 30/10/2026 ; rattrapage juin–sept. quand un papier manquait aux veilles précédentes.
**Sources interrogées.** arXiv API (≈ 35 requêtes, tri par date de soumission) ; OpenReview API v2 `notes/search` (27 requêtes, filtrées sur ICLR 2027 Submission, NeurIPS 2026, TMLR) ; PubMed E-utilities (8 requêtes, edat 01/09 → 30/10) ; Europe PMC, preprints bioRxiv/Research Square (8 requêtes) ; Crossref (8 DOI).
**Comptes.** arXiv : 333 identifiants distincts vus, dont 27 déjà cités (exclus). OpenReview : 170 notes. PubMed : 25. Europe PMC : 28. Après tri : **52 entrées retenues**, dont 4 mises à jour de papiers déjà cités.
**Dédoublonnage.** 642 identifiants arXiv et 139 DOI extraits de `docs/research/2026-10-24-revue-hypotheses/` : la veille du 23/10 et la revue complète. Le fichier `rapport.md` demandé n'existe pas ; c'est tout le dossier de la revue qui a servi de liste d'exclusion. Chaque titre retenu a aussi été cherché en texte dans ce dossier.
**Vérification.** Chaque identifiant ci-dessous a été résolu par une requête réelle : `id_list` arXiv (abstract complet lu), réponse `notes/search` OpenReview (id + venue + abstract), Crossref ou PubMed `efetch` pour les DOI. Les limites d'accès sont en fin de document.

Format : **id** (date) — titre, premier auteur. Résumé. → Hypneum : verdict — hypothèse. Impact.

---

## R1 — Rêve, sommeil, replay, Hopfield « rêveurs », oubli dans les MoE

Classement par impact décroissant.

- **DOI 10.1016/j.neunet.2026.109729** (Neural Networks, en ligne le 9 oct. 2026 ; vol. 206, fév. 2027) — *Do Hopfield networks dream of stored patterns? DLAM*, Barra, Durante, Ladiana, Marra Solazzo. **Version publiée de arXiv:2605.13721, déjà cité dans la revue.** Le rêve atténue sélectivement les modes de grande valeur propre de la matrice de corrélation empirique. Rêve et couplage inter-couches sont synergiques : chacun ouvre des régions de rappel inaccessibles à l'autre seul. Dans le plan (entropie des données ρ, temps de sommeil t), les diagrammes de phase montrent un compromis données-calcul.
  → Hypneum : **confirme**, mise à jour bibliographique — NH-01, NH-02, NH-05, NH-07 (pari 1 « le rêve a une formule ») et H14 DLAM. Remplacer la référence arXiv par le DOI. Le compromis (ρ, t) donne une prédiction chiffrable pour NH-01 : un shrink uniforme ne peut pas reproduire une atténuation *dépendante du spectre*. **Impact : Haut.**

- **arXiv:2609.32605** (26 sept.) — *Dense auto-hetero associative memories applied to noisy communication channels*, Agliari, Alessandrelli, Barra, Fachechi. Version dense (interactions hebbiennes d'ordre supérieur) des réseaux modulaires qui séparent un mélange de motifs : chaque module récupère un constituant. Avec des ordres d'interaction bien choisis, la capacité devient linéaire en la taille du module, régime où la version à paires échoue. Analyse par interpolation de Guerra, confirmée par Monte Carlo. Deux applications : reconstruire tous les motifs cachés à partir d'un flux de mélanges non étiquetés, et un protocole de communication où chaque jeton de message est transmis comme un mélange.
  → Hypneum : **dépasse**, avec risque de scoop partiel — le passage `recombine` = séparation de mélanges (H14) gagne une capacité extensive. Le protocole de communication est un pont R1↔R2 que nerve-wml n'a pas formalisé. **Impact : Haut.**

- **arXiv:2610.38437** (28 oct.) — *Capacity of the Hopfield-Hebbian dynamics with correlated patterns*, Stojnic. Cadre Random Duality Theory : chaque archétype est remplacé par M exemples corrélés de qualité r. Les capacités obtenues dès le premier niveau de « lifting » collent aux simulations et dépendent explicitement de (M, r).
  → Hypneum : **outil réutilisable** — c'est la référence analytique qui manquait pour « capacité avec motifs corrélés ». Elle donne α_c(M, r) sans rêve ; l'effet du noyau rêvé J(t) dans NH-01 peut se mesurer *par rapport à* cette courbe, pas seulement par rapport à 0,14. **Impact : Haut.**

- **OpenReview 3gCeBuNNyT** (NeurIPS 2026 Workshop CL4FMAgents, soumis le 8 sept.) — *When to Sleep: Consolidation Timing as a Stability-Plasticity Problem for Self-Improving Agents*. Le mécanisme est fixe ; seul le *moment* de consolidation varie. Un déclencheur fondé sur l'utilité (UTIL) est le seul point Pareto précision-coût : 49,7 ACC pour 51 % des jetons du bras « mémoire seule ». Il se déclenche aussi souvent que le calendrier fixe qu'il bat de 2,1 points : « le moment compte, pas la fréquence ». Leur hypothèse préenregistrée est réfutée : la mémoire seule est stable et peu coûteuse, et les mises à jour de poids augmentent les violations de contraintes.
  → Hypneum : **confirme** la reformulation de DR-0 en budget avec déclencheur endogène (NH-03, NH-13), et **risque de scoop** sur l'énoncé « épisode défini par le budget, pas par l'horloge ». Leur protocole (même budget, seule la politique de déclenchement varie) est le design à copier pour NH-03. **Impact : Haut.**

- **arXiv:2610.14921** (10 oct.) — *Representation Drift in Continual Learning: LoRA versus N-gram Memory*, Hao Wu. Sur un MoE de 48 couches, une chaîne de 7 tâches est apprise par trois mécanismes : mise à jour de la seule table N-gram, LoRA partagée, LoRA fraîche fusionnée par tâche. Dérive des représentations de base : 26 % (N-gram) contre 64 % (fusion) et 97 % (LoRA partagée). La dérive N-gram plafonne après la première tâche ; les deux variantes LoRA continuent d'accumuler. Mais l'oubli des tâches apprises est le même : il est gouverné par la dérive mesurée *sur les entrées de chaque tâche* (ρ de Spearman = 0,85), pas par la dérive générique.
  → Hypneum : **outil réutilisable** pour E1 (un MoE 4B/35B oublie-t-il moins s'il « rêve » ?). Adopter la dérive relative sur les entrées propres à chaque tâche, mesurée depuis le checkpoint d'apprentissage, comme covariable principale. Cela confirme aussi que micro-kiki doit mesurer l'oubli tâche par tâche plutôt qu'avec une sonde générique. **Impact : Haut.**

- **OpenReview iSadNiakMc** (ICLR 2027, soumis le 11 sept.) — *Reset or Reuse? Understanding How Optimizer Memory Shapes Continual Mixture-of-Experts Learning*. En fine-tuning continu d'un MoE, l'état de l'optimiseur conservé d'une tâche à l'autre est une source d'interférence mesurable. Elle dégrade à la fois l'acquisition et la rétention. Méthode proposée : MoRE (réinitialisations aux frontières, mises à jour structurées par rôle : experts routés contre modules toujours actifs).
  → Hypneum : **infirme potentiellement le design d'E1** si l'état Adam n'est pas contrôlé. Un gain du « rêve » pourrait n'être qu'un effet de réinitialisation implicite de l'optimiseur. Ajouter un bras « reset optimiseur sans rêve ». **Impact : Haut.**

- **OpenReview YK3D3sQJNd** (ICLR 2027) — *Theoretical Understanding of Dynamic Mixture of Experts in Continual Learning*. Expansion, gel et héritage d'experts. La spécialisation procède par phases à mesure que la diversité des tâches croît ; un nombre fini d'experts couvre un flux infini à tolérance donnée ; bornes explicites d'oubli et de généralisation.
  → Hypneum : **outil** (bornes d'oubli comparables à E1) et pont R3 : la spécialisation par phases est l'objet que kiki-flow veut décrire comme un flot. **Impact : Moyen.**

- **OpenReview KHvQdIyv5T** (ICLR 2027) — *Revisability Buys Geometry-Independence: Competitive Analysis of Batched Memory Consolidation*. Résultat négatif central : consolider par lots dont l'alignement interne est figé n'a pas de ratio compétitif borné, parce qu'un adversaire peut inonder n'importe quelle configuration fixe. Il faut de la *révisabilité* ; ils comparent rejouer d'anciennes données au refit joint. Les expériences sont préenregistrées.
  → Hypneum : **confirme** formellement que `replay` est nécessaire, et pas seulement utile, dès que la consolidation est groupée (DR-0, DR-1). C'est un argument théorique à citer contre la variante « purge sans replay ». **Impact : Moyen.**

- **OpenReview TEQKGhsCzb** (ICLR 2027) — *Loss of Plasticity and Its Recovery via Replay-Driven Compression in a Spiking Model of Hippocampal CA3*. Dans un CA3 à impulsions détaillé, l'apprentissage séquentiel de plusieurs environnements sature la connectivité récurrente jusqu'à abolir le replay. Ce phénomène ressemble davantage à une perte de plasticité qu'à un oubli catastrophique. Une compression pilotée par le replay restaure la plasticité.
  → Hypneum : **confirme** le couple `downscale`/`restructure` comme remède à la saturation, sur un substrat biologique (DR-3 « substrat-indépendant »). **Impact : Moyen.**

**Aussi vus, impact moindre :**
- arXiv:2610.40060, Callegaris & Kabashima, 29/10 : DMFT pour motifs corrélés par blocs, région de rappel ré-entrante, compétition avec les états mixtes. Outil pour savoir quand `recombine` tombe dans un mélange.
- arXiv:2610.37139, Cook et al., 27/10 : replay génératif par relaxation d'une copie gelée d'un Hopfield EqProp, comparé à SRC (Sleep-like Replay Consolidation). Baseline « replay sans tampon ».
- arXiv:2610.21493, Zhao & Tang, NeurIPS 2026 spotlight : noyaux de phase qui préservent la capacité exponentielle.
- OpenReview 9khJgK6p1C : Hopfield asymétrique, exp(Ω(n/log²n)) cycles limites. Pertinent si les épisodes de rêve sont des *séquences*.
- arXiv:2609.12079, Cowsik & Sriram : émergence de prototypes hiérarchiques dans un Hopfield dense.
- arXiv:2607.29554, Agliari et al., 31/07 : capacité exponentielle hétéro-associative multicouche.
- arXiv:2606.04651, Agliari, Fachechi et al. : transition spectrale qui contrôle la généralisation hebbienne. Rattrapage juin.
- arXiv:2610.26424, Ehsani & Cheng : trois modes de replay (online, offline, diffusif) issus d'un même mécanisme ; le diffusif généralise.
- bioRxiv 10.64898/2026.09.29.755342, S. Paul : modèle prédictif de consolidation systémique où le feedback néocortical oriente la réactivation vers les souvenirs *non consolidés*. Appuie un DR-1 sélectif.
- bioRxiv 10.64898/2026.09.15.751773, Wagle & Clopath : mémoire stable malgré la dérive grâce à l'excitabilité transitoire.
- PLoS Comput Biol 10.1371/journal.pcbi.1014761, Wu et al., 22/09 : modèle dérive-diffusion du replay, outil d'analyse.
- eLife 10.7554/eLife.107370, Hall et al. : rééquilibrage ACC–CA1 pendant les ripples après un nouvel apprentissage.
- **Mise à jour.** *Language Models Need Sleep* (Behrouz et al., arXiv:2606.03979, déjà cité) porte désormais l'**identifiant OpenReview 4BIMcGrZjq** (ICLR 2027 Submission, 18/09). Cela résout le « identifiant OpenReview à confirmer » de la veille du 23/10.
- OpenReview MQD4SODT9P : CL en deux temps jour/nuit pour SNN. À citer dans le paysage « sleep-inspired », devenu encombré.

---

## R2 — Communication inter-modules, code émergent (N10-C)

- **OpenReview Mj329S1TCg** (ICLR 2027, 23 août) — *Stagnant Neurons: Understanding and Restoring Plasticity in Multi-Agent Reinforcement Learning*. En MARL à factorisation de valeur, la perte de plasticité se localise dans des « neurones stagnants » : leur activité de mise à jour est disproportionnellement faible au regard de leur échelle et de leurs voisins de couche. La méthode KNIFE les diagnostique (RUA), fait une « chirurgie » locale qui préserve exactement la fonction, puis élague. Évaluée sur SMACv2, SMAC, Predator–Prey et MEAL.
  → Hypneum : **outil réutilisable** et **confirme** que le « dead-ReLU trunk collapse » de N10-C est un phénomène documenté en MARL, pas un bug d'implémentation. Ajouter le diagnostic RUA aux journaux N10-C (lecture seule, campagne gelée), et prévoir un bras KNIFE dans l'avenant. **Impact : Haut.**

- **OpenReview 5nqQlGWlsW** (TMLR, accepté ; soumis le 10 avril 2026, rattrapage) — *VQEL: Enabling Self-Play in Emergent Language Games via Agent Internal Vector Quantization*. Une quantification vectorielle interne à l'agent remplace REINFORCE et Gumbel-Softmax. L'agent fait d'abord du *self-play* sur son code discret interne, puis interagit.
  → Hypneum : **outil réutilisable** — c'est la « baseline VQ moderne » qui manque à N10-C selon la revue. Le self-play préalable est aussi l'analogue exact du bras « récepteur warm-start ». **Impact : Haut.**

- **arXiv:2609.23269** (20 sept., v2 le 12 oct.) — *Latent Telepathy: Multi-Robot Communication with Self-Supervised Perceptual Latents*, Wang, Zheng, Wu. Le message est le latent d'un encodeur JEPA gelé et partagé. Le protocole est « contrôlé en contenu » : bande passante, latence, topologie et récepteur sont fixés, seul le contenu du message varie. 99,7 % d'évitement contre des positions ou trajectoires au niveau du hasard ; l'image brute, 186 fois plus large, fait moins bien.
  → Hypneum : **dépasse** sur un point — un code *non appris* (latent gelé partagé) atteint l'optimum. Pour N10-C, c'est un bras de contrôle plus dur que le « message désapparié ». Leur protocole contrôlé en contenu est le gabarit à reprendre dans l'avenant. **Impact : Haut.**

- **OpenReview OAmBy25HHg** (ICLR 2027, 19 sept.) — *Emergence, Not Bandwidth*, Chauhan & Bera. **Mise à jour d'arXiv:2609.34373, déjà intégré** au bras `eng` de l'avenant N10-C. Le papier est maintenant en revue ICLR ; suivre les reviews (décembre) avant de s'appuyer sur les chiffres.

- **arXiv:2610.02545** (1ᵉʳ oct., NeurIPS 2026) — *Reward Inflation: A Healthy Stimulus for Reinforcement Learning*, Lee et al. Augmenter progressivement l'échelle des récompenses induit une pondération de récence. Les gradients restent soutenus quand la politique sature, ce qui supprime l'apparition de neurones dormants.
  → Hypneum : **pilote possible** pour la récompense d'équipe creuse de N10-C. C'est une intervention bon marché contre le collapse, à tester hors campagne gelée. **Impact : Moyen.**

- **arXiv:2608.18319** (18 août) — *SingularClip*, Kastner, De La Vega, Farahmand. La perte de plasticité vient de l'anisotropie croissante des valeurs singulières ; on les écrête périodiquement.
  → Hypneum : **outil**. Le spectre des poids du tronc est un diagnostic complémentaire à RUA. **Impact : Moyen.**

- **arXiv:2610.18727** (13 oct., v3 le 21/10) — *On the Monitorability of Natural Language Autoencoders: Identification vs Discrimination*, Denamganaï. Formalisé comme jeu référentiel : un code entraîné de façon générative *identifie* son référent dans 100 % des cas, mais ne le *discrimine* d'un rival différant d'une seule affirmation que dans 60,2 % des cas.
  → Hypneum : **méthode** — évaluer le canal N10-C contre des distracteurs appariés, pas seulement contre des messages d'autres épisodes. **Impact : Moyen.**

**Aussi vus :**
- arXiv:2609.31989 : jeu référentiel entre LLM gelés via optimisation de prompts, avec un code de position émergent.
- arXiv:2609.19504 : coordination entre instances isolées, plus faible entre architectures différentes.
- arXiv:2609.06025, accepté à Cognitive Science : émergence de la minimisation des dépendances chez des agents RNN.
- arXiv:2610.14449 : plateforme Jevolution, effet des signaux non résolu.
- Voir aussi arXiv:2609.32605 (R1) pour le protocole de communication par mélanges.

---

## R3 — Flots de Wasserstein, JKO, Sinkhorn, splitting

- **arXiv:2609.20998** (17 sept.) — *Dissipative Evolutions in Metric Spaces*, Conger, Hoffmann, Savaré. Inégalités variationnelles d'évolution pilotées par des bifonctions dissipatives. Le cas qui motive le papier est celui de N espèces couplées, chacune descendant sa propre énergie, alors que le système joint *n'est le flot d'aucune énergie unique*. Ils introduisent un schéma de mouvement variationnel (VMS) qui généralise JKO : chaque pas est un point-selle, et dans le cas multi-espèces un équilibre de Nash.
  → Hypneum : **dépasse** et **outil** pour kiki-flow. Le claim H18 (« Theorem 3.4 of Conger 2025 ⇒ contraction vers un Nash ») a été jugé non concluant dans la revue. Ce papier fournit le bon cadre : condition de dissipativité b(x,y)+b(y,x) ≤ η d², existence et stabilité du VMS. Reformuler H18 dans ce cadre et vérifier la condition η plutôt que d'ajuster λ̂. **Impact : Haut.**

- **OpenReview bCNgWCHoSn** (ICLR 2027, **desk rejected**, 19 sept.) — *Beyond Training Loss: Full-Space Certificates for Neural JKO and Wasserstein Evolution*. Une perte d'entraînement faible ne certifie pas un pas JKO inexact. Les auteurs donnent une norme de résidu auditée qui borne à la fois l'écart JKO non restreint et l'erreur Wasserstein d'un pas. Ils prouvent aussi une obstruction : impossible de certifier à partir d'un nombre fini de jets ponctuels.
  → Hypneum : **outil** pour la « certification de convergence » de kiki-flow, avec prudence : le desk reject relève sans doute du format, le fond n'a pas été évalué par des pairs. C'est la critique exacte de l'erratum ε = h : un JKO entropique « qui converge » ne certifie rien sans ce résidu. **Impact : Haut.**

- **arXiv:2610.02081** (1ᵉʳ oct., NeurIPS 2026 Position Track) — *Wasserstein Gradient Flows and Forward-Only Diffusion Are Not Enough for Multimodal Sampling*, McBride et al. Via JKO et le calcul d'Otto, le WGF canonique et la diffusion suramortie ont la même évolution de densité. Les garanties de convergence exponentielle cachent donc des temps de mélange exponentiels quand la cible est multimodale (petit trou spectral). L'annealing log-linéaire ne supprime pas cette échelle.
  → Hypneum : **infirme** toute lecture « contraction exponentielle ⇒ convergence pratique » dans kiki-flow (H7, H18). Rapporter un temps moyen de premier passage ou un trou spectral, pas seulement λ̂. **Impact : Haut.**

- **arXiv:2610.07602** (6 oct.) — *A Neural JKO Scheme for Hellinger-Kantorovich Gradient Flows via Monge-Growth Pairs*, Seo et al. JKO neuronal en géométrie Hellinger-Kantorovich (transport + création/destruction de masse) en **un seul pas variationnel**, avec condition suffisante de dissipation discrète et contrôle de suboptimalité par l'écart primal-dual.
  → Hypneum : **outil** pour NH-20 et H7 (REPLAY ≈ transport W₂, DOWNSCALE ≈ réaction Fisher-Rao). Le schéma joint *non scindé* sert de référence pour mesurer l'erreur de Lie O(τ) contre celle de Strang O(τ²). **Impact : Moyen-Haut.**

- **OpenReview OI3Z4Ao44f** (ICLR 2027, 17 sept.) — *Training as a flow of distributions*. Le WGF, discrétisé par JKO, sert d'appareil unique pour mesurer ensemble énergie, géométrie et dynamique d'apprentissage d'un réseau. Chaque mesure est validée sur des modèles analytiquement solubles.
  → Hypneum : **risque de scoop** sur « l'apprentissage, ou la spécialisation de modules, vu comme flot de gradient mesurable ». Leur discipline de validation sur des cas exacts rejoint celle de kiki-flow ; les citer et se distinguer par le multi-espèces. **Impact : Moyen.**

- **arXiv:2610.10257** (7 oct.) — *First-order Γ-expansion for entropic optimal transport with non-degenerate costs*, Nenna, Pass, Pegon, Tocquec. Développement du coût EOT jusqu'à o(ε) et principe de sélection entropique.
  → Hypneum : **outil** pour quantifier le biais ε de Sinkhorn (KF E1b, erratum ε réel = h = 0,05). **Impact : Moyen.**

- **arXiv:2610.36488** (27 oct.) — *Second-order Sinkhorn Geometry and √n-Inference*, Saidi, Gunsilius, Mena. Géométrie riemannienne formelle de la divergence de Sinkhorn : dérivée covariante, géodésiques, transport parallèle, et inférence en √n.
  → Hypneum : **outil** pour mettre de vrais intervalles de confiance sur les ajustements fondés sur Sinkhorn : les λ̂ de kiki-flow reposent sur 3 paires de graines. **Impact : Moyen.**

**Aussi vus :**
- OpenReview EbE2zyPxAc : Accelerated-JKO, convergence vers le flot accéléré d'information.
- OpenReview EIGTuB0ze9 : convergence de la descente miroir pour Gromov-Wasserstein entropique (outil R11).
- arXiv:2609.26647, Gonzalez & Mena : vitesses statistiques de l'EOT semi-discret.
- arXiv:2610.06343 : WGF contraint pour Langevin champ moyen.
- arXiv:2608.30693 : splitting primal-dual pour un JKO contraint (Poisson-Nernst-Planck).
- arXiv:2610.14867 : estimations d'erreur de Strang pour Allen-Cahn, utiles au rapprochement JKO/Cahn-Hilliard de l'axe « matière ».
- **Aucun papier ML de la fenêtre** ne traite le splitting Lie/Strang d'un flot WFR appliqué à des opérations d'apprentissage : NH-20 reste libre.

---

## R4 — Plasticité cross-modale, bouba/kiki, alignement de représentations

- **arXiv:2610.13476** (9 oct.) — *A Better Metric Will Not Save You: What You Compare Beats How You Compare It*, Khaous & Wisniewski. Sur l'organisation acoustique des voyelles (15 langues, 27 représentations), changer *quelles* catégories on compare, à nombre égal, déplace l'écart entre deux représentations de plus de deux fois l'effet mesuré. Changer leur *nombre* ne change rien. RSA, CKA et Procrustes sont également exposés.
  → Hypneum : **infirme** potentiellement la robustesse de B-3 et des comparaisons CKA de bouba_sens. L'ensemble des conditions (quels stimuli, quel regroupement) doit être gelé dans le préenregistrement, au même titre que le prétraitement (Bangachev, déjà noté). **Impact : Haut.**

- **OpenReview nZPqqSZc9t** (ICLR 2027, 12 sept.) — *Noise Ceilings for Representational Convergence*. Une analyse de plafond de bruit sépare la fiabilité inter-graines du consensus. Pour le mNN et le CKA linéaire, elle donne une factorisation exacte. La fiabilité explique 51,3 % de la tendance d'alignement langue-vision (Pythia), 50,7 % sur OLMo. Sur Pythia-14M, le CKA brut augmente de 89 % pendant que le consensus corrigé baisse de 10 %.
  → Hypneum : **outil réutilisable** — c'est exactement le « nul calibré apparié » demandé pour B-3 et pour la convergence relationnelle de DR-3. Corriger tout CKA par le plafond de fiabilité sur 5 graines. **Impact : Haut.**

- **OpenReview S7QxxP5hFE** (ICLR 2027) — *Centered Kernel Distance: Dimension-Free Error Bounds for Comparing Neural Representations*. Le CKA n'a pas d'estimateur sans biais ; sa contrepartie métrique, la CKD, en a un. L'erreur décroît en 1/M + 1/N (conditions, neurones), sans dépendance à la dimension.
  → Hypneum : **outil** — remplacer le CKA par la CKD dans les sondes 896-D de bouba_sens, où le binning MI s'effondrait (B-2). **Impact : Moyen-Haut.**

- **arXiv:2610.06226** (5 oct.) — *LeAVJEPA: A Minimalist Architecture for Audio-Visual Self-Supervised Learning*, Robson et al. Un ViT unique en fusion précoce, entraîné avec l'objectif LeJEPA/SIGReg. Une ablation contrôlée montre que le *dropout de modalité* est le mécanisme clé de l'alignement audio-visuel : la modalité manquante devient une autre vue du même événement.
  → Hypneum : **pilote possible** pour bouba_sens. Le dropout de modalité est une « lésion » douce pendant l'entraînement : comparer lésion précoce et tardive (fenêtre critique à la Kleinman) sur cette architecture minimale. **Impact : Moyen-Haut.**

- **bioRxiv 10.64898/2026.09.04.749307** (9 sept.) — *Early blindness shifts the feedforward laminar profile of hMT+/V5 from visual to auditory motion*, Barilari et al. En IRMf 7T laminaire (BOLD + VASO), les sons en mouvement évoquent chez l'aveugle précoce une réponse *feedforward* dans les couches moyennes de hMT+, analogue au mouvement visuel chez le voyant.
  → Hypneum : **confirme** côté neuro que la réorganisation précoce passe par la voie ascendante, pas seulement par le feedback. C'est une contrainte pour le modèle « cécité congénitale contre tardive », toujours un espace libre côté IA. **Impact : Moyen.**

- **arXiv:2610.36269** (26 oct.) — *Cross-modal Steering Vectors Exist Across Both Image and Text Generation*, Zeng et al. Des vecteurs de pilotage trouvés dans une modalité transfèrent sans réentraînement à l'autre dans des modèles multimodaux unifiés. Le test est causal, au-delà du RSA.
  → Hypneum : **outil** — un test causal de « code partagé entre modalités », plus fort qu'un CKA, pour l'axe émergence d'un code commun. **Impact : Moyen.**

- **arXiv:2610.14476** (10 oct.) — *Scale, Drivers, and Limits of Representational Alignment Across Large Language Models*, Wu & Khosla. Le RSA pondéré par voisinage (NW-RSA) montre un accord sur la géométrie grossière mais une divergence locale.
  → Hypneum : **confirme** la reformulation locale/globale de DR-3 et du test 6 ; outil NW-RSA. **Impact : Moyen.**

**Aussi vus :**
- Cognition 10.1016/j.cognition.2026.106739, Sidhu et al. : *Further predictors of iconicity*. **[métadonnées Crossref seules, résumé non lu]**
- J Exp Child Psychol 10.1016/j.jecp.2026.106662, Li et al. : effet bouba-kiki chez des enfants chinois d'âge préscolaire apprenant le pinyin. **[métadonnées seules]**
- arXiv:2610.16860 : chez l'enfant, CLIP s'aligne sur l'EEG avant les modèles vision seule.
- Aucun nouvel article ne mentionne ActionSense ou Studyforrest dans la fenêtre : le constat « absents de HF » de la revue tient toujours.
- Le chien bouba-kiki (Proc B), *Similar Choices* (arXiv:2609.36475, désormais aussi ICLR 2027 Submission 2FaHRono5T) et MacJEPA sont déjà couverts.

---

## R5 — Développemental, JEPA, spiking, predictive coding

- **OpenReview QFw0sg52VV** (TMLR, en revue, 11 sept.) — *Rethinking Developmental Curricula for Contrastive Visual Learning*. Dans un environnement virtuel, quatre facteurs « développementaux » (flou, éclairage, vitesse de l'avatar, complexité de scène) sont modulés séparément : aucun curriculum par facteur n'améliore la classification aval face à un corpus stable. Le résultat se réplique sur SAYCam.
  → Hypneum : **infirme** l'hypothèse implicite de baby-brain selon laquelle les stades sensoriels améliorent l'apprentissage. Cela renforce la recommandation de la veille du 23/10 : ajouter un bras chronologique de contrôle (corpus mélangé) aux 7 stades. **Impact : Haut.**

- **arXiv:2610.31842** (22 oct.) — *Scaling cross-situational word learning on children's naturalistic experiences*, Frank et al. Modèles contrastifs entraînés sur BabyView (2 441 h, 48 enfants). L'apprentissage mot-objet fonctionne, mais beaucoup mieux avec des représentations visuelles pré-entraînées sur Internet qu'avec la seule vidéo développementale.
  → Hypneum : **confirme** le goulot visuel déjà signalé (EgoBabyVLM). BabyView est le corpus de référence à évaluer pour baby-brain : il est plus gros que SAYCam et longitudinal. **Impact : Haut.**

- **OpenReview oVgyjkKkne** (ICLR 2027) — *Brain-Plausible Local Learning in SNNs: Training Hodgkin–Huxley Spiking Neural Networks with Predictive Coding*. Des neurones HH entraînés sans BPTT ni gradient de substitution : le predictive coding fournit des erreurs locales, et un proxy de taux (comptes de spikes par fenêtre) lui donne ses états continus.
  → Hypneum : **dépasse** Lee et al. 2024 sur le réalisme du neurone ; baseline SNN-PC pour nerve-wml. **Impact : Moyen.**

- **OpenReview 8rftN5ad3o** (ICLR 2027) — *Characterizing How JEPA Constructs Representations*. « Fermeture prédictive » : JEPA sélectionne ses traits selon leur prédictibilité *jointe*. Un trait imprévisible est conservé s'il aide à prédire les autres.
  → Hypneum : **cadre interprétatif** pour N11-A (bras H-JEPA) et pour savoir ce que baby-brain encode à chaque stade. **Impact : Moyen.**

- **arXiv:2609.32350** (26 sept.) — *Analog-Friendly Predictive Coding without Activation Derivatives*, Innocenti. Des divergences de Bregman adaptées à l'activation, avec une inférence par descente miroir : règles locales sans dérivée d'activation, performances comparables au PC standard.
  → Hypneum : **outil**, pont vers R6 (substrats analogiques/neuromorphiques). **Impact : Moyen.**

- **arXiv:2610.05997** (5 oct.) — *Infant simulator with an embodied caregiver*, Vaculinova & Hoffmann. Extension de MIMo (MuJoCo) avec un soignant articulé, qui génère toucher et vision égocentrique en dyade.
  → Hypneum : **outil** — c'est une source synthétique de flux multimodaux synchronisés (toucher + vision) qui comble en partie le trou « ActionSense absent ». À déclarer comme « synchronie synthétique ». **Impact : Moyen.**

**Aussi vus :**
- OpenReview h5CjsruK0p : Coherent PC.
- arXiv:2610.36412 : routage du crédit en PC temporel linéaire.
- arXiv:2610.36139 : SpatialPC, latence de crédit en Θ(N^{1/d}).
- arXiv:2610.35029 : les dialogues enfant-adulte synthétiques ne sont pas plausibles développementalement. Risque pour tout corpus synthétique de baby-brain.
- arXiv:2610.19683 : MemWM, mémoire associative dans un modèle du monde JEPA, pont R1/R5.
- arXiv:2610.31194 : Inside-JEPA, ancrage relationnel par dynamique inverse.
- La théorie de généralisation JEPA (arXiv:2606.27014) est déjà couverte.

---

## 5 papiers à lire en priorité cette semaine

1. **OpenReview 3gCeBuNNyT — When to Sleep.** C'est le design de NH-03 déjà réalisé sur des agents. Il faut le connaître avant de préenregistrer, pour s'en distinguer : substrats non-LLM, critère C+.
2. **arXiv:2610.14921 — dérive LoRA contre mémoire N-gram sur un MoE de 48 couches**, avec **OpenReview iSadNiakMc (Reset or Reuse)**. Ensemble, ils fixent la métrique d'oubli d'E1 et le contrôle « état de l'optimiseur » sans lequel un gain du rêve est ininterprétable.
3. **OpenReview Mj329S1TCg — Stagnant Neurons.** Diagnostic et remède au collapse du tronc de N10-C ; à intégrer dans l'avenant avec VQEL (5nqQlGWlsW) comme baseline VQ.
4. **arXiv:2609.20998 — Conger, Hoffmann & Savaré.** Le cadre correct pour les flots multi-espèces de kiki-flow, qui remplace la citation fragile « Thm 3.4 » de H18.
5. **arXiv:2610.13476 — A Better Metric Will Not Save You**, avec **OpenReview nZPqqSZc9t (Noise Ceilings)**. Ce qu'il faut geler et corriger avant toute nouvelle analyse CKA de bouba_sens (B-3) et de DR-3.

À lire juste après : arXiv:2609.32605 (Agliari et al., séparation dense de mélanges) et arXiv:2610.38437 (Stojnic, capacité avec motifs corrélés).

## Hypothèses Hypneum déjà faites ailleurs (risque de scoop)

| Hypothèse Hypneum | Travail concurrent | Recouvrement | Conseil |
|---|---|---|---|
| NH-03 / DR-0 : épisode défini par le budget, déclencheur endogène | When to Sleep (3gCeBuNNyT) | Fort sur agents LLM : la politique de déclenchement est la variable, un déclencheur par utilité est Pareto-optimal | Déposer vite l'avenant ; se distinguer par l'indépendance au substrat et C+ |
| H14 / `recombine` = séparation de mélanges | DLAM publié (Neural Netw) + version dense Agliari et al. (2609.32605) | Le groupe de Rome prouve la séparation et l'étend à une capacité linéaire, avec un protocole de communication | Citer, et positionner GENIAL comme *axiomatisation* plutôt que comme modèle |
| Spécialisation de modules comme flot de gradient (kiki-flow) | Training as a flow of distributions (OI3Z4Ao44f) ; Dynamic MoE theory (YK3D3sQJNd) | Mesure de l'apprentissage par JKO ; spécialisation d'experts par phases | Mettre en avant le multi-espèces (cadre Conger et al.) |
| N10-C : canal discret émergent entre agents | Latent Telepathy (2609.23269) ; Chauhan & Bera (ICLR 2027) | Un code non appris atteint l'optimum ; protocole contrôlé en contenu | Ajouter le bras « latent gelé partagé » |
| baby-brain : stades développementaux bénéfiques | Rethinking Developmental Curricula (QFw0sg52VV) ; Frank et al. (2610.31842) | Résultats négatifs ou nuancés déjà publiés | Préenregistrer une prédiction d'équivalence, ou un bénéfice ciblé hors classification |
| « Sommeil » pour LLM / SNN | LM Need Sleep (4BIMcGrZjq), Sleep-Inspired SNN CL (MQD4SODT9P) | Le terme est saturé | Éviter « sleep » dans les titres ; parler de consolidation axiomatisée |
| bouba_sens : lésion de modalité | LeAVJEPA (dropout de modalité = mécanisme d'alignement) | Partiel | Utiliser comme substrat de pilote plutôt que comme concurrent |

Restent libres dans la fenêtre : splitting Lie/Strang d'un flot WFR appliqué à des opérations d'apprentissage (NH-20) ; cécité congénitale contre tardive dans un modèle artificiel ; critère de conformité exécutable inter-substrats.

## Outils à adopter

- Dérive relative par tâche, mesurée depuis le checkpoint d'apprentissage (2610.14921) → E1.
- Bras « reset de l'optimiseur » (iSadNiakMc) → E1.
- RUA/KNIFE (Mj329S1TCg), SingularClip (2608.18319), reward inflation (2610.02545) → N10-C.
- VQEL (5nqQlGWlsW) → baseline VQ de N10-C.
- Certificat de résidu JKO (bCNgWCHoSn), Γ-expansion EOT (2610.10257), inférence √n Sinkhorn (2610.36488) → kiki-flow.
- Plafond de bruit (nZPqqSZc9t), CKD (S7QxxP5hFE), NW-RSA (2610.14476) → B-3, DR-3.
- Capacité RDT avec motifs corrélés (2610.38437), DMFT par blocs (2610.40060) → NH-01/02.
- MIMo + soignant (2610.05997), BabyView (2610.31842) → baby-brain.

## Non vérifié / inaccessible

- **Semantic Scholar** : HTTP 429 à chaque essai (pas de clé) ; `arXiv:2610.38437` renvoie « not found », car le papier n'est pas encore indexé. Source non utilisée.
- **OpenReview** : l'endpoint `notes?id=` répond 403 (« ChallengeRequiredError »). Les identifiants OpenReview ont donc été vérifiés par l'endpoint `notes/search`, qui renvoie id, venue, date et abstract (lu jusqu'à 1 000 caractères). Les PDF n'ont pas été lus. NeurIPS 2026 : seules les notes indexées par la recherche (workshops) sont apparues. La liste des papiers acceptés au track principal n'a pas été balayée ; les acceptations NeurIPS citées viennent des commentaires arXiv.
- **arXiv** : 429 transitoires, résolus par backoff. Aucune requête perdue au final.
- **Journaux** (Nature Neuroscience, Neuron, TMLR) : couverts seulement via PubMed et la recherche OpenReview (TMLR). Aucun article Nat Neurosci ou Neuron pertinent n'est remonté dans la fenêtre ; ce n'est pas une preuve d'absence.
- Sidhu et al. (Cognition) et Li et al. (JECP) : Crossref ne fournit pas de résumé ; pertinence jugée sur le titre seul.
- bioRxiv : interrogé via Europe PMC (préprints), pas via `api.biorxiv.org`.
