# Hypneum Lab — revue complète des hypothèses, état des lieux scientifique et nouvelles hypothèses

État au 24 octobre 2026 · PI : Clément Saillant · programme GENIAL (dream-of-kiki, nerve-wml, kiki-flow-research, bouba_sens, baby-brain, micro-kiki, micro-kiki-quantum, BSK)

## 0. Verdict

En six mois, Hypneum Lab a formulé 180 hypothèses ou affirmations et construit la discipline pour les tester (préenregistrement, cinq graines, Bonferroni, errata publics). Ce qu'il a établi avec cette discipline est presque entièrement **négatif** : 45 résultats réfutés, rétractés ou nuls contre 57 « confirmés » dont une majorité, d'après les notes de la table maîtresse (annexe 01), sont descriptifs, mono-graine ou obtenus sur un chemin rapide. Le seul positif revendiqué comme invariant, l'asymétrie B-3 de bouba_sens, n'a jamais été comparé à un nul : la statistique est la médiane, sur les cellules, du maximum de dix différences d'exactitude mesurées sur n = 64, dont l'espérance sous l'hypothèse nulle vaut 0,10 à 0,17. Les trois mondes synthétiques (0,14–0,15) sont dans cette plage ; les deux mondes descriptifs, mock (0,31) et ECG (0,45), dépassent le 99ᵉ centile simulé (≈ 0,30) et restent à expliquer, sachant que les lésions n'y ont jamais dépassé ~19,8 dB. Le second positif, G4-ter (replay + downscale, g = +2,77), tient à un substrat et ne se transfère pas. Un défaut de code vérifié dans kiki-flow (ε = h = 0,05 au lieu de 0,01) a touché six mois de résultats de flot ; corrigé le 24/10 au soir (PR #25) et, d'après le balayage du 25/10, il n'explique pas l'écart entre chemins rapide et rigoureux. La thèse centrale du programme, un modèle du monde appris de zéro, n'a jamais été testée.

L'état de l'art d'octobre 2026 ne rend pas le programme obsolète : rien ne fait ce que fait GENIAL (axiomatiser la consolidation avec un critère de conformité exécutable), rien ne fournit encore un protocole de messages entre substrats hétérogènes, et le harnais ontogénétique n'a pas d'équivalent. Mais il impose sept reformulations convergentes (budget plutôt que créneau hors-ligne, conservation sélective, structure relationnelle mesurable, épisodes imbriqués, réouverture inter-domaines de DR-4, oscillation comme porteuse physique, flot JKO comme énergie libre) et révèle un prior art absent des dépôts, les réseaux de Hopfield « rêveurs » (1983→2026), qui donnent au rêve une formule.

Sur les nouveaux champs : **ouvrir l'axe « matière » sous conditions**, non comme nouveau champ mais comme piste intégrée à kiki-flow et nerve-wml, parce que trois ponts formels sont solides (JKO ↔ Cahn-Hilliard, machines d'Ising à oscillateurs ↔ flot de Wasserstein ↔ multiplexeur γ/θ, Hopfield rêveurs ↔ GENIAL) et réunissent trois dépôts dans un même formalisme. Ouvrir de même, en mode léger, la bioélectricité (substrat NCA) et la thermodynamique (annexe formelle) ; faire des mathématiques structurales le prérequis de tout le reste (DR-3 n'est pas falsifiable aujourd'hui) ; ne pas ouvrir la conscience ; laisser le quantique archivé ; ne pas acheter de matériel.

Le chemin de sortie du paradigme LLM existe et il est bon marché : un modèle du monde latent (JEPA, ~15 M paramètres) comme substrat de baby-brain, des mémoires associatives denses comme banc du rêve, un flot de Wasserstein commun comme langue des trois dépôts, et une dizaine de tests à moins d'un jour de Mac M1 qui tranchent plus que tout ce qui a été lancé depuis avril. Le plan en §7 commence par rétracter ce qui est faux (une semaine), rend falsifiable ce qui ne l'est pas (trois semaines), puis lance dix hypothèses classées par ce qu'elles tranchent pour le programme.

**Glossaire minimal.** GENIAL : cadre formel de dream-of-kiki ; DR-0 à DR-4 : ses cinq hypothèses de cadre (budget borné, conservation des épisodes, composition des opérations, indépendance du substrat, inclusion des profils) ; C+ : critère de conformité exécutable d'un substrat ; DE : épisode de rêve ; replay / downscale / restructure / recombine : les quatre opérations de consolidation ; WML : « World Model Language », module minimal appris de zéro ; neuroletters : symboles discrets échangés entre WML (codebook de 64) ; GTM : multiplexeur γ/θ de nerve-wml ; N-1…N-5, W-1…W-4 : invariants du protocole ; Claim A/B : affirmations principales de nerve-wml ; N10/N11 : études préenregistrées de coopération multi-agents ; JKO : schéma de flot de gradient de Wasserstein (kiki-flow) ; B-1/B-2/B-3 : hypothèses de bouba_sens (période critique, migration d'information, asymétrie) ; Me6 : métrique d'asymétrie de bouba_sens ; LP : progrès d'apprentissage (baby-brain) ; BSK : modèle de langage à impulsions construit de zéro.
## 1. Ce que le programme a réellement établi

Chiffres issus de la table maîtresse (annexe 01, 180 lignes fusionnées à partir des 5 inventaires du 24/10).

| Dépôt | Affirmations | Confirmées | Négatives (réfuté + rétracté + nul) | Non concluantes | Amendées | En attente | Jamais testées | Non vérifiables |
|---|---|---|---|---|---|---|---|---|
| dream-of-kiki | 41 | 6 | 12 | 10 | 4 | 4 | 4 | 1 |
| kiki-flow-research | 32 | 17 | 5 | 3 | 3 | 0 | 3 | 1 |
| nerve-wml | 39 | 17 | 5 | 1 | 10 | 5 | 1 | 0 |
| bouba_sens | 24 | 4 | 15 | 0 | 2 | 3 | 0 | 0 |
| baby-brain | 16 | 3 | 3 | 3 | 0 | 0 | 6 | 1 |
| micro-kiki | 24 | 10 | 4 | 7 | 0 | 0 | 2 | 1 |
| micro-kiki-quantum | 3 | 0 | 1 | 0 | 0 | 0 | 2 | 0 |
| BSK | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |
| **Total** | **180** | **57** | **45** | **24** | **19** | **12** | **19** | **4** |

Après la comparaison Codex (annexe 01 §8), deux « confirmées » passent en « réfutée » (MK-23) et « non vérifiable » (KFR-H35) ; les totaux ci-dessus sont ceux de la table avant correctif.

Préenregistrements : 2 déposés sur OSF avec DOI (Q6JYN = H1–H4 de dream-of-kiki seulement ; TPM5S = amendement Bonferroni), ≈ 30 préregs locales jamais déposées, ≈ 11 brouillons. Point corrigé par la comparaison Codex : l'enregistrement Q6JYN ne contient ni « bouba » ni B-1/B-2/B-3 ; la préinscription OSF de bouba_sens revendiquée dans CITATION.cff, README et .zenodo.json n'est pas établie. Errata : 7 documents formels pour ≈ 70 items. Publications : 0 dépôt arXiv, Zenodo dream-of-kiki jamais minté, nerve-wml figé à 1.8.0, bouba_sens TMLR bloqué.

### 1.1 Ce qui tient (résultats robustes, ≥ 5 graines ou nul calibré)

1. **nerve-wml Claim A** : un protocole discret inter-WML coûte < 5 % à N ≥ 32 (19/20 graines, nul n = 50) ; chaîne de bout en bout déployable 0,924 (20 graines).
2. **dream-of-kiki « RECOMBINE vide »** : les opérations riches n'ajoutent rien de mesurable, répliqué sur 4 benchmarks × 4 substrats — le négatif le plus solide du programme.
3. **dream-of-kiki G4-ter** : replay + downscale, g = +2,77 (N = 30), mais non transféré à E-SNN et estimateur P_equ ≡ P_max artefactuel sur CNN.
4. **bouba_sens B-2 nul** : aucune migration d'information mutuelle, 5 estimateurs × 3 ponts de données.
5. **bouba_sens B-1 rétracté** : pas de période critique dose-réponse (10 graines, p = 0,62) — et les doses n'étaient pas des doses (SNR plafonné ~19,8 dB).
6. **kiki-flow sweep rigoureux** : 720 runs, spécialisation tenue mais réduite (1,35 contre 2,03 bits) — à relire après correction de ε.
7. **micro-kiki C1** : le routeur quantique VQC fait moins bien qu'une régression logistique sur PCA-4 (5 graines).
8. **nerve-wml Claim B requalifié** : l'alignement 0,93 est fabriqué par la quantification (0,10 avant VQ) — un résultat méthodologique utile au-delà du programme.
9. **GTM tied** : le multiplexage γ/θ ne bat aucune baseline (3W/5L/1T) et ses ablations sont équivalentes.
10. **La pratique d'erratum** elle-même : sept documents formels en six mois, chaque rétractation avec cause racine.

### 1.2 Ce qui est tombé, et pourquoi

| Résultat | Cause racine |
|---|---|
| GO 1,5B / 7B et loi d'échelle H7 (dream-of-kiki) | fixture absente → 20 lignes recyclées, train = eval ; hellaswag 8 items saturé |
| Facteur MLX 5,13×, KL 0,000638 « bits », balayage ε, Fig. 1 (kiki-flow) | deux prox W2 ignorant `reference` pendant six mois |
| Écart LIF 12,1 % ; alignement ×10 ; 15/15 (nerve-wml) | décodeur asymétrique ; artefact de VQ ; mono-graine |
| Pic dose-réponse B-1 ; « invariant architectural » B-3 ; headline 22,3× (bouba_sens) | seed unique ; percentile 61–72 % ; seuil sans nul ; SNR jamais atteint |
| « 1b ViZDoom LP PASS » (baby-brain) | documentation contraire au JSON de résultats |
| Task 14 VQC 0,925 ; « null-space superflu » ; routeur 70,7 % (micro-kiki) | non reproductible ; angles ≠ interférence ; résultat non réconcilié (46,4 % mesuré) |
| Claims énergie spiking (BSK, triple hybride) | jamais mesurés ; contredits par toutes les mesures 2026 |

### 1.3 Jamais testé

La thèse « WML de zéro » (Path-B, BSK) ; les Claims A–D du papier SP6 (0 run, OSF jamais rédigé) ; H1–H4 du cycle 1 OSF sur données réelles ; Gate D du cycle 3 ; N10-A, N11-A, N11-C, N13, N14 ; les pilotes v0.7–v0.9 de bouba_sens ; T25–T27 de kiki-flow. Autrement dit : les hypothèses pour lesquelles le programme a été fondé sont celles qui attendent encore leur premier test.
## 2. Analyse critique et réfutations, dépôt par dépôt

Lecture d'ensemble : sur six mois, le programme a produit une méthodologie exigeante (préenregistrement, ≥ 5 graines, Bonferroni, errata publics) et une série de résultats négatifs propres. Il n'a pas encore produit un résultat positif qui survive à un nul calibré. Sa thèse centrale (un modèle du monde appris de zéro, « WML ») n'a jamais été testée.

### 2.1 dream-of-kiki / GENIAL

**Ce qui tient.** L'ontologie comptable de l'épisode de rêve (DR-0, DR-1), le Critère de conformité C+ et sa falsification adverse (Q2/Q2+, 25/25 faux positifs rejetés), la partition d'écriture des quatre opérations, et un négatif robuste : « replay + downscale fait tout, les canaux riches n'ajoutent rien de mesurable » (DR-4 réfuté sur 4 benchmarks × 4 substrats).

**Ce qui est tombé.** Les « GO » 1,5B et 7B et la loi d'échelle H7 (rétractés le 19/06 : fixture absente, train = eval, hellaswag saturé à 1,0). Les « confirmations » G4→G4-septimo sont des non-rejets de Welch avec une MDE réelle d ≈ 0,86 (erratum du 23/10). Le seul effet positif, G4-ter g = +2,77 (replay + downscale), ne se transfère pas au substrat E-SNN et son estimateur P_equ ≡ P_max sur CNN est un artefact détecté le 24/10. Sur LLM réel, l'unique verdict est nul (Helium-2B, g = 0,0054, p = 0,496) ; le résidu replay du re-test sans fuite (+0,097, 20/20 graines) est confondu par un transfert de template.

**Jamais testé.** H1–H4 du cycle 1 OSF n'ont jamais vu de données réelles (Studyforrest jamais téléchargé ; mocks 50/70/85 %). Gate D jamais calculé. Paper 1 v0.2 jamais déposé sur arXiv, Zenodo jamais minté.

**Ce que la littérature change.** Quatre reformulations convergentes (R1, R6, R9, R11) : DR-0 doit être un *budget* qui choisit l'opérateur, pas un créneau hors-ligne (la tendance 2026 est la consolidation continue en poids rapides : Titans/Hope, TTT, MemoryBench) ; DR-1 devient *sélective* et sans purge obligatoire ; DR-3 reformulé en « structure relationnelle » est aujourd'hui **non falsifiable** (aucune métrique, aucun nul, aucun seuil dans `conforms(S)`) ; le pilier `downscale` doit devenir `rescale` à signe indéfini (cadre WISE). Prior art manquant : les « réseaux de Hopfield rêveurs » (Hopfield 1983 ; Crick & Mitchison 1983 ; Fachechi, Agliari & Barra 2019 ; quatre prépublications 2026) donnent au rêve une formule et une capacité α_c(t) — zéro occurrence dans les dépôts.

**Faille méthodologique dominante.** Sous-puissance systémique et baselines « vraies par construction » (mocks), contrôle SGD apparié arrivé trop tard, validité externe quasi nulle (seul substrat « réel » conforme : numpy-LIF synthétique).

### 2.2 nerve-wml

**Ce qui tient.** Claim A (plancher 2–3 % à N ≥ 32, 19/20 graines, nul n = 50). La nouveauté « protocole de messages inter-substrats » tient : NIR/nir-rs n'a toujours pas de primitive de message.

**Ce qui est tombé ou tied.** Le multiplexeur γ/θ (GTM) : H0 Q1/Q1+/Q1++ réfutées → « tied » 3W/5L/1T ; les ablations γ-only ≈ θ-only ≈ GTM montrent que le couplage phase-amplitude n'est pas porteur. L'invariant N-3 est requalifié « type-checker, not differential mechanism » (Δ = 0 sur 3 ablations) ; les JSON de ces ablations portent `n_received: 0` et `apply_consolidation: false` (vérifié) : l'ablation a mesuré l'effet d'une modification sur un mécanisme inactif, le Δ = 0 est tautologique et ces résultats sont non informatifs ; l'invariant N-3 n'a donc pas été testé. Claim B « sur-estimé ~10× » (alignement post-VQ 0,93 contre pré-VQ 0,10 : c'est la quantification qui fabrique l'alignement, ADR-0001). 18 errata, dont un co-auteur fabriqué, une référence hallucinée et une mauvaise attribution (« Palacios »).

**Ce que la littérature change.** Les baselines du tie sont déjà dépassées (IB + VQ + porte, ICRA 2026 ; DDCL ; SLIM découple canal et politique alors que N10-C branche le canal sur le latent de politique). Le codebook 64 est une constante d'ingénierie : N10-C gelé tourne avec A = 16, K = 4, et 4 bits de phase sont le plafond réaliste des oscillateurs physiques ; Lava (Loihi) est archivé (dernier push le 13/05/2026). HRM/ARC Prize montrent que la hiérarchie bi-fréquence seule n'apporte rien et que la boucle externe fait tout : le comparateur honnête du GTM est une boucle externe non hiérarchique. Le « test 6 » n'est pas un test : nul gaussien i.i.d. inadéquat, seuil ad hoc, k/N non contrôlé.

**N10-C.** Gelée et en cours (60 runs, ≈ 22 j), aucun résultat. Il lui manque un bras « message désapparié », un récepteur warm-start et une baseline VQ (audits causaux 2026). Le manifeste gelé cite encore un commit pré-tag.

### 2.3 kiki-flow-research

**Ce qui tient.** La discipline d'erratum (ERRATUM.md, release paper-v0.12-draft, Zenodo 10.5281/zenodo.23619954 publié le 24/10 mais non référencé dans le dépôt). Le sweep rigoureux du 24/10 (720 runs) montre une spécialisation **tenue mais réduite** : écart 1,35 ± 0,06 bits contre 2,03 ± 0,03 en mode rapide.

**Défaut de code vérifié dans cette revue.** `kiki_flow_core/master_equation.py:101` passe `epsilon=self.h` au prox sans passer `reg` ; dans `prox_w2`, `epsilon` sert à la fois de poids proximal et, faute de `reg`, de régularisation de Sinkhorn (`sink_reg = max(epsilon, 1e-3)` = h = 0,05). Les deux rôles sont confondus, `FullJKOSolver.epsilon = 0,01` n'est jamais lu et le papier annonce ε = 0,01. Lecture de la revue R3 (d'après Baradat, Hraivoronska & Santambrogio 2025) : le rapport α = ε/τ vaut alors 1 au lieu de 0,2 et la PDE limite reçoit un terme diffusif supplémentaire, ce qui expliquerait l'écart fast/rigoureux (0,22–0,26 nats, de l'ordre du biais par pas à ε = 0,05) et l'inversion d'ordre des espèces ; la dérivation quantitative reste à écrire. Un balayage de ε (~10 min par valeur sur M1) tranche.

**Mise à jour 25/10 00:50.** Le correctif était déjà fusionné sur `main` le 24/10 à 23:54 (PR #25 : `JKOStep(reg=…)`, test `reg == 0,01` / `epsilon == 0,05`, erratum §9 avec rerun à ε = 0,01), postérieurement à la vérification ci-dessus. Le balayage demandé a été exécuté sur electron-server (PR #27, 80 runs, 5 graines, chemin rigoureux) : écart de spécialisation 1,276 ± 0,031 / 1,266 ± 0,028 / 1,234 ± 0,028 bits à ε = 0,01 / 0,02 / 0,05 sur (10, 1, 0), et 1,388 / 1,380 / 1,349 sur (8, 0,5, 5), contre 2,032 et 1,802 sur le chemin rapide. Le gap bouge de 0,04 bit sur ε (≈ 1 écart-type de graine) quand l'écart rapide/rigoureux vaut 0,76 et 0,41 bit : **l'écart ne vient pas de la température de Sinkhorn** (5–10 % au plus) mais de la structure du schéma JKO (ancrage, non-réinjection). L'hypothèse de la revue R3 est donc réfutée sur ce point ; le défaut ε reste un défaut de documentation et de reproductibilité, pas la cause de l'écart.

**Ce qui est tombé.** Deux implémentations du prox ont ignoré `reference` pendant six mois (POT 04-17→06-04, MLX 04-18→10-24) ; rétractés : le facteur MLX 5,13×, la KL d'accord 0,000638 « bits » (→ 0,218 nats), le balayage ε, la figure 1. `MultiscaleLoop.run` ne réinjecte pas la sortie JKO dans les particules. La CI hebdomadaire ne vérifiait que la présence des clés JSON et a « reproduit byte-for-byte » un prox faux : reproductibilité ≠ validité. Le « Peyré floor » est une borne de modèle asymptotique, pas un théorème uniforme, et c'est un choix (W²_ε contre S_ε débiaisé, Hardion & Lavenant 2025). La spécialisation n'est pas émergente dans le régime convexe d'E2 (minimiseur unique) ; seul le spectre négatif de J_sym peut structurer.

**Ce que la littérature change.** Le flot JKO est un flot de gradient de l'énergie libre de Fokker-Planck : le plancher ε/(2τ) se relit comme une température effective parasite (R3, R9), et un double puits en fait un Cahn-Hilliard fibré avec exposant de coarsening t^{1/3} prédit (R7). La littérature MoE 2026 est sceptique sur « 1 expert = 1 domaine » : l'entropie moyenne doit céder la place à une information mutuelle domaine ↔ activation avec nul par permutation.

### 2.4 bouba_sens

**Ce qui tient.** La rigueur des nuls : B-1 rétracté définitivement (10 graines, p = 0,62), B-2 nul confirmé par trois estimateurs ; préregs v0.7–v0.9 statistiquement solides (TOST, N = 95, puissance 0,80).

**Ce qui tombe maintenant.** B-3 était présenté comme « premier invariant architectural du programme » (0,148 / 0,141 / 0,141 / 0,313 / 0,445, « 7–22× le seuil »). Or `query_accuracy` évalue chaque cellule sur n = 64 échantillons, Me6 est le maximum de dix |différences| d'exactitude, et le seuil 0,02 n'a jamais été comparé à un nul. Simulation faite pour cette revue (20 000 réplicats, exactitudes de base 0,3 / 0,5 / 0,7 / 0,9) : sous l'hypothèse nulle, E[Me6 | n = 64] = 0,152 / 0,166 / 0,152 / 0,099 ; aux exactitudes réellement mesurées (me1 ≈ 0,23, proche du hasard à 5 classes), E ≈ 0,13–0,14 et le 99ᵉ centile ≈ 0,30. Les trois mondes synthétiques (0,14–0,15) sont donc dans la plage du nul ; mock (0,31) et ECG (0,45) la dépassent et restent à expliquer (monde construit, propriétés propres de l'ECG, canaux tactile/gravité mis à zéro). Les cinq valeurs proviennent des ADR-0008 et ADR-0009 ; aucun JSON commis ne les contient (l'agrégat v0.5 ne donne qu'une médiane 0,109). De plus (ADR-0020) les trois « doses » de lésion n'ont jamais dépassé ~19,8 dB : B-3 décrit des réseaux intacts. Hypothèses alternatives : masquage à zéro hors distribution, dimensionnalité 3/6-D contre 128/256-D confondue avec la partition, dominance modale ordinaire. Vérifié dans `scripts/aggregate_grid.py:106-223` : Me6 est calculé par cellule (graine × timing × SNR) et B-3 « passe » si la médiane de ces maxima dépasse 0,02 ; le nul simulé s'applique donc directement. Le test décisif (nul d'extrême par n croissant) prend quelques minutes sur M1.

**Autres défauts.** La préinscription OSF de B-1/B-2/B-3 revendiquée (CITATION.cff:16, README.md:79, .zenodo.json:28) n'apparaît pas dans l'enregistrement Q6JYN, qui ne couvre que H1–H4 de dream-of-kiki : les hypothèses bouba_sens sont préenregistrées localement (git), pas sur OSF. main.tex §4.4 garde « Key claim, load-bearing » (contredit l'abstract) ; .zenodo.json garde l'affirmation retirée ; 7 numéros d'ADR doublonnés ; ADR-0006 et tags v0.4.0/v0.5.0 hors de `main` ; 32/40 artefacts gitignorés ; `amedi2007` pointe vers Amedi 2003 ; Loconsole 2026 et Fort & Schwartz 2022, présentés en mémoire comme rationale, sont absents du dépôt.

**Ce que la littérature change.** Dans le monde gaussien les cinq modalités projettent le même latent : l'information de label est entièrement redondante et une « migration » est indéfinissable ; la décomposition PID (redondance/unicité/synergie) rend la MI totale obsolète. Bouba/kiki existe sans langage chez le poussin (Loconsole, Science 391:836), le macaque et le chien (Biffi, Proc B, 7/10/2026) et n'est pas robuste dans les VLM : c'est un contrôle positif à inclure, pas une motivation d'arrière-plan.

### 2.5 baby-brain / BabyBrain

**État.** 649 commits, 283 PR (260 fusionnées en quatre jours), aucune CI, aucune issue. Le papier SP6 contient sept « [RESULTS PENDING] », les Claims A–D ne sont pas testés, l'OSF n'est pas déposé. Seules mesures : trois smoke runs à une graine (500 ticks). Le progrès d'apprentissage (LP) est négatif sur les trois environnements ; le critère a été redéfini après l'échec (LPM, non préenregistré). **Erratum majeur** : README et ROADMAP annoncent « 1b ViZDoom LP PASS » alors que le JSON de résultats dit `gate_1b_lp_pass: false`. La transition développementale est dégénérée (« ADULT in roughly seven minutes »). Le Path-B (WML de zéro) n'a jamais été comparé.

**Ce que la littérature change.** JEPA ne rend pas la thèse redondante : il lui fournit le substrat qui lui manquait (LeWorldModel ~15M paramètres, entraînable sur un GPU, poids MIT de 72 Mo) et lui retire l'originalité du substrat reconstructif SP1. Le SP1 range la perte latente en « auxiliaire » : c'est l'inverse de l'état de l'art. Les angles morts documentés de JEPA (vitesse, état physique) font du corps (proprioception, copie d'efférence) l'argument développemental, pas une option. Le LP à fenêtre glissante est théoriquement inadapté (Oudeyer 2026, Elmoznino 2026). L'architecture A/B/M de Dupoux, LeCun & Malik (2603.15381) est déjà implémentée par baby-brain : à revendiquer.

### 2.6 micro-kiki, micro-kiki-quantum, BSK

**micro-kiki.** Résultats réels mais fragiles (une graine) et majoritairement négatifs : VQC < régression logistique sur PCA-4 ; kill-criterion C2 déclenché ; Task 14 (0,925) rétracté ; Aeon recall@5 = 0,02 ; HumanEval +7 pp mais MBPP −10 pp et GSM8K −41 pp (absent du tex) ; routeur 70,7 % annoncé contre 46,4 % mesuré. Le « null-space superflu » est contredit (PaLoRA, NeurIPS 2026 ; Chowdhury 2609.03150). La borne d'information C5 (`src/routing/info_bound.py:63-70`) somme des informations mutuelles marginales et atteint 150,74 bits pour 10 classes, soit plus que log₂ 10 : elle est invalide, et la ligne « confirmé » correspondante de la table maîtresse (MK-23) est à requalifier. Aeon a besoin d'une baseline RAG brut (Bao 2610.30755 : le RAG naïf bat les mémoires agentiques 6 fois sur 7).

**micro-kiki-quantum.** Code d'une journée, zéro run QPU, zéro dollar ; archivage justifié et renforcé par 2026 (surrogates tensor-train, problème de chargement des données, réservoirs bruités plafonnés). Verdict : rester archivé.

**BSK et le triple hybride.** Les affirmations d'énergie (« 0,032 mJ/token, 91,6× ») sont contredits par toutes les mesures réelles 2026 : SymbolicLight (194M de zéro) consomme 3× plus et tourne 4× plus lentement sur GPU ; SpikingBrain 2.0 ne gagne (−46,5 %) que sur silicium dédié ; le coût du spiking est chiffré à 0,23–0,34 nats à FLOPs égaux (2610.15146). BSK est déjà dépassé en échelle ; sa seule différenciation possible est croissance + élagage, et Warmstarting (2605.13405) montre que la préservation de fonction n'est pas nécessaire. Un protocole d'évaluation honnête existe enfin (écart en nats à FLOPs égaux, J/token mesurés).

### 2.7 Défauts transverses (par fréquence)

1. Une seule graine ou puissance non calculée avant la conclusion (tous les dépôts sauf les campagnes préenregistrées).
2. Seuils sans nul calibré (B-3, test 6, « Peyré floor »).
3. Artefacts gitignorés rendant les chiffres non vérifiables (bouba_sens 32/40, kiki-flow pilot10k/scale50k, dream-of-kiki R1).
4. Documentation en avance sur les résultats (README/ROADMAP « PASS », main.tex « load-bearing », .zenodo.json).
5. Fixtures ou mocks « vrais par construction » (dream-of-kiki mega_v2, mocks fMRI).
6. Double numérotation PR Gitea/GitHub et versions divergentes (DualVer, pyproject, CITATION).
7. Byline « contributors » au pluriel dans 5 dépôts, contraire à la politique PI unique.
8. CI qui vérifie la présence des sorties, jamais leur validité (kiki-flow).
9. Constantes d'ingénierie présentées comme des choix théoriques (codebook 64, ε, scale 20.0).
10. Références de rationale absentes des dépôts (Loconsole, Fort & Schwartz, Hopfield rêveurs).
## 3. Ce que l'état de l'art 2024→octobre 2026 change : sept reformulations convergentes

Chaque reformulation ci-dessous est proposée indépendamment par au moins deux des onze revues ; la matrice détaillée (travaux qui appuient, contredisent, dépassent) est en annexe 03.

| # | Aujourd'hui | Reformulation | Pourquoi (travaux clés) | Revues |
|---|---|---|---|---|
| 1 | DR-0 = créneau hors-ligne borné | DR-0 = **budget** (bits effacés + trafic) qui *choisit* l'opérateur ; un module d'apprentissage en test (TTT) est un substrat conforme | consolidation continue en poids rapides : Titans/Hope, Titan-Llama 2610.19210, SCoL 2605.07076, MemoryBench (Meta, 12/10/2026) ; crossover retain/consolidate Kang 2607.17545 ; Landauer logique Thumann & Soloveichik 2610.24435 | R1, R6, R9 |
| 2 | DR-1 = tout épisode est rejoué puis purgé | DR-1 **sélective**, sans purge obligatoire | étiquetage θ (Denis 2026, PLoS Biol) ; minorité de SWR rejoués ; rétention épisodique brute > consolidation (Zhang 2605.12978) | R1 |
| 3 | DR-3 « structure relationnelle » (reformulé le 23/10) | DR-3 **mesurable** : indice relationnel RCI (mKNN calibré / Gromov-Wasserstein / persistance H₀-H₁), nul « substrats non entraînés », TOST, seuil 0,25 → condition 4 exécutable de C+ | You 2609.27252 ; Bertram 2605.05907 (RSA/CKA aveugles à la topologie) ; Gröger ICML 2026 (nul) ; Houry-Feydy-Vialard (GW à l'échelle) | R11, R3 |
| 4 | Épisodes de rêve discrets vs consolidation continue | DE **imbriqués multi-échelles** à déclencheur endogène ; la frontière de tâche devient une variable d'évaluation préenregistrée | clusters de ripples (Buzsáki, 03/2026) ; porte infra-lente 0,015 Hz (Feng, Neuron 19/10/2026) ; silent-DOF Zhang 2609.31630 ; Nested Learning | R1, R6 |
| 5 | `downscale` à facteur ∈ (0,1] ; DR-4 « plus d'ops ne fait pas pire » | `rescale` à signe indéfini ; DR-4 réouvert **inter-domaines seulement**, avec gate d'admission et métrique compositionnelle | WISE (Kinoshita 2025) ; R²-WAM 2610.18038 ; Nijjer 2607.19749 ; ripples compositionnels (He, Nat Neurosci 05/2026) ; Zahn 2607.16256 | R1 |
| 6 | GTM γ/θ comme mécanisme ; codebook 64 ; hiérarchie bi-fréquence | Oscillation = **porteuse physique**, pas mécanisme logique : alphabet dimensionné par le jitter (≈ 4 bits), comparateur = boucle externe non hiérarchique ; canal ERROR seul | ablations γ ≈ θ ≈ GTM (interne) ; HRM/ARC 2610.13660 ; Haverkort & Todri-Sanial 2026 (506 oscillateurs FPGA) ; CacheBack 2609.32046 ; machines d'Ising à oscillateurs = flot de Wasserstein (2608.16025) | R2, R6, R7 |
| 7 | JKO entropique comme moteur de spécialisation | Que JKO soit le flot de gradient de l'énergie libre est classique (Jordan-Kinderlehrer-Otto 1998, Ambrosio-Gigli-Savaré 2005) ; ce que les revues ajoutent : ε/(2τ) lu comme **température effective** du schéma (balayage du 25/10 : la température n'explique pas l'écart rapide/rigoureux), double puits → Cahn-Hilliard fibré, spécialisation = nucléation, pas émergence en régime convexe | Baradat-Hraivoronska-Santambrogio 2502.12666 ; Heinze-Hopf-Liero 2610.23718 ; Lin-Rigollet 2609.27008 | R3, R7, R9 |

**Trois faits nouveaux pour le programme.** (a) Un formalisme unique relie trois dépôts : kiki-flow (JKO), nerve-wml (machines d'Ising à oscillateurs → flot de Wasserstein en champ moyen) et l'axe matière (coarsening, p-bits). (b) Les « réseaux de Hopfield rêveurs » (1983→2026) sont le prior art formel direct de GENIAL et n'apparaissent dans aucun dépôt. (c) Le benchmark B-3 de bouba_sens, seul positif revendiqué, n'a jamais été comparé à un nul : sur les trois mondes synthétiques il est dans la plage du bruit d'un maximum de dix différences sur n = 64 ; mock et ECG dépassent ce nul et restent à expliquer.

**Ce qui est obsolète.** Les affirmations d'énergie des modèles à impulsions tels qu'écrits ; le routeur VQC ; QPEFT (gains attribués au prétraitement classique) ; « null-space superflu » ; le substrat reconstructif SP1 face à JEPA latent.

**Ce qui reste original et défendable.** L'axiomatisation exécutable de la consolidation avec critère de conformité ; un protocole de messages inter-substrats que NIR n'a toujours pas ; le harnais ontogénétique (stades, plasticité) ; une pratique d'erratum rare dans le domaine.

**Quatre tensions non résolues entre revues** (à trancher par l'expérience, pas par le texte) : (a) la spécialisation de kiki-flow n'est pas émergente en régime convexe (R3) contre « c'est une séparation de phase » (R7) — compatibles seulement au-dessus de la spinodale, d'où le test de balayage λ_J ; (b) la régénération des automates cellulaires stocke la cible dans les poids, la consolidation écrit dans l'état (R8 contre R1/R7) — d'où la distinction poids/état à écrire dans toute préreg « matière » ou « bio » ; (c) l'apprentissage en test (TTT) consomme chaque épisode (appui à DR-1 selon R6) ou sélectionne (contradiction selon R1) ; (d) le multiplexeur γ/θ est-il un cas particulier du spectre de mémoires continues de Hope (R6) ou autre chose (R10) ?
## 4. Brainstorming : nouvelles hypothèses

Les onze revues ont proposé 141 hypothèses, fusionnées en **90** (catalogue complet en annexe 02, NH-01 à NH-90), chacune avec une prédiction chiffrée, un test sur Mac M1 ou RTX 4090, un critère de réfutation et une référence vérifiée. Répartition : 53 prêtes à préenregistrer, 16 pilotes, 21 spéculatives ; 79 sur 90 sortent du paradigme LLM. Elles se regroupent en cinq paris.

**Pari 1 — Le rêve a une formule.** Les réseaux de Hopfield « rêveurs » (noyau J(t) = J(1+t)/(1+tJ), capacité α_c(t)) font du temps de rêve un budget et de `downscale` un désapprentissage d'attracteurs parasites ; `recombine` devient une séparation de mélanges prouvée (DLAM). Hypothèses NH-01, NH-02, NH-05, NH-07 : si un shrink uniforme fait aussi bien que le noyau rêvé, GENIAL est la théorie de l'homéostasie synaptique réécrite ; sinon, c'est la première opération de rêve non triviale.

**Pari 2 — Un seul flot.** Le JKO de kiki-flow, la limite champ moyen des machines d'Ising à oscillateurs (dont le multiplexeur γ/θ est une constellation de phases) et les dynamiques de coarsening sont le même flot de gradient de Wasserstein. Hypothèses NH-58 (ε = température effective), NH-59 (spinodale), NH-60 (coarsening t^{1/3}), NH-28 (alphabet dimensionné par le jitter du canal) : trois dépôts testent une seule équation.

**Pari 3 — La conformité se mesure.** DR-3 et le test 6 deviennent des quantités : indice relationnel RCI avec nul « substrats non entraînés » (NH-25, NH-45), ordre des opérations comme splitting Lie O(τ) contre Strang O(τ²) (NH-20), inclusion de traces et vivacité pour les invariants (NH-46), criticité comme condition C4 avec le contre-modèle « ressource lente » en nul (NH-28).

**Pari 4 — Le corps et le monde latent.** Un modèle du monde latent de 15 M paramètres (LeWorldModel) comme substrat de baby-brain avec perte latente primaire (NH-77), les stades comme politique M de l'architecture A/B/M (NH-78), la copie d'efférence comme source du canal vitesse que JEPA n'a pas (NH-79), et une consolidation « cryptique » révélée par re-lésion (NH-23) : le premier test réel de la thèse « WML de zéro ».

**Pari 5 — La physique sans matériel.** Des substrats conformes C+ simulés sur M1 : machine d'Ising à oscillateurs, Hopfield rêveur, PCM avec dérive (aihwkit), automate cellulaire neuronal, p-bits, PotentialEP sans rétropropagation (NH-28 à NH-31, NH-84 à NH-88). Aucun achat : un GO/NO-GO à huit semaines décide si l'axe « matière » vit.

### 4.1 Les quinze qui tranchent le plus pour le moins

| Rang | NH | Ce que ça tranche | Coût | Si c'est négatif, on apprend |
|---|---|---|---|---|
| 1 | NH-66 | B-3 est-il un artefact d'extrême à n = 64 ? | M1, < 1 h, sans ré-entraînement | si Me6 survit à n = 4096 au-dessus du P95 du nul, l'asymétrie est réelle et les cinq explications triviales restent à tester |
| 2 | NH-58 | le chemin « rigoureux » de kiki-flow est-il un flot ou un thermostat (ε = h) ? **Tranché le 25/10 (PR #27)** : gap insensible à ε (Δ 0,04 bit vs 0,76), l'écart vient de la structure JKO | M1/ES, 12 min | résultat obtenu : le négatif informatif attendu ; NH-60 (coarsening) reste à tester |
| 3 | NH-59 | la spécialisation est-elle émergente (spinodale) ou imposée par les potentiels ? | M1, ~6 min par λ_J | si aucune brisure, le mot « émergent » disparaît de deux papiers |
| 4 | NH-01 | `downscale` est-il un désapprentissage de Hopfield ou un shrink ? | M1, minutes | si shrink ≥ 2× : le pilier B est bien un downscale ; le Hopfield rêveur reste un substrat, pas un mécanisme |
| 5 | NH-25 + NH-45 | DR-3 et test 6 falsifiables : RCI ≤ 0,25 sous nul « non entraîné » | M1, < 1 h | si RCI > 0,5 ou si le 18,8× tombe à ≤ 5×, DR-3 relationnel est réfuté dans sa forme forte |
| 6 | NH-20 | les quatre ops sont-elles un splitting WFR ? Lie O(τ) vs Strang O(τ²) | M1, minutes | mêmes pentes ⇒ l'ordre canonique DR-2' n'a pas de fondement variationnel |
| 7 | NH-04 | même op, même substrat, effet dépendant de la règle (STDP vs surrogate) ? | 4090, heures | si les deux gagnent ou aucun, la règle n'est pas le facteur : chercher le canal de lecture |
| 8 | NH-81 | J/token mesurés, spiking contre dense à iso-qualité | M1 + 4090, heures | si ≤ 1,1× : retirer l'affirmation d'énergie, garder la sparsité comme sujet |
| 9 | NH-32 | le GTM communique-t-il (contenu) ou seulement par présence/timing ? bras désapparié | KXKM après N10-C | si contenu ≥ présence : la communication est réelle et N-6 devient un invariant positif |
| 10 | NH-34 | θ ne transmet que l'imprévu : trafic ÷ 3 ? | CPU, heures | si réduction < 2× ou perte > 2 pp : la symétrie PRED/ERROR est justifiée, N-3 reste un type-checker |
| 11 | NH-46 | protocole mort légal ? inclusion de traces + vivacité L-1/L-2 | M1, heures | si rien n'est trouvé : les invariants de sûreté suffisent, publier le taux de mutants |
| 12 | NH-36 | « deux horloges = gain » : GTM contre boucle externe non hiérarchique | 4090, ~20 GPU-h | un GTM > comparateur sur ≥ 4/5 graines serait le premier gain positif du multiplexage |
| 13 | NH-03 | épisode défini par le budget ou par l'horloge face à la consolidation continue (TTT) ? | M1, ~80 min (port MLX 3–4 j) | si le continu bat le borné de > 3 pts, DR-0 devient un budget d'écriture et TTT le 5ᵉ substrat |
| 14 | NH-23 | consolidation cryptique révélée par re-lésion | M1, 20 graines | pénétrances égales ⇒ toute consolidation est visible ; le pont bioélectrique tombe |
| 15 | NH-77 | le substrat reconstructif SP1 est-il dominé par un JEPA 15 M ? | M1 (poids 72 Mo) | si le ratio inclut 1, la reconstruction n'est pas pénalisante à cette échelle |

Suivants immédiats au même coût : NH-07 (gate de rectification, réouverture de DR-4), NH-67 (PID des mondes, seule définition possible de B-2), NH-50 (la discrétisation gonfle PhiID : généralisation publiable d'ADR-0001), NH-69 (taux de réparation comme estimand de période critique).

### 4.2 Ajouts du second regard (Codex gpt-6.1-sol)

Le passage indépendant de Codex propose 24 hypothèses dont 11 n'apparaissent dans aucune des onze revues : un bloc sensorimoteur (prédiction par copie d'efférence, lésion motrice plutôt que sensorielle, contrôle par le corps) et une famille « matière » élargie à la mécanique, la chimie et les ondes (substrats physiques simulés sans matériel). Elles sont falsifiables et dimensionnées pour M1/4090 ; elles portent le total à **101 hypothèses nouvelles**. Détail et recoupements en annexe 10 ; texte intégral en annexe Codex.

### 4.3 Douze tensions à arbitrer avant tout préenregistrement

Les revues ne sont pas d'accord sur tout (annexe 02 §5 bis). Les plus structurantes : constellation partagée (R2) contre diversité de protocoles (R8) ; « spécialisation non émergente » (R3) contre « séparation de phase » (R7), réconciliables seulement au-dessus de la spinodale ; trois reformulations concurrentes de DR-0 (R1 budget-sélecteur, R6 budget d'écriture, R9 bits effacés + trafic) ; wetware pilote (R6) contre interdit (R8) contre non falsifiable (R1) ; nul « ressource lente » exigé par R7 et absent de R6/R10 ; DR-2 renforcé (R1) contre splitting (R11). Ces arbitrages sont des décisions du chercheur, pas des faits : les hypothèses NH-58/59 et NH-20 en tranchent trois par l'expérience.
## 5. Concepts et intuitions nouveaux, hors du paradigme LLM

Vingt-six concepts dédoublonnés en annexe 02 §4. Les plus porteurs, regroupés, puis deux concepts et une recommandation ajoutés par cette synthèse.

**Sur la consolidation.**
- *Rêve = recuit de désapprentissage à budget fini* (R1, R7, R9) : le temps de rêve est un budget, la capacité α_c(t) une prédiction ; downscale et recombine vivent dans une seule énergie. Falsifiable par NH-01/02.
- *Budget DR-0 = entropie exportée* (R6, R9) : jamais en joules dans l'axiome (ça briserait DR-3), mais en bits effacés + trafic ; un replay réversible coûte du trafic, jamais zéro.
- *Déclencheur endogène et épisodes imbriqués* (R1, R5, R6, R8) : remplacer le cron par une porte interne (surprise, accumulation astrocytaire, rythme infra-lent) ; les épisodes s'emboîtent et existent en veille calme.
- *Homéostasie à signe indéfini* (R1, R9) : `rescale(f)` avec f ≷ 1 selon le contraste de taux ; SHY relu comme baisse du taux de production d'entropie du rappel.
- *Recombinaison rectifiée* (R1) : tout `recombine` passe par un critique interne ; la nullité de RECOMBINE serait un artefact d'absence de porte.

**Sur la communication.**
- *Le nerf est un bus de phase, pas un bus de symboles* (R2, R7) : la phase θ d'arrivée d'un paquet γ est l'adresse, le contenu se réduit à présence/absence ; l'alphabet émerge du verrouillage harmonique et se négocie au handshake selon le jitter.
- *ERROR comme requête ; deux populations alternantes* (R2) : le récepteur émet en θ ce qu'il n'a pas pu prédire, l'émetteur ne répond en γ qu'à cela.
- *Transducteur par verrouillage d'injection* (R2, R7) : deux populations d'oscillateurs se « traduisent » en se verrouillant ; la permutation de codebooks devient une phase relative apprise sans rétropropagation.
- *Le nerf est un faisceau cellulaire* (R11) : fibres = codebooks, restrictions = transducteurs ; l'énergie laplacienne mesure le désaccord de protocole, H¹ ≠ 0 détecte les cycles de routage inconsistants.

**Sur l'auto-organisation.**
- *Régularisation entropique = thermostat ; spécialisation = séparation de phase ; coarsening = loi d'échelle de l'oubli* (R3, R7, R9) : un recuit ε(t) → 0 est une trempe numérique ; l'auto-organisation exige un spectre négatif.
- *Deux géométries* (R3) : le drift non conservatif de kiki-flow n'est pas un flot de gradient ; une formulation lagrangienne à résidus unifierait transport et drift.
- *Plasticité = conversion redondance → unicité* (R4) : une lésion ne déplace pas d'information, elle change le budget PID ; l'asymétrie « perceptif/proprioceptif » serait une fonction du degré du nœud.
- *Période critique = vitrification* (R4, R7) : le verrou de constellation est un refroidissement brutal ; une vraie fenêtre est un recuit, avec temps de ré-adaptation en exponentielle.

**Sur le développement et le substrat.**
- *Ontogenèse = décompression d'un goulot génomique* (R8) ; stades = politique M ordonnant observation (A) et action (B) (R5).
- *Mémoire d'état contre mémoire de poids* (R8) : ajouter au substrat de rêve un canal lent persistant réécrivable sans gradient ; le rêve comme re-coupe.
- *Rêve physique = relaxation* (R6, R7, R9) : un épisode est une relaxation (EqProp, PotentialEP), le budget une énergie dissipée mesurée ; une famille de substrats « physiques » conformes sans matériel.
- *Criticité comme service du substrat* (R6, R7, R8, R9, R10), avec le contre-modèle « ressource lente » comme nul obligatoire.

**Deux concepts et une recommandation ajoutés par cette synthèse** (propositions, non issues des revues).
1. *L'épisode de rêve comme transaction.* DR-0 à DR-4 décrivent, mot pour mot, les propriétés d'une transaction de base de données : journalisation (accountability), atomicité (épisode borné), isolation (partition d'écriture W/H), durabilité (conformité). Le programme gagnerait à le dire ainsi : cela remplace « axiomes » par un vocabulaire que les méthodes formelles savent vérifier (TLA+ sait prouver ACID) et rend le « protocole mort » (NH-46) une question standard. Falsifiable : un substrat conforme C+ qui viole l'isolation sous concurrence de deux épisodes.
2. *Recommandation stratégique : le registre de nuls comme produit.* Ce que le programme sait faire de mieux aujourd'hui est retirer proprement des affirmations antérieures (B-2, DR-4, GTM, VQ ×10) ; ce n'est pas encore une découverte, mais les outils de ce retrait en sont une possible. Publier les *calibrateurs* eux-mêmes (nul d'extrême pour un max de k différences à n échantillons ; nul de discrétisation pour MI/H et PhiID ; nul « non entraîné » pour l'alignement) comme bibliothèque citable transforme une faiblesse apparente en contribution méthodologique que d'autres utiliseront.
3. *Lésion du substrat plutôt que de la modalité.* bouba_sens lèse une entrée ; GENIAL prétend à l'indépendance du substrat. L'expérience qui réunit les deux consiste à changer le substrat au milieu d'un épisode (MLP → LIF, poids → état) et à mesurer ce qui survit : c'est le seul test où « substrat-agnostique » et « plasticité » sont la même question. Falsifiable : si rien ne survit au changement, DR-3 est une propriété de typage, pas de dynamique.
## 6. Nouveaux champs de recherche : verdicts

Le PI a proposé l'axe « matière » (alignement cristallin, changements d'état, spin) et quatre axes complémentaires. Les revues R6 à R11 concluent chacune par un verdict ; aucune ne recommande un nouveau dépôt ou un nouveau « champ » autonome. Toutes recommandent des *pistes* intégrées aux dépôts existants, avec critères d'arrêt chiffrés.

| Axe | Verdict | Conditions | Pilotes (durée, machine) | Critères d'arrêt |
|---|---|---|---|---|
| **Matière** (R7) : cristallisation, états, spin | **Ouvrir sous conditions**, comme « track M » dans kiki-flow et nerve-wml | Reformuler DR-3 d'abord ; refuser les ponts faibles (épitaxie↔alignement, cristaux temporels, CISS, Posner) ; aucun achat matériel avant positif en simulation | H1 HopfieldDreamWML dans nerve-wml ; H3/H4 coarsening t^{1/3} dans kiki-flow (8 semaines, M1) | A1–A5 (R7 §7) ; GO/NO-GO à 8 semaines |
| **Bioélectricité / morphogenèse** (R8) | **Ouvrir sous conditions** (« R8-lite ») | Pas de wet-lab ; substrat NCA branché sur le WML Protocol et C+ ; cantonner « cognition partout » au related work | H1 budget de retour d'attracteur, H3 robustesse par hétérogénéité de protocoles, H2 consolidation cryptique (1–2 semaines, M1) | après H1+H3 : α > 1 sans r* ET pas d'effet diversité → fermer |
| **Thermodynamique** (R9) | **Ouvrir en annexe formelle**, pas en axe | Pas de reformulation de DR-0 en joules (brise DR-3) ; budget en bits effacés + trafic | H5 (ε/(2τ) = température), H1, H7 (J/token mesurés), H3/H9 (≤ 3 semaines, M1) | si H5 et H7 ne tranchent pas → repli en annexe |
| **Mathématiques structurales** (R11) | **Ouvrir : prérequis** de tout le reste | Formaliser DR-3 et test 6 avant toute autre préreg ; vérification des invariants par inclusion de traces + PBT | H1 RCI-GW sur G5, H2 nul non entraîné, H7 splitting Lie O(τ) vs Strang O(τ²) (< 1 h chacun, M1) | formalisme sans statistique = arrêt |
| **Conscience** (R10) | **Ne pas ouvrir** | Interdiction lexicale écrite dans les papiers ; sous-axe nerve-wml « contrôles d'intégration et de diffusion » seulement | H1, H2, H4, H8 (contrôles négatifs < 1 semaine) | réévaluation à 12 mois (résultats INTREPID) |
| **Quantique** (R6) | **Rester archivé**, zéro QPU | Documenter la raison scientifique (fait le 23/10) | aucun | — |
| **Wetware** (R6) | **Ne pas ouvrir** ; un test unique possible | Réservoir fixe non apprenant ; coût 1–2 k€ ; Claim B oui / Claim A non | H4 (test d'agnosticisme ultime) seulement si financé | — |
| **JEPA / post-transformer** (R5, R6) | **Adopter comme substrat** | WML-JEPA = perte latente primaire ; TTT comme substrat C+ ; corps (proprio, efférence) comme argument | LeWorldModel sur M1 ; H1/H2/H4 de R5 | — |

**Lecture d'ensemble.** La bonne nouvelle est structurelle : les trois ponts solides de l'axe matière (JKO ↔ Cahn-Hilliard, Ising à oscillateurs ↔ flot de Wasserstein ↔ GTM, Hopfield rêveurs ↔ GENIAL) ne demandent pas de nouveau dépôt mais réunissent trois dépôts qui parlaient trois langues. La mauvaise nouvelle est la même pour tous les axes : rien ne peut s'emprunter à la physique ou à la biologie tant que DR-3 n'est pas mesurable, parce que « substrat-agnostique » est précisément la promesse que ces axes viendraient tester.
## 7. Plan d'action priorisé

Ordre : d'abord corriger ce qui est faux, ensuite rendre falsifiable ce qui ne l'est pas, enfin lancer les nouvelles hypothèses. Les durées sont des ordres de grandeur de calcul et d'écriture, hors relecture, erratum et CI ; compter le double en calendaire. Tout ce qui suit tourne sur Mac M1 32 Go sauf mention ; KXKM et macM1 restent réservés à N10-C jusqu'à sa fin (~mi-novembre).

### 7.1 Arrêter ou rétracter (semaine 1)

| Action | Dépôt | Pourquoi | Coût |
|---|---|---|---|
| Test du nul d'extrême pour Me6 par n croissant (64 → 1024), puis rétractation de B-3 sur la magnitude si confirmé ; corriger README, ADR, .zenodo.json, main.tex §4.4 | bouba_sens | E[Me6 ∣ H0, n = 64] ≈ 0,10–0,17 = plage « PASS » | 1 h |
| ~~Corriger `epsilon=self.h`~~ **fait** (PR #25 fusionnée le 24/10 23:54, erratum §9) ; balayage ε **fait** (PR #27, 25/10) : écart insensible à ε ; reste à fusionner #27 et à requalifier la cause de l'écart rapide/rigoureux | kiki-flow | ε réel 0,05 ≠ 0,01 annoncé | fait |
| Retirer des README/ROADMAP les « PASS » sans artefact (ViZDoom 1b, MuJoCo) ; marquer le SP6 « sans résultat » | baby-brain | JSON dit `gate_1b_lp_pass: false` | 30 min |
| Retirer les claims énergie (0,032 mJ/token, 91,6×) tant qu'aucun J/token n'est mesuré | micro-kiki, BSK | contredits par toutes les mesures 2026 | 30 min |
| Réécrire `loihi_stub.py` (Lava archivé) ; aligner main.tex (15/15 → 19/20, N = 4, Transformer mesuré) | nerve-wml | faits périmés | 2 h |
| Byline PI unique dans les 5 dépôts (.zenodo.json, CITATION.cff, CONTRIBUTORS.md, spec) | tous | politique PI | 1 h |
| Retirer la mention « préenregistré sur OSF » de CITATION.cff, README et .zenodo.json tant que B-1/B-2/B-3 ne figurent dans aucun enregistrement OSF ; déposer la préreg v0.7 ou e-Soleau | bouba_sens | Q6JYN ne couvre que H1–H4 de dream-of-kiki | 30 min |

### 7.2 Rendre falsifiable (semaines 1–3)

1. **DR-3 → indice RCI** (R11 H1/H2) : objet relationnel R(S,E), trois niveaux (mKNN calibré, GW entropique, persistance), nul « substrats non entraînés », TOST seuil 0,25, Holm. < 1 h de calcul sur G5. Devient la condition 4 de C+.
2. **Test 6 → profil de treillis Π** avec décision préenregistrée ; « metric alignment not tested » tant qu'aucun TOST.
3. **DR-0 → budget en bits effacés + trafic** (R9 H1) ; DR-1 sélective ; `downscale` → `rescale` (R1 T5).
4. **Invariants N/W → inclusion de traces** (Quint/TLA+) + property-based testing, ajout de deux propriétés de vivacité.
5. **Préregs v0.7–v0.9** : ajouter décodabilité et PID (R/U/S) en co-primaires et le contrôle positif bouba/kiki (monde physique) avant dépôt.
6. **N10-C** : avenant daté ajoutant le bras « message désapparié », le récepteur warm-start et la baseline VQ, sans toucher aux runs gelés.

### 7.3 Lancer (semaines 3–10) — les hypothèses qui tranchent le plus pour le moins

| Priorité | Hypothèse | Dépôt | Ce qu'elle tranche | Durée |
|---|---|---|---|---|
| 1 | Rêve ≠ downscale : HopfieldDreamWML (unlearning de Fachechi-Agliari-Barra) contre downscale pur, métrique d'énergie | nerve-wml / dream-of-kiki | si égalité → GENIAL = SHY reformulé ; si écart → première op de rêve non triviale | minutes à heures, M1 |
| 2 | ε-température : KL(ε) suit ε/(2τ) ; coarsening t^{1/3} sous double puits | kiki-flow | relie JKO à la physique ; sauve ou condamne le « Peyré floor » | 1 j, M1 |
| 3 | Splitting : ordre des ops de rêve = non-commutativité d'un flot WFR ; erreur Lie O(τ) vs Strang O(τ²) | dream-of-kiki / kiki-flow | donne enfin à DR-2 une prédiction quantitative | 1 j, M1 |
| 4 | WML-JEPA : LeWorldModel latent comme substrat de baby-brain, stades contre bras chronologique | baby-brain | premier test réel de la thèse « WML de zéro » | 1–2 semaines, M1 |
| 5 | Alphabet dimensionné par le jitter : SER par taille d'alphabet sous jitter ms ; prédiction : 16 > 64 | nerve-wml | fixe le codebook par la physique, pas par choix | 1 j, M1 |
| 6 | Consolidation continue (TTT) comme substrat C+ contre épisodes discrets, à budget égal | dream-of-kiki | survie de DR-0 face à Titans/TTT | 1 semaine, 4090 après N10-C |
| 7 | J/token mesurés (powermetrics, NVML) : spiking contre dense à iso-qualité | BSK / micro-kiki | ferme ou rouvre l'argument énergie | 2 j, M1 + 4090 |
| 8 | RECOMBINE inter-domaines avec gate d'admission et métrique compositionnelle | dream-of-kiki | réouverture de DR-4 | 1 semaine, M1 |
| 9 | NcaWML : budget de retour d'attracteur ; robustesse par hétérogénéité de protocoles | nerve-wml | premier substrat non neuronal conforme C+ | 1–2 semaines, M1 |
| 10 | Baseline RAG brut contre Aeon ; critère Intruder Threshold contre angles null-space | micro-kiki | justification de la couche mémoire | 2 j, M1 |

### 7.4 Dette de publication (en parallèle)

Déposer Paper 1 v0.2 sur arXiv et minter le Zenodo dream-of-kiki ; référencer Zenodo 23619954 dans ERRATUM.md ; publier le nul B-1/B-2 en équivalence (TOST) pour débloquer TMLR ; corriger la bib micro-kiki ; remplir §2 du SP6 ou le retirer.

### 7.5 Ce que l'on ne fait pas

Pas de nouveau dépôt, pas de QPU, pas de wet-lab, pas d'achat de matériel neuromorphique ou spintronique, pas d'axe « conscience », aucune relance de BSK avant la mesure J/token, aucun dépôt OSF d'une préreg dont l'estimand n'a pas de nul calibré.

### 7.6 Posture

Garder la discipline, simplifier l'emballage. Les revues ont jugé le programme à l'aune de ses propres mots (« lab », « axiomes », « invariant architectural ») et c'est là qu'il a le plus perdu. « Un développeur indépendant qui teste des hypothèses préenregistrées sur du matériel grand public, et publie ses nuls » est une position plus forte et plus défendable. Concrètement : « axiome » → « hypothèse de cadre » tant qu'il n'y a pas de preuve ; « invariant » réservé à ce qui a passé un nul calibré ; pas de marque ni de Registered Report avant qu'il y ait quelque chose à protéger ou à soumettre.
## 8. Actualités à suivre (septembre–octobre 2026, dédoublonnées ; liste complète en annexe 03 §3)

| Date | Fait | Pourquoi ça compte pour Hypneum |
|---|---|---|
| 09/09 → 03/10 | Zhang et al., replay sur synapses silencieuses sans phase hors-ligne (arXiv:2609.31630, accepté NeurIPS 2026 CL) | découple consolidation et état : touche DR-0/DR-1 et la notion d'épisode discret |
| 23/09 | You et al., « Structure over Geometry » (arXiv:2609.27252) | pivot de la reformulation de DR-3 |
| 24/09 | Hartl, Risi, Levin : LoRA de rang 1 sur automates cellulaires neuronaux (arXiv:2609.29755) | pont inattendu entre la pile LoRA de micro-kiki et un substrat non neuronal |
| 03/10 | PaLoRA (NeurIPS 2026, arXiv:2610.04226) ; Sui et al. (NeurIPS 2026, arXiv:2610.04792) | invalide « null-space superflu » ; base du v0.8 de bouba_sens |
| 03/10 | Velocity Blind Spot : LeWorldModel sans vitesse (arXiv:2610.04585) | le corps devient l'argument de baby-brain face à JEPA |
| 07/10 | Bouba/kiki chez le chien (Biffi et al., Proc B) ; deux populations alternantes 40/6 Hz (arXiv:2610.10977) | contrôle positif bouba_sens ; ancrage PRED/ERROR |
| 09/10 | Limite champ moyen des machines d'Ising à oscillateurs = flot de Wasserstein (arXiv:2608.16025 v2) | pont formel nerve-wml ↔ kiki-flow ↔ spin |
| 10/10 | PotentialEP, générateur sans rétropropagation (arXiv:2610.14409) ; lois d'échelle spiking v2 (arXiv:2610.15146) ; ePC 4 bits | ops de rêve hors gradient ; protocole honnête pour BSK ; substrat PC conforme sur M1 |
| 12/10 | Meta MemoryBench, World-T3 (arXiv:2610.17434) | le marché mesure la consolidation continue : DR-0 doit être un budget |
| 13/10 | R²-WAM, rectification des rollouts (arXiv:2610.18038) ; Titan-Llama (arXiv:2610.19210) | gate d'admission pour RECOMBINE ; mémoire externe contre LoRA |
| 14/10 | Lattice Representation Hypothesis (arXiv:2610.20286) | alternative au RCI pour DR-3 |
| 16/10 | Cahn-Hilliard fibré (arXiv:2610.23718) ; equivtest v0.2.0 + TOST (arXiv:2610.23700) ; Braille sur organoïdes 83 % vs 82 % SVM | pont P1 de l'axe matière ; outil v0.7 ; wetware = réservoir non apprenant |
| 19/10 | Feng et al., Neuron : porte infra-lente des ripples (Chrm2) | déclencheur endogène des épisodes de rêve |
| 22/10 | p-bits à états continus sur FPGA (arXiv:2610.31339) ; port MLX de V-JEPA 2.1 | substrat probabiliste bon marché ; JEPA sur M1 |
| 24–29/10 | BabyLM 2026 (EMNLP Budapest), résultats à venir ; 27/10 Krotov sur les mémoires associatives denses comme systèmes physiques | voisins directs de baby-brain et du banc Hopfield |

Absences informatives : aucune annonce « IA qui apprend en continu » d'un grand laboratoire en octobre ; pas de Loihi 3 ; aucun résultat Cortical Labs revu par les pairs ; aucun QPEFT/QMoE 2026 ; Lava archivé (dernier push 13/05) ; Dreamer 4 toujours sans code officiel.
## 9. Second regard : convergences et divergences avec le passage Codex (gpt-6.1-sol)

Un rapport indépendant de 480 lignes a été produit en aveugle par Codex (OpenAI gpt-6.1-sol, raisonnement xhigh, recherche web) sur le même brief, puis comparé point par point au présent rapport, avec vérification de ses références par l'annexe 10 (31 arXiv, 22 DOI/URL, 3 Zenodo : aucune introuvable). Détail en annexe 10.

**Convergences fortes** (21 points) : toutes les rétractations et requalifications majeures (GO 1,5B/7B, RECOMBINE vide comme non-rejet, G4-ter non transféré, Helium nul, prox kiki-flow, Claim B artefact de VQ, GTM tied, N-3 type-checker, B-1/B-2 nuls, SNR jamais atteint, baby-brain LP, quantique archivé) et la posture méthodologique (non-rejet ≠ équivalence ; pas de QPU, pas de wet-lab, pas d'achat).

**Où Codex corrige ce rapport** (intégré ci-dessus) :
1. L'enregistrement OSF Q6JYN ne couvre que H1–H4 de dream-of-kiki ; bouba_sens n'est pas préenregistré sur OSF malgré ce qu'affirment CITATION.cff, README et .zenodo.json. Gravité haute : la table maîtresse (annexe 01) rangeait B-1/B-2/B-3 en « préreg OSF ».
2. La borne d'information C5 de micro-kiki somme des MI marginales (150,74 bits > log₂ 10) : invalide ; MK-23 passe de « confirmé » à « réfuté ».
3. La date « Lava archivé le 13/05 » est une date de dernier push, pas d'archivage.
4. Deux lignes de l'annexe 01 à requalifier : KFR-H35 (« recall 0,99 » du DriftTrigger sans artefact JSON), et la ligne 300 qui dit « Zenodo 23619954 non trouvé » alors que le record existe (publié le 24/10).

**Où ce rapport corrige Codex** : l'amendement OSF TPM5S existe (21/04, DataCite) ; le bug ε de kiki-flow est localisé (`master_equation.py:101` ; `full_jko_solver.py:19,30` jamais relu ; `paper_run.py:112,115` h = 0,05) là où Codex écrit seulement « ε parfois ignoré » ; le tag de gel est `n10c-freeze-20261024`.

**Apports propres de Codex à reprendre** : incohérence 11 contre 12 permutations dans l'amendement DR-2 (`dr2-empirical-falsification.md:39,93,106`) ; heuristique de taux de décharge codée en dur dans la conversion SpikingKiki (`convert_spikingkiki_35b.py:528-530`) ; erreur 7 680 $ contre 80 $ dans la spec QPEFT ; `n_received: 0` et `apply_consolidation: false` dans les JSON d'ablation N-3 ; corpus T3 = 8 189 exemples ; une famille « matière » élargie à la mécanique, la chimie et les ondes ; onze hypothèses nouvelles absentes des onze revues (sensorimoteur, substrats physiques simulés : H-N01, 02, 07, 08, 09, 15, 17, MAT-H4 à H7), toutes falsifiables sur M1/4090.

**Apports propres de ce rapport absents de Codex** : le prior art des Hopfield rêveurs (absence vérifiée dans les trois dépôts), le nul d'extrême de B-3 (n = 64 vérifié, simulation), les trois ponts formels de l'axe matière, l'indice RCI pour DR-3, le comptage à 180 affirmations, l'inventaire des licences GitHub.

**Lecture.** Les deux passages sont complémentaires : Codex pousse le sensorimoteur et les substrats physiques simulés ; ce rapport pousse les ponts formels et la mesurabilité de DR-3. Non tranchés : le statut GitHub de micro-kiki-quantum, la date réelle d'archivage de Lava, le corps de Zahn v2.
## 10. Méthode, limites, fichiers

**Sources internes.** Clones GitHub à jour du 24/10/2026 des 11 dépôts hypneum-lab (les copies locales sous `~/Documents/Projets` datent de mai 2026 et n'ont pas été utilisées). Cinq inventaires en lecture seule (un agent par dépôt ou groupe), chacun citant fichier:ligne, `git log`, tags, PR et issues GitHub. Deux points ont été re-vérifiés à la main dans cette revue : le défaut `epsilon=self.h` de kiki-flow (`master_equation.py:101`) et la taille de sonde n = 64 de bouba_sens (`loop.py:306-331`), ce dernier complété par une simulation du nul (20 000 réplicats).

**Sources externes.** Onze revues thématiques (R1–R11) menées en parallèle avec consigne de ne pas dupliquer la veille du 23/10 (160 arXiv) : recherche web, API arXiv (souvent en 429, vérifications reportées sur les pages abs/), Crossref/Europe PMC pour les DOI, `gh search` pour GitHub, API Hugging Face pour modèles, datasets et papers. Chaque revue a vérifié ses références une à une et marqué les sources faibles (⚠ / ✱ / (2nd)). Ordre de grandeur : ~200 recherches web, ~150 requêtes GitHub, ~130 requêtes HF, ~450 identifiants arXiv ou DOI vérifiés.

**Second regard.** Un passage en aveugle de Codex (OpenAI gpt-6.1-sol, raisonnement xhigh, recherche web) sur le même brief, comparé point par point (§9, annexe 10). La critique croisée prévue avec gpt-6-astra n'a pas pu avoir lieu (quota OpenAI atteint deux fois le 24/10, réinitialisation le 25/10 à 02:28) ; elle a été remplacée par une relecture indépendante à contexte vierge (annexe 11), dont les corrections sont intégrées. Le passage astra reste à faire si le PI le souhaite : le brief est prêt dans `codex/astra/prompt.md`.

**Limites.** (1) Quotas : les recherches web de chaque revue ont été plafonnées (12–25 requêtes) ; les annonces d'éditeurs de septembre–octobre ne sont pas exhaustives ; BabyLM 2026 (atelier du 24 au 29/10) n'a pas publié ses résultats. (2) Pages bloquées : Science (erratum Loconsole), Proc B (Biffi), MIT Press, quelques PubMed — DOI confirmés, contenus non lus. (3) N10-C est en cours : aucun résultat n'est intégré, et rien n'a été lancé sur KXKM ni macM1. (4) La simulation du nul B-3 suppose des cellules indépendantes de même exactitude de base ; l'agrégateur prend bien le maximum par cellule puis la médiane sur les cellules (`aggregate_grid.py:106-223`), ce que la simulation reproduit. (5) Les hypothèses nouvelles sont des propositions ; aucune n'a été préenregistrée ni testée ici.

**Où tout se trouve.** Dépôt GitHub hypneum-lab/.github, PR #3, dossier `docs/research/2026-10-24-revue-hypotheses/` : ce rapport (README.md), `inventaires/` (5 fichiers), `revues/` (R1–R11), `synthese/` (table maîtresse 01, catalogue 02, matrice 03, comparaison Codex 10, critique indépendante 11), `codex/` (rapport gpt-6.1-sol), `veille-2026-10-23.md`. Copie dans Outline (collection Hypneum Lab) et dans un Claude Doc.
