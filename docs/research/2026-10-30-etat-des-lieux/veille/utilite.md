# Hypneum Lab : à quoi sert ce qu'on a déjà construit ?

30 octobre 2026. Sources : clones des dépôts (état du 23 au 30/10), ROADMAP, PROJECT-MANAGEMENT, revue du 24/10, mémoires. Heures = ordres de grandeur, développeur seul assisté d'agents. Les dates d'appels (FOSDEM, NLnet, ICBINB) **n'ont pas été vérifiées**.

**Contrainte qui commande tout le reste** : 10 h/semaine, soit **≈ 130 h de novembre à janvier**, et la roadmap les attribue déjà toutes. Une piste d'utilité ne s'ajoute donc pas au programme : elle remplace une tâche ou se greffe sur une tâche existante. La recherche de CDI fait aussi concurrence au même temps libre.

## 1. Inventaire des actifs réutilisables

Maturité : **P** = prototype, **T** = testé (tests unitaires et CI), **K** = packagé (PyPI ou HF).

### Outils et bibliothèques

| Actif | Dépôt / chemin | Maturité | Licence | Qui s'en servirait | Effort pour l'autonomiser |
|---|---|---|---|---|---|
| **Garde de campagne gelée** : tag annoté vérifié sur `origin`, SHA-256 du manifeste lu dans le tag, SWHID obligatoire, arbre propre, frontière d'exécution « dev ≤ 1 M pas / registered ≥ 50 M », attente de GPU libre (`nvidia-smi`), file de campagne | nerve-wml `experiments/procgen_multiagent_gtm_comm/campaign/` (2 625 lignes, `guards.py` 890) | T, mais câblé sur N10-C | MIT | équipes ML qui préenregistrent, auteurs de Registered Reports, MLRC/ReScience | **25–35 h** : extraire un `prereg-guard` générique (config YAML, sans la logique N10-C), doc, PyPI |
| **Nul apparié par sign-flip** sur des succès par item, plus calibration du maximum de différences | bouba_sens `scripts/me6_paired_null.py`, `me6_null_calibration.py`, tests dédiés | T | MIT | toute personne qui seuille un « max de différences d'exactitude » (ablations, lésions, sondes) | **10–15 h** pour une petite lib + notebook ; **4 h** pour un gist ou un billet |
| **Mesure de J/token** : rail GPU IOReport (Apple Silicon), NVML, lectures GPU en échec fermé, appariement iso-qualité | micro-kiki `results/nh81/` + code NH-81 | T (un seul run, M1 Max) | Apache-2.0 | communauté MLX / r/LocalLLaMA, tout article « mon modèle est plus sobre » | **15–20 h** (CLI `jpt`, 2 backends, doc) ; valeur carrière MLOps directe |
| **Solveur JKO implicite certifié** (encadrements OT, certificat interne relatif, verdict à trois états) + note d'identification du pas | kiki-flow `kiki_flow_core/track2_paper/`, PR #51 (29/10), `docs/notes/…jko-step-identification.md` | T, très récent, 3 rondes de revue | MIT | niche : flots de gradient de Wasserstein en NumPy/MLX | **30–40 h** (API stable, comparaison à POT/OTT-JAX) ; public restreint |
| **Constructeur de corpus E1 de faits datés** : RealtimeQA + Daily Oracle + MMLU-CF, coupure 2026-04-16, contrôle de contamination par date, quasi-doublons, split déterministe | dream-of-kiki `scripts/e1_corpus_*.py` | T | MIT (code) ; **licences des sources à vérifier** | évaluation de la contamination temporelle des LLM | **12–20 h** : publier le constructeur et les hachages, pas les données |
| **nerve-wml** (protocole de neuroletters) | PyPI (v1.8.0) | K | MIT | personne d'identifié (0 contributeur externe) | rien tant que Claim A n'est pas publié |
| Restent internes (0 h) : DriftTrigger (T sur traces synthétiques seulement, « recall 0,99 » sans artefact) ; exporteur DR-3 (épinglé sur nerve-wml v1.9.0) ; suite C+ et son audit adverse ; monde ActionSense (données CC BY-NC-SA) ; firmware ESP32-S3 et apps de baby-brain (P) ; 10 LoRA HF de micro-kiki (K, résultats fragiles) | | | | | |

### Méthodes

Toutes sont appliquées, aucune n'est packagée, et elles servent la note méthodo, la formation et l'argument de recrutement :
- **préreg à niveaux L0–L3** (tag + SWH, e-Soleau/Zenodo, OSF/Octopus), appliquée à N10-C, NH-01, NH-03, NH-81, B-3 et E1 ;
- **nul apparié avant tout seuil**, « invariant » réservé à ce qui passe un nul (bouba_sens ADR-0022 à 0024) ;
- **errata avec cause racine** (7 documents formels, ≈ 70 items) ;
- **verdict rendu par script**, 9 classes de verdict, *definition of done* ;
- **critique croisée par un second LLM en aveugle** (revue §9), utile en encadré mais risquée comme sujet principal.

### Résultats négatifs publiables (avec artefact)

1. **NH-81** : le LLM à impulsions consomme autant ou plus que le dense sur M1 (R̂ = 0,91, IC95 [0,83 ; 1,01], 12/12 paires, préreg taguée avant mesure). C'est le négatif le plus « vendable » : court, chiffré, dans un sujet à la mode.
2. **B-3** : l'« invariant architectural » se ramène à un nul (Gaussien : p = 0,17 au nul apparié, puis interaction lésion × requête p = 0,49), et sa sonde était au hasard (0,254 pour 4 classes). C'est le cas d'école du seuil sans nul.
3. **kiki-flow** : un prox W2 ignorait `reference` pendant six mois ; une CI qui « reproduit à l'octet » un calcul faux ; et le pas « rigoureux » n'est pas un pas JKO. Leçon : la reproductibilité n'est pas la validité.
4. **RECOMBINE** : aucun bénéfice détecté (4 bancs × 4 substrats, MDE d ≈ 0,86), plus **NH-03** : le gain du TTT s'explique par la récence (`late_block` 94,98 contre 77,10 en uniforme).
5. **nerve-wml Claim B** : alignement de 0,93 en discret contre ≈ 0,10 en continu pré-VQ. Le chiffre dépend de l'estimateur, un résultat méthodologique général.

## 2. Pistes d'utilité classées

Verdicts : **M** = faire maintenant (novembre), **A** = après M1 (29 nov), **X** = abandonner.

### (a) Publication

| Piste | Valeur | Coût | Prérequis | Risque | Délai | Verdict |
|---|---|---|---|---|---|---|
| **Note méthodo « Calibrated nulls and errata in a solo preregistered programme »** (B-3, ε/prox kiki-flow, Claim B, N-3 inactif, NH-81) | haute : seul publiable qui capitalise les six mois ; argument d'embauche | 35–45 h (déjà en S11–S13) | B-3 et JKO clos ; N10-C non requis | refus « hors périmètre » | fin janvier | **A** ; plan et figures dès décembre |
| Venue de la note : TMLR **ou** *Journal of Trial and Error* **ou** atelier ICBINB (NeurIPS/ICLR) | JOTE et ICBINB sont faits pour les négatifs ; TMLR a plus de prestige | 0 h | choisir avant d'écrire | ICBINB pas toujours archivé | novembre | **M** (QCM 2) |
| Note courte NH-81 sur arXiv (4 pages) | visibilité rapide, sujet porteur | 10–12 h | endorsement arXiv | une seule machine | 3 semaines | **A**, ou l'intégrer à la note |
| ReScience C | faible : la revue reproduit des travaux *publiés* | 20 h | — | format inadapté | — | **X** |
| Paper 1 GENIAL v0.2 ; papier N10-C | moyenne ; DR-3 et DR-0 sont en cours de reformulation, N10-C-bis va probablement donner un négatif | 15 h + 30 h | verdict H13 ; fin de N10-C-bis | publier un cadre qui change le mois suivant | T1–T2 2027 | **A** |

### (b) Outils autonomes

| Piste | Valeur | Coût | Prérequis | Risque | Délai | Verdict |
|---|---|---|---|---|---|---|
| **`prereg-guard`** : la garde de N10-C rendue générique (tag + SHA du manifeste + SWHID + frontière dev/registered) | seule brique sans équivalent connu ; annexe logicielle de la note ; profil MLOps | 25–35 h | API validée sur 2 usages | aucune adoption (0 contributeur externe) | janvier | **A** |
| **`jpt`** : mesure de J/token sur Apple Silicon et NVIDIA | utile à la communauté MLX ; vitrine MLOps concrète pour le CV | 15–20 h | 2e machine (KXKM, NVML) | IOReport non documenté, fragile selon la version de macOS | décembre | **A** (carrière), ou **M** dans le scénario carrière |
| Lib `pairednull` (Me6) | moyenne ; mieux comme notebook pédagogique | 4 h (gist) / 12 h (lib) | — | trop petit pour une lib | novembre | gist **M** ; lib **X** |
| Constructeur E1 de faits datés (sans données) | moyenne-haute : la contamination temporelle est un vrai problème | 12–20 h | licences RealtimeQA / Daily Oracle / MMLU-CF vérifiées | redistribution interdite, concurrence de benchmarks mieux financés | après le run E1-small | **A** |
| Solveur JKO certifié, DriftTrigger, C+, loader ActionSense en paquets | public de niche ou nul | 8–40 h chacun | — | maintenance seule | — | **X** |

### (c) Transfert : produit, formation, conseil

| Piste | Valeur | Coût | Prérequis | Risque | Délai | Verdict |
|---|---|---|---|---|---|---|
| **Module de formation « Rigueur expérimentale en IA »** (préreg, nuls, errata, cas réels Hypneum) via un organisme Qualiopi partenaire | revenu possible ; les cas existent | 25 h (une journée) + démarchage | partenaire Qualiopi (certification propre trop chère) | demande non solvable ; conflit avec un CDI | T1 2027 | **A** ; le support découle de la note |
| Audit « AI Act » (iact-bench) sous L'Électron Rare | dépend d'ailiance, pas de Hypneum | 20 h | infra (Tower mort) | marque abandonnée le 10/10 | — | **X** ici |
| Réutiliser `jpt` et la méthode NH-81 dans des missions edge-AI de L'Électron Rare (ESP32/MLX) | concrète : « combien de joules ? » est une question client | 0 h de plus si `jpt` existe | `jpt` | faible | 2027 | **A** |

### (d) Carrière et visibilité

| Piste | Valeur | Coût | Prérequis | Risque | Délai | Verdict |
|---|---|---|---|---|---|---|
| **Page portfolio « Hypneum en 5 résultats »** (1 page : NH-81, B-3, kiki-flow, NH-03, Claim B ; chaque fois chiffre + artefact + erratum) | haute pour le CDI IA/MLOps : montre jugement et rigueur, pas l'emballage | 6–8 h | aucun | contredit la discrétion si le nom est mis en avant (cf. QCM 4) | novembre | **M** |
| Billets « nul expliqué » (3 × 1 500 mots) : NH-81, B-3, prox kiki-flow | moyenne-haute, recyclés ensuite dans la note | 4–5 h chacun | — | faible | novembre-décembre | **M** pour NH-81 seulement, les autres **A** |
| Talk FOSDEM 2027 (salle ML ou Open Research) | visibilité moyenne ; coût du déplacement | 10 h + 2 jours | CFP ouvert (date **à vérifier tout de suite**) | CFP probablement clos ou presque | février 2027 | **M** pour la vérification (15 min), sinon **X** |
| NLnet / NGI Zero (`prereg-guard` + `jpt` comme « communs ») | financement de 5 à 50 k€ possible, lettre courte | 8–12 h | outils publiés, au moins en ébauche | taux d'acceptation modéré ; peu compatible avec un CDI à plein temps | appel bimestriel (**à vérifier**) | **A** (février, si `prereg-guard` existe) |
| Cosyne / CCN / GDR, Show HN | faible à 10 h/semaine | — | — | — | — | **X** |

## 3. Arrêter ou archiver

À 10 h/semaine, chaque heure coûte environ 1/130 du trimestre.

1. **BSK et l'axe « LLM à impulsions »** : à archiver formellement (README « archived », tag). NH-81 a retiré l'argument énergie (R̂ = 0,91), et BSK est déjà dépassé en échelle. Avancer à maintenant la « décision BSK » prévue en avril.
2. **micro-kiki : papier « triple hybride » et couche quantique** : à archiver. micro-kiki-quantum l'est déjà. Garder seulement NH-85 (RAG brut contre Aeon) si Aeon sert le second cerveau. Gain : 15–20 h.
3. **Axe « matière » (track M) et R8-lite « bio »** : passer le GO/NO-GO à **NO-GO par défaut**, sauf si NH-01 confirmatoire *et* NH-60 donnent un signal en décembre. Trois rapprochements non démontrés, aucune équation commune : la plus grosse fuite d'heures prévisible de 2027. Gain : 20–40 h.
4. **baby-brain `apps/` et `firmware/`** (avatar, facekit, STT, ESP32-S3) : à geler côté recherche. Sans CI ni issue, ils n'apportent rien à la thèse WML ; le seul test utile est NH-77.
5. **GTM (multiplexeur γ/θ)** : avancer en janvier la décision prévue en mars. GTM est à égalité contre ses bases et ses ablations ne se distinguent pas. N'en garder qu'une ligne : « résultat de N10-C-bis, puis retrait si nul ».
6. **bouba_sens, monde ActionSense** : le plafonner à **une** grille préenregistrée v0.7 (S00 + 4 sujets), puis s'arrêter quel que soit le verdict. (15 négatifs sur 24 lignes, 37,5 Go par sujet). Gain : évite un nouveau cycle de 30 h ou plus.

## 4. Trois scénarios à 3 mois (≈ 130 h, novembre → janvier)

| | **Publication d'abord** | **Outils d'abord** | **Carrière d'abord** |
|---|---|---|---|
| Phase 0–1 (vérité, falsifiable) | 45 h, inchangé | 40 h | 35 h (corrections seulement, sans préreg nouvelle hors N10-C-bis) |
| Phase 2 (hypothèses) | 45 h, 6 sur 10 (on retire NH-07, R8-H1, NH-28, NH-85) | 25 h, 3 sur 10 (NH-01 conf., NH-77, N10-C-bis) | 20 h, 2 sur 10 (NH-01 conf., N10-C-bis) |
| Écriture | 40 h : note méthodo soumise (JOTE ou TMLR) + billet NH-81 | 20 h : note réduite à un preprint | 20 h : note méthodo en preprint arXiv |
| Outils | 0 | 45 h : `prereg-guard` + `jpt` sur PyPI, dossier NLnet | 15 h : `jpt` seul (vitrine MLOps) |
| Carrière / visibilité | 0 | 0 | 40 h : portfolio, 3 billets, FOSDEM si encore ouvert, candidatures appuyées sur les artefacts |
| **Livrable fin janvier** | 1 soumission, 6 verdicts | 2 paquets, NLnet, 3 verdicts | portfolio, preprint, 1 outil, 2 verdicts |
| **On sacrifie** | les outils et toute visibilité avant février ; aucun revenu | la note méthodo dans une revue (reportée au T2), 7 hypothèses, la crédibilité scientifique à court terme | la moitié de la roadmap ; le GO/NO-GO matière (de fait NO-GO) ; la soumission dans une revue |

Recommandation : **un mélange carrière et publication**. Phase 0–1 telle quelle ; phase 2 réduite à 4 tests (NH-01 confirmatoire, N10-C-bis, NH-77, NH-60 si le pas JKO est corrigé) ; note méthodo en preprint arXiv fin janvier et soumission à JOTE ou TMLR en février ; portfolio et billet NH-81 en novembre (≈ 12 h) ; `jpt` en décembre (≈ 15 h) ; `prereg-guard` et NLnet au T1 2027. Les axes matière et bio, BSK et micro-kiki hybride sont arrêtés.

## 5. Six questions au PI (QCM, option recommandée en premier)

**Q1. Quelle priorité pour les trois prochains mois ?**
- (a) **Mélange carrière + publication** (portfolio et billet NH-81 en novembre, note méthodo en preprint fin janvier, phase 2 réduite à 4 tests) *(recommandé)*
- (b) Publication d'abord (roadmap actuelle, soumission en revue en janvier)
- (c) Outils d'abord (`prereg-guard` + `jpt` + NLnet)
- (d) Carrière d'abord pure (≈ 40 h sur 130 pour la recherche d'emploi et le portfolio)

**Q2. Où soumettre la note méthodo ?**
- (a) **Preprint arXiv fin janvier, puis *Journal of Trial and Error*** (conçu pour les erreurs et les négatifs) *(recommandé)*
- (b) TMLR (plus de prestige, risque « hors périmètre »)
- (c) Atelier ICBINB (rapide, archivage incertain selon l'édition)
- (d) Pas de revue, preprint et billets seulement

**Q3. Que faire de l'axe « matière » et de R8-lite « bio » ?**
- (a) **NO-GO par défaut, rouvert seulement si NH-01 confirmatoire et NH-60 donnent un signal en décembre** *(recommandé)*
- (b) Garder le GO/NO-GO de S13 tel qu'il est prévu
- (c) Fermer tout de suite, sans pilote

**Q4. Sous quel nom porter la visibilité, alors que la recherche de CDI est discrète ?**
- (a) **Sous le nom de Clément Saillant, sur Hypneum et le portfolio** : c'est déjà public sur GitHub et Zenodo, et la discrétion vise l'employeur actuel, pas la recherche *(recommandé)*
- (b) Seulement sous la marque Hypneum Lab, sans profil personnel mis en avant
- (c) Pas de visibilité active avant la signature d'un CDI

**Q5. Quel outil extraire en premier ?**
- (a) **`jpt` (J/token, Apple Silicon et NVIDIA)** : 15–20 h, vitrine MLOps, résultat NH-81 déjà prêt *(recommandé)*
- (b) `prereg-guard` : 25–35 h, plus original, public plus restreint
- (c) Constructeur E1 de faits datés (licences à vérifier)
- (d) Aucun avant la note méthodo

**Q6. Quelles archives formelles déclarer maintenant ?**
- (a) **BSK + papier triple hybride micro-kiki + `apps/` et `firmware/` de baby-brain**, chacun avec un ADR et un README « archived » *(recommandé)*
- (b) BSK seulement
- (c) Rien avant le bilan de janvier
- (d) Aussi le GTM, sans attendre N10-C-bis
