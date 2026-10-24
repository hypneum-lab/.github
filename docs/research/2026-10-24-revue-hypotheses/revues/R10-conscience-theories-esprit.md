# R10 — Conscience et théories de l'esprit : faut-il ouvrir l'axe ?

Hypneum Lab · évaluation d'axe · 2026-10-24 · rédigé pour le PI (C. Saillant)
Périmètre : GWT/GNWT, IIT 4.0 et sa critique, HOT, schéma attentionnel, traitement prédictif / inférence active, COGITATE 2025 et suites, indicateurs « Consciousness in AI » 2023→2026, mesures (Φ, PhiID, PCI, LZc, ignition), sommeil/rêve, bien-être des IA.
Méthode : lecture des README dream-of-kiki / nerve-wml + veille du 23/10 ; 18 recherches web, 11 requêtes GitHub, 7 requêtes HF ; 37 identifiants arXiv et ~50 DOI revérifiés par API (arXiv abs, Crossref, PubMed, Europe PMC). L'API de recherche arXiv a répondu 429 toute la session (listing de recense non disponible) ; les sources faibles sont marquées ⚠.

Verdict court : **ne pas ouvrir « R10 — conscience » comme axe.** Ouvrir à la place un sous-axe étroit, renommé, à l'intérieur de nerve-wml : *mesures d'intégration et de diffusion comme contrôles négatifs* (6 hypothèses préenregistrables, ≤ 2 semaines de calcul M1/4090), avec interdiction lexicale du mot « conscience » dans toute affirmation.

---

## 1. Cadrage sceptique

Cinq faits structurent le dossier ; aucun n'est favorable à une ouverture ambitieuse.

1. **Aucune théorie n'est sortie indemne du test adverse.** COGITATE (Nature, 30/04/2025) contredit à la fois la synchronisation postérieure soutenue (IIT) et l'ignition à l'extinction du stimulus + le décodage préfrontal (GNWT). Les deux camps ont répondu en requalifiant leurs prédictions (Naccache et al. 2025 ; Tononi et al. 2025). Un laboratoire extérieur qui s'adosse à l'une ou l'autre adopte donc un cadre en révision.
2. **Φ n'a jamais été calculé sur un système physique réel.** C'est le camp *modéré* (Barrett, Mediano, Rosas, Bor, Barnett, Seth — arXiv:2604.11482, avril 2026) qui l'écrit : Φ n'est pas bien défini pour un système physique continu ; seuls des *proxies* (pas des approximations) ont été calculés. Et pour les auteurs mêmes d'IIT, un ordinateur à programme enregistré qui simule un réseau a un Φ quasi nul quel que soit le réseau simulé (Findlay et al., arXiv:2412.04571). Un « Φ de notre réseau WML » serait donc lu comme une erreur de catégorie par les uns et comme de la pseudo-science par les autres.
3. **L'approche par indicateurs est conditionnelle aux théories.** Butlin, Long et al. (TICS 30(6):488–501, 2026) ne détectent rien : ils dérivent des « credences » conditionnées à des théories fonctionnalistes. Chandaria et al. (DeepMind + Seth, Shanahan, Frith, Legg ; arXiv:2609.35618, 28/09/2026) montrent qu'avec les mêmes données l'estimation pour un LLM va de < 0,01 à ≈ 0,8 selon la crédence accordée aux théories. Le résultat dépend des priors, pas des mesures.
4. **Toutes les mesures « de conscience » ont été validées chez l'humain contre une vérité terrain clinique** (anesthésie, sommeil, états de conscience altérés ; Casali 2013, Sarasso 2021). Appliquées à un réseau artificiel, elles n'ont pas de référent : un PCI de 0,4 sur un pool de 16 WML est un nombre sans échelle. Il ne devient informatif que *relativement* à un bras de contrôle apparié — exactement la discipline (null-model, bootstrap, multi-estimateur) que nerve-wml applique déjà à l'information mutuelle.
5. **Le paradoxe « sortir du LLM ».** Le résultat empirique le plus fort de 2026 sur un espace de travail global en IA est interne à un LLM (Gurnee et al./Anthropic, J-space ; commentaire Dehaene & Naccache, juin 2026). La niche réellement hors-LLM est celle de Hypneum : des substrats hétérogènes *petits* (MLP, LIF, Transformer, BioField), où les perturbations sont bon marché et les mesures exactes. C'est un avantage méthodologique, pas un argument sur la conscience.

Distinctions à tenir dans tout texte : *état* (éveil/sommeil/anesthésie) ≠ *contenu* ≠ *accès* (disponibilité globale, rapportabilité) ≠ *phénoménal*. Les objets Hypneum (consolidation hors-ligne, messagerie inter-modules) ne peuvent toucher qu'au niveau *accès/architecture fonctionnelle*, jamais au phénoménal.

---

## 2. État de l'art (références vérifiées)

Relation à Hypneum : **appuie** / **contredit** / **dépasse** (va plus loin que ce que Hypneum peut mesurer) / **neutre**.

| Réf. (vérifiée) | Date | Résultat | Relation à Hypneum | Dépôt / code |
|---|---|---|---|---|
| COGITATE Consortium (Ferrante et al.), *Nature* 642:133–142, doi 10.1038/s41586-025-08888-1 ; protocole préenregistré Melloni et al. 2023 *PLoS One* 10.1371/journal.pone.0268577 | 30/04/2025 | fMRI+MEG+iEEG (~250 participants, chiffre de sources secondaires ⚠) : pas de synchronisation postérieure soutenue (contre IIT) ; pas d'ignition à l'offset, décodage PFC limité (contre GNWT) | neutre — mais fixe le standard méthodologique (prédictions préenregistrées par les théoriciens eux-mêmes) | — |
| Naccache, Sergent, Dehaene, Wang, Farisco, Changeux, *Neurosci. Conscious.* niaf037, doi 10.1093/nc/niaf037 (correction niag020, 2026) | 09/10/2025 | Réponse GNW : l'ignition à l'offset n'était pas une prédiction cœur ; sélectivité mixte du PFC ; aucun rapport subjectif recueilli | neutre | — |
| IIT-Concerned (Klincewicz, Cheng, Schmitz, Sebastián, Snyder et al.), « What makes a theory of consciousness unscientific? », *Nat. Neurosci.* 28:689–693, doi 10.1038/s41593-025-01881-x | 10/03/2025 | Suite de la lettre « pseudoscience » (2023, 124 signataires ; Lenharo, *Nature* news d41586-023-02971-1) : les affirmations cœur d'IIT seraient intestables en principe | contredit tout usage de Φ comme mesure de statut | — |
| Tononi, Albantakis, Zaeemzadeh, « Consciousness or pseudo-consciousness? A clash of two paradigms », *Nat. Neurosci.*, doi 10.1038/s41593-025-01880-y | 10/03/2025 | Réplique : le label « pseudoscience » révèle une crise du fonctionnalisme computationnel | contredit (pour IIT, un WML simulé n'est pas conscient quoi qu'il fasse) | — |
| Gomez-Marin & Seth, *Nat. Neurosci.* 28:703–706, doi 10.1038/s41593-025-01913-6 | 10/03/2025 | Position médiane : tirer des leçons positives du clash | appuie la prudence lexicale | — |
| Albantakis et al., IIT 4.0, *PLoS Comput. Biol.* 19(10):e1011465, doi 10.1371/journal.pcbi.1011465 (arXiv:2212.14787) ; Mayner, Marshall & Tononi, *Entropy* 28(4):410, doi 10.3390/e28040410 (2026) | 2023 / 04/2026 | Formalisation axiomes→postulats ; mesure d'information intrinsèque ; relations causales | dépasse (calcul super-exponentiel, ≤ ~10 unités binaires) | wmayner/pyphi (435★, GPL-3, push 17/10/2026 ; stable PyPI 1.2.0 de 2019, pré-version 2.0.0rc4 implémentant IIT 4.0) |
| Barrett, Milinkovic, Mediano, Rosas, Bor, Barnett, Seth, arXiv:2604.11482 | 13/04/2026 | Φ non défini pour les systèmes physiques réels ; jamais calculé ; seulement des proxies | contredit l'idée d'un « Φ de WML » | — |
| Findlay, Marshall, Albantakis… Tononi, arXiv:2412.04571 | 05/12/2024 | Équivalence fonctionnelle ≠ équivalence phénoménale ; un ordinateur simulant un système n'hérite pas de son Φ | contredit (verrou théorique pour tout substrat simulé) | — |
| Doerig, Schurger, Hess, Herzog, « unfolding argument », *Conscious. Cogn.* doi 10.1016/j.concog.2019.04.002 ; Herzog et al. 2022 doi 10.1016/j.concog.2021.103261 ; Doerig et al. 2020 « Hard criteria » doi 10.1080/17588928.2020.1772214 | 2019–2022 | Les théories de structure causale sont indistinguables par le comportement | neutre ; fournit les critères durs à citer | — |
| Klatzmann et al., « What biology can, and cannot, tell us about conscious AI », arXiv:2606.02121 | 01/06/2026 | Naturalisme biologique de type A intestable (même logique que l'unfolding), type B testable et compatible avec le fonctionnalisme | neutre — utile pour positionner BioFieldWML comme type B | — |
| Seth, « Conscious AI and biological naturalism », *BBS* doi 10.1017/S0140525X25000032 ; réponse « The stuff matters », doi 10.1017/S0140525X26106906 | 21/04/2025 ; 2026 | La conscience dépend du vivant ; IA consciente improbable sur trajectoire actuelle. Collection de commentaires parue 2026 (« 50 commentaires, 17/09/2026 » : agrégateur Digg ⚠) | neutre | — |
| Butlin, Long, Bayne, Bengio, Birch, Chalmers… VanRullen, « Identifying indicators of consciousness in AI systems », *TICS* 30(6):488–501, doi 10.1016/j.tics.2025.10.011 (version du rapport 2023 arXiv:2308.08708) ; Butlin et al., « Consciousness indicators, mimicry, and internal variants », *TICS* 30(7):575–576, doi 10.1016/j.tics.2026.04.006 | 11/2025→06/2026 ; 07/2026 | Méthode par indicateurs dérivés de théories (RPT, GWT, HOT, AST, agency/embodiment) ; verdict 2023 réaffirmé : aucun système actuel n'est un candidat fort | dépasse (grille à utiliser comme *audit*, pas comme résultat) | — |
| Chandaria, Muñoz Morán, Rosas, Seth, Shevlin, Hutter, Graepel, Bales, Comsa, Shanahan, Laukkonen, Kringelbach, Frith, Legg, arXiv:2609.35618 (v2 29/09) | 28/09/2026 | Hiérarchie à 5 niveaux (comportemental, computationnel, causal-structurel, organismique, organisme-environnement), agrégation bayésienne ; estimations < 0,01 à ≈ 0,8 selon crédences ; outil et code publics | dépasse ; montre que le résultat est dominé par les priors | code annoncé public (non audité ici) |
| Gurnee, Sofroniew, Pearce… Batson, Lindsey (Anthropic), « Verbalizable representations form a global workspace in language models », arXiv:2607.15495 | 16/07/2026 | « Jacobian lens » → J-space (représentations verbalisables, couches intermédiaires, ~dizaines de concepts, diffusées plus largement) ; rapport, maintien, raisonnement silencieux | dépasse (LLM, hors paradigme PI) ; mais fournit le *protocole* (ablation, swap, local-global, trace conditioning) | — |
| Dehaene & Naccache, « Does Claude possess a conscious global workspace? » (commentaire, PDF unicog.org) | 06/2026 | Parallèles acceptés : rapportabilité, capacité limitée, connectivité large, usage flexible. Différences : **ignition pas démontrée**, capacité ~25 concepts trop élevée, sous-trame et non population dédiée, **absence d'activité récurrente autonome**, pas de corps ni de mémoire épisodique. Tests proposés : local-global (Bekinschtein 2009), trace conditioning avec délai, inclusion/exclusion, monitoring d'erreur | appuie la liste de tests portables à nerve-wml (H2, H7) | — |
| Wang et al., « Looped transformers under the Jacobian lens », arXiv:2609.01924 | 01/09/2026 | Un espace de travail se forme aussi dans les architectures récurrentes en profondeur, mais la récurrence change son accès | neutre | — |
| Rahbar, « The Ignition Index », arXiv:2608.05160 | 26/05/2026 | Pente sigmoïde β̂ de la précision de sonde vs force du signal, 12 modèles ; auteur unique | ⚠ faible (1★, pas de licence, non relu) ; idée de l'indice réutilisable | saman-rahbar/ignition-index |
| Changeux & Farisco, *TICS* 30(6):477–479, doi 10.1016/j.tics.2026.03.004 | 04/2026 | GNW est multiniveau (moléculaire→réseau) et **n'est pas** une théorie fonctionnaliste computationnelle, contrairement à GWT | contredit toute assimilation nerve-wml ↔ GNW | — |
| Dehaene, Lau, Kouider, *Science* 358:486–492, doi 10.1126/science.aan8871 ; Mashour et al., *Neuron* 2020, doi 10.1016/j.neuron.2020.01.026 | 2017 ; 2020 | C1 (disponibilité globale) / C2 (auto-surveillance) ; synthèse GNW | neutre — définitions de référence | — |
| VanRullen & Kanai, *TINS* 44(9):692–704, doi 10.1016/j.tins.2021.04.005 ; Devillers, Maytié, VanRullen, *IEEE TNNLS* doi 10.1109/TNNLS.2024.3416701 (arXiv:2306.15711) ; Maytié et al. arXiv:2403.04588 (RLJ 2024), arXiv:2502.21142 (« Multimodal Dreaming », 2025) ; Chateau-Laurent & VanRullen arXiv:2503.01906 | 2021–2025 | Global Latent Workspace : espace latent partagé + cycle-consistency, transfert zéro-shot inter-modal, world model Dreamer+GW | **contredit par conception** : nerve-wml n'a pas d'espace latent partagé (N-5 : un codebook par WML, transducteurs par arête). C'est le comparateur naturel | aslansd/Global-Latent-Workspace (0★, MIT, notebooks) ; pas de code officiel trouvé |
| Blum & Blum, CTM, *PNAS* doi 10.1073/pnas.2115934119 (arXiv:2107.13704) | 2022 | Espace de travail formel (compétition, diffusion) | neutre | implémentations non maintenues (0★) |
| Kanai et al., « Information generation », *Neurosci. Conscious.* doi 10.1093/nc/niz016 | 2019 | La conscience comme génération d'information (contrefactuels) | neutre ; proche du RECOMBINE de GENIAL sans lien établi | — |
| Wilterson & Graziano, *PNAS* doi 10.1073/pnas.2102421118 ; Farrell, Ziman, Graziano, arXiv:2411.00983 ; Graziano, « society of self-schemas », *PNAS* doi 10.1073/pnas.2628598123 | 2021 ; 11/2024 ; **09/10/2026** | Un schéma d'attention améliore le contrôle attentionnel (DQN) ; dans des agents transformer, il améliore la catégorisation de l'attention d'autrui et la coopération ; extension 2026 à une « société de schémas de soi » | appuie une transposition *au routeur* (schéma de routage, H6) — hors LLM, bon marché | — |
| Brown, Lau & LeDoux, *TICS* doi 10.1016/j.tics.2019.06.009 ; Fleming, HOSS, doi 10.1093/nc/niz020 ; Dijkstra et al., PRM, PsyArXiv 10.31234/osf.io/36xdz_v2 | 2019 ; 2020 ; 07/2025 | Théories d'ordre supérieur : la conscience = méta-représentation/monitoring de fiabilité des signaux | neutre ; aucun module Hypneum ne représente la fiabilité de ses propres codes | — |
| Whyte, Corcoran… Friston, Seth, Hohwy, *Phys. Life Rev.* 56:4–28, doi 10.1016/j.plrev.2025.11.002 (arXiv:2410.06633) ; Corcoran, Haun, Dorman, Tononi, Friston, Pennartz (INTREPID), *Neurosci. Biobehav. Rev.* 106742, doi 10.1016/j.neubiorev.2026.106742 | 03/2026 ; 08/2026 | Théorie minimale de la conscience implicite dans l'inférence active ; 2ᵉ collaboration adverse (IIT vs neuroreprésentationalisme vs inférence active), résultats à venir | neutre — nerve-wml (π descendant, ε ascendant, N-3) est *architecturalement* du codage prédictif, pas une théorie de la conscience | — |
| Ruffini et al., *Neural Comput.* 38:1299–1343, doi 10.1162/neco.a.1537 ; Kim, Lee, Choi, Battaglia, bioRxiv 10.64898/2026.04.30.721821 | 07/2026 ; 05/2026 | Couplage inter-fréquences comme comparateur d'erreur de prédiction ; salves inter-fréquences routant l'information | appuie l'ancrage GTM (déjà dans la veille), sans rapport avec la conscience | — |
| Casali et al., PCI, *Sci. Transl. Med.* doi 10.1126/scitranslmed.3006294 ; Comolatti et al., PCIst, *Brain Stimul.* doi 10.1016/j.brs.2019.05.013 ; Sarasso et al., « consilience », *Neurosci. Conscious.* niab023 ; Toker et al., *PNAS* doi 10.1073/pnas.2024455119 | 2013 ; 2019 ; 2021 ; 2022 | Complexité perturbationnelle, bistabilité Up/Down ↔ perte de conscience, criticité | dépasse (vérité terrain clinique absente chez nous) ; mécanisme bistabilité→faible complexité **testable sur BioFieldWML** (H3) | renzocom/PCIst (30★, GPL-3, dernier push 2023) ; noreun/pypci (8★, sans licence) |
| Breyton, Fousek… Massimini, Petkoski, Jirsa, *eLife* 14:e98920.3, doi 10.7554/eLife.98920 | 23/10/2025 | sPCI simulé (stimuler un nœud, LZc binarisé sur 10 s, ratio au run non stimulé même graine, max sur nœuds) ; « fluidité » de la connectivité dynamique ; validé sur modèle TVB 84 régions puis EEG xénon/propofol/kétamine | appuie une **recette directement portable** aux pools WML | — |
| Mediano, Rosas et al., PhiID, *Chaos* doi 10.1063/5.0063384 | 2022 | Décomposition de l'information intégrée (synergie/redondance) sur séries temporelles | appuie (seule « information intégrée » calculable sur des activités WML) | Imperial-MIND-lab/integrated-info-decomp (41★, BSD-3, push 03/2026) ; pmediano/PhiID (MATLAB) |
| Schartner et al., LZc, *PLoS One* doi 10.1371/journal.pone.0133532 | 2015 | LZc de l'EEG spontané chute sous propofol | appuie (mesure triviale, bon contrôle) | Naereen/Lempel-Ziv_Complexity (36★, MIT) ; lcbarnett/fLZc (C, MIT) |
| Sergent et al., *Nat. Commun.* 12:1 doi 10.1038/s41467-021-21393-z ; Bekinschtein et al., *PNAS* 2009 (local-global) | 2021 ; 2009 | Bifurcation bimodale au seuil = signature d'accès indépendante du rapport ; local-global | appuie H2/H7 (tests portables) | — |
| Yang, « Conscious access as continuous-to-discrete translation », arXiv:2608.20723 | 21/08/2026 | Cadre C/D : l'accès = traduction continu→discret préservant la structure, avec prédictions sur la géométrie représentationnelle | **Hypneum contredit un présupposé** : ADR-0001 montre que la quantification VQ *fabrique* ×10 d'alignement apparent (MI/H 0,93 post-VQ vs 0,10 continu). Résultat négatif publiable (H4) | — |
| Albantakis, « toy models », arXiv:2508.00190 | 31/07/2025 | Les modèles-jouets servent à tester la cohérence des théories (IIT, GWT) | appuie l'usage de micro-substrats (≤ 10 unités) comme bancs | — |
| Siclari et al., *Nat. Neurosci.* doi 10.1038/nn.4545 ; Hobson, *Nat. Rev. Neurosci.* doi 10.1038/nrn2716 (déjà cité dans Paper 1/2 dream-of-kiki) | 2017 ; 2009 | Hot zone postérieure du rêve ; protoconscience REM | neutre — corrélats d'*état*, rien sur la consolidation | — |
| Hoel, *Patterns* doi 10.1016/j.patter.2021.100244 ; Deperrois, Petrovici, Senn, Jordan, *eLife* doi 10.7554/eLife.76384 ; *NBR* doi 10.1016/j.neubiorev.2023.105508 | 2021 ; 2022 ; 2024 | Rêve = augmentation anti-surapprentissage ; PAD : NREM = replay perturbé, REM = rêve adversarial | appuie REPLAY/RECOMBINE (H10) ; aucun des deux ne parle de conscience | — |
| De Pisapia et al., *J. Sleep Res.* doi 10.1111/jsr.70305 | 12/02/2026 | Corrélats structuraux (GM/WM) de la fréquence de rêve lucide ; exploratoire | neutre ; aucun test adverse de théorie en sommeil trouvé pour 2025–2026 | — |
| Zahn, Evans & Eagleman arXiv:2607.16256 ; Bazhenov et al. arXiv:2606.08447 ; Zhang et al. arXiv:2609.31630 (déjà dans la veille) | 06–09/2026 | Recombinaison inter-domaines ; replay type sommeil ; **replay sans phase hors-ligne** | Zhang découple consolidation et *état* : argument de plus pour tenir GENIAL hors des théories d'état | — |
| Long, Sebo et al., « Taking AI welfare seriously », arXiv:2411.00986 ; Anthropic, « Exploring model welfare » (24/04/2025) ; politique d'usage Anthropic (08/10/2026, TechCrunch) ; Chua et al., « Consciousness cluster », arXiv:2604.13051 ; Birch, « AI consciousness: a centrist manifesto », PsyArXiv 10.31234/osf.io/af7c9 (v1 09/2025 ; v6 07/2026 ⚠ listing PhilPapers) ; Longin et al., *Cognition* doi 10.1016/j.cognition.2026.106733 | 2024→10/2026 | Programme bien-être des modèles ; interdiction des abus « soutenus et sans but » envers Claude ; un modèle fine-tuné pour *dire* qu'il est conscient change ses préférences ; attribution essentialiste chez l'humain (N = 1092) | neutre — Hypneum n'a rien à y apporter ; terrain politisé | — |

Non vérifiés (cités par des blogs seulement ⚠) : « Studying AI Welfare Empirically » (Long, Sebo, Butlin, 07/2026) ; Eleos ConCon 18–20/09/2026 ; « 171 représentations d'émotions » (dates contradictoires) ; chiffre « 15–20 % de probabilité » auto-attribué par Opus 4.6 (repris par Chua et al. 2026 sans source primaire).

---

## 3. Ce que Hypneum implique — et n'implique pas

### 3.1 nerve-wml est-il un espace de travail global ? Non, sur 3 des 4 propriétés définitoires

| Propriété GWT/GNWT (Dehaene 2017 ; Mashour 2020 ; Dehaene & Naccache 2026) | nerve-wml (spec 2026-04-18, invariants N-1..N-5) | Verdict |
|---|---|---|
| Modules spécialisés encapsulés | WML = MLP / LIF / Transformer / BioField, isolés (W-1) | ✓ analogue |
| Espace partagé à capacité limitée, compétition, goulot | Routage épars point-à-point, top-K arêtes figées (N-4), un codebook par WML (N-5) ; aucun hub, aucune compétition pour une ressource commune | ✗ |
| Diffusion à *tous* les modules (« clout ») | Fan-out K (≈ 3 sur 4–16 WML) ; silence légitime (N-1) | ✗ |
| Ignition : amplification non linéaire, tout-ou-rien, **soutenue**, récurrente | Salve θ conditionnelle à `surprise > seuil` (non-linéarité à seuil, locale, non soutenue) ; cycle γ 25 ms + θ 170 ms sans réverbération | ✗ (au mieux « déclenchement à seuil », pas ignition) |
| Rapportabilité | sans objet | — |

Ce que nerve-wml *est* : une couche de **codage prédictif modulaire et épars** (π descendant en γ, ε ascendant en θ, N-3 = forme canonique Bastos-Friston), c'est-à-dire la famille « neuroreprésentationalisme / inférence active » du programme INTREPID — qui, précisément, ne fait pas de la diffusion globale le critère. La comparaison la plus utile est **GLW (VanRullen & Kanai)** : espace latent partagé vs transducteurs par arête. Ce n'est pas une ressemblance, c'est l'alternative de conception. Toute phrase du type « le protocole de diffusion ressemble à un espace de travail global » serait fausse à la lettre et dangereuse en relecture.

Deux points où Hypneum a réellement quelque chose à dire :
- **ADR-0001 contre les cadres « accès = discrétisation »** (Yang 2026) : la quantification argmax fabrique l'essentiel de l'alignement apparent. C'est un contrôle que ces cadres ne font pas. Résultat négatif réutilisable tel quel.
- **BioFieldWML** implémente des cycles Up-Down encapsulés dans `step()` (OQ-1). C'est le seul objet Hypneum sur lequel une mesure d'*état* (PCI-like, LZc) a un mécanisme identifiable à tester : bistabilité → effondrement de complexité (Sarasso 2021). Cela teste la mesure, pas la conscience.

### 3.2 Les épisodes de rêve de GENIAL ont-ils un analogue dans les théories ? Non — et c'est sain

Un DE est un 5-uplet `(trigger, input_slice, operation_set, output_delta, budget)` : unité **de consolidation**, bornée (DR-0 : pas de « rêve ambiant »), consommée dans τ_max (DR-1), composable (DR-2), portable (DR-3), emboîtée par profil (DR-4). Aucune théorie de la conscience ne prédit quoi que ce soit sur DR-0..DR-4 : IIT décrit le rêve comme un Φ élevé de la hot zone postérieure déconnectée ; GNW comme un espace de travail actif sous contrôle préfrontal réduit ; AST/HOT n'ont pas de théorie du rêve. Les seuls voisins sont des théories *fonctionnelles du rêve* (Hoel 2021 ; Deperrois 2022/2024 ; Hobson 2009, déjà cité), qui parlent de généralisation et de représentations, pas d'expérience. Zhang et al. 2026 (replay sans phase hors-ligne) montre même que la consolidation n'a pas besoin d'être un *état*. Conclusion : GENIAL fixe l'axe « primitive de consolidation » ; les théories de la conscience fixent l'axe « état dynamique » ; les deux axes sont indépendants jusqu'à preuve du contraire (H5 propose de le mesurer).

### 3.3 Grille d'indicateurs (Butlin et al. 2026) appliquée à froid

Lecture honnête, à préenregistrer comme audit si l'on veut une version citable : nerve-wml satisfait partiellement les indicateurs de *récurrence* (RPT) dans ses substrats LIF/BioField ; aucun indicateur GWT (goulot, diffusion), HOT (méta-représentation de fiabilité), AST (modèle de son propre routage), ni agence/incarnation. Estimation : ≤ 2 indicateurs sur ~14, et seulement en lecture charitable. GENIAL : 0.

### 3.4 Formulation prudente recommandée pour les papiers

- Interdits dans toute affirmation : « conscient », « conscience », « expérience », « aware », « ressent ». Autorisés en *related work* uniquement, au conditionnel et avec citation.
- Phrase type nerve-wml (section « Delimiting the contribution ») : « The nerve protocol is a sparse, point-to-point predictive-coding messaging layer. It has no shared limited-capacity workspace, no all-to-all broadcast and no sustained ignition; it is therefore not an implementation of global-workspace theory and makes no claim about conscious access. Integration and broadcast indices are reported only as ablation-referenced controls. »
- Phrase type dream-of-kiki : « Dream-episodes are consolidation primitives, not states of experience; the framework is silent on theories of consciousness, and complexity measures of substrate dynamics are not used to argue for any such state. »
- Positionner BioFieldWML comme naturalisme biologique **de type B** (Klatzmann 2026) : la biologie y est une source de capacités de traitement, pas un ingrédient phénoménal.

---

## 4. Mesures opérationnelles calculables sur WML / nerve-wml

Principe commun (hérité de nerve-wml) : **aucun nombre absolu** ; chaque indice est rapporté en ratio à un bras nul apparié (graine identique, topologie permutée, codes mélangés) avec IC bootstrap et ≥ 5 graines.

| Mesure | Recette | Outil (licence, état) | Coût M1 32 Go / 4090 | Ce qu'elle teste réellement |
|---|---|---|---|---|
| φ_s / Φ (IIT 4.0) | Micro-substrat binaire ≤ 8–10 unités, TPM explicite, état fixé | wmayner/pyphi 2.0.0rc4 (GPL-3) | Super-exponentiel ; n ≤ 8 : minutes ; n = 10 : heures ; au-delà : impossible | Théorème connu (feedforward ⇒ Φ = 0 ; Oizumi 2014). Sur un réseau *simulé*, Findlay 2024 : sans valeur de statut. À réserver à des jouets de cohérence (Albantakis 2025) |
| PhiID (synergie/redondance, Φ_R) | Séries temporelles d'activité par WML, estimateur gaussien ou discret, surrogates à phase aléatoire | integrated-info-decomp (BSD-3, actif) | O(n²) paires ; N = 16 WML × 5 graines : minutes | Intégration vs ségrégation entre modules — comparable entre bras GTM / simple_gating / null |
| sPCI (Breyton 2025) / PCIst | Perturber un WML (neuroletter forcée ou salve de spikes) ; LZc des réponses binarisées sur T pas ; ratio au run non perturbé même graine ; max sur WML | renzocom/PCIst (GPL-3, 2023) ; LZc : Naereen (MIT) ou fLZc (C, MIT) | Secondes par perturbation ; campagne complète < 1 h | Complexité de la réponse causale ; mécanisme bistabilité→faible complexité sur BioFieldWML |
| LZc spontanée (Schartner 2015) | Binarisation médiane des activités, LZ76 normalisée | idem | Trivial | Contrôle de base ; distingue régimes Up-Down / asynchrone |
| Indice d'ignition (Sergent 2021 ; Dehaene & Naccache 2026) | Balayage de force d'entrée ; distribution de l'activation aval au seuil ; test de bimodalité (dip de Hartigan) ; pente sigmoïde β̂ (Rahbar 2026, à prendre avec réserve) | scipy + `diptest` | Heures (5 graines × 10 niveaux) | Présence/absence d'une bifurcation tout-ou-rien |
| Indice de diffusion (« clout ») | Fraction de WML dont l'état permet de décoder linéairement le code émis par un WML source après un cycle | sklearn | Minutes | Portée effective du routage épars (attendu ≈ K/N) |
| Maintien sur délai (trace conditioning, local-global) | Tâche streaming 16 pas avec g pas de remplissage ; précision vs g ; variante avec hub récurrent | harness nerve-wml existant | Heures | Si un hub « workspace-like » est porteur pour franchir un délai |
| Criticité (σ branchement, Lyapunov) | Déjà en piste 9 de la veille (Vock & Meisel) | scripts à écrire | Minutes | Proximité du point critique par bras (Toker 2022 : corrélat humain, pas statut) |
| Schéma de routage (AST transposé) | Module prédisant `routing_weight` t+1, réinjecté ; effet sur convergence de gate-P et dead-code rate | nerve_core/router.py + petit MLP | Heures | Bénéfice fonctionnel d'un auto-modèle du routage (Wilterson 2021 ; Farrell 2024) |

Infaisable ou sans intérêt : Φ sur un pool réel (64 codes × 4 WML) ; PCI « clinique » (pas de vérité terrain) ; tout indice sur micro-kiki/LLM (hors consigne PI, et redondant avec Anthropic/Jacobian lens).

---

## 5. Ressources Hugging Face

Papers HF pertinents (tous retrouvés par l'API HF) : 2308.08708 (indicateurs 2023), 2607.15495 (J-space), 2608.05160 (ignition index ⚠), 2609.01924 (looped transformers), 2604.08206 (« Theater of Mind », architecture GWT pour LLM, hors consigne), 2503.01906 (routage via GW), 2406.12375 (GW-MoE), 2609.35618 (hiérarchie DeepMind), 2604.13051 (consciousness cluster), 2505.19806 (survey LLM/conscience ⚠ qualité inégale), 2506.22516 (IIT sur états internes de LLM ⚠).
Modèles HF : la requête « consciousness » ne renvoie que des fine-tunes amateurs (« gemma4-31b-consciousness-abliterated », « eve-qwen… -soul ») : voisinage de nommage toxique, à éviter absolument dans tout nom d'artefact Hypneum.
Jeux de données HF utiles pour contrôles sur EEG réel (nerve-wml Test (9) utilise déjà Sleep-EDF via PhysioNet) : WymanYYY/Sleep-EDF-V2, iatosh/SleepEDF-V-Dataset, carmencraciun/PhysioNet-sleep-edfx, EEGDash/eeg-mi-datasets, raei/Schalk-2009-EEGMotorMovementImagery. Aucun jeu TMS-EEG/PCI sur HF ; aucun modèle ou dataset « global workspace » / « integrated information ».

---

## 6. Actualités septembre–octobre 2026

- 28–29/09 : Chandaria et al. (DeepMind, Seth, Shanahan, Frith, Legg), cadre bayésien à 5 niveaux — message central : les priors théoriques dominent l'évidence (arXiv:2609.35618).
- 09/10 : Graziano, *PNAS*, « society of self-schemas » — AST généralisée à cinq schémas de soi (doi 10.1073/pnas.2628598123).
- 08/10 : Anthropic interdit les abus « soutenus et sans but » envers ses modèles (TechCrunch ; prise d'effet 12/11/2026 selon MacRumors/autres ⚠), motivé par l'incertitude sur le bien-être des modèles ; recherche et tests explicitement exclus.
- 10/2026 : Longin et al., *Cognition* — attribution de conscience essentialiste (humain > IA à réponse égale), N = 1092 ; couverture ScienceDaily 13/10.
- 01/09 : Wang et al., workspace dans les transformers bouclés (arXiv:2609.01924) ; 06/09 : Khadangi, « We built a mirror and mistook it for a mind » (arXiv:2609.06715) — critique de la « fallacy » de conscience IA, utile comme repoussoir.
- 09/09 : Zhang et al., replay sans phase hors-ligne (arXiv:2609.31630) — touche directement DR-0/DR-1.
- Août 2026 (numéro) : Corcoran et al., revue adverse INTREPID (IIT vs neuroreprésentationalisme vs inférence active) — les expériences multi-sites restent à venir ; c'est la prochaine « COGITATE » à surveiller.
- Juin–juillet : commentaire Dehaene & Naccache sur le J-space ; Butlin et al. TICS 30(7) sur mimétisme et variantes internes ; Ruffini et al. *Neural Comput.* (version publiée).
- Septembre (⚠ Digg) : collection *BBS* autour de Seth (« The stuff matters », doi vérifié 10.1017/S0140525X26106906) ; Eleos ConCon 18–20/09 (⚠ blog).
- Rien trouvé dans *Nature*/*Science* sur la conscience IA pour sept.–oct. 2026 ; pas de nouveau test adverse en sommeil/rêve.

---

## 7. Risques et critères d'arrêt

Risques réputationnels, par ordre de gravité :
1. **Étiquette « pseudoscience » par contagion.** Le champ a montré en 2023–2025 qu'il sanctionne durement la surinterprétation. Un laboratoire mono-PI qui a déjà rétracté cinq affirmations (nerve-wml) et le §5.5 de bouba_sens n'a aucune marge pour un mot comme « conscience » dans un titre ou un résumé.
2. **Erreur de catégorie Φ.** Tout « Φ de WML » sera attaqué des deux côtés (Findlay 2024 d'un côté, IIT-Concerned 2025 de l'autre).
3. **Effet miroir / Eliza** (Khadangi 2026 ; Longin 2026) : toute description anthropomorphe du routeur ou des épisodes de rêve sera lue comme projection.
4. **Voisinage HF toxique** (fine-tunes « consciousness ») : contamination par le nommage.
5. **Terrain bien-être des IA** politisé (politique Anthropic, Birch) : Hypneum n'y a ni données ni expertise ; s'y exprimer coûte sans rapporter.
6. **Dilution** : l'axe détournerait du travail prioritaire (restauration du related work nerve-wml, avenants OSF N10/N11, DR-3 à reformuler, TOST bouba_sens).

Critères d'arrêt (à inscrire dans le préenregistrement du sous-axe) :
- Lexical : si une version de papier a besoin du mot « conscient » pour qu'une affirmation tienne, l'affirmation est supprimée.
- Statistique : si, sur deux tâches (HardFlowProxyTask, Sleep-EDF matched-scale), aucun indice (PhiID, sPCI, diffusion, ignition) ne sépare GTM / simple_gating / null avec |d| ≥ 0,3 et IC95 excluant 0 sur 5 graines → le sous-axe se clôt avec un résultat nul publié en annexe, pas en papier.
- Budget : 2 semaines-machine (M1 + 4090) et 10 jours-PI, plafond strict.
- Externe : si INTREPID ou une seconde collaboration adverse invalide le niveau de description visé (p. ex. abandon de l'ignition comme signature), suspendre.

---

## 8. Hypothèses falsifiables (≥ 8, hors paradigme LLM)

Format : énoncé ; prédiction quantitative ; test (matériel) ; critère de réfutation ; référence d'ancrage. Toutes : ≥ 5 graines, bras nul apparié, IC bootstrap, préenregistrées comme études d'*estimation*.

**H1 — nerve-wml n'a pas de diffusion globale (contrôle négatif GWT).** Indice de diffusion = fraction de WML où le code du WML source est linéairement décodable après un cycle. Prédiction : pool N = 16, K = 3 : indice ≤ K/N + 0,10 ≈ 0,29 ; bras GLW-like (latent partagé, cycle-consistency) ≥ 0,80. Test : harness nerve-wml, M1, < 1 j. Réfutation : indice nerve-wml > 0,50 sur ≥ 4/5 graines (diffusion implicite via chaînes de transducteurs). Réf. : Mashour 2020 ; VanRullen & Kanai 2021.

**H2 — Pas d'ignition : la réponse aval est graduée, pas bimodale.** Balayage de force d'entrée (10 niveaux) ; activation aval au niveau seuil (50 % de précision). Prédiction : test du dip de Hartigan p > 0,05 ; β̂ (pente sigmoïde) < 10. Test : HardFlowProxyTask, 5 graines, M1, heures. Réfutation : bimodalité (p < 0,01) à seuil sur ≥ 4/5 graines. Réf. : Sergent 2021 ; Dehaene & Naccache 2026.

**H3 — Bistabilité Up-Down ⇒ effondrement de la complexité perturbationnelle (mécanisme PCI, pas statut).** sPCI (recette Breyton 2025) sur BioFieldWML en régime Up-Down vs régime asynchrone apparié (mêmes poids, bruit différent). Prédiction : sPCI(Up-Down) ≤ 0,70 × sPCI(asynchrone), IC95 excluant 1. Test : perturbation = salve de spikes forcée, LZc sur 1 000 pas, 5 graines, M1, minutes. Réfutation : ratio ∈ [0,85 ; 1,15] ou inversé. Réf. : Sarasso 2021 ; Breyton 2025.

**H4 — La discrétisation gonfle aussi l'intégration apparente (généralisation d'ADR-0001).** PhiID (synergie + redondance) entre deux WML, calculé pré-VQ (continu) et post-VQ (codes). Prédiction : rapport post/pré ≥ 2 ; l'inflation croît avec log|codebook| (16 / 64 / 256). Test : nerve-wml, 5 graines, M1, minutes. Réfutation : rapport ∈ [0,7 ; 1,4] ou décroissant avec la taille du codebook. Réf. : nerve-wml ADR-0001 ; Yang 2026 (cadre C/D) ; Mediano 2022.

**H5 — Un épisode de rêve n'est pas une transition d'état.** LZc et PhiID des trajectoires latentes de kiki_oniric pendant un DE (REPLAY, RECOMBINE) vs inférence éveillée appariée. Prédiction : |d| < 0,3 pour REPLAY ; pour RECOMBINE, LZc supérieure de ≥ 20 % (analogie REM > NREM en complexité, Sarasso 2021) sans changement de PhiID. Test : substrat 1,5B existant, 20 graines déjà disponibles, M1 (pas de 35B). Réfutation : d > 0,8 sur REPLAY, ou RECOMBINE sans hausse de LZc. Réf. : Deperrois 2022 ; Sarasso 2021.

**H6 — Un schéma de routage (AST transposée au nerf) améliore le routage.** Module prédisant `routing_weight(t+1)`, réinjecté dans le routeur. Prédiction : convergence de gate-P ≥ 5 % plus rapide, dead-code rate réduit de ≥ 10 % relatif. Test : track_p, N = 8 WML, 5 graines, M1/4090, heures. Réfutation : Δ < écart-type inter-graines sur les deux métriques. Réf. : Wilterson & Graziano 2021 ; Farrell, Ziman & Graziano 2024.

**H7 — Un hub récurrent est porteur pour franchir un délai (test « trace conditioning »).** Tâche streaming avec g pas de remplissage entre indice et cible. Prédiction : sans hub, précision chute sous 0,70 à g = 8 ; avec un WML hub récurrent (degré élevé) précision ≥ 0,90 à g = 8. Test : harness temporel nerve-wml (16 pas), 5 graines, M1, heures. Réfutation : topologie éparse sans hub ≥ 0,90 à g = 8 (le maintien n'a pas besoin de hub). Réf. : Dehaene & Naccache 2026 (trace conditioning) ; Bekinschtein 2009.

**H8 — Le multiplexage γ/θ n'augmente pas l'information intégrée (nul attendu).** Φ_R (PhiID) par bras GTM / simple_gating / null sur HardFlowProxyTask. Prédiction : différences < écart-type inter-graines. Test : minutes. Réfutation : GTM ≥ 2 × null sur 5/5 graines avec IC95 excluant 0 — serait un résultat positif inattendu à répliquer cross-tâche avant toute mention. Réf. : Mediano 2022 ; nerve-wml N8 Q1.

**H9 — Les bras GTM sont plus proches de la criticité.** Rapport de branchement σ et exposant de Lyapunov par bras. Prédiction : |σ − 1| plus petit de ≥ 0,10 pour GTM que pour simple_gating. Test : scripts piste 9 de la veille, 4090, heures. Réfutation : |σ − 1| égal ou inversé sur 5 graines. Réf. : Toker 2022 ; Vock & Meisel 2026 (veille).

**H10 — Courbe en U inversé de la recombinaison (Hoel).** Gain de généralisation de RECOMBINE en fonction de la divergence (KL) entre sorties recombinées et replay. Prédiction : maximum à KL intermédiaire ; gain ≤ 0 aux deux extrêmes. Test : kiki_oniric 1,5B, 3 niveaux de divergence × 5 graines, M1, 1–2 j. Réfutation : relation monotone. Réf. : Hoel 2021 ; Zahn 2026.

Classement par rapport débloqué/coût : H1, H2, H4, H8 (contrôles négatifs, < 1 j chacun) ; puis H3, H6 ; H5, H7, H9 ensuite ; H10 relève de dream-of-kiki (DR-4) et non de cet axe.

---

## 9. Concepts et intuitions nouveaux (spéculatifs, étiquetés)

- **C1 — « Complexité référencée à l'ablation » (méthodologique, prêt à préenregistrer).** Aucune mesure PCI/LZc/PhiID n'est rapportée en absolu ; seulement en ratio à un bras nul de même graine. Transpose la discipline MI de nerve-wml aux mesures d'état. Test : H3, H8.
- **C2 — « Deux axes orthogonaux : primitive de consolidation × état dynamique » (conceptuel, testable).** GENIAL fixe le premier, les théories de la conscience le second ; la prédiction d'indépendance est H5. Si réfutée (un DE change l'état mesurable), on aurait un pont réel — à ne pas anticiper.
- **C3 — « La discrétisation comme amplificateur d'intégration apparente » (spéculatif, test H4).** Conjecture : tout readout continu→discret gonfle les indices d'intégration fondés sur l'information d'un facteur croissant en log|codebook|. Conséquence : les cadres « accès = symbolisation » (Yang 2026 ; Dehaene et al. 2022 « symboles ») doivent contrôler cet artefact. Résultat négatif de nerve-wml déjà disponible pour la MI.
- **C4 — « Schéma de routage » (spéculatif, test H6).** AST appliquée non à l'attention mais au routeur d'un nerf : le système modélise sa propre topologie effective. Hors LLM, 50 k paramètres.
- **C5 — « Hub facultatif émergent » (spéculatif, test dérivé de H7).** Un hub de type workspace peut-il *émerger* de l'élagage gate-P sous contrainte de délai, sans être dessiné ? Prédiction : la fréquence d'apparition d'un nœud de haut degré croît avec g ; réfutation : distribution des degrés plate à tout g. Analogue hors-LLM de l'observation « le J-space émerge de l'entraînement » (Dehaene & Naccache 2026), sans en reprendre le vocabulaire.
- **C6 — « Le silence comme régime » (spéculatif, bas coût).** N-1 rend le silence légitime ; la fraction de cycles silencieux pourrait indexer le régime de surprise mieux que la synchronie (dont la veille a montré l'anti-monotonie). À corréler à l'entropie spectrale déjà utilisée. Aucun lien avec la conscience.

---

## 10. Recommandation

1. **Ne pas ouvrir R10 sous le nom « conscience ».** Les trois raisons décisives : aucune théorie stable (COGITATE), aucune mesure de statut calculable ou interprétable sur un substrat simulé (Barrett 2026 ; Findlay 2024), et un risque réputationnel asymétrique pour un laboratoire mono-PI à historique de rétractations honnêtes.
2. **Ouvrir un sous-axe nerve-wml « N15 — contrôles d'intégration et de diffusion »** : H1, H2, H4, H8 d'abord (≤ 4 jours), puis H3 et H6 (≤ 1 semaine). Préenregistrement OSF en *estimation* (pas de verdict de supériorité à 5 graines, conformément aux avenants du 23/10), bras nuls appariés, interdiction lexicale écrite dans le préreg. H5 et H10 vont dans dream-of-kiki (DR-4 / Paper 2), pas ici.
3. **Produire trois paragraphes, pas un papier** : (a) « Delimiting the contribution » de nerve-wml : *pas* un espace de travail global, comparateur GLW ; (b) related work dream-of-kiki : épisodes = primitives de consolidation, cadre silencieux sur les théories d'état, citer Zhang 2026 et Deperrois 2022/2024 ; (c) positionnement BioFieldWML en naturalisme de type B (Klatzmann 2026). Utiliser la grille Butlin 2026 comme *audit* en annexe (≤ 2/14), jamais comme résultat.
4. **Réévaluer dans 12 mois** à la sortie des résultats INTREPID (Corcoran et al. 2026) ou d'un test adverse en sommeil ; d'ici là, aucune communication publique Hypneum sur la conscience ou le bien-être des IA.

---

### Résumé (≤ 15 lignes)

- Aucune théorie de la conscience n'est sortie intacte de COGITATE (Nature 2025) ; IIT reste accusée d'intestabilité et son Φ n'a jamais été calculé sur un système réel (Barrett et al. 2026) ; pour IIT elle-même un réseau simulé n'a pas de Φ (Findlay 2024).
- Les indicateurs (Butlin et al., TICS 2026) et le cadre bayésien DeepMind (sept. 2026) produisent des crédences dominées par les priors, pas des détections.
- nerve-wml n'est **pas** un espace de travail global (pas de goulot partagé, pas de diffusion à tous, pas d'ignition soutenue) ; c'est du codage prédictif modulaire épars, dont le comparateur naturel est le Global Latent Workspace de VanRullen & Kanai.
- Les épisodes de rêve de GENIAL sont des primitives de consolidation sans analogue dans les théories de la conscience ; Zhang 2026 (replay sans phase hors-ligne) découple encore consolidation et état.
- Hypneum a deux vrais apports : ADR-0001 (la quantification fabrique ×10 d'alignement) comme contrôle que les cadres « accès = discrétisation » ne font pas, et BioFieldWML comme banc du mécanisme bistabilité→faible complexité (PCI).
- Mesures calculables : PhiID, sPCI (recette Breyton 2025), LZc, indices de diffusion/ignition, criticité — toujours en ratio à un bras nul, jamais en absolu ; Φ (PyPhi 2.0rc) réservé à des jouets ≤ 8 unités.
- Dix hypothèses préenregistrables sont proposées (H1–H10), dont six contrôles négatifs bon marché (< 1 semaine M1/4090).
- Risques : contagion « pseudoscience », erreur de catégorie Φ, effet miroir, voisinage HF toxique, terrain bien-être des IA politisé (politique Anthropic 08/10/2026).
- Recommandation : ne pas ouvrir « R10 — conscience » ; ouvrir un sous-axe nerve-wml « contrôles d'intégration et de diffusion » avec interdiction lexicale, critères d'arrêt chiffrés et réévaluation à 12 mois (résultats INTREPID).
- Sources faibles signalées (⚠) : agrégateurs/blogs pour Eleos ConCon, « Studying AI Welfare Empirically », collection BBS, Ignition Index (1★, non relu).
