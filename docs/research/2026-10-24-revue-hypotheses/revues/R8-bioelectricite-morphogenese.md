# R8 — Bioélectricité, morphogenèse, cognition basale : évaluation d'axe pour Hypneum Lab

2026-10-24 · évaluation pour le PI (Clément Saillant) · consigne « sortir du LLM » · statut : rapport de recherche, aucun dépôt modifié, aucun calcul lancé.

**Verdict en une phrase.** La bioélectricité/morphogenèse fournit à Hypneum **trois objets formels réellement testables** (attracteurs et bassins de régénération ; mémoire de motif *cryptique* à état caché ; consensus local→global sous protocoles hétérogènes) et **un substrat quasi gratuit** (automates cellulaires neuronaux, NCA), mais la couche conceptuelle « cognition partout / cône cognitif » reste une **analogie non opérationnalisée** à ne pas importer telle quelle. Recommandation : **ouvrir sous conditions** (§10), en « R8-lite » : un substrat NCA branché sur les harness existants, trois pilotes préenregistrés, critères d'arrêt explicites.

---

## 1. Cadrage — trois lectures du même corpus

| Lecture | Ce qu'on importe | Pour quel dépôt | Statut |
|---|---|---|---|
| **A. Analogie** | vocabulaire : « mémoire de motif », « homéostasie anatomique = but », « cône cognitif », « cognition sans neurones » | tous (narratif, related work) | Utile pour le cadrage de Paper 1/2, **dangereux comme fondement** : aucune de ces notions n'a de définition opératoire partagée (TAME liste la quantification du cône comme question ouverte ; Levin & Watson 2026 et Chis-Ciure & Levin 2025 reconnaissent les « cognition wars »). |
| **B. Modèle formel** | (i) régénération = retour vers un *ensemble* attracteur, mesurable par Lyapunov/bassin/temps de retour ; (ii) mémoire cryptique = état caché révélé par re-lésion (Durant 2017 → Blattner 2026) ; (iii) consensus local→global sous « langues » hétérogènes (Singh 2026) ; (iv) goulot génomique = compression de l'init par hyper-réseau (Zador) ; (v) criticité auto-organisée sous conservation (Zhang et al. 2026) ; (vi) trois codes instructifs direct/indirect/déclencheur (Hansali et al. 2025) | GENIAL (i, ii, vi), nerve-wml (iii, v), baby-brain (iv), BSK (iv) | **Solide** : chaque item a un modèle quantitatif publié et un protocole réplicable sur M1. |
| **C. Substrat** | NCA (Growing/Regenerating NCA), Lenia/Flow-Lenia, BETSE (électrodiffusion 2D), bio-hybrides (CL1, FinalSpark) | nerve-wml (5ᵉ substrat WML conforme), dream-of-kiki (substrat de rêve non-LLM), bouba_sens (lésion/fenêtre critique) | NCA/Lenia **accessibles immédiatement** (cax, PyTorch MPS) ; BETSE maintenu mollement (dernier commit 2025-04) ; bio-hybrides déjà couverts par le plan BioWML de nerve-wml (adaptateurs CL1/FinalSpark env-gated), coût non public. |

Réponse courte aux trois questions directrices : **(a)** oui pour GENIAL, nerve-wml, baby-brain (modèles B-i, B-ii, B-iii, B-iv) ; pour BSK le pont est un programme développemental (NDP) plutôt que la bioélectricité stricto sensu. **(b)** NCA via `cax` (JAX) ou PyTorch MPS ; BETSE pour la fidélité biophysique ; pas de port MLX existant. **(c)** risque principal = analogie creuse et confusion « cible stockée dans les poids » (NCA) vs « cible stockée dans l'état » (planaire) ; critères d'arrêt en §7.

Ce que le lab a **déjà** : nerve-wml possède un `BioFieldWML` (SNN-PC, edge +0,14) et un plan BioWML (CL1/FinalSpark) ; dream-of-kiki a une spec de stratification biophysique (5 strates, non-révision de DR-0..DR-4). **Aucun des deux ne couvre la bioélectricité non-neurale, les NCA ou la morphogenèse** : R8 est orthogonal, pas redondant.

---

## 2. État de l'art (références vérifiées ; ✱ = source faible, voir §7)

Relation : **appuie / contredit / dépasse / neutre** un claim Hypneum ; dépôt visé entre crochets. Dates = première version (arXiv) ou publication.

### 2.1 Bioélectricité et mémoire de motif (biologie + modèles)

| Réf | Date | Résultat | Lecture | Relation à Hypneum |
|---|---|---|---|---|
| Durant, Morokuma, Fields, … Levin, *Biophys. J.*, DOI 10.1016/j.bpj.2017.04.011 | 2017 | Perturbation bioélectrique brève → ratio constant 2-têtes/normal ; les régénérés *normaux* re-coupés redonnent le même ratio : **phénotype cryptique** stocké dans le motif de potentiel de repos, réversible | B | **Dépasse** : modèle d'une mémoire invisible au test de performance, révélée par re-lésion [dream-of-kiki, bouba_sens] |
| Blattner, bioRxiv 10.64898/2026.04.01.715890 ✱ (preprint, auteur unique) | 2026-04 | Modèle géométrique « Tangential Action Spaces » : trajectoire visible + « lift » caché ; modèle à seuil latent ajusté sur 143/573 (8-OH) et 36/155 (re-cut) ; prédit hors-échantillon ≈15 % [8–22 %] pour nigéricine/monensine | B | **Appuie** une formalisation à deux seuils de la mémoire cryptique ; directement transposable à un test de « consolidation cryptique » [dream-of-kiki] |
| Hansali, Pio-Lopez, Lapalme, Levin, *IEEE TMBMC*, DOI 10.1109/TMBMC.2025.3575233 | 2025-09 | **NCA évolués** sous 3 codes bioélectriques (direct, indirect, déclencheur binaire) : tous atteignent la cible ; direct → robuste aux inits ; indirect → robuste aux perturbations du code ; SSRI simulés dégradent la minimisation d'erreur, bistabilité ; validé in vivo (planaires) | B/C | **Dépasse** : taxonomie testable de « comment une cible est encodée » ; analogue à P_min/P_equ/P_max [dream-of-kiki] |
| Manicka & Levin, *Sci. Rep.* 9:18612 (arXiv 1912.04246) | 2019 | Réseaux bioélectriques non-neuraux généralisés comme connexionnisme : capables de calcul (tâches de classification) | B | **Neutre→appuie** DR-3 (substrat non-neural conforme possible) [nerve-wml] |
| Manicka & Levin, *Cell Rep. Phys. Sci.*, DOI 10.1016/j.xcrp.2025.102865 (résumé non lu, 403) | 2025-09 | Base bioélectrique « médiée par champ » du prépatterning | B | **Neutre** (à lire) [dream-of-kiki strate 1] |
| Cervera, Levin, Mafe, *Sci. Rep.* 16:1996, DOI 10.1038/s41598-025-31696-6 | 2025-12 | Modèle top-down Vmem↔transcription : 3 prédictions (transitions d'états d'expression par Vmem ; cellules dépolarisées contrôlent moins bien ; effets communautaires) ; une cellule « compte » ses voisines via le potentiel | B | **Neutre** ; motif « comptage de voisins par couplage » utile pour un canal lent [nerve-wml] |
| McMillen & Levin, *Dev. Biol.* 539, DOI 10.1016/j.ydbio.2026.08.001 | 2026-08 | FLIM > 17 h : composante bioélectrique **lente (heures)** + composantes minutes/secondes ; dynamiques multicellulaires distinctes du Ca²⁺ | A/B | **Appuie** l'idée de multiplexage multi-échelle (θ/γ) hors neurones [nerve-wml GTM] |
| Goykadosh et al., arXiv 2607.21442 | 2026-07 | Couplage **local** suffit pour la signalisation Ca²⁺ longue distance (sans diffusion IP3 via jonctions gap) | B | **Contredit** l'analogie « jonction gap = canal de message » comme nécessité ; le local suffit [nerve-wml] |
| Yue et al., arXiv 2604.14200 | 2026-04 | Filtre « jonctions gap rétiniennes » devant un DNN : robustesse adversariale accrue, géométrie représentationnelle déformée | B | **Neutre** ; exemple d'un couplage continu comme prétraitement [bouba_sens] |
| Agam & Braun, arXiv 2603.01851 | 2026-03 | Cycles rupture-réparation dans Hydra en régénération ; queue des distributions contrôlée par l'efficacité de réparation Ca²⁺-dépendante | B | **Neutre** ; statistique d'événements de réparation réutilisable comme métrique [dream-of-kiki] |
| Pai, Traer, Sperry, Zeng, Levin, bioRxiv 10.64898/2026.03.17.712168 ✱ | 2026-03 | Xenobots : exposition brève (extrait/ATP) → changements comportementaux **stimulus-spécifiques, persistants**, signatures transcriptionnelles et Ca²⁺ | A | **Neutre** : « mémoire sans neurones » phénoménologique, pas de chiffres dans le résumé |
| Fotowat et al., *Adv. Sci.*, DOI 10.1002/advs.202508967 | 2026-02 | « Neurobots » : précurseurs neuraux dans des biobots Xenopus → réseaux auto-organisés actifs (Ca²⁺), comportements plus complexes | A/C | **Neutre** (wet-lab hors portée) |
| Gumuskaya et al., *Adv. Sci.*, DOI 10.1002/advs.202409330 | 2025-06 | Cycle de vie des Anthrobots ; 3 destins ; rajeunissement épigénétique | A | **Neutre** |
| Pai et al., *Commun. Biol.* 8:646, DOI 10.1038/s42003-025-08086-9 | 2025-04 | Transcriptomique des Xenobots basaux : changements d'expression sans édition génomique | A | **Neutre** |

### 2.2 Cadres théoriques (Levin et al.) et critiques

| Réf | Date | Résultat | Lecture | Relation |
|---|---|---|---|---|
| Levin, TAME, *Front. Syst. Neurosci.*, DOI 10.3389/fnsys.2022.768201 (arXiv 2201.10346) | 2021/22 | Cadre continu de l'agentivité ; « cône cognitif » ; jonctions gap = syncytium partiel effaçant l'origine des signaux ; **quantification du cône listée comme ouverte** | A | **Neutre** : inspirant, non opératoire |
| Levin, *Anim. Cogn.*, DOI 10.1007/s10071-023-01780-3 | 2023 | Réseaux bioélectriques = « colle cognitive » du passage physiologie→esprit | A | **Neutre** |
| Levin & Resnik, *Biol. Theory*, DOI 10.1007/s13752-025-00523-6 (+ Part Two) | 2026 | Révision de la téléologie ; approche « diverse intelligence » de la finalité | A | **Neutre** |
| Levin & Watson, *Semin. Cell Dev. Biol.*, DOI 10.1016/j.semcdb.2026.103668 | 2026-02 | Continuum de compétences cognitives sans seuil ; la biologie cellulaire doit naturaliser la cognition | A | **Neutre** ; reconnaît le débat |
| Chis-Ciure & Levin, *Synthese* 206:257, DOI 10.1007/s11229-025-05319-6 | 2025-11 | **Métrique** : efficacité de recherche = log₁₀(coût marche aléatoire / coût agent) ; chimiotaxie amiboïde et régénération planaire : 200× à 10²¹× | B | **Dépasse** : seule opérationnalisation chiffrée du programme ; réutilisable comme métrique de consolidation (H13) |
| Pezzulo & Levin, arXiv 2602.08079 (v3 2026-10-21) | 2026 | 5 principes « life-inspired » (autonomie multi-échelle, croissance par auto-assemblage, reconstruction continue, contraintes incarnées, signalisation pervasive) ; cône cognitif comme continuum | A | **Appuie** le positionnement « hors LLM » de Hypneum, sans test |
| Hartl, Pio-Lopez, Fields, Levin, arXiv 2601.14096 (*Phys. Life Rev.* 2026) | 2026-01 | Cognition = (1) remappage d'espaces d'embedding + (2) navigation par minimisation d'erreur ; invariant indépendant du substrat (NCA, diffusion, transformers) | A/B | **Appuie** DR-3 reformulé (structure relationnelle) ; **concurrent conceptuel** direct de GENIAL à citer |
| Levin & Lyons, *Phil. Trans. A* 384(2320), DOI 10.1098/rsta.2024.0528 | 2026-05 | Le système de prix comme « colle cognitive » générique ; toute colle doit résoudre le même problème de compatibilité des plans | A | **Neutre** ; thème « world models » |
| Sacco, Sakthivadivel, Levin, *Phil. Trans. A*, DOI 10.1098/rsta.2025.0011 (arXiv 2501.13188) | 2026 | Contraintes **topologiques** sur l'auto-organisation de systèmes à interactions locales sur graphes planaires (ordre à longue portée) | B | **Appuie** : borne formelle sur ce qu'un protocole purement local peut synchroniser [nerve-wml] |
| Zhang, Goldstein, Levin, arXiv 2401.05375 (*Adaptive Behavior*) | 2023/25 | Algorithmes de tri comme morphogenèse : gratification différée, clustering d'algotypes, tolérance aux cellules « gelées » | A/B | **Neutre** : modèle minimal de « compétence inattendue », bon contrôle négatif pour H9 |
| Newman, arXiv 2310.13910 | 2023 | **Critique** : la morphogenèse dépend de propriétés matérielles non computationnelles ; modèles multi-attracteurs mal appliqués aux propriétés globales du développement | — | **Contredit** la lecture B-i si elle est prise au pied de la lettre ; à citer dans Threats |
| Solé, Seoane, Pla-Mauri, Bennett, … arXiv 2601.12837 | 2026-01 | « Espaces de cognition » : dimensions organisationnelles/informationnelles pour comparer cellules, cerveaux, IA | A | **Neutre** (cadrage) |
| Fields & Levin, Preprints 10.20944/preprints202607.0507.v1 ✱ (non lu, 403) | 2026-07 | « Cognitive offloading is a cognitive universal » | A | **Inconnu** |

### 2.3 Laboratoire Levin × apprentissage machine (le pont le plus direct)

| Réf | Date | Résultat | Lecture | Relation |
|---|---|---|---|---|
| Etcheverry, Moulin-Frier, Oudeyer, Levin, *eLife* 13:RP92683 | 2025-01 | Exploration par curiosité (IMGEP) de 30 modèles de GRN (432 systèmes) : versatilité humain 0,238 / plante 0,117 / aléatoire < 0,026 ; 1 167 oscillateurs trouvés vs 42 (aléatoire) vs 0 (gradient) | B/C | **Appuie** l'usage d'IMGEP comme sonde de compétence d'un substrat [baby-brain curiosité] |
| Hartl, Montero, Barylli, Risi, Levin, arXiv 2609.29755 | 2026-09 | **LoRA sur NCA** : échelle H/V = adaptateurs rang 1 ; combinaisons linéaires, transfert zero-shot entre phénotypes ; ~25 000 adaptateurs → directions latentes (échelle, style, fission) | B/C | **Dépasse** : « poignées régulatrices » bas-rang hors LLM ; pont inattendu vers la pile LoRA de micro-kiki |
| Hazan, Zhang, Hartl, Levin, arXiv 2604.08749 | 2026-04 | LottaLoRA : backbone aléatoire gelé + LoRA → 96–100 % de la perf. complète en entraînant 0,5–40 % des paramètres (9 benchmarks, jusqu'à 900M) | B | **Neutre pour R8**, pertinent micro-kiki (signal tâche = sous-espace minuscule) |
| Zhang & Levin, arXiv 2607.18433 | 2026-07 | « Nouveauté apprenable » : estimateur différentiable (réservoir) ; classe les ECA (règle 110 en tête), pousse un NCA vers des solitons, organise MNIST sans étiquette, récompense intrinsèque RL (9/10 envs) | B | **Dépasse** : objectif unique non-LLM pour émergence/abstraction/exploration ; candidat pour la « curiosité » de baby-brain (LP négatif) |
| Samanta, Hazan, Levin, arXiv 2605.30109 | 2026-05 | Proie-prédateur : 220 000 combinaisons ; habituation, sensibilisation, apprentissage numérique discret du temps de récupération ; **asymétrie 90,6 %** (sensibilisation du temps + habituation d'amplitude) | B | **Appuie** H9 : apprentissage sans mémoire explicite, purement dynamique |
| Pigozzi & Levin, arXiv 2605.06746 | 2026-05 | Émergence causale prédit la récompense finale d'agents RL | B | **Neutre** |
| Zhang & Levin, arXiv 2605.16321 | 2026-05 | « Language game » : système dynamique gelé comme cœur d'une politique RL, interfaces linéaires apprises ; le jeu = lingua franca entre architectures | B | **Appuie** l'esprit nerve-wml (protocole partagé entre substrats irréconciliables) ; interface ≠ neuroletters |
| Le, Blackiston, Levin, Bongard, arXiv 2610.02247 | 2026-09 | Interventions conditionnées par prompt, apprises hors-ligne, sur cellules/organoïdes/biobots | A | **Neutre** (LLM-ward) |
| Cvjetko, Hartl, Levin, Moulin-Frier, Oudeyer, arXiv 2608.26116 (ALIFE 2026) | 2026 | CARL : RL autotélique en boucle fermée intervenant localement dans Lenia | C | **Neutre→appuie** : outillage pour piloter un substrat auto-organisé |
| Cool, Hartl, Levin, Petti, arXiv 2605.30708 (ALIFE 2026) | 2026-05 | Créatures Lenia évitent les zones sans information sensorielle (« agnosiophobie ») | A | **Neutre** |
| Pio-Lopez, Hartl, Levin, arXiv 2604.01932 (ALIFE 2026) | 2026-04 | BraiNCA : NCA + attention + connexions longue portée → plus robuste, apprend plus vite (morphogenèse, contrôle moteur) | C | **Appuie** : topologie non-locale apprise ≈ routeur épars de nerve-wml |
| Hartl, Levin, Pio-Lopez, arXiv 2509.11131 (*Phys. Life Rev.* 56, 2026) | 2025-09 | Revue NCA pour la biologie : architecture de compétence multi-échelle, régénération, vieillissement, contrôle robotique | A/C | **Appuie** le choix du substrat |

### 2.4 Dynamique des NCA (ce qui rend B-i mesurable)

| Réf | Date | Résultat | Lecture | Relation |
|---|---|---|---|---|
| Mordvintsev, Randazzo, Niklasson, Levin, *Distill*, DOI 10.23915/distill.00023 | 2020 | Growing/persisting/regenerating NCA ; régénération après lésion | C | Base du substrat |
| Kvalsund & Stovold, arXiv 2604.12720 | 2026-04 | Spectres de Lyapunov/Fourier du gecko NCA : attracteurs **oscillatoires, périodiques, quasi-périodiques** (pas des points fixes), apparus tôt ; grandes perturbations → « mode secondaire » | B | **Contredit** toute formulation « retour au point fixe » ; impose « ensemble attracteur » (cohérent avec DR-3 relationnel) |
| Stovold, Kvalsund, Ludwig, Sharma, Mordvintsev, arXiv 2604.10639 (ALIFE 2026) | 2026-04 | Variété comportementale simple au niveau macro (état global), complexe au niveau cellule | B | **Appuie** une sonde relationnelle globale (piste 3 de la veille) |
| Masumori, Sato, Ikegami, arXiv 2607.12403 | 2026-07 | Fluctuations internes **structurées** et fonctionnelles pour la réparation ; lésion → déviation globale en espace latent puis re-convergence ; transfert d'entropie vers le site ; synergie→redondance pendant la réparation | B | **Appuie** H1 ; fournit les métriques (TE, PID) |
| Sato, Masumori, Ikegami, arXiv 2607.15726 | 2026-07 | Croissance = **réorganisation d'états transitoires** (non monotone) ; canaux cachés modulaires ; types cellulaires discrets extraits d'un continuum | B | **Appuie** H6 (stades endogènes) [baby-brain] |
| Zuo, Shi, Liu, arXiv 2609.36797 | 2026-09 | Asynchrone 10/10 vs synchrone 3/10 ; 8/10 modèles « grow » dérivent à 4 096 pas, « persist/regenerate » tiennent ; la récupération de dommage sépare persist de regenerate | B | **Appuie** : la robustesse n'est pas une propriété unique → découper les tests |
| Stovold, arXiv 2508.06389 (ALIFE 2025) | 2025-08 | Canal « identité » → stabilité des organismes NCA voisins | C | Outillage |
| Singh, arXiv 2606.21202 ✱ (auteur unique) | 2026-06 | Densité-classification avec sous-populations parlant des « langues » à distance réglable : la distance ralentit le consensus ; un collectif entraîné sous protocoles **divers** est robuste au mismatch, un homogène non ; lecture Ising (défaut de frontière) | B | **Dépasse** : modèle direct des transducteurs inter-codebooks et de l'hétérogénéité des pools [nerve-wml] |
| Zhang, Guichard, Pontes-Filho, Nichele, arXiv 2606.23115 (ALIFE 2026) | 2026-06 | **Conservation de masse** = biais inductif vers la criticité (lois de puissance d'avalanches), 1,27× plus rapide, perf. égale ; meilleure criticité ↔ meilleur contrôle temporel | B | **Appuie** la strate 5 (criticité) [nerve-wml] |
| Pontes-Filho, Nichele, Lepperød, arXiv 2508.02218 (ALIFE 2025) | 2025-08 | NCA évolués vers la criticité comme réservoirs | B | **Appuie** |
| Pajouheshgar, Bhardwaj, Selub, Lake, *PRL* 136:037102 (arXiv 2508.15726) | 2026-01 | Paysage des **mémoires hors équilibre** 2D au-delà de Toom : correction d'erreurs qualitativement nouvelle, phases stabilisées par fluctuations, information préservée seulement en présence de bruit | B | **Dépasse** : théorie physique de « garder une information malgré des perturbations arbitraires » = cadre rigoureux pour la mémoire de motif |
| Guichard & Nichele, arXiv 2609.21870 ; 2610.08479 | 2026-09/10 | Canaux cachés généraux, transfert enseignant→élève ; MetaLearnNCA few-shot sans gradient à l'inférence | C | **Neutre** |
| Etcheverry, Miotti, … arXiv 2609.36126 | 2026-09 | NCA locaux/asynchrones résolvent des tâches de raisonnement visuel multi-étapes | C | **Neutre** (montre la portée) |
| Jain, Reimers, Nichele, arXiv 2609.19902 ; Berdica et al. 2604.11248 | 2026 | NCA auto-réplicants (diversité géno/phénotypique) ; PBT-NCA ouvert | C | **Neutre** |
| Barylli, Béna, Mordvintsev, Nisioti, Risi, arXiv 2608.02606 | 2026 | Circuits numériques auto-organisés (LUT configurées par Transformer masqué) : réorganisation autour du dommage | C | **Neutre** |
| Lemke et al., arXiv 2609.24595 ; Spitznagel & Keuper 2604.24990 | 2026 | Revues/état de l'art NCA + implémentation de référence | C | Outillage |
| Lee, Han, Kumar, Agrawal, arXiv 2603.10055 ; Mittal et al. 2608.02050 | 2026 | NCA pour pré-pré-entraîner des LLM ; TextNCA (60,3 PPL vs 52,8 Transformer-6L) | — | **Hors cible** (direction LLM) ; à citer seulement pour délimiter |

### 2.5 Programmes développementaux, encodages, croissance

| Réf | Date | Résultat | Lecture | Relation |
|---|---|---|---|---|
| Koulakov, Shuvaev, Lachi, Zador (ordre bioRxiv v2), *PNAS*, DOI 10.1073/pnas.2409160121 (bioRxiv 2021.03.16.435261) | 2024 | **Goulot génomique** : compression de plusieurs ordres de grandeur de la matrice de poids par un g-réseau ; perf. pré-entraînement proche du réseau complet ; régularisation, transfert (problèmes complexes seulement) | B | **Dépasse** : encodage développemental formel pour l'init néonatale [baby-brain, BSK] |
| Hamidi, Khajehabdollahi, Wu, Giannakakis, arXiv 2606.28380 | 2026-06 | Hyper-réseau + méta-apprentissage par curriculum → réservoir modulaire épars, tâches temporelles difficiles avec entraînement minimal | B | **Appuie** H5 (curriculum × goulot) |
| Palm, Najarro, Risi, arXiv 2011.06811 (JMLR 148, préenregistré) | 2020 | Test préenregistré du goulot génomique sur règles hebbiennes : moins de règles = meilleure généralisation | B | **Appuie** ; exemple de préenregistrement dans ce champ |
| Najarro, Sudhakaran, Risi, arXiv 2307.08197 | 2023 | NDP : croissance d'un réseau depuis une cellule par communication locale (évolution, RL, supervisé) | C | **Appuie** H7 [BSK neurogenèse] |
| Plantec et al., arXiv 2406.09787 ; Nisioti et al. 2405.08510 ; Najarro et al. HyperNCA 2204.11674 | 2024/22 | LNDP (plasticité structurelle + synaptique à vie) ; diversité neuronale + inhibition latérale évitent les politiques dégénérées ; HyperNCA | C | **Appuie** H7 |
| Montero et al., arXiv 2406.09020 (ALIFE 2024) | 2024 | Méta-apprentissage d'un encodage développemental évolvable | B | **Neutre** |
| Saad Saoud, arXiv 2609.17606 ; 2609.17300 ✱ (auteur unique) | 2026-09 | Encodage développemental : + diversité phénotypique mais − localité et − robustesse à la recombinaison (34 paramètres appariés) ; « Machine Zygote » hérédité biparentale | B | **Contredit** l'idée que l'encodage développemental est gratuitement bénéfique : compromis à mesurer |
| Jia & Zhou, arXiv 2512.12713 ; Kong & Sutton 2608.01475 | 2025/26 | Croissance par plasticité structurelle locale ; réseaux croissants/élastiques en apprentissage continu en ligne (perte de plasticité) | C | **Appuie** H7 ; baseline pour BSK |
| Glybovets & Medvid, arXiv 2507.13785 (*Cybern. Syst. Anal.* 62(2), 2026) | 2025/26 | MorphoNAS : réaction-diffusion + GRN pour faire croître des architectures | C | **Neutre** |
| Sharma, arXiv 2607.21630 ✱ (3 p., atelier GECCO) | 2026-07 | Évolution sans fitness sous contraintes : plafond de complexité ; **trois expériences falsifiables** | B | **Neutre** ; modèle de rédaction d'hypothèses |

### 2.6 Lenia, cognition basale minimale, circuits synthétiques

| Réf | Date | Résultat | Lecture | Relation |
|---|---|---|---|---|
| Plantec et al., *Artificial Life* 31(2):228–248 (arXiv 2506.08569) | 2025 | Flow-Lenia : conservation de masse + localisation des paramètres → dynamique évolutive émergente | C | Substrat |
| Michel et al., arXiv 2505.15998 (ALIFE 2025) ; Faldor & Cully, arXiv 2410.02651 (ICLR 2025 oral) | 2025 | IMGEP sur Flow-Lenia (dynamiques d'écosystème) ; **cax** bibliothèque JAX | C | Outillage |
| Papadopoulos & Guichard, arXiv 2507.12306 ; Hudcová et al. 2601.01932 ; Gupta 2609.01348 ✱ ; Akhtyrchenko et al. 2606.17091 | 2025/26 | MaCE (conservation attachable) ; classification de l'espace des paramètres Lenia ; logique par collision dans Lenia ; divergence de chemin multi-échelle | C/B | **Neutre** |
| Bruna & Gyllingberg, arXiv 2505.02114 ; Gyllingberg, Tian, Sumpter 2402.02520 | 2025/24 | Réservoir « basal » hexagonal à régulation allostatique : **anticipation** d'un signal périodique sans neurones ; modèle minimal oscillatoire de cognition basale | B | **Appuie** H9 |
| Pla-Mauri et al., *ACS Synth. Biol.* 15(2):716, PMID 41666326 (détails = extraits de recherche ✱) | 2026-02 | Circuits génétiques minimaux : habituation, sensibilisation, apprentissage massé/espacé dans une cellule | B | **Appuie** H9 (contrôle positif biologique) |
| Pietak & Levin, *Front. Bioeng. Biotechnol.*, DOI 10.3389/fbioe.2016.00055 | 2016 | BETSE : simulateur multiphysique 2D (électrodiffusion, canaux voltage-dépendants, jonctions gap, GRN) | C | Substrat biophysique |
| Hora de Carvalho, arXiv 2503.13489 ✱ (auteur unique) | 2025 | Proposition de contrôle IA de la signalisation bioélectrique | A | **Faible** |

---

## 3. Ponts formels : solides vs faibles

### 3.1 Solides (modèle quantitatif + protocole réplicable)

1. **Régénération = retour vers un *ensemble* attracteur, à budget mesurable.** Masumori 2026 (déviation latente globale → re-convergence, flux d'information vers la lésion), Kvalsund & Stovold 2026 (attracteurs quasi-périodiques, mode secondaire au-delà d'une perturbation critique), Zuo 2026 (persist ≠ regenerate). → GENIAL : la consolidation peut être lue comme retour vers l'ensemble attracteur de la **structure relationnelle** (DR-3 reformulé), et DR-0 comme borne sur le temps/l'énergie de retour. Condition : abandonner « attracteur ponctuel » dès l'énoncé.
2. **Mémoire cryptique à état caché.** Durant 2017 (ratio constant sur re-coupe, histologie normale) + Blattner 2026 (modèle à deux seuils, prédiction hors-échantillon ≈15 %). → test de « consolidation cryptique » : performance identique mais réponse à la re-lésion différente. C'est le pont le plus original pour Paper 2 et pour bouba_sens (§5.5 rétracté : une re-lésion révèle ce que la perf. ne montre pas).
3. **Consensus local→global sous protocoles hétérogènes.** Singh 2026 (distance linguistique, robustesse par diversité d'entraînement, lecture Ising) + Sacco et al. 2026 (contraintes topologiques sur l'ordre longue portée par interactions locales). → nerve-wml : les transducteurs inter-codebooks et l'hétérogénéité des pools (MLP/LIF/TRF) ont un modèle minimal et une prédiction (robustesse ⇔ diversité à l'entraînement).
4. **Goulot génomique comme encodage développemental.** Shuvaev 2024, Hamidi 2026, Palm 2020 (préenregistré). → baby-brain : l'init néonatale comme décompression ; BSK : neurogenèse par programme (NDP/LNDP) plutôt que net2net. Contre-poids : Saad Saoud 2026 (perte de localité/robustesse à la recombinaison).
5. **Criticité auto-organisée sous conservation.** Zhang et al. 2026, Pontes-Filho 2025. → strate 5 de nerve-wml (piste 9 de la veille : sondes de branchement + Lyapunov) gagne un biais inductif testable (conservation de masse).
6. **Trois codes instructifs (direct/indirect/déclencheur).** Hansali 2025 : profils de robustesse distincts, validés in vivo. → taxonomie pour les profils de rêve et pour le C+ (quel type de « cible » un substrat encode).
7. **Mémoires hors équilibre.** Pajouheshgar et al. PRL 2026 : cadre physique rigoureux de « conserver une information sous perturbations arbitraires », découvert avec des NCA. → remplace avantageusement le vocabulaire « mémoire de motif » par une définition (temps de rétention thermodynamiquement long).

### 3.2 Faibles ou creux (analogie sans prédiction différentielle)

- **« Cône cognitif »** : aucune mesure publiée ; TAME le liste comme ouvert ; Pezzulo & Levin 2026 restent conceptuels. Seule prise : la métrique d'efficacité de recherche (Chis-Ciure & Levin 2025), qui mesure l'*intelligence*, pas le cône.
- **« Jonction gap = neuroletter »** : les jonctions gap sont continues, bidirectionnelles, sans identité d'expéditeur ; les neuroletters sont discrètes sur une topologie apprise. Goykadosh 2026 montre que le couplage local suffit sans canal dédié. Le pont n'a de valeur que **reformulé en test** discret vs continu (H4) et « sans expéditeur » (C4).
- **« Morphogenèse = calcul à objectif » → DR-0** : un *setpoint* n'est pas un *budget*. Newman 2023 rappelle que la morphogenèse dépend de propriétés matérielles non computationnelles. Analogie de cadrage seulement.
- **« Régénération = mémoire sans neurones »** : dans un NCA la cible est dans les **poids** (génotype) — la régénération est une robustesse de décodage entraînée, pas un apprentissage ; chez la planaire la cible est dans l'**état** (Vmem). Confondre les deux ruinerait le pont avec la consolidation (qui *écrit*). Voir C1.
- **Xenobots/anthrobots/neurobots** : fascinants, wet-lab, hors portée directe ; Pai 2026 et Fotowat 2026 ne donnent pas de chiffres exploitables ici.

---

## 4. Substrats et simulateurs accessibles (fiches `gh api`, 2026-10-24)

| Outil | Étoiles | Dernier push | Licence | Usage R8 | Coût / faisabilité |
|---|---|---|---|---|---|
| `maxencefaldor/cax` (JAX/Flax, v0.4.4 du 05/09/2026, 25+ systèmes : Growing/Conditional/Unsupervised/Diffusing/Attention/Isotropic NCA, Lenia, Flow-Lenia, Particle Lenia, DiffLogic CA) | 273 | 2026-10-15 | MIT | **Substrat principal** (NCA + Lenia unifiés) | JAX sur Apple Silicon = CPU (jax-metal expérimental) ; NCA 64×64 : minutes sur M1, secondes sur 4090 |
| `chenmingxiang110/Growing-Neural-Cellular-Automata` ; `PWhiddy/Growing-Neural-Cellular-Automata-Pytorch` | 257 ; 148 | 2026-10 | MIT ; Apache-2.0 | Reproductions PyTorch → **MPS natif sur M1** | < 1 h d'entraînement par cible |
| `google-research/self-organising-systems` (notebooks Distill, isotropic NCA, difflogic CA 03/2025) | 451 | 2026-01-09 | Apache-2.0 | Référence historique, notebooks | Colab/TF ; dernier article 03/2025 |
| `betsee/betse` (+ GitLab `betse`, PyPI) ; `betsee/calculion` (web app mono-cellule) | 104 ; 11 | 2025-04-16 ; 2026-06 | BSD-2 ; MIT | Fidélité biophysique (Vmem, jonctions gap, GRN) ; contrôle mécaniste (Blattner l'utilise) | Pure Python CPU, minutes→heures par simulation 2D ; **maintenance faible** (dernier commit avril 2025) |
| `Chakazul/Lenia` ; `erwanplantec/FlowLenia` ; `maxencefaldor/Leniabreeder` ; `flowersteam/sensorimotor-lenia` ; `ochyai/realtime-flowlenia` (PyTorch MPS/CUDA) | 3 887 ; 27 ; 30 ; 0 ; 17 | 2024-07 ; 2026-10-09 ; 2025-04 ; 2026-09 ; 2026-09 | MIT ; **aucune** ; MIT ; aucune ; MIT | Créatures/écosystèmes continus ; CARL (Cvjetko 2026) | Temps réel ; ⚠ FlowLenia et sensorimotor-lenia sans licence → ne pas vendoriser |
| `enajx/NDP` ; `enajx/HyperNCA` | 58 ; 43 | 2024-05 ; 2022-04 | **aucune** ; **aucune** | Programmes développementaux (H7) | Petits réseaux, CPU ; réimplémenter (licence absente) |
| `CodeReclaimers/neat-python` ; `ukuleleplayer/pureples` (ES-HyperNEAT) | 1 584 ; 123 | 2026-05 ; 2026-10 | BSD-3 ; MIT | Encodages indirects (contrôle) | CPU |
| `skriegman/reconfigurable_organisms` ; `swarm-lab/xenobots` | 765 ; 11 | 2020-02 ; 2026-05 | CC0 ; GPL-3 | Pipeline xenobot (Voxelyze) — historique | Obsolète / wet-lab |
| `gengala/egnca` ; `IVRL/MeshNCA` | 37 ; 30 | 2025-10 ; 2024-12 | MIT ; aucune | NCA sur graphes/maillages (topologie ≠ grille, cf. BraiNCA) | GPU conseillé |
| Bio-hybrides : Cortical Labs **CL1** (neurones sur puce, « jusqu'à 6 mois », Cortical Cloud ; prix non affiché) ; FinalSpark **Neuroplatform** (4 organoïdes partagés/dédiés, API Python, « contact for pricing », accès « gratuit pour chercheurs » revendiqué, 30 To de données) | — | — | propriétaire | Déjà prévu dans nerve-wml `docs/superpowers/plans/2026-05-19-bio-substrate-wml.md` (CL1Adapter/FinalSparkAdapter, env-gated) | **Ne pas dupliquer** ; coût non public ; variabilité biologique |

Recherches GitHub « neural cellular automata mlx », « cellular automata apple silicon mlx » : **0 dépôt** → pas de port MLX ; PyTorch MPS ou JAX-CPU suffisent à l'échelle 64×64–128×128.

---

## 5. Ressources Hugging Face

Dix requêtes (papers ×5, models ×4, datasets ×1). Bilan : **la communauté n'est pas sur HF.**
- *Papers* indexés pertinents : 2603.10055 (8 votes), 2609.36126, 2604.01932, 2604.11248, 2509.18659, 2307.08197, 2401.05375, 2307.09320 (Biomaker CA, 4 votes). Aucun pour « bioelectric » (seul hit : EEG).
- *Models* : aucun poids NCA ; « leniachat » = LLM espagnol (faux ami) ; « NCAIR1 » = ASR nigérian ; `louisacornelis/walrus-morphogenesis-*` 0 téléchargement.
- *Datasets* : `smjain/cellular_automata`, `kfahn/cellular_automata`, traces SFT « cellular-automata-step-simulation » (LLM, hors cible).
Conséquence : les artefacts R8 (poids NCA entraînés, jeux de lésions) seraient **publiables sur HF sans concurrence**, mais la validation par les pairs passe par ALIFE/arXiv/Distill.

---

## 6. Actualités septembre–octobre 2026

- **arXiv NCA** (sept.–oct.) : Hartl et al. LoRA-sur-NCA (24/09, **le papier clé du mois**) ; revue Lemke et al. (21/09) ; Guichard & Nichele canaux cachés (18/09) et MetaLearnNCA (06/10) ; NCA auto-réplicants (17/09) ; Etcheverry et al. raisonnement (28/09) ; Zuo et al. randomness (29/09) ; 2610.08518 raisonnement spatial 2D (06/10) ; applications (télédétection 21/10, trafic 07/10, résumé multilingue 22/09, synthèse médicale 28/08).
- **Encodages développementaux** : Saad Saoud (14–15/09, compromis diversité/robustesse) ; Le, Blackiston, Levin, Bongard (30/09).
- **Lenia** : Gupta logique par collision (01/09) ; Pezzulo & Levin v3 (21/10) ; Pigozzi & Levin v2 (02/10) ; `cax` v0.4.4 (05/09) ; dépôt `FlowLenia` poussé le 09/10 ; nouveau dépôt `flowersteam/sensorimotor-lenia` (09/2026).
- **Labo Levin, biologie** : McMillen & Levin (*Dev. Biol.*, en ligne 08/2026, fascicule nov.) ; deux preprints bioRxiv du 02/09 (motifs spatiaux décodables induits dans des collectifs bactériens ; Vmem + connexines dans la croissance tumorale) — non lus ; ALIFE 2026 (BraiNCA, CARL, Agnosiophobie, conservation de masse). **Aucun nouvel article xenobot/anthrobot** publié sept.–oct. 2026 ; dernier : Pai et al. preprint (03/2026), Fotowat (02/2026).
- **Non couvert** : résultats BabyLM 2026 (atelier 24–29/10), listes OpenReview ICLR 2027.

---

## 7. Risques et critères d'arrêt

| # | Risque | Signal | Critère d'arrêt |
|---|---|---|---|
| R1 | **Analogie creuse** : « mémoire », « but », « cognition » importés sans prédiction différentielle vs. un modèle « attracteur + bruit » (Hopfield) | une hypothèse ne prédit rien qu'un réseau d'attracteurs ne prédit déjà | retirer l'hypothèse ; n'écrire aucune phrase de Paper 1 fondée sur A (§1) |
| R2 | **Cible dans les poids vs dans l'état** : la régénération NCA n'est pas un apprentissage | le pont GENIAL↔NCA ne peut pas s'écrire comme écriture en ligne d'un état | limiter R8 au rôle de *substrat* (C+ tests), abandonner la lecture « consolidation = régénération » |
| R3 | Attracteurs non ponctuels (Kvalsund & Stovold) | énoncé contenant « point fixe » | reformuler en ensemble/cycle avant préenregistrement |
| R4 | Réputation : « cognition wars » (Chis-Ciure & Levin 2025), critique matérielle (Newman 2023) ; Hypneum a déjà rétracté 5+ claims (veille) | relecteur hostile au vocabulaire Levin | n'utiliser que les items B (§1) ; citer Newman dans Threats |
| R5 | **Dispersion** : PI unique, 8 dépôts, papiers non soumis, corrections internes prioritaires (veille §« Corrections internes ») | R8 retarde les PR de la veille | R8 ≤ 2 semaines-personne, pas de nouveau dépôt, ≤ 3 pilotes, après les PR doc |
| R6 | Bio-hybrides : coût non public, variabilité, déjà planifiés (BioWML) | tentation de dupliquer | interdit dans R8 ; renvoi au plan existant |
| R7 | Sources faibles : preprints non revus (Blattner, Pai 2026, de Baat 2026), auteurs uniques (Singh, Saad Saoud, Hora de Carvalho, Gupta), Preprints.org non lu (Fields & Levin), presse grand public (« permanent », « indéfiniment ») | citation isolée | citer toujours avec la source revue associée (Durant 2017 pour Blattner ; Sacco 2026 pour Singh) |
| R8 | Goulot développemental pas gratuit (Saad Saoud 2026) | H5/H7 négatifs | rapporter le nul (TOST) et clore |

**Règle d'arrêt globale** : après les deux pilotes les moins chers (H1, H3), si (i) le temps de retour est superlinéaire *et* sans rayon critique net, *et* (ii) la diversité de protocoles n'apporte aucune robustesse (Δ < écart-type inter-graines), **fermer l'axe** ; si un seul des deux tient, ne garder que le volet « substrat NCA conforme C+ » sans claim théorique.

---

## 8. Brainstorm — hypothèses falsifiables (≥ 5 graines, préenregistrement OSF ; ★ = prêt à préenregistrer avec l'outillage existant)

| # | Dépôt | Énoncé | Prédiction quantitative | Test (matériel) | Réfutation | Réf. |
|---|---|---|---|---|---|---|
| H1 ★ | dream-of-kiki | Dans un NCA « regenerate », le temps de retour T(r) à un ε-voisinage de l'ensemble attracteur après lésion de rayon r est **borné et sous-linéaire** jusqu'à un rayon critique r*, au-delà duquel le système bascule en mode secondaire | T(r) ∝ r^α, α ≤ 1 pour r < r* ; P(retour) chute de > 0,9 à < 0,5 sur Δr < 20 % de la taille ; r* stable entre graines (CV < 20 %) | cax ou PyTorch-MPS, grille 64×64, 5 graines × 10 rayons × 50 lésions ; M1 < 1 h | α > 1 ou absence de r* net → pas d'analogue naturel de DR-0 | Masumori 2607.12403 ; Kvalsund & Stovold 2604.12720 ; Zuo 2609.36797 |
| H2 ★ | dream-of-kiki, bouba_sens | **Consolidation cryptique** : deux substrats à performance égale après consolidation (rêvé / non rêvé) diffèrent par un état caché révélé par une re-lésion standardisée | pénétrance de rechute (perte > SESOI g = 0,29) différant de ≥ 15 points entre bras, à performance de base équivalente (TOST) | harness dream-of-kiki (pilote 1,5B existant) ou MLP/NCA jouet ; re-lésion = masque de poids identique ; 20 graines ; M1 | pénétrances équivalentes (TOST) → la consolidation est entièrement « visible » | Durant 2017 ; Blattner 2026 |
| H3 ★ | nerve-wml | Un pool entraîné sous **codebooks hétérogènes** (transducteurs à distance variable) est robuste au mismatch de protocole ; un pool homogène ne l'est pas | chute d'accuracy < 2 pts sous permutation de 25 % du codebook (pool divers) vs > 10 pts (homogène) ; temps de consensus ∝ distance | track_w, pool N = 16 MLP/LIF, 5 graines, M1 CPU | Δ < écart-type inter-graines | Singh 2606.21202 ; Sacco 2501.13188 |
| H4 | nerve-wml | À capacité égale (bits/pas), un canal **discret** (64 symboles) est plus robuste au bruit qu'un canal **continu diffusif** (façon jonction gap) pour le consensus, mais plus lent | croisement SNR : au-dessus de X dB le continu est ≥ 1,5× plus rapide ; en dessous, discret ≥ 90 % d'accuracy quand continu < 70 % | NCA densité-classification 1D/2D dans cax ; M1 | le continu domine à tout SNR → la discrétisation neuroletter perd son argument « bioélectrique » | Singh 2026 ; Goykadosh 2607.21442 ; Manicka & Levin 2019 |
| H5 | baby-brain | **Goulot génomique** : une init néonatale générée par un g-réseau (compression ≥ 100×) puis curriculum atteint le stade k avec moins d'échantillons qu'une init aléatoire à paramètres égaux | −30 % d'échantillons jusqu'au seuil de stade sur ≥ 2 stades ; écart train/val réduit | modèle réduit (1–10 M) sur bras MiniGrid existant ; macM1 | Δ ≤ 0 (5 graines) ou perte de robustesse à la recombinaison (Saad Saoud) | Shuvaev 2024 ; Hamidi 2606.28380 ; Palm 2011.06811 |
| H6 ★ | baby-brain | Les **stades** correspondent à des réorganisations transitoires endogènes : changepoints discrets dans les états cachés (NCA en croissance ; WML sous curriculum) | ≥ 2 changepoints significatifs (PELT/BOCPD) ; alignement avec les transitions de stade à ± 10 % de la durée ; NCA de contrôle montre la même structure | logs d'ontogenèse existants + NCA ; CPU | trajectoire continue ou changepoints indépendants des stades → stades = artefact du curriculum (piste 6 de la veille) | Sato 2607.15726 |
| H7 | BSK | Une croissance par **règles locales (NDP/LNDP)** donne des réseaux à impulsions plus robustes à l'élagage qu'une croissance net2net fonction-préservante à paramètres égaux | à 50 % d'élagage : perte < 5 pts (NDP) vs > 15 pts (net2net) | LifWML (nerve-wml) sur MNIST / 1 env Procgen ; 4090 | net2net ≥ NDP | Najarro 2307.08197 ; Plantec 2406.09787 ; Nisioti 2405.08510 ; Jia 2512.12713 |
| H8 ★ | nerve-wml (strate 5) | La **conservation de masse** rapproche le substrat de la criticité (ratio de branchement σ ≈ 1) et améliore la mémoire séquentielle | σ ∈ [0,95 ; 1,05] dans ≥ 80 % des runs conservés vs < 40 % sinon ; gain sur 5-bit memory | réservoir NCA dans cax, 10 runs ; M1 | pas de différence | Zhang 2606.23115 ; Pontes-Filho 2508.02218 ; Papadopoulos & Guichard 2507.12306 ; Vock & Meisel (veille) |
| H9 | kiki-flow, nerve-wml | Un substrat homéostatique minimal (flot à budget d'énergie) montre **habituation / sensibilisation** du temps de récupération avec l'asymétrie de Samanta | amplitude −30 % sur 10 stimuli, déshabituation après repos ; asymétrie (habituation d'amplitude + sensibilisation du temps) dans > 80 % des paramètres | simulateur (modèle Bruna–Gyllingberg ou JKO entropique) ; M1 | ni habituation ni asymétrie | Samanta 2605.30109 ; Bruna & Gyllingberg 2505.02114 ; Pla-Mauri 2026 |
| H10 ★ | bouba_sens | **Fenêtre critique** : une lésion à l'instant t d'une croissance NCA (sans objectif « regenerate ») donne une fidélité finale sigmoïde en t | fidélité > 0,9 pour t < 0,3 T, < 0,6 pour t > 0,7 T ; t* stable (CV < 15 %) | Growing NCA, 10 graines ; M1 | fidélité indépendante de t | Mordvintsev 2020 ; Kleinman CVPR 2023 (veille) |
| H11 | dream-of-kiki | Les **codes direct / indirect / déclencheur** donnent des profils de robustesse distincts : direct → robuste aux inits ; indirect → robuste au bruit du code | réplication des résultats (3)–(4) de Hansali ; transposé : un rêve « replay de cibles » robuste aux inits, un rêve « règles » robuste au bruit de canal | NCA évolué + profils kiki_oniric ; 4090 pour l'évolution | profils identiques | Hansali 2025 |
| H12 | micro-kiki (hors LLM, via NCA) | **Poignées régulatrices** : un adaptateur rang 1 appris pour une transformation (échelle) sur un substrat MLP/kiki_oniric transfère zero-shot à un autre domaine | ≥ 70 % de l'effet conservé en transfert | nerve-wml MLP + LoRA ; M1 | transfert < 20 % | Hartl 2609.29755 ; Hazan 2604.08749 |
| H13 (spéculatif) | baby-brain, dream-of-kiki | L'**efficacité de recherche** (log₁₀ coût marche aléatoire / coût agent) augmente d'au moins un ordre de grandeur après consolidation sur une tâche de navigation | Δ ≥ 1,0 ordre ; nul si < 0,3 | MiniGrid (bras SP7 existant) ; macM1 | Δ < 0,3 | Chis-Ciure & Levin 2025 |

Douze des treize hypothèses sont hors paradigme LLM/transformer (H12 touche LoRA sur substrat non-LLM).

---

## 9. Concepts et intuitions nouveaux (tous **SPÉCULATIFS**, chacun avec le test qui le rendrait falsifiable)

- **C1 — Mémoire de motif *d'état* vs *de poids*.** Les NCA stockent la cible dans les poids ; la planaire la stocke dans un motif d'état lent (Vmem). Proposition : ajouter au substrat de rêve un **canal lent persistant** (état, pas paramètre) qui porte la « morphologie relationnelle » cible et peut être réécrit sans gradient. *Test* : dans un NCA, une perturbation d'un pas sur ce canal doit changer **stablement** la morphologie régénérée sur ≥ 3 re-coupes (analogue 2-têtes) ; réfuté si la morphologie revient toujours au défaut des poids.
- **C2 — Rêve = re-coupe.** La phase hors-ligne comme cycle lésion-régénération auto-imposé (amputation contrôlée) qui *révèle* puis *consolide* l'état caché — à opposer au replay. *Test* : rêve-lésion vs rêve-replay à calcul égal sur oubli et généralisation ; réfuté si la lésion ne fait jamais mieux que le replay (lien avec Zhang et al. 2609.31630, veille).
- **C3 — Prépattern lent = porteuse thêta.** La composante bioélectrique « heures » (McMillen & Levin 2026) comme analogue morphogénétique de la porteuse thêta qui ordonne le gamma. *Test* : un canal global lent de période T ajouté à un NCA réduit le temps de récupération à paramètres égaux ; réfuté si Δ nul.
- **C4 — Neuroletters sans expéditeur** (propriété « syncytium » de TAME). *Test* : retirer toute identité d'émetteur des messages nerve-wml ; prédiction : MI/H post-VQ inchangé, accuracy inchangée si la topologie apprise ne dépend pas de l'identité ; réfuté si l'accuracy chute > 2 pts.
- **C5 — Ontogenèse = décompression.** Les stades de baby-brain comme calendrier de décompression d'un goulot génomique ; les portes de plasticité comme pas de décodage. *Test* : H5 + courbe « taux de compression ↔ durée de stade ».
- **C6 — Cône cognitif → horizon de consolidation.** Définir le cône d'un agent comme le décalage temporel maximal auquel le replay améliore encore la tâche ; prédiction : il **croît avec le stade**. *Test* : logs d'ontogenèse ; réfuté si l'horizon est constant.
- **C7 — Le vocabulaire cognitif est une interface, pas une ontologie.** Adopter la *métrique* (efficacité de recherche, mémoire hors équilibre) et laisser la métaphysique (Levin & Watson 2026) au related work.

---

## 10. Recommandation : **ouvrir sous conditions** (« R8-lite »)

1. **Pas de nouveau dépôt, pas de wet-lab.** R8 = (a) un substrat NCA conforme branché sur le WML Protocol de nerve-wml (`NcaWML`, 5ᵉ substrat après MLP/LIF/TRF/BioField) et sur le Critère de Conformité C+ de dream-of-kiki (substrat de rêve non-LLM) ; (b) une spec courte reliant H1/H2 à DR-0 et DR-3 **reformulé** (ensemble attracteur relationnel, jamais point fixe).
2. **Trois pilotes préenregistrés d'abord** (coût total ≈ 1–2 semaines, M1 suffisant) : H1 (budget de retour), H3 (hétérogénéité des protocoles), H2 (consolidation cryptique). Prêts aussi avec l'outillage existant : H6, H8, H10. Spéculatifs à ne pas préenregistrer avant pilote : H5, H13, C1–C6.
3. **Séquençage** : après les PR de documentation de la veille (nerve-wml #50, dream-of-kiki #40…), pas avant.
4. **Critères d'arrêt** de §7 inscrits dans le préenregistrement ; rapporter les nuls en équivalence (TOST), comme pour bouba_sens.
5. **Ce qu'on retire du cadrage Levin dans les papiers** : rien de la lecture A sauf dans Related Work ; on cite Hartl et al. 2026 (remappage/navigation) comme concurrent conceptuel de GENIAL, Newman 2023 et les « cognition wars » dans Threats.
6. **Gain attendu si positif** : une 5ᵉ famille de substrats pour DR-3 à coût nul, un test de mémoire cryptique original pour Paper 2 et bouba_sens, un modèle minimal des transducteurs pour nerve-wml ; si négatif : trois nuls propres et peu coûteux, publiables en appendice.

---

## Méthode et limites

- Lectures seules : veille du 23/10 ; README de baby-brain, dream-of-kiki, nerve-wml ; grep des specs biophysiques existantes (BioFieldWML, stratification).
- Recherches : **14 recherches web** abouties (le quota partagé de la session s'est épuisé à 14 ; la consigne en demandait 16 — manquent « Lenia/Flow-Lenia 2026 » et « bassins d'attraction NCA », compensées par l'API arXiv) ; **10 requêtes arXiv** par mots-clés (NCA, bioelectric, basal cognition, Lenia, encodages développementaux, jonctions gap, croissance) + **2 lots `id_list` : 83 identifiants arXiv vérifiés** (titre, auteurs, dates, résumés) ; **12 recherches GitHub** + 19 fiches `gh api repos/…` ; **10 requêtes HF** ; **23 DOI** résolus via Semantic Scholar ; ~12 pages primaires lues (bioRxiv, eLife, pages du labo Levin, cax, Cortical Labs, FinalSpark).
- Non vérifiés / faibles (signalés ✱) : Fields & Levin 2026 (Preprints.org, 403) ; résumé Manicka & Levin 2025 (Elsevier 403, DOI confirmé) ; Pla-Mauri 2026 (détails = extraits de recherche, PMID confirmé) ; dates exactes du Tort/TAS ; prix CL1/FinalSpark (non publics). Références de critique classiques (Adams 2018 « Cognition wars », Figdor 2018) **non revérifiées en ligne ici → omises** ; le débat est cité via Chis-Ciure & Levin 2025 et Newman 2023.
- Données brutes : `research/r8-raw/` (XML arXiv, `verify_A/B.txt`, `s2_batch*.json`, `hf_verify.txt`).
