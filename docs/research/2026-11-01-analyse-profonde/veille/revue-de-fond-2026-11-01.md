# Revue de littérature de fond par axe — Hypneum Lab (2026-11-01)

Portée : revue de fond toutes années (fondateurs 1950–2015, consolidation 2016–2024,
frontière 2025–2026) sur les axes R1–R11, en complément de la recherche par thèse
(autre agent) et de la veille Rome du 01/11 (`veille/rome-2026-11-01.md`, non refaite :
ses identifiants sont exclus d'ici, seulement renvoyés).

## En-tête — méthode et comptes

**Corpus du labo lu.** Résumés et sections de positionnement de : dream-of-kiki Paper 1
(`full-draft.tex` §1–3), nerve-wml Paper 1 (abstract + Related Work), kiki-flow-research
(abstract + §2), bouba_sens (abstract + Related work), rescience-nh01 (§1), micro-kiki
Paper A v2, baby-brain (brouillon ontogénétique), paper-methodo-2026 (squelette).
Les 12 `.bib` des dépôts (3 419 lignes) ont été extraits pour la déduplication ;
chaque entrée ci-dessous marquée **[cité]** figure déjà dans au moins un `.bib`,
toutes les autres sont **absentes de tous les `.bib`** (vérifié par grep auteur+titre).

**Découverte.**
1. Liste de candidats par axe (connaissance du domaine) : 208 titres.
2. Requêtes arXiv API 2025-01-01→2026-11-01, 36 requêtes (`abs:` par axe : sleep+replay+
   catastrophic forgetting ; Hebbian unlearning ; dreaming+associative memory ; emergent
   communication+modules ; centered kernel alignment+bias ; representational alignment+null ;
   global workspace ; JKO+neural ; Wasserstein gradient flow+splitting ; entropic JKO ;
   cross-diffusion+Wasserstein ; …) : 64 résultats exploitables, puis **HTTP 429** à
   partir de la 15e requête (R4–R11 non couverts par l'API arXiv).
3. Relais Exa (moteur) pour R1, R4, R6, R7, R9, R11 : 8 requêtes, ≈ 60 résultats ;
   chaque piste a ensuite été résolue par identifiant.

**Résolution (aucun identifiant cité sans record).**
- OpenAlex recherche par titre (similarité ≥ 0,85 + premier auteur) : 96 records, puis
  quota journalier OpenAlex épuisé (429, budget IP partagé).
- Crossref `query.bibliographic` + auteur : 91 records supplémentaires.
- Semantic Scholar batch (`s2.py lookup`, 2 appels, 86 ids arXiv/DOI) : 82 records
  conformes, **4 identifiants proposés de mémoire rejetés** (le record renvoyé ne
  correspondait pas au titre attendu — exemple concret de la règle « jamais un id de mémoire »).

**Comptes.** brut ≈ 330 (208 candidats + 64 arXiv + ≈ 60 Exa, recouvrements inclus)
→ **vérifiés ≈ 255 uniques** (187 OpenAlex/Crossref + 82 S2 + 2 Crossref ponctuels, moins les
doublons ; record API dont titre et premier auteur concordent) → **gardés 246 lignes de
référence** ci-dessous (R1 27, R2 29, R3 29, R4 29, R5 20, R6 27, R7 20, R8 5, R9 25, R10 5,
R11 30 ; hors lignes « [cités] » et renvois), après retrait des hors-sujet et des 12 items de
la veille Rome → **5 non vérifiés** (section finale). La cible 10–20 par axe est dépassée sur
sept axes : les fondateurs sont gardés pour que la section « ce qu'il rate » soit vérifiable ;
la sélection courte est la table des 15 priorités.

**Complément du 01/11 au soir (consigne du PI).** OpenReview ICLR 2027 : 556 lignes brutes, 523 uniques, 31 gardées. NeurIPS 2026 conférence principale : 0 (non indexée par la recherche) ; ateliers : 622 uniques, 11 gardés. Zenodo : 156 uniques, 17 gardés. OSF : 287, 8 gardés, 0 préregistration concurrente sur Hopfield, communication émergente ou consolidation. Textes intégraux lus : 14, dont 11 des 15 lignes prioritaires ; 8 restent [résumé seul].

**Statut des résumés d'une ligne.** Pour les travaux ≤ 2024, la ligne « ce qu'elle établit »
est rédigée depuis la connaissance du domaine et contrôlée contre le titre, l'année et la
revue résolus ; le texte intégral n'a pas été relu ici, sauf pour les 14 travaux de la section « Lecture intégrale » (complément du 01/11 au soir). Pour 2025–2026, la ligne vient du
résumé renvoyé par l'API arXiv ou par Exa (marqué [résumé]). Les DOI préprints (PsyArXiv,
OSF) renvoyés par Crossref ont été remplacés par le DOI de la version publiée chaque fois
que celle-ci a été résolue par S2.

Légende : **F** fondateur · **C** consolidation · **Fr** frontière · [cité] déjà dans un `.bib`.

## R1 — Sommeil, replay, Hopfield rêveur, unlearning

Papiers cibles : dream-of-kiki P1/P2, rescience-nh01 (NH-01), baby-brain (claim C).

**Fondateurs**
- F · Gardner 1988, *J. Phys. A* 21:257 — DOI:10.1088/0305-4470/21/1/030 — volume de l'espace des couplages : capacité maximale α = 2 pour des motifs non biaisés, borne de toute règle d'apprentissage. **Nommée (« Gardner's bound ») dans rescience-nh01 l. 38 sans citation.**
- F · van Hemmen, Ioffe, Kühn, Vaas 1990, *Physica A* 163:386 — DOI:10.1016/0378-4371(90)90345-s — analyse de l'unlearning de Hopfield–Feinstein–Palmer : gain d'efficacité, puis dégradation si l'on « désapprend » trop longtemps (optimum fini en nombre d'itérations).
- F · Dotsenko, Yarunin, Dorotheyev 1991, *J. Phys. A* 24:2419 — DOI:10.1088/0305-4470/24/10/026 — mécanique statistique de réseaux de Hopfield à interactions modifiées par unlearning ; précurseur analytique direct du noyau de Fachechi et al.
- F · Plakhov & Semenov 1992, *RNNS/IEEE* — DOI:10.1109/rnns.1992.268563 — procédure d'unlearning modifiée dont la limite est la règle projecteur : antériorité du résultat « t → ∞ donne Kanter–Sompolinsky ».
- F · Wilson & McNaughton 1994, *Science* 265:676 — DOI:10.1126/science.8036517 — réactivation des ensembles hippocampiques de l'éveil pendant le sommeil lent : base empirique de l'opération replay.
- F · Robins 1995, *Connection Science* 7:123 — DOI:10.1080/09540099550039318 — pseudo-rehearsal : rejouer des items générés par le réseau lui-même protège de l'oubli ; ancêtre du generative replay (Shin 2017 [cité]).
- F · Hinton, Dayan, Frey, Neal 1995, *Science* 268:1158 — DOI:10.1126/science.7761831 — algorithme wake-sleep : phase de « rêve » générative qui entraîne le modèle de reconnaissance.
- F · Ji & Wilson 2007, *Nat. Neurosci.* 10:100 — DOI:10.1038/nn1825 — replay coordonné hippocampe–cortex visuel pendant le sommeil : le replay est systémique, pas local.
- F · Hopfield, Feinstein, Palmer 1983 ; Crick & Mitchison 1983 ; McClelland et al. 1995 [cités].

**Consolidation**
- C · Lewis & Durrant 2011, *TiCS* 15:343 — DOI:10.1016/j.tics.2011.06.004 — le replay de souvenirs chevauchants extrait des schémas : version cognitive de « restructure ».
- C · Lewis, Knoblich, Poe 2018, *TiCS* 22:491 — DOI:10.1016/j.tics.2018.03.009 — modèle NREM (abstraction) / REM (association lointaine) de la créativité : appui empirique plus précis que Hobson/Solms pour l'opération « recombine ».
- C · Krotov & Hopfield 2016, NeurIPS — arXiv:1606.01164 — mémoires associatives denses, capacité super-linéaire.
- C · Ramsauer et al. 2020 — arXiv:2008.02217 — Hopfield moderne continu ≡ attention.
- C · Benedetti, Ventura, Marinari, Ruocco, Zamponi 2022, *J. Chem. Phys.* 156:104107 — DOI:10.1063/5.0084219 — l'unlearning hebbien non supervisé approche le rappel optimal du perceptron supervisé : concurrent direct du noyau de rêve (le labo cite seulement leur travail de 2024). [texte intégral lu : optimum intérieur D_top en nombre de rêves, Fig. 3, éq. 10–12 ; α_c^HU = 0,589]
- C · González, Sokolov, Krishnan, Delanois, Bazhenov 2020, *eLife* 9:e51005 — DOI:10.7554/elife.51005 — modèle thalamocortical : le replay spontané du sommeil protège les anciennes mémoires de l'interférence.
- C · Tadros, Krishnan, Ramyaa, Bazhenov 2022, *Nat. Commun.* 13:7742 — DOI:10.1038/s41467-022-34938-7 — phase de « sommeil » non supervisée (SRC) dans un ANN réduit l'oubli catastrophique.
- C · Golden, Delanois, Sanda, Bazhenov 2022, *PLoS Comput. Biol.* 18:e1010628 — DOI:10.1371/journal.pcbi.1010628 — le sommeil forme une représentation synaptique jointe des tâches dans un SNN.
- C · Hayes, Krishnan, Bazhenov, Siegelmann, Sejnowski, Kanan 2021, *Neural Comput.* 33:2908 — DOI:10.1162/neco_a_01433 — revue du replay en deep learning et des éléments biologiques manquants.
- C · Hoel 2021, *Patterns* 2:100244 — DOI:10.1016/j.patter.2021.100244 — « overfitted brain » : le rêve comme bruit/augmentation contre le sur-apprentissage.
- C · Deperrois, Petrovici, Senn, Jordan 2022, *eLife* 11:e76384 — DOI:10.7554/elife.76384 — rêves perturbés (NREM) et adversariaux (REM) entraînent des représentations corticales : cadre multi-opérations NREM/REM antérieur à dream-of-kiki.
- C · Singh, Norman, Schapiro 2022, *PNAS* 119:e2123432119 — DOI:10.1073/pnas.2123432119 — alternance NREM/REM autonome hippocampe–néocortex. **Correspond à l'entrée « Anonymous 2022, Hippocampus-cortex autonomous interaction » du `.bib` dream-of-kiki P1 : à remplacer.**
- C · van de Ven, Tuytelaars, Tolias 2022, *Nat. Mach. Intell.* 4:1185 — DOI:10.1038/s42256-022-00568-3 — trois scénarios d'apprentissage incrémental ; PermutedMNIST est du domain-IL, où le replay est le moins discriminant.
- C · Kudithipudi et al. 2022, *Nat. Mach. Intell.* 4:196 — DOI:10.1038/s42256-022-00452-0 — fondements biologiques de l'apprentissage continu (replay, métaplasticité, neuromodulation).

**Frontière**
- Fr · Marinari et al. 2026 — arXiv:2603.09384 — le rêve améliore la mémorisation d'un Hopfield à synapses bornées (clippées), optimum sur une large région de paramètres [résumé].
- Fr · Behera et al. 2025, *PRX Life* — DOI:10.1103/vkt6-bltp — états stationnaires d'une dynamique hors équilibre ≈ effet de l'unlearning, sans modifier les couplages [résumé].
- Fr · (anon. dans S2) 2025, *PRL* — arXiv:2510.17593 — avec une règle inférée de données neurobiologiques, les recouvrements parasites augmentent la capacité par parcimonie [résumé].
- Fr · Fountas et al. 2026 — arXiv:2603.04688 — « predictive forgetting » : pourquoi consolider, en termes de généralisation optimale [résumé].
- Fr · Kubo et al. 2025 — arXiv:2508.14081 — rehearsal type sommeil dans l'Equilibrium Propagation [résumé].
- Renvoi veille Rome : arXiv:2605.13721 (Barra, rêve multidirectionnel), arXiv:2605.10304 (recuit partiel), DOI:10.1016/j.neunet.2024.106389 (rêve = ridge + early stopping).

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** Le labo cite bien la neuroscience
du sommeil (Walker, Stickgold, Diekelmann & Born, Tononi, Klinzing, Rasch) et la lignée
romaine Hopfield → Fachechi → Benedetti 2024 → Serricchio. Il rate l'**étage statistique
1990–1992** : van Hemmen 1990, Dotsenko 1991 et Plakhov & Semenov 1992 ont déjà montré
qu'un unlearning prolongé tend vers la règle projecteur et qu'il existe un optimum fini ; le
« t* fini » et la « limite projecteur » de NH-01 doivent être présentés comme des
réplications de ces résultats, pas comme des observations nouvelles. La borne de Gardner est
invoquée sans référence. Benedetti 2022 (unlearning ≈ perceptron optimal) est le contrôle
naturel « à budget égal » que la veille Rome demandait. Côté apprentissage continu, les
modèles computationnels du sommeil du groupe Bazhenov (González 2020, Tadros 2022, Golden
2022) et deux cadres multi-opérations NREM/REM (Deperrois 2022, Singh 2022) **contredisent
l'affirmation de dream-of-kiki §2.2/§3.5 « aucun travail ne compose les piliers »** : elle doit
être restreinte à « aucune formalisation algébrique / axiomatique de la composition ».
Hygiène : environ 20 entrées « Anonymous » dans le `.bib` de dream-of-kiki P1 ; au moins une
(Singh 2022) est identifiée ici. Le labo est devancé par Marinari 2026 et Behera 2025 sur
« ce que fait le rêve dans un Hopfield réaliste », et par la veille Rome (Barra 2026).

## R2 — Communication inter-modules, langage émergent, PRH, CKA/CKNNA

Papiers cibles : nerve-wml P1 (Related Work, §info-tx), dream-of-kiki P1 §7.4, bouba_sens (B-3).

**Fondateurs**
- F · Baars 1988, *A Cognitive Theory of Consciousness* (CUP) — OpenAlex W1511715654 — espace de travail global : modules spécialisés + diffusion d'un contenu unique ; ancêtre conceptuel d'un « protocole nerveux » entre modules.
- F · Brighton & Kirby 2006, *Artificial Life* 12:229 — DOI:10.1162/artl.2006.12.2.229 — similarité topographique comme mesure de compositionnalité d'un langage émergent (métrique standard reprise ensuite).
- F · Kriegeskorte, Mur, Bandettini 2008, *Front. Syst. Neurosci.* 2:4 — DOI:10.3389/neuro.06.004.2008 — analyse de similarité représentationnelle (RDM) ; base de toute comparaison inter-substrats.
- F · Li, Yosinski, Clune, Lipson, Hopcroft 2015 — arXiv:1511.07543 — « convergent learning » : des réseaux entraînés indépendamment partagent une partie des unités, à permutation près.
- F · Lenc & Vedaldi 2015, CVPR — DOI:10.1109/cvpr.2015.7298701 — équivalence de représentations par couches d'assemblage apprises : ancêtre du model stitching et des transducteurs de nerve-wml.
- F · Foerster, Assael, de Freitas, Whiteson 2016 — arXiv:1605.06676 — communication différentiable entre agents (DIAL) : message appris de bout en bout.
- F · Sukhbaatar, Szlam, Fergus 2016 — arXiv:1605.07736 — CommNet : canal continu partagé entre modules appris par rétropropagation.
- F · Lazaridou, Peysakhovich, Baroni 2017 (ICLR) — arXiv:1612.07182 — jeux référentiels : un vocabulaire discret émerge entre deux réseaux.
- F · Raghu, Gilmer, Yosinski, Sohl-Dickstein 2017 — arXiv:1706.05806 — SVCCA ; Kornblith 2019, Morcos 2018, Moschella 2023, Huh 2024 [cités].

**Consolidation**
- C · Andreas, Rohrbach, Darrell, Klein 2016, CVPR — DOI:10.1109/cvpr.2016.12 — réseaux de modules neuronaux composés dynamiquement.
- C · Havrylov & Titov 2017, NeurIPS — arXiv:1705.11192 — séquences de symboles discrets émergentes (Gumbel-softmax / REINFORCE) entre agents.
- C · Kottur, Moura, Lee, Batra 2017, EMNLP — DOI:10.18653/v1/d17-1321 — un langage efficace n'émerge pas « naturellement » compositionnel ; il faut des contraintes de canal.
- C · Mordatch & Abbeel 2018, AAAI — DOI:10.1609/aaai.v32i1.11492 — langage compositionnel ancré dans des populations multi-agents.
- C · Lowe, Foerster, Boureau, Pineau, Dauphin 2019, AAMAS — arXiv:1903.05168 — pièges de mesure de la communication émergente : une information mutuelle élevée entre messages n'implique pas un usage du canal ; propose des tests causaux.
- C · Chaabouni, Kharitonov, Bouchacourt, Dupoux, Baroni 2020, ACL — DOI:10.18653/v1/2020.acl-main.407 — compositionnalité et généralisation dissociées dans les langages émergents.
- C · Lazaridou & Baroni 2020 — arXiv:2006.02419 — revue de la communication multi-agents émergente.
- C · Goyal et al. 2021 (ICLR 2022) — arXiv:2103.01197 — coordination de modules neuronaux par un espace de travail global partagé à capacité limitée.
- C · VanRullen & Kanai 2021, *Trends Neurosci.* 44:692 — DOI:10.1016/j.tins.2021.04.005 — global workspace profond : espace latent partagé + traducteurs entre modules spécialisés (même architecture que WML + transducteurs).
- C · Bansal, Nakkiran, Barak 2021, NeurIPS — arXiv:2106.07682 — model stitching revisité pour comparer des représentations.
- C · Ding, Denain, Steinhardt 2021, NeurIPS — OpenAlex W3214698142 — tester les mesures de similarité (CKA, CCA) par leur sensibilité/spécificité fonctionnelle : CKA rate des différences fonctionnelles.
- C · Williams, Kunz, Kornblith, Linderman 2021, NeurIPS — arXiv:2110.14739 — métriques de forme généralisées (vraies distances) sur représentations neuronales.
- C · Davari et al. 2022 (ICLR 2023) — arXiv:2210.16156 — fiabilité de CKA : manipulable sans changer la fonction, sensible aux points aberrants.
- C · Murphy, Zylberberg, Fyshe 2024 — arXiv:2405.01012 — biais de CKA à petit nombre d'échantillons / grande dimension et estimateur débiaisé.
- C · Sucholutsky et al. 2023 — arXiv:2310.13018 — cadre commun de l'alignement représentationnel.
- C · Klabunde, Schumacher, Strohmaier, Lemmerich 2025, *ACM Comput. Surv.* — DOI:10.1145/3728458 — panorama des mesures fonctionnelles et représentationnelles.

**Frontière**
- Fr · Chun et al. 2025 (CCN) — arXiv:2502.15104 — estimer l'alignement depuis des entrées et des unités sous-échantillonnées ; correction du biais [résumé].
- Fr · Kang et al. 2025 (NeurIPS) — arXiv:2502.19648 — analyse spectrale de la similarité avec peu de neurones : biais systématique de CKA/RSA à N petit [résumé].
- Fr · Ziyin et al. 2025 (NeurIPS) — arXiv:2505.12387 — forces entropiques de SGD : explication et « preuve » de la PRH par équipartition [résumé].
- Fr · Ochiai et al. 2026 — arXiv:2605.11695 — communication émergente entre agents visuels hétérogènes par apprentissage décentralisé [résumé].
- Fr · Kanai et al. 2026 — arXiv:2608.15926 — formulation de la théorie du workspace global en contrôle optimal [résumé].

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** nerve-wml couvre bien la ligne
« convergence des représentations » récente (PRH et ses six critiques 2026) mais ignore
presque toute la **littérature du langage émergent** (Foerster, Sukhbaatar, Lazaridou, Havrylov,
Kottur, Chaabouni) : or « des modules hétérogènes échangent des symboles d'un alphabet appris de
64 codes » est exactement leur objet depuis 2016. Surtout, **Lowe et al. 2019** montre qu'un
rapport MI/H élevé entre codes émis ne prouve pas que l'information est utilisée : la mesure
centrale de nerve-wml (MI/H = 0,91–0,96) doit être accompagnée d'un test causal (intervention sur
le canal), sinon elle est attaquable. Sur la mesure, les biais de CKA à petit échantillon
(Davari 2022, Murphy 2024, Kang 2025, Chun 2025) et le test fonctionnel de Ding 2021 manquent ;
ils fournissent les nuls calibrés et les corrections que l'« écart CKA de 4,3 pp » exige.
Côté architecture, Goyal 2021 et VanRullen & Kanai 2021 sont des antériorités directes
(modules + espace partagé + traducteurs appris). **Erreur d'attribution** : le `.bib` de nerve-wml
attribue « Universality of representation in biological and artificial neural networks » (2024)
à Saxe ; Crossref donne Hosseini, Casto, Zaslavsky, Conwell et al., bioRxiv
DOI:10.1101/2024.12.26.629294. Ziyin 2025 devance le labo sur l'explication théorique de la PRH.

## R3 — Wasserstein, JKO, Sinkhorn, splitting, flots de gradient en ML

Papiers cibles : kiki-flow-research (§2, §3 Model, campagne Lie/Strang), M5.

**Fondateurs**
- F · Turing 1952, *Phil. Trans. R. Soc. B* 237:37 — DOI:10.1098/rstb.1952.0012 — instabilité de diffusion : origine du « terme de Turing » de kiki-flow, nommé §2 sans citation.
- F · Strang 1968, *SIAM J. Numer. Anal.* 5:506 — DOI:10.1137/0705041 — splitting symétrique d'ordre 2 (Strang) vs Lie d'ordre 1 : la référence de la campagne confirmatoire Lie/Strang.
- F · Benamou & Brenier 2000, *Numer. Math.* 84:375 — DOI:10.1007/s002110050002 — formulation dynamique (fluide) du transport optimal.
- F · Otto 2001, *Comm. PDE* 26:101 — DOI:10.1081/pde-100002243 — calcul d'Otto : géométrie riemannienne formelle de W2, équations dissipatives comme flots de gradient.
- F · McLachlan & Quispel 2002, *Acta Numerica* 11:341 — DOI:10.1017/s0962492902000053 — revue des méthodes de splitting (ordres, composition, erreurs de commutateur).
- F · Ambrosio, Gigli, Savaré 2005/2008, Birkhäuser — DOI:10.1007/978-3-7643-8722-8 — théorie rigoureuse des flots de gradient dans les espaces métriques et de probabilités (EVI, λ-convexité).
- F · Cuturi 2013, NeurIPS — OpenAlex W2158131535 — régularisation entropique et Sinkhorn pour le transport à grande échelle.
- F · Jordan, Kinderlehrer, Otto 1998 ; Peyré 2015 ; Feydy 2019 [cités].

**Consolidation**
- C · Di Francesco & Fagioli 2013, *Nonlinearity* 26:2777 — DOI:10.1088/0951-7715/26/10/2777 — systèmes à deux espèces à interactions non locales comme flots de gradient W2 (produit) : cadre direct d'un modèle multi-espèces.
- C · Jüngel 2015, *Nonlinearity* 28:1963 — DOI:10.1088/0951-7715/28/6/1963 — méthode « boundedness-by-entropy » pour les systèmes de diffusion croisée (existence, structure entropique).
- C · Santambrogio 2015, *Optimal Transport for Applied Mathematicians* — DOI:10.1007/978-3-319-20828-2 ; et Santambrogio 2017, *Bull. Math. Sci.* 7:87 — DOI:10.1007/s13373-017-0101-1 — panorama euclidien/métrique/Wasserstein des flots de gradient.
- C · Carlier, Duval, Peyré, Schmitzer 2017, *SIAM J. Math. Anal.* 49:1385 — DOI:10.1137/15m1050264 — convergence des schémas entropiques (Γ-convergence) pour le transport et les flots de gradient : résultat original dont Baradat 2025–26 [cités] sont les raffinements.
- C · Benamou, Carlier, Laborde 2016, *ESAIM Proc.* 54:1 — DOI:10.1051/proc/201654001 — lagrangien augmenté pour JKO.
- C · Laborde 2017, dans *Topological Optimization and Optimal Transport* (De Gruyter) — DOI:10.1515/9783110430417-013 — systèmes non linéaires qui sont des **perturbations non-gradient** de flots W2 : le cadre exact de la décomposition J = J^sym + J^asym de kiki-flow (JKO sur J^sym + dérive non conservative).
- C · Kondratyev, Monsaingeon, Vorotnikov 2016, *Adv. Differential Equations* — DOI:10.57262/ade/1476369298 — distance de transport sur mesures de masse variable (Wasserstein–Fisher–Rao).
- C · Chizat, Peyré, Schmitzer, Vialard 2018, *Found. Comput. Math.* — DOI:10.1007/s10208-016-9331-y — distance interpolant OT et Fisher–Rao (transport déséquilibré).
- C · Liero, Mielke, Savaré 2016/2018 — DOI:10.34657/2952 (prépublication WIAS résolue) — problèmes entropie-transport et distance de Hellinger–Kantorovich.
- C · Liu & Wang 2016, NeurIPS — arXiv:1608.04471 — SVGD : particules suivant un flot de gradient du KL (géométrie de Stein).
- C · Chizat & Bach 2018, NeurIPS — arXiv:1805.09545 — convergence globale des réseaux surparamétrés via flot de gradient W2 sur les paramètres (pendant de Mei 2018 [cité]).
- C · Salim, Korba, Luise 2020, NeurIPS — arXiv:2002.03035 — algorithme de gradient proximal de Wasserstein : **splitting forward-backward dans W2** avec taux, le parent direct d'un « JKO + splitting ».
- C · Mokrov et al. 2021, NeurIPS — arXiv:2106.00736 — flots de gradient W2 à grande échelle par ICNN.
- C · Alvarez-Melis, Schiff, Mroueh 2021 — arXiv:2106.00774 — optimiser des fonctionnelles sur les probabilités avec ICNN (JKO neuronal).
- C · Rotskoff & Vanden-Eijnden 2022, *CPAM* 75:1889 — DOI:10.1002/cpa.22074 — réseaux comme systèmes de particules en interaction, flot de gradient de champ moyen.
- C · Carrillo, Craig, Wang, Wei 2022, *Found. Comput. Math.* 22:389 — DOI:10.1007/s10208-021-09503-1 — méthodes primales-duales pour flots de gradient W2.
- C · Peyré & Cuturi 2019, *Computational Optimal Transport* — DOI:10.1561/9781680835519.

**Frontière**
- Fr · Persiianov et al. 2025 — arXiv:2506.01502 — dynamique de population : optimisation inverse et JKO [résumé].
- Fr · Lee et al. 2026 — arXiv:2603.23901 — schémas JKO cinétiques profonds pour Vlasov–Fokker–Planck [résumé].
- Fr · Tan et al. 2026 — arXiv:2604.16052 — cadre géométrique de Wasserstein pour la plasticité hebbienne [résumé] (pont R1–R3).
- Fr · Pacelli et al. 2026 — arXiv:2606.25265 — inférence variationnelle par descente de transport entropique [résumé].
- Fr · Seo et al. 2026 — arXiv:2610.07602 — JKO neuronal pour flots de Hellinger–Kantorovich [résumé].
- Fr · Duan et al. 2026 — arXiv:2610.10278 — échantillonnage neuronal par JKO Wasserstein–Fisher–Rao [résumé].

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** kiki-flow cite très bien la
frontière entropique (Baradat 2025–26, Mordant 2026, Caucheteux, W-Flow, JKO-RAG). Il rate
les **fondations qui portent ses propres choix** : Carlier et al. 2017 pour la convergence
des schémas entropiques ; Strang 1968 et McLachlan & Quispel 2002 alors que le labo vient de
mener une campagne confirmatoire « Lie/Strang » ; Salim et al. 2020, qui donne justement la
théorie d'un pas proximal W2 composé avec un pas explicite ; Laborde 2017 et Di Francesco &
Fagioli 2013, qui traitent des systèmes multi-espèces dont la partie antisymétrique n'est pas un
gradient — le titre « Wasserstein Gradient Flow Perspective » est **trop fort** pour une dynamique
qui contient une dérive non conservative (§3, 31 % de la norme de J) : écrire « perturbation
non-gradient d'un flot W2 (Laborde 2017) ». Le terme de Turing n'est pas référencé.
L'affirmation §2 « aucune lecture Wasserstein de la production du langage » reste plausible
(rien trouvé), mais les JKO neuronaux 2025–26 (Persiianov, Seo, Duan) devancent le « Track 3 »
de distillation.

## R4 — Plasticité cross-modale, bouba/kiki, cécité congénitale vs tardive, Studyforrest

Papiers cibles : bouba_sens (B-1, B-3, Related work, ponts Studyforrest).

**Fondateurs**
- F · Bach-y-Rita et al. 1969, *Nature* 221:963 — DOI:10.1038/221963a0 — substitution sensorielle visuo-tactile : le cerveau adulte exploite un canal de remplacement.
- F · Meijer 1992, *IEEE Trans. Biomed. Eng.* 39:112 — DOI:10.1109/10.121642 — système vOICe image→son, utilisé par Amedi 2007 [cité].
- F · Sadato et al. 1996, *Nature* 380:526 — DOI:10.1038/380526a0 — le cortex visuel primaire s'active pendant la lecture Braille chez l'aveugle.
- F · Cohen et al. 1997, *Nature* 389:180 — DOI:10.1038/38278 — la TMS occipitale perturbe la lecture Braille chez l'aveugle précoce : rôle **causal** de la réorganisation.
- F · Büchel, Price, Frackowiak, Friston 1998, *Brain* 121:409 — DOI:10.1093/brain/121.3.409 — motifs d'activation occipitale différents chez aveugles tardifs et congénitaux.
- F · Röder et al. 1999, *Nature* 400:162 — DOI:10.1038/22106 — accord spatial auditif amélioré chez l'aveugle (comportement + ERP).
- F · Burton et al. 2002, *J. Neurophysiol.* 87:589 — DOI:10.1152/jn.00285.2001 — aveugles précoces vs tardifs en IRMf de lecture Braille : recrutement occipital plus étendu chez les précoces.
- F · Amedi, Raz, Pianka, Malach, Zohary 2003, *Nat. Neurosci.* 6:758 — DOI:10.1038/nn1072 — l'activation du « cortex visuel » corrèle avec la mémoire verbale supérieure de l'aveugle.
- F · Voss et al. 2004, *Curr. Biol.* 14:1734 — DOI:10.1016/j.cub.2004.09.051 — aveugles précoces **et tardifs** ont des capacités auditives supra-normales en espace lointain : une plasticité tardive existe.
- F · Maurer, Pathman, Mondloch 2006, *Dev. Sci.* 9:316 — DOI:10.1111/j.1467-7687.2006.00495.x — effet bouba/kiki dès 2,5 ans.
- F · Köhler 1947 ; Ramachandran & Hubbard 2001 ; Bavelier & Neville 2002 ; Amedi 2007 ; Merabet & Pascual-Leone 2010 [cités].

**Consolidation**
- C · Lewkowicz & Ghazanfar 2009, *TiCS* 13:470 — DOI:10.1016/j.tics.2009.08.004 — rétrécissement perceptif : l'intégration multisensorielle se construit et se restreint avec l'expérience.
- C · Bedny et al. 2011, *PNAS* 108:4429 — DOI:10.1073/pnas.1014818108 — traitement du langage dans le cortex occipital des aveugles congénitaux.
- C · Collignon et al. 2011, *PNAS* 108:4435 — DOI:10.1073/pnas.1013928108 — spécialisation auditivo-spatiale du cortex occipital de l'aveugle congénital (organisation fonctionnelle préservée).
- C · Striem-Amit, Cohen, Dehaene, Amedi 2012, *Neuron* 76:640 — DOI:10.1016/j.neuron.2012.08.026 — lecture par substitution sonore : la VWFA s'active chez l'aveugle congénital.
- C · Collignon et al. 2013, *Brain* 136:2769 — DOI:10.1093/brain/awt176 — **impact de l'âge d'apparition de la cécité** sur l'organisation et la connectivité occipitales : la comparaison congénital/tardif que B-1 opérationnalise, avec effets graduels.
- C · Hanke et al. 2014, *Sci. Data* 1:140003 — DOI:10.1038/sdata.2014.3 — jeu de données studyforrest d'origine (IRMf 7 T, film audio) ; bouba_sens ne cite que l'extension 2016.
- C · Fryer, Freeman, Pring 2014, *Cognition* 132:164 — DOI:10.1016/j.cognition.2014.03.015 — les aveugles congénitaux montrent un effet bouba/kiki haptique-auditif plus faible : l'expérience visuelle compte. [après lecture de Ćwiek 2022 : évidence mitigée chez l'aveugle précoce, un résultat contraire existe ; ne pas citer seul]
- C · Striem-Amit & Amedi 2014, *Curr. Biol.* 24:687 — DOI:10.1016/j.cub.2014.02.010 — aire extrastriée du corps activée par substitution sensorielle chez l'aveugle congénital.
- C · Bedny 2017, *TiCS* 21:637 — DOI:10.1016/j.tics.2017.06.003 — cortex « cognitivement pluripotent » : argument contre une simple migration sensorielle.
- C · Fort, Lammertink, Peperkamp et al. 2018, *Dev. Sci.* 21:e12659 — DOI:10.1111/desc.12659 — méta-analyse Symbouki : effet de symbolisme sonore faible chez le nourrisson, plus net plus tard.
- C · Sourav, Kekunnaya, Shareef, Banerjee, Bottari, Röder 2019, *Psychol. Sci.* 30:1473 — DOI:10.1177/0956797619866625 — **période sensible prolongée** : association son–forme haptique au hasard après cataracte congénitale ou développementale et chez l'aveugle congénital, intacte chez l'aveugle tardif ; version visuelle réduite, non abolie [texte intégral lu].
- C · Ćwiek et al. 2022, *Phil. Trans. R. Soc. B* 377:20200390 — DOI:10.1098/rstb.2020.0390 — bouba/kiki robuste dans 25 langues et 10 écritures, avec une variation réelle entre langues.
- C · Verhoef, Shahrasbi, Kouwenhoven 2024, CMCL — DOI:10.18653/v1/2024.cmcl-1.17 — modèles vision-langage : associations son–forme faibles ou absentes.
- C · Tseng et al. 2024, SLT — arXiv:2409.12306 — modèles audio-visuels entraînés sur la parole montrent un effet kiki-bouba, les modèles d'événements sonores non.

**Frontière**
- Fr · Granley et al. 2024 — arXiv:2403.12990 — alignement entre réseaux de vision et V1 d'un aveugle implanté [résumé].
- Fr · Kouwenhoven, Shahrasbi, Verhoef 2025 (NeurIPS) — arXiv:2507.10013 — CLIP ne montre pas l'effet de façon robuste [résumé].
- Fr · Vogelsang et al. 2025, *Dev. Sci.* — DOI:10.1111/desc.70099 — réseaux profonds avec plasticité limitée dans le temps : gains modestes, couches basses stabilisées plus tôt [résumé].
- Fr · Cheon et al. 2025, bioRxiv — DOI:10.1101/2025.06.24.661295 — une maturation sensorielle graduelle favorise des représentations abstraites robustes [résumé].
- Fr · Hong et al. 2026 — arXiv:2609.36475 — humains (N = 53, oculométrie) vs VLM : choix alignés dans quelques grands modèles, attention non alignée [résumé].

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** bouba_sens cite Amedi 2007 et
les revues (Bavelier, Merabet, Heimler) mais pas les **comparaisons directes
congénital/tardif** (Büchel 1998, Burton 2002, Voss 2004, Collignon 2013) ni la preuve causale
(Cohen 1997). Collignon 2013 et Voss 2004 montrent des effets graduels et une plasticité tardive
réelle : un « écart T1/T2 » binaire est une simplification qu'il faut annoncer. Plus grave, la
phrase du Related work « Köhler et Ramachandran ont établi ≥ 95 % d'accord interculturel ;
Sidhu & Pexman montrent que l'association est structurelle, **non apprise** » est contredite
par la littérature : Ćwiek 2022 (variation entre langues), Fort 2018 (effet faible chez le
nourrisson), Fryer 2014 (affaibli chez l'aveugle congénital) et surtout **Sourav 2019** (absent
après cataracte congénitale opérée) établissent une composante dépendante de l'expérience avec
période sensible. C'est d'ailleurs un meilleur appui pour l'invariant B-3 que l'argument
« inné ». Studyforrest doit citer Hanke 2014. Côté ML, le labo cite Alper 2023 et Tsai 2026 mais
pas Verhoef 2024 / Kouwenhoven 2025 / Hong 2026, qui rapportent l'**absence** d'effet robuste
dans CLIP. Vogelsang 2025 et Cheon 2025 devancent le labo sur « plasticité limitée dans le
temps dans un réseau profond », c'est-à-dire l'objet de `constellation_lock_after`.

## R5 — Développemental, JEPA, codage prédictif, spiking, harnais ontogénétiques

Papiers cibles : baby-brain (brouillon ontogénétique, claims A–D), nerve-wml (substrat LIF), dream-of-kiki (pilier D).

**Fondateurs**
- F · Elman 1993, *Cognition* 48:71 — DOI:10.1016/0010-0277(93)90058-4 — « starting small » : une mémoire de travail limitée au début facilite l'apprentissage d'une grammaire ; ancêtre direct du claim A (plasticité/capacité gated par stade).
- F · Rohde & Plaut 1999, *Cognition* 72:67 — DOI:10.1016/s0010-0277(99)00031-1 — échec de réplication de « starting small » : sans la restriction initiale l'apprentissage est aussi bon ou meilleur. **Contrôle obligatoire du claim A.**
- F · Maass 1997, *Neural Networks* 10:1659 — DOI:10.1016/s0893-6080(97)00011-7 — réseaux de neurones à impulsions comme « troisième génération », puissance de calcul du codage temporel.
- F · Friston 2005, *Phil. Trans. R. Soc. B* 360:815 — DOI:10.1098/rstb.2005.1622 — théorie des réponses corticales par codage prédictif hiérarchique (bridge Rao & Ballard [cité] → énergie libre).
- F · Smith & Gasser 2005, *Artificial Life* 11:13 — DOI:10.1162/1064546053278973 — six leçons des bébés pour la cognition incarnée (multimodalité, incrémentalité, exploration, langage).
- F · Bengio 2009 ; Oudeyer 2007 ; Hensch 2005 ; Achille 2017 ; Rao & Ballard 1999 ; Bastos 2012 [cités].

**Consolidation**
- C · Lotter, Kreiman, Cox 2016 (ICLR 2017) — arXiv:1605.08104 — PredNet : réseau de codage prédictif profond pour la prédiction vidéo.
- C · Lake, Ullman, Tenenbaum, Gershman 2017, *BBS* 40:e253 — DOI:10.1017/s0140525x16001837 — ingrédients de l'apprentissage humain (physique/psychologie intuitives, compositionnalité) absents des réseaux.
- C · Zenke & Ganguli 2018, *Neural Comput.* 30:1514 — DOI:10.1162/neco_a_01086 — SuperSpike : apprentissage supervisé multicouche en SNN (gradient de substitution, avant Neftci 2019 [cité]).
- C · Ha & Schmidhuber 2018 — DOI:10.5281/zenodo.1207631 — World Models : VAE + RNN + contrôleur entraîné « dans le rêve » du modèle (pont R1–R5).
- C · Bellec et al. 2020, *Nat. Commun.* 11:3625 — DOI:10.1038/s41467-020-17236-y — e-prop : apprentissage local en ligne de SNN récurrents.
- C · Sullivan, Mei, Perfors, Wojcik, Frank 2021, *Open Mind* 5:20 — DOI:10.1162/opmi_a_00039 — SAYCam, corpus audiovisuel longitudinal à la première personne d'enfants (source des travaux Orhan/Vong [cités]).
- C · Zhuang et al. 2021, *PNAS* 118:e2014196118 — DOI:10.1073/pnas.2014196118 — modèles auto-supervisés de la voie ventrale, dont un entraîné sur données type enfant.
- C · Millidge, Seth, Buckley 2021 — arXiv:2107.12979 — revue théorique et expérimentale du codage prédictif.
- C · Piloto, Weinstein, Battaglia, Botvinick 2022, *Nat. Hum. Behav.* 6:1257 — DOI:10.1038/s41562-022-01394-8 — physique intuitive inspirée de la psychologie du développement (paradigme de violation d'attente).
- C · Frank 2023, *TiCS* 27:990 — DOI:10.1016/j.tics.2023.08.007 — écart de données enfants / LLM (4–5 ordres de grandeur).
- C · Warstadt et al. 2023, CoNLL-BabyLM — DOI:10.18653/v1/2023.conll-babylm.1 — résultats du premier défi BabyLM (le labo cite l'appel 2026, pas les résultats).
- C · Salvatori et al. 2023 — arXiv:2308.07870 — intelligence computationnelle inspirée du cerveau par codage prédictif (revue).
- C · Song et al. 2024, *Nat. Neurosci.* 27:348 — DOI:10.1038/s41593-023-01514-1 — « prospective configuration » : inférer l'activité avant la plasticité, alternative à la rétropropagation.
- C · Bardes et al. 2024, *TMLR* — arXiv:2404.08471 — V-JEPA : prédiction de caractéristiques vidéo [cité dans le seul `.bib` workshop de kiki-flow, pas dans baby-brain].

**Frontière**
- Fr · Garrido et al. 2025 — arXiv:2502.11831 — la compréhension de la physique intuitive émerge d'un pré-entraînement auto-supervisé (V-JEPA) sur vidéos naturelles, mesurée par violation d'attente [résumé].
- Fr · Assran et al. 2025 — arXiv:2506.09985 — V-JEPA 2 : compréhension, prédiction et planification [résumé].
- Fr · Vogelsang et al. 2025 et Cheon et al. 2025 (voir R4) — plasticité limitée dans le temps et maturation sensorielle graduelle dans les réseaux profonds.

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** baby-brain cite bien les corpus
égocentriques récents (Orhan, Vong, EgoBabyVLM, Aw 2026) et les périodes critiques (Achille,
Pawlak, Hensch). Il rate le **débat fondateur** de son claim A : Elman 1993 (« starting small »)
et sa non-réplication par Rohde & Plaut 1999 ; tout protocole E1-vs-E0 doit le citer et
inclure le contrôle de Rohde & Plaut (même budget, sans gating). Il rate aussi SAYCam (la source
de ses propres références), Smith & Gasser 2005, Ha & Schmidhuber 2018 (« entraîner dans le
rêve » relie claim C et R1), la physique intuitive développementale (Piloto 2022, Garrido 2025)
et les résultats BabyLM 2023. Côté SNN, SuperSpike et e-prop précèdent Neftci 2019. Le labo est
devancé sur la question « la plasticité limitée dans le temps aide-t-elle ? » par Vogelsang 2025,
qui répond « gains modestes » — un résultat à intégrer avant toute préregistration du claim A.

## R6 — Quantique (VQC, Quantum-PEFT, borne de Holevo en classification) et wetware

Papiers cibles : micro-kiki Paper A v2 (§info-bound, erratum Holevo+Fano), micro-kiki-quantum (archivé).

**Fondateurs**
- F · Helstrom 1969, *J. Stat. Phys.* 1:231 — DOI:10.1007/BF01007479 — théorie quantique de la détection : probabilité maximale de discriminer deux états (borne de Helstrom), la vraie borne d'accuracy en classification à une mesure.
- F · Hausladen & Wootters 1994, *J. Mod. Opt.* 41:2385 — DOI:10.1080/09500349414552221 — « pretty good measurement » pour discriminer K états ; erreur ≤ racine de l'erreur optimale (cas multiclasse).
- F · Gambs 2008 — arXiv:0809.0444 — classification quantique : hiérarchie d'apprentissage, impossibilité d'erreur nulle sur copie unique sauf états orthogonaux, rôle de la PGM.
- F · McClean et al. 2018, *Nat. Commun.* 9:4812 — DOI:10.1038/s41467-018-07090-4 — plateaux stériles des circuits paramétrés aléatoires.
- F · Havlíček et al. 2019, *Nature* 567:209 — DOI:10.1038/s41586-019-0980-2 — classifieurs à espace de caractéristiques quantiques (VQC et noyau).
- F · Schuld & Killoran 2019, *PRL* 122:040504 — DOI:10.1103/physrevlett.122.040504 — l'encodage quantique comme application vers un espace de Hilbert de caractéristiques.
- F · Holevo 1973 ; Fano 1961 ; Nielsen & Chuang 2010 [cités].

**Consolidation**
- C · Schuld, Bocharov, Svore, Wiebe 2020, *PRA* 101:032308 — DOI:10.1103/physreva.101.032308 — classifieurs « circuit-centric ».
- C · Pérez-Salinas et al. 2020, *Quantum* 4:226 — DOI:10.22331/q-2020-02-06-226 — data re-uploading : un qubit suffit pour un classifieur universel si les données sont réinjectées.
- C · Lloyd, Schuld, Ijaz, Izaac, Killoran 2020 — arXiv:2001.03622 — plongements quantiques entraînés pour maximiser la séparation ; mesure de Helstrom/fidélité optimale ensuite.
- C · Schuld, Sweke, Meyer 2021, *PRA* 103:032430 — DOI:10.1103/physreva.103.032430 — l'encodage fixe le spectre de Fourier accessible au modèle (AngleEmbedding RX = séries de Fourier de degré 1 par qubit).
- C · Schuld 2021 — arXiv:2101.11020 — les modèles quantiques supervisés sont des méthodes à noyau.
- C · Cerezo et al. 2021, *Nat. Rev. Phys.* 3:625 — arXiv:2012.09265 — revue des algorithmes variationnels quantiques.
- C · Huang et al. 2021, *Nat. Commun.* 12:2631 — DOI:10.1038/s41467-021-22539-9 — « power of data » : un modèle classique entraîné sur données égale souvent un modèle quantique.
- C · Huang, Kueng, Preskill 2021, *PRL* 126:190505 — DOI:10.1103/physrevlett.126.190505 — bornes informationnelles sur l'avantage quantique en apprentissage.
- C · Banchi, Pereira, Pirandola 2021, *PRX Quantum* 2:040321 — DOI:10.1103/prxquantum.2.040321 — généralisation exprimée par l'information de Holevo entre données et plongement : **le cadre correct pour la borne que micro-kiki a retirée**.
- C · Caro et al. 2023 — arXiv:2311.05529 — bornes de généralisation informationnelles pour données quantiques, classification d'états.
- C · Bowles, Ahmed, Schuld 2024 — arXiv:2403.07059 — benchmark de 12 modèles QML : les baselines classiques gagnent ; retirer l'intrication ne coûte souvent rien.
- C · Chen et al. 2024, NeurIPS — DOI:10.52202/079017-2928 — QuanTA : adaptation tensorielle d'inspiration quantique pour le fine-tuning de LLM.
- C · Koike-Akino et al. 2025, ICLR — arXiv:2503.05431 — Quantum-PEFT : PEFT ultra-paramétrée via unitaires paramétrés (simulés classiquement).
- C · Kagan et al. 2022, *Neuron* 110:3952 — DOI:10.1016/j.neuron.2022.09.001 — neurones in vitro apprenant un jeu (DishBrain) ; Cai et al. 2023, *Nat. Electron.* 6:1032 — DOI:10.1038/s41928-023-01069-w — calcul réservoir sur organoïdes (wetware).

**Frontière**
- Fr · Wang et al. 2025 — arXiv:2503.01545 — limites de l'amplitude encoding : si les états moyens des classes sont proches en distance trace, la perte d'entropie croisée est ≥ ≈ ln K [résumé].
- Fr · Sahebi et al. 2025 — arXiv:2505.15902 — déquantification de QML supervisé (QNN et noyaux) par Random Fourier Features, conditions d'alignement et de concentration [résumé].
- Fr · Fellner et al. 2025, *MLST* — arXiv:2504.12416 — séries temporelles : les modèles quantiques variationnels peinent à égaler des modèles classiques de complexité comparable [résumé].
- Fr · Larocca et al. 2025, *Nat. Rev. Phys.* — DOI:10.1038/s42254-025-00813-9 — revue des plateaux stériles.
- Fr · Cerezo et al. 2025, *Nat. Commun.* — DOI:10.1038/s41467-025-63099-6 — absence prouvable de plateaux stériles ⇒ souvent simulabilité classique.
- Fr · Kakavand et al. 2026 — arXiv:2604.18837 — QSVM vs baselines classiques : 0/29 comparaisons significatives, 970 expériences [résumé].
- Fr · Fulton et al. 2026 — arXiv:2608.07822 — des modèles classiques SU(2) (quaternions) égalent ou dépassent les VQC peu profonds [résumé].

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** micro-kiki Paper A cite la théorie
de l'expressivité et de la généralisation (Abbas, Du, Caro 2022) et Holevo/Fano, mais rate les
**trois bornes qui s'appliquent vraiment** à un classifieur à K = 10 classes sur N = 4 qubits
mesurés en Pauli-Z : Helstrom 1969 (deux classes), la PGM de Hausladen & Wootters 1994
(multiclasse) et l'information de Holevo du plongement (Banchi 2021). L'erratum a raison de dire
que la borne Holevo + Fano « ne mord pas » à N = 4 (log2 16 = 4 bits ≥ log2 10) ; une borne non
triviale s'obtient par discrimination d'états à partir des états moyens de classe (Helstrom/PGM,
Wang 2025), calculable sur le modèle entraîné. Le résultat négatif central (VQC sous la baseline
PCA-4) est **attendu** par Huang 2021 (power of data), Bowles 2024 et Schuld 2021 (spectre de
Fourier d'AngleEmbedding) : il faut le présenter comme réplication dans un nouveau domaine, pas
comme découverte. Le labo n'a aucune référence Quantum-PEFT/QuanTA alors que l'axe est annoncé ;
Kakavand 2026 et Fulton 2026 le devancent sur le benchmark rigoureux « quantique vs classique à
budget égal ».

## R7 — Matière : verres de spin, recuit (partiel), calcul in materio

Papiers cibles : rescience-nh01 (capacité, RS/RSB), axe « matière » de la revue des hypothèses (« sous conditions »).

**Fondateurs**
- F · Edwards & Anderson 1975, *J. Phys. F* 5:965 — DOI:10.1088/0305-4608/5/5/017 — modèle de verre de spin à couplages aléatoires et paramètre d'ordre.
- F · Sherrington & Kirkpatrick 1975, *PRL* 35:1792 — DOI:10.1103/physrevlett.35.1792 — modèle SK soluble en champ moyen ; base de l'analyse d'Amit–Gutfreund–Sompolinsky [cité].
- F · Kirkpatrick, Gelatt, Vecchi 1983, *Science* 220:671 — DOI:10.1126/science.220.4598.671 — recuit simulé : l'optimisation comme refroidissement d'un système désordonné.
- F · Gardner 1988 (voir R1) — capacité maximale par volume d'espace des couplages.
- F · Kadowaki & Nishimori 1998, *PRE* 58:5355 — DOI:10.1103/physreve.58.5355 — recuit quantique dans le modèle d'Ising en champ transverse.

**Consolidation**
- C · Miller, Harding, Tufte 2014, *Evol. Intell.* 7:49 — DOI:10.1007/s12065-014-0106-6 — evolution-in-materio : faire calculer un matériau par configuration évolutive.
- C · Choromanska et al. 2015, AISTATS — arXiv:1412.0233 — paysages de perte des réseaux multicouches rapprochés du verre de spin sphérique p-spin.
- C · Zdeborová & Krzakala 2016, *Adv. Phys.* 65:453 — DOI:10.1080/00018732.2016.1211393 — physique statistique de l'inférence : seuils, transitions, algorithmes.
- C · Baity-Jesi et al. 2019, *J. Stat. Mech.* 124013 — DOI:10.1088/1742-5468/ab3281 — dynamiques d'apprentissage profond vs systèmes vitreux : pas de vieillissement vitreux dans le régime surparamétré.
- C · Yamashiro, Ohkuwa, Nishimori, Lidar 2019, *PRA* 100:052321 — DOI:10.1103/physreva.100.052321 — dynamique du recuit inverse (reverse annealing) pour le p-spin : repartir d'un état et ne recuire que partiellement.
- C · Tanaka et al. 2019, *Neural Networks* 115:100 — DOI:10.1016/j.neunet.2019.03.005 — revue du calcul réservoir physique.
- C · Carleo et al. 2019, *Rev. Mod. Phys.* 91:045002 — DOI:10.1103/revmodphys.91.045002 — apprentissage automatique et sciences physiques.
- C · Chen et al. 2020, *Nature* 577:341 — DOI:10.1038/s41586-019-1901-0 — classification par un réseau désordonné d'atomes dopants dans le silicium (in materio).
- C · Bahri et al. 2020, *Annu. Rev. Condens. Matter Phys.* 11:501 — DOI:10.1146/annurev-conmatphys-031119-050745 — mécanique statistique du deep learning.
- C · Wright et al. 2022, *Nature* 601:549 — DOI:10.1038/s41586-021-04223-6 — réseaux de neurones physiques profonds entraînés par rétropropagation « physics-aware ».
- C · Mohseni, McMahon, Byrnes 2022, *Nat. Rev. Phys.* 4:363 — DOI:10.1038/s42254-022-00440-8 — machines d'Ising comme solveurs matériels.

**Frontière**
- Fr · de Bos & Serra-Garcia 2025, *npj Metamaterials* — arXiv:2502.12020 — réseau d'oscillateurs multimodaux qui apprend une classification par sa seule dynamique [résumé].
- Fr · Caravelli et al. 2025, *Nat. Rev. Phys.* — arXiv:2509.00747 — réseaux memristifs auto-organisés comme systèmes d'apprentissage physique (criticité, champ moyen) [résumé].
- Fr · Zu & Goodrich 2025 — arXiv:2509.01296 — mémoire émergente par entraînement cyclique d'empilements désordonnés [résumé].
- Fr · Greenbaum, Branford, Goodwin 2026 — arXiv:2602.18335 — désordre « réactif » d'un MOF comme réservoir à l'état solide [résumé].
- Fr · Fischer et al. 2026, *IEEE Access* — arXiv:2604.09833 — panorama matériaux / mécanismes / méthodes du calcul neuronal physique [résumé].
- Renvoi veille Rome : arXiv:2605.10304 (recuit partiel, α_c = 1).

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** Le labo n'a sur cet axe que les
références Hopfield de NH-01 (Amit 1985, Kanter 1987, Lucibello 2024) : aucune référence de
verre de spin, de recuit ou de calcul in materio, alors que la revue des hypothèses classe un
axe « matière ». Le minimum pour parler de RS/RSB et de capacité est Edwards–Anderson,
Sherrington–Kirkpatrick et Gardner. Le **recuit inverse** (Yamashiro 2019) est l'analogue
quantique du « recuit partiel » signalé par la veille Rome : ensemble, ils donnent un contrôle
« matière » concret pour NH-01. Sur l'in materio, Chen 2020, Wright 2022 et Caravelli 2025
montrent que l'apprentissage dans un substrat désordonné est déjà démontré expérimentalement :
l'axe Hypneum doit se positionner en suiveur explicite, pas en ouverture.

## R8 — Bioélectricité, cognition basale (3–5 références)

- F · Lyon 2006, *Cogn. Process.* 7:11 — DOI:10.1007/s10339-005-0016-8 — approche « biogénique » de la cognition (cognition comme propriété des organismes, pas seulement des cerveaux).
- F · Levin 2014, *Mol. Biol. Cell* 25:3835 — DOI:10.1091/mbc.e13-12-0708 — potentiels bioélectriques endogènes qui contrôlent la morphogenèse.
- C · Baluška & Levin 2016, *Front. Psychol.* 7:902 — DOI:10.3389/fpsyg.2016.00902 — cognition sans tête à travers les systèmes biologiques.
- C · Levin 2019, *Front. Psychol.* 10:2688 — DOI:10.3389/fpsyg.2019.02688 — « frontière computationnelle d'un soi » portée par la bioélectricité développementale.
- C · Fields & Levin 2022, *Entropy* 24:819 — DOI:10.3390/e24060819 — compétence de navigation dans des espaces arbitraires comme invariant de cognition multi-substrats.

Le labo ne cite rien sur cet axe. Utile seulement comme cadrage de la « substrate-agnosticism »
(DR-3, nerve-wml) : Fields & Levin 2022 propose un invariant comportemental testable, plus
défendable qu'une analogie.

## R9 — Thermodynamique de l'apprentissage, énergie par token

Papiers cibles : kiki-flow (production d'entropie d'un flot JKO, surrogate 0,04 ms), routage micro-kiki, axe « énergie par token ».

**Fondateurs**
- F · Landauer 1961, *IBM J. Res. Dev.* 5:183 — DOI:10.1147/rd.53.0183 — tout effacement irréversible d'un bit coûte au moins kT ln 2.
- F · Bennett 1982, *Int. J. Theor. Phys.* 21:905 — DOI:10.1007/bf02084158 — thermodynamique du calcul : calcul réversible, coût porté par l'effacement.
- F · Levy & Baxter 1996, *Energy Efficient Neural Codes* — DOI:10.7551/mitpress/4924.003.0008 (réédition MIT Press résolue) — codes neuronaux optimisés sous contrainte énergétique (taux de décharge bas).
- F · Laughlin, de Ruyter van Steveninck, Anderson 1998, *Nat. Neurosci.* 1:36 — DOI:10.1038/236 — coût métabolique par bit d'information neuronale.
- F · Attwell & Laughlin 2001, *J. Cereb. Blood Flow Metab.* 21:1133 — DOI:10.1097/00004647-200110000-00001 — budget énergétique de la signalisation dans la substance grise.
- F · Lennie 2003, *Curr. Biol.* 13:493 — DOI:10.1016/s0960-9822(03)00135-0 — coût du calcul cortical : seule une petite fraction des neurones peut être active.

**Consolidation**
- C · Still, Sivak, Bell, Crooks 2012, *PRL* 109:120604 — DOI:10.1103/physrevlett.109.120604 — thermodynamique de la prédiction : la dissipation borne l'information non prédictive retenue.
- C · Bérut et al. 2012, *Nature* 483:187 — DOI:10.1038/nature10872 — vérification expérimentale du principe de Landauer.
- C · Goldt & Seifert 2017, *PRL* 118:010601 — DOI:10.1103/physrevlett.118.010601 — thermodynamique stochastique de l'apprentissage : production d'entropie ≥ information apprise.
- C · Wolpert 2019, *J. Phys. A* 52:193001 — DOI:10.1088/1751-8121/ab0850 — thermodynamique stochastique du calcul (revue).
- C · Strubell, Ganesh, McCallum 2019, ACL — DOI:10.18653/v1/p19-1355 — coût énergétique et carbone de l'entraînement en NLP.
- C · Henderson et al. 2020, *JMLR* — arXiv:2002.05651 — rapport systématique de l'énergie et du carbone (outil experiment-impact-tracker).
- C · Patterson et al. 2021 — arXiv:2104.10350 — émissions de l'entraînement des grands réseaux, effet du matériel et du lieu.
- C · Samsi et al. 2023, HPEC — DOI:10.1109/hpec58863.2023.10363447 — « From words to watts » : énergie d'inférence de LLaMA.
- C · Seroussi, Alemi, Helias, Ringel 2023 — arXiv:2307.14653 — limites de vitesse de l'apprentissage : W2(initial, final)² / production d'entropie.
- C · Luccioni, Jernite, Strubell 2024, FAccT — DOI:10.1145/3630106.3658542 — coût énergétique du déploiement par tâche.

**Frontière**
- Fr · Tkachenko 2025 — arXiv:2503.09980 — coût thermodynamique de l'inférence et de l'apprentissage dans des réseaux physiques : travail ≥ W2² / durée ; l'apprentissage coûte quelques kT par paramètre [résumé].
- Fr · Chung et al. 2025, NeurIPS — arXiv:2505.06371 — ML.ENERGY Benchmark : énergie par token en régime stationnaire, 40 modèles [résumé].
- Fr · Wilhelm et al. 2025, EuroMLSys — arXiv:2603.20224 — plaidoyer pour l'énergie par token comme métrique au côté de l'accuracy [résumé].
- Fr · Caravaca et al. 2025 — arXiv:2511.05597 — 32 500 mesures, 155 architectures, modèle prédictif d'énergie d'inférence [résumé].
- Fr · Niu et al. 2025, AAAI — arXiv:2512.03024 — TokenPowerBench : énergie attribuée au prefill et au decode [résumé].
- Fr · Chung et al. 2026 — arXiv:2601.22076 — « Where do the joules go? » : diagnostic de l'énergie d'inférence [résumé].
- Fr · Okanohara 2026 — arXiv:2601.17607 — théorie thermodynamique de l'apprentissage : limite de vitesse épistémique Σ ≥ W2² [résumé].
- Fr · Fadel Argerich et al. 2026 — arXiv:2604.09048 — Watt Counts : 5 000 expériences, 50 LLM, 10 GPU [résumé].
- Fr · Ziyin et al. 2026 — arXiv:2605.21933 — irréversibilité thermodynamique des algorithmes d'entraînement, principe de dissipation minimale [résumé].

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** Aucune référence de l'axe dans les
`.bib`. Deux manques structurants : (1) la mesure — ML.ENERGY, TokenPowerBench et Watt Counts
fixent les conventions (régime stationnaire, séparation prefill/decode, NVML ± 5 %) ; le labo
mesure sur Apple Silicon, où aucune de ces références ne couvre la méthode : c'est une niche
réelle à condition de citer leurs conventions ; (2) la théorie — Seroussi 2023, Tkachenko 2025
et Okanohara 2026 bornent la production d'entropie de l'apprentissage par une distance W2,
**exactement la quantité qu'un pas JKO minimise** : le lien R3–R9 que kiki-flow pourrait
revendiquer est déjà formulé ailleurs et doit être cité comme tel.

## R10 — Théories de la conscience testables (3–5 références)

- F · Dehaene, Kerszberg, Changeux 1998, *PNAS* 95:14529 — DOI:10.1073/pnas.95.24.14529 — modèle neuronal de l'espace de travail global (ignition).
- F · Tononi 2004, *BMC Neurosci.* 5:42 — DOI:10.1186/1471-2202-5-42 — théorie de l'information intégrée (Φ).
- C · Casali et al. 2013, *Sci. Transl. Med.* 5:198ra105 — DOI:10.1126/scitranslmed.3006294 — indice de complexité perturbationnelle (PCI), mesure empirique indépendante du comportement.
- C · Butlin et al. 2023 — arXiv:2308.08708 — indicateurs de conscience dérivés des théories, appliqués aux systèmes d'IA.
- Fr · Cogitate Consortium 2025, *Nature* — DOI:10.1038/s41586-025-08888-1 — collaboration adversariale GNW vs IIT : prédictions des deux théories partiellement infirmées (protocole préenregistré, Melloni 2023, *PLoS One*, DOI:10.1371/journal.pone.0268577).

Le labo cite Mashour 2020 (GNW), Hobson et Solms. Pour rester « testable seulement », Cogitate
2025 est le modèle méthodologique (préregistration adversariale) le plus proche de la chaîne
de paper-methodo-2026. Voir aussi Phua 2025, arXiv:2512.19155 (tester les théories sur des
IA par ablations) [résumé].

## R11 — Mathématiques structurelles : équivalence (TOST), nuls calibrés, réplication, préregistration computationnelle

Papiers cibles : paper-methodo-2026 (§2 Related work, §3.3 nuls, §4 errata), bouba_sens (B-3 « compatibilité »), rescience-nh01, dream-of-kiki P2 (Bonferroni).

**Fondateurs**
- F · Schuirmann 1987, *J. Pharmacokinet. Biopharm.* 15:657 — DOI:10.1007/bf01068419 — procédure des deux tests unilatéraux (TOST) : conclure à l'équivalence dans une marge ±Δ, au lieu de lire un « non significatif ».
- F · Westfall & Young 1993, *Resampling-Based Multiple Testing* (Wiley) — recension résolue DOI:10.2307/2533464 — max-T par rééchantillonnage : contrôle FWER exact sous dépendance (famille de la statistique « max-then-median » du labo).
- F · Nichols & Holmes 2002, *Hum. Brain Mapp.* 15:1 — DOI:10.1002/hbm.1058 — tests de permutation non paramétriques et distribution du maximum pour la neuro-imagerie.
- F · Ioannidis 2005, *PLoS Med.* 2:e124 — DOI:10.1371/journal.pmed.0020124 — pourquoi la plupart des résultats publiés sont faux (puissance, a priori, flexibilité).
- F · Phipson & Smyth 2010, *Stat. Appl. Genet. Mol. Biol.* 9:39 — DOI:10.2202/1544-6115.1585 — une p-valeur de permutation ne doit jamais valoir zéro : p = (b+1)/(B+1).
- F · Mémoli 2011, *Found. Comput. Math.* 11:417 — DOI:10.1007/s10208-011-9093-5 — distances de Gromov–Wasserstein pour comparer des espaces métriques (comparaison de représentations sans correspondance).
- F · Simmons, Nelson, Simonsohn 2011, *Psychol. Sci.* 22:1359 — DOI:10.1177/0956797611417632 — degrés de liberté du chercheur : tout devient significatif.
- F · Chambers 2013, *Cortex* 49:609 — DOI:10.1016/j.cortex.2012.12.016 — lancement des Registered Reports.

**Consolidation**
- C · Gelman & Loken 2014, *Am. Sci.* 102:460 — DOI:10.1511/2014.111.460 — « jardin des sentiers qui bifurquent » : la flexibilité sans p-hacking conscient suffit.
- C · Open Science Collaboration 2015, *Science* 349:aac4716 — DOI:10.1126/science.aac4716 — 100 réplications en psychologie, effets divisés par deux.
- C · Lakens 2017, *Soc. Psychol. Personal. Sci.* 8:355 — DOI:10.1177/1948550617697177 — introduction pratique des tests d'équivalence (TOST) pour t, corrélations, méta-analyses.
- C · Rougier et al. 2017, *PeerJ Comput. Sci.* 3:e142 — DOI:10.7717/peerj-cs.142 — l'initiative ReScience (réplication computationnelle évaluée).
- C · Nosek, Ebersole, DeHaven, Mellor 2018, *PNAS* 115:2600 — DOI:10.1073/pnas.1708274114 — la révolution de la préregistration (confirmatoire vs exploratoire).
- C · Lakens, Scheel, Isager 2018, *AMPPS* 1:259 — DOI:10.1177/2515245918770963 — tutoriel : choisir la plus petite taille d'effet d'intérêt et la marge d'équivalence.
- C · Lakens et al. 2018/2020 — DOI:10.31234/osf.io/qtzwr — inférences sur les effets nuls : facteurs de Bayes et tests d'équivalence.
- C · Henderson et al. 2018, AAAI — DOI:10.1609/aaai.v32i1.11694 — deep RL qui compte : variance entre graines, protocole de rapport.
- C · Gundersen & Kjensmo 2018, AAAI — DOI:10.1609/aaai.v32i1.11503 — état de la reproductibilité en IA (documentation des méthodes, données, code).
- C · Dodge et al. 2019, EMNLP — DOI:10.18653/v1/d19-1224 — rapporter la performance attendue en fonction du budget de réglage.
- C · Pineau et al. 2021, *JMLR* — arXiv:2003.12206 — programme de reproductibilité NeurIPS 2019 (checklist, challenge).
- C · Bouthillier et al. 2021, MLSys — arXiv:2103.03098 — comptabiliser la variance (graines, données, hyperparamètres) dans les benchmarks ML.
- C · Agarwal et al. 2021, NeurIPS — arXiv:2108.13264 — « bord du précipice statistique » : IQM, intervalles bootstrap stratifiés, peu de graines.
- C · van Miltenburg, van der Lee, Krahmer 2021, NAACL — DOI:10.18653/v1/2021.naacl-main.51 — préregistrer la recherche en NLP.
- C · Chambers & Tzavella 2022, *Nat. Hum. Behav.* 6:29 — DOI:10.1038/s41562-021-01193-7 — passé, présent, futur des Registered Reports.
- C · Kapoor & Narayanan 2023, *Patterns* 4:100804 — DOI:10.1016/j.patter.2023.100804 — fuites et crise de reproductibilité de la science fondée sur le ML.

**Frontière**
- Fr · Semmelrock et al. 2025, *AI Magazine* — DOI:10.1002/aaai.70002 — reproductibilité de la recherche ML : panorama, freins, leviers.
- Fr · Masters, Liu, Albrecht 2026 — arXiv:2605.12131 — « rollout cards » : aucun des 50 dépôts audités ne rapporte runs échoués/ignorés ; la règle de rapport change les scores de 20,9 points [résumé].
- Fr · Gaddipati et al. 2026 — arXiv:2605.16616 — MLReplicate : systèmes de recherche autonomes et reproductibilité ML ; résultats fabriqués détectés par les humains [résumé].
- Fr · Vaccaro 2026 — arXiv:2606.11217 — préregistration pour les expériences avec agents IA (déjà prévu au TODO §2 de paper-methodo, absent de tout `.bib`) [résumé].
- Fr · Thomas et al. 2026 — arXiv:2606.27687 — préenregistrer pour le « prochain LLM » afin d'empêcher le p-hacking par prompt [résumé].
- Fr · Jankowsky et al. 2026, *Nat. Hum. Behav.* — DOI:10.1038/s41562-026-02586-2 — Registered Reports pour la recherche prédictive en ML (fuites, variabilité, split calibration/confirmation) [résumé].

**Ce que le labo cite, ce qu'il rate, ce qui le devance.** Les `.bib` ne contiennent sur cet
axe qu'Efron 1979, Gebru 2021, Vanschoren 2021 et l'OSF : **aucune** référence de test
d'équivalence, de nul par permutation, de préregistration ou de reproductibilité ML, alors
que c'est le cœur du papier méthodologique. Trois corrections de fond : (1) bouba_sens annonce
qu'aucun verdict de « compatibilité » n'est établi pour B-3 — le cadre standard est le TOST
(Schuirmann 1987, Lakens 2017/2018) avec une marge fixée avant les données ; (2) le « nul apparié
par inversion de signe, B = 20 000 » et la statistique « max-then-median » relèvent de
Westfall & Young, Nichols & Holmes et Phipson & Smyth (p = (b+1)/(B+1)) — à citer en §3.3 ;
(3) le Related work de paper-methodo doit au minimum citer Nosek 2018, Chambers 2013/2022,
Rougier 2017, Pineau 2021, Bouthillier 2021 et Kapoor 2023. Le labo est devancé par Vaccaro
2026 (même modèle de menace), Masters 2026 (registre des runs échoués, exactement le « registre
des erreurs » de §4) et Jankowsky 2026 (Registered Reports en ML) : le papier doit se positionner
comme retour d'expérience sur une chaîne exécutable, pas comme proposition de principe.

## 15 références à ajouter en priorité dans les `.bib` du labo

| # | Référence (id vérifié) | Papier → section cible | Pourquoi |
|---|---|---|---|
| 1 | Lowe et al. 2019, arXiv:1903.05168 | nerve-wml P1 → §info-tx + Related Work | MI élevée entre codes ≠ canal utilisé ; exige un test causal pour la claim (B). |
| 2 | Murphy, Zylberberg, Fyshe 2024, arXiv:2405.01012 (+ Davari 2022, arXiv:2210.16156) | nerve-wml P1 → §info-tx (écart CKA 4,3 pp) | Biais de CKA à petit N ; estimateur débiaisé et nul. |
| 3 | Sourav et al. 2019, DOI:10.1177/0956797619866625 | bouba_sens → Related work « Bouba/kiki » | Contredit « non appris » (`main.tex:1110-1114`) : association haptique au hasard chez CC, DC et CB, intacte chez LB ; analogue humain de B-1 [texte intégral]. |
| 4 | Collignon et al. 2013, DOI:10.1093/brain/awt176 | bouba_sens → Related work « congenital vs late », B-1 | Comparaison directe selon l'âge d'apparition ; effets graduels. |
| 5 | Ćwiek et al. 2022, DOI:10.1098/rstb.2020.0390 | bouba_sens → Related work | Remplace le « ≥ 95 % » non sourcé par la vraie évidence interculturelle. |
| 6 | Gardner 1988, DOI:10.1088/0305-4470/21/1/030 | rescience-nh01 → §1 l. 38 | Borne nommée sans citation. |
| 7 | Plakhov & Semenov 1992, DOI:10.1109/rnns.1992.268563 (+ van Hemmen et al. 1990, DOI:10.1016/0378-4371(90)90345-s) | rescience-nh01 → §1 et discussion (limite projecteur, t* fini) | Antériorité de la limite projecteur (`content.tex:14-16`) ; [résumé seul], confirmé de seconde main par Benedetti 2022 §VI. |
| 8 | Benedetti et al. 2022, DOI:10.1063/5.0084219 | rescience-nh01 → discussion ; dream-of-kiki P2 | Optimum intérieur D_top (Fig. 3) : antériorité de t* = 7 (`content.tex:554-556`) ; contrôle à budget égal [texte intégral]. |
| 9 | Deperrois et al. 2022, DOI:10.7554/elife.76384 | dream-of-kiki P1 → §2.2, §3.5 | Cadre NREM/REM multi-opérations antérieur ; restreint la claim de nouveauté. |
| 10 | Singh, Norman, Schapiro 2022, DOI:10.1073/pnas.2123432119 | dream-of-kiki P1 → `.bib` (remplace « Anonymous 2022 ») | Identification d'une entrée anonyme. |
| 11 | Carlier, Duval, Peyré, Schmitzer 2017, DOI:10.1137/15m1050264 | kiki-flow → §2 « JKO scheme » | Convergence originale des schémas entropiques. |
| 12 | Laborde 2017, DOI:10.1515/9783110430417-013 (+ Strang 1968, DOI:10.1137/0705041 ; Salim et al. 2020, arXiv:2002.03035) | kiki-flow → §3 Model (J^asym + splitting) ; amendement Lie/Strang | Cadre des perturbations non-gradient ; théorie du pas proximal composé. |
| 13 | Banchi, Pereira, Pirandola 2021, DOI:10.1103/prxquantum.2.040321 (+ Helstrom 1969, DOI:10.1007/BF01007479) | micro-kiki Paper A → §info-bound (erratum) | La borne non triviale cherchée : information de Holevo du plongement / discrimination d'états. |
| 14 | Rohde & Plaut 1999, DOI:10.1016/s0010-0277(99)00031-1 (+ Elman 1993, DOI:10.1016/0010-0277(93)90058-4) | baby-brain → §1 et §4 (claim A, contrôle E0) | Débat fondateur du gating développemental ; non-réplication. |
| 15 | Lakens 2017, DOI:10.1177/1948550617697177 (+ Phipson & Smyth 2010, DOI:10.2202/1544-6115.1585) | paper-methodo → §3.3 ; bouba_sens → B-3 | TOST pour les verdicts de compatibilité ; p-valeurs de permutation correctes. |

## Points mal positionnés relevés dans les manuscrits

- dream-of-kiki P1 §2.2/§3.5 : « aucun travail ne compose les piliers » — faux au sens large (Deperrois 2022, Singh 2022, Robinson 2022 [cité]) ; vrai seulement pour une formalisation algébrique (`full-draft.tex:227-229`, `:246`, `:368` ; ablations de profils déjà dans Deperrois Fig. 4b et 5 ; ordre dans Singh Fig. 4C contre `:239-240`).
- dream-of-kiki P1 `.bib` : ≈ 20 entrées « Anonymous » (titres sans auteurs), dont une identifiée (Singh 2022).
- nerve-wml P1 `.bib` : « Universality of representation… » attribué à Saxe 2024 ; Crossref donne Hosseini, Casto, Zaslavsky, Conwell et al., DOI:10.1101/2024.12.26.629294.
- bouba_sens Related work : « ≥ 95 % interculturel » et « structurel, non appris » contredits par Ćwiek 2022, Fort 2018, Fryer 2014, Sourav 2019.
- kiki-flow titre et abstract : « Wasserstein gradient flow » pour une dynamique qui contient une dérive antisymétrique non conservative (31 % de la norme de J) ; écrire « perturbation non-gradient d'un flot W2 » (`main.tex:9`, Laborde 2017 éq. 1.1). De plus, ε = 0,01 avec h = 0,05 (`:345`) viole la condition ε|log ε| = O(τ²) de Carlier 2017 Thm 3.16.
- rescience-nh01 §1 : borne de Gardner nommée sans référence ; limite projecteur et optimum fini déjà connus (Plakhov 1992, van Hemmen 1990 ; optimum intérieur explicite chez Benedetti 2022, Fig. 3).
- micro-kiki Paper A : résultat négatif VQC < PCA-4 attendu par Huang 2021, Schuld 2021, Bowles 2024 ; à présenter comme réplication dans un domaine nouveau.

## OpenReview, OSF et Zenodo par axe (complément du 01/11 au soir)

**Méthode.** Script `scratchpad/veille/tools_revue_orz.py` (sortie `revue/orz.tsv`, journal `revue/orz.tsv.log`) et `tools_revue_nips.py` (sortie `revue/nips26.tsv`). Les 38 requêtes de la revue (2 à 4 par axe) ont été lancées contre trois sources :

- **OpenReview api2**, route `/notes/search?term=&group=`.
  - Les routes `/notes?invitation=…` et `/notes?content.venueid=…` renvoient `403 ChallengeRequired` sur `api2` comme sur `api` (échec noté). La route de recherche fonctionne sur les deux.
  - `group=ICLR.cc/2027/Conference` : 15 premiers résultats par requête. Ce sont des **soumissions anonymes en cours d'évaluation**, à citer « submitted to ICLR 2027, OpenReview id ».
  - `group=NeurIPS.cc/2026/Conference` : **0 résultat sur les 38 requêtes**. Le groupe existe (`/groups` répond), mais les articles de la conférence principale ne sont pas indexés par la recherche. Repli sur le groupe parent `NeurIPS.cc/2026` (25 résultats par requête) : il ne renvoie que des **ateliers** NeurIPS 2026. 3 requêtes R11 sont tombées en 429.
- **Zenodo**, `/api/records?sort=mostrecent&q="<requête>"` : 10 premiers résultats.
- **OSF**, `/v2/registrations?filter[title][icontains]=<mot-clé>` sur 20 mots-clés : 25 premiers résultats, titres seulement.

**Comptes.**

| Source | Requêtes | Lignes brutes | Uniques | Pertinentes gardées |
|---|---|---|---|---|
| OpenReview ICLR 2027 | 38 | 556 | 523 | 31 |
| OpenReview NeurIPS 2026, conférence principale | 38 | 0 | 0 | 0 |
| OpenReview NeurIPS 2026, ateliers (repli) | 35 | 715 | 622 | 11 |
| Zenodo | 38 | 157 | 156 | 17, dont 3 dépôts du labo |
| OSF registrations | 20 | 287 | 287 | 8 |

Les hits OSF sont dominés par la psychologie et la médecine.

**Préregistrations concurrentes.** Les mots-clés « Hopfield », « emergent communication », « sleep memory consolidation », « catastrophic forgetting » et « preregistration computational » renvoient **0 registration** sur OSF ; « dreaming » renvoie 30 registrations, toutes sur la rêverie. Il n'existe donc **aucune préregistration OSF concurrente** sur le Hopfield rêveur, la communication émergente ou la consolidation. Il existe en revanche des préregistrations computationnelles récentes sur d'autres sujets (OSF `fpr9x`, `2kvsp`, `v7m6h` ; Zenodo 10.5281/zenodo.22117046 ; voir plus bas) : le labo ne peut pas revendiquer la primauté de la pratique.

Verdicts : **devance** (antériorité ou concurrence), **contredit**, **confirme**, **outil**.

### R1 — Sommeil, replay, Hopfield, unlearning
- OpenReview `O2IGIHRtWc`, ICLR 2027, 2026-09-18, « Spurious states are labels: a multi-label code in the Hopfield–RBM duality ». Les états parasites sont lus comme un code d'étiquettes multiples, fixé analytiquement par la dualité RBM. **Contredit** la prémisse « défaut à désapprendre » de NH-01 et dream-of-kiki ; à discuter.
- OpenReview `2ild9AoicO`, ICLR 2027, 2026-09-18, « Attractor Degeneracy ». Classes d'équivalence de matrices mémoire sous permutations et inversions de signe. **Outil** pour les invariances de NH-01.
- OpenReview `MQD4SODT9P`, ICLR 2027, 2026-09-17, « Sleep-Inspired Two-Stage Continual Learning for SNN ». **Devance** partiellement dream-of-kiki : consolidation en deux phases sur réseau à impulsions.
- OpenReview `4BIMcGrZjq`, ICLR 2027, 2026-09-18, « Language Models Need Sleep: Learning to Self Modify and Consolidate Memories ». **Devance** le récit « consolidation de LLM par le sommeil » de kiki-flow et dream-of-kiki.
- OpenReview `TEQKGhsCzb`, ICLR 2027, 2026-09-19, « Loss of Plasticity and Its Recovery via Replay-Driven Compression in a Spiking Model ». **Confirme** : le replay restaure la plasticité.
- OpenReview `eWJiEeUW25`, atelier DynaFront NeurIPS 2026, 2026-10-14, « Sleep Replay Consolidation Is a Convergent Dynamical Process Whose Attractor Is a Flat Loss Region ». **Devance** : analyse dynamique de SRC, angle voisin de kiki-flow.
- OpenReview `3gCeBuNNyT`, atelier CL4FMAgents NeurIPS 2026, « When to Sleep: Consolidation Timing as a Stability–Plasticity Problem », et `KdVy927FLx`, atelier CWM, « Continual World Modeling via Sleep ». **Confirment** que l'ordonnancement compte (cf. Singh 2022 ; `full-draft.tex:239-240`).
- Zenodo 10.5281/zenodo.23833431, 2026-10-31, nerve-wml v1.10.0 (NH-01) : dépôt du labo. Aucun autre hit Zenodo pertinent.
- OSF : 0 registration concurrente (voir ci-dessus).

### R2 — Communication inter-modules, PRH, CKA
- OpenReview `hukTsKYu8Y`, ICLR 2027, 2026-09-19, « Does the Workspace Do the Work? A Causal Protocol for Verifying Global-Workspace Computation in a Language Model ».
  - Protocole causal en quatre étapes : (1) couper la diffusion fait perdre 41–52 % sur les questions à deux modules ; (2) substituer le broadcast d'une autre entrée conduit le récepteur à combiner plutôt que copier dans 61–73 % des cas ; (3) défaire ce changement restaure la sortie dans 2 047 cas sur 2 048 ; (4) 4 modèles, protocole fixé à l'avance.
  - **Devance** : c'est exactement le test qui manque à nerve-wml (`main.tex:167-171`) et celui que réclame Lowe 2019. À citer et à reproduire.
- OpenReview `nZPqqSZc9t`, ICLR 2027, 2026-09-12, « Noise Ceilings for Representational Convergence ». La fiabilité inter-graines explique 51,3 % de la tendance d'alignement PRH. Sur Pythia-14M, le CKA brut monte de 89 % pendant que le consensus corrigé baisse de 10 %. **Contredit** la lecture d'un MI/H ou d'un CKA élevé comme convergence sans plafond de bruit (`nerve-wml main.tex:42`, `:101`).
- OpenReview `KwPMydtPay`, ICLR 2027, 2026-09-04, « Recovering Clean Representation Similarity with Independent Replicas » (IR-CKA). Le débiaisage d'échantillonnage n'enlève pas le biais dû au bruit d'observation. **Outil**, complète Murphy 2024.
- OpenReview `S7QxxP5hFE`, ICLR 2027, « Centered Kernel Distance: Dimension-Free Error Bounds ». **Outil** : erreur en fonction de N neurones et M conditions.
- OpenReview `OAmBy25HHg`, ICLR 2027, 2026-09-19, « Emergence, Not Bandwidth ». La valeur de la communication dépend du couplage physique ; en couplage rigide, aucun canal ne bat le silence (p = 0,982, n = 25). **Confirme** Lowe et fournit un contrôle « canal fermé ».
- OpenReview `xu80Sc1btb` (« Same World, Different Geometry », test contrôlé de la PRH) et `RLI68bLghd` (« What Converges in the PRH? »), ICLR 2027. **Confirment** une PRH restreinte à la structure locale. Cible : Related Work de nerve-wml et bouba_sens.
- OpenReview `Xw72C0uPBw`, atelier Interp4Discovery NeurIPS 2026, « Shared Geometry Is Not Shared Physics ». **Confirme** : l'alignement géométrique ne garantit pas l'interchangeabilité fonctionnelle.
- Zenodo 10.5281/zenodo.23445316, 2026-10-18, « Separately Trained Senses Converge on Shared Latent Structure » (identifiabilité sans données partagées). **Confirme**, proche de B-3. Prépublication non relue par des pairs.
- Zenodo 10.5281/zenodo.23801543, 2026-10-30, « Exchange-Diagram Residuals for Diagnosing Module Compatibility ». **Outil** : diagnostic au-delà de CKA et SVCCA, voisin du protocole nerve-wml.
- Zenodo 10.5281/zenodo.23849135, 2026-11-01, « Five Testable Criteria and a First Pre-registered Profile » (agents inventant leur langue, société privée). **Devance** faiblement, en tant que préregistration ; qualité non évaluée.
- OSF : « emergent communication » 0 ; « representational similarity » 9, toutes en neuro-imagerie. Rien de concurrent.

### R3 — Wasserstein, JKO, splitting
- OpenReview `0vtN38yP2t`, ICLR 2027, 2026-09-08, « Statistical Bias and Effective Dynamics of JKO Schemes with Estimated Ground Geometry ». Un biais dû à la géométrie estimée survit aux pas qui tendent vers zéro. **Contredit** l'idée qu'un pas plus fin suffit quand le coût est estimé sur particules (kiki-flow).
- OpenReview `bCNgWCHoSn`, ICLR 2027, 2026-09-19, « Beyond Training Loss: Full-Space Certificates for Neural JKO ». Une petite perte d'entraînement ne certifie pas un pas JKO inexact. **Outil** pour certifier les pas de kiki-flow.
- OpenReview `EbE2zyPxAc` (« Accelerated-JKO ») et `j3dU6qd2HC` (approximation particulaire d'un flot W2 perturbé), ICLR 2027. **Outils.**
- OpenReview `QLkuIr3rQE`, atelier NeurIPS 2026, « A Splitting Method for SDE Terminal-Law Estimation ». **Outil.**
- Zenodo 10.5281/zenodo.23636477, 2026-10-25, kiki-flow-research : dépôt du labo, intitulé « A Wasserstein Gradient Flow Engine ». **Même correction de titre que le papier** (Laborde 2017).
- OSF : « Wasserstein » 1 hit et « gradient flow » 1 hit, tous deux hors sujet. Aucune préregistration JKO.

### R4 — Plasticité cross-modale, bouba/kiki
- OpenReview `2FaHRono5T`, ICLR 2027, 2026-09-18, « Similar Choices, Different Attention: Cross-Modal Associations in Humans and Vision–Language Models ». C'est le seul hit ICLR 2027 pour « bouba kiki ». Mêmes stimuli chez 53 humains (oculométrie publiée) et dans des VLM : l'accord des choix ne s'accompagne pas d'un accord d'attention, et « matching human choices… is not sufficient evidence of human-aligned cross-modal processing ». **Devance**, comme banc humain–modèle bouba/kiki, et **contredit** toute lecture de B-3 comme correspondance humaine.
- OpenReview `kKv74DZZ2p`, atelier BabyVLM NeurIPS 2026, « Alignment Without Binding: A Credit-Depth Threshold for Cross-Modal Transfer in Local Learning ». **Confirme** la distinction entre alignement et liaison cross-modale.
- Zenodo 10.5281/zenodo.17497861, 2025-11-03, « Bouba, Kiki, and the Movement Between: Toward a Sensorimotor Hypothesis ». **Contredit** une lecture purement perceptive : un code moteur implicite intervient.
- Zenodo 10.5281/zenodo.17448577, 2025-10-26, jeu de données « Decoding the bouba-kiki effect in early visual cortex ». **Outil** ; description vide.
- DOI 10.1016/j.dcn.2021.100965, 2021 (relayé par Zenodo, données 10.5281/zenodo.5547291), « Sensitive period for the plasticity of alpha activity in humans ». **Confirme** l'existence d'une période sensible, même logique que Sourav 2019.
- Zenodo 10.5281/zenodo.20108830 : bouba_sens, dépôt du labo.
- OSF `s8prt`, 2026-08-13 : sensibilité au symbolisme son–forme chez des bébés de 18–20 mois et lien avec l'expérience articulatoire, en cours. **Tranchera** l'argument « inné » de `bouba_sens main.tex:1110-1114`, dans un sens ou dans l'autre ; à surveiller.
- OSF `2szma`, 2026-03-03 : réplication préregistrée inter-sujets de l'effet kiki/bouba. Avec `9epyz` (2026-03-12, caractère implicite mesuré en temps de réaction) et `44hg6` (2017, réplication d'Oberman & Ramachandran) : **confirment**. Ce sont des réplications préregistrées à citer à la place du « ≥ 95 % » non sourcé.
- Aucune préregistration computationnelle bouba concurrente.

### R5 — Développemental, JEPA, codage prédictif
- OpenReview `OMX73ebh7p`, ICLR 2027, « Building Neural Policies through Developmental Rewiring » (programmes de développement neuronal). **Devance** partiellement le harnais ontogénétique de baby-brain.
- OpenReview `tkpkXM7IFR`, ICLR 2027, « A Generalization Theory for JEPA-Based World Models », et `h5CjsruK0p` / `1Owm4DaT0a` (codage prédictif cohérent, à énergie générative). **Outils.**
- OpenReview `XAMg53HmSo` (« GAVAGAI: referential alignment for infant-scale VLMs ») et `sI0HKypX34` (âge à partir de vidéo égocentrée de nourrisson), atelier BabyVLM NeurIPS 2026. **Confirment** qu'une communauté BabyVLM existe : lieu de soumission possible pour baby-brain.
- Zenodo 10.5281/zenodo.23144572, 2026-10-04, « Better Predictors, Not Necessarily Better Plans: Auditing Planning Bottlenecks in a JEPA World Model », avec résultats scellés (10.5281/zenodo.23134310). **Confirme** ; pratique de scellement proche de celle du labo.
- OSF `2kvsp`, 2026-04-20, préregistration « K-Way Energy Probe under Bidirectional Predictive Coding ». Préregistration computationnelle sur un autre sujet : **devance** toute claim de primauté méthodologique.

### R6 — Quantique
- OpenReview `70buj9xun5`, ICLR 2027, « Auditing Claimed Speedups of Learned Surrogates for VQA », et `hFhCEAJKxy`, « Discretely Parametrized Quantum Circuits as Quantum Classifiers ». **Confirment** la tendance à l'audit des claims VQC dans laquelle s'inscrit micro-kiki Paper A.
- OpenReview `0GipXh8E2A`, atelier SaTQuML NeurIPS 2026, « Dependency-Closed Evidence Contracts for QML Comparisons ». **Outil** : protocole de comparaison.
- Zenodo 10.5281/zenodo.21916602, 2026-08-13, « Can Quantum Encoding Choice Close the Classical–Quantum Performance Gap? A Controlled Five-Encoding Ablation », avec 10.5281/zenodo.21913865. **Confirme** le résultat négatif de micro-kiki.
- OSF `v7m6h`, 2026-10-16, préregistration « Why a CNOT ring stops a hybrid quantum policy from learning », qui réplique un résultat négatif publié. **Confirme.**
- Borne de Holevo en classification : 0 hit OpenReview et 0 hit Zenodo. Banchi 2021 reste la référence (lu en intégral, ci-dessus).

### R7 — Matière, verres de spin
- OpenReview `9khJgK6p1C`, ICLR 2027, « Beyond Fixed Points: Superpolynomial Capacity of Asymmetric Hopfield Networks ». **Confirme** et sert de pont avec R1.
- Les requêtes « spin glass », « annealing associative memory » et « physical learning materials » ne renvoient que de la découverte de matériaux : hors sujet. Zenodo : 0.

### R8 — Cognition basale
- Zenodo 10.5281/zenodo.22117046, 2026-08-26, « Habituation Under Noise: a pre-registered stochastic re-examination of biochemical habituation motifs », avec critères scellés par commit. **Confirme** et sert de modèle de préregistration computationnelle en cognition basale.
- OpenReview : rien de pertinent dans les 15 premiers résultats.

### R9 — Énergie, thermodynamique
- OpenReview `lin9oXsbXJ`, ICLR 2027 (aussi ateliers MLForSys et AXIOM NeurIPS 2026), « Joules-to-GDP ». **Outil** : métrique de valeur par joule.
- OpenReview `OWcg6E9Vdi`, ICLR 2027, bornes entropiques par thermodynamique stochastique. **Outil.**
- OpenReview `YaCphwE2KS`, atelier AXIOM NeurIPS 2026, « Expressivity-Normalized Energy-Demand Comparison of ANNs and SNNs ». **Contredit** l'avantage énergétique présumé des SNN, si le labo l'invoque.
- Zenodo 10.5281/zenodo.23392058 (2026-10-15, énergie GPU par token selon la taille de lot, T4) et 10.5281/zenodo.22037483 (EcoCompute, RTX 4090, FP16/NF4/INT8). **Outils** : références de mesure directement comparables à KXKM (RTX 4090).
- OSF `2s4xp`, 2026-09-22, compromis énergie–performance des SNN en biosignaux. **Confirme.**

### R10 — Conscience
- OpenReview `hukTsKYu8Y` (voir R2) : **outil** pour tester la GWT. `Smolv3zuxI`, ICLR 2027, apprentissage par renforcement inspiré de l'IIT : hors cœur.
- Zenodo 10.5281/zenodo.23297816, 2026-10-11, théorèmes limites pour l'IIT sur substrats aléatoires. **Outil.** Les registrations OSF sur la conscience sont cliniques ou psychologiques : hors sujet.

### R11 — Nuls, équivalence, réplication, préregistration
- OpenReview `7l8JCIgUi8`, ICLR 2027, 2026-09-11, « The Null Is the Hard Part: Exact Tests for Memorization in Generative Models ». Des audits lus contre un seuil sans nul changent de conclusion sous contrôle du FDR. **Devance** partiellement le message central de la note méthodo nuls et errata, appliqué à un autre domaine. À citer dans `paper-methodo-2026` §1.
- OpenReview `zt1XrY1KBZ`, ICLR 2027, « A Permutation Audit for Cell-Level Foundation-Model Transferability Claims ». **Confirme.**
- OpenReview `gyBEOMWSeM` (variation d'une exécution à l'autre, ResNet-50) et `lAlT4ZUgMp` (« Training-Path Equivalence »), ICLR 2027. **Outils** : variance des graines, équivalence d'implémentation.
- OpenReview `i5dv4rvFuo`, atelier AI-Native Academia NeurIPS 2026, « Blinding the AI Co-Scientist: Mechanical Pre-Commitment for AI-Assisted Empirical Research ». **Devance** la pratique Hypneum : gel par tag, analyses faites par agents IA. À citer dans la note méthodo.
- OSF `fpr9x`, 2026-10-26, « Neural networks read as constraint systems: three preregistered tests at trained-network scale ». Préregistration computationnelle concurrente : **devance** toute claim de primauté.
- Zenodo : hors sujet (protocoles d'autres domaines).


## Lecture intégrale des antériorités clés (complément du 01/11 au soir)

Consigne du PI (18:41) : relire en texte intégral les travaux antérieurs à 2025 signalés comme non cités ou mal positionnés. Sources utilisées, toutes légitimes : PDF arXiv (`pdftotext -layout`, 3,5 s entre appels), XML plein texte Europe PMC (articles en accès libre), `openAccessPdf` de S2. Les copies tierces non officielles ont été écartées.

**Bilan.** 14 textes lus en intégral, couvrant 11 des 15 lignes prioritaires. 8 restent **[résumé seul]** (paywall ou défi anti-robot de l'éditeur, liste en fin de section). Les chemins `path:line` renvoient aux clones de `scratchpad/clones/`.

| Référence (texte lu) | Passage porteur exact | Phrase Hypneum visée (`path:line`) | Ce qui change après lecture |
|---|---|---|---|
| Benedetti, Ventura, Marinari, Ruocco, Zamponi 2022, arXiv:2201.00032 | Fig. 3 et éq. (10)–(12) : nombre de rêves **optimal intérieur** D_top, au-delà duquel le rappel se dégrade ; α_c^HU = 0,589 ± 0,003. §VI : la limite pseudo-inverse est attribuée à Plakhov & Semenov [10], l'élargissement des bassins à van Hemmen [17, 18, 26] ; Wimbauer–Klemmer–van Hemmen 1994 [19] est cité. | `rescience-nh01/article/content.tex:554-556` (« peaks at t* = 7 ») ; `:14-16` (limite projection attribuée au seul Kanter & Sompolinsky 1987) ; `:38` (Gardner sans référence). | **Antériorité renforcée.** Un optimum fini en nombre d'étapes d'unlearning est le résultat central de Benedetti 2022, pour l'unlearning hebbien (Hopfield–Feinstein–Palmer) et non pour le noyau continu de Fachechi. NH-01 doit donc présenter t* = 7 comme l'analogue, pour le noyau de Fachechi, d'un optimum déjà connu, et citer Plakhov & Semenov pour la convergence vers le projecteur (rattachement de seconde main, voir [résumé seul]). |
| Lowe, Foerster, Boureau, Pineau, Dauphin 2019, arXiv:1903.05168 | §3.2, déf. 3.1 (*positive signaling*) et 3.2 (*positive listening*) ; §4 : *speaker consistency*, une information mutuelle message–action, ne mesure que le signaling ; §5 : contre-exemple de signaling sans listening ; recommandation : influence causale de la communication (CIC). | `nerve-wml/papers/paper1/main.tex:42` (MI/H 0,91 → 0,96, claim B) ; `:101` (MI/H « occupe la place » laissée par CKA) ; `:167-171` (utilité causale non établie). | **Confirmé et aggravé.** Le MI/H de nerve-wml est calculé entre les codes émis par deux modules, sans action d'un récepteur conditionnée au message. Ce n'est même pas la *speaker consistency* de Lowe. La claim B ne peut porter que sur une redondance des codes, pas sur une transmission. |
| Murphy, Zylberberg, Fyshe 2024, arXiv:2405.01012 ; Davari et al. 2022, arXiv:2210.16156 | Murphy : le CKA biaisé est gonflé quand N est petit devant la dimension ; un estimateur débiaisé est donné. Davari, Thm 1 : on peut changer le CKA sans changer la fonction du réseau. | `nerve-wml/papers/paper1/main.tex:101` (MI/H 0,953 contre CKA 0,910, écart de 4,3 pp). | **Confirmé.** L'écart de 4,3 pp ne s'interprète qu'avec un CKA débiaisé, un nul par permutation et un plafond de bruit multi-graines (voir ICLR 2027 `nZPqqSZc9t` plus bas). |
| Deperrois, Petrovici, Senn, Jordan 2022, *eLife*, PMC9071267 | Results / Fig. 1 : PAD, avec NREM = rejeu d'un souvenir unique avec occlusion et REM = adversarial sur un mélange convexe de latents. Fig. 4b et 5 : ablations des profils (sans NREM, sans REM, combinés). | `dream-of-kiki/docs/papers/paper1/build/full-draft.tex:227-229` (« no work has formalized how the four pillars compose… amenable to ablation and proof ») ; `:246` et `:368` (« None of the prior art does all four »). | **La part « ablation » de la claim est antériorisée.** Restent nouveaux la preuve algébrique et l'indépendance au substrat. Écrire « premier cadre algébrique » plutôt que « premier cadre ». |
| Singh, Norman, Schapiro 2022, *PNAS*, PMC9636926 | Simulation 2, Fig. 4C : des cycles NREM/REM **en blocs** ou **alternés** donnent des issues différentes pour l'ancienne et la nouvelle mémoire. | `full-draft.tex:239-240` (« 12 cross-pairs non-commutative… order is part of the framework ») ; `dream-of-kiki/docs/papers/paper1/references.bib:446-451` (`pnas2022dualstage`, author {Anonymous}). | **Antécédent empirique direct de la non-commutativité**, à citer en appui. Le texte confirme que l'entrée anonyme est Singh et al. 2022. |
| Laborde 2017, arXiv:1506.00126 | Introduction et éq. (1.1) : des systèmes à interactions croisées **non proportionnelles** ne sont pas des flots de gradient dans le produit Wasserstein ; d'où un schéma JKO **semi-implicite**. | `kiki-flow-research/paper/main.tex:9` (titre « A Wasserstein Gradient Flow Perspective ») ; `:208` (« JKO step on F composed with an operator-splitting step ») ; bloc J^asym `~:182-210`. | **Confirmé.** La dynamique avec J^asym (31 % de la norme) relève exactement du cadre de Laborde. Titre à corriger, par exemple « perturbation non-gradient d'un flot W2 ». |
| Carlier, Duval, Peyré, Schmitzer 2017, arXiv:1512.02783 | Thm 3.16 : le JKO entropique converge vers le flot non régularisé si ε\|log ε\| = O(τ²). | `kiki-flow-research/paper/main.tex:119` (ε = ατ) ; `:345` (ε = 0,01, h = 0,05) ; `:351` (ε = h = 0,05 quel que soit ε configuré). | **Aggravé.** Avec ε = 0,01 et τ = 0,05, on a ε\|log ε\| = 0,046 contre τ² = 0,0025 (facteur ≈ 18). La loi ε = ατ de la l. 119 donne ε\|log ε\| ~ τ\|log τ\|, qui ne satisfait jamais la condition quand τ → 0. Aucune garantie vers le flot W2 : au mieux un flot avec diffusion supplémentaire, ce qui concorde avec la remarque de Baradat déjà notée. |
| Salim, Korba, Luise 2020, arXiv:2002.03035 | Thm 9 et Cor. 10 : taux de convergence du gradient proximal Wasserstein (forward–backward) pour des objectifs géodésiquement convexes ; aucune dérive non-gradient n'est traitée. | `kiki-flow-research/paper/main.tex:208` et `:296` (splitting de Gallouët). | **Confirmé.** Salim couvre la partie gradient ; la partie J^asym n'a pas de théorie. À dire explicitement dans §3. |
| Sourav, Kekunnaya, Shareef, Banerjee, Bottari, Röder 2019, *Psychol. Sci.*, PMC6787766 | Results : association son–forme **haptique** (SSA-H) au niveau du hasard chez les CC (cataracte congénitale opérée), DC (cataracte développementale) et CB (aveugles congénitaux) ; groupe LB (aveugles tardifs) **intact** (β = 3,287, p = .042) ; SSA **visuelle** réduite, pas abolie, chez CC et DC. | `bouba_sens/docs/paper/main.tex:118-120` (« hard-wired asymmetric modality mapping ») ; `:1110-1114` (« structural property… not learned »). | **Renforcé et précisé.** La contradiction est directe : la vision précoce est nécessaire, la cécité tardive épargne l'effet. C'est l'**analogue humain de B-1** (congénital contre tardif). Correction de ma ligne R4 : « réduite chez CC/DC, abolie en haptique », non « absente ». NB : `:1120` nuance déjà la claim, ce qui rend `:1110-1114` incohérent avec la suite du même paragraphe. |
| Ćwiek et al. 2022, *Phil. Trans. B*, PMC8591387 | Results : 72 % de réponses congruentes (IC crédible 56–82 %) ; 17 des 25 langues fiablement au-dessus du hasard, 3 sous 50 %. Discussion : chez les aveugles précoces, l'évidence haptique est **mitigée** (réf. [73] contre [74]). | `bouba_sens/docs/paper/main.tex:118` et `:1110-1111` (« ≥ 95 % cross-cultural agreement »). | **Renforcé pour le chiffre** : remplacer « ≥ 95 % » par 72 % [56–82]. **Nuance** de ma ligne R4 sur Fryer 2014 : ce n'est qu'un des deux résultats, contradictoires, sur l'aveugle congénital. |
| Banchi, Pereira, Pirandola 2021, arXiv:2102.08991 | La précision et l'erreur de généralisation d'un classifieur quantique sont bornées par l'information mutuelle I(C:Q) entre labels classiques et états encodés (information de Holevo de l'ensemble). | `micro-kiki/docs/paper-a/paper-a-v2.tex:17` (« no valid non-trivial ceiling has yet been established ») ; `:171` (paragraphe Holevo, borne de N bits). | **Confirmé.** Une borne non triviale et calculable existe, sur l'ensemble des états encodés et non sur N qubits. L'erratum peut proposer de la calculer pour le plongement à 4 qubits. |
| Phipson & Smyth 2010, arXiv:1603.05766 | p = (b + 1)/(m + 1) pour un test de permutation par tirage, et non b/m. | `paper-methodo-2026/paper/manuscript.md:30` (TODO max-then-median, nul par inversion de signe, B = 20 000). | Outil : formule à inscrire dans §3.3. |
| Lakens 2017, *SPPS*, PMC5502906 | TOST : équivalence déclarée si l'IC à 90 % est inclus dans [−Δ, +Δ]. | `bouba_sens/docs/paper/main.tex:67`, `:377`, `:386` (aucun verdict de compatibilité). | Outil : donner un Δ préenregistré pour B-3. |

**[résumé seul] — non lus en intégral.** Aucune ligne de la revue n'en dépend seule.

- van Hemmen et al. 1990, DOI:10.1016/0378-4371(90)90345-s : Elsevier, paywall.
- Plakhov & Semenov 1992, DOI:10.1109/rnns.1992.268563 : IEEE, paywall. Antériorité confirmée **de seconde main** par Benedetti 2022 §VI.
- Gardner 1988, DOI:10.1088/0305-4470/21/1/030 : le PDF IOP renvoie une page de défi anti-robot.
- Collignon et al. 2013, DOI:10.1093/brain/awt176 : OUP renvoie une page de défi anti-robot ; l'article est absent de PMC.
- Strang 1968, DOI:10.1137/0705041 : SIAM, paywall.
- Rohde & Plaut 1999, DOI:10.1016/s0010-0277(99)00031-1 : Elsevier, paywall.
- Elman 1993, DOI:10.1016/0010-0277(93)90058-4 : Elsevier, paywall. Une copie tierce non officielle a été refusée par la politique d'accès et n'a pas été utilisée.
- Helstrom 1969, DOI:10.1007/BF01007479 : Springer, paywall.
- Non vérifié et non cité : Wimbauer, Klemmer & van Hemmen 1994, cité par Benedetti [19].


## Non vérifié / inaccessible

- **LeCun 2022, « A path towards autonomous machine intelligence »** (OpenReview, pas de DOI ni d'arXiv) : Crossref renvoie un autre article (Dawid & LeCun 2024) ; non cité.
- **Cangelosi & Schlesinger 2015, *Developmental Robotics*** (MIT Press) : Crossref renvoie un autre titre ; non cité.
- **Bouthillier et al. 2019, « Unreproducible research is reproducible »** (ICML, PMLR) : introuvable par Crossref, quota OpenAlex épuisé ; non cité.
- **Krishnan et al. 2019, « Biologically inspired sleep algorithm… »** : Crossref renvoie Tadros et al. 2020 (AAAI), titre voisin, non confirmé comme le même travail ; non cité.
- **Parrondo, Horowitz, Sagawa 2015, *Nat. Phys.*** : Crossref renvoie un chapitre homonyme de 2024 ; retiré.
- Records partiels gardés avec réserve : Levy & Baxter 1996 (réédition MIT Press, DOI original *Neural Comput.* non résolu), Westfall & Young 1993 (seule la recension *Biometrics* est résolue), Liero–Mielke–Savaré (prépublication WIAS, version *Invent. Math.* non résolue).
- 4 identifiants proposés de mémoire et soumis à S2 ont renvoyé des records sans rapport : rejetés (aucun n'apparaît ici).
- **Couverture incomplète** : API arXiv en 429 après 14 requêtes (frontière R4–R11 couverte par Exa, puis résolue) ; quota OpenAlex journalier épuisé ; bioRxiv (hors un DOI) non interrogé ; GitHub/Hugging Face hors périmètre d'une revue de fond.
- **OpenReview** : routes `/notes?invitation=` et `/notes?content.venueid=` en `403 ChallengeRequired` sur `api2` et sur `api` ; seule la route `/notes/search` a servi (15 ou 25 premiers résultats par requête, donc pas d'exhaustivité). Conférence principale NeurIPS 2026 non indexée par la recherche : **0 article principal vérifié**, ateliers seulement. 3 requêtes R11 sur ateliers NeurIPS en 429. Les soumissions ICLR 2027 sont anonymes, non évaluées, et peuvent être retirées.
- **OSF** : filtre sur le titre seulement (25 premiers résultats) ; une préregistration dont le titre ne contient pas le mot-clé échappe à la recherche. **Zenodo** : 10 premiers résultats par requête, tri par date.
- **Texte intégral inaccessible** (8, marqués [résumé seul] dans la section « Lecture intégrale ») : van Hemmen 1990, Plakhov & Semenov 1992 (confirmé de seconde main par Benedetti 2022 §VI), Gardner 1988 (défi anti-robot IOP), Collignon 2013 (défi anti-robot OUP, absent de PMC), Strang 1968, Rohde & Plaut 1999, Elman 1993 (copie tierce non officielle refusée, non utilisée), Helstrom 1969.
- **Wimbauer, Klemmer & van Hemmen 1994** (cité par Benedetti [19]) : non vérifié par API, non cité.
- Les lignes de résumé des travaux ≤ 2024 hors des 14 textes lus restent rédigées depuis la connaissance du domaine (voir en-tête).
