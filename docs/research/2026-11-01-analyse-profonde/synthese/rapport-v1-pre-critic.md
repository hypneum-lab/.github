# Hypneum Lab — analyse profonde des travaux, 1er novembre 2026

*Revue multi-dépôts (skill `hypneum-review`), session electron-94 (Claude Fable 5.1), 18:04 → en cours. Baseline : état des lieux du 30/10 (12 constats, 16 errata). Consigne du PI : lire le texte intégral des papiers, vérifier chaque référence, recenser les papiers du groupe de Rome à citer, faire une vraie recherche bibliographique (toutes années, OpenReview/OSF/Zenodo compris), et créer un dépôt privé rassemblant papiers et thèses.*

## §0 Résumé exécutif

1. **Les neuf manuscrits ont été lus en entier** (≈ 47 000 mots de .tex/.md) et leurs 315 références résolues une à une par API : 238 sont correctes, 77 sont fausses ou mal attribuées, 17 invérifiables. Les erreurs vont du co-auteur inventé à l'identifiant arXiv qui pointe sur un autre article (LeCun 2022 cité sous un papier sur GitHub Copilot).
2. **Vingt-deux constats bloquants dédoublonnés** (contre sept le 30/10), dont dix-sept nouveaux. Le motif n'est plus seulement « le gel est solide, la mesure ne l'est pas » : dans six dépôts, **le texte affirme ce que le code ne fait pas** (lésion jamais appliquée, portes de plasticité annulées par AdamW, rêve qui ne modifie rien, oracle sans prox de Wasserstein, juge qui choisit toujours la première réponse, codes « post-VQ » qui sont des prédictions de classe).
3. **La réplication NH-01 soumise à ReScience (#147) est fragilisée par un résultat du labo lui-même** : avec la convention de diagonale de l'article original, le rapport rêve/Hebb à t = 10 tombe de 3,90 à 1,90, sous le seuil préenregistré de 3. L'article dit qu'aucune ablation n'a été faite. Le même cas est repris tel quel dans le plan FOSDEM, le brouillon de mail au groupe de Rome (non envoyé) et la note méthodo. Les quatre textes sont à corriger avant tout envoi.
4. **La littérature lue réduit fortement la nouveauté revendiquée.** La limite projecteur et l'optimum fini du rêve sont connus depuis van Hemmen 1990 et Plakhov-Semenov 1992 ; Agliari et al. 2012 (PRL) font le rappel parallèle de mélanges ; SIESTA 2023 répond à « quand dormir » ; Kleinman-Achille-Soatto 2023 font la privation précoce/tardive d'une modalité ; Vaccaro et Thomas 2026 publient la préregistration pour agents ; Gallouët-Monsaingeon 2016 le splitting JKO ; le routage de LoRA par domaine est saturé. **Le groupe de Rome (21 papiers 2024-2026) n'est cité dans aucun .tex** ; trois citations ajoutées le 01/11 n'existent que dans un Markdown.
5. **Ce qui reste neuf et testable** : la première réplication indépendante déclarée du noyau de rêve 2019 (si la diagonale est traitée) ; la mesure de l'ordre Lie O(τ) contre Strang O(τ²) dans un splitting W₂/FR (NH-20) ; une comparaison de politiques de déclenchement du sommeil à budget égal entre substrats ; un retour d'expérience chiffré d'un labo où les agents exécutent la recherche (note méthodo, à repositionner comme article d'expérience, cs.DL).
6. **Errata de la revue du 30/10** : 19 affirmations corrigées, dont la localisation de l'erreur Holevo (micro-kiki, pas quantum), M5 (échec de fond sur 96/96 configurations, pas mécanique), « Task 14 rétracté » (aucune rétractation dans le dépôt), C3′ « ≤ 1 par théorème » (trop fort : ≤ 1 en espérance ; le pilote donne 1,012), H18 (artefact de grille, pas « non concluant »).
7. **Calcul** (lecture seule 18:10) : E1-small KXKM 1 227/1 410 cellules, vivant ; N10-C run2 macM1 cinq runs dont le dernier (dial) à 29/50 M, fin ≈ 02:00, processus à 75 Go compressés (décision PI : laisser) ; Me6 confirmatoire terminé sur electron-server ; macM3 redémarré, jobs M5 morts ; cron de rapatriement GB300 réparé par la session GB300 (passe 18:20 OK). Aucun verdict de campagne n'est donné ici.
8. **Le profil public `.github` affiche toujours 70,7 % / 89,5 %** (lu en ligne à 18:46), malgré le constat bloquant #5 du 30/10.
9. **Décisions demandées** : dix questions à choix en §7, la première étant la conduite à tenir sur #147.
10. **Provenance** : 7 relectures Opus (une par dépôt), 2 veilles Opus, 1 agent utilité, 1 agent synthèse, 1 relevé calcul Sonnet, Codex gpt-6.1-sol en aveugle (en cours au moment de ce brouillon), vérification à la source par la session principale de 24 constats (`synthese/verification.md`). Faits et inférences sont séparés dans chaque constat.

## §1 État par dépôt

Les mots sont des `wc -w` bruts (balisage inclus). Les comptes de constats sont ceux des inventaires, avant dédoublonnage (B = BLOQUANT, M = MAJEUR, m = MINEUR).

**dream-of-kiki — 8a7e8468d2e8**
- **Lu.**
  - Paper 1 *dreamOfkiki: A Substrate-Agnostic Formal Framework*, v0.2 : `full-draft.md` (9 648 mots) et `.tex` de build du 3 mai (7 838 mots), qui divergent.
  - Paper 2 *Cross-substrate conformance* : `.tex` (3 806 mots).
- **Affirme.** Il n'existait pas de cadre formel des quatre piliers du sommeil, et Framework C en fournit un. DR-2 serait un théorème, et deux substrats seraient conformes. Un pilote passerait sous α (p = 0,01216).
- **Soutenu.** DR-2 est vrai par définition, et l'ensemble restreint par [P] n'est pas un semigroupe. H1-H4 sont synthétiques et Paper 2 est entièrement factice. Restent solides le §5.8 (22 substrats adverses sur 25 passent la couche structurelle) et NH-03 (verdict préenregistré).
- **Comptes.** 3 B, 9 M, 6 m, 3 OK. Références : 64 OK, 29 KO (93 clés).
- **Rome à citer.**
  - 10.1016/j.neunet.2024.106389 (arXiv:2308.01421) : P1 §3.2 après `full-draft.md:230`, §7.5 après `:940`, §8.4 ligne EWC (`:1045`).
  - arXiv:2501.16789 (NN 108181) : §3.3 (`:238-255`) et §8.4 ligne Zahn (`:1066`).
  - DLAM, arXiv:2605.13721 : P1 §3.3 et P2 §3.4.
  - arXiv:2609.32605 : §8.4 et préreg G4-nono §1.
  - arXiv:2605.10304 et 10.1016/j.neunet.2024.106174 : §2.1 après `:110`.
  - arXiv:2610.08612 : P2 §3.4.
  - Fachechi 2019 : à reporter dans le `.tex` et dans P2 §3.2.

**nerve-wml — fee6ababb7b1**
- **Lu.** Paper 1 v1.8.x, `papers/paper1/main.tex` (9 996 mots) ; supplément CKNNA (2 223 mots) ; préregs N10-C-bis, N10-D (PR #100) et NH-01.
- **Affirme.** Les neuroletters transmettent l'information entre substrats hétérogènes : MI/H de 0,91 → 0,96 après VQ, mKNN 18,8 fois le nul, loi d'écart de polymorphie, canal PSK γ/θ (Test 12).
- **Soutenu.** Les « codes post-VQ » sont l'argmax d'un classifieur et mesurent l'accord sur un cluster trivial. Conditionné sur le cluster, l'excès mKNN tombe à 2,5-3 fois. La limite du MLP est un sous-entraînement. Le Test 12 et le supplément CKNNA tiennent.
- **Comptes.** 4 B, 7 M, 5 m, 4 OK. Références : 26 OK, 15 KO (41 entrées).
- **Rome à citer.**
  - arXiv:2609.32605 : `main.tex:95`, `:133-149` et Test 12 `:785-823`, avec un bras décodeur à attracteurs.
  - arXiv:2501.16789 : `:95-97`.
  - arXiv:2610.08612 : `:133-149`.
  - arXiv:2503.06274 : `:95`.
  - 10.1016/j.neunet.2024.106389 et Crick–Mitchison 1983 : jalon NH-01 `:95-103` et interprétation de C1.
  - arXiv:2605.10304 : discussion de capacité de NH-01.

**kiki-flow-research — 8470e93a41bb**
- **Lu.**
  - `paper/main.tex` v0.13-draft (6 319 mots).
  - Atelier QueryConditionedF (7 fichiers, 4 092 mots).
  - `arxiv_bundle` v0.5 (3 254 mots).
  - `ERRATUM.md` (943 l.).
- **Affirme.** Un flux JKO multi-espèces reproduit des statistiques psycholinguistiques. Sans potentiel, la spécialisation n'émerge pas (excès sur Gibbs −0,39 bit). Le flux contracte à λ̂ = 67,8 « dans le régime du Thm 3.4 de Conger ». E1b confirmerait la loi ε/(2τ) et un pont réduirait l'oubli d'un LLM.
- **Soutenu.**
  - Aucun résultat n'a été obtenu avec un pas JKO.
  - λ̂ suit la grille, et E1b est REFUTED dans son propre JSON.
  - J pèse au plus 0,0075 bit et son signe est inversé ; le nul est attendu par construction.
  - Restent solides le pas implicite certifié, M5 documenté en échec, l'algèbre Lie/Strang et l'ERRATUM.
- **Comptes.** 5 B, 10 M, 7 m, 4 OK. Références : 24 OK, 8 KO (32 entrées), plus 7 citations pendantes.
- **Rome à citer.**
  - arXiv:2501.16789 et 2610.08612 : §2 (`main.tex:142-159`) et Discussion (`:471-498`, `:869-885`). Le nul s'y lit comme l'absence de terme anti-hebbien.
  - 10.1016/j.neunet.2024.106389 : §5.9, facultatif.

**micro-kiki — 61056d9d9e34**
- **Lu.**
  - Paper A, `paper-a-v2.tex` (2 031 mots), et `c5-info-bound.tex` (745).
  - Papier système `paper/micro-kiki.tex` (8 319).
  - Aeon-AMI draft-v1 (7 035), avec sa version FR et le recadrage (2 358).
  - Plan triple hybride (3 745), préreg NH-81 et préregs GB300.
- **Affirme.** Le VQC n'aide pas le routage. Le système compte 35 LoRA, un routeur à 46,4 % de top-1 et une couche cognitive à « +7 pp ». Aeon serait la mémoire du cadre AMI de LeCun.
- **Soutenu.** Le négatif de Paper A et le ΔPPL de −3,44 tiennent. La couche cognitive déployée est neutralisée et son A/B est nul. La borne de Holevo est mal appliquée, les baselines sont des hommes de paille, et NH-81 a R ≤ 1 par construction.
- **Comptes.** 4 B, 11 M, 9 m, 7 OK. Références : 66 OK, 9 KO, plus 12 sans identifiant (comptes communs avec mkq).
- **Rome à citer.**
  - arXiv:2610.08612 et 2607.29554 : §routeur (l.138) ; 2607.29554 aussi au §6.
  - arXiv:2610.22191 : draft-v1 §2.3 et §7.
  - arXiv:2501.16789 et 2609.32605 : draft-v1 l.315.
  - arXiv:2505.18796 et 2503.04454 : draft-v1 §3 et l.311.

**micro-kiki-quantum — 236239fe1e58** (dormant)
- **Lu.** Pas de manuscrit : README, `ARCHIVED.md`, spécifications et `qmoe_3domain.py`.
- **Affirme.** Un QMoE à 3 domaines, et un Quantum-PEFT qui exigerait un QPU.
- **Soutenu.** Entraînement et évaluation portent sur les mêmes 15 exemples, et un run a été réglé après coup. Le code ne correspond pas à la méthode citée. Le dépôt ne contient aucune borne de Holevo.
- **Comptes.** 0 B, 3 M, 2 m, 1 OK. Rome : aucun.

**bouba_sens — 6f224d172578**
- **Lu.** `main.tex` (7 841 mots), `paper-v0.1-draft.md` (8 002, marqué remplacé), lettre TMLR (1 250), brouillon PR #66.
- **Affirme.** Le corps parle d'un « invariant architectural » (PASS 3/3). L'abstract dit « magnitude only », B-1 rétracté, B-2 nul. La lecture finale conclut « no lesion effect ».
- **Soutenu.** La lésion est inopérante (k = 5 000, SNR ≈ 19 dB), le régime argmax n'apprend pas et la graine du monde est fautive. Aucune affirmation positive ne survit. L'analyse Me6 du 31/10 suit sa préreg, sans verdict ici.
- **Comptes.** 3 B, 7 M, 7 m, 7 OK. Références : 23 OK, 9 KO (32), plus 4 KO inline.
- **Rome à citer.**
  - arXiv:2503.04454 (prioritaire) : limites de B-3 (`main.tex:365-400`). Il prédit des amplitudes égales entre couches.
  - DLAM : Related work (`:1077-1106`).
  - arXiv:2503.15353 : la lésion se lit comme des entrées vides.

**baby-brain / BabyBrain — 376fe83824eb / 86f1a9f058fa**
- **Lu.** Brouillon SP6 `2026-05-22-ontogenetic-wml-draft.md` (5 257 mots, sans résultat). BabyBrain est une copie divergente du cockpit SwiftUI (29 fichiers sur 39 identiques).
- **Affirme.** Des portes de plasticité par stade améliorent l'efficacité en échantillons (Claim A). Le rêve consolide le WML. E1 contre E0 ne change « qu'une chose ».
- **Soutenu.** Sous AdamW, une porte dans (0,1] est sans effet. Le rêve renvoie ses entrées. Les données sont toujours tirées au stade NEONATE. Seule la baisse de ε sur MiniGrid 1a est robuste, sur une seule région et un seul stade.
- **Comptes.** 3 B, 7 M, 7 m, 3 OK. Références : 24 OK, 5 KO, 1 non vérifiable (30).
- **Rome à citer.** Fachechi 2019 (§2 l.230-239, §3.5 l.435) ; 10.1016/j.neunet.2024.106389 en E4 (l.554-565).

**rescience-nh01 — f6e97fd62cdd** (soumission `submission-20261031`)
- **Lu.** `article/content.tex` (4 951 mots), réplication partielle de Fachechi, Agliari et Barra 2019, soumise à ReScience (#147). L'original arXiv:1810.12217 a été lu en entier.
- **Affirme.** C1 = 3,86 [3,79 ; 3,93] à N = 1 000. Le contrôle « shrink » serait un « calibrated null ». L'article « supports the central qualitative claims ».
- **Soutenu.** Les chiffres sont exacts et la reproduction interne est bit-exacte. Avec la diagonale de l'original, C1 tombe à 1,90. C3′ ne peut pas réfuter. Aucune figure originale n'est reproduite.
- **Comptes.** 1 B, 5 M, 9 m, 5 OK. Références : 7 OK, 1 KO (prénom).
- **Rome à citer.**
  - JSTAT 2019 (10.1088/1742-5468/ab371d) : Intro `C:3-41`.
  - 10.1016/j.neunet.2024.106389 : `C:69-79` et `C:131-148`.
  - DLAM : `C:551-552`.
  - arXiv:2605.10304 : `C:566-578`.
  - arXiv:2603.09384 (Marinari, Rossi, Zamponi) : `C:131-148`.

**paper-methodo-2026 — 01d76c8bc094**
- **Lu.** Squelette « Freeze, guard, null, amend » : manuscrit (1 062 mots) et sections 00, 03 et 04 (5 193 mots).
- **Affirme.** Une chaîne en quatre gestes appliquée à 22 tags, 15 amendements et 31 corrections ; NH-01 y figure comme succès.
- **Soutenu.** Les 22 tags existent, mais 7 tags du 31/10 manquent. Les comptes sont faux. Le cas NH-01 contredit l'article ReScience. La note montre une détection, pas une prévention.
- **Comptes.** 1 B, 7 M, 7 m, 5 OK. Références : 4 OK, 1 à remplacer, 4 non revérifiées.
- **Rome.** Rien à ajouter ; compléter Fachechi 2019 et Kanter–Sompolinsky 1987.

**Références prioritaires de la revue de fond** (identifiants vérifiés par l'agent ; résumés antérieurs à 2025 non relus) :
- nerve : Lowe 2019, Murphy 2024.
- bouba : Sourav 2019, Collignon 2013, Ćwiek 2022.
- rn : Gardner 1988, Plakhov & Semenov 1992, van Hemmen 1990, Benedetti 2022.
- dok : Deperrois 2022, Singh 2022.
- kfr : Carlier et al. 2017, Laborde 2017.
- mk : Banchi et al. 2021.
- bb : Elman 1993, Rohde & Plaut 1999.
- pm et bouba : Lakens 2017.

**Totaux.**
- Constats bruts : 24 B, 66 M, 59 m, 39 OK.
- Références : 238 OK, 77 KO, 17 non vérifiables ou sans identifiant (unités hétérogènes).
- Rome : 21 identifiants trouvés par la veille, 19 retenus. Dans les dépôts, seul Fachechi 2019 est cité (dok `.md` seulement, rn, préreg NH-01) ; la préreg NH-01 cite aussi 2605.13721, avec la mention « not re-verified ».

---

## §2 Constats classés

**Dédoublonnage.**
- BLOQUANT : 24 bruts → 22, plus B23 (profil public, repris de la baseline et toujours ouvert).
- MAJEUR : 66 bruts → 40 lignes groupées par cause. Deux constats passent en §3 : kfr #15 (veille) et bb M9 (baseline).

### BLOQUANT

| # | Dépôt | Constat | Preuve | Vérifié | vs baseline | Action ≤ 1 soirée |
|---|---|---|---|---|---|---|
| B1 | dok | Fait : DR-2 (C) et (B) sont vrais par définition, et (A) est l'associativité de la composition. Les mots satisfaisant [P] ne sont pas clos par concaténation : (RESTRUCTURE) et (REPLAY) passent, leur composé non. [P] vient d'un `ValueError` de forme MLX. Inférence : le théorème est vide et « semigroupe sous [P] » est faux. | `dok/docs/proofs/dr2-compositionality.md:24-28,63-70,118-131` ; `dok/docs/papers/paper1/full-draft.md:374-381` ; `dok/docs/specs/amendments/2026-04-21-dr2-empirical-falsification.md:29-37` | session (CONFIRMÉ, logique) | nouveau | Écrire « propriété sous précondition » ; retirer theorem et semigroup. |
| B2 | dok | Fait : le texte déclare α = 0,00625 primaire (l.635), puis valide le pilote à 0,0125 avec un t apparié, alors que la préreg dit Welch (l.642). On a p = 0,01216, et 0,0143 en Welch, sur 15 paires dépendantes dont 3 zéros structurels. Inférence : « p < α » ne tient sous aucune règle préenregistrée. | `dok/docs/papers/paper1/full-draft.md:635,641-642,656,912-916` ; `dok/experiments/h1_split_mnist/results_h1_v2.csv` | session (CONFIRMÉ ; Welch par l'agent) | nouveau | Remplacer par un descriptif 0,090 → 0,016. |
| B3 | nerve | Fait : les codes « post-VQ » sont l'argmax de la tête π, entraînée sur 12 classes (7 codes distincts). MI(code ; cluster)/H vaut 0,998 / 0,999 / 0,798, et MI(code ; bit XOR) 0,001 nat. Inférence : Claim B mesure l'accord de deux classifieurs sur un cluster trivial. | `nerve/scripts/measure_info_transmission.py:65-152` ; `nerve/track_w/training.py:15-48` ; `nerve/papers/paper1/main.tex:370-378` | session (CONFIRMÉ sur le code ; rejeu par l'agent) | nouveau ; infirme baseline l.215 | MI sur indices VQ et MI conditionnelle au cluster (CPU). |
| B4 | nerve | Fait : le nul permuté intra-cluster vaut ≈ 0,06 contre 0,15-0,19 observé, et l'entrée seule atteint 0,22-0,25. Inférence : l'excès réel est de 2,5-3 fois, pas 18,8 fois. | `nerve/papers/paper1/main.tex:18-62,431-480` | agent seul | nouveau (rejoint 24/10 R11) | Nul intra-cluster (≈ 30 lignes). |
| B5 | nerve | Fait : le même réseau 4×16 atteint 0,92-0,95 en 8 000 pas. Inférence : la « limite structurelle » à 0,52 est un sous-entraînement, et la loi d'écart 10,7 / 6,7 / 2,4 / 2,7 % compare des substrats non convergés. | `nerve/papers/paper1/main.tex:335,415,770-771` ; `nerve/track_w/mlp_wml.py:56-90` | agent seul | nouveau | Relancer jusqu'au plateau ; retirer « structural limit ». |
| B6 | nerve | Fait : `gtm_mis` (messages permutés) atteint 0,81 contre 0,54-0,73 pour `gtm`, sur des runs uniques dont la répétition varie de 0,10-0,13. Inférence : le gain ne viendrait pas du contenu du message. | `nerve/docs/milestones/2026-10-25-n10c-bis-control-arms.md:296-306` | agent seul | confirme #3 | Signaler dans le texte bis que la comparaison repose sur 1 run. |
| B7 | kfr | Fait : le script tourne sans prox W2, avec des potentiels plats, n = 64 et h = 0,002. L'Euler explicite prédit 68,5, pour 67,79 mesuré ; le jouet donne 16, 33, 66 et 150 pour n = 16, 32, 64 et 128. Inférence : λ̂ suit la grille, et le Thm 3.4 de Conger ne s'applique pas. | `kfr/paper/main.tex:263-272,877-880` ; `kfr/experiments/check_lambda_monotonicity.py` | session (PLAUSIBLE, non refait avec POT) | nouveau ; infirme 24/10 H18 | Retirer λ̂ ; rejouer à n = 16 et 128. |
| B8 | kfr | Fait : le JSON donne une pente de 0,600 hors de [0,45 ; 0,55], verdict REFUTED. Le texte dit « confirms » et la loi ε/(2τ) « recovered ». Le bras entropique utilise `exp(-tau*v/reg)` au lieu de `exp(-2τV/reg)`, avec un autre pas que le nul. Inférence : la loi n'est retrouvée que par un pas mal étiqueté. | `kfr/paper/main.tex:832-842` ; `kfr/experiments/results/e1b_peyre_bias.json:124-130,140` ; `kfr/experiments/e1b_peyre_bias_preregistered.py:84-85,110` | session (CONFIRMÉ avec nuance) ; facteur 2 par l'agent | infirme 24/10 R3 ; facteur 2 nouveau | Écrire REFUTED ; re-préenregistrer après correction. |
| B9 | kfr | Fait : l'oracle de l'atelier tourne avec `apply_w2_prox=False`, et `coupling_matrix=None` donne des zéros. Le texte revendique une géométrie de Wasserstein et λ_J = 0,1. | `kfr/kiki_flow_core/track3_deploy/jko_oracle_runner.py:96,110` ; `query_conditioned_f.py:48-50` ; `paper/workshop/section_3_method_overview.tex:30-32` ; `section_4_method.tex:19-34` | session (CONFIRMÉ) | nouveau | Ne pas soumettre en l'état. |
| B10 | kfr | Fait : le résumé garde l'excès γ ≥ 20 retiré par l'ERRATUM §14 et le « full JKO scheme ». Le DOI Zenodo et `CITATION.cff` publient le pas non JKO. | `kfr/paper/main.tex:33,342,491` ; `kfr/CITATION.cff:37-38` | session (CONFIRMÉ) | confirme #4 | Bannière dans le `.tex` ; note Zenodo « superseded ». |
| B11 | mk | Fait : arXiv:2206.15331 est Dakhel et al., « GitHub Copilot AI pair programmer: Asset or Liability? », cité comme le texte AMI de LeCun dans 4 fichiers. | `mk/docs/papers/paper-a-draft-v1.md:12,26,62,271,374` ; `mk/docs/papers/paper-a-reframe-aeon-ami-fr.md:15,44` | session (CONFIRMÉ) | nouveau | Citer la version OpenReview. |
| B12 | mk | Fait : draft-v1 présente Aeon comme un apport propre sans citer Arslan (2601.15311), que la spec dit adopter tel quel. | `mk/docs/papers/paper-a-draft-v1.md:12,107,281` ; `mk/docs/specs/2026-04-15-cognitive-layer-design.md:28` | agent seul | nouveau | Citer Arslan. |
| B13 | mk | Fait : l'Éq. 1 borne I(M;Y) par N pour des espérances ⟨Z⟩ exactes. E-02 garde N, et la conclusion revendique encore « 0.91 », retiré l.111. Inférence : seule la DPI I ≤ H(Y) s'applique. | `mk/docs/paper-a/c5-info-bound.tex:22-30` ; `mk/docs/ERRATA.md:129-130` ; `mk/docs/paper-a/paper-a-v2.tex:111,175` | session (CONFIRMÉ) | confirme Codex sur le principe ; infirme la localisation (§3 E1) | DPI à la place de Holevo, sans borne chiffrée. |
| B14 | mk | Fait : le serveur instancie `AdaptiveJudge(None, None)`, qui renvoie l'index 0. Catfish et RBD reçoivent `generate_fn=None`, et RBD ne détecte donc jamais de biais. Le papier décrit CAMP et KnowBias appliqué deux fois. | `mk/src/serving/full_pipeline_server.py:823,824,890` ; `mk/src/cognitive/judge.py:53-54` ; `mk/src/cognitive/rbd.py:39-41` ; `mk/paper/micro-kiki.tex:116-117,297` | session (CONFIRMÉ) | nouveau | Retirer le §5 ou décrire l'état réel. |
| B15 | bouba | Fait : le corps garde « PASS 3/3 », « passes in every world », « architectural-invariant » et « minimal configuration », contre l'abstract. ADR-0020, 0022, 0024, 0026 et 0027 manquent, et la lettre TMLR est périmée. | `bouba/docs/paper/main.tex:90-94,346,461,565-566,754-759` ; `bouba/docs/paper/cover-letter-tmlr.md:36,47-49` | agent seul | confirme 24/10 §2.4, étend | Réécrire en rapport d'errata et de non-tests. |
| B16 | bouba | Fait : aucune grille ne passe `--k-steps` (défaut 5 000 pour une lésion de 100 pas, SNR ≈ 19 dB). ADR-0027 : T2 est lésé sur le monde 0 pour les graines 300-309. main.tex conclut « no lesion effect ». Inférence : c'est un non-test. | `bouba/scripts/run_grid.sh:166-175` ; `bouba/scripts/run_grid_probe_v2.sh:109` ; `bouba/src/bouba_sens/cli.py:547` ; `bouba/docs/paper/main.tex:1231-1239` | session (CONFIRMÉ, grep vide) | confirme #2 ; infirme l.357 | « Non concluant, lésion non effective ». |
| B17 | bouba | Fait : v0.7 a été taguée (02c2407) sans K_STEPS ni porte d'apprentissage. Elle écrit « ≥ » (l.437) contre « > » (l.408), et exclut explicitement toute correction pour ses 12 tests. Aucune grille n'a tourné. Inférence : c'est rattrapable avant données. | `bouba/docs/osf/amendment-v0.7-actionsense.md:363-397,408-409,437-441` | agent seul | confirme #2 ; gel malgré tout nouveau | v0.7.1 taguée : K_STEPS, porte de manipulation, porte d'apprentissage. |
| B18 | bb | Fait : les portes multiplient les gradients avant AdamW, qui est invariant à l'échelle ; la simulation montre des déplacements identiques à 1e-8 près pour les portes 1, 0,2 et 0,05. À porte 0, la décroissance de poids agit seule. Inférence : Claim A teste un placebo. | `bb/baby_brain/ontogeny/integration.py:93-109` ; `bb/baby_brain/ontogeny/__main__.py:457-460,1519-1523` | session (CONFIRMÉ) | nouveau | Porte sur le taux d'apprentissage par groupe. |
| B19 | bb | Fait : le stade fixe aussi la profondeur, le babil, le rêve et τ. `__getitem__` tire toujours au stade NEONATE. Inférence : E1 contre E0 confond au moins cinq variables. | `bb/baby_brain/ontogeny/__main__.py:224-230,380-392,1711` ; `bb/baby_brain/adapters/dream_mlx.py:26-34` | session (CONFIRMÉ) | nouveau | Figer ces variables ; brancher le curriculum sur le stade. |
| B20 | bb | Fait : `consolidate` renvoie ses entrées, le harnais passe `workspace_latents=None`, et `apply_consolidation` n'existe pas. Inférence : E4 est nul par construction. | `bb/baby_brain/adapters/dream_mlx.py:89-97` ; `bb/baby_brain/ontogeny/harness.py:253-262` | session (CONFIRMÉ) | nouveau | Retirer E4 ou implémenter l'écriture dans le WML. |
| B21 | rn + nerve | Fait : avec l'auto-couplage de l'original, rêve/Hebb vaut 1,904 [1,861 ; 1,951] à t = 10, contre 3,898 sans diagonale, et la courbe décroît de t = 1 à t = 100. L'article affirme qu'aucune ablation diagonale n'a été faite. Inférence : C1 ≥ 3 échoue sous la convention de l'original. L'ablation est postérieure au gel. | `rn/article/content.tex:218-222,526-545` ; `nerve/results/nh01_diagonal_ablation/summary.json` ; `nerve/docs/results/2026-10-31-nh01-diagonal-ablation.md:28-34` | session (CONFIRMÉ, recalculé) | nouveau (Codex : MAJEUR non mesuré) | Déclarer à l'éditeur de #147 ; tag v2. |
| B22 | pm | Fait : la note écrit « replicates bit-exactly », alors qu'il s'agit d'une reproduction interne. Elle écrit aussi « not computable, never 44× », contre l'article, et ne mentionne pas la diagonale. | `pm/paper/sections/03-chain.md:233-235,340-342` ; `pm/paper/manuscript.md:52` | agent seul | nouveau ; propage la baseline #10 | Réécrire NH-01 comme erreur trouvée après gel. |
| B23 | .github | Fait : le profil affiche encore « top-1 70.7 %, top-3 89.5 % », CAMP et KnowBias. | `.github/profile/README.md:55` (efa7b86) | synthèse | #5 toujours ouvert | Supprimer la ligne. |

**Points clos.**
- Baselines #8 et #9 : résolues par l'amendement N10-C du 30/10 (agent seul).
- Baseline #1 : close, car H14-A/B/C sont devenues exploratoires (`dok/docs/osf-amendment-e1-small-2026-10-30.md:102-106`, agent seul).

### MAJEUR

| # | Dépôt | Constat | Preuve | Vérifié | vs baseline | Action ≤ 1 soirée |
|---|---|---|---|---|---|---|
| M1 | dok | Fait : « three of four hypotheses passed » repose sur des données factices. Paper 2 ne contient que du mock, et H2 compare un profil à lui-même. Inférence : contrôle tautologique. | `dok/docs/papers/paper1/full-draft.md:994-998` ; `dok/docs/papers/paper2/build/full-draft.tex:604-612` | agent seul | nouveau | Retirer les tableaux H1-H4. |
| M2 | dok | Fait : Paper 1 revendique deux substrats (§5.6) puis un seul (§9.1), et Paper 2 dit « single ». Profils, version C et statut OSF divergent. La `.tex` est périmée de 6 mois, sans PDF. | `dok/docs/papers/paper1/full-draft.md:48-55,340-342,1139-1154` ; `dok/docs/papers/paper2/build/full-draft.tex:121,158-160,417-423` | agent seul | nouveau | Une source unique, re-rendue. |
| M3 | dok | Fait : « CONFIRMED on 4 benchmarks × 4 substrates » repose sur 6 lignes de non-rejet, dont une en double. Inférence : absence de preuve, sans TOST (MDE d ≈ 0,74). | `dok/docs/papers/paper2/results.md:816,840-845,855-862` | synthèse | confirme 24/10 ; voir §3 E10 | Réécrire en non-rejet avec MDE. |
| M4 | dok | Fait : le code de [P] ne lit que la première occurrence, et (REPLAY, RESTRUCTURE, REPLAY) passe. | `dok/kiki_oniric/axioms/__init__.py:75-80` | agent seul | nouveau | Test plus correctif. |
| M5 | nerve | Fait : la Méthode associe π→γ et ε→θ. Bastos, décrit par le propre Related Work du papier, met les erreurs en γ et les prédictions en α/β. | `nerve/papers/paper1/main.tex:74,76-78,170,176-180,220` | session (CONFIRMÉ) | nouveau | Inverser ou retirer « transcription ». |
| M6 | nerve | Fait : BioField attribue à Lee 2024 un VMP et un résidu de Poisson absents du papier ; la référence elle-même est juste. | `nerve/track_w/bio_field_wml.py:6-8,190-200` | agent seul | infirme 24/10 R2 | Écrire « inspiré de ». |
| M7 | nerve | Fait : Paper 1 ne cite aucun papier de Rome. Inférence : 2609.32605 recouvre le Test 12, pas N10-C. | `nerve/papers/paper1/main.tex:95,133-149,785-823` | session (sur la foi de l'agent) | nouveau | Related work et bras décodeur TAM. |
| M8 | nerve | Fait : la porte de nécessité de bis tient en 1 graine et 1 run par bras. Inférence : ≈ 8 % de faux succès et ≈ 24 % de faux échecs (σ ≈ 0,14) ; à 3 graines, 0,8 % et 11 %. | `nerve/docs/milestones/2026-10-25-n10c-bis-control-arms.md:320-352` | agent seul | complète l'action 3 | 3 graines appariées avant le gel. |
| M9 | nerve | Fait : N10-D déclare sym « non informative » mais l'inclut dans H1, et le nul ignore la covariance de graine. | PR #100 `docs/prereg/n10d/protocol.md` §5 | agent seul | nouveau | Sortir sym de H1. |
| M10 | kfr | Fait : le facteur ½ manque au code ; J ≥ 0 avec un + dans F pénalise le recouvrement ; b^phono est absent de Track 2 ; b^asym est une rotation qui préserve L2. Inférence : la psycholinguistique est décorative. | `kfr/paper/main.tex:184-187,203-244,310-312` ; `kfr/kiki_flow_core/track2_paper/paper_f.py:101-104,163,248-282` | agent seul ; ½ trouvé par Codex 30/10 | ½ confirme Codex | Corriger ½ et le signe. |
| M11 | kfr | Fait : le minimiseur de F_sep est l'état de Gibbs. Inférence : un excès négatif est attendu par construction. | `kfr/paper/main.tex:471-498` | agent seul | nouveau | Écrire « pas de spécialisation sans terme compétitif ». |
| M12 | kfr | Fait : le défaut d'auto-convergence de S ne décroît pas avec h (exposants −0,72 et −0,03). | `kfr/docs/notes/2026-11-01-jko-splitting-results.md` | agent seul | nouveau | Le déclarer pour NH-20. |
| M13 | kfr | Fait : l'atelier donne Δ = 0,0002, sous un sd de 0,00025, et non « 0,002, 8× sd ». On y lit « within 0,003 » pour 0,0003, puis 1 et 10 pas JKO, et aucun artefact de robustesse. | `kfr/paper/workshop/section_5_experiments.tex:135-139,151-153` | agent seul | confirme 24/10 H31 | Corriger ou retirer. |
| M14 | kfr | Fait : `arxiv_bundle` garde le gap de 2,04 bits, et ERRATUM §16 reste « PROPOSED » après la fusion de la PR #51. | `kfr/paper/arxiv_bundle/main.tex:31,267` ; `kfr/ERRATUM.md:700-703` | agent seul | confirme baseline | Supprimer le bundle. |
| M15 | kfr | Fait : M5 a tourné 96 configurations sur 96. La strate γ ≤ 30 en certifie 50 sur 60 (12/12, 12/12, 11/12, 10/12, 5/12), d'où `failed`. Inférence : l'échec est de fond. | `kfr/docs/results/2026-10-30-m5-certify-verdict.md:9-26` | synthèse | infirme #6 (§3 E2) | Citer l'échec tel quel. |
| M16 | mk | Fait : l'A/B (n = 30) donne Δ = −0,0102 (t −0,44) sur un composite lexical, et le JSON mesure 12,0-12,6 s de latence. Le papier écrit « +7 pp » et 4-6 s. | `mk/results/eval_cognitive_ab.json` ; `mk/scripts/eval_cognitive_ab.py:241-250` ; `mk/paper/micro-kiki.tex:50,309-329,369-388` | session (CONFIRMÉ) | nouveau | Retirer « +7 pp » et la table des latences. |
| M17 | mk | Fait : le rollback exige angle < 30° **et** win-rate en baisse de plus de 0,03 ; sans win-rate, il ne peut jamais se déclencher. | `mk/src/eval/forgetting.py:286-291` | Codex 30/10 + agent | confirme Codex | Mesurer le win-rate. |
| M18 | mk | Fait : random top-3 = top-1, la baseline mots-clés est le seul nom de domaine, et n vaut 14 423 contre 5 377 annoncés. Le null d'Aeon est hors distribution et dépasse le prédictif sur données réelles. | `mk/scripts/eval_router_ablation.py` ; `mk/results/aeon-realdata-soft-interleaved.json` | agent seul | complète #5 | BM25 ; null en distribution. |
| M19 | mk | Fait : le code de la null-space calcule l'angle principal minimal, et non le « pairwise cosine » du texte, sans contrôle aléatoire. L'angle suit la dimension. | `mk/src/eval/forgetting.py:65-93` ; `mk/paper/micro-kiki.tex:258-274,474` | agent seul | confirme 24/10 | Contrôle par matrices aléatoires de même rang. |
| M20 | mk | Fait : Text-JEPA gagne par 2 exemples sur 80, avec 4 qubits contre 6 annoncés, et Task 14 n'est pas rétractée. | `mk/results/text-jepa-vqc.json` ; `mk/scripts/eval_text_jepa_vqc.py:76` | agent seul | infirme 24/10 (§3 E3) | Rétracter. |
| M21 | mk | Fait : R = J_dense / J_spiking ≤ 1 par construction de la voie fused. Le statut est incohérent (withdrawn ou provisional). M3 Pro donne 0,670 [0,662 ; 0,677], contre 0,91 sur macM1, que la PR qualifie de « agrees ». | `mk/docs/prereg/2026-10-25-nh81-joules-per-token.md:22,97-100` ; `mk/docs/results/2026-10-25-nh81-joules.md:63` | synthèse (R) ; agent | confirme #12 | Statut unique ; publier l'écart entre plateformes. |
| M22 | mk | Fait : le même « 99 s » vaut pour deux charges différentes. « Confidently wrong » recouvre un effondrement sur 2 personas, avec un juge qui est le modèle lui-même ; oracle − aléatoire = +0,29 [−0,12 ; 0,71]. | `mk/docs/paper-a/paper-a-v2.tex:46,54,116-144` ; `mk/results/c2-downstream.json` | agent seul | nouveau | IC appariés. |
| M23 | mkq | Fait : train = test sur 15 exemples, run « fair » réglé 48 s après un échec, et Quantum-PEFT différent de la méthode citée. | `mkq/src/experiments/qmoe_3domain.py:58-74` | Codex 30/10 + agent | confirme Codex | Une phrase dans `ARCHIVED.md`. |
| M24 | bouba | Fait : B-2 est mesuré sur entrée propre fusionnée, pas sur les canaux non lésés. La clause de signe de B-3 et l'IC de B-1 sont absents, sans ADR. | `bouba/src/bouba_sens/loop.py:286-360` ; `bouba/scripts/aggregate_grid.py:208-220` | agent seul | confirme 24/10 ; preuve dans le code nouvelle | ADR de requalification. |
| M25 | bouba | Fait : sur le mock, 5 lignes ont p ≥ 0,996, avec une médiane observée sous la médiane nulle (0,0088 contre 0,0223). Inférence : sous un prédicteur constant, le nul par blocs est sur-dispersé, et v0.7 y est exposée. | `bouba/docs/milestones/2026-10-31-me6-large-n-results.md:50-61` ; `bouba/docs/prereg/me6-large-n/amendment-2026-10-31-diagnostic.md:39-42` | session (sur la foi de l'agent) | nouveau | Simuler le nul par blocs avant v0.7. |
| M26 | bouba | Fait : dans #66, le contrôle 2 a une moyenne nulle par construction, donc p ≡ 1. H0 inclut l'effet principal de requête (#66 et v0.7). | PR #66 §2 et §6 (l.201-206) ; `bouba/docs/osf/amendment-v0.7-actionsense.md:442-453` | session (sur la foi de l'agent) | tautologie nouvelle | H0 sur les résidus d'interaction. |
| M27 | bouba | Fait : les tenseurs réels de Studyforrest sont perdus, alors que la lettre revendique la reproductibilité. | `bouba/docs/paper/main.tex:507-522` | agent seul | confirme 24/10 | Retirer la revendication. |
| M28 | bouba | Fait : B-1 est confondu avec le budget et, depuis ADR-0027, avec le changement de monde. | ADR-0019, ADR-0027 | agent seul | confondant du monde nouveau | Une ligne d'errata. |
| M29 | bb | Fait : la règle déclare « soutenu » si les IC bootstrap ne se chevauchent pas, « falsifié » sinon. Inférence : à 5 graines, 27 % de soutien à d = 1, avec une couverture de 83 %. | draft l.512-516 | Codex 30/10 + agent | confirme Codex | Permutation sur l'aire sous la courbe, plus TOST. |
| M30 | bb | Fait : le LPM applique MWU et MK à une série d'autocorrélation 0,55. Sous AR(1), cela donne 15 % et 35 % de faux positifs, et le test d'acceptation fige la courbe en « PASS ». | `bb/baby_brain/loop/lpm.py:76-132` ; `bb/tests/loop/test_lpm_acceptance.py:25-41` | agent seul | confirme #288 | LPM par blocs. |
| M31 | bb | Fait : la plasticité est un stub constant (0,6), le mini-WML n'existe pas, et 1a ne couvre qu'une région et un stade. | `bb/baby_brain/ontogeny/__main__.py:1773-1774` ; `bb/baby_brain/model/config.py:8` | agent seul | confirme 24/10 §2.5 | Corriger les §3.3 et §4.1. |
| M32 | rn + nerve | Fait : à T = 0, le shrink ne change rien (rapport exactement 1). À T = 0,2, il équivaut à Hebb plus chaud ; le pilote donne 1,012. Inférence : C3′ ne peut échouer que par bruit, et « calibrated null » est impropre. | `rn/article/content.tex:57-65,131-148` | agent seul (concordant avec nerve C17) | confirme #10 ; voir §3 E4 | Contrôle spectral non uniforme. |
| M33 | rn | Fait : aucune figure de l'original n'est reproduite, alors que la Fig. 10 est au même N. | `rn/article/content.tex:43-48` | agent seul | nouveau | Reproduire la Fig. 10. |
| M34 | rn | Fait : les « spurious » sont une classe résiduelle, et P4 ne teste pas les mélanges. La cloche de C2′ contredit la monotonie du noyau (ridge 2024). | `rn/code/experiments/nh01_hopfield_dream/run.py:241-255` ; `rn/article/content.tex:180-193` | agent seul | nouveau | Test des 3-mélanges. |
| M35 | pm | Fait : les comptes sont faux (13 au lieu de 12, 2 au lieu de 3, 28 au lieu de 30), le résumé contredit le corps, et 7 tags manquent. | `pm/paper/sections/04-errata.md:62-63,71-72,87-89` ; `pm/paper/manuscript.md:10` | agent seul | nouveau | Comptes générés par script. |
| M36 | pm | Fait : les lignes 29-31 citent ba8aa81 au lieu de abfb1a9, et l'attribution « 7 sur 31 trouvées par Codex » est invérifiable. | `pm/paper/sections/04-errata.md:25-57` ; `pm/paper/sections/00-agents.md:31-33` | agent seul | nouveau | Sourcer les détecteurs. |
| M37 | pm | Fait : la règle de sélection est ambiguë, la thèse confond détection et prévention (8 jours, un seul laboratoire), et le classement cs.LG est peu probable. | `pm/paper/manuscript.md:14-30,48` | agent seul | confirme l.221 | cs.DL ou JOTE. |
| M38 | dok, rn, nerve, bb | Fait : 10.1016/j.neunet.2024.106389 (rêve = ridge + arrêt précoce), DLAM et le recuit partiel sont absents partout. rn omet aussi JSTAT 2019 et Dotsenko 1991, dok omet Golden 2022 et Tadros 2022, bb omet Elman et Rohde & Plaut. Inférence : un ×f uniforme n'est pas le rêve, et l'EWC relève du rêve. | `dok/docs/papers/paper1/full-draft.md:230,1045` ; `rn/article/bibliography.bib` ; `nerve/docs/milestones/2026-10-25-nh01-hopfield-dream-vs-downscale.md:95-103` | agent seul (DOI vérifiés Crossref) | DLAM confirme l.160 ; reste nouveau | Ajouter les entrées du §1. |
| M39 | dok, nerve, bouba, mk | Fait : 29 KO dans dok (21 auteurs « Anonymous », van de Ven faux), 15 dans nerve (Saxe pour Hosseini, Gröger inversé, CKNNA attribué à tort), 9 dans bouba et 4 identifiants faux dans mk. Inférence : des entrées ont été écrites depuis des résumés de veille. | `inventory/refs/*.md` ; `dok/docs/papers/paper1/build/full-draft.tex:1480` ; `nerve/papers/paper1/main.tex:99,709-712,964` | agent seul | nouveau | `.bib` reconstruit depuis les DOI. |
| M40 | transversal | Fait : 7 tags du 31/10 manquent à pm et rn, et le résultat clé de rn a été renversé après son gel. Inférence : la chaîne n'a pas d'étape « fait postérieur → amendement ». | `pm/paper/sections/03-chain.md:84-107` ; tag `prereg-nh01-diagonal-20261031` | agent (fait) ; inférence synthèse | nouveau | Ajouter la règle. |

### MINEUR notables
- **rn, urgent.** L'éditeur de ReScience attend deux noms de relecteurs depuis le 01/11 09:52 UTC (#147). Autres points mineurs : « Ludovico » au lieu de Ludovica (`rn/article/bibliography.bib:65`) ; aucun nom de modèle IA dans `docs/ai_use.md`, alors que pm écrit « Claude Fable 5.1 ».
- **bouba.**
  - Les B-3 de main.tex sont des multiples de 1/128, et 0,1406 = 9/64 est la médiane nulle à n = 64.
  - La règle 0,02 se déclenche sous H0 avec probabilité 1,000 pour tout n ≤ 1 024 (ADR-0026:353-355), ce qui étend la baseline l.92.
- **dok.** « 12 sur 16 paires non commutatives » est trompeur. E1-small n'est pas déposé sur OSF.
- **nerve.** acc_LIF vaut 0,611 ou 0,605 selon la ligne. Le README annonce « 24/24 refs » pour 34 entrées.
- **kfr.** −0,288 est la valeur propre de Levelt, pas de Dell. Les particules ont une dérive nulle.
- **mk.** « 3,4M params » pour 13 440. Les préregs GB300 gelées portent l'en-tête « L0 not frozen ». L'adaptateur HF en compte 34 et non 35.
- **bb.** 978,8 Mo sans artefact ; BabyBrain est une copie divergente.

---

## §3 Errata de la revue du 30/10 (et des revues qu'elle reprenait)

| # | Affirmation | Source | Correction | Source corrigée | Vérifié |
|---|---|---|---|---|---|
| E1 | La borne de Holevo mal appliquée est dans micro-kiki-quantum. | baseline l.21, l.92 | Elle est dans micro-kiki ; mkq ne contient aucun Holevo. E-02 garde N. | `mk/docs/paper-a/c5-info-bound.tex:22-30` ; `mk/docs/ERRATA.md:129-130` | session |
| E2 | M5 échoue mécaniquement (couverture 50/96, rien pour γ ∈ {0, 5, 10}). | #6 (l.72), l.133, l.269 ; l'addendum l.360 nuance | 96/96 configurations exécutées. γ = 0, 5 et 10 sont certifiés (12, 12, 11 sur 12) ; l'échec vient de γ = 20-30. C'est un échec de fond. | `kfr/docs/results/2026-10-30-m5-certify-verdict.md:9-26` | synthèse ; agents kfr et pm |
| E3 | « Task 14 rétracté ». | revue 24/10 l.122 | Aucune rétractation dans le dépôt. | `mk/docs/SESSION-2026-04-19-INDEX.md:86,96` | agent seul |
| E4 | C3′ ≤ 1 par théorème. | #10 (l.76) | C3′ ≤ 1 vaut en espérance seulement (pilote 1,012). Le contrôle reste incapable de réfuter. | `rn/article/content.tex:131-148` | agent seul |
| E5 | #87 « 44,4× » n'est pas calculable. | #10, action 8 (l.273) ; repris par pm | Calculable à T = 0 : 10 drapeaux `ok` sur 10, dénominateurs de 0,0117 à 0,0153. Seul T = 0,2 ne l'est pas. | `rn/data/nh01_correlated/summary.json` ; `rn/article/content.tex:428-460` | agent seul |
| E6 | 2610.31842 est un négatif publié sur les stades. | l.168 | Le papier ne manipule aucun stade ; il pèse contre Path-B, pas contre Claim A. | résumé arXiv ; `bb` draft l.303-308 | agent seul |
| E7 | L'oubli 0,361 ± 0,010 est le nul de spécialisation. | veille Rome 01/11 l.45, 60, 101 | 0,361 est l'oubli SST-2 d'un LoRA sans transport. Le nul de spécialisation est l'excès sur Gibbs. | `kfr/paper/main.tex:757` vs `:471-498` | agent seul |
| E8 | H18 (λ̂) est « non concluant ». | revue 24/10 H18 | C'est un artefact de grille (λ̂ ≈ n). | `kfr/experiments/check_lambda_monotonicity.py` | session (PLAUSIBLE) |
| E9 | Le constat B-3 n° 2 est requalifié et reste à vérifier après #56/#57. | addendum l.357 | Le défaut est toujours présent sur HEAD ; la ligne `:73-76` citée est devenue `:109`. | `bouba/scripts/run_grid.sh:166-175` | session |
| E10 | RECOMBINE est nul sur « 4 bancs × 4 substrats ». | l.215 ; 24/10 l.72 | 6 lignes de non-rejet, dont une en double ; ni grille 4 × 4 ni équivalence. | `dok/docs/papers/paper2/results.md:855-862` | synthèse |
| E11 | Claim B : « 0,93 discret contre 0,10 continu, le chiffre dépend de l'estimateur ». | l.215 | C'est un défaut de construit : les codes sont l'argmax d'un classifieur. | `nerve/scripts/measure_info_transmission.py:65-152` | session |
| E12 | NH-81 est le négatif « le plus vendable ». | l.215 | R ≤ 1 par construction (la baseline #12 le dit elle-même), et M3 Pro donne 0,67, IC disjoint. | `mk/docs/prereg/2026-10-25-nh81-joules-per-token.md:22,97-100` | synthèse ; agent |
| E13 | ReScience C : format inadapté. | l.224 | L'article a été soumis le 31/10. Le format reste tenable si les Fig. 9-10 sont reproduites. | issue #147 | agent seul (jugement) |
| E14 | Lee 2024 est « bien cité ». | 24/10 R2 | La référence est juste, mais le mécanisme est absent du papier. | `nerve/track_w/bio_field_wml.py:6-8` | agent seul |
| E15 | E1b est « cohérente avec Baradat ». | 24/10 R3 l.110 | REFUTED, et le bras entropique a un facteur 2. | `kfr/experiments/results/e1b_peyre_bias.json:124-130` | session |
| E16 | 2609.32605 couvre « 1 cellule sur 4 » de N10-C. | veille Rome 01/11 | Aucune hypothèse de N10-C n'y est testée ; le recouvrement porte sur le Test 12. | `nerve/papers/paper1/main.tex:785-823` | session (sur la foi de l'agent) |
| E17 | Le délai de NH-03 confond récence et interférence. | l.86 | La confusion est réelle mais désormais déclarée. | `dok/docs/results/2026-10-30-nh03-deferred-eval.md:82-90` | agent seul |
| E18 | Fachechi 2019 est absent de Paper 1. | l.194 | Ajouté par la PR #87, mais dans le `.md` seulement. | `dok/docs/papers/paper1/references.bib:5-41` | agent seul |
| E19 | #90 compte 2 BLOQUANT. | baseline (#90) | Il y en a eu 5 sur 4 passes, tous corrigés. | `scale.md` §11 | agent seul |

---

## §4 Analyses et suppositions

### Par chantier

**Framework C.**
- Le seul pilote réel oppose un oubli de 0,090 à 0,016, un facteur 5,7 connu depuis 2017.
- G4-septimo, à N = 30, ne détecte que d ≈ 0,74. Inférence : |g| = 0,025 n'exclut pas des effets jusqu'à 0,5.
- Un rapporteur dirait : un théorème vide plus un bogue, aucune donnée réelle, et un manuscrit qui se contredit, avec 29 références KO.

**E1-small et NH-03 (cohérence seulement).**
- L'amendement du 30/10 rend H14 exploratoire et déclare le run antérieur au dépôt ; il n'y a pas d'OSF.
- Le DOWNSCALE pèse ≈ 35 fois la mise à jour SGD (`dok/docs/osf-amendment-e1-small-2026-10-30.md:150-155`). Inférence : un Δ sur H14-B/C portera d'abord la signature d'un changement d'échelle.
- Avancement : 1 227 cellules sur 1 410 au 01/11 à 18:10. NH-03 suit sa préreg.

**nerve et N10-C.**
- Le bit XOR porte 0,001 nat sur 0,69. L'excès mKNN tombe de 18,8 à 2,5-3 fois.
- Avec 6 graines et σ de 0,1 à 0,14, seuls des |Δ| ≥ 0,2 sont tranchés.
- N10-C run 2 tourne (4 bras à 50 M, dial-s0 à 29 M) ; pas de verdict ici. L'analyse appariée par graine demandée le 30/10 est cohérente avec la covariance de tronc.
- Un rapporteur dirait : un construit faux, des substrats non convergés et une biologie inversée.

**NH-01.**
- La demi-largeur de l'IC de C1 vaut ≈ 0,07. Le facteur 3,86 vient du dénominateur (0,606 / 0,157), et Hebb décroît avec N. Inférence : C1 croît mécaniquement avec N, donc #90 est quasi garanti.
- Le risque est de construit : diagonale, C3′, « spurious ».
- Les rapporteurs demanderaient la Fig. 10, l'identité ridge et la diagonale dans l'article ; l'éditeur, de trancher entre réplication et extension.

**kiki-flow.**
- J pèse moins de 0,4 % de l'entropie, sous les erreurs W2 du schéma (0,14-0,64). L'oubli de 0,361 contre 0,326 ± 0,047 reste sous un sd, et le ΔKL de l'atelier aussi.
- M5 certifie 50 configurations sur 60 en strate primaire et 10 sur 38 en secondaire ; NH-20 ne trouve que 12 marges exploitables sur 60.
- Un rapporteur dirait : aucun pas JKO, des métriques artefactuelles et un nul attendu par construction.

**micro-kiki.**
- C2 : VQC − aléatoire = −0,54 [−1,02 ; −0,05]. HumanEval et MBPP ont une erreur-type ≈ 6,6 pp, donc sont dans le bruit.
- NH-81 : 12 paires, R̂ = 0,91 [0,83 ; 1,01] ; taux de décharge de 13,8 % contre 1-3 % supposés.
- Un rapporteur dirait : ce qui est revendiqué n'est pas implémenté, les baselines sont des hommes de paille, et les attributions sont fausses.

**bouba (cohérence seulement).**
- Me6 : tag à 08:27:58, règle de bloc poussée 22 s avant la première cellule mais pas fusionnée. Les 16 lignes concordent avec les JSON, et le compte Bonferroni (5 sous 0,000625) est exact. Les écarts sont déclarés.
- v0.7 compte 12 tests sans correction. Inférence : α familial ≈ 0,46 si les tests étaient indépendants.
- Un rapporteur dirait : la manipulation n'est pas validée, l'estimand a glissé et H0 est mal posée.

**baby-brain.**
- La règle de décision à 5 graines donne 3 % de soutien sous le nul et 27 % à d = 1, contre 40 % pour un t unilatéral. Le modèle de 252 M paramètres n'a pas de budget estimé.
- Un rapporteur dirait : un placebo sous Adam, une ablation à plusieurs facteurs et aucune issue « équivalent ».

**paper-methodo.**
- La note compte 31 corrections en ≈ 8 jours. Inférence : détection sans contrefactuel de prévention.
- Un rapporteur dirait : N = 1 laboratoire, et des comptes faux.

### Suppositions implicites transversales
1. **« La manipulation agit »** : lésion à k = 5 000, portes sous AdamW, rêve sans effet, couplage nul, couche cognitive neutralisée. Risque : des non-tests publiés comme résultats.
2. **« Le nul est le bon »** : nul i.i.d. de mKNN, null one-hot d'Aeon, item comme unité échangeable, nul par blocs sous prédicteur constant, bras indépendants. Risque : des excès surestimés d'un ordre de grandeur, ou des nuls sur-dispersés.
3. **« Un contrôle qui passe informe »** : C3′, l'auto-équivalence H2, le contrôle 2 de #66, R ≤ 1. Risque : des tautologies comptées comme des succès.
4. **« Les systèmes sont convergés »** : MLP de nerve, grille de 16 à 64 points, S non convergent en h, régime argmax de bouba. Risque : des « lois » qui mesurent le budget d'entraînement.
5. **« Le texte décrit le code »** : facteur ½, oracle W2, null-space, B-2, mécanisme Lee, porte AND. Risque : des chiffres justes sur un objet différent.
6. **« Une reproduction bit-exacte vaut une réplication »** : NH-01 dans pm, CI de kfr. Risque : confondre fidélité au code et validité.
7. **« Un pilier, une opération ; ×f uniforme = SHY »**. Risque : Rome (106389, DLAM) montre que rêve, régularisation et arrêt précoce ne font qu'un et agissent par direction propre ; la décomposition n'est alors pas identifiable.
8. **« Les observations sont indépendantes »** : ticks du LPM, paires du pilote dok, bras d'une même graine. Risque : jusqu'à 35 % de faux positifs.
9. **« Une bibliographie écrite depuis la veille est exacte »**. Risque : 77 références KO, visibles dans les rendus.
10. **« Couplages fixés (Rome) et réseaux appris se transfèrent »**. Risque : chaque nouveauté d'Hypneum se réduit à un résultat connu à couplages fixés, ou devient intestable. Seuls 2610.08612 et 2503.15353 font le pont.

### Contribution réellement neuve une fois la littérature lue
- **dok Paper 1.** Une suite de conformité exécutable, avec l'aveu que sa couche structurelle laisse passer 22 adversaires sur 25. Le cadre formel n'ajoute aucune prédiction aux modèles de Rome ou de Bazhenov.
- **dok Paper 2.** Rien d'empirique : une démonstration d'ingénierie sur prédicteur factice.
- **nerve Paper 1.** Le format neuroletter et ses intégrations NIR et Lava, et le canal PSK du Test 12, à comparer au décodeur à attracteurs de 2609.32605.
- **Supplément CKNNA.** Une réplication synthétique de Gröger et al., sans apport théorique.
- **N10-C, bis, N10-D.** La rigueur du dispositif (gel, gardes, bras de contrôle). L'idée scientifique est déjà publiée.
- **kfr main.** Le pas implicite certifié (résidus KKT) et l'ERRATUM comme étude de cas. Le modèle psycholinguistique n'ajoute rien à Conger 2025 ni à Agliari et al. 2026.
- **kfr atelier.** Rien tant que l'oracle n'a ni transport ni couplage.
- **mk Paper A.** Un négatif honnête dans un domaine nouveau, attendu par Huang 2021 et Schuld 2021.
- **mk système.** Un rapport d'ingénierie. La « découverte MoE » s'explique par la grande dimension.
- **mk Aeon-AMI.** Rien de robuste ; l'architecture est d'Arslan.
- **NH-81.** La mesure J/token sur rail GPU Apple Silicon et l'écart entre plateformes (0,67 contre 0,91).
- **bouba main.** Le nul apparié d'un maximum de différences d'exactitude, et deux pièges documentés : la sur-dispersion par blocs et la tautologie par dérangement. Sur la plasticité, c'est un non-test.
- **bb draft.** Une seule question survit : des stades imposés battent-ils des stades émergents ou un flux chronologique ? C'est NH-87, non testé.
- **rn.** Un contrôle shrink apparié et une chaîne de préreg exemplaire. Le point « spectral » est déjà établi par DLAM et par l'identité ridge.
- **pm.** Le jeu de données d'errata daté et les gardes de lancement : le livrable le plus réutilisable du lot.

## §5 Littérature : ce que la lecture complète change

Trois documents (tous dans `veille/`) : `rome-2026-11-01.md` (21 papiers du groupe de Rome 2024-2026, résolus), `veille-2026-11-01.md` (recherche par thèse : ≈ 130 références, 12 à 20 par thèse, 24 textes lus en intégral HTML arXiv, delta hebdomadaire réduit à 24 entrées, 21 dépôts open source) et `revue-de-fond-2026-11-01.md` (revue par axe R1–R11 : ≈ 330 candidats, 255 vérifiés, 246 gardés, dont les fondateurs 1980-2015 ; complément OpenReview/OSF/Zenodo et lecture intégrale des antériorités en cours, voir §8).

### Verdicts les plus lourds par thèse (identifiants vérifiés)

| Thèse | Travail antérieur | Verdict | Conseil |
|---|---|---|---|
| `recombine` = séparation de mélanges | Agliari et al. 2012 PRL 10.1103/PhysRevLett.109.268101 ; ICLR 2027 O2IGIHRtWc ; Rome 2609.32605 | Devance : rappel parallèle sans états parasites | Positionner GENIAL comme axiomatisation, pas comme découverte |
| NH-03 « quand dormir » | SIESTA 2303.10725 ; SleepGate 2603.14517 ; « When to Sleep » 3gCeBuNNyT | Devance : à budget égal, dormir plus souvent rapporte moins ; déclencheur adaptatif publié | Présenter comme réplication inter-substrats à budget égal |
| nerve-wml communication | DVNC 2107.02367 ; IC3Net 1812.09755 ; CommFormer 2405.08550 ; Lowe 2019 1903.05168 | Devance chaque élément ; la limite de DVNC prédit le nul N10-C ; MI élevée ≠ canal utilisé | Publier N10-C comme nul expliqué ; test causal pour Claim B |
| kiki-flow flot JKO | Gallouët-Monsaingeon 1602.04457 ; Hernandez 2501.14660 ; Carlier 2017 ; Laborde 2017 ; Salim 2020 | Devance le splitting W₂/FR et « experts = particules » ; **ordre Lie/Strang non traité** | Ne revendiquer que la mesure Lie/Strang |
| micro-kiki routage LoRA | Arrow 2405.11157 ; PHATGOOSE 2402.05859 ; DEMix 2108.05036 | Saturé | Rapport technique ou réplication négative de C5 |
| C5 / Holevo | Banchi 2102.08991 ; Huang-Kueng-Preskill 2101.02464 ; Banchi-Pereira-Pirandola 2021 PRX Quantum | Devance ; la borne interne est déjà réfutée | Borne via information de Holevo du plongement |
| bouba_sens | Kleinman-Achille-Soatto 2210.04643 (CVPR 2023) ; Alper 2310.16781 ; Sourav 2019 vs Piller 2023 | Devance la privation précoce/tardive ; la littérature humaine se contredit | Arbitrer Sourav/Piller avec audio réel sans orthographe |
| baby-brain | Orhan 2007.16189 ; DevBench 2406.10215 ; hzOkOeFHYG ; Rohde-Plaut 1999 ; Elman 1993 | Devance le harnais ; contredit les gains développementaux | Éviter « les stades aident » ; TOST préenregistrée |
| Note méthodo | Vaccaro 2606.11217 ; Thomas 2606.27687 ; uARkY9XJHj ; 5 audits préenregistrés ICLR 2027 | Devance gabarit, gardes et genre | Article d'expérience chiffré, citer Vaccaro et Thomas dès le résumé |
| NH-01 réplication | van Hemmen 1990 ; Plakhov-Semenov 1992 ; Gardner 1988 ; Benedetti 2308.13445 ; Agliari 1812.09077 ; Serricchio 2405.08777 | Antériorité de la limite projecteur et de l'optimum fini ; confirme le spectre | Citer, et montrer le défaut « trop rêver » |

Six de ces identifiants (2210.04643, 2303.10725, 2606.11217, 2606.27687, 1602.04457, 2501.14660) ont été revérifiés par la session principale sur les pages arXiv : titres conformes. Les deux soumissions OpenReview citées n'ont pas pu être résolues depuis cette machine.

### Groupe de Rome : où citer

Aucun des 21 papiers n'est cité dans un .tex du labo. Les cinq à ajouter en priorité : **10.1016/j.neunet.2024.106389** (le noyau de rêve est exactement l'estimateur ridge + early-stopping → dream-of-kiki P1 §2-3, rescience-nh01 discussion, baby-brain claim C) ; **10.1016/j.neunet.2024.106174** (réduction ≈ 90 % des données par le sommeil → E1-small) ; **2605.10304** (recuit partiel, α_c = 1 par un autre mécanisme → contrôle pour NH-01) ; **2501.16789** / 10.1016/j.neunet.2025.108181 (spécialisation modulaire spontanée → à opposer au nul de kiki-flow) ; **2610.08612** (RBM modulaire → N10-D et routeur multi-étiquettes micro-kiki). 2609.32605 ne devance pas N10-C (pas d'agents ni de bras sans communication) mais recouvre le Test 12 de nerve-wml Paper 1. Les trois citations fusionnées le 01/11 dans dream-of-kiki (#87) sont exactes mais n'existent que dans `full-draft.md`, ni dans la .tex ni dans Paper 2.

### Quinze références à ajouter dans les .bib (papier → section)

Table complète dans `veille/revue-de-fond-2026-11-01.md` ; les cinq premières : Lowe 2019 → nerve-wml §info-tx ; Murphy-Zylberberg-Fyshe 2024 (2405.01012, biais CKA à petit N) → nerve-wml ; Sourav 2019, Collignon 2013, Ćwiek 2022 → bouba_sens Related work (remplacent le « ≥ 95 % interculturel » non sourcé) ; Gardner 1988 → rescience-nh01 §1 (borne nommée sans citation) ; Deperrois 2022 et Singh 2022 → dream-of-kiki (Singh identifie l'entrée « Anonymous 2022 » du .bib).

### Complément demandé par le PI (19:01) : OpenReview, OSF, Zenodo et lecture intégrale

- **OpenReview ICLR 2027** : 523 soumissions uniques balayées, 31 gardées ; ateliers NeurIPS 2026 : 11 gardées (le programme principal n'est pas indexé par la recherche ; les routes `/notes` renvoient 403). **Concurrent principal : `hukTsKYu8Y`**, qui réalise le test causal d'usage du canal qui manque à Claim B de nerve-wml.
- **OSF** : 8 préregistrations gardées ; **aucune préregistration concurrente** sur le rêve de Hopfield, la communication émergente ou la consolidation.
- **Zenodo** : 17 dépôts gardés, dont 3 du labo.
- **Lecture intégrale** : 14 textes lus en entier, couvrant 11 des 15 priorités ; 8 restent en « résumé seul » (paywall ou anti-robot), dont Gardner 1988, Collignon 2013 et Plakhov-Semenov 1992.
- **Ce que la lecture complète change** : (1) NH-01 : l'optimum fini en t est déjà dans Benedetti 2022 (Fig. 3) pour l'unlearning de Hopfield, pas pour le noyau de Fachechi ; Plakhov n'est confirmé qu'indirectement. (2) nerve-wml : aggravé, il n'y a pas de récepteur, donc la mesure n'est même pas la « speaker consistency » de Lowe (§3.2). (3) bouba_sens : renforcé par Sourav 2019 (association son-forme intacte chez les aveugles tardifs, au hasard chez les privés précoces : analogue humain de B-1) ; Ćwiek 2022 donne 72 %, pas ≥ 95 % ; Fryer 2014 est nuancé. (4) dream-of-kiki : Deperrois 2022 antériorise l'ablation, Singh 2022 l'ordre des phases. (5) kiki-flow : aggravé, avec ε = 0,01 et h = 0,05 la condition du théorème 3.16 de Carlier 2017 n'est pas tenue.
## §6 Pistes d'utilité

Document complet : `synthese/utilite.md` (sections A actifs, B négatifs publiables, C retraits, D tâches datées par soumission, E scénarios, F QCM).

**Actifs réels** : la discipline de gel (tags, manifestes, SWHID, déviations déclarées) et les outils qui la portent ; le protocole de réplication NH-01 (préreg + code + données, reproduction interne bit-exacte 29 640/29 640) ; les nuls et contrôles déjà écrits (B-3 partition, Me6 par blocs, shrink matché) ; les données ActionSense extraites (5 sujets) ; les benchmarks et harnais (HardFlowProxy, mondes bouba_sens, campagne N10-C) ; la bibliothèque privée `hypneum-lab/library` créée ce soir.

**Négatifs publiables tels quels** : Claim B de nerve-wml refait comme « accord de classifieurs ≠ canal » ; M5 (96/96 configurations, échec de fond du critère γ ≤ 30) et Lie/Strang (non substituables, Strang sauve 3 configurations) comme note numérique ; NH-03 recency_survives comme point d'une courbe coût-du-décalage, en section de la note méthodo ; le nul de spécialisation kiki-flow (à opposer à 2501.16789).

**À arrêter ou retirer** (coût de l'inaction : chaque citation externe propage une affirmation retirée) : profil `.github` 70,7/89,5 et CAMP/KnowBias ; Zenodo 23636477 « rigorous JKO path » sans note « superseded » ; `main.tex` de kiki-flow et de bouba_sens qui gardent des affirmations retirées dans le corps ; lettre TMLR périmée ; NH-81 comme négatif neuromorphique (R ≤ 1 par construction) ; « bit-exact replication » dans la note méthodo ; le lancement K1/K3 Me6 prévu en semaine 1 avant amendement v0.7.1 ; le run NH-81 KXKM du 04/11.

**Ce qui manque par soumission** : ReScience #147 → commentaire déclarant l'ablation diagonale (C1 = 1,90), deux relecteurs proposés, v2 avec tableau diagonale et Fig. 10 de l'original (≈ 18 h) ; note méthodo → cas NH-01 réécrit, Table 1 complétée (7 tags manquants), Table 2 lignes 29-31 sur le bon commit, Vaccaro et Thomas cités dès le résumé, cs.DL primaire (≈ 45 h, arXiv < 15/12, JOTE janvier) ; FOSDEM PYVZXW → corriger « confirmed at two of three loads » avant le 16/11 (1 h) ; NH-03 → section de la note (4 h).

**Scénarios à 3 mois** (02/11 → 31/01, plafond 10 h/semaine) : conservateur ≈ 95 h (profil assaini, #147 honnête, 1 preprint, JOTE) ; **médian ≈ 128 h, recommandé** (+ ReScience v2 défendable, amendement bouba v0.7.1 sans grille, décision N10-C-bis/N10-D documentée) ; ambitieux ≈ 185 h (14 h/semaine, au-dessus du plan pro, reproduit le schéma « affirmer avant de contrôler »). Argument central : #147 et FOSDEM reposent sur le même cas NH-01 dont l'erreur de convention est connue ; 16 h de plus achètent la seule réplication externe du labo, qui est aussi le cas phare de la note.
## §7 Décisions demandées au PI (QCM)

Option recommandée en premier. Chaque question renvoie à un constat de §2.

1. **ReScience #147 et la diagonale (B21)** — (a) Commenter #147 le 02/11 (ablation déclarée, C1 = 1,90), proposer les 2 relecteurs, v2 avec tableau diagonale + Fig. 10 avant fin novembre · (b) Retirer et resoumettre en janvier · (c) Déclarer seulement · (d) Attendre les rapports.
2. **Mail 50142 au groupe de Rome** — (a) Garder en attente, réécrire avec C1 diag = 1,90, envoyer après le commentaire #147 · (b) Envoyer cette semaine avec une phrase ajoutée · (c) Attendre la v2 acceptée.
3. **Plan FOSDEM PYVZXW** — (a) Corriger avant le 16/11 (« réplication partielle ; ratio divisé par 2 avec la convention de l'original, trouvé après gel » : cas vertueux du talk) · (b) Retirer · (c) Laisser.
4. **Note méthodo : catégorie et revue (B22)** — (a) cs.DL primaire, stat.ME croisé, puis JOTE ; endossement demandé cette semaine · (b) cs.LG puis JOTE · (c) ReScience editorial sans arXiv.
5. **Corrections publiques (B23, B10)** — (a) Une PR `.github` + une PR nerve-wml cette semaine + note « superseded » Zenodo par le PI · (b) Tout corriger avec la v2 ReScience · (c) Profil seulement.
6. **NH-03** — (a) Section de la note méthodo, sans nouveau run · (b) Note courte séparée T1 2027 · (c) Rien avant 2027.
7. **NH-81 (M12 ; R ≤ 1 par construction)** — (a) Clore par erratum, statut unifié main/PR #19/GB300, pas de run KXKM le 04/11 · (b) Lancer KXKM puis décider · (c) Garder la note courte.
8. **Porte N10-C-bis (B6, covariance de graine)** — (a) 3 graines appariées, ou abandon de bis au profit de N10-D corrigé · (b) 1 graine avec taux d'erreur 8 %/24 % écrits dans la préreg · (c) Geler bis tel quel.
9. **bouba_sens K1/K3 Me6 (B16, B17)** — (a) Rien avant un amendement v0.7.1 tagué (k_steps, porte de manipulation, H0 sur résidus, contrôle 2 de #66 refait) · (b) Lancer K1/K3 maintenant · (c) Arrêter bouba_sens après la note.
10. **Scénario du trimestre** — (a) Médian ≈ 128 h · (b) Conservateur ≈ 95 h · (c) Ambitieux ≈ 185 h.
11. **Citations .tex vs .md (dream-of-kiki)** — (a) Porter les citations Rome/unlearning de #87 dans `build/full-draft.tex` et Paper 2 maintenant · (b) Attendre la refonte de Paper 1 · (c) Abandonner la .tex au profit du .md.
## §8 Provenance et limites

- **Session** electron-94, Claude Fable 5.1, GrosMac, 2026-11-01 18:04 → 19:05 CET (brouillon v1). Scratchpad `43b1fc75…`. Clones frais `--depth 200` des 11 dépôts `hypneum-lab` (SHA en tête de chaque inventaire).
- **Agents** : 7 relectures `general-purpose` Opus (dream-of-kiki 19 min, nerve-wml 27 min, kiki-flow 26 min, micro-kiki + quantum 21 min, bouba_sens 29 min, baby-brain 16 min, rescience + méthodo 26 min) ; veille par thèse Opus 42 min ; revue de fond par axe Opus 27 min + complément 20 min ; utilité Opus 7 min ; synthèse §1-4 Opus 18 min ; relevé calcul Sonnet 1 min. Total ≈ 3,3 M tokens d'agents.
- **Codex gpt-6.1-sol, passe aveugle** (xhigh, `--search`) lancée 18:06 sur les clones ; rapport `codex/report-sol.md` en cours d'écriture au moment de ce brouillon (≈ 16 500 mots) : **le croisement avec nos constats sera ajouté en §2 après vérification source par source**. Passe croisée gpt-6-astra sur ce rapport : à lancer.
- **Vérification à la source par la session principale** : 24 constats ouverts et relus dans les clones (`synthese/verification.md`) : 20 CONFIRMÉ, 1 PLAUSIBLE (λ̂ artefact), 3 retenus sur la foi de l'agent. Six identifiants arXiv de la veille revérifiés par leurs pages abs. Profil `.github` lu en ligne.
- **Non vérifiable ici** : chiffres du papier d'atelier kiki-flow (aucun artefact) ; venues de ≈ 20 références ; OpenReview (403 sur `/notes`) ; 8 antériorités en résumé seul (paywall) ; réplication ARM ; textes intégraux des papiers de Rome au-delà de 3-4 par dépôt ; données du run 2 N10-C.
- **Incidents** : un agent a mis l'adresse du PI dans un User-Agent arXiv (une fois, non répété) ; arXiv a renvoyé 429 pendant ≈ 20 min (43 requêtes de découverte perdues) ; Semantic Scholar 429 et OpenAlex quota épuisé → pas de comptes de citations. Le classificateur de permissions a refusé la décharge des LaunchAgents embed/rerank sur macM1 (commande donnée au PI).
- **Hors rapport, faits pendant la session** : cron GB300 macM1 vérifié (passe 18:20 : rsync 0/0) ; décision PI « laisser » le runner N10-C ; dépôt privé `hypneum-lab/library` en cours de constitution.
