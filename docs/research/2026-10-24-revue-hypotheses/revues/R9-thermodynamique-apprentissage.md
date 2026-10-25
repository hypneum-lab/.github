# R9 — Thermodynamique de l'apprentissage et de la mémoire

Évaluation d'axe pour Hypneum Lab · 2026-10-24 · périmètre : Landauer / calcul réversible, thermodynamique stochastique de l'apprentissage, coût énergétique de la consolidation (cerveau, SHY), lecture thermodynamique du FEP, modèles à énergie, calcul thermodynamique et p-bits, flots de gradient ↔ dissipation, bornes information–énergie pour la communication sparse, efficacité énergétique des SNN.
Contexte lu et non dupliqué : `veille-2026-10-23.md` ; README de `dream-of-kiki`, `kiki-flow-research`, `nerve-wml` ; spec framework C §6.2 (DR-0 : `∀ δ ∈ dream_output_channels, ∃ DE ∈ History : budget(DE) < ∞ ∧ δ ∈ outputs(DE)`).
Méthode : 25 recherches web (budget WebSearch de session épuisé ensuite), 18 requêtes GitHub, 10 requêtes HF (papers/models/datasets), 12 requêtes API arXiv (dont 5 fenêtrées sept.–oct. 2026 ; l'API a renvoyé 429 pendant ~15 min), ~35 fiches arXiv relues une à une, Crossref/Europe PMC pour les DOI hors arXiv. Les pages nature.com sont derrière un mur → résumés via Europe PMC. Toute référence ci-dessous a été résolue (ID arXiv, DOI ou URL) ; les sources faibles (marketing hardware, blogs, estimations non mesurées) sont marquées ⚠.

## 0. Verdict en dix lignes

1. **Le pont le plus solide est déjà dans vos murs** : le schéma JKO de kiki-flow *est* la discrétisation variationnelle de Fokker-Planck comme flot de gradient d'une énergie libre (Jordan–Kinderlehrer–Otto 1998). La « dissipation » par pas de JKO est une vraie chaleur si et seulement si les particules sont lues comme browniennes suramorties à température β⁻¹. Le biais entropique de Sinkhorn (plancher ε/(2τ), déjà mesuré dans E1b) se lit comme une *température effective parasite* — c'est un résultat prêt à écrire.
2. **DR-0 ne doit pas être reformulé en joules** (cela briserait l'agnosticité de substrat) mais peut être *instancié* par une borne inférieure substrate-agnostique : le nombre de bits effacés par épisode de rêve (Landauer : Q ≥ kT ln2 par bit). Un budget en joules n'est prédictif que sur un substrat physique (thermodynamique ou neuromorphique) ; sur GPU, chaque opération coûte ~10⁸–10⁹ kT et Landauer est numériquement muet.
3. **La signature thermodynamique de la consolidation existe dans des modèles simulables** mais elle est à double tranchant : plus de précision ⇒ plus de production d'entropie (Kodama & Hinczewski, ICLR 2026 workshop ; Chen & Limmer 2026). Le « rêve à dissipation minimale » n'est donc pas un bien en soi ; il faut comparer à iso-performance. SHY/downscaling a en revanche reçu en 2026 un appui causal fort (Driessen, Squarcio, Tononi & Cirelli, *Nat. Neurosci.* 29:1954).
4. **Les claims énergie des SNN/BSK ne sont pas soutenables en l'état** : ils sont analytiques (comptage AC vs MAC), jamais mesurés sur le matériel qui les exécute ; les ratios Loihi 2 dépendent entièrement de la baseline (341× vs Jetson Orin Nano dans la v3 du 20/10/2026, abstract). Le taux de décharge 1–3 % ne se traduit pas en joules sur noyaux denses. `electron-rare/spikingkiki-27b` est explicitement « not benchmarked end-to-end ».
5. **Substrats accessibles** : simulateurs JAX (thrml d'Extropic, thermox de Normal), code Whitelam (PRL 2026), votre propre moteur Langevin/JKO avec comptabilité de chaleur à la Sekimoto, snntorch/spikingjelly/NeuroBench pour les proxys, `powermetrics`/NVML pour des joules réels sur M1/4090. Aucun matériel thermodynamique n'est achetable (Extropic Z1 : accès anticipé 2027 ; Normal CN101 : puce de test).

## 1. Cadrage : analogie, modèle formel, substrat

Trois niveaux à ne jamais confondre dans un papier Hypneum :

| Niveau | Ce que « énergie » signifie | Exemples | Statut pour GENIAL |
|---|---|---|---|
| **Analogie** | fonction de Lyapunov, divergence KL, « énergie » de Hopfield | FEP de Friston (énergie libre *variationnelle*), énergie de Hopfield moderne, « energy-based replay » | utile pour l'intuition, **interdit comme prédiction** : les critiques 2025 montrent la conflation variationnel/thermodynamique chez Friston |
| **Modèle formel** | production d'entropie Σ, chaleur Q, travail W d'un processus stochastique (Langevin / Fokker-Planck / chaîne de Markov) | thermodynamique stochastique (Seifert, Sekimoto), Landauer, TUR, limites de vitesse (Wasserstein speed limits), JKO | **vrai pour kiki-flow** si l'on lit les particules comme browniennes ; vrai pour tout substrat Langevin/Boltzmann (thrml, p-bits) ; **métaphore** pour un transformeur sur GPU |
| **Substrat** | joules mesurés : ATP, J/op, J/token, J/échantillon | Attwell & Laughlin 2001 (cerveau), NVML/powermetrics (GPU/M1), télémetrie Loihi 2 | seul niveau où une prédiction en joules est falsifiable ; dépend du matériel, donc **hors axiomes** |

Où GENIAL est concerné :
- **DR-0 (accountability, budget fini)** — le budget est abstrait ; la thermodynamique propose deux instanciations : (i) *bits effacés* par DE (substrate-agnostique, borne de Landauer), (ii) *joules* (substrat). Voir §3.2 et §8 H1/H10.
- **Opérations `downscale` / `replay` / `restructure` / `recombine`** — `downscale` ↔ SHY (Tononi & Cirelli) ; `recombine`/« rêve » ↔ *unlearning* de Hopfield–Feinstein–Palmer 1983 et Crick & Mitchison 1983 ; `replay` ↔ coût de réécriture des paramètres (Tkachenko : E < 2NDkT en entraînement).
- **kiki-flow (JKO)** — pont exact JKO ↔ Fokker-Planck ↔ énergie libre (§3.1).
- **nerve-wml (messages discrets, GTM θ/γ)** — bornes puissance–précision–vitesse de la communication physique (Lahiri, Sohl-Dickstein & Ganguli 2016), coût par spike/par bit (Laughlin 1998 ; Levy & Calvert 2021 : la communication coûte 35× le calcul).
- **BSK (LLM à impulsions, fire rate 1–3 %)** — question (c) : la seule réponse recevable est une mesure en joules à iso-qualité (§8 H7).

## 2. État de l'art

Relation : **A** appuie · **C** contredit · **D** dépasse (fait déjà ce que vous visez, ou plus) · **N** neutre/outil. Dépôt : DoK = dream-of-kiki, KF = kiki-flow, NW = nerve-wml, BSK = spikingkiki.

### 2.1 Fondements (Landauer, effacement, réversibilité)

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Landauer, IBM J. R&D 5:183 (DOI 10.1147/rd.53.0183) | 1961 | Effacer 1 bit dissipe ≥ kT ln2 (≈ 2,9 zJ à 300 K) | A | DoK |
| Bennett, Int. J. Theor. Phys. (DOI 10.1007/bf02084158) | 1982 | Calcul logiquement réversible sans coût d'effacement ; coût reporté sur le nettoyage des ancillas | A | DoK |
| Bérut et al., *Nature* 483:187 (DOI 10.1038/nature10872) | 2012 | Vérification expérimentale (colloïde, double puits) ; surcoût fini-temps en 1/τ | A | — |
| Sagawa & Ueda, PRL 102:250602 | 2009 | Coût minimal mesure + effacement ; l'effacement n'est pas le seul poste | A | DoK |
| Parrondo, Horowitz & Sagawa, *Nat. Phys.* 11:131 (DOI 10.1038/nphys3230) | 2015 | Cadre « thermodynamique de l'information » : bornes par information mutuelle | A | — |
| Wolpert, J. Phys. A 52:193001 (DOI 10.1088/1751-8121/ab0850) | 2019 | Revue : coût thermodynamique de n'importe quel calcul, *mismatch cost* | A | DoK |
| Chattopadhyay et al., Rep. Prog. Phys. 88:086001 (arXiv:2506.10876) | 2025 | Revue Landauer : les effacements pratiques dissipent ≫ borne ; peu d'expériences l'atteignent | A | — |
| Barros, Whitelam, Ciliberto & Bellon (arXiv:2609.11473) | 10/09/2026 | Mémoire 1 bit sous-amortie : Landauer + 1/τ en quasi-statique ; régime adiabatique τ < t_r ; protocoles appris par RL battent les protocoles « optimaux » à bords d'équilibre | A | DoK |
| Thumann & Soloveichik (arXiv:2610.24435) | 17/10/2026 | Compromis énergie–mémoire–temps *semi-réversible* : ratio λ = ε_I/ε_R fixe l'ordonnancement optimal (blocs réversibles + un effacement) | A | DoK |

### 2.2 Thermodynamique stochastique de l'apprentissage et de l'inférence

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Goldt & Seifert, PRL 118:010601 (arXiv:1611.09428) | 2017 | L'information acquise par un réseau est bornée par le coût thermodynamique ; efficacité η ≤ 1 ; Hebb analysé | A | DoK/KF |
| Still, Sivak, Bell & Crooks, PRL 109:120604 | 2012 | L'information *non prédictive* retenue borne la dissipation par le bas : une mémoire efficace doit être prédictive | A | DoK |
| Still, PRL 124:050601 (arXiv:1705.00612) | 2020 | Coût et bénéfice de la mémoire ; minimiser la dissipation ⇒ compression qui garde l'information prédictive | A | DoK |
| Boyd, Crutchfield & Gu, NJP 24 (DOI 10.1088/1367-2630/ac4309) ; NJP 27 (10.1088/1367-2630/addf71) | 2022 ; 2025 | Apprentissage = extraction maximale de travail ; **sur-apprentissage = dissipation divergente**, régularisation = pénalité énergétique | A | DoK |
| Seroussi, Alemi, Helias & Ringel (arXiv:2307.14653) | 2023 | Limites de vitesse (W₂²/production d'entropie) pour l'entraînement ; optimal « au sens d'échelle » en régime NTK | A | KF |
| Kobayashi & Dechant (arXiv:2609.08219) | 08/09/2026 | SGD comme processus de Markov : *speed limit* sur le flux d'information de Fisher vers les variables latentes ; termes dérive vs bruit | A | KF |
| Tkachenko (arXiv:2503.09980 v3) | 12/2025 | DNN analogique quasi-statique : inférence réversible à coût évanescent ; **entraînement E < 2NDkT** (N paramètres, D données) | A/D | DoK |
| D'Ambrosia, Daniels, DeWeese & Sahai (arXiv:2605.19195) | 05/2026 | Coût Landauer de la régression linéaire exacte et par SGD ; lois d'échelle « energy-aware » pour la taille de jeu de données | A | — |
| Shettell & Auffèves (arXiv:2601.17282) | 01/2026 | « Efficacité entropique » de l'inférence bayésienne = gain d'information / coût d'effacement des mémoires ; séquentiel vs parallèle | A | DoK |
| Wu (arXiv:2610.00291) | 25/09/2026 | Le seuil d'information (rate–distortion) **ne suffit pas** à fixer le coût physique d'un classifieur ; écart explicite sous contrainte d'exactitude | A | — |
| Chen & Limmer (arXiv:2608.23764) | 24/08/2026 | Réseaux de Markov : erreur de retard ≤ f(taux de production d'entropie, temps de mémoire) ; calcul précis ⇒ dissipation forte **ou** modes lents | A | NW |
| Li, Xia, Wang, Lv & Su (arXiv:2305.18848) | 2023 | Borne (Cauchy–Schwarz) sur la production d'entropie d'un état interne qui apprend sous *coarse-graining* | A | — |
| Takahashi & Hayashi (arXiv:2602.05463 v2) | 02–07/2026 | Métriques bits/joule (« epiplexity », empowerment) ; banc « Landauer-scale » à cycle fermé ; sans fermeture, gain d'info et dissipation se découplent | A | DoK |
| Milburn (arXiv:2305.07801) ⚠ preprint | 2023 | Toute machine apprenante est dissipative ; la dissipation décroît avec l'erreur | A | — |
| Caraffa (arXiv:2601.17933) ⚠ perspective, 68 p. | 01/2026 | « Dissipative learning » : régularisation Fisher–Rao thermodynamiquement optimale — pas de prédiction chiffrée | N | — |

### 2.3 Diffusion, score et thermodynamique

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Kodama & Hinczewski (arXiv:2510.06174 ; poster workshop ICLR 2026) | 10/2025 | Borne inférieure sur la NLL via taux d'entropie ; **précision accrue ⇒ production d'entropie accrue** | A/C | DoK/KF |
| Ding, Quan & Tu (arXiv:2606.17252) | 06/2026 | Production d'entropie « time-asymmetry » : sa moyenne est exactement ∝ l'objectif de score matching ; théorèmes de fluctuation | A | KF |
| Kim, Park, Noh & Lee (arXiv:2610.27754) | 20/10/2026 | La mémorisation d'un modèle de diffusion se détecte comme *singularité thermodynamique* du processus inverse | A | DoK (Wave 3b) |

### 2.4 Cerveau : coût énergétique du signal et de la mémoire

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Attwell & Laughlin, JCBFM 21:1133 (DOI 10.1097/00004647-200110000-00001) | 2001 | Budget énergétique : ~47 % potentiels d'action, ~34 % postsynaptique ; ~3,3×10⁹ ATP/s pour un neurone à 4 Hz | A | NW |
| Laughlin, de Ruyter van Steveninck & Anderson, *Nat. Neurosci.* 1:36 (DOI 10.1038/236) | 1998 | 10⁶–10⁷ ATP/bit (≈ 2×10⁷–2×10⁸ kT/bit) : le cerveau est **~8 ordres au-dessus de Landauer** | A/C | NW/BSK |
| Harris, Jolivet & Attwell, *Neuron* 75:762 ; Harris et al., *Curr. Biol.* 25:3151 | 2012 ; 2015 | Usage/approvisionnement synaptique ; la taille d'EPSC sélectionnée **ne maximise pas** l'information mais bits/ATP | A | NW |
| Levy & Calvert, PNAS 118:e2008173118 | 2021 | Communication (PA + transmission) = **35×** le coût du calcul ; les deux prédisent le nombre de synapses (commentaire Balasubramanian, PNAS 118:e2107022118) | A | NW |
| Hasenstaub et al., PNAS 107:12329 | 2010 | Le coût métabolique unifie la biophysique neuronale | A | NW |
| Sengupta et al., PLoS CB 6:e1000840 ; 10:e1003439 | 2010 ; 2014 | Efficacité des PA varie entre types ; passer de gradué à impulsionnel coûte en bits/ATP | A | BSK |
| Karbowski, J. Neurophysiol. 122:1473 ; *Entropy* 26:779 | 2019 ; 2024 | Plasticité = 4–11 % de l'énergie synaptique ; mémoire longue coûte plus ; échelle ~10⁵ kT par synapse | A | DoK |
| Li & van Rossum, *eLife* 9:e50804 | 2020 | « Synaptic caching » : poids transitoires bon marché, consolidation au-dessus d'un seuil | A | DoK |

### 2.5 Sommeil, SHY et métabolisme (2025–2026)

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Tononi & Cirelli, *Neuron* 81:12 ; Cirelli & Tononi, Semin. Cell Dev. Biol. 125:91 | 2014 ; 2022 | SHY : le sommeil renormalise la force synaptique à un niveau énergétiquement soutenable (*down-selection*) | A | DoK |
| de Vivo et al., *Science* 355:507 (DOI 10.1126/science.aah5982) | 2017 | Preuve ultrastructurale : interface axone-épine réduite (~18 %) après sommeil | A | DoK |
| Driessen, Squarcio, Tononi & Cirelli, *Nat. Neurosci.* 29:1954 (DOI 10.1038/s41593-026-02318-9) | 06/2026 | **Induire des périodes on/off en éveil (optogénétique) réduit les marqueurs de force synaptique et restaure la consolidation** après privation : le downscaling est l'opération causale, pas l'état « sommeil » | A/D | DoK |
| Takahashi, Ikoma & Matsui, *Commun. Biol.* (DOI 10.1038/s42003-026-10646-6) | 07/2026 | Paradoxe REM (souris) : volume sanguin et pyruvate astrocytaire ↑, ATP neuronal ↓ | N | DoK |
| Li, Wang, Meng & Kang, *Signal Transduct. Target. Ther.* (DOI 10.1038/s41392-026-02890-3) | 2026 | Revue : baisse du métabolisme en NREM, downscaling comme économie — **mécanistiquement proposé, non mesuré** | N | — |
| Carvalho et al., *Sleep Med.* (DOI 10.1016/j.sleep.2026.109072) | 2026 | n = 37, FDG-PET : continuité du sommeil ↔ captation de glucose ; corrélationnel | N | — |
| Massey, Nichele & Hubin (arXiv:2609.13927) | 12/09/2026 | « Napping » (scaling proportionnel + bruit membranaire) dans un RSNN STDP : égale la normalisation ; optimum à durée courte, déclin monotone au-delà | A | NW/DoK |

### 2.6 Hopfield, modèles à énergie, « rêve » formel

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Hopfield, Feinstein & Palmer, *Nature* 304:158 ; Crick & Mitchison, *Nature* 304:111 | 1983 | *Unlearning* d'états générés spontanément stabilise la mémoire ; « nous rêvons pour oublier » | A | DoK |
| Fachechi, Agliari & Barra, Neural Netw. 112:24 (arXiv:1810.12217) | 2019 | Phase « sommeil » hors ligne : le noyau de Hebb converge vers le projecteur des purs ; capacité α → 1 | A | DoK |
| Marinari, Rossi & Zamponi (arXiv:2603.09384) | 03/2026 | Hopfield à synapses bornées : alterner apprentissage et rêve (HFP) récupère de la capacité sans oubli catastrophique | A | DoK |
| Barra, Durante, Ladiana & Marra Solazzo (arXiv:2605.13721) | 05/2026 | DLAM : le « temps de sommeil » t est un paramètre de contrôle ; la consolidation hors ligne **remplace partiellement des données** | A | DoK |
| Takeda, Oizumi & Karakida (arXiv:2605.27975) | 05/2026 | Oubli ≡ hausse d'énergie de Hopfield moderne ; **sélection du replay par énergie** (Stable Diffusion, DDPM) | A | DoK |
| PR Applied (DOI 10.1103/7jh8-2vny) | 01/2026 | Mémoire associative dense photonique (interactions à 4 corps), capacité ×10–50 | N | — |
| Sotero, Taghipour & Sanchez-Bornot (arXiv:2610.15968) | 11/10/2026 | L'attention spiking sans softmax = **limite température zéro** de systèmes à deux niveaux ; plancher de type Landauer porté par la génération de PA | A | BSK |

### 2.7 Calcul thermodynamique, p-bits, Langevin hardware

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Aifer et al., npj Unconv. Comput. 1:13 ; Melanson et al., *Nat. Commun.* 16 (DOI 10.1038/s41467-025-59011-x) | 2024 ; 2025 | Algèbre linéaire thermodynamique ; SPU à 8 cellules RLC : échantillonnage gaussien, inversion ; **aucun chiffre d'énergie mesuré** | N | — |
| Donatella et al., npj Unconv. Comput. (DOI 10.1038/s44335-025-00049-x ; arXiv:2405.13817) | 01/2026 | Gradient naturel thermodynamique : GPU + SPU analogique résout le système linéaire du NGD | N | — |
| Holdijk et al. (Normal Computing), arXiv:2608.00754 | 01/08/2026 | CN101 : thermodynamique **numérique** (générateur L* arbitraire, « parallélisme séquentiel »), 4 tuiles × 64 variables ; ⚠ gains « jusqu'à 1000× » = déclaration d'entreprise | N | — |
| Rolandi, Abiuso, Lipka-Bartosik, Aifer, Coles & Perarnau-Llobet (arXiv:2601.04358) | 01/2026 | Bornes géométriques sur le produit énergie–délai–déficience ; protocoles quasi-optimaux sans connaître la solution | A | KF |
| Whitelam, PRL 136 (DOI 10.1103/kwyy-1xln ; arXiv:2506.15121) | 01/2026 | Calcul thermodynamique génératif : le dénoiseur est la dynamique physique, entraînée à **minimiser la chaleur émise** ; simulation numérique seulement | A/D | DoK |
| Whitelam & Casert, *Nat. Commun.* (DOI 10.1038/s41467-025-67958-0) | 2026 | « Neurones thermodynamiques » (puits quartique) : approximateur universel alimenté par les fluctuations | N | — |
| Whitelam (arXiv:2608.27938) | 28/08/2026 | *Speed limit* de Wasserstein appliquée : un ordinateur thermodynamique fonctionne **à 40 % de la limite d'efficacité** sans perte de précision | A | KF |
| Wang & Deng (arXiv:2609.15439) | 14/09/2026 | Apprentissage local en ligne (Onsager–Machlup) : modèles qui **émettent moins de chaleur** (5/5 graines) ; sensible au placement du bruit | A | DoK |
| Jelinčič, …, Chuang, Verdon & McCourt (Extropic), arXiv:2510.23972 ⚠ | 10–12/2025 | Architecture pbit tout-transistor ; « ≈ 10 000× moins d'énergie » **par analyse système**, benchmark image simple | N | — |
| Camsari group, *Nat. Commun.* 15 (DOI 10.1038/s41467-024-46645-6) ; Chowdhury et al., IEEE JxCDC 9:1 | 2024 ; 2023 | p-bits sMTJ + FPGA, apprentissage de Boltzmann ; vue « full-stack » | N | — |
| Fang et al. (arXiv:2610.31339) | 22/10/2026 | Premier **p-computer à états continus** sur FPGA ; 33 000× plus rapide qu'un solveur QUBO logiciel sur un cas de factorisation 7 bits ; récupération MNIST 100 % | N | — |
| Kamal & Pedram (arXiv:2610.15392) | 11/10/2026 | Calcul stochastique sans état sur logique supraconductrice SFQ, générateur flow-matching | N | — |
| Delacour et al. (arXiv:2610.03972) | 02/10/2026 | Revue des algorithmes probabilistes pour machines d'Ising (PAOA, tempering) | N | — |
| Hasan & Shukla (arXiv:2602.04014) | 02/2026 | Tout double puits lisse → forme quartique ; échantillonnage « Boltzmann-like » universel des p-bits | N | — |

### 2.8 Efficacité énergétique des SNN : mesures vs claims

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Yik et al., *Nat. Commun.* 16:1545 (NeuroBench) | 2025 | Métriques standardisées : SynOps (MAC/AC effectifs), sparsité, empreinte — **proxys, pas des joules** | N | BSK/NW |
| Isik et al. (arXiv:2408.16096, HPEC 2024) | 2024 | Loihi 2 fusion de capteurs : > 100× CPU, ~30× GPU ; CPU/GPU non nommés dans l'abstract | C | BSK |
| Hajizada et al. (arXiv:2511.01553 v3) | 20/10/2026 | Apprentissage continu sur Loihi 2 : 0,33 ms et **0,05 mJ par mise à jour**, 341× moins que Replay sur Jetson Orin Nano (méthode de mesure non décrite dans l'abstract) | A/C | BSK |
| Huang et al., TMLR (arXiv:2510.04595) | 01/2026 | SpikingMamba-1.3B : « 4,76× d'énergie » — méthode d'estimation absente de l'abstract (analytique) | C | BSK |
| Xu et al. (arXiv:2604.16475) | 04/2026 | SDLLM : « 7× d'énergie » vs LLM spiking antérieurs, aucun matériel | C | BSK |
| Pan et al. (arXiv:2604.22575) | 04/2026 | SpikingBrain2.0-5B : sparsité 64,31 % ; −70,6 % surface, −46,5 % puissance à 500 MHz (chiffres de synthèse) | C | BSK |
| Saunders, Ren & He (arXiv:2610.15146 v2) | 10/10/2026 | Lois d'échelle IsoFLOP de LM spiking : N_opt ∝ C^0,56 ; **coût du spiking 0,34 → 0,23 nats**, coût du backbone 0,16 nats | A/C | BSK |
| Ma et al. (arXiv:2610.21748) | 15/10/2026 | Jusqu'à 44 % de neurones « profondément inhibés » mais coûteux ; neurone dormant −40 à −70 % d'énergie (analytique) | A | BSK |
| Ruf & Detyniecki (arXiv:2610.19819) | 14/10/2026 | Télémetrie A100 : rapport énergie token d'entrée/sortie 150–850× ; seuil où O(n²) bat la parallélisation | N | BSK |
| Pyrzowski et al. (arXiv:2610.20971) | 14/10/2026 | Mécanique statistique des trains de spikes : distribution de Boltzmann sur configurations, température effective = drive externe, transition oscillatoire | A | NW |

### 2.9 Communication sparse : bornes information–énergie

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Lahiri, Sohl-Dickstein & Ganguli (arXiv:1603.07758) | 2016 | **précision × vitesse ≤ puissance dissipée** pour tout canal physique rapide ; lien friction/géométrie de l'information | A | NW |
| Tasnim, Freitas & Wolpert (arXiv:2302.04320) | 2023–24 | Production d'entropie d'un canal : pas toujours convexe/monotone en capacité ; l'est à haute capacité | A | NW |
| Harvey, Lahiri & Ganguli, PRE 108:014403 | 2023 | Compromis énergie–précision universels en détection cellulaire | A | NW |
| Ghosh, Rai, Soni & Kumar (arXiv:2610.31126) | 22/10/2026 | La communication non réciproque a un coût entropique ; hiérarchie des vols de pigeons contrainte par un taux de production d'entropie **constant par individu** | A | NW |

### 2.10 Flots de gradient (références de pont, hors veille du 23/10)

| Réf | Date | Résultat | Rel. | Dépôt |
|---|---|---|---|---|
| Jordan, Kinderlehrer & Otto, SIAM J. Math. Anal. 29:1 | 1998 | Fokker-Planck = flot de gradient W₂ de F[ρ] = ∫Vρ + β⁻¹∫ρ log ρ | A | KF |
| Peyré, SIAM J. Imaging Sci. 8:2323 | 2015 | JKO entropique (Sinkhorn) ; biais ε — mesuré dans KF E1b | A | KF |
| Mokrov et al., NeurIPS (arXiv:2106.00736) ; Lee, Wang & Li (arXiv:2603.23901) | 2021 ; 03/2026 | JKO neuronaux (ICNN) ; JKO cinétique pour Vlasov–Fokker-Planck | N | KF |

## 3. Ponts formels : solides vs faibles

### 3.1 Solide — JKO ↔ Fokker-Planck ↔ énergie libre ↔ dissipation (kiki-flow)
- **Théorème** (JKO 1998) : la suite ρ_{k+1} = argmin_ρ { W₂²(ρ, ρ_k)/(2τ) + F[ρ] } converge vers la solution de ∂_t ρ = ∇·(ρ∇V) + β⁻¹Δρ. Le long du flot, dF/dt = −∫ρ |∇(V + β⁻¹ log ρ)|² ≤ 0.
- **Lecture thermodynamique exacte** : pour des particules browniennes suramorties à mobilité μ et température β⁻¹ dans V, cette décroissance **est** T × (taux de production d'entropie totale) (Sekimoto ; Seifert, Rep. Prog. Phys. 75:126001, classique). Donc « dissipation par pas JKO » = chaleur, *à condition* d'identifier β⁻¹ à kT et V à un vrai potentiel. Dans kiki-flow, les 4 espèces psycholinguistiques n'ont pas de kT : la lecture reste **modèle formel**, pas substrat — mais toute quantité calculée (Σ, W₂/τ, limites de vitesse) est mathématiquement légitime.
- **Fait nouveau à écrire** : le plancher stationnaire Var* = (ε/τ)·g(τ) → ε/(2τ) (KF E1b, Peyré 2015) est, pour un OU de raideur κ, une variance additive ⇒ équivalent à une **température effective** T_eff ≈ T + κ ε/(2τ k_B) (hypothèse H5). Le biais de Sinkhorn n'est pas un artefact numérique mais un *chauffage* : cela relie l'ERRATUM du 24/10 à la thermodynamique et donne un contrôle expérimental (ε ↔ bruit thermique injecté).
- **Limite de vitesse** (Seroussi 2023 ; Whitelam 2608.27938) : τ ≥ W₂²(ρ₀, ρ_T) / (2 D Σ_tot). Appliquée à un épisode de rêve : durée minimale d'un DE pour un déplacement donné des poids à dissipation donnée (H2).

### 3.2 Solide comme *instanciation*, faible comme *axiome* — Landauer ↔ DR-0
- DR-0 impose budget(DE) < ∞ sans dire ce qu'est le budget. Landauer fournit une **borne inférieure substrate-agnostique** : Q(DE) ≥ k_B T ln2 · B_eff(DE), où B_eff = bits logiquement effacés par `downscale`/`restructure` (perte d'entropie du code des poids). Tkachenko ajoute un coût par paramètre *écrit* (E < 2NDkT en entraînement). D'où une **instanciation** : budget_therm(DE) = B_eff(DE) (en bits) ; joules = substrat × B_eff + surcoût fini-temps (1/τ : Bérut 2012 ; Barros 2026).
- Pourquoi **pas** en joules dans l'axiome : (i) agnosticité de substrat (DR-3) ; (ii) sur GPU chaque opération élémentaire coûte ~10⁸–10⁹ kT, dans le cortex 10⁷–10⁸ kT/bit (Laughlin 1998) — Landauer est 8 ordres en dessous et ne prédit rien ; (iii) Wu 2026 montre que le seuil d'information ne détermine pas le coût physique.
- **Piège formel** (H10) : un DE composé d'opérations logiquement réversibles (replay par flot inversible) a B_eff = 0 tout en modifiant les sorties ⇒ DR-0 « bits » serait trivialement satisfait sans accountability. La comptabilité doit donc inclure un terme de *trafic* (temps × activité, décomposition traffic/inflow de Baiesi & Di Terlizzi, arXiv:2609.39654) — exactement le compromis semi-réversible de Thumann & Soloveichik 2026.

### 3.3 Solide biologiquement, faible formellement — SHY ↔ `downscale`
- Appui causal 2026 : Driessen et al. (on/off en éveil ⇒ marqueurs synaptiques ↓, consolidation restaurée) ; appui ultrastructural (de Vivo 2017) ; économie énergétique argumentée (Tononi & Cirelli 2014) mais **jamais mesurée conjointement** (downscaling + glucose) : les revues 2026 le disent explicitement.
- Lecture thermodynamique disponible : poids synaptique ↔ coût (Karbowski ~10⁵ kT/synapse ; Harris 2015 : taille d'EPSC sélectionnée pour bits/ATP) ; Chen & Limmer 2026 : précision ⇒ dissipation ou modes lents. Il **n'existe pas de théorème** « downscaling ⇒ minimum de dissipation » : c'est une hypothèse (H3), pas un pont.
- Hopfield–Feinstein–Palmer / Fachechi : le « rêve » comme *unlearning* de motifs générés est un pont formel **solide et sous-exploité** par GENIAL (`recombine` n'est pas `unlearning` ; H4).

### 3.4 Faibles (à ne pas utiliser comme prédictions)
- **FEP en lecture thermodynamique** : énergie libre variationnelle = −log-évidence bornée, pas une énergie ; critiques 2025 (arXiv:2511.20321 ; Entropy 23:238). Garder GENIAL hors FEP-thermo.
- **« Énergie » de Hopfield moderne / energy-based replay** (Takeda 2026) : fonction de Lyapunov, utile comme heuristique de sélection, sans kT.
- **Chiffres hardware** : Extropic 10 000× (analyse système, 3 chiffres MNIST), Normal « jusqu'à 1000× » (entreprise), Vaire (aucun chiffre public) — ⚠ marketing.
- **Claims énergie SNN** : AC vs MAC à 45 nm (≈ 0,9 vs 4,6 pJ, convention de la littérature), jamais J mesurés sur l'exécuteur réel ; Saunders 2026 chiffre le *coût* du spiking en nats, pas un gain.
- **Bits par spike ≈ Landauer** : faux de 8 ordres ; ce qui contraint la communication neuronale est la borne puissance–précision–vitesse (Lahiri 2016) et le ratio communication/calcul 35:1 (Levy & Calvert 2021), pas kT ln2.

## 4. Substrats et simulateurs accessibles (Mac M1 32 Go / RTX 4090 / cluster)

| Outil | Ce qu'il simule | Plateforme | Licence · maturité | Usage Hypneum |
|---|---|---|---|---|
| `extropic-ai/thrml` (1170★, maj 22/10/2026) | Gibbs par blocs sur modèles graphiques/EBM discrets, JAX ; backend matériel futur | JAX CPU/GPU (M1 : CPU ; 4090 : CUDA) | Apache-2.0, actif, pas de release taggée | substrat Boltzmann pour H3/H9 ; pas d'émulation TSU |
| `normal-computing-oss/thermox` (70★) | OU exacts (sans erreur de discrétisation), log-prob, algèbre linéaire « thermodynamique » | JAX | Apache-2.0 | OU de référence pour H5 (température effective) |
| `swhitelam/generative_thermodynamic_computing` (16★, maj 20/10/2026) | Code PRL 2026 : dénoiseur = dynamique Langevin entraînée à min. chaleur | NumPy/Python | voir repo | H13 ; prototype MNIST sur M1 |
| `kiki_flow_core` (vôtre) | particules + JKO entropique | MLX/JAX/NumPy | MIT | ajouter la comptabilité Q, Σ (Sekimoto) et l'estimateur CYNAR (arXiv:2609.39654) |
| `jeshraghian/snntorch` (2078★), `fangwei123456/spikingjelly` (2170★) | LIF, surrogate gradients | PyTorch (MPS/CUDA) | MIT / Apache | substrats LIF nerve-wml ; napping (H11) |
| `NeuroBench/neurobench` (142★) | SynOps, sparsité, empreinte | PyTorch | Apache-2.0, Nat. Commun. 2025 | proxys à **rapporter à côté** des joules, jamais à la place |
| `powermetrics` (macOS), NVML/`nvidia-smi` | joules réels par run | M1 / 4090 | — | **seule mesure recevable** pour la question (c) ; protocole Ruf & Detyniecki 2026 |
| Lava (Intel, Loihi 2 via INRC), BrainScaleS/SpiNNaker2 (EBRAINS) | matériel neuromorphique | accès distant sur dossier | — | hors portée immédiate ; stubs déjà dans `nerve-wml/neuromorphic` |
| p-bits FPGA (Fang 2610.31339, Camsari) | échantillonnage physique | FPGA (aucun dans le cluster) | code non identifié | veille uniquement |
| `mtdsousa/landauer` (4★), `artemyk/stochasticthermo`, `otanan/STP`, `gecrooks/LectureNotes220b` | bornes Landauer, thermo stochastique discrète | Python | petits, actifs 2026 | calcul de B_eff (H1) |
| `ml-jku/hopular` etc., `m1balcerak/EnergyMatching` (NeurIPS 2025, 227★) | Hopfield modernes, EBM/flow matching | PyTorch | — | substrat pour H4 (unlearning) |

## 5. Ressources Hugging Face

- **Papers** : `2606.03979` *Language Models Need Sleep* (28 ▲, déjà dans la veille) ; `2510.06174` Kodama & Hinczewski ; `2411.00660` *Physics in Next-token Prediction* (14 ▲ ; invoque Landauer **sans chiffre**, ⚠) ; `2312.09084` *Language Modeling on a SpiNNaker 2 Neuromorphic Chip* (seule mesure LM sur puce neuromorphique trouvée) ; `2601.01916` réservoir thermodynamique sur ASIC SHA-256 (⚠ hypothèse non testée) ; `2602.02439` neuromorphique edge. Aucun paper HF sur la thermodynamique de la consolidation.
- **Modèles** : `electron-rare/spikingkiki-27b` (Qwen3.5-32B + LIF, 122 dl) et `electron-rare/spikingkiki-122b-a10b` (MoE, 17 dl), tous deux « research-stage ; **not benchmarked end-to-end** » ; quantifications tierces `mradermacher/spikingkiki-*-GGUF` (1623 dl pour le 122B-i1) — un public existe sans que la mesure énergétique existe. `maujim/spikingbrain-v1-7b-base`, `hamingsi/SpikingLM`. Aucun modèle « thermodynamic computing ».
- **Datasets** : Sleep-EDF (`WymanYYY/Sleep-EDF-V2`, 905 dl ; nerve-wml Test 9 l'utilise déjà) ; énergie d'inférence LLM mesurée : `ejhusom/llm-inference-energy-consumption` (197 dl), `ohdoking/energy_consumption_by_model_and_gpu` — baselines pour H7. **Trou** : aucun jeu de données de joules mesurés pour SNN/neuromorphique — une contribution Hypneum possible (publier les mesures H7).

## 6. Actualités 15 août – 24 octobre 2026 (vérifiées sur arXiv/éditeur ; ⚠ = source d'entreprise)

- 24/08 — Chen & Limmer, *Entropy Production Bounds the Accuracy of Computation in Markov Networks* (2608.23764).
- 28/08 — Whitelam, *The thermodynamic freedom of a thermodynamic computer* : 40 % de la limite (2608.27938).
- 01/08 ⚠ — Normal Computing, papier CN101 (2608.00754) ; billet de blog 10/08 ; presse : MNIST sur 1 puce, CIFAR-10 sur 6 puces (Hot Chips 2026, non vérifié sur le papier).
- 08/09 — Kobayashi & Dechant, *speed limit* pour l'acquisition d'information en SGD (2609.08219).
- 10/09 — Barros, Whitelam, Ciliberto & Bellon, effacement d'une mémoire sous-amortie, Landauer + 1/τ, protocoles RL (2609.11473).
- 12/09 — Massey et al., *napping* pour RSNN (2609.13927).
- 14/09 — Wang & Deng, apprentissage local en ligne pour calcul thermodynamique génératif, moins de chaleur (2609.15439).
- 21/09 ⚠ — Vaire Computing : H. Earley dans MIT TR35 ; toujours aucun chiffre public de récupération d'énergie.
- 25/09 — Wu, coûts thermodynamiques sous contrainte d'exactitude (2610.00291).
- 30/09 — Baiesi & Di Terlizzi, CYNAR, estimateur de production d'entropie à partir de trajectoires partielles (2609.39654).
- 02/10 — Delacour et al., revue algorithmes probabilistes pour machines d'Ising (2610.03972).
- 10/10 — Saunders, Ren & He, lois d'échelle compute-optimal pour LM spiking (2610.15146 v2).
- 11/10 — Sotero et al., attention spiking = limite T = 0 (2610.15968) ; Kamal & Pedram, SFQ (2610.15392).
- 14/10 — Pyrzowski et al., mécanique statistique des trains de spikes (2610.20971) ; Ruf & Detyniecki, énergie des tokens d'entrée sur A100 (2610.19819).
- 15/10 — Ma et al., neurone spiking dormant (2610.21748).
- 17/10 — Thumann & Soloveichik, ordonnancement énergie-optimal du calcul réversible (2610.24435).
- 20/10 — Hajizada et al. (Intel), v3 Loihi 2 : 0,05 mJ/màj, 341× vs Jetson (2511.01553) ; Kim et al., singularité thermodynamique et mémorisation (2610.27754).
- 22/10 — Fang et al., p-computer à états continus sur FPGA (2610.31339) ; Ghosh et al., coût entropique de la communication non réciproque (2610.31126).
- Côté biologie : Driessen et al. publié en ligne le 08/06, numéro d'août 2026 ; aucune nouvelle mesure conjointe downscaling + métabolisme trouvée en sept.–oct.
- ⚠ Extropic : page « writing » non lisible (JS) ; page matériel : X0 (T1 2025), XTR-0 (T3 2025), Z1 **accès anticipé 2027** ; LOI 75 M$ avec le Dept. of Commerce (avril 2026, communiqué). Rien de mesuré publiquement.

## 7. Risques et critères d'arrêt

| # | Risque | Critère d'arrêt (préenregistrable) |
|---|---|---|
| R1 | Dérive analogique (style FEP) : parler de « chaleur » sans processus physique défini | Arrêt si aucune quantité (bits effacés **ou** joules mesurés) n'est définissable sur ≥ 2 substrats conformes C+ |
| R2 | Landauer numériquement muet (10⁸–10⁹ kT/op sur GPU ; 10⁷–10⁸ kT/bit dans le cortex) | Toute prédiction qui exige d'être « près de Landauer » est rejetée ; ne garder que B_eff (bits) et J mesurés comme axes séparés |
| R3 | Marketing hardware (Extropic, Normal, Vaire) | Ne citer un chiffre que s'il est mesuré par un tiers sur silicium ; sinon « projection » |
| R4 | Claims énergie SNN/BSK analytiques | Si J/token mesuré de spikingkiki ≥ base dense à iso-qualité après un effort sérieux de noyaux sparses : **retirer** le claim énergie, garder la ligne comme recherche sur la sparsité |
| R5 | Confusion « moins de dissipation = mieux » | Toute comparaison de dissipation à iso-performance (TOST), jamais seule ; Kodama et Chen–Limmer prédisent le contraire |
| R6 | Biais ε de Sinkhorn lu comme signal thermodynamique | Toute « chaleur » de kiki-flow extrapolée ε → 0 ou calculée avec le prox corrigé (ERRATUM 24/10) |
| R7 | Sur-interprétation biologique de SHY | Ne jamais écrire « le downscaling économise de l'énergie » sans la mesure manquante ; écrire « réduit les marqueurs de force synaptique (Driessen 2026) » |
| R8 | Discipline statistique | ≥ 5 graines, TOST, puissance ; une seule hypothèse confirmatoire par préenregistrement |
| R9 | Coût d'opportunité | Si après H1 + H5 + H7 (≈ 3 semaines M1) aucun résultat n'est « prêt à préenregistrer », replier l'axe en annexe de Paper 1 |

## 8. Brainstorm : hypothèses falsifiables (majoritairement hors paradigme LLM)

Format : énoncé · prédiction · test (machine) · réfutation · réf.

**H1 — DR-0 en bits effacés (instrumentation).** B_eff(DE) = Σ_ops ΔH(code des poids) est fini et croît linéairement avec le paramètre `budget` de `kiki_oniric`. · Pente > 0, R² > 0,9 sur 5 graines × 3 profils. · M1 : quantifier les poids (8 bits), mesurer l'entropie empirique avant/après chaque op, journaliser dans le run registry R1. · Réfuté si B_eff est non monotone ou non borné à budget fixe. · Landauer 1961 ; Tkachenko 2503.09980.

**H2 — Durée minimale d'un épisode de rêve (speed limit).** Sur un substrat Langevin (particules kiki-flow, D fixé), τ_DE ≥ W₂²(ρ_avant, ρ_après)/(2DΣ). · Les DE observés respectent la borne avec un facteur ≤ 3 (Whitelam 2026 : 40 % de la limite). · M1 : calculer W₂ (POT) et Σ (CYNAR ou Sekimoto) par DE. · Réfuté si des DE violent la borne (⇒ la dynamique n'est pas Langevin ⇒ information). · Seroussi 2307.14653 ; Whitelam 2608.27938.

**H3 — Signature SHY : le downscaling refroidit l'inférence.** Dans une machine de Boltzmann (thrml), un DE avec `downscale` réduit le taux de production d'entropie de la dynamique de rappel d'au moins 20 % à iso-rappel (TOST, Δ ≤ 2 points). · M1/4090 : 5 graines, EP mesurée par flux de probabilité. · Réfuté si EP inchangée ou rappel dégradé. · Tononi & Cirelli 2014 ; Chen & Limmer 2608.23764.

**H4 — `recombine` ≠ `unlearning` : ajouter l'unlearning HFP au monoïde Op.** Générer des motifs spontanés et désapprendre réduit la fraction d'attracteurs parasites du codebook VQ de nerve-wml. · Fraction parasite −50 % ; MI/H post-VQ inchangé ±0,02. · M1 : `track_p` VQCodebook + phase sommeil Fachechi. · Réfuté si MI/H chute > 0,05 ou fraction parasite stable. · Hopfield et al. 1983 ; Fachechi 2019 ; Marinari 2603.09384.

**H5 — Le biais ε de Sinkhorn est une température effective.** Pour un OU de raideur κ, le JKO entropique coïncide avec le JKO exact à température T + κε/(2τ k_B) (erreur KL < 10⁻³ nats). · M1 : étendre E1b (thermox pour l'OU exact) ; vérifier pour V quartique. · Réfuté si le mapping échoue hors du quadratique (⇒ le biais n'est pas un chauffage). · Peyré 2015 ; KF ERRATUM 24/10 ; Baradat et al. 2025.

**H6 — Borne de Lahiri sur les neuroletters.** Dans nerve-wml, MI/H × débit ≤ c · puissance du transducteur (énergie de constellation PSK × durée). · Saturation observable : au-delà d'une puissance seuil, MI/H plafonne (pente < 0,01 par doublement). · M1 : balayage de l'énergie de constellation, 5 graines. · Réfuté si MI/H croît sans puissance ajoutée. · Lahiri 2016 ; Tasnim 2302.04320.

**H7 — Le taux de décharge n'est pas de l'énergie (test décisif BSK).** J/token mesuré de spikingkiki-27b vs Qwen3.5-32B dense à iso-qualité (perplexité ± 2 %). · Analytique (AC/MAC) prédit ≥ 4× ; nous prédisons ≤ 1,1× sur noyaux denses MLX/CUDA. Les deux ne peuvent être vraies. · M1 (`powermetrics`, 27B 4 bits) et 4090 (NVML), 5 répétitions × 3 prompts. · Si ≤ 1,1× : retirer le claim énergie (R4). · Huang TMLR 2026 ; Ruf & Detyniecki 2610.19819.

**H8 — Coût du spiking en nats décroît avec l'échelle.** L'écart de qualité BSK/dense diminue de 27B à 122B-A10B. · Δ perplexité(122B) < Δ(27B) d'au moins 25 %. · Studio ou 4090 (quantifié). · Réfuté si l'écart croît. · Saunders 2610.15146.

**H9 — Compromis précision–dissipation de la consolidation.** Sur machine de Boltzmann, Σ par DE est corrélée positivement au gain de performance (ρ de Spearman > 0,5, 20 cellules). · Réfuté si |ρ| < 0,2 (⇒ le rêve peut être « gratuit » : résultat fort). · Kodama & Hinczewski ; Ding, Quan & Tu 2606.17252.

**H10 — Le replay réversible casse DR-0 « bits ».** Un DE fait uniquement de replay par flot inversible a B_eff = 0 et modifie pourtant les sorties ; le test de propriété DR-0 passe. · Démontrer sur `kiki_oniric` avec un replay RevNet. · Si le test passe à B_eff = 0 : DR-0 doit ajouter un terme de trafic (temps × activité). · Bennett 1982 ; Thumann & Soloveichik 2610.24435 ; CYNAR.

**H11 — Napping dans LifWML.** Scaling proportionnel + bruit membranaire égale la normalisation à durée courte ; courbe exactitude/durée unimodale. · Pic à ≤ 10 % de la durée d'époque, déclin ensuite. · M1 : `LifWML` HardFlowProxyTask, 5 graines. · Réfuté si monotone. · Massey 2609.13927.

**H12 — Ratio communication/calcul 35:1.** Dans un pool nerve-wml, le MI/H par unité de coût (SynOps messages + SynOps locaux pondérés 35:1) est maximal en régime sparse. · Optimum à densité de messages < 10 %. · M1. · Réfuté si la messagerie dense gagne à iso-coût. · Levy & Calvert 2021 ; Yik 2025 (SynOps).

**H13 — Rêve thermodynamique génératif (spéculatif).** Un ordinateur thermodynamique à la Whitelam entraîné sur des prototypes consolidés émet moins de chaleur par échantillon que sur les épisodes bruts. · −30 % de chaleur à iso-FID. · M1, code Whitelam, MNIST 3 classes. · Réfuté si chaleur égale. · Whitelam PRL 2026 ; Wang & Deng 2609.15439.

## 9. Concepts et intuitions nouveaux (étiquetés)

- **C1 [SPÉC-FORMEL] Budget en bits effacés comme second axe de DR-0.** Déclarer `budget_bits(DE) = B_eff` à côté du `budget` existant ; Landauer donne Q ≥ kT ln2 · B_eff pour tout substrat physique. Test : H1 + H10 (le second montre que les bits ne suffisent pas et impose un terme de trafic).
- **C2 [SPÉC] Un épisode de rêve est un programme de température.** Puisque ε (Sinkhorn) et le bruit membranaire sont des températures effectives (H5, Massey 2026), un DE optimal devrait suivre un *recuit* (T_eff décroissante) plutôt qu'une température fixe. Test : balayer des schedules ε(k) dans `track2_paper` ; prédiction : recuit > constant sur la rétention CL (TOST).
- **C3 [SPÉC] Downscaling = refroidissement du coût d'inférence.** SHY relu comme baisse du taux de production d'entropie de la dynamique de rappel, non comme baisse de « poids ». Test : H3 ; mesure directement transposable à un substrat Boltzmann/p-bit.
- **C4 [SPÉC-FORMEL] Accountability = effacement + trafic.** Décomposer le coût d'un DE en (bits effacés) + (trafic T, inflow G) à la Baiesi–Di Terlizzi ; un DE réversible coûte du trafic, jamais zéro. Test : H10 ; conséquence : amender la formulation de DR-0 sans toucher DR-1..DR-4.
- **C5 [SPÉC] Multiplexage θ/γ comme partage temporel sous borne de puissance.** Si précision × vitesse ≤ puissance (Lahiri), le GTM est un ordonnanceur qui achète de la précision par du temps (θ) plutôt que par de la puissance (γ). Test : H6 avec et sans GTM ; prédiction : à puissance égale, GTM atteint un MI/H supérieur au `simple_gating` **seulement** sous contrainte de puissance serrée (ce qui expliquerait l'égalité observée hors contrainte).
- **C6 [SPÉC] Consolidation sans phase hors-ligne = dissipation routée vers les modes lents.** Zhang et al. (veille, 2609.31630) obtiennent l'effet du replay sans phase hors ligne ; Chen & Limmer montrent qu'un calcul précis exige dissipation **ou** modes lents. Prédiction : la production d'entropie dans les degrés de liberté « silencieux » pendant l'éveil égale celle d'un DE hors ligne équivalent. Test : comparer Σ (CYNAR) sur sous-espaces lents vs DE discret dans kiki_oniric.
- **C7 [SPÉC] Température effective d'un pool nerve-wml.** Pyrzowski et al. 2026 donnent une distribution de Boltzmann sur trains de spikes avec température = drive externe ; la transition oscillatoire ↔ non-oscillatoire est un paramètre d'ordre naturel pour la strate 5 (criticité) et pour le GTM. Test : estimer T_eff sur les codes de `LifWML` et vérifier que le régime GTM se situe près de la transition.
- **C8 [SPÉC, hors LLM] Mémoire comme cache thermodynamique.** Li & van Rossum (2020) : poids transitoires bon marché puis consolidation au seuil. Transposition : le tampon β (DR-1) est une mémoire *réversible* (sans effacement) et seul le DE paie Landauer. Prédiction : B_eff est nul pendant l'éveil et concentré dans les DE ; test : H1 avec journalisation éveil/rêve.

## 10. Recommandation

**Prêt à préenregistrer (coût faible, Mac M1, ≤ 3 semaines)** : H5 (ε = température effective ; prolonge E1b et l'ERRATUM du 24/10 — résultat propre à kiki-flow, publiable seul), H1 (bits effacés : pure instrumentation dans le run registry), H7 (joules mesurés BSK vs dense : décisif pour la question (c), quelle que soit l'issue), H3/H9 ensemble dans un substrat Boltzmann (thrml ; répond à la question (b) sans LLM).
**Spéculatif, à garder en « Perspectives »** : DR-0 en joules, FEP thermodynamique, matériel thermodynamique (aucun silicium mesuré par un tiers), bornes de Lahiri sur le GTM (H6/C5 : intéressant mais nécessite d'abord une définition de « puissance » du transducteur acceptée par un critique).
**Ne pas faire** : écrire des joules dans un axiome ; citer les ratios Extropic/Normal/Loihi sans la baseline ; présenter le fire rate comme énergie ; relire SHY comme « économie d'énergie » mesurée.
**Positionnement éditorial** : une annexe « lecture thermodynamique » dans Paper 1 (DR-0 ↔ Landauer comme *instanciation* bornant par le bas, plus le terme de trafic de C4), une section dans le papier kiki-flow (JKO ↔ Fokker-Planck ↔ chaleur, H5), et une note de mesure (H7) publiée avec le jeu de données de joules — trou identifié sur HF. Les résultats 2026 (Driessen ; Kodama ; Chen & Limmer ; Whitelam ; Saunders) donnent un *related work* dense et vérifié ; aucun travail trouvé ne fait ce que GENIAL + thermodynamique ferait : une comptabilité d'effacement/trafic par épisode de consolidation, exécutable sur substrats hétérogènes.
**Arrêt** : critères R1–R9 ; si H5 et H7 ne livrent ni résultat positif ni réfutation nette, l'axe se replie en annexe.

Fichiers bruts : `scratchpad/research/r9-raw/` (XML arXiv, scripts de parsing).
