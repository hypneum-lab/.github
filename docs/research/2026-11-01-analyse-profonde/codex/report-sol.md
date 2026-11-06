# Relecture indépendante — Hypneum Lab

**Date de coupe : 1er novembre 2026. Relecteur : Codex / sol.**

Le portefeuille contient des instruments logiciels intéressants, des expériences négatives utiles et une réplication numérique substantielle. Il ne justifie actuellement ni une théorie générale de la consolidation, ni un avantage énergétique neuromorphique, ni une limitation quantique de classification déduite de la borne de Holevo. **Aucun des manuscrits principaux n'est soumettable tel quel.** Le dossier ReScience est le plus proche d'une soumission ; la note méthodologique et un article de résultats négatifs sur les solveurs constituent des contributions plausibles après révision.

Échelle : **BLOQUANT** = invalide une conclusion centrale ou empêche la soumission ; **MAJEUR** = change l'interprétation, le protocole ou la portée ; **MINEUR** = correction locale ; **OK** = proposition vérifiée dans son périmètre. « Non vérifié » ne signifie ni faux ni introuvable.

Méthode et limites : lecture intégrale du corps des manuscrits expressément demandés, de leurs conclusions, annexes textuelles et bibliographies ; confrontation aux sources de code citées et aux artefacts disponibles. Les versions bibliographiques supplémentaires sont inventoriées séparément. Les journaux `git log --since=2026-10-24` des dix dépôts et sept PR brouillons ont été examinés. Aucun entraînement lourd, accès distant aux machines ni résultat encore aveuglé n'a été déclenché. Les recalculs indépendants portent sur les CSV/JSON déposés, des statistiques appariées et des contre-exemples analytiques. La présence d'un JSON n'authentifie pas à elle seule le déroulement du calcul. Les sorties brutes et scripts d'audit sont conservés à côté de ce rapport.

**Aveugle.** Les sections 1–4 sont écrites et conservées dans un instantané avant toute ouverture de `.github/docs/research/`. Les manuscrits, ADR et le plan méthodologique contiennent déjà des conclusions, des citations et des comptes rendus de relectures antérieures : un aveugle à ces mentions indirectes est impossible tout en lisant le corpus demandé. Je n'ai pas consulté les anciens rapports de relecture pour produire les sections 1–4. Les constatations ci-dessous reposent sur les pièces indiquées et mes vérifications ; une comparaison après levée de l'aveugle est réservée à la section 5.

## 1. État des lieux par dépôt

| Dépôt / HEAD audité | État scientifique au 01/11 et changements depuis le 24/10 |
|---|---|
| `dream-of-kiki` — `8a7e8468` | Cadre de contrats de consolidation et deux papiers encore largement historiques. Pilotes LLM antérieurs invalidés par un corpus de secours et train = évaluation. NH-03 fournit maintenant une ablation de calendrier convaincante sur petit MLP. E1-small n'est pas déposé OSF et a perdu son statut confirmatoire après exposition aux résultats. Les brouillons H12–H14 restent des protocoles, pas des résultats. **BLOQUANT** pour les papiers actuels. |
| `nerve-wml` — `fee6abab` | Protocole de messages discrets intermodules, nombreuses corrections de portes, d'ablations et de figures ; expériences de transmission intéressantes. N10-C a deux ruptures d'aveugle déclarées et une analyse indépendante mal adaptée à des bras appariés. NH-01 et son ablation diagonale sont plus solides que les extrapolations sur PRH. **MAJEUR** : réécriture de portée et validation externe. |
| `kiki-flow-research` — `8470e93a` | Anciennes identifications « proximal = JKO » retirées ; solveur implicite certifiant une stationnarité, pas un minimum global. M5 échoue à sa règle primaire : 50/60. Lie et Strang ne sont pas substituables ; ordre non identifiable. Résultats récents absents du récit central des deux papiers. **BLOQUANT** pour les garanties annoncées. |
| `micro-kiki` — `61056d9d` | Démonstrateur multi-LoRA, routage et benchmarks limités mais auditables. Énergie auparavant estimée présentée comme mesurée, retirée ; NH-81 ne montre pas d'économie sur les deux Apple examinés. Article A : diagnostic négatif du VQC, mais théorème Holevo mal appliqué et conclusion non corrigée. Article système : causalité MoE/orthogonalité non établie. **BLOQUANT / MAJEUR**. |
| `micro-kiki-quantum` — `236239fe` | Dépôt archivé, ajout récent de déclaration d'assistance IA. Simulations QMoE/HyQuT et démonstration scalaire appelée QPEFT ; aucun manuscrit `.tex` ou `.bib` autonome. Le score QMoE est calculé sur l'entraînement. **À maintenir archivé** sans nouvelle preuve indépendante. |
| `bouba_sens` — `6f224d17` | Instrument ayant révélé surtout ses propres défauts : non-apprentissage, seuil B-3 non calibré, changement de monde entre phases, tenseurs historiques perdus. ADR-0026 apporte une étude de calibration ; ADR-0027 qualifie l'ensemble historique. ActionSense v0.7 est gelé localement ; ADR-0025 de verdict n'existe pas dans ce clone. **BLOQUANT** pour le papier actuel. |
| `baby-brain` — `376fe838` | Architecture et harnais ontogénétique implémentés ; le papier annonce honnêtement E0–E4 non exécutés. Trois anciennes portes ont été requalifiées. Le mécanisme de plasticité dépend de l'optimiseur, et les comparaisons proposées confondent curriculum et portes. **Protocole à corriger avant campagne**. |
| `BabyBrain` — `86f1a9f0` | Application SwiftUI de supervision/cockpit ; pas un second jeu d'expériences, ni un manuscrit scientifique indépendant. Les écrans et flux de télémétrie ne valident pas l'ontogenèse. **OK** comme logiciel auxiliaire. |
| `rescience-nh01` — `f6e97fd6` | Article complet, réplication qualitative à N ≤ 1 000 et reproductions internes des cellules. Limites et censure thermique sont assez bien reconnues. Le résultat n'est pas une reproduction exacte des figures originales à N = 5 000. Ablation diagonale du 31/10 à intégrer ou citer. **Le plus proche d'une soumission**, après corrections ciblées. |
| `paper-methodo-2026` — `01d76c8b` | Squelette de 88 lignes, trois sections rédigées, deux plans ; aucune étude d'efficacité de la chaîne. Corpus d'errata potentiellement publiable comme retour d'expérience. Comptages, empreinte ActionSense, durée de fenêtre et formulation NH-01 à corriger. **Pas soumettable aujourd'hui**. |

Les sept PR brouillons n'ajoutent aucune confirmation aux branches auditées : [N10-D #100](https://github.com/hypneum-lab/nerve-wml/pull/100), [NH-01 tailles #90](https://github.com/hypneum-lab/nerve-wml/pull/90), [nul B-3 au niveau réseau #66](https://github.com/hypneum-lab/bouba_sens/pull/66), [préregs Bouba #9](https://github.com/hypneum-lab/bouba_sens/pull/9), [réplications NH-81 #19](https://github.com/hypneum-lab/micro-kiki/pull/19), [E1-small #68](https://github.com/hypneum-lab/dream-of-kiki/pull/68), [H12–H14 #41](https://github.com/hypneum-lab/dream-of-kiki/pull/41). Le corps de #19 contient toutefois une mesure M3 Pro réelle, à distinguer de sa réplication RTX 4090 encore attendue. Le corps de #68 est plus ancien que l'amendement E1-small du 30–31/10 : le statut actuel vient de ce dernier.

## 2. Lecture des papiers et confrontation aux preuves

### 2.1 `dream-of-kiki` — Paper 1

**Condensé section par section.** Source intégrale : `dream-of-kiki/docs/papers/paper1/build/full-draft.tex`.

| Section | Contenu et lecture critique |
|---|---|
| Résumé, l.116 | Présente quatre primitives et profils de rêve, un critère de conformité et un pilote Split-MNIST ; mêle validation de logiciel et efficacité cognitive. |
| Introduction, l.180 | Motivation par sommeil, apprentissage continu et indépendance au substrat ; le passage de l'analogie biologique au contrat informatique est proposé, non démontré. |
| Background, l.282 | Quatre piliers : replay, homéostasie, recombinaison, restructuration ; ce sont des rapprochements de mécanismes distincts, pas une dérivation commune. |
| Framework C, l.382 | Définit états, ressources, invariants, profils et axiomes DR ; les preuves portent principalement sur des choix de définitions. |
| Conformité, l.534 | Tests et injections de fautes ; utile pour vérifier un protocole logiciel, ne garantit pas que les mesures capturent la consolidation. |
| Méthode, l.674 | H1–H4, seuils, budgets et règles ; informations contradictoires entre test annoncé et analyse du pilote. |
| Pipeline/résultats, l.812 | Registre, validation cross-module héritée de Nerve, 15 lignes Split-MNIST issues de trois graines ; valeurs numériques reproductibles, inférence trop large. |
| Discussion, l.1068 | Rattache les résultats au sommeil et à une architecture générale ; conserve des formulations « passed » et des comparaisons désormais dépassées. |
| Futur, l.1238 | Extension à d'autres substrats et grands modèles ; certaines tâches sont déjà revendiquées ailleurs dans le même papier. |
| Références/notes, l.1330–1410 | Assemblage non harmonisé : annotations de révision et informations de provenance ne sont pas toutes propagées au corps. |

**BLOQUANT — la classe admissible n'est pas un semi-groupe.** La preuve actuelle exclut tout mot contenant RESTRUCTURE avant REPLAY (`docs/proofs/dr2-compositionality.md:23`, `:118`). Les mots d'une lettre `RESTRUCTURE` et `REPLAY` satisfont chacun [P] ; leur concaténation dans cet ordre ne la satisfait pas. La classe [P] n'est donc pas fermée par concaténation. Le semi-groupe libre des mots formels existe, mais sa sémantique ne devient pas une action totale sur les états lorsque des compositions échouent. Une sémantique d'opérations partielles/typées est possible ; elle requiert une autre proposition. L'associativité de fonctions, vérifiée, ne répare pas ce défaut. La « closure » écrite `π ∈ Op ⇒ π ∈ Op` n'est pas la fermeture binaire à démontrer (`docs/proofs/dr2-compositionality.md:131`). Les affirmations de libre semi-groupe du papier (`build/full-draft.tex:259`, `:452`) restent excessives, même si DR2 limite ensuite sa portée (`:472`).

**MAJEUR — inclusion de choix ≠ monotonie de l'algorithme.** Si A ⊂ B et l'on peut ignorer les opérations supplémentaires, `sup_{b∈B} U(b) ≥ sup_{a∈A} U(a)` est immédiat. Cela ne prouve ni une meilleure utilité moyenne du profil B, ni une trajectoire plus sûre à budget identique. C'est la portée réelle de `docs/proofs/dr4-profile-inclusion.md:64`, comparée à la monotonie attendue dans `build/full-draft.tex:491`. La procédure de sélection, son coût et le risque des opérations supplémentaires doivent figurer dans le résultat.

**MAJEUR — trois unités indépendantes, pas quinze.** Le CSV `experiments/h1_split_mnist/results_h1_v2.csv:1` reproduit le t ligne par ligne : `t=2,523864`, p unilatéral `0,012159`. Les cinq expériences d'une même exécution partagent l'entraînement ; les traiter comme 15 réplications indépendantes donne une précision mal justifiée. En agrégeant d'abord par graine, l'amélioration baseline − P_equ vaut 0,07383, avec t à deux degrés de liberté 10,55, p unilatéral 0,00443 et IC t 95 % [0,04371 ; 0,10394]. **Cette correction ne fait donc pas disparaître mécaniquement la significativité sous un modèle gaussien de graines.** Avec seulement trois graines, ce modèle n'est pas testable ; le plus petit p exact par permutation des signes est 1/8 = 0,125. Le pilote reste exploratoire. Le texte annonce Welch puis utilise un t apparié (`build/full-draft.tex:719`, `:965`), et H2 change de sens entre l'hypothèse et la discussion EWC (`:692`, `:1036`).

**MAJEUR — conformité et reproductibilité surinterprétées.** Un hash des paramètres d'entrée n'est pas un hash des sorties ni une réplication de l'exécution (`build/full-draft.tex:907`). La conformité exige S1 mais décrit surtout S2/S3 dans le substrat SNN (`:638`). Les profils/versions et l'état d'implémentation varient entre tableaux et récit. La réduction de l'EWC à une primitive de restructuration/downscale doit être opérationnalisée : pénaliser une dérive de paramètres n'est pas automatiquement faire de l'homéostasie biologique.

**BLOQUANT — les expériences historiques ne valident pas les grands modèles.** Le papier reconnaît le secours synthétique (`build/full-draft.tex:110`, `:749`) mais conserve des annonces de validation/confirmation dans le résumé et la discussion (`:156`, `:1100`). Le correctif courant décrit des jeux de secours de 20 lignes recyclées, avec train = évaluation, pour des pilotes 1,5B/7B (`STATUS.md:3`). Ces données ne sont pas récupérables comme preuve en augmentant N ou en changeant le test. La validation Nerve importée (`build/full-draft.tex:923`) repose aussi sur une ancienne tête de lecture ; elle ne constitue ni une réplication indépendante d'équipe, ni une validation de la consolidation.

**État actuel des préregs et résultats.**

- **OK, à portée limitée — NH-03.** Le plan initial compare à nombre d'écritures égal des fast weights supervisés avec des épisodes sur poids lents ; il ne teste pas le TTT auto-supervisé des grands modèles (`docs/milestones/2026-10-25-nh03-ttt-vs-episodes.md:53`). Le facteur calendrier était confondu avec la cible des écritures ; l'ablation 2×2 ultérieure corrige cette question (`docs/milestones/2026-10-27-nh03-schedule-ablation.md:1`). J'ai vérifié les contrastes `R=(LB+LS−EB−ES)/2`, `S=(ES+LS−EB−LB)/2` à partir des 300 cellules et 30 graines du fichier `docs/results/2026-10-30-nh03-deferred-eval.json:1`. Pour le bras TTT : R(d0)=18,5522 ; R(d1)=12,7363 ; R(d3)=14,6454 points de rétention ; S(d3)=−0,8919. Les moyennes publiées sont exactes. Le résultat établit un avantage de calendrier dans ce montage, conservé à environ 79 % à d3 ; pas un avantage général du sommeil ou des épisodes. Le délai comprend une tâche interférente et de l'entraînement des poids lents (`docs/milestones/2026-10-30-nh03-deferred-eval.md:72`) : il n'isole pas le temps écoulé. Écritures égales ≠ FLOPs égaux ; un avantage « a fortiori à FLOPs égaux » ne suit pas sans courbes budget/performance.
- **BLOQUANT pour une lecture confirmatoire — E1-small.** Le gel local et la déviation « démarrer avant dépôt OSF » sont documentés (`docs/osf-filing/e1-small/FILING-NOTE.md:1`, `docs/milestones/e1-small/deviation-run-before-osf-2026-10-29.md:1`). L'amendement reconnaît ensuite une lecture de moyennes partielles sur 266/1 410 cellules avant la décision d'abandon 35B ; son addendum requalifie H14-A/B/C en exploratoire (`docs/osf-amendment-e1-small-2026-10-30.md:58`, `:102`). Il serait incorrect de le présenter comme confirmation aveugle sous préenregistrement OSF. Je n'ai consulté aucun résultat vivant pour cette campagne.
- **MAJEUR — nouveaux brouillons.** G4-nono, DR3 relational et E1 35B demandent des contrôles plus pertinents, mais leurs résultats n'existent pas ici. Des non-rejets historiques ne démontrent pas que la recombinaison est inutile : il faut une marge d'équivalence, une borne d'effet et une puissance justifiée. Le chemin demandé `dream-of-kiki/docs/prereg/` n'est pas le répertoire effectif de ces textes : ils sont répartis entre `docs/osf-prereg-*.md`, `docs/osf-filing/` et les milestones.

### 2.2 `dream-of-kiki` — Paper 2

Source : `dream-of-kiki/docs/papers/paper2/build/full-draft.tex`, lu intégralement.

| Section | Condensé |
|---|---|
| Résumé, l.119 ; introduction, l.141 | Présente le pont de conformité MLX/SNN et un pipeline commun ; la portée reste un test de contrats. |
| Background, l.228 | Reprend primitives et structure algébrique du Paper 1 ; hérite du problème de fermeture. |
| Conformité, l.282 | Décompose les critères et incidents ; couverture empirique plus étroite que la liste de garde-fous. |
| Architecture, l.399 | Registre de substrats, budget, CLI et hachage ; bonne organisation logicielle, pas une équivalence de systèmes appris. |
| Méthode, l.475 | Décrit explicitement l'usage du même mock Python derrière les deux enregistrements. |
| Résultats, l.529 | H1–H4 et accord 4/4 sur cette exécution synthétique commune ; les contrôles ne créent pas une deuxième expérience. |
| Discussion, l.700 ; futur, l.753 | Limites reconnues et déploiements envisagés ; l'ambition du résumé doit être ramenée à ce périmètre. |
| Références/notes, l.790–889 | Assemblage historique avec sources de matériel et de versions à mettre à jour. |

**BLOQUANT comme article de validation cross-substrat autonome.** Le même mock derrière deux noms produit structurellement le même résultat (`build/full-draft.tex:110`, `:203`, `:500`). Cela vérifie le câblage du registre ; cela ne montre pas que deux mécanismes neuronaux différents réalisent les mêmes invariants ou performances. Une auto-équivalence de profils ne teste pas l'équivalence statistique de deux interventions indépendantes. Le papier est fusionnable dans une section d'artefacts du Paper 1.

**MAJEUR.** Le libre semi-groupe reste annoncé (`build/full-draft.tex:148`, `:235`, `:429`). Les gardes S1–S4 (`:291`) et les tests réellement décrits (`:345`) doivent être mis en correspondance explicite. R1 ne hache encore que les entrées (`:459`). Davies 2018 concerne Loihi, et ne documente pas à lui seul Loihi 2 (`:377`, `:746`). Les comparaisons de substrats doivent utiliser des implémentations distinctes, un test de parité non tautologique et une marge d'équivalence préspécifiée.

### 2.3 `nerve-wml` — Paper 1, N10-C et NH-01

Source principale : `nerve-wml/papers/paper1/main.tex`, l.1–1114 ; les résultats récents sont dans `docs/milestones/` et `docs/results/`.

| Section | Condensé |
|---|---|
| Résumé/introduction, l.55–68 | Protocole neuroletters et polymorphisme ; rapprochement avec PRH et communication cérébrale. |
| Travaux liés, l.69 | Predictive coding, VQ, alignement de représentations, communication discrète ; plusieurs antériorités récentes sont déjà présentes. |
| Méthode, l.151 | Alphabet, routage/priorité, MLP/LIF/Transformer ; la comparaison dite à capacité égale n'égale que certaines dimensions. |
| Expériences, l.215 | Portes P/W/M, tâches et accords ; les tests d'intégration ne suffisent pas à établir une utilité causale. |
| Scaling, l.287 | Quatre tailles de pool et quelques graines ; variation réelle, aucune identification d'une limite asymptotique positive. |
| Menaces, l.327 | Reconnaît bruit et dépendance à la taille ; le mot « intrinsèque » dépasse les observations. |
| Transmission, l.365 | Séries de mesures MI, MNIST/EEG, têtes de lecture et VQ ; section ajoutée volumineuse, métriques et protocoles différents à séparer. |
| Reproductibilité, l.827 | Code/tests/version ; pas de preuve que toutes les expériences de recherche sont reproduites en CI. |
| Interprétabilité, l.841 | Alphabet et entropie spectrale ; absence de validation sémantique ou causale complète. |
| Intégrations, l.861 | Applications aux autres dépôts ; les résultats d'un même écosystème ne sont pas des réplications externes. |
| Limites/futur, l.928–1114 | Plusieurs réserves utiles et rétractation d'ablations N-3 ; des limites devenues périmées contredisent les nouvelles sections. |

**BLOQUANT pour la validité externe EEG — le split réel contredit sa description.** `_split_per_subject` est documenté « time-respecting, no shuffle leak », puis exécute `rng.permutation(n)` et répartit les époques d'un même sujet dans train/validation/test (`scripts/eeg_preprocess_sleep_edf.py:113`, `:123`). Tous les sujets sont ensuite concaténés dans chaque partition (`:156`, `:184`). Ce n'est pas un test sur patients tenus à l'écart, et des époques voisines peuvent traverser les partitions. Le résultat peut décrire une interpolation intra-sujet ; il ne valide pas la généralisation inter-sujets. Les IC par époque et des z extrêmement grands ne remplacent pas des réplications par sujet. Avant soumission : split par sujet/nuit, normalisation apprise sur train, sélection sur validation, évaluation finale unique et IC groupés par sujet.

**MAJEUR — même largeur ≠ mêmes paramètres.** Le texte revendique une capacité appariée (`papers/paper1/main.tex:193`). Les constructeurs MLP et LIF possèdent des nombres de couches/têtes différents (`track_w/mlp_wml.py:54`, `track_w/lif_wml.py:50`). Pour d=16, entrée d=16 et les couches visibles, le décompte complet donne environ 4 288 paramètres contre 2 384 ; le sous-ensemble effectivement optimisé doit également être compté. Il faut comparer à paramètres, calcul, données et procédure de sélection identifiés, puis présenter la largeur comme un facteur distinct.

**MAJEUR — l'alignement n'est pas la transmission ni son utilité.** Deux modules reçoivent les mêmes stimuli et cibles ; une MI ou CKNNA élevée peut provenir de cette cause commune. Des centaines de paires de modules partagent quelques graines et ne deviennent pas des centaines de réplications indépendantes. La VQ ne peut pas augmenter l'information mutuelle vraie par transformation déterministe : `I(q(A);q(B)) ≤ I(A;B)`. Des valeurs normalisées avant/après, ou estimées par méthodes différentes, ne contredisent pas cette inégalité. Le fait qu'une estimation continue dépasse l'entropie d'un code discrétisé n'est pas une preuve d'échec de KSG (`main.tex:582`). MINE fournit un objectif de borne inférieure en population ; son estimation après entraînement du critique demande une évaluation tenue à l'écart. Son accord avec une autre estimation n'est pas une certification de la MI vraie.

**OK, limité.** La transmission mesurée de messages discrets sous le protocole courant, avec ratio de rétention d'information autour de 0,924 et IC [0,892 ; 0,954], décrit un canal fonctionnel dans ce montage (`main.tex:809`). Un canal sans bruit, dont le décodage réussit, ne démontre pas que gamma/thêta ou la constellation sont indispensables : il faut leur ablation à débit, largeur et calcul comparables.

**MAJEUR — limites théoriques et signes biologiques.** Les résultats à N=2/16/32/64 ne prouvent pas un plancher de divergence non nul (`main.tex:327`, `:359`). Les changements de tête et d'hyperparamètres altèrent fortement les ratios ; ce sont des effets de procédure avant d'être des lois d'architecture. La correspondance « prédictions gamma superficielles / erreurs alpha-thêta profondes » attribuée à Bastos inverse le schéma feedforward/feedback canonique (`main.tex:74`) ; la référence décrit principalement erreurs ascendantes superficielles/gamma et prédictions descendantes profondes/basses fréquences. La séparation fréquentielle d'un protocole est un choix d'ingénierie, pas cette observation biologique. Un MLP à couches ReLU n'a pas de plafond structurel XOR à 0,52 (`main.tex:770`) : l'échec d'optimisation d'un montage n'est pas une impossibilité d'expression.

**MINEUR à MAJEUR — entropie et cohérence du récit.** L'entropie spectrale utilisant `σ²/Σσ²` et un logarithme naturel est une mesure en nats ; ce n'est pas exactement la définition Roy–Vetterli avec singular values normalisées (`main.tex:1030`, `refs.bib:128` ; implémentation en nats dans `nerve-wml/scripts/synchrony_alternatives.py:35`). Le facteur 4 entre d=32 et 128 n'est pas « deux ordres de grandeur » (`main.tex:751`). Les comparaisons chiffrées MLP/LIF et la phrase de supériorité stable ne concordent pas partout (`main.tex:748`).

**OK — rétractation N-3 ; MAJEUR pour tout recyclage de sa conclusion.** Les bras prétendument ablatés ne recevaient aucun message, et la consolidation n'était pas appliquée : 0/30 cellules pertinentes (`main.tex:970`, `:985`, `:994`). Cette expérience ne montre ni nécessité ni inutilité de la consolidation ; l'erratum est adéquat, les anciens résultats ne doivent pas subsister comme argument ailleurs.

**N10-C.** L'amendement décrit deux ruptures d'aveugle, dont une décision prise après lecture d'une mesure d'entraînement (`docs/milestones/n10c-procgen-multiagent-gtm-comm-amendment-2026-10-30.md:12`). Depuis l'initialisation commune des bras, le test enregistré Welch indépendant ne correspond plus au contraste naturel apparié par tronc/graine (`:40`). Il faut amender avant lecture finale, rapporter les deux analyses et définir la famille de comparaisons. Avec six graines et trois contrastes corrigés, le protocole bis indique environ 18,4 % de puissance pour d=1 et un effet standardisé voisin de 2,19 pour 80 % ; neuf contrastes aggravent encore ce problème (`docs/milestones/2026-10-25-n10c-bis-control-arms.md:165`). Un non-rejet sera peu informatif. Les contrôles misrandom, sans communication et VQ doivent tester le contenu causal du canal ; les modifications successives après pilotes ne sont pas une confirmation aveugle de la conception initiale. N10-D #100 reste un squelette L0.

### 2.4 `kiki-flow-research` — article principal

Source : `kiki-flow-research/paper/main.tex`, l.1–976.

| Section | Condensé |
|---|---|
| Introduction, l.46 | Propose un champ de quatre espèces cognitives et une dynamique à plusieurs échelles. |
| Background, l.76 | Dell/Levelt/Baddeley, transport optimal, gradient flows et JKO ; analogies cognitives et garanties mathématiques doivent rester distinctes. |
| Modèle, l.170 | Énergie, interactions symétriques/antisymétriques, topologies et monotonie empirique ; la classe de mesures et les facteurs du couplage ne sont pas cohérents partout. |
| Implémentation, l.299 | Chemins rapide/dit rigoureux et split ; plusieurs chemins ont changé après les premières figures. |
| Expériences, l.337 | Moments, runtime, profils, couplages, énergie, transport entropique, proxy CL, LLM et latence. Beaucoup de figures décrivent des versions historiques. |
| Discussion, l.824 | Reconnaît des résultats négatifs et certaines limites ; les arguments Hessienne/convexité/contraction dépassent encore les preuves. |
| Conclusion, l.947 | Cadre et performances ; doit être remplacée par une conclusion sur les modèles et solveurs effectivement mesurés. |

**BLOQUANT — énergie déclarée et énergie calculée différentes.** L'équation du papier contient `½ Σij Jsym,ij ⟨ρi,ρj⟩` (`paper/main.tex:184`). Le code additionne la somme complète sans ½ et différencie en `2 Jsym ρ` (`kiki_flow_core/track2_paper/paper_f.py:88`, `:153`). Pour J symétrique, la dérivée de l'énergie écrite dans le papier est `Jρ` ; celle du code est `2Jρ`. On peut absorber ce facteur dans une convention sur J, mais il faut le faire explicitement partout, y compris paramètres, Hessiennes et comparaisons. Les antisymétries s'annulent effectivement dans une forme quadratique scalaire : ce point de l'analyse est correct (`paper/main.tex:198`). Une composante antisymétrique non conservative doit être définie comme une dynamique supplémentaire, pas attribuée à cette énergie.

**MAJEUR — classe de mesures et garanties.** W₂ s'applique ici à des mesures positives de masse fixée, pas à des « signed measures » générales (`paper/main.tex:173`). Trois trajectoires et une régression de log-distance ne démontrent pas une monotonie globale en λ, une unicité d'équilibre ou une vitesse uniforme de convergence (`:245`). Une Hessienne positive dans les coordonnées d'un simplexe n'implique pas à elle seule la convexité géodésique de déplacement, ni une inégalité log-Sobolev de Bakry–Émery (`:853`). Il faut préciser espace, métrique, domaine et hypothèses, ou présenter ces nombres comme diagnostics finis.

**BLOQUANT pour l'ancienne interprétation JKO.** Le texte reconnaît maintenant que l'ancien split ne réalisait pas le problème JKO annoncé (`paper/main.tex:471`). Une diminution de F et une proximité entre deux codes partageant une mauvaise sous-routine ne corrigent pas cette identification. Les résultats « 67,79× », KL rapide/rigoureux et figures antérieurs doivent chacun être rattachés à leur version, sans les assembler avec le nouveau solveur comme s'il s'agissait de la même méthode. Le prox de F et la minimisation de `F(q)+OT(q,ρ)/(2h)` sont des problèmes différents.

**MAJEUR — contrôle tautologique et spécialisation imposée.** L'ablation full/symmetric produit les mêmes nombres parce que le drift antisymétrique n'est pas appliqué dans cette branche (`paper/main.tex:509`). Elle n'établit pas l'inutilité de la hiérarchie. Les potentiels V imposent déjà des préférences spatiales ; la bonne référence est Gibbs `π∝exp(−V)`, pas l'uniforme. Le déficit d'excès de spécialisation proche de −0,39 est compatible avec l'absence d'émergence supplémentaire, et non une découverte de modules spontanés. Les topologies Dell/Levelt ne sont pas parfaitement appariées en norme ; leurs écarts ne sont pas exclusivement des effets de directionnalité.

**MAJEUR — résultats CL sur LLM.** J'ai recalculé les différences appariées de cinq graines à partir de `bench/cl_llm/runs/e3_5k_5seeds_summary.json:1` et `bench/cl_llm/runs/e4b_5seeds_summary.json:1`. SST-2 : différence moyenne de forgetting de 0,03435, IC t 95 % [−0,02202 ; 0,09073], t=1,692, p bilatéral=0,166. CoLA : 0,01957, IC [0,00645 ; 0,03269], t=4,141, p=0,0144, non corrigé pour les autres essais. Le ratio « gain / SD du baseline » ne teste pas un effet apparié (`paper/main.tex:783`). Le mécanisme utilise en outre un substitut/prior uniforme plutôt qu'une sortie validée du Flow sur ces données (`:718`, `:776`). Il faut rapporter l'exactitude finale et l'apprentissage immédiat, pas seulement l'oubli : une tâche moins apprise peut mécaniquement moins être oubliée. La latence de 0,04 ms avec encodeur stub et 500 requêtes n'est pas une mesure de service LLM complet (`:800`).

**Résultats M5 actuels — OK pour le décompte, échec pour la règle.** J'ai recompté les 96 configurations uniques de `results/implicit_jko_certified_2026_10_27/m5_pooled_20261030/certify_pooled.jsonl:1` :

| γ | Trajectoires certifiées sur trois pas / 12 |
|---|---:|
| 0 / 5 | 12 / 12 pour chaque γ |
| 10 / 20 / 30 | 11 / 10 / 5 |
| 50 / 70 / 100 | 3 / 3 / 1 |

La strate primaire γ≤30 totalise **50/60** ; tous γ confondus, **57/96**. La règle exigeant zéro échec est donc **FAILED** (`docs/results/2026-10-30-m5-certify-verdict.md:1`). F décroissante sur les pas achevés ne transforme pas les échecs en certifications. Le certificat contrôle des résidus/stationnarité du problème entropique discret ; il ne certifie pas un minimum global non convexe ou la solution d'un PDE continu. Le rejeu secondaire a **38/39 cas terminés** à la coupe : 10 cas certifiés avec plus de budget, dont 4 des 10 échecs primaires ; le cas restant dépasse 28 h (`results/m5_secondary_2026_10_30/ANALYSIS.md:1`). Ce diagnostic secondaire n'efface pas le verdict primaire ; les catégories « plancher de précision », « stagnation », « budget » sont en partie post hoc.

**Lie / Strang — OK pour une conclusion négative circonscrite.** Le résumé archivé `results/jko_splitting_2026_10_30/confirm/summary.json:1` donne :

| Critère | Lie | Strang |
|---|---:|---:|
| Verdict de substitution | non substituable | non substituable |
| Échecs C1, certification primaire | 14 | 8 |
| Échecs C2, proximité à la référence | 2 | 11 |
| Échecs C3, dissipation/brackets | 30 | 25 |
| Configurations stress « sauvées » | 0 | 3 |
| Ratio médian temps de solveur X/S, cas comparables | 0,0652 | 0,2155 |
| Cellules admissibles pour identifier l'ordre | 0 | 0 |

Les vitesses sont conditionnelles aux configurations où les deux premiers pas certifient ; elles ne constituent pas un gain à qualité égale sur toute la grille. L'ordre est **non identifiable**, sans preuve d'ordre 2 ni réfutation générale de Strang. La préreg révisée l'explique correctement (`docs/prereg/2026-10-30-jko-splitting-lie-strang.md:196`, `:273`). Vérification à la main : avec B=0 et un sous-pas Euler implicite scalaire A=−a, la composition Strang vaut `(1+ha/2)^−2 = 1−ha+¾h²a²+O(h³)`, contre `exp(−ha)=1−ha+½h²a²+…`. Le défaut local est O(h²), donc ordre global 1 en général. Le palindrome ne suffit pas. Sur une grille fixe de 16 sites et ε=h², le pinning et le changement de régularisation des demi-pas empêchent aussi de lire automatiquement un ordre de PDE. La déviation `os.nice` et la relance sont déclarées ; les anciennes erreurs de jobs doivent rester dans la provenance.

### 2.5 `kiki-flow-research` — papier workshop

Sources intégrales : `paper/workshop/main.tex` et `section_1_intro.tex` à `section_6_discussion.tex`.

| Section | Condensé |
|---|---|
| Résumé/introduction | Conditionner un champ à quatre espèces sur une requête textuelle, via un prédicteur JEPA et une énergie variationnelle. |
| Related work | FEP, active inference, JEPA, transport et langage ; liens souvent analogiques. Sept clés citées n'existent pas dans le `.bib`. |
| Method overview | 4 distributions sur 32 bins, requête → encodeur → initialisation → Flow ; l'état est un produit de simplexes, pas un seul simplexe de 128 probabilités. |
| Method | Énergie KL + erreur de prédiction + couplage, gradient et encodeurs ; une dérivée n'est correcte que pour J symétrique. |
| Experiments | Comparaison petit corpus puis corpus étendu, coût KL, labelers et graines ; le « MiniLM distillé » est un petit modèle sur bigrammes de caractères. |
| Discussion | Robustesse, coût et interprétation cognitive ; écarts numériques et vocabulaire probabiliste à corriger. |

**BLOQUANT pour le cas J asymétrique annoncé — gradient faux.** Pour `E_J=λ Σij Jij ⟨ρi,ρj⟩`, la dérivée est `λ(J+Jᵀ)ρ`, pas `2λJρ`. Le papier écrit la seconde formule (`paper/workshop/section_4_method.tex:41`) et le code la calcule (`kiki_flow_core/track3_deploy/query_conditioned_f.py:99`), alors que la valeur additionne le J non symétrisé (`:75`). Contre-exemple sur deux espèces/deux bins : J=((1, 0.6), (0.1, 0.7)), ρ₁=(0,2 ; 0,8), ρ₂=(0,6 ; 0,4), λ=0,1. Dans la direction tangentielle (1 ; −1) sur ρ₁, différence finie = −0,106 ; formule du code = −0,096 ; formule symétrisée = −0,106. L'écriture matricielle explicite est fournie dans le JSON de contrôle. **Condition de portée : J vaut zéro par défaut dans le constructeur (`:48`) ; cette erreur ne suffit pas à invalider les expériences qui n'activent aucun couplage.** Les appels doivent montrer quel cas a réellement été mesuré.

**MAJEUR — état et interprétation.** Quatre vecteurs normalisés séparément ont somme totale 4 et dimension intrinsèque 4×31=124, pas Δ¹²⁷ (`paper/workshop/section_3_method_overview.tex:23`, `section_4_method.tex:103`). L'ordre canonique dans le code (phono, sem, lex, syntax) diffère de celui décrit dans le papier : les permutations de matrices/binning doivent être explicites. Une erreur `||g(E_q[z])−e||²` ou un réseau évalué sur un vecteur de probabilités n'est pas automatiquement `E_q[−log p(e|z)]` ; sans modèle conjoint/likelihood, « variational free energy » et « posterior inference » sont des interprétations, pas des identités. Softplus puis normalisation n'est pas une projection Wasserstein ni la résolution d'un pas JKO. L'affirmation qu'une dynamique euclidienne détruit nécessairement l'entropie n'est pas un théorème général.

**MAJEUR — ordre de grandeur de la robustesse faux.** Dans `paper/workshop/section_5_experiments.tex:90`, C=0,0736 et B=0,0738 : différence **0,0002**. Le texte de robustesse utilise 0,002 et un écart de huit SD ; avec SD=0,00025, la différence est **0,8 SD**, et non huit (`:137`). Sans les résultats appariés B/C, le classement n'est pas établi. Le changement de labeler 0,0736→0,0739 donne 0,0003, supérieur à 0,00025, contrairement à la phrase qui le dit inférieur (`:153`). Le label « distilled MiniLM » ne doit pas suggérer les capacités d'un MiniLM préentraîné si l'entrée est un histogramme de bigrammes entraîné ici (`:21`). L'ablation mesure une représentation et une cible de bins synthétiques ; elle ne valide pas encore un gain linguistique utilisable.

### 2.6 `micro-kiki` — Paper A v2 et annexe C5

Sources : `micro-kiki/docs/paper-a/paper-a-v2.tex:1` et `c5-info-bound.tex:1`, lus intégralement.

| Section | Condensé |
|---|---|
| Introduction/setup | Évaluer un VQC comme petit routeur sur embeddings, avec baselines classiques et contrôle downstream. |
| Tool, l.44 | Accélération d'un simulateur différentiable ; performance de logiciel classique, pas avantage matériel quantique. |
| Classifier, l.63 | VQC, PCA+classifieur et régression logistique ; résultats multi-graines défavorables au VQC. |
| Downstream, l.114 | 100 questions, routage oracle/aléatoire/VQC et juge LLM ; l'oracle ne franchit pas le seuil de gain choisi. |
| Discussion/related, l.154/167 | Limites et tentative de borne d'information ; une référence théorique ne porte pas l'assertion précise avancée. |
| Conclusion, l.173 | Conserve la borne 0,91 pourtant retirée du résumé. |
| Annexe C5 §§1–6 | Setup, Holevo, Fano, combinaison, vérification numérique et limites ; Fano est exploitable mais Holevo est appliquée au mauvais objet. |

**BLOQUANT — Holevo ne borne pas un vecteur d'espérances exactes par le nombre de qubits.** La borne correcte, pour une réalisation quantique reçue une fois et mesurée, est `I(Y;Z) ≤ χ = S(Σy p_yρ_y) − Σy p_y S(ρ_y) ≤ N`. Le papier remplace le résultat de mesure Z par des espérances analytiques exactes M (`c5-info-bound.tex:19`). Ces espérances sont obtenues par simulation ou un nombre de copies non borné. Contre-exemple : dix labels équiprobables encodés par dix angles distincts d'un seul qubit, donnant dix valeurs distinctes de ⟨Z⟩=cos θ. Le vecteur exact distingue tous les labels : I(Y;M)=log₂10≈3,322 bits, **supérieur à N=1**. Aucune violation de Holevo : M n'est pas le résultat d'une unique mesure sur un unique exemplaire. Avec m copies, la borne porte sur le système reçu, jusqu'à mN, et la précision/les shots doivent être comptés. [Source originale de Holevo](https://www.mathnet.ru/eng/ppi/v9/i3/p3).

**OK pour l'algèbre de Fano ; BLOQUANT pour son entrée numérique historique.** `H(Y|M) ≤ 1+P_e log₂(K−1)` entraîne `accuracy ≤ 1 − [H(Y)−I(Y;M)−1]/log₂(K−1)`, avec troncature aux limites triviales. Cette borne est lâche et devient non informative dans de nombreux régimes. Elle exige une **borne supérieure** sur la MI vraie ; une estimation kNN ponctuelle ou MINE n'en est pas une. `min(Î,N)` n'est valide que si N borne le canal concerné, ce qui manque ici. La somme de MI marginales à 150,74 bits n'est pas une MI jointe pour dix labels. Le code a été corrigé vers Ross joint et une troncature à H(Y) (`src/routing/info_bound.py`), mais le cache C5 n'a pas été recalculé et n'est pas une preuve d'une borne d'accuracy. Le résumé retire 0,911 (`paper-a-v2.tex:17`), la conclusion l'affirme encore (`:175`).

**MAJEUR — l'expérience négative est plus solide que l'explication théorique.** Les moyennes déposées donnent VQC 0,410±0,083, PCA-classique 0,658±0,039 et logreg 0,748±0,015 (`results/c3-c1-rerun.json:1`). Cela suffit à dire que ce VQC n'est pas compétitif dans ces réglages. Une projection apprise et une PCA de même dimension ne sont pas automatiquement à information égale ; une régression logistique n'est pas un plafond de Bayes. Du et al. 2020, théorème 4, concerne une simulation de circuits de type IQP et un décompte de portes, pas un plafond pour ce classifieur StronglyEntanglingLayers/Pauli-Z (`paper-a-v2.tex:169`, `c5-info-bound.tex:102`). [Article primaire APS](https://journals.aps.org/prresearch/abstract/10.1103/PhysRevResearch.2.033125).

**MAJEUR — « oracle sous +0,3 » n'établit pas l'inutilité populationnelle.** Recalcul apparié des 100 questions : oracle − aléatoire = +0,29, IC t descriptif 95 % [−0,132 ; +0,712], p bilatéral 0,176. Le point estimé ne franchit pas le seuil de +0,3 ; l'IC n'exclut pas un gain supérieur. VQC − aléatoire = −0,54, IC [−1,023 ; −0,057], p=0,0288 nominal. Les scores sont ordinaux et viennent d'un juge LLM unique ; les t ne sont donnés que comme contrôle de précision, à compléter par bootstrap/permutations sur questions et validation humaine. Le routage par persona ne constitue pas une expérience réelle avec tous les LoRA. « Confidently wrong » demande une mesure de confiance ; un score bas n'en fournit pas.

**MINEUR/MAJEUR — benchmark du simulateur.** L'annonce de 3 000× compare notamment paramètre-shift et rétropropagation classique/batching ; elle doit égaler les tâches et la précision. Les descriptions 400 échantillons×10 époques et 120×3 autour du même temps de 99 s ne concordent pas (`paper-a-v2.tex:46`, `:52`). Une simulation de six qubits manipule seulement 64 amplitudes ; elle ne prédit pas un avantage à grande échelle.

### 2.7 `micro-kiki` — article système

Source : `micro-kiki/paper/micro-kiki.tex`, corps et bibliographie intégrale.

| Section | Condensé |
|---|---|
| Introduction, l.56 ; related, l.85 | Système local spécialisé, routage et LoRA ; nombreuses antériorités récentes déjà citées. |
| Architecture, l.106 | Base partagée, routeur, banque d'adapters, mémoire et couches dites cognitives. |
| Routing, l.129 | MPNet/MLP et fusion de domaines ; performances actuelles corrigées, comparaisons entre jeux à ne pas mélanger. |
| Adapters, l.192 | Distillation, swap, cache, gates et angles ; mesures partielles, définition de la géométrie et de l'interférence trop forte. |
| Cognitive layer, l.279 | Aeon/CAMP/Catfish/anti-biais ; essai A/B de 30 prompts à score composite essentiellement automatique. |
| Evaluation, l.334 | Exactitude du routeur, santé d'adapters, latence, perplexité, code et stress ; petits tests fonctionnels utiles, pas encore une validation généraliste. |
| Discussion, l.467 ; conclusion, l.516 | Réserves parfois justes, mais maintient une nouveauté universelle sur MoE et null-space qui n'est pas démontrée. |

**MAJEUR — chiffres et configuration.** Les valeurs auditables sont 46,4 % / 69,6 % sur n=5 377, remplaçant un ancien 70,7 % non reproductible (`paper/micro-kiki.tex:151`). Le facteur 2,2 concerne une autre expérience : 29,4 % contre 13,2 % sur n=14 423. Ne pas les présenter comme un seul résultat. Les configurations théoriques de rang/α, le scale MLX effectif et les 41 artefacts ne décrivent pas tous la même banque (`:195`). Une base 480B à 4 bits a un minimum de 240 GB de poids ; l'annonce « 1,1 TB » doit préciser fichiers supplémentaires, copies ou précision (`:203`). La latence de swap doit distinguer adapter déjà résident, chargement disque, compilation et cache ; O(10 ms) n'est pas une borne asymptotique (`:207`). L'invalidation de KV cache doit être validée par une parité fonctionnelle après changement d'adapter (`:227`).

**BLOQUANT pour la conclusion centrale « null-space superflu sur MoE ».** Trois paires et des angles de 88,6° n'établissent pas l'absence de dommage aux performances (`paper/micro-kiki.tex:254`, `:273`). Les 20 paires ordonnées des cinq adapters ne sont que dix paires géométriques non orientées, et les modules partagent des adapters. Le côté win-rate est explicitement non vérifié ; un smoke séparé n'a que cinq prompts (`:250`). Le code calcule des angles principaux de sous-espaces engendrés par des **deltas de poids par couche**, pas les gradients de perte réels ni un simple angle cosinus entre deux vecteurs concaténés (`src/eval/forgetting.py:589`, `:598`). Les ΔW sont reconstruits à partir de A/B : je ne retiens donc pas l'objection d'une simple dépendance à la factorisation LoRA. En revanche, la géométrie de paramètres reste un proxy. Des directions aléatoires de très grande dimension sont déjà proches de 90° ; il faut un nul dimensionnel et des performances fonctionnelles appariées. Une moyenne par module/expert peut masquer des conflits localisés. Le mécanisme causal « les domaines utilisent des experts différents » demande les distributions de routage effectives et un contrôle dense/MoE à budget comparable.

**MAJEUR — les couches cognitives ne montrent pas de gain global.** Sur les 30 prompts, le composite passe de 0,404 brut à 0,394 avec couche complète, et les wins de 16 à 14 (`paper/micro-kiki.tex:305`). Cinq prompts par domaine ne justifient pas une politique spécifique par domaine ; les analyses +7/−13 sont post hoc et multiples. Des métriques mots-clés/longueur/cohérence ne valident pas la mémoire autobiographique, la négociation ou une correction de biais sémantique. Les gains de perplexité sont un signal utile mais nécessitent contrôle des contaminations, répétitions de l'entraînement et évaluation tenue à l'écart de la distillation. Sur HumanEval/MBPP, les comptes de problèmes résolus doivent être comparés par test apparié, pas par deux marges indépendantes (`:418`). Une baisse dans un montage ne prouve pas un compromis LoRA « fondamental » (`:445`). Les stress tests 10/10 et 8/8 sont des tests de fonctionnement, pas une mesure de robustesse statistique à la concurrence (`:460`).

**BLOQUANT pour toute économie d'énergie revendiquée.** Dans `results/nh81/summary.json:1`, R est **J_dense / J_spiking**, pas l'inverse. Pour W1 fused : R=0,9095, IC [0,8333 ; 1,0073], dense=0,04125 J/token, spiking=0,04552 J/token ; débit environ 447 contre 278 tokens/s. R<1 va contre l'économie, et l'IC n'autorise pas une économie établie. La réplication M3 Pro de [PR #19](https://github.com/hypneum-lab/micro-kiki/pull/19) donne R=0,670 [0,662 ; 0,677], soit environ **49 % d'énergie supplémentaire** côté spiking, sur 48 paires valides. Les deux restent qualifiées IOReport/provisoires en attendant la mesure RTX 4090 prévue. L'ancien `results/energy-benchmark.json:1` utilise un modèle analytique d'opérations et de coûts de technologie ; ses facteurs de plusieurs milliers ne sont pas des mesures murales ou GPU. Aucune extrapolation aux puces neuromorphiques ou grands LLM ne suit de ces estimations.

### 2.8 `micro-kiki-quantum` — textes et expériences, sans manuscrit autonome

`README.md:1` et `ARCHIVED.md:1` présentent QMoE (réduction PCA puis routeur), HyQuT (bloc hybride) et QPEFT (rotations de Pauli et SPSA/paramètre-shift). Les chapitres donnent le statut de simulation, les scores de démonstration, les raisons d'archivage et les conditions d'une reprise. Aucun `.bib` ni papier intégral indépendant n'est présent dans ce dépôt.

**BLOQUANT — score de resubstitution QMoE.** `src/experiments/qmoe_3domain.py:58` ajuste la PCA sur toutes les données, `:61` entraîne sur X6,y et `:66` évalue sur ces mêmes X6,y ; le baseline fait de même (`:73`). Le 13/15≈86,7 % égal au classique n'est donc pas une exactitude de test. Même avec un vrai test de 15 items, l'IC serait très large. Il faut séparer train/validation/test **avant** PCA, tuning et comparaison, puis répéter par graine et domaine.

**MAJEUR — nom QPEFT ne désigne pas encore l'expérience du papier QPEFT.** Le code entraîne un circuit à reproduire une espérance scalaire cible (`src/qpeft/trainer.py:3`, `:72`). Il n'adapte pas une couche d'un LLM sur une tâche NLP ; ce n'est pas une réplication de [Koike-Akino et al., Quantum PEFT, 2503.05431](https://arxiv.org/abs/2503.05431). Le header mentionne des rotations Z, l'implémentation utilise Ry (`src/qpeft/circuit.py:3`, `:33`). Le mode `shots` ajoute un bruit gaussien tronqué à une espérance exacte (`:72`) : ce n'est pas un tirage binomial exact ni un simulateur de bruit de portes. À 100+ shots, l'approximation centrale peut être utile loin des frontières ; elle ne devient pas statistiquement identique dans les queues ou après clipping. La règle paramètre-shift et la chaîne résidu×dérivée dans `trainer.py:55` sont correctes pour les rotations implémentées.

**OK comme décision d'arrêt.** Aucun calcul sur QPU, avantage end-to-end ou gain de généralisation n'est établi. Garder le dépôt archivé est cohérent ; un petit bloc à moins de paramètres ou de bons tests unitaires ne constitue pas une raison scientifique suffisante de le relancer.

### 2.9 `bouba_sens` — papier, ADR-0025/26/27, ActionSense

Source principale lue intégralement : `bouba_sens/docs/paper/main.tex`, l.1–1339.

| Section | Condensé |
|---|---|
| Résumé, l.37 | Regroupe B-1 congénital/tardif, B-2 migration de MI et B-3 asymétrie ; retire plusieurs lectures positives et reconnaît les nuls mal calibrés. |
| Introduction, l.104 | Motive les invariants par cécité et bouba/kiki ; deux extrapolations biologiques ne sont pas établies par les sources citées. |
| Architecture/datasets, l.170 | Cinq mondes, ponts partiellement réels, audit de complexité, GTM ; provenance mieux explicitée, mais « gravity »/« tactile » restent parfois des proxies. |
| Invariants, l.283 | Médiane des gaps T1/T2, différence de MI pré/post, maximum d'antisymétrie d'une matrice 5×5. |
| Résultats, l.325 | Grilles historiques, puis requalification B-3 et probe linéaire ; les premières lignes annoncent encore PASS/falsification directionnelle. |
| Mécanisme, l.404 | Verrou, scans τ, gel de codebook et rétractations ; demeure une longue histoire mécaniste fondée sur un régime qui n'apprenait pas. |
| Limites, l.763 | Validité externe, estimateurs, sondes et deux ponts réels ; les bornes inférieures MI ne permettent pas toutes les lectures de « Null ». |
| Travaux liés, l.1057 | Cécité, missing modalities, symbolisme phonétique, préreg et MI ; les antériorités ML 2026 sont déjà assez visibles. |
| Artefacts, l.1201 | Errata sur non-apprentissage, hasard non fixé, tenseurs perdus ; ces réserves invalident le récit principal encore maintenu ailleurs. |
| Annexes, l.1302 | Tables et manifeste historiques ; dépendances et release à harmoniser. |

**BLOQUANT — contradiction interne majeure.** L'erratum dit que **tous** les B-1/B-2/B-3 historiques et résultats de mécanisme sont mesurés à chance, sans apprentissage de la tâche (`docs/paper/main.tex:1241`). Pourtant le corps affirme encore que le codebook doit rester plastique pour préserver le signal Amedi (`:703`), qu'aucune sigmoïde continue n'approche le hard gate (`:652`), que le système minimal reproduit qualitativement l'asymétrie biologique (`:749`), et que B-3 confirme un invariant architectural (`:565`). Ces conclusions ne sont pas sauvées par leur maintien « comme histoire » dans un article principal. Il faut les déplacer en historique explicitement invalidé et reconstruire résumé, résultats, titres de sections et conclusion autour du verdict actuel.

**BLOQUANT — intervention confondue avec changement de monde.** ADR-0027 établit que `train` utilisait la graine s, `lesion` toujours 0, et `eval` la graine de cellule (`docs/adr/0027-erratum-world-seed-train-lesion-eval.md:20`). Les projections synthétiques changent avec ces graines. Les T2 de s≠0 apprennent donc un monde puis sont « lésés » dans un autre ; T1 n'a pas ce transfert. Le seul rejeu straight-through qui apprenait, graines 300–309, est affecté pour toutes les graines (`:54`). La requalification change l'interprétation de B-1, B-2, B-3 et des scans ; elle manque dans le manuscrit. Le mode `cell` corrige la construction, mais reste opt-in ; conserver le mode historique par défaut nécessite des gardes très visibles. Les mondes réels chargés d'un cache ne sont pas touchés par ce défaut précis (`:77`).

**BLOQUANT — données historiques essentielles indisponibles.** Les tenseurs 4,5-modaux sont perdus ; le chemin public fournit 120 frames vidéo contre 1 800 autres lignes et ne reproduit pas l'extraction (`docs/paper/main.tex:507`). Il n'existe pas de justification disponible du passage à 1 800 images historique. Les 17 blocs correspondants ne peuvent porter une conclusion reproductible. Les nouvelles sources ActionSense sont préférables à une reconstruction spéculative de ces données.

**MAJEUR — trois concepts ne sont pas identifiés par les métriques.** Un gap d'exactitude après entraînements différents ne suffit pas à simuler une réaffectation corticale. Une MI code/label globale ne localise pas une migration d'information d'une modalité vers une autre. Une matrice d'exactitudes asymétrique n'est pas le bouba/kiki, qui concerne une correspondance son–forme. La référence Amedi 2007 porte sur l'activation de LOtv par substitution sensorielle ; elle ne documente pas dans la source examinée le contraste quantitatif congénital > tardif invoqué (`main.tex:111`, `:1061`). L'accord « ≥95 % cross-culturel donc hard-wired/non appris » dépasse aussi les travaux cités (`:117`, `:1108`). [Source Amedi](https://www.nature.com/articles/nn1912).

**Vérification à la main du nul B-3 — MAJEUR.** À p=1/4 et n=64, l'écart-type d'une différence de deux proportions indépendantes est `sqrt(2×0,25×0,75/64)=0,07655`. Maximiser dix valeurs absolues produit naturellement une grandeur bien supérieure à 0,02 ; prendre ensuite la médiane de 30 maxima ne la centre pas à zéro. Le seuil 0,02 n'était donc pas calibré. Les références nulles déposées autour de 0,13–0,16 sont du bon ordre de grandeur (`docs/paper/main.tex:371`). Il faut conserver l'agrégation exacte, les items communs et les dépendances temporelles pour une calibration quantitative.

**MAJEUR — le nul apparié d'items ne couvre pas la variabilité des réseaux.** ADR-0026 gèle un flip par item/bloc avec maximum puis médiane (`docs/adr/0026-me6-large-n-prereg.md:155`). Les deux entrées P[a,b] et P[b,a] proviennent néanmoins de réseaux lésés différents. Conditionnellement à ces réseaux, une asymétrie fixe de prédiction peut persister sans apprentissage utile ; la symétrie des différences n'est pas garantie par une exactitude moyenne à chance. Augmenter n peut donc détecter une asymétrie du tirage de réseau, pas une plasticité. La nouvelle [PR brouillon #66](https://github.com/hypneum-lab/bouba_sens/pull/66) propose justement des réplications au niveau réseau ; ce protocole n'est pas encore gelé ni exécuté. Le résultat actuel ne doit pas être présenté comme un test complet de l'hypothèse biologique.

**OK pour le résultat contraire à l'attendu.** Le rapport grand n donne six des huit lignes gaussiennes en excès nominal, cinq après Bonferroni ; le mock dépend fortement de la taille/bloc (`docs/milestones/2026-10-31-me6-large-n-results.md:44`). La règle 0,02 s'allume sous le nul dans tous les cas n≤1 024 et encore très souvent sur le mock à n=4 096 (`:75`). C'est une bonne expérience de diagnostic de statistique, **pas un verdict B-3**, puisque le réseau ne passe pas la porte d'apprentissage (`:31`). La puissance empirique égale à 1 dans les lignes déjà en excès n'apprend rien sur l'effet planté (`:90`). Cinquante plantings ne donnent qu'une précision binomiale limitée sur une courbe de puissance.

**MAJEUR — MI et négatifs.** Le MINE 1D nul exact ne corrobore pas une absence de signal ; le texte l'a correctement retiré (`main.tex:852`). La différence de deux bornes inférieures ne borne pas la différence des MI vraies. Une estimation de MI « full » obtenue en additionnant des coordonnées n'est pas une MI jointe ; les valeurs −3 à −25 bits de delta pour quatre classes sont un signal de non-interprétabilité de cette procédure, pas un effet biologique (`main.tex:911`). Le résumé « aucun estimateur ne franchit +0,10 sur aucun seed » est contredit par +0,120 sur une graine dans la réplication full-probe (`:926`). Les mots « Null », « below noise floor », « falsified » doivent distinguer absence de franchissement d'un seuil arbitraire, borne d'effet et manque de puissance.

**ActionSense v0.7 — protocole prometteur, pas résultat disponible.** Le texte a été lu en entier (`docs/osf/amendment-v0.7-actionsense.md:1`). Quatre grilles de 150 cellules, cinq sujets et cinq graines, deux modes d'émission ; données synchronisées plus pertinentes que les anciennes substitutions. Le pilote de synchronie S00 donne p≈0,012 pour un maximum de cross-corrélation, avec nul tenant compte de cette recherche de lag (`:302`) ; c'est un petit contrôle sur un sujet, pas une certification de synchronie de tous les sujets. La normalisation sur toutes les frames de chaque sujet (`:124`) et l'échantillonnage de fenêtres dans le même monde impliquent une portée transductive tant qu'un vrai split sujet/segment tenu à l'écart n'est pas défini. Les cinq graines ne deviennent pas cinq cohortes humaines. Le protocole reconnaît que le rejet B-3 v2 peut venir du simple effet modalité (`:442`) : il ne doit donc pas servir de résultat de lésion.

**MINEUR à corriger par amendement daté — inégalité contradictoire dans un fichier gelé.** La règle est strictement `>` à `amendment-v0.7-actionsense.md:406`, `:522`, `:559`, mais le plan d'analyse dit « greater than or equal » à `:435`. Le code et les décisions indiquent clairement `>` ; la phrase restante doit recevoir un erratum explicite. ADR-0025 est réservé au futur verdict (`docs/adr/0026-me6-large-n-prereg.md:28`) et absent du clone : **invérifiable aujourd'hui**, pas une expérience nulle qu'on pourrait compter.

### 2.10 `baby-brain` et `BabyBrain`

Manuscrit intégral : `baby-brain/docs/paper/2026-05-22-ontogenetic-wml-draft.md:1` ; statut lu aussi dans `docs/paper/README.md`.

| Section | Condensé |
|---|---|
| Bandeau/résumé, l.1/28 | Dit que E0–E4 n'ont pas tourné ; objectif = efficacité en échantillons via portes de plasticité et curriculum. |
| Introduction, l.59 | Développement, périodes sensibles et agent apprenant ; formulation d'hypothèses plutôt que résultats. |
| Travaux liés, l.111 | Architectures world models, apprentissage développemental, mémoire et corps ; préentraînement des encodeurs à distinguer du développement de zéro. |
| Architecture, l.251 | WML/perceiver, curriculum par étapes, gates, progrès d'apprentissage et boucle perception-action. |
| Expériences, l.449 | E0–E4, budgets, comparaisons et figures prévues ; certaines règles de décision sont statistiquement incorrectes. |
| Préreg, l.582 | Décrit le gel à venir et les critères ; pas une preuve d'expérience exécutée. |
| Discussion, l.616 | Portée et limites biologiques ; l'effet de portes est présumé avant validation sur l'optimiseur réel. |
| Références, l.666 | Entrées récentes majoritairement résolues ; pas de validation des hypothèses par citation seule. |

**OK — transparence du statut.** Le papier annonce ses expériences non exécutées ; je ne lui impute pas des résultats absents. Les anciennes portes requalifiées dans la semaine ne valident pas E0–E4. Le second dépôt `BabyBrain` est un cockpit SwiftUI, pas une réplication indépendante de cette architecture.

**BLOQUANT pour le mécanisme expérimental avant lancement — multiplier le gradient ne multiplie pas nécessairement la plasticité AdamW.** Les gates sont implémentées par `g×gradient` (`baby_brain/ontogeny/integration.py:93`) puis passées à AdamW (`baby_brain/ontogeny/__main__.py:458`, `:1519`). Pour une constante positive g et des moments initialisés pareil, `m_g=g m`, `v_g=g²v`, donc `m_g/(sqrt(v_g)+ε)≈m/sqrt(v)` : le facteur de gradient s'annule presque. Une gate 0 après activité antérieure laisse en outre agir momentum et weight decay. Elle ne gèle pas les paramètres comme promis. Ce calcul est analytique ; je n'ai pas relancé MLX. Il faut mesurer les Δθ effectifs par module, définir le gel des paramètres/états d'optimiseur et séparer gate du gradient, learning rate et pénalités. La dynamique de gates variables peut avoir un effet, mais cet effet n'est pas celui annoncé par simple proportionnalité.

**MAJEUR — l'expérience A ne change pas un seul facteur.** Le texte revendique une seule modification entre E0/E1 (`docs/paper/2026-05-22-ontogenetic-wml-draft.md:500`), mais les transitions d'étape pilotent aussi le curriculum et l'exposition aux données. Corpus et budget égaux ne signifient ni même ordre ni même distribution effectivement vue. Il faut une ablation curriculum fixé×gates, avec planning de learning rate identique, puis une étude séparée des transitions adaptatives. Path A utilisant encodeurs préentraînés ne teste pas la même hypothèse de développement depuis zéro que Path B.

**MAJEUR — critère statistique et observables.** Le recouvrement de deux IC n'est pas un test d'absence de différence, et leur non-recouvrement n'est pas le test apparié naturel (`:512`, `:625`). Préspécifier un contraste par graine et sa marge d'effet minimal/équivalence ; gérer les épisodes qui n'atteignent jamais le seuil d'apprentissage. Avec cinq graines, le p exact unilatéral minimum est 1/32 ; il ne passe même pas α=0,025 pour deux tests corrigés sans hypothèses paramétriques supplémentaires. Le coefficient de variation nul d'erreurs toutes nulles ou constantes peut signaler apprentissage **ou stagnation** (`:369`) ; une porte d'étape doit aussi exiger une compétence. La réduction d'erreur de prédiction ne devient pas un expected information gain bayésien sans modèle de croyances/entropie (`:403`). La correspondance gamma/thêta du papier et celle de Nerve doivent être harmonisées ; aucune ne doit être présentée comme loi cérébrale universelle.

### 2.11 `rescience-nh01` — réplication Fachechi–Agliari–Barra

Lus intégralement : `rescience-nh01/article/article.tex:1` et `article/content.tex:1`.

| Section | Condensé |
|---|---|
| Introduction, l.1 | Réplication qualitative du dreaming Hopfield et contrôle de shrink ; reconnaît la portée partielle. |
| Méthodes, l.67 | Matrice rationnelle J(t), simulateur, capacités par franchissement, contrôle de norme, motifs corrélés et préreg. |
| Différences à l'original, l.205 | N limité à 1 000, cues bruités, mises à jour et seuils différents ; l'article ne reproduit pas les figures quantitatives originales. |
| Résultats indépendants, l.243 | Gain de capacité de l'ordre de 3,86× au protocole fini, optimum vers t=7 puis baisse. |
| Résultats corrélés, l.329 | Gains et rapports sensibles au petit dénominateur ; strate thermique fortement censurée et requalifiée. |
| Reproduction interne, l.506 | Deux exécutions depuis clones frais concordent cellule par cellule ; vérification de reproductibilité du code du labo. |
| Conclusion, l.524 | Confirmation qualitative bornée, pas théorie nouvelle ni disparition générale de tous les attracteurs parasites. |
| Reproductibilité/annexes/IA, l.588–708 | Environnement, commandes, provenance et limites ; bonne base pour ReScience après harmonisation des termes. |

**OK — vérification spectrale à la main.** Pour J diagonalizable symétrique semi-définie positive, `J(t)=(1+t)J(I+tJ)^−1` transforme chaque λ en `(1+t)λ/(1+tλ)` (`article/content.tex:77`). À t=0 on retrouve λ ; à t→∞, λ>0 tend vers 1 et λ=0 reste 0 : limite = projecteur sur l'image de J. Ce n'est pas en général l'identité sur tout l'espace. Retirer ensuite la diagonale modifie la dynamique et doit rester dans les différences à l'original (`:94`).

**OK, contrôle d'implémentation seulement — shrink à T=0.** Pour c>0, `sign(cJs)=sign(Js)` ; une réduction uniforme des champs ne change pas la dynamique déterministe à seuil nul. Ce contrôle est structurellement incapable de produire l'effet demandé à T=0. L'article le reconnaît (`article/content.tex:139`) : il est utile comme sanity check, pas comme rejet expérimental d'une explication homéostatique. À T>0, le changement équivaut à changer la température effective T/c ; l'interprétation doit être séparée.

**MAJEUR — capacité finie et seuils.** La capacité estimée est un franchissement sur une grille de charges avec 32 probes, cues à exactement 10 % de bits retournés, et seuil d'overlap 0,9/0,8 selon T (`article/content.tex:115`). Les irrégularités de courbe et la granularité de grille s'ajoutent à la variance entre graines. Dix graines sont les unités d'inférence ; les dizaines de milliers de cellules ne les remplacent pas. Les critères C2 ont été amendés après pilote, de monotonie à une lecture unimodale (`:198`) : la conclusion est une confirmation du protocole amendé, pas de l'énoncé initial inchangé.

**OK avec réserve de portée.** Les comptes déposés sont 28 080 cellules pilote, 9 120 confirmatoires et 29 640 corrélées, tous lisibles. Les gains à motifs indépendants sont cohérents avec un rapport moyen autour de 3,86 [3,79 ; 3,93] et une capacité autour de 0,607 contre 0,157 dans la condition résumée. Je n'ai pas refait les heures de Monte-Carlo ni authentifié les machines ; la concordance bit à bit annoncée est celle de deux exécutions du code de réplication, **pas** celle avec un code original de 2019. La limite N=5 000 et les figures originales restent hors portée.

**MAJEUR — distinguer m=0,30, T=0 et T=0,2.** Le rapport ~44,38 à T=0 est calculable sur cette grille, mais instable : capacité Hebb de 0,01–0,02 et borne de grille très proche. À T=0,2, cinq graines Hebb sous grille et d'autres contrôles censurés rendent le rapport de gain non interprétable ; l'article le qualifie correctement (`article/content.tex:422`). Dire globalement « m=0,30 : non calculable, jamais 44× » serait faux. Le rapport doit toujours porter m, T, dénominateur et censure. Les zéros sentinelles ne sont pas des capacités nulles mesurées.

**MAJEUR — l'ablation diagonale est désormais disponible.** Le papier laisse quatre explications possibles à l'optimum. Sur de nouvelles graines 200–209, le rapport `nerve-wml/docs/results/2026-10-31-nh01-diagonal-ablation.md:7` donne D_offdiag=0,086 [0,082 ; 0,090], D_diag=0,048 [0,043 ; 0,054], ΔD=0,038 [0,032 ; 0,043]. Le verdict primaire C5 reste **inconclusive** ; C6 montre une contribution de la diagonale au contraste entre t=7 et 100. Ce n'est pas une identification de la cause de l'optimum : avec diagonale conservée, le pic passe vers t=1, donc t=7 n'est plus son maximum (`:28`). Les auteurs le disent correctement ; il faut citer cette nuance dans l'article. Les étiquettes « spurious » sont parfois un résidu de classification près du seuil de retrieval, pas un catalogue d'attracteurs distincts (`:34`).

### 2.12 `paper-methodo-2026` — manuscrit et documents

Lus : `paper/manuscript.md:1`, les trois sections rédigées `paper/sections/00-agents.md`, `03-chain.md`, `04-errata.md`, et les plans de `docs/`. Le manuscrit est un squelette ; ses TODO ne sont pas des résultats manquants qu'il faudrait inventer.

| Partie | Condensé |
|---|---|
| Résumé/introduction/related | Retour d'expérience d'un labo d'une personne assisté d'agents ; comptages annoncés mais corpus final non gelé. |
| Chain | Tags/manifeste/SWHID, garde de lancement, nul apparié et amendements datés ; détails concrets transférables. |
| Errata register | 31 assertions corrigées, typologie de causes/détecteurs ; inventaire descriptif auto-sélectionné. |
| Cases | M5, NH-01, NH-03, relance Lie/Strang ; la chronologie et les qualifications doivent être exactes. |
| Cost | Table prévue ; des heures sont estimées/plafonnées, pas mesurées. |
| Limits/rules | Reconnaît que l'instrumentation ne garantit ni bonne mesure ni aveugle ; paquet réutilisable pas encore livré. |
| Plans | Cible de soumission et calendrier ; un plan de rédaction n'établit pas la contribution ou son efficacité. |

**MAJEUR — le retour d'expérience est publiable sans prétendre démontrer une efficacité causale.** Un corpus d'erreurs trouvées par les mêmes outils qui ont produit le code n'est pas un taux de détection, faute de dénominateur des erreurs encore inconnues et de comparaison. « La chaîne a évité X heures » demande un contrefactuel documenté ; « nous avons refusé/lancé telle campagne » est descriptif et traçable. Des relectures par modèles distincts ne sont pas automatiquement indépendantes, surtout avec corpus et historiques partagés (`paper/sections/00-agents.md:28`).

**MAJEUR — données factuelles à rectifier.**

- Le tableau des gels emploie `b8010424…` pour ActionSense (`paper/sections/03-chain.md:96`) ; il s'agit du SHA du **manifeste de données brutes**, pas du manifeste de gel. Le SHA-256 du fichier de gel lu au tag est `744d9b749c0bbca78be3ffcaee2f0b76f3d71fc1734234afb34926bb725e4755` ; la provenance du premier est `bouba_sens/docs/prereg/actionsense-v0.7/freeze-manifest.md:45`.
- L'affirmation qu'aucune garde n'existe dans dream est trop générale (`paper/sections/03-chain.md:119`, `:209`). E1 vérifie manifest FROZEN, corpus, provenance et identité (`dream-of-kiki/scripts/e1_harness.py:108`, `:341`, `:413`). On peut dire « pas de garde universelle de budget comparable à N10-C », après audit de ses possibilités de contournement.
- Le total de la catégorie audit est annoncé 13 mais la liste de lignes en contient 12 ; la ligne 14, « replication », manque dans la distribution récapitulative (`paper/sections/04-errata.md:71`). Les catégories de détecteurs peuvent se chevaucher : donner une règle de premier détecteur ou un multi-label.
- « bit-exactly replicates Fachechi … » dans la chaîne (`paper/sections/03-chain.md:340`) confond reproduction interne du code du labo et réplication de l'original. Le rapport ~44× n'est pas interdit à toutes les conditions m=0,30 (`paper/manuscript.md:52`) : voir distinction T ci-dessus.
- La fenêtre du 30/10 00:00 au 31/10 12:00 dure **36 h**, pas 24 h (`paper/manuscript.md:47`). « Tous les verdicts de cette fenêtre » exige une liste exhaustive à un commit de coupe ; ne pas y substituer quatre exemples choisis après lecture.
- Une empreinte prouve une identité de contenu. Une date Git ou un SWHID isolé ne prouve pas que le lancement est postérieur au gel ; il faut l'événement d'archivage/push vérifié et la trace du lancement. Le code qui ne valide qu'une forme de chaîne SWHID ne résout pas l'objet.

**OK comme cadrage final possible.** La nouveauté crédible serait un jeu de cas publics, une taxonomie d'erreurs, des gardes exécutables et le coût observé dans un contexte solo ; pas l'invention de la préregistration, des nuls calibrés, des Registered Reports ou des identifiants intrinsèques. [Vaccaro 2026, identifiant résolu](https://arxiv.org/abs/2606.11217) traite déjà la préregistration d'expériences avec agents ; ici les agents sont surtout les exécutants. Cette différence est réelle, mais ne dispense pas d'une comparaison explicite.

## 3. Vérification des références

### 3.1 Périmètre et comptes

**351 entrées** examinées, en comptant chaque apparition dans chaque bibliographie ; les doublons entre versions restent comptés. L'inventaire comprend tous les `.bib` scientifiques trouvés hors `.git`/`.github`, plus les 46 `\bibitem` de l'article système. Paper A utilise la bibliographie C5 ; `micro-kiki-quantum`, `BabyBrain` et la note méthodologique n'ont pas de `.bib` autonome. Une entrée de logiciel n'est pas assimilée à un article évalué par les pairs.

Les notices arXiv ont été résolues en lot, les DOI via Crossref/DataCite, puis certains cas sur les pages primaires des éditeurs, PMLR, JMLR, OpenReview ou archives d'auteurs. Semantic Scholar a été interrogé en batch, mais a répondu **429** ; les recherches par titre Crossref et OpenAlex ont aussi été largement limitées. Je ne présente pas ces échecs d'accès comme des preuves d'inexistence. Journal brut, notices et identifiants sont conservés dans `sol-bibliographie-*.json` et [le registre de 351 entrées](sol-bibliographie-verdicts.tsv).

**OK** ci-dessous signifie : identité résolue et aucune anomalie de notice constatée dans cette passe. **KO** signifie : erreur ou placeholder de notice identifié. **NV** signifie : notice non résolue dans cette passe. Ces comptes **ne certifient pas que chaque phrase citante a été vérifiée dans le texte intégral de chaque source externe**. Les abus d'appui à une affirmation sont traités séparément en §3.3 ; ils peuvent concerner une référence dont la notice est OK.

| Bibliographie / papier | Entrées | OK notice | KO notice | NV |
|---|---:|---:|---:|---:|
| Dream Paper 1, `docs/papers/paper1/references.bib` | 84 | 44 | 27 | 13 |
| Dream Paper 1 FR, `docs/papers/paper1-fr/references.bib` | 37 | 31 | 3 | 3 |
| Dream Paper 2, `docs/papers/paper2/references.bib` | 25 | 20 | 2 | 3 |
| Nerve Paper 1, `papers/paper1/refs.bib` | 34 | 30 | 3 | 1 |
| Nerve supplément CKNNA, `supplementary/cknna-n-dependence-replication/refs.bib` | 7 | 6 | 1 | 0 |
| Flow principal, `paper/references.bib` | 22 | 21 | 0 | 1 |
| Flow workshop, `paper/workshop/references.bib` | 12 | 10 | 0 | 2 |
| Flow ancien bundle, `paper/arxiv_bundle/references.bib` | 6 | 5 | 0 | 1 |
| Micro Paper A/C5, `docs/paper-a/c5-references.bib` | 8 | 6 | 0 | 2 |
| Micro système, bibliographie inline | 46 | 43 | 1 | 2 |
| Bouba, `docs/paper/refs.bib` | 32 | 26 | 1 | 5 |
| Baby-brain, `docs/paper/references.bib` | 30 | 30 | 0 | 0 |
| ReScience, `article/bibliography.bib` | 8 | 8 | 0 | 0 |
| **Total** | **351** | **280** | **38** | **33** |

Ce sont des comptes conservateurs d'anomalies constatées, pas une garantie d'absence d'autres erreurs de métadonnées. Les références non citées mais présentes dans les fichiers restent dans l'inventaire. Les anciennes bibliographies FR/bundle ont été contrôlées comme variantes documentaires ; elles ne constituent pas de nouvelles expériences ou de nouveaux papiers scientifiques.

### 3.2 Notices erronées, incomplètes ou non résolues

**MAJEUR — attributions erronées identifiées.**

| Entrée / source locale | Problème et source résolue |
|---|---|
| `vandeven2020brain`, `dream-of-kiki/docs/papers/paper1/references.bib:188`, FR `:168`, Paper 2 `:180` | Auteur Tuytelaars introduit à tort ; auteurs du papier : Gido van de Ven, Hava Siegelmann, Andreas Tolias. [Nature Communications, DOI 10.1038/s41467-020-17866-2](https://www.nature.com/articles/s41467-020-17866-2). |
| `rasch2025sleep`, `dream-of-kiki/docs/papers/paper1/references.bib:252` | Le titre existe, mais pas avec les auteurs Rasch/Born et la notice 105(2):521–576 donnée. Notice finale : Nicolas Lutz, Maximilian Harkotte, Jan Born, *Physiological Reviews* 106(1), 2026 ; mise en ligne antérieure à distinguer du volume. [DOI 10.1152/physrev.00054.2024](https://doi.org/10.1152/physrev.00054.2024). |
| `saillant2026nervewml`, Dream Paper 1 `references.bib:311`, FR `:227` | Titre « Working Memory Layer » incohérent avec le développement World Model Language et le titre du logiciel archivé. Le DOI concept résout actuellement une version plus récente ; épingler la version réellement utilisée. [DOI concept](https://doi.org/10.5281/zenodo.19656342). |
| Même clé, `bouba_sens/docs/paper/refs.bib:129` | La notice annonce v1.5.3, mais le DOI indiqué archive **v1.3.0**. Corriger l'association version/DOI et la portée « preprint ». [DOI 10.5281/zenodo.19666405](https://doi.org/10.5281/zenodo.19666405). |
| `saxe2024universality`, `nerve-wml/papers/paper1/refs.bib:80` | Notice attribuée à Saxe ; publication de Hosseini et coauteurs, DOI 10.1101/2024.12.26.629294. [Source primaire archivée](https://pmc.ncbi.nlm.nih.gov/articles/PMC11703180/). |
| `wei2024differank`, Nerve `refs.bib:137`, supplément `refs.bib:69` | Le titre et l'ID sont réels, les auteurs sont Yahan Li, Tingyu Xia, Yi Chang, Yuan Wu ; pas Wei et al. La notice ne porte pas l'identification avec « Diff-eRank ». [arXiv 2410.10672](https://arxiv.org/abs/2410.10672). |
| `zhao2025channelawarevq`, `nerve-wml/papers/paper1/refs.bib:157` | Auteurs réels : Zian Meng, Qiang Li, Wenqian Tang, Mingdie Yan, Xiaohu Ge. [arXiv 2510.18604](https://arxiv.org/abs/2510.18604). |
| `gao2024mola`, `micro-kiki/paper/micro-kiki.tex:538` | ID 2403.03432 = *Mixture-of-LoRAs: An Efficient Multitask Tuning for Large Language Models*, Feng et al. ; ni le titre ni les auteurs indiqués. [Notice arXiv](https://arxiv.org/abs/2403.03432). |
| `hajizada2025clpsnn`, `dream-of-kiki/docs/papers/paper1/references.bib:554` | Elvin et non Eldar ; titre paraphrasé. La v3 du 20/10/2026 rapporte 7,3× latence /341× énergie contre Replay sur Jetson, là où la note conserve 70×/5 600× de v1. Ne pas mélanger versions ou comparateurs. [arXiv 2511.01553v3](https://arxiv.org/abs/2511.01553v3). |
| `recursivemas2026`, `dream-of-kiki/docs/papers/paper2/references.bib:255` | Xiyuan Yang figure en tête de la notice locale, absent de la liste courante qui commence par Jiaru Zou. Vérifier et épingler la version au lieu d'attribuer silencieusement à la v2. [arXiv 2604.25917](https://arxiv.org/abs/2604.25917). |
| `sharon2025alzdementia`, Dream P1 `references.bib:680`, FR `:132` | Le titre est réécrit/abrégé. Titre résolu : *Slow wave synchrony during NREM sleep tracks cognitive impairment in prodromal Alzheimer's disease*. [DOI 10.1002/alz.70247](https://doi.org/10.1002/alz.70247). |
| `manoach2024schizophrenia`, Dream P1 `references.bib:764` | « Manoach lab » n'est pas la liste d'auteurs d'une notice achevée ; titre descriptif et journal à réconcilier avec le PMID donné. Pas de soutien bibliographique final en cet état. |

**MAJEUR — 21 placeholders « Anonymous » dans Dream Paper 1.** Ils ne sont pas des articles anonymes identifiés comme tels ; les entrées donnent des descriptions de lecture à la place des notices primaires. Certaines sources existent effectivement, ce qui ne corrige pas leur attribution. Le registre joint donne chaque ligne ; liste exhaustive :

`pmc2025systems:331`, `trends2024coupled:343`, `elife2025bayesian:353`, `neuron2025largeswr:365`, `npjscilearn2025clas:376`, `commsbio2025emotional:386`, `annurev2025replay:397`, `biorxiv2025rempfc:409`, `pnas2022dualstage:446`, `berkeley2025sleeptimecompute:472`, `arxiv2025statefulreplay:511`, `biorxiv2025thalamocortical:569`, `seslr2025snnreplay:580`, `mlxsnn2026:605`, `braintransformers2024:619`, `spinnaker2024:632`, `npjscilearn2024tmrupdate:659`, `medrxiv2025clasinsomnia:669`, `ajgp2024clashome:692`, `natrevpsych2023methodology:739`, `aimeetsbrain2025:788` — toutes dans `dream-of-kiki/docs/papers/paper1/references.bib`.

Exemples résolus : l'entrée eLife doit reprendre [le vrai article, DOI 10.7554/eLife.101992](https://doi.org/10.7554/eLife.101992) et sa version ; le papier stimulation décrit par « npj2025 » est publié en **2026**, avec Jourde et al. et un titre différent ([DOI 10.1038/s41539-025-00383-6](https://www.nature.com/articles/s41539-025-00383-6.pdf)) ; le papier émotion est Yuksel et al. 2025, avec une conclusion REM/TMR nuancée ([DOI 10.1038/s42003-025-07868-5](https://www.nature.com/articles/s42003-025-07868-5)). La référence PNAS est *A model of autonomous interactions between hippocampus and neocortex driving sleep-dependent memory consolidation*, et non le titre réécrit ([DOI 10.1073/pnas.2123432119](https://doi.org/10.1073/pnas.2123432119)).

**33 notices NV — reste à résoudre, sans les déclarer inexistantes.** Chemins abrégés uniquement dans la liste suivante ; la table et le registre joint donnent le fichier intégral et la ligne.

- Bouba `docs/paper/refs.bib` : `kohler1947gestalt:56`, `ramachandran2001synaesthesia:65`, `vanschoren2021neurips:146`, `hanke2016studyforrest:219`, `mcnaughton1971counter:262`.
- Micro C5 : `fano1961transmission:39`, `nielsen2010quantum:56`. Ce sont des ouvrages classiques reconnaissables ; leur notice d'édition n'a pas été résolue dans cette passe, pas leur théorie déclarée inexistante.
- Dream P1 : `mccloskey1989catastrophic:96`, `solms2021revising:156`, `phillips2010categorial:228`, `howie1995semigroup:274`, `lothaire1997combinatorics:283`, `pierce2002types:292`, `hu2020tmr:646`, `javadi2024sleeprestriction:703`, `robertson2025nrn:716`, `cordi2021robust:727`, `schreiner2024jneurosci:751`, `wamsley2020eszopiclone:776`, `bastos2020routing:872`.
- Dream P1 FR : `mccloskey1989catastrophic:64`, `solms2021revising:124`, `bastos2020routing:312`.
- Dream P2 : `mccloskey1989catastrophic:100`, `solms2021revising:148`, `mlx2023:206`.
- Nerve principal : `bastos2020routing:204`.
- Flow principal : `levelt1989speaking:1` ; ancien bundle : même clé `:1` ; workshop : `levelt1989speaking:93`, `honnibal2020spacy:80`.
- Micro système : cartes modèles `qwen2026qwen38_27b:664`, `qwen2026qwen38flashnext:669`. L'existence d'un modèle ou son benchmark ne doit pas être déduite d'un nom de carte non épinglé.

Deux précautions évitent des faux KO : **Titans** porte bien une soumission au 31 décembre 2024 malgré l'identifiant 2501.00663 ([notice primaire](https://arxiv.org/abs/2501.00663)) ; l'année 2024 n'est donc pas automatiquement erronée. L'entrée BabyCL OpenReview est anonymisée parce qu'elle relève d'une soumission ; le titre est apparié au préprint 2026, ce qui ne prouve pas une acceptation 2027.

### 3.3 Références réelles qui ne soutiennent pas la phrase citante

| Papier | Appui vérifié / écart de portée | Gravité |
|---|---|---|
| Dream P1 | Les travaux sommeil/replay motivent des mécanismes ; ils ne dérivent ni les quatre générateurs exclusifs, ni leur irréductibilité cognitive, ni les garanties de profils. Une corrélation mémoire–couplage SO/SP dans une méta-analyse ne fixe pas directement une borne physique de couplage d'un protocole PSK. L'article eLife transforme les effets/corrélations ; ce ne sont pas des amplitudes de couplage interchangeables. | MAJEUR |
| Dream P2 | Davies 2018 est Loihi première génération, pas une source suffisante de spécifications Loihi 2. Référencer la puce ne montre pas que le substrat du dépôt y a été compilé. | MAJEUR |
| Nerve | Bastos 2012 : la direction prédictions/erreurs et les bandes ne sont pas celles données à l'introduction. Roy–Vetterli : singular values normalisées et rang exponentiel, pas simplement entropie des carrés nommée identique. Le papier Nuclear-Norm n'est pas la source « Diff-eRank » attribuée. | MAJEUR |
| Flow principal | JKO 1998 et Feydy 2019 ne garantissent pas qu'un split KL arbitraire ou une étape de gradient normalisée minimise le JKO de F. Une Sinkhorn divergence débiaisée et un coût OT entropique brut ne sont pas identiques. | BLOQUANT si ces références servent de preuve |
| Flow workshop | FEP/JEPA n'identifient pas automatiquement l'énergie proposée à une ELBO ; sept références citées n'existent même pas dans le `.bib` : `chen2018neural`, `saillant2026nervewml`, `saillant2026kikiflow`, `baddeley1974`, `rezende2015variational`, `reimers2019sbert`, `vandenoord2017neural`. Exemples : `section_1_intro.tex:17`, `section_2_related.tex:40`, `:50`. | MAJEUR |
| Micro Paper A/C5 | Holevo est une borne de mesure d'un ensemble quantique ; pas une borne N bits sur les espérances exactes d'un simulateur. Du théorème 4 ne porte pas la conclusion spécifique sur ce VQC. | BLOQUANT |
| Micro système | Les travaux de LoRA/MoE fournissent des baselines et menaces, pas la preuve que 256 experts rendent une protection de sous-espace superflue. Certains travaux déjà cités contestent précisément cette implication. | MAJEUR |
| Bouba | Amedi 2007 ne porte pas le contraste congénital/tardif invoqué dans les passages examinés ; Sidhu est une revue de plusieurs mécanismes du symbolisme phonétique, pas une preuve de non-apprentissage/hard wiring. Les initiatives Datasets & Benchmarks/datasheets ne valent pas une obligation OSF générale. | MAJEUR |
| Baby-brain | Les références développementales motivent les hypothèses ; elles n'établissent ni l'efficacité des gates MLX/AdamW ni le lien automatique plateau d'erreur→maturation. | MAJEUR |
| ReScience | Fachechi–Agliari–Barra 2019 est bien le modèle cible ; les antériorités pseudo-inverse/projection sont reconnues. L'original n'est pas une source de bit-identité avec la nouvelle implémentation. | OK pour l'identité ; MAJEUR pour une formulation quantitative excessive |
| Méthodo | Vaccaro est bien résolu ; différence agents sujets/exécutants à exposer. La préregistration, les amendements, les nuls, la conservation du code et les Registered Reports sont des antériorités ; l'assemblage solo documenté peut être la contribution. | OK / MAJEUR |

**Antériorités à ajouter ou à traiter réellement.** Pour les papiers empiriques, il manque surtout une confrontation opérationnelle, pas une liste plus longue : contrôle sans communication de mêmes dimensions pour Nerve ; baselines de continual learning à données/calcul appariés pour Dream ; référence Gibbs et vrais pas JKO pour Flow ; test fonctionnel des sous-espaces pour Micro ; tâches de correspondance son–forme et vraies cohortes/trajectoires pour Bouba. Les références 2025–2026 de §7 donnent des comparateurs précis. Beaucoup sont déjà dans les bibliographies : il faut discuter leurs résultats contradictoires, pas les annoncer comme des découvertes nouvelles de cette relecture. Les Registered Reports/ML prereg et les études de variance/fuites citées dans le plan méthodologique doivent entrer dans le manuscrit final, qui ne contient pour l'instant qu'une liste minimale.

## 4. Analyses transversales : ordres de grandeur, puissance, jugement de rapporteur, nouveauté

### 4.1 Équations et critères effectivement contrôlés

| Proposition | Vérification indépendante | Conséquence |
|---|---|---|
| DR2 restreint | Contre-exemple de concaténation de deux mots admissibles | La classe restreinte n'est pas un semi-groupe. Réviser le théorème et sa sémantique. |
| Inclusion de profils | Monotonie du supremum sous inclusion vraie, monotonie de l'algorithme non déduite | Séparer garantie d'espace de recherche et performance apprise. |
| Fano | Réarrangement correct, borne souvent triviale | Besoin d'un majorant valide de la MI vraie et de son incertitude. |
| Holevo appliquée aux espérances | Contre-exemple un qubit/dix espérances distinctes | La borne N ne s'applique pas à cet objet classique exact. |
| Gradient du couplage | Dérivée tangentielle et différence finie concordent avec λ(J+Jᵀ)ρ | Corriger le cas asymétrique ; vérifier son activation expérimentale. |
| Strang de sous-pas Euler implicites | Développement scalaire au second ordre | Palindrome ≠ ordre 2. Le résultat d'ordre actuel reste non identifiable. |
| J(t) Hopfield | Calcul sur les valeurs propres | Limite projecteur, pas identité générale. |
| Shrink positif à T=0 | Invariance exacte de sign(c h) | Contrôle d'implémentation tautologique, explicitement limité. |
| Gates Adam | Compensation du facteur g dans les moments | Mesurer les mises à jour effectives avant d'assimiler gate et plasticité. |
| Statistiques déposées | CSV Split-MNIST, cinq graines CL, 300 cellules NH-03, 96 configurations M5, scores C2 | Plusieurs moyennes sont exactes ; leur portée inférentielle reste à corriger. |

Les calculs sont enregistrés dans [sol-controles-numeriques.json](sol-controles-numeriques.json) et [sol-controles-supplementaires.json](sol-controles-supplementaires.json). Les p recalculés sont des diagnostics de relecture, pas de nouvelles analyses confirmatoires préenregistrées.

### 4.2 Puissance, unités et estimands

- **Le nombre de graines domine le nombre de cellules.** Un seuil atteint sur 150 cellules Bouba ou des centaines de paires Nerve peut reposer sur cinq initialisations et un même monde. Les cellules partagent poids, stimuli, checkpoints et hyperparamètres ; les bootstrap doivent respecter ces groupes. Une strate à deux graines M5 n'est pas un échantillon de population auquel donner une puissance statistique : c'est une grille déterministe et une règle de couverture.
- **Petits n.** Sans hypothèse paramétrique forte, n=3/5/6 donne un minimum de p unilatéral par signes de 0,125/0,03125/0,015625. Des corrections multiples peuvent rendre un rejet exact impossible même si tous les signes sont favorables. Pour un effet standardisé apparié d, l'ordre de grandeur gaussien à 80 % et α bilatéral 0,05 est `n≈(1,96+0,84)²/d²≈7,85/d²` : ~32 pour d=0,5, ~126 pour d=0,25, avant pénalités de petits n, multiplicité ou variance de données. Le plan doit utiliser la distribution/structure réelle, pas ces approximations comme promesse.
- **Falsification d'un seuil et équivalence diffèrent.** Un point estimé inférieur à +0,3, +0,05 ou +0,10 n'exclut pas un effet supérieur dans la population. Un IC chevauchant zéro n'établit pas l'absence ; deux IC qui se recouvrent ne définissent pas un verdict. Un TOST exige une marge de pertinence indépendante du résultat. Inversement, une règle déterministe préfixée peut être utile pour décider d'arrêter un prototype, sans prétendre réfuter une famille biologique.
- **Choix des unités.** Pour EEG : sujet/nuit ; pour QMoE : exemples tenus à l'écart et répétitions de fit ; pour LLM : graines d'entraînement et problèmes appariés ; pour énergie : paires de workloads appariées avec qualité comparable et hôte ; pour Hopfield : graines de motifs avec courbes de charge ; pour Bouba : réseau entraîné/lésé, avec items imbriqués. Aucun de ces nombres n'est interchangeable.
- **Tuning après exposition.** Une modification post-pilote est scientifique si datée et testée sur une nouvelle cohorte gelée. Elle ne rétablit pas rétrospectivement une hypothèse initiale aveugle. E1-small est explicitement exploratoire ; N10-C doit déclarer le périmètre de chaque bris ; une longue succession d'amendements augmente les degrés de liberté historiques même si chacun est bien documenté.

### 4.3 Ordres de grandeur et rapport bénéfice/coût

**Budgets.** Égaliser « écritures » peut opposer une mise à jour de 1 024 fast weights à une mise à jour de dizaines de milliers de paramètres ; égaliser FLOPs théoriques ne garantit ni joules ni temps. Rapporter séparément paramètres écrits, exemples, calcul d'entraînement et d'évaluation, mémoire, latence et énergie mesurée. L'addition des coûts séquentiels est une convention de comptabilité utile ; elle ne prouve pas que le coût déclaré d'une primitive reste constant après restructuration de l'état.

**Énergie.** Les rapports NH-81 ~0,91 et ~0,67 ne ressemblent pas à une économie de 91× ou de milliers de fois ; ils montrent un coût supplémentaire ou une incertitude sur les workloads/hôtes mesurés. La comparaison de circuits Loihi co-conçus ne permet pas de transférer un ratio au remplacement d'une fonction d'activation dans un grand modèle exécuté sur GPU/Apple.

**Numérique.** Une grille spatiale de 16 sites peut être suffisante pour falsifier une règle de couverture du solveur ; elle ne l'est pas pour revendiquer un ordre asymptotique de PDE quand h→0 gèle le transport. L'allongement d'un cas à plus de 28 h ne transforme pas ce calcul en démonstration mathématique. Il faut choisir entre une étude de solveur discrétisé et une étude de convergence continue, puis dimensionner les raffinements correspondants.

**Quantique.** Six qubits = 64 amplitudes ; quatre qubits = 16. Ces pilotes ne sondent pas un régime hors de portée classique. Une quantité de paramètres plus faible ou des sorties bornées ne prouve pas un goulot d'information de N bits pour un simulateur qui fournit des réels exacts. Le coût d'encodage, de répétitions/shots, de gradients et du solveur classique doit être intégré.

**Évaluation linguistique.** Une banque de 41 adapters est une réalisation d'ingénierie. Elle ne crée pas 41 preuves indépendantes : corpus de distillation, base, juge et prompts peuvent être communs. Tester les membres sur des datasets externes et tenir à l'écart le jeu qui pilote les réglages est plus informatif que multiplier les acronymes de couches.

### 4.4 Ce qu'un rapporteur dirait et ce qui reste neuf

| Travail | Objection décisive probable | Contribution qui pourrait rester |
|---|---|---|
| Dream P1 | Les axiomes sont des contrats ; les preuves ne donnent pas les bénéfices cognitifs annoncés, et certaines sont fausses dans leur formulation. | Une API de consolidation et des tests de conformité, si évalués comme logiciel ; l'ablation NH-03 comme étude séparée de calendrier. |
| Dream P2 | Deux wrappers du même mock ne sont pas une validation cross-substrat. | Une note d'artefacts intégrée au premier papier. |
| Nerve | MI/alignement sans intervention causale, capacités non appariées et split EEG inadéquat. | Protocole de messages typés, code et mesures de transmission ; comparer à DVNC/VQ et canaux triviaux à budget égal. |
| Flow principal | Confusion entre modèle, discrétisation et solveur ; propriétés observées appelées garanties. | Étude reproductible des limites de certification JKO entropique/non convexe et des splits, avec résultats négatifs. |
| Flow workshop | Fonction objectif et géométrie imprécises, erreur de gradient conditionnelle, gain minuscule mal rapporté. | Prototype de conditionnement textuel de distributions ; nouveauté incrémentale à confronter aux flows paramétriques et à la distillation. |
| Micro Paper A | Borne centrale fausse pour l'objet mesuré ; petit VQC battu par des classiques n'est pas une impossibilité quantique. | Évaluation négative propre et outil de simulation si le benchmark est équitable. |
| Micro système | Le système combine des briques connues ; géométrie non validée fonctionnellement et échantillons faibles. | Déploiement local reproductible, mesures de latence/qualité et rapport NH-81 négatif correctement isolé. |
| Quantum | Train = test et pas d'adaptation LLM QPEFT. | Tutoriels de simulation, pas résultat de recherche sur l'avantage quantique. |
| Bouba | Les observables ne correspondent pas aux invariants biologiques, et le modèle historique n'apprend pas. | Benchmark de calibration/diagnostic des nuls, avec résultats au niveau réseau et provenance ActionSense. |
| Baby | Architecture non évaluée et expérience à facteurs confondus. | Harnais développemental et protocole d'ablation après correction de l'optimisation ; aucune conclusion d'efficacité actuelle. |
| NH-01 | Réplication partielle, petit N, seuils/censure ; pas contribution théorique neuve. | Réplication qualitative et audit de robustesse de ce modèle précis, adéquats à ReScience. |
| Méthodo | Auto-description sélectionnée après erreurs, pas preuve d'efficacité d'un workflow. | Étude de cas, jeu public d'errata et gardes réutilisables avec coûts observés. |

La contribution commune la plus crédible est **l'instrumentation rendue inspectable et la documentation de ses échecs**. Elle peut être utile sans unification biologique. Pour les affirmations positives de mécanisme, il manque encore un résultat qui survive à la fois à un modèle qui apprend, un contrôle non tautologique, une unité d'inférence correcte, une comparaison de budget et une réplication indépendante.

## 5. Suppositions implicites

### 5.1 Hypothèses qui portent les interprétations

| Supposition | Pourquoi elle n'est pas acquise / ce qui la rendrait testable |
|---|---|
| Un mécanisme appelé replay/downscale/restructure correspond à son homologue cérébral. | La fonction informatique et l'effet biologique doivent partager des observables et prédictions distinctives. Un nom et quelques citations ne constituent pas cette correspondance (§2.1/2.9). |
| Réussir des contrats suffit à établir une théorie indépendante du substrat. | Un wrapper conforme peut ne rien apprendre ; il faut transfert d'effets, marges d'équivalence et implémentations réellement distinctes (§2.2). |
| Plus d'opérations admissibles implique un meilleur agent. | Cela augmente au mieux le supremum d'un espace de choix ; cela peut dégrader l'apprentissage et consommer le budget (§2.1). |
| Une forte similarité entre modules implique un contenu communiqué utile. | Les mêmes données/cibles et la capacité peuvent produire l'accord ; il faut couper, permuter ou remplacer le contenu et mesurer une tâche qui en a besoin (§2.3). |
| Une exactitude moyenne à chance crée un vrai H0 de symétrie de toutes les cellules. | Des réseaux figés à chance peuvent avoir des biais différents. Le nul conditionnel aux items ne couvre pas cette variabilité de réseaux (§2.9). |
| Une même plage [0,1] rend les seuils de métriques comparables. | Un score d'edges pondéré multiplie structure et poids géométriques ; sa petite valeur peut venir de sa construction, des normalisations et de τ, sans démontrer l'absence de géométrie. |
| Un gradient multiplié par g est une plasticité multipliée par g. | AdamW compense le facteur positif et garde des états ; mesurer Δθ, gel et oubli effectifs (§2.10). |
| Une MI estimée est une quantité physique exacte, ou une borne. | Les estimateurs, biais, normalisations et unités changent ; il faut des contrôles de cohérence et une incertitude appropriée (§2.3/2.6/2.9). |
| Une baisse d'énergie ou un faible résidu garantit le bon flot. | Cela peut être une autre énergie, un point stationnaire non global ou une discrétisation bloquée ; identifier le problème effectivement résolu (§2.4). |
| Des poids/adapters presque orthogonaux ne peuvent pas interférer. | L'effet dépend des activations, courbures, gains et sorties ; une géométrie de paramètres doit être validée fonctionnellement (§2.7). |
| Des écritures égales, une largeur égale ou des paramètres égaux égalisent le budget scientifique. | FLOPs, mémoire, qualité, données et temps peuvent différer fortement ; publier plusieurs axes du budget (§4.3). |
| Le gel transforme une conclusion en fait confirmatoire fiable. | Il fige aussi une mauvaise mesure et un contrôle tautologique. Une modification après exposition reste exploratoire dans son périmètre ; le tag ne l'efface pas. |
| L'IC d'un estimateur exclut la marge parce que son point estimé la franchit. | `L>0` et `mean>δ` établissent positivité et filtre ponctuel, pas `μ>δ`. NH-03 emploie précisément R>3 et IC inférieur>0 (`dream-of-kiki/docs/milestones/2026-10-30-nh03-deferred-eval.md:125`). Ses chiffres actuels sont très au-dessus de 3, mais la règle générale doit être nommée correctement. |
| Reproduire deux fois son code constitue une réplication extérieure. | C'est une vérification utile de reproductibilité interne. La validité du modèle, des données et la transférabilité restent à éprouver. |
| Les phénomènes nommés consolidation, cristallisation, information ou énergie sont interchangeables entre IA, cerveau et matière. | Il faut une correspondance d'états, d'échelles, de contraintes et de prédictions. Aucun manuscrit audité ne fournit une preuve générale de cette unification. |

### 5.2 Comparaison après levée de l'aveugle

Les sections 1–4 ont été sauvegardées à **17:46:59 UTC le 01/11/2026** dans `report-sol-sections1-4-aveugles.md`, SHA-256 `def37c6d1e0ba5657f117309a541342821573a4e8fbb5979d062cced624e73ee`. Les lectures directes du dossier `.github/docs/research/` commencent ensuite. Je n'ai pas réécrit ces sections à partir des synthèses ; les remarques suivantes sont ajoutées ici avec cette provenance distincte.

**Convergences.** La synthèse interne du 30/10 reconnaissait déjà la faiblesse des mesures derrière des gels soignés, l'invalidité de l'ancien pas JKO, l'aveuglement E1/N10-C et l'intérêt d'une note d'errata (`.github/docs/research/2026-10-30-etat-des-lieux/README.md:11`, `:57`). Ce sont des convergences avec les constats tirés des sources en §2 ; elles ne comptent pas comme des réplications empiriques.

**États périmés à ne pas importer.** La synthèse disait M5 incomplet ou en attente du rejeu (`README.md:72`, `:359`) ; le clone du 01/11 permet le décompte complet 50/60 primaire et 57/96 total. Le plan méthodo v2 reprend encore un état ancien contraire au manuscrit/sources actuels (`paper-methodo-2026/docs/plan-2026-10-31-v2.md:30`). NH-03 n'était pas encore lancé dans cet instantané (`README.md:364`) ; ses cellules sont maintenant déposées. ActionSense et les deux ADR ont été signés après les notes qui en parlaient comme ouverts. La synthèse est une pièce datée, pas une autorité qui remplace les artefacts plus récents.

**Qualification supplémentaire vérifiée après cette lecture — manipulation Bouba.** L'audit SNR était déjà cité par le manuscrit ; une vérification ciblée après lecture de la synthèse confirme sa conséquence expérimentale. Avec init=20, floor=−20 et k=5 000, le dernier pas t=99 donne `20−40×99/5000 = 19,208 dB`, soit un bruit d'environ 10,95 % de l'amplitude du signal. Le CLI courant garde k=5 000 (`bouba_sens/src/bouba_sens/cli.py:547`) ; les deux scripts de grille ne passent pas `--k-steps`. L'ADR avertit que les historiques sont une reconstruction depuis le code, non une lecture des métadonnées de toutes les cellules (`docs/adr/0020-snr-floors-nearly-identical-under-default-settings.md:61`). **Il faut donc parler de bruit faible, pas affirmer qu'aucune perturbation n'a été appliquée.** Un résultat sans effet détecté dans ce régime ne teste pas une lésion sévère. Avant une nouvelle lecture biologique : contrôle de manipulation sur la performance du canal lésé et intensité effective consignée ; toute modification du protocole gelé exige un amendement, pas un changement silencieux.

**Prudence envers la critique elle-même.** Le résumé interne parle de FAILS H13-C/D « garantis » par τ et la normalisation (`.github/docs/research/2026-10-30-etat-des-lieux/README.md:86`). Le code `dream-of-kiki/kiki_oniric/eval/relational_probe.py:167` montre des poids `exp(−|log d̃x−log d̃y|/τ)`, donc bien un couplage entre présence d'edges et géométrie. Cela justifie une menace de construit ; **cela ne démontre pas à lui seul une borne universelle du contraste calibré sous δ**. Le protocole gelé distingue désormais explicitement « gain de recouvrement pondéré borné » et absence de géométrie (`docs/osf-filing/dr3/osf-prereg-dr3-relational-probe-2026-10-23.frozen.md:140`, `:421`). Je retiens cette formulation limitée, pas une invalidation automatique par slogan. Même prudence sur NH-01 : T=0 et T=0,2 ne sont pas interchangeables pour les rapports « 44× / non calculable ».

**Autre risque de synthèse.** La table maîtresse ancienne additionne des statuts de contrats, descriptions, tests et hypothèses sous « confirmés » (`.github/docs/research/2026-10-24-revue-hypotheses/synthese/01-table-maitresse-hypotheses.md:15`, `:54`). Un pourcentage global de confirmations n'a pas de sens scientifique sans unité homogène, contrôle de multiplicité et qualité de preuve. Le même fichier attribue encore Bouba à l'OSF parent (`:31`), alors que les déclarations corrigées des dépôts excluent cette portée. La documentation de synthèse doit recevoir les corrections autant que les README et les papiers.

## 6. Utilité : publiable tel quel, à arrêter, manquant pour soumission

**Aucun manuscrit tel quel.** Ce verdict ne repose pas sur une exigence de nouveauté spectaculaire. TMLR demande surtout une adéquation des preuves aux affirmations et un intérêt intelligible ; ses critères permettent de réduire une affirmation plutôt que d'accumuler des expériences, et n'imposent pas la nouveauté comme condition autonome. [Critères officiels TMLR](https://jmlr.org/tmlr/acceptance-criteria.html).

| Manuscrit / chantier | Décision de relecture | Minimum avant soumission ou reprise |
|---|---|---|
| Dream Paper 1 | **Révision fondamentale** ; arrêter les prétentions théoriques/cognitives actuelles. | Reformuler DR2/DR4, séparer contrats et hypothèses, retirer les validations invalidées, harmoniser les sections ; une expérience apprise avec baselines/budgets et graines indépendantes. |
| Dream Paper 2 | **Arrêter comme article autonome.** | Intégrer le registre/mock comme artefact au Paper 1 ; publier séparément seulement après deux implémentations effectives et un vrai test d'équivalence. |
| NH-03 | **Conserver et rédiger comme résultat ciblé.** | Estimand précis, contrastes appariés, coût réel des écritures, limites du délai/interférence, comparaison aux travaux sommeil/fast memory. Aucune extrapolation 35B. |
| E1-small / E1 35B | **E1-small exploratoire ; ne pas justifier une montée d'échelle par son ancien statut.** | Analyse finale séparée selon exposition ; contrôle du benchmark et de son niveau de base ; nouvelle étude indépendante si une confirmation est souhaitée. |
| Nerve Paper 1 | **Révision majeure.** | Réduire les lois PRH, égaliser les budgets pertinents, refaire le split EEG, tester l'utilité du contenu du canal, corriger sources/signaux/unités, fournir des artefacts par graine. |
| N10-C | **Finir/lire sous le protocole effectivement amendé, avec toutes les déviations.** | Analyse appariée appropriée, puissance et famille de contrastes, porte de nécessité et contrôles qui apprennent. Une équivalence demande sa marge ; un nul ne l'établit pas. |
| Flow principal | **Arrêter le récit actuel de garanties et d'accélération validée.** | Nouvel article de modèle/solveur : énergie exacte, identification des pas, versionnage des figures, M5 complet, échecs et domaine certifiable ; raffinement spatial/temporel si convergence continue revendiquée. |
| Flow workshop | **Réviser ou fusionner comme prototype.** | Gradient symétrisé/test de dérivée, état produit de simplexes, interprétation probabiliste bornée, comparaisons B/C appariées, références manquantes et gains corrigés. |
| Micro Paper A/C5 | **Abandonner la borne combinée actuelle.** Évaluation négative récupérable. | Retirer Holevo sur les espérances, recomputer les MI jointes avec validation d'estimateur, supprimer 0,91 partout, préciser PCA/tuning et incertitude du downstream. |
| Micro système | **Article d'ingénierie à réduire et consolider.** | Un jeu de validation externe, paramètres/rangs réels, mesures de service reproductibles, tests fonctionnels d'oubli ; renoncer au « MoE rend l'orthogonalisation superflue » général. |
| NH-81 | **Publier le négatif circonscrit.** | Résultats appariés, qualité, ordre, repos et instrumentation ; garder le statut provisoire de la réplication non terminée. Aucun retour aux estimations présentées comme mesures. |
| Micro Quantum | **Rester archivé.** | Une reprise demanderait une vraie tâche held-out, baseline forte et coût complet ; pour QPEFT, adaptation effective d'un modèle, pas cible scalaire. |
| Bouba papier historique | **Retirer comme preuve de plasticité.** | Réécriture en audit de benchmark/nuls ; citer chaque invalidation au point où elle change une conclusion. Les données perdues restent historiques, sans promesse de reproduction. |
| ActionSense / nul réseau | **Corriger le construit avant lecture de verdict biologique.** | Gate d'apprentissage, contrôle de manipulation, unité réseau, séparation des effets modalité/lésion, protocole et inégalités cohérents ; ADR-0025 seulement après résultats effectivement archivés. |
| Baby-brain | **Ne pas lancer E0–E4 comme tests définitifs en l'état.** | Vérifier la plasticité AdamW réelle, factoriser curriculum/gates, préspécifier censure et contrastes ; données d'efficacité encore absentes. |
| BabyBrain | **Utile comme outil auxiliaire.** | Documentation d'interface/provenance et tests d'intégration ; pas de conclusion scientifique autonome à soumettre. |
| ReScience NH-01 | **Révisions ciblées, puis soumission plausible.** | Résumé explicitement « qualitatif/partiel », distinctions reproduction/réplication, censure par T, contrôle shrink bien nommé, référence à l'ablation diagonale et paquet minimal pour deux relecteurs externes. |
| Méthodo | **Priorité de rédaction plausible, pas de soumission du squelette.** | Corpus gelé de faits/errata, décompte reproductible, heures observées séparées des estimations, chaîne exécutable, typologie et limites ; corriger hash/fenêtre/NH-01. |

Pour NH-01, l'adéquation à ReScience vient de la réplication de travaux extérieurs et de la possibilité offerte aux relecteurs d'exécuter le code, pas de la nouveauté de l'algorithme. La revue exige une preuve substantielle de réplication ou une explication documentée de son échec, et précise le rôle des tests par relecteurs. [Consignes ReScience C](https://rescience.github.io/write/).

Pour la note méthodologique, le Journal of Trial and Error accueille explicitement les résultats négatifs et les difficultés méthodologiques utiles à un domaine ; cela rend la cible plausible, sans préjuger d'une acceptation. [Appel officiel JOTE](https://journal.trialanderror.org/pub/callgeneral). Une version courte, traçable et centrée sur trois ou quatre leçons sera plus utile qu'un catalogue d'acronymes et de décisions internes.

**Ordre de travail recommandé.** D'abord corriger les assertions déjà diffusées et terminer NH-01 ; ensuite rédiger le corpus d'errata et NH-03/NH-81 à portée bornée ; ensuite choisir **une** question causale restant ouverte. Les expansions 35B, nouvelle bibliothèque quantique ou multiplication des grilles ne compensent pas les défauts de mesure. Ce sont des recommandations scientifiques de ce rapport ; aucun dépôt, protocole ou calcul n'a été modifié.

## 7. Vingt références 2025–2026 vérifiées et leur conséquence

Les identifiants ci-dessous ont été **effectivement résolus**, pas proposés de mémoire. Notices et résumés primaires lus ; texte intégral externe consulté pour certains points précis signalés dans les sections précédentes. Une notice arXiv résolue n'est pas une certification de validité de ses résultats. Les publications déjà présentes dans le corpus sont des travaux à confronter, et non des « antériorités manquantes » inventées pour cette relecture.

| # | Référence et identifiant résolu | Confirme, infirme ou devance quoi ? |
|---|---|---|
| 1 | Gröger, Wen & Brbić (2026), [*Revisiting the Platonic Representation Hypothesis: An Aristotelian View* — arXiv:2602.14486](https://arxiv.org/abs/2602.14486) | Confirme la nécessité de calibrer les métriques et de contrôler la capacité ; affaiblit une convergence globale déduite de scores bruts. Déjà cité par Nerve/Bouba. |
| 2 | Koepke, Zverev, Ginosar & Efros (2026), [*Back into Plato's Cave: Examining Cross-modal Representational Convergence at Scale* — arXiv:2604.18572](https://arxiv.org/abs/2604.18572) | Montre la dépendance à n, k et à l'appariement bijectif ; menace directe pour une lecture générale de CKNNA sur petit ensemble partagé. Déjà dans le corpus. |
| 3 | You, Jang, Mo & Jung (2026), [*What Converges in the Platonic Representation Hypothesis? Structure over Geometry* — arXiv:2609.27252](https://arxiv.org/abs/2609.27252) | Devance la séparation structure/géométrie, local/global. La sonde DR3 reprend cette distinction ; sa nouveauté doit être ailleurs que dans cette grille conceptuelle. |
| 4 | Calcagno et al. (2026), [*Dream2Learn: Structured Generative Dreaming for Continual Learning* — arXiv:2603.01935](https://arxiv.org/abs/2603.01935) | Devance une partie du récit « rêves structurés et recombinaison pour CL » ; exige une comparaison algorithmique, pas seulement un rapprochement biologique. Déjà cité. |
| 5 | Behrouz, Hashemi, Javanmard & Mirrokni (2026), [*Language Models Need Sleep: Learning to Self-Modify and Consolidate Memories* — arXiv:2606.03979](https://arxiv.org/abs/2606.03979) | Concurrence directe sur mémoire courte→poids, consolidation et génération de curriculum ; ne valide pas les axiomes Hypneum. Déjà cité. |
| 6 | Dey, Srivastava, Lerner & Kanan (2026), [*SHARP: Sleep-based Hierarchical Accelerated Replay for Long Range Non-Stationary Temporal Pattern Recognition* — arXiv:2606.00732](https://arxiv.org/abs/2606.00732) | Devance des combinaisons hiérarchie/replay accéléré et fournit un comparateur de calendrier/mémoire. Ne prouve pas l'utilité du protocole gamma/thêta. |
| 7 | Lutz, Harkotte & Born (version finale 2026), [*Sleep's contribution to memory formation* — DOI:10.1152/physrev.00054.2024](https://doi.org/10.1152/physrev.00054.2024) | Soutient un rôle de consolidation active et sélection synaptique avec mécanismes multiples ; corrige l'attribution « Rasch 2025 » de Dream. Aucune dérivation des quatre primitives n'en suit. |
| 8 | Jourde et al. (2026), [*Modulating sleep: slow oscillation and spindle stimulation effects on physiology and memory* — DOI:10.1038/s41539-025-00383-6](https://www.nature.com/articles/s41539-025-00383-6.pdf) | Modulation physiologique obtenue, résultats comportementaux hétérogènes chez N=102. Contredit le raccourci « augmenter une oscillation augmente nécessairement la mémoire ». Référence placeholder déjà présente. |
| 9 | Abdelaleem, Martini & Nemenman (2025), [*Accurate Estimation of Mutual Information in High Dimensional Data* — arXiv:2506.00330](https://arxiv.org/abs/2506.00330) | Soutient diagnostics de dimension latente, biais et cohérence ; ne garantit pas un estimateur simplement parce que D≈12 a été mesuré. Déjà cité par Bouba. |
| 10 | Foresti et al. (2026), [*Towards Diverse and Comprehensive Benchmarks for Mutual Information Estimation* — arXiv:2607.03487](https://arxiv.org/abs/2607.03487) | Pas de vainqueur universel entre familles d'estimateurs ; fournir des tests à MI connue adaptés au régime réel. Déjà cité par Bouba. |
| 11 | Baradat & Cherf (2026), [*A convergence rate for the entropic JKO scheme* — arXiv:2604.08283](https://arxiv.org/abs/2604.08283) | Précise les hypothèses de convexité et les limites jointes temps/régularisation ; rend insuffisante une identification empirique sur grille fixe. Déjà dans le corpus Flow. |
| 12 | Caucheteux, Bonet & Korba (2026), [*A Unifying View of Variational Generative Wasserstein Flows* — arXiv:2605.31369](https://arxiv.org/abs/2605.31369) | Devance l'unification de flows génératifs par schémas JKO paramétriques. Pour le workshop : besoin d'une spécificité mesurable et d'une identification précise du problème résolu. |
| 13 | Koike-Akino et al. (2025), [*Quantum-PEFT: Ultra parameter-efficient fine-tuning* — arXiv:2503.05431](https://arxiv.org/abs/2503.05431) | Antériorité directe du QPEFT réel : adaptation paramétrique par transformations unitaires/Pauli. Le trainer scalaire local ne le reproduit pas. Référence déjà discutée dans le dépôt Quantum. |
| 14 | Gillani et al. (2026), [*How Quantum Is the Advantage? A Fair, Calibration- and Noise-Aware Benchmark and Attribution Audit of Quantum Machine Learning for Network Intrusion Detection* — arXiv:2608.18155](https://arxiv.org/abs/2608.18155) | Propose contrôles de paramètres, prétraitement et attribution ; les classiques dominent souvent, quelques avantages spécifiques subsistent. Méthode utile pour QMoE, pas réfutation générale du QML. |
| 15 | Faryad (2026), [*The Input Problem: A Permanent Bottleneck for Quantum Machine Learning* — arXiv:2608.08433](https://arxiv.org/abs/2608.08433) | Oblige à comptabiliser la préparation d'états et les modèles d'accès aux données. Pertinent pour toute revendication d'avantage du routeur ; ne remplace pas une analyse propre au circuit utilisé. |
| 16 | Chowdhury et al. (2026), [*Routing Is Not Enough: Diagnosing Intra-Adapter Subspace Contention in MoE+LoRA Fine-Tuning* — arXiv:2609.03150](https://arxiv.org/abs/2609.03150) | Contre-exemple direct au mécanisme « experts disjoints/quasi-orthogonalité ⇒ pas d'interférence ». Déjà cité dans l'article Micro : sa discussion doit réellement limiter la conclusion. |
| 17 | Yoo et al. (2026), [*SPACE-LoRA: Allocating Activation-Subspace Protection for Continual Learning* — arXiv:2609.34453](https://arxiv.org/abs/2609.34453) | Met l'accent sur les activations et l'interférence additive, plutôt que l'angle des poids seul ; indique l'ablation fonctionnelle manquante. Déjà cité dans le corpus Micro. |
| 18 | Jiang, Yang, Norman & Lake (2026), [*Continual Visual and Verbal Learning Through a Child's Egocentric Input* — arXiv:2606.05115](https://arxiv.org/abs/2606.05115) | BabyCL fournit un benchmark chronologique, replay et budget apparié ; devance le seul argument « proche du développement ». Ne présume pas d'une acceptation ICLR 2027. Déjà dans Baby-brain. |
| 19 | Sui et al. (2026), [*Do More Modalities Always Help? A Geometric Perspective on Missing-Modality Robustness* — arXiv:2610.04792](https://arxiv.org/abs/2610.04792) | Soutient l'intérêt de mesurer une perte de modalité et les sous-espaces ; ne démontre pas le contraste cécité congénitale/tardive ni les invariants B-1/B-3. Déjà cité par Bouba. |
| 20 | Vaccaro (2026), [*Preregistration for Experiments with AI Agents* — arXiv:2606.11217](https://arxiv.org/abs/2606.11217) | Antériorité directe du cadrage préreg/agents et des degrés de liberté. La note Hypneum doit apporter une mise en œuvre et des cas inspectables d'agents exécutants. Déjà cité dans son squelette. |

### Traçabilité et limites finales

Les dix HEAD et l'état initial sont dans [sol-provenance-initiale.json](sol-provenance-initiale.json), les journaux de période dans [sol-git-logs.txt](sol-git-logs.txt), les sept PR brouillons dans [sol-pr-brouillons.json](sol-pr-brouillons.json), les notices/erreurs dans [sol-bibliographie-verdicts.tsv](sol-bibliographie-verdicts.tsv), les recalculs dans les deux JSON de contrôles cités en §4 et le gel de l'aveugle dans [sol-gel-aveugle.json](sol-gel-aveugle.json).

Les incertitudes restantes sont explicites : 33 notices non résolues, lecture intégrale non garantie pour toutes les **sources externes citées** malgré celle des manuscrits demandés, campagnes vivantes non inspectées, données historiques perdues, pas de réplication GPU/QPU ni de Monte-Carlo lourd refait. Ces limites interdisent de certifier les résultats non accessibles ; elles ne changent pas les contre-exemples algébriques et contradictions texte/code documentés ici.

Contrôle final : les dix dépôts ont les mêmes HEAD et les mêmes états Git qu’au début, tous propres ; aucun fichier de `clones/` n’a été modifié. Voir [sol-provenance-finale.json](sol-provenance-finale.json). Les [scripts de la passe](scripts-audit-sol/README.md) et le registre détaillé permettent d’inspecter les calculs et les limites de résolution.
