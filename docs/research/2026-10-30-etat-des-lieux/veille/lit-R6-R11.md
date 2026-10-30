# Veille R6–R11 — juillet → 30 octobre 2026 (Hypneum Lab)

*Rédigé le 2026-10-30. Lecture seule. Complète `veille-2026-10-23.md` et la revue
du 24/10 (`2026-10-24-revue-hypotheses/`). Les 662 identifiants arXiv et 139 DOI
déjà cités ont été exclus par grep. Aucune entrée ci-dessous n'y figure.*

**Méthode et vérification.** Recherches faites avec l'API arXiv (`export.arxiv.org`,
filtre `submittedDate:[20260701 TO 20261030]`) et Europe PMC, qui indexe les
prépublications bioRxiv (préfixe DOI `10.64898` depuis 2026). Les DOI bioRxiv ont
été contrôlés sur `api.biorxiv.org/details`. Les DOI de revues ont été contrôlés
sur Crossref. Pour les identifiants trouvés via Exa, j'ai vérifié les pages
`arxiv.org/abs`. Chaque identifiant cité a donc été confirmé par au moins une
requête réelle (titre et date). **Problèmes d'accès :** l'API arXiv a fini par
renvoyer des erreurs 429 (limitation de débit), contournées par les pages `abs`.
L'API Semantic Scholar a aussi renvoyé 429, sans contournement. OpenReview n'a
pas été interrogé. Je n'ai lu que les résumés, pas les articles complets : les
chiffres repris viennent des résumés. [P] = prépublication non relue par les
pairs ; [1A] = auteur unique.

---

## R7 — « Hypneum matière » : apprentissage et mémoire dans la matière

C'est l'axe le plus riche du trimestre. Un sous-champ s'est cristallisé, le
*physical learning* : des réseaux résistifs ou mécaniques entraînés par des règles
locales (equilibrium propagation, coupled learning). Il touche directement à la
question « rêve ↔ physique » posée par le PI.

| # | Réf. vérifiée | Date | Résumé (2 lignes) | Pour Hypneum |
|---|---|---|---|---|
| 1 | Dillavou, Rocks, Wycoff, Liu, Durian — *Double descent without digital computation*, PNAS 123(39) e2604421123, doi:10.1073/pnas.2604421123 | 24/09/2026 | Réseau analogique de résistances auto-ajustables (CLLN). Il s'entraîne sans processeur et présente une **double descente** expérimentale, mais seulement avec un protocole tolérant aux imperfections. | **Dépasse** : premier phénomène « grand modèle » observé dans la matière. Le rôle des défauts physiques dans le protocole est l'analogue matériel du budget DR-0. Substrat de référence pour un *track M*. |
| 2 | Dangol — *Conservation capacity of local learning rules in physical networks*, arXiv:2608.20426 [P][1A] | 19/08/2026 | Le nombre de « masses » conservées (donc de mémoires protégeables) par une règle locale est une propriété **topologique** du circuit, bornée par le nombre d'électrodes de sortie. Le cas linéaire est prouvé sur 502 circuits. | **Outil / pilote** : donne une capacité de protection calculable *a priori*. On peut la comparer à α_c(t) du Hopfield rêveur. |
| 3 | Dangol — *Untrainable elements determine what physical learning remembers*, arXiv:2608.00097 [P][1A] | 30/07/2026 | Un seul élément non entraînable (redresseur fixe) suffit à rendre la fonction apprise dépendante de l'échelle d'initialisation (médiane 12 % contre 3·10⁻⁸). La loi de conservation ne protège pas la mémoire. | **Infirme** une intuition commode : « conservation = mémoire » est faux. Pour nerve-wml, les éléments figés font partie de la mémoire, et ce sont des biais du circuit, pas de la règle. |
| 4 | Liu & Grollier — *Two-State Dynamical Synapses as a Physical Substrate for Equilibrium Propagation*, arXiv:2610.18058 [P] | 13/10/2026 | Une synapse à deux échelles de temps (état volatil w, état non volatil M), dérivée d'une seule énergie, implémente l'EqProp par phases ou en continu. MNIST : 2,01 % contre 2,00 %. | **Outil** : une variable volatile et une variable consolidée, c'est littéralement le schéma éveil/consolidation de dream-of-kiki, écrit comme une énergie. |
| 5 | Cook *et al.* — *Generative Replay for Equilibrium Propagation…Hopfield Networks*, arXiv:2610.37139 [P] | 27/10/2026 | Le rejeu est généré par relaxation d'une copie gelée du réseau de Hopfield, sans tampon de données. Split-MNIST 75 %, Split-CIFAR10 64 %, comparé à la consolidation de type sommeil (SRC). | **Concurrence directe** de DR-4/dream-of-kiki : « rêve = relaxation libre de l'énergie » publié sur l'EqProp. À citer comme référence à battre. |
| 6 | Liu & Li — *Phase Transitions and Modulation in Dense Oscillatory Associative Memories*, arXiv:2609.14389 [P] | 13/09/2026 | Modèles de Winfree d'ordre élevé. Quand la charge croît, le bruit de diaphonie provoque une cascade de phases ferro → mixte → verre de spin. Les frontières sont dérivées et des circuits proposés. | **Pont** vers le bras Kuramoto de nerve-wml : diagramme de phase explicite d'une mémoire à oscillateurs. |
| 7 | Stojnic — *Capacity of the Hopfield-Hebbian dynamics with correlated patterns*, arXiv:2610.38437 [P][1A] ; Albanese, Ladiana, Lepre — *Semi-supervised Hopfield model*, arXiv:2607.28173 [P] | 28/10 et 30/07/2026 | Capacité α_c avec M exemples corrélés par archétype (Random Duality Theory, qui colle aux simulations). Mélange supervisé/non supervisé : la pression est convexe en λ, donc λ est un hyperparamètre et non un choix thermodynamique. | **Outil** : prédictions analytiques pour des données corrélées, ce qui est le cas Hypneum. Elles calibrent le pilote R7-B. |
| 8 | Rajput & Pahlavan — *Fluidic hysterons and memory in flow networks*, arXiv:2607.15122 [P] ; Bedolla-Montiel & Dijkstra — *How Quasicrystals Remember*, arXiv:2607.12674 [P] | 16/07 et 14/07/2026 | Hystérons (éléments bistables) fluidiques : passage de la mémoire de point de retour (Preisach) à sa violation par interaction. Quasicristaux : des basculements de tuiles de type phason sont les hystérons d'une mémoire hiérarchique sous cisaillement cyclique. | **Pont** : une mémoire *sans poids* (hystérésis) donne une seconde définition physique de la consolidation. Cela contredit la lecture « cristal = mémoire » : le cristal périodique n'a **pas** de mémoire, le désordre est nécessaire. |

À noter aussi : Abbott & Machta, arXiv:2610.12571 [P] (un transformer entièrement
à transistors, entraîné par EqProp, fait de l'apprentissage en contexte), et
Berloff, arXiv:2610.34428 [P][1A], *Matter that learns what matters* (dans un
réseau optique, un enregistrement obsolète bloque son propre remplacement ;
l'oubli exige une « écriture négative » locale, ce qui ressemble au
désapprentissage).

### R7 — trois pilotes simulables sur CPU (≤ 6 h, ≥ 5 graines, nul nommé)

**Pilote R7-A — « Rêve contrastif » dans un réseau résistif (le plus neuf).**
*Ancrage :* Dillavou 2026 (PNAS), Dangol 2608.20426 et 2608.00097, Ibrahim
(PRE, doi:10.1103/584w-2mxq, 06/2026, oubli catastrophique dans les réseaux de
résistances), Guzman–Ciarella–Liu (PNAS doi:10.1073/pnas.2525792123, 05/2026,
« Restricted Kirchhoff Machine »).
*Idée :* dans le coupled learning, la mise à jour vaut ΔG ∝ (ΔV_libre² − ΔV_clampé²).
Le terme libre est déjà un **désapprentissage anti-hebbien sur l'état spontané**,
c'est-à-dire le mécanisme de Crick-Mitchison. On ajoute, entre deux tâches, une
« phase de rêve » : seul le terme libre est appliqué, sur des entrées tirées du
bruit, avec un budget fixe B (en joules dissipés ou en nombre de pas).
*Mesure :* oubli de la tâche 1 après la tâche 2, avec B ∈ {0, 1, 3, 10}, sur
5 topologies, N = 64–256 nœuds. Le calcul se ramène à un solveur laplacien
`scipy.sparse`, donc quelques minutes par graine.
*Nul apparié :* une phase de « rêve » à budget égal mais à signes aléatoires,
plus l'ancrage uniforme d'Ibrahim.
*Réfutation :* oubli(B = 10) ≥ oubli(nul) − 0,05 sur 5 graines (TOST).
*Valeur :* c'est le premier test où le « rêve » est une opération **physique
locale**, et non un algorithme posé sur un substrat.

**Pilote R7-B — Le noyau rêvé de Fachechi est-il un recuit physique ?**
*Ancrage :* Stojnic 2610.38437, Albanese 2607.28173, Dehghani 2609.02195 [P][1A]
(chapitre de synthèse, utile pour les bornes), et H1 de la revue R7 (déjà
couvert, non recité).
*Idée :* le noyau J(t) = J(1+t)/(1+tJ) est algébrique. On le compare à un
désapprentissage **thermique** : on tire des états par Glauber à température T,
puis on applique J ← J − ε s sᵀ, n_u fois, avec des motifs corrélés (M, r).
*Mesure :* existe-t-il une correspondance t ↔ (T, ε·n_u) qui reproduise α_c(t) à
5 % près ? Paramètres : N = 1 000, 20 points (T, n_u), environ 2–4 h sur CPU.
*Nul :* désapprentissage sur des états uniformes aléatoires (non relaxés).
*Réfutation :* aucune région (T, n_u) n'atteint 80 % du gain de capacité du noyau
algébrique.
*Valeur :* si la correspondance existe, le « rêve » de dream-of-kiki devient une
**température et une durée**, ce qui permet de l'implémenter sur p-bits ou
machines d'Ising.

**Pilote R7-C — Mémoire à oscillateurs rêvée (Winfree/Kuramoto).**
*Ancrage :* Liu & Li 2609.14389, Sbravati & Todri-Sanial arXiv:2608.30800 [P]
(règles d'apprentissage à valeurs complexes pour réseaux d'oscillateurs),
Allibhoy & Pasqualetti arXiv:2610.39703 [P] (revue : oscillateurs = optimisation,
mémoire et attention).
*Idée :* on applique le noyau rêvé à la matrice hebbienne complexe, puis on
mesure le déplacement de la frontière mixte/verre de spin prédite par Liu & Li.
*Mesure :* charge critique avant et après le rêve, N = 256–1 024 oscillateurs,
intégration RK4, < 3 h.
*Réfutation :* déplacement < 10 %.
*Valeur :* relie H5/H6 (bras Kuramoto) au rêve sans passer par un LLM.

*Option de repli :* un réseau d'hystérons de Preisach (Rajput 2607.15122). On teste
si une « démagnétisation » (cycles d'amplitude décroissante) efface sélectivement
les mémoires récentes et conserve les anciennes, à la manière d'un tri
synaptique. Le coût est de quelques minutes.

---

## R6 — Futur IA : wetware, neuromorphique

| # | Réf. vérifiée | Date | Résumé | Pour Hypneum |
|---|---|---|---|---|
| 1 | Schweiger, Robbins *et al.* — *A foundation model for brain organoid network dynamics…* (PULSE), bioRxiv doi:10.64898/2026.10.11.758231 [P] | 13/10/2026 | Modèle de fondation entraîné sur plus de 900 h d'enregistrements HD-MEA d'organoïdes. Le contrôle en boucle fermée d'un pendule inversé **recrute des motifs spontanés existants plutôt que d'en créer de nouveaux**. | **Infirme partiellement** le récit « l'organoïde apprend » : l'apprentissage en boucle fermée sélectionne un répertoire préexistant. C'est un appui fort à une lecture « sélection » plutôt que « construction » (cf. DR-1 sélective). |
| 2 | Faravelli *et al.* — *Human brain organoids record the passage of time over multiple years*, Nature, doi:10.1038/s41586-026-10877-x | 19/08/2026 | Organoïdes corticaux maintenus plus de 5 ans. Leur vieillissement moléculaire suit le temps de culture. | **Contrainte** : le substrat vivant n'est pas stationnaire. Toute expérience wetware doit modéliser la dérive (nul « âge du substrat »). |
| 3 | Somathilaka, Clouse, Balasubramaniam — *Harnessing the Intrinsic Dynamics of Biological Neural Networks for Reservoir Computing*, bioRxiv doi:10.64898/2026.09.08.750274 [P] | 14/09/2026 | Culture sur MEA utilisée comme réservoir sans modification. Mesures : non-linéarité, mémoire évanescente, séparabilité. XOR 95,8 % au point de fonctionnement choisi. | **Outil** : grille d'évaluation de réservoir directement réutilisable pour BioFieldWML. |
| 4 | Schottlender *et al.* — *Evaluating Encoding Strategies for Closed-Loop Classification in BNNs*, arXiv:2607.13644 [P] ; Liu, Philamore, Ward-Cherrier — *Braille…with organoids*, Front. AI, doi:10.3389/frai.2026.1800219 | 15/07 et 16/10/2026 | Sur Cortical Cloud, l'encodage par **bouffées** bat le codage par taux ou par phase (95,6 % en binaire). Le choix spatial des électrodes domine. | **Confirme** : le code temporel compte plus que le taux, ce qui rejoint les neuroletters et le codage par phase de nerve-wml. Reste un résultat binaire, faible. |
| 5 | Cai *et al.* — *Brain organoid computing for robotic decision-making* (Brainobot), bioRxiv doi:10.64898/2026.09.09.750426 [P] ; Carvalho *et al.* — RL *in silico → in vitro*, bioRxiv doi:10.64898/2026.07.13.738298 [P] | 15/09 et 20/07/2026 | Organoïde-réservoir utilisé comme couche de décision d'un humanoïde (saisie d'objet, poursuite laser). Politique de RL pré-entraînée en simulation puis transférée pour contrôler les bouffées. | **Dépasse** (démonstration), mais sans nul « réservoir mort ou mélangé » visible dans le résumé. À ne pas citer comme preuve d'apprentissage. |
| 6 | Wang — *The Sparsity Ceiling*, arXiv:2607.26648 [P][1A] | 29/07/2026 | Un LM récurrent à impulsions ne descend pas sous **~50 % de décharge** sans perte de qualité. Un transformer à impulsions descend à 2 %, mais paie en cache KV. Borne : ρ ≥ H_b⁻¹(log₂M/H). | **Confirme NH-81 à l'avance** : le dividende énergétique de la sparsité dépend de la tâche, pas du SNN. Le claim de 91,6× de BSK est très probablement faux pour un LM. |
| 7 | Wu, …, Simeone — *Neuromorphic Diffusion Language Models*, arXiv:2607.24841 [P] | 24/07/2026 | Diffusion masquée par blocs combinée à la sparsité des impulsions, avec un modèle de roofline par token. Gains en énergie même sur plateformes limitées par le calcul. | **Outil** : le modèle roofline sert à prédire J/token avant de mesurer (NH-81). |

Contexte non académique (presse/institution, non revu) : rack de 20 CL1 Cortical
Labs démontré à la NUS (Singapour) le 06/08/2026. Fiche de synthèse
« biocomputers.co.uk/fact-check » (statut des claims, consultée via Exa) : le
gain énergétique au niveau système complet reste **non établi**.

---

## R8 — Bioélectricité, mémoire non neurale, cognition basale

| # | Réf. vérifiée | Date | Résumé | Pour Hypneum |
|---|---|---|---|---|
| 1 | Dev, Nguyen, Levin — *Trained Planaria Retain Memories Through Head Regeneration*, bioRxiv doi:10.64898/2026.08.10.741213 [P] | 11/08/2026 | Réplication avec un protocole « fiable et peu coûteux » : la plupart des planaires conditionnées lumière→nourriture gardent la réponse après décapitation et 2 semaines de régénération. | **Appuie** la mémoire hors cerveau, mais le résumé ne donne ni effectif, ni nul, ni insu. À classer comme « signal à répliquer » et non comme fait. |
| 2 | Smart, Shvartsman, Mönnigmann — *Dynamical principles of habituation across substrates and scales*, arXiv:2608.00249 [P] | 31/07/2026 | Formalise les marqueurs de l'habituation comme contraintes entrée-sortie. **Aucun système linéaire invariant ne peut les satisfaire.** Motif minimal : mémoire évanescente linéaire suivie d'une non-linéarité statique. | **Outil formel** : critère nécessaire pour toute affirmation « le substrat X habitue ». Il s'applique à BioFieldWML et aux réservoirs physiques. Fort impact méthodologique. |
| 3 | Erickson *et al.* — *A platform for automated training of mammalian cell physiology* (Cell Trainer), bioRxiv doi:10.64898/2026.08.13.744473 [P] | 17/08/2026 | Dispositif d'entraînement automatisé (impulsions de drogue, boucle ouverte ou fermée, analyse cellule par cellule) appliqué à des cellules non neurales. | **Infrastructure** pour tester habituation et sensibilisation cellulaires avec de vrais contrôles. Pas encore de résultat d'apprentissage. |
| 4 | Pham & Saad — *Cellular Adaptation to Signal Fluctuations as Learning*, arXiv:2607.03545 [P] | 03/07/2026 | Réseau de régulation génique couplé à des transducteurs adaptatifs. Une théorie macroscopique prédit une **transition** de modes collectifs aléatoires vers des modes structurés au-delà d'un taux d'adaptation critique. | **Pont formel** : seuil d'adaptation analogue au seuil de consolidation. Simulable. |
| 5 | Sergeeva *et al.* (Süel, Levin…) — *Living multicellular systems induce decodable spatial patterns in bacterial collectives*, bioRxiv doi:10.64898/2026.09.02.748853 [P] | 03/09/2026 | Des populations de *B. subtilis* forment des halos qui suivent à distance des embryons de *Xenopus* et des Xenobots, modulés par le potassium. Un modèle auto-supervisé décode la cible. | **Dépasse** : le collectif bactérien sert de capteur distribué. Couplage ionique K⁺ ↔ motif spatial, utile comme analogie pour BioFieldWML. |
| 6 | Jorwal — *Learning Without Neurons: A Review of Associative Memory in Protists*, J. Eukaryot. Microbiol., doi:10.1111/jeu.70120 [1A] | 09/2026 | Revue des preuves d'association chez les protistes. | **Bibliographie** : rien de nouveau, mais utile pour cadrer ce qui est répliqué et ce qui ne l'est pas. |

Également vérifiés, à faible poids : Kapsetaki–Landsberger–Levin, bioRxiv
doi:10.64898/2026.07.28.741268 [P] (transcriptome de planaires s'habituant au
BaCl₂) ; Kakalis & Diakonos, arXiv:2609.33361 [P] (une criticité émerge d'une
connectivité qui dépend de la mémoire, sans température, ce qui fournit un nul
supplémentaire pour le stratum 5).

---

## R9 — Thermodynamique de l'apprentissage, énergie par token

| # | Réf. vérifiée | Date | Résumé | Pour Hypneum |
|---|---|---|---|---|
| 1 | Stérin *et al.* — *A thermodynamically favoured molecular computer*, Nature, doi:10.1038/s41586-026-10996-5 | 16/09/2026 | Ordinateur à ADN échafaudé, qui calcule en **relaxant vers un équilibre favorable** et non par contrôle cinétique coûteux. 10 programmes, dont la parité 8 bits et l'addition 25 bits. | **Dépasse** : calcul = descente d'énergie libre, réalisé expérimentalement. C'est l'argument matériel du pont JKO ↔ énergie libre (kiki-flow). |
| 2 | Ma *et al.* — *Only Accepted Tokens Count: An Energy Accounting of Speculative Decoding*, arXiv:2610.40287 [P] | 29/10/2026 | Sur H100/H200 (SGLang), la **vérification**, pas la rédaction, domine l'énergie. Le gain diminue avec le batch et dépend du corpus (conversation < code ; romanche < anglais). | **Outil** pour NH-81 : il faut mesurer J/token *par corpus* et *par taille de batch*, sinon la comparaison est biaisée. |
| 3 | Abkin *et al.* — *Measuring the Energy Cost of Completing Tasks with Quantized LM Agents*, arXiv:2610.32417 [P] | 23/10/2026 | 29 tâches d'agent : la quantification 4 bits économise par token, mais **pas forcément par tâche réussie**. | **Change le protocole NH-81** : publier J/token *et* J/tâche réussie (iso-qualité). |
| 4 | Wang *et al.* — *LLM-PowerTrace*, arXiv:2610.38315 [P] | 28/10/2026 | Jeu ouvert de traces de puissance par GPU échantillonnées à 100 ms, en inférence et en fine-tuning. | **Outil réutilisable** : format de publication du « jeu de joules » prévu par NH-81 (le trou HF identifié est partiellement comblé). |
| 5 | Chkir *et al.* — *Energy Scaling of LLM Inference Across Context Lengths and Attention Architectures*, arXiv:2608.25096 [P] ; Kannan *et al.* — *GreenBench* (Apple Silicon), arXiv:2608.28667 [P] | 25/08 et 24/08/2026 | NVML : l'architecture d'attention (MHA, GQA, SWA) gouverne la pente de l'énergie avec le contexte. GreenBench rapporte **0,47 W** CPU+GPU pour le paquet M4 Pro en inférence soutenue. | **Mise en garde** : le chiffre de 0,47 W est physiquement suspect pour un modèle de 7B. `powermetrics` mal utilisé sous-estime la puissance. NH-81 doit mesurer la puissance système (prise) en plus de `powermetrics`. |
| 6 | Shimizu *et al.* — *Charge discreteness and the energy efficiency of information erasure in DRAM cells*, arXiv:2607.29015 [P] ; Fridman *et al.* — *Approaching Landauer's limit in a single superconducting vortex memory bit*, arXiv:2610.37753 [P] | 31/07 et 27/10/2026 | Le paramètre κ (énergie de charge / kT) gouverne l'approche de la limite de Landauer dans une cellule DRAM. Le vortex supraconducteur est à un ordre de grandeur de kT ln 2 à 4,2 K (en simulation, avec forçage sinusoïdal). | **Confirme** que Landauer reste à 10⁶–10⁹ fois sous le coût réel d'un token : un « budget Landauer » n'est pas une prédiction pour DR-0. |
| 7 | Egenlauf *et al.* — *Entropy production of active matter systems as indicator for computing performance*, arXiv:2607.29434 [P] | 31/07/2026 | Réservoir d'essaim actif : le pic de performance (Lorenz-63) coïncide avec la différence maximale de production d'entropie entre régime forcé et régime libre. | **Pilote possible** : la production d'entropie comme prédicteur de la qualité d'un réservoir, applicable aux pilotes R7. |

---

## R10 — Conscience et théories de l'esprit (uniquement le testable)

| # | Réf. vérifiée | Date | Résumé | Pour Hypneum |
|---|---|---|---|---|
| 1 | Aoki *et al.* — *In-Context Neurofeedback: Can LLMs Control Their Internal Representations through Privileged Access?*, arXiv:2609.00904 [P] | 01/09/2026 | Quand la cible est réellement **privée** (non inférable depuis le prompt), les LLM **ne** contrôlent **pas** de façon fiable leurs représentations. Le résultat antérieur s'expliquait par des indices superficiels. | **Infirme** une lecture forte de la métacognition des LLM. Critère « accès privilégié » à imposer à tout test de type GWT ou HOT chez Hypneum. |
| 2 | Tang *et al.* — *Interventional Training Reduces Causal Bypass in In-Context Introspection*, arXiv:2610.38911 [P] | 28/10/2026 | Le fine-tuning supervisé produit une introspection par « contournement causal » (corrélat non causal). L'entraînement sur valeurs contrefactuelles perturbées la rend causale, y compris hors distribution. Centaines d'introspecteurs, 8 LM. | **Outil** : le protocole d'intervention est le bon nul pour toute affirmation d'auto-modèle. |
| 3 | Zou *et al.* — *A mechanistic study of language model introspection*, arXiv:2609.35108 [P] | 28/09/2026 | Détecter une injection de vecteur-concept mobilise deux groupes de têtes : des têtes « porte » en couches moyennes et des têtes « routeur » plus tardives. | **Confirme** qu'un signal d'introspection est localisable. Il reste à tester sous le critère d'accès privilégié de #1. |
| 4 | Yax, Palminteri, Oudeyer — *LLMs learn different forms of metacognition when trained to predict their own accuracy*, arXiv:2609.33886 [P] | 27/09/2026 | Sur 10 LLM, la confiance entraînée suit la vraie exactitude seulement près des données d'entraînement. Ailleurs, elle suit la **cohérence des sorties**. | **Nul utile** : la « métacognition » peut n'être que de la concentration de distribution. Toute mesure de confiance doit être comparée à ce nul. |
| 5 | Langer, van Oostrum, Ay — *Integrated Information in the Active Inference Framework*, arXiv:2608.14165 [P] | 14/08/2026 | Une mesure Φ sur le modèle génératif d'agents d'inférence active est corrélée à l'énergie libre, et la corrélation croît avec la taille du modèle. | **Pilote simulable**, mais risque de confusion de taille : imposer un nul « taille appariée, structure mélangée ». |
| 6 | Salvi & Wolfson — *Discovering Machine Correlates of Consciousness*, arXiv:2608.28824 [P] | 28/08/2026 | Prétend des « corrélats machine de conscience » à partir de traces d'anomalies matérielles modulées par l'émotion (Llama-3.1 70B). | **Contre-exemple méthodologique** : inférence non justifiée. À citer seulement comme ce qu'il ne faut pas faire. |

---

## R11 — Mathématiques structurales (DR-3, nuls, équivalence, vivacité)

| # | Réf. vérifiée | Date | Résumé | Pour Hypneum |
|---|---|---|---|---|
| 1 | Khaous & Wisniewski — *A Better Metric Will Not Save You: What You Compare Beats How You Compare It*, arXiv:2610.13476 [P] | 09/10/2026 | Avec RSA, CKA et Procrustes, **changer quelles catégories sont comparées** (à nombre égal) déplace l'écart entre représentations de plus de **2× l'effet mesuré**. Changer le *nombre* de catégories n'a aucun effet. | **Impact maximal pour DR-3/RCI** : il faut préenregistrer l'ensemble des conditions et tester la robustesse à son tirage (nul « sous-ensembles de conditions »). |
| 2 | Liu *et al.* (Khosla, Williams…) — *Similarity of Neural Network Representations in Superposition*, arXiv:2604.00208 [P] | 31/03/2026 (v. 06/2026) | Expressions fermées : la superposition **dégonfle** RSA, CKA et la régression. Elle peut **inverser** l'ordre attendu (moins de traits partagés, plus d'« alignement »). | **Infirme** une lecture directe des scores CKA de nerve-wml entre substrats de largeurs différentes. Il faut comparer des traits extraits (SAE) ou mKNN calibré. |
| 3 | Bordelon & Pehlevan — *Stimulus symmetries can confound RSA*, arXiv:2605.21324 [P] | 05/2026 (v. 10/2026) | Des codes fonctionnellement équivalents par symétrie du stimulus donnent des RSM différentes, et des codes qui dérivent sous SGD donnent des RSM qui dérivent. | **Nul nécessaire** pour le test (6) de nerve-wml : la dérive de RSM n'implique pas une dérive fonctionnelle. |
| 4 | Shimizu, Takahashi, Horii, Oizumi *et al.* — *Relational Knowledge Distillation Brings DNN Representations Close Enough to Humans to Be Aligned Without Supervision*, arXiv:2608.27877 [P] | 28/08/2026 | Avec GWOT non supervisé, la distillation relationnelle permet l'appariement objet par objet. Le gain vient de la **structure globale** ; le recouvrement des plus proches voisins locaux ne change pas. | **Outil et nuance** pour la RCI : le GW et le mKNN mesurent des choses **différentes** (global contre local). Il faut garder les deux composantes séparées. |
| 5 | Leung, Okada, Wong — *Sample Complexity for the 2-Gromov-Wasserstein Distance*, arXiv:2607.27514 [P] ; Breitung, Gervens, Pörzgen *et al.* — *Graph Distortion Distances, Gromov-Hausdorff and the Hardness of GW*, arXiv:2610.16926 [P] | 29/07 et 12/10/2026 | Vitesse de convergence empirique du GW-2. Résultats de difficulté calculatoire pour le GW. | **Outil** : dimensionne le nombre de stimuli nécessaire à un GW stable dans DR-3. La dureté justifie le GW entropique avec plusieurs initialisations (variance d'optimiseur dans le nul). |
| 6 | Seyedi & Archetti — *Conditional Gromov–Wasserstein matching across contexts*, Brain Informatics, doi:10.1186/s40708-026-00336-8 | 26/10/2026 | GW conditionné par un contexte, avec une formulation régularisée reliée au **schéma JKO** et, en version entropique, à un pont de Schrödinger. | **Pont** DR-3 ↔ kiki-flow (JKO) : formalisme commun pour l'alignement entre l'état d'éveil et l'état de rêve. Validé seulement sur données synthétiques. |
| 7 | Wu & Khosla — *Scale, Drivers, and Limits of Representational Alignment Across LLMs* (NW-RSA, CF-RSA), arXiv:2610.14476 [P] | 10/10/2026 | Les LLM s'accordent sur la géométrie grossière mais divergent localement. Le RSA contrefactuel montre que la portée logique pèse plus que la syntaxe. | **Confirme** l'« aristotélisme local » déjà retenu. Le NW-RSA est un balayage d'échelle prêt à l'emploi. |
| 8 | Elkoussy & Perez — *AgentLTL*, arXiv:2607.02599 [P] ; Ulus — *Runtime Verification under Split Past and Future* (SplitLTL), arXiv:2608.20783 [P][1A] | 01/07 et 21/08/2026 | AgentLTL : FO-LTL sur des traces d'agents, avec un score de conformité déterministe sans juge, réutilisé comme récompense. SplitLTL : le passé observé fixe les exigences, le futur prédit est filtré contre elles. | **Vivacité** : une propriété comme « un épisode DE finit par se produire » n'est pas décidable sur un préfixe fini. SplitLTL offre un cadre où ces propriétés sont évaluées sur des continuations prédites. AgentLTL est réutilisable pour les traces des pipelines. |

---

## Classement par impact pour Hypneum

1. **R11-1 (2610.13476)** et **R11-2 (2604.00208)** : ils modifient directement
   le protocole DR-3/RCI. Il faut préenregistrer l'ensemble des conditions et
   neutraliser l'effet de superposition.
2. **R6-6 (2607.26648)** avec **R9-2/3 (2610.40287, 2610.32417)** : NH-81 est
   quasi tranché à l'avance contre le claim de 91,6×. Il reste à le mesurer
   proprement (J/token et J/tâche, par corpus et par batch, puissance prise).
3. **R7-5 (2610.37139)** : un concurrent publié de « rêve = relaxation
   énergétique » à citer et à battre.
4. **R7-1/2/3 (PNAS Dillavou, Dangol ×2)** : socle du pilote R7-A.
5. **R6-1 (PULSE)** : la lecture « sélection d'un répertoire préexistant » soutient
   DR-1 sélective et affaiblit les claims d'apprentissage wetware.
6. **R8-2 (2608.00249)** : critère nécessaire pour toute affirmation
   d'habituation.
7. **R10-1/2** : nuls « accès privilégié » et « intervention » pour toute
   introspection.

## 5 papiers prioritaires (à lire en entier)

1. Khaous & Wisniewski, arXiv:2610.13476 : le choix des conditions domine la
   métrique (DR-3).
2. Dangol, arXiv:2608.20426 : capacité de conservation topologique (pilote R7-A).
3. Dillavou *et al.*, PNAS doi:10.1073/pnas.2604421123 : double descente dans la
   matière.
4. Wang, arXiv:2607.26648 : plafond de sparsité (NH-81).
5. Schweiger *et al.*, bioRxiv doi:10.64898/2026.10.11.758231 (PULSE) : le
   wetware sélectionne plutôt qu'il ne crée.

## Hypothèses déjà faites ailleurs (à ne pas revendiquer comme neuves)

- **« Le rêve comme rejeu génératif interne d'un réseau à énergie limite
  l'oubli »** : fait sur Hopfield avec EqProp (Cook *et al.*, 2610.37139), avec
  comparaison à la consolidation de type sommeil (SRC).
- **« Variable volatile + variable consolidée dérivées d'une seule énergie »** :
  Liu & Grollier (2610.18058).
- **« Conservation ⇒ mémoire » dans les substrats physiques** : testé et
  **réfuté** (Dangol, 2608.00097).
- **« La sparsité des impulsions donne un gain d'énergie pour les LM »** :
  réfuté pour les récurrents (plafond ~50 %, 2607.26648). Seuls la perception et
  l'attention y échappent.
- **« Les organoïdes apprennent une politique nouvelle »** : PULSE montre un
  recrutement de motifs spontanés. L'effet du cart-pole (Cell Rep. 2026, déjà
  cité ailleurs) ne persiste pas après 45 min.
- **« Métacognition / introspection des LLM »** : le nul de cohérence de sortie
  (2609.33886) et le critère d'accès privilégié (2609.00904) existent déjà.
  Hypneum doit les appliquer, pas les réinventer.
- **« Mémoire de la matière sans poids (hystérésis, point de retour) »** :
  hystérons fluidiques et quasicristaux (2607.15122, 2607.12674).
- **« Calcul par relaxation vers l'équilibre »** : démontré sur ADN (Nature,
  doi:10.1038/s41586-026-10996-5).
- **« Seuil de sensibilité des mises à jour contre l'oubli dans les réseaux
  physiques »** : Chatterjee, Guzman, Liu, arXiv:2512.03799 (seuil dur → modularité
  spatiale).

## Limites

Je n'ai lu que les résumés. Les DOI bioRxiv et Crossref ont été vérifiés, les
textes intégraux non. OpenReview et Semantic Scholar n'ont pas été exploités
(Semantic Scholar en 429). Les recherches arXiv sur le CKA et le TOST pendant la
fenêtre de limitation de débit ont été faites via Exa puis vérifiées une par une.
Beaucoup d'entrées sont des prépublications d'auteur unique (Dangol, Stojnic,
Wang, Berloff, Ulus) : à pondérer en conséquence.
