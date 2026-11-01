# nerve-wml — vérification des références (Paper 1 + supplément CKNNA)

Clone `nerve-wml` à `fee6aba` (2026-10-31 22:58). Sources : `papers/paper1/refs.bib` (34 entrées), `papers/paper1/supplementary/cknna-n-dependence-replication/refs.bib` (7 entrées) = **41 entrées** (4 doublons de clé entre les deux fichiers, comptés deux fois car vérifiés dans les deux).

Résolution (2026-11-01, 18:15–19:20 CET) :
- Semantic Scholar en lot via `~/.claude/skills/semantic-scholar/scripts/s2.py lookup` (41 identifiants, un appel, un 429 absorbé par le backoff) → `work-nerve/s2_lookup.tsv`.
- arXiv export API `id_list` groupé (32 id, puis 2 id), 3 s entre appels → auteurs, dates, résumés.
- Crossref `works/<doi>` (19 DOI) et `works?query.title=…&query.author=…` (2 recherches) ; Europe PMC (résumés Bastos 2012/2020, texte intégral PMC11045951 de Lee et al. 2024).
- Texte intégral lu pour les références porteuses : arXiv HTML 2602.14486 (Gröger et al.), 2405.07987 (Huh et al.), PDF 2209.15430 (Moschella et al., `pdftotext`), 2609.32605 (Agliari et al., Rome).
- Échecs : OpenAlex (quota journalier épuisé, « $0 remaining »), recherche S2 (429 puis repli OpenAlex bloqué), DBLP (HTTP 202 sans JSON), OpenReview (403 « challenge »). Les trois entrées concernées sont marquées « introuvable par API », pas « inexistante ».

Statuts : **OK** ; **OK (forme)** = existe, contenu juste, défaut bibtex mineur ; **auteurs faux** ; **mauvaise attribution** = le texte du papier attribue une affirmation absente ou contraire ; **attribution douteuse** = affirmation non trouvée dans ce qui a été lu, ou partiellement inexacte ; **introuvable par API**.

## Table — Paper 1 (`papers/paper1/refs.bib`, cité dans `main.tex`)

| # | clé | résolu | statut | note |
|---|---|---|---|---|
| 1 | bastos2012canonical | DOI 10.1016/j.neuron.2012.10.038 (Neuron 76(4) 695-711, Bastos, Usrey, Adams, Mangun, Fries, Friston) | **mauvaise attribution** | Métadonnées exactes. `main.tex:74` attribue « predictions → γ superficiel, errors → θ/α profond ». C'est l'inverse du microcircuit canonique (erreurs vers l'avant en γ superficiel, prédictions vers l'arrière en α/β profond). Le résumé (Europe PMC) ne donne pas les bandes ; l'inversion est établie par le résumé de Bastos 2020 (ligne 21) et par `main.tex:76-78` lui-même. Aucun θ chez Bastos. |
| 2 | rao1999predictive | DOI 10.1038/4580 (Nat. Neurosci. 2(1) 79-87) | OK | |
| 3 | vandenoord2017neural | arXiv:1711.00937 (NeurIPS 2017) | OK | |
| 4 | neftci2019surrogate | DOI 10.1109/MSP.2019.2931595 ; arXiv:1901.09948 | OK | |
| 5 | zeghidour2022soundstream | DOI 10.1109/TASLP.2021.3129994 (IEEE/ACM TASLP 30, 495-507, 2022) ; arXiv:2107.03312 | OK (forme) | `@inproceedings` avec une revue en `booktitle`. Remplacement des codes morts : présent dans SoundStream (texte non relu ici) ; le terme « rotation » est celui du dépôt, pas du papier. Antériorité de la technique (redémarrages aléatoires, Jukebox 2020) non citée. |
| 6 | kornblith2019similarity | arXiv:1905.00414 (ICML 2019) | OK | |
| 7 | morcos2018insights | arXiv:1806.05759 (NeurIPS 2018) | OK | |
| 8 | moschella2022relative | arXiv:2209.15430 (ICLR 2023) | OK (citation interne inexacte) | `main.tex:99` : « Table 5 … stitch accuracy 4.69 % vs 84.46 % CIFAR-100 ». Les chiffres existent (PDF, l. 551) mais dans la **Table 6**, en **F1 pondéré**, décodeur vit-base-resnet50-384 / encodeur vit-base-patch16-224. Figure 7 « VQ laissée à de futurs travaux » : exact (PDF l. 231, 987-990). |
| 9 | saxe2024universality | DOI 10.1101/2024.12.26.629294 | **auteurs faux** | Le preprint est de **Hosseini, Casto, Zaslavsky, Conwell, Richardson, Fedorenko** (Crossref). Aucun Saxe. « Saxe et al. » dans `main.tex:99,140` est donc faux. La méthode « corrélation de Pearson des RDM » n'est pas dans le résumé. |
| 10 | hinton2015distilling | arXiv:1503.02531 | OK | |
| 11 | huh2024platonic | arXiv:2405.07987 (ICML 2024) | **attribution douteuse** | `main.tex:99,443-445` : « 0.15–0.25 for cross-modality pairs (e.g. DINOv2 vs CLIP) ». DINOv2 et CLIP sont **deux modèles de vision** dans Huh et al. (texte HTML : liste des modèles de vision) ; ce n'est pas une paire inter-modalités. La plage numérique n'apparaît que dans des figures, non vérifiable par texte. |
| 12 | liu2021dvnc | arXiv:2107.02367 (NeurIPS 2021) | OK | « compositional » vs « systematic generalization » : nuance acceptable. |
| 13 | aristotelianprh2026 | arXiv:2602.14486 (Gröger, Wen, Brbić) | **mauvaise attribution** (partielle) | Métadonnées exactes. OK pour `main.tex:459` (calibration, survie du local). Faux pour `main.tex:709-712` (et ADR-0002 l. 20-24) : le papier ne dit pas que l'alignement est « training-dependent… when substrates share a task, data, objective » ; il dit le contraire (convergence de voisinages locaux pour des réseaux « trained with different objectives on different data and modalities », HTML §1). Faux pour `main.tex:964` : CKNNA est introduit par **Huh et al.** (HTML 2405.07987, App. A), pas par Gröger et al. Prop. 4.1 et 4.2 existent (HTML) ; la 4.2 donne un nul de voisinage en k/n. |
| 14 | royvetterli2007erank | non résolu (EUSIPCO 2007, sans DOI ; Crossref : aucun hit titre+auteur) | **introuvable par API** | Existence probable, non établie par API. De mémoire (non vérifié) : Roy & Vetterli normalisent par σ_i/Σσ_j, alors que `main.tex:1029-1030` utilise σ_i²/Σσ_j². À relire. |
| 15 | wei2024differank | arXiv:2410.10672 → **Li, Xia, Chang, Wu**, « Matrix Nuclear-Norm » (EMNLP) | **mauvaise attribution** | Entrée hybride : auteurs et note de **Diff-eRank (arXiv:2401.17139, Wei, Tan, Li, Wang, Huang, NeurIPS 2024)**, titre et eprint d'un autre papier. Le texte (`main.tex:1032`) veut Diff-eRank : corriger l'eprint et le titre. |
| 16 | peng2025gridlikevq | arXiv:2510.16039 (Peng, Dong, Wu) | OK (forme) | Résumé : « Grid-like Code Quantization… compressing observation-action sequences… attractor dynamics » = `main.tex:95` exact. Auteurs « Peng and others » ; venue NeurIPS 2025 non confirmée par arXiv (pas de journal_ref). |
| 17 | zhao2025channelawarevq | arXiv:2510.18604 | **auteurs faux** | Premier auteur **Zian Meng** (Meng, Li, Tang, Yan, Ge), pas « Zhao ». Contenu (`main.tex:95`) exact. |
| 18 | pedersen2024nir | DOI 10.1038/s41467-024-52259-9 (Nat. Commun. 15, 8122) | **auteurs faux** (partiel) | Crossref : 15 auteurs. Le bib écrit « Jobst, **Marcel** » (Matthias), « **Manna**, Sadasivan » (Shankar), ajoute « **Bilén, Sven** » (absent) et omet **Terrence C. Stewart**. Contenu exact. |
| 19 | aer2025biohybrid | arXiv:2501.09128 (Mayr, George, Tambaro, Indiveri) | OK | Coquille « Adress » reprise du titre arXiv. |
| 20 | platoscave2026 | arXiv:2604.18572 | OK | `main.tex:454-456` conforme au résumé. |
| 21 | bastos2020routing | DOI 10.1073/pnas.2014868117 (PNAS 117(49) 31459-31469) | **attribution douteuse** (usage inversé) | `main.tex:76-78` est fidèle. Mais `main.tex:89-93,176-180` en tire la correspondance π→γ, ε→θ. Le résumé dit : stimuli imprévus (erreurs) → γ en avant via couches superficielles ; prédictions → α/β. Pas de θ. Le protocole inverse donc la biologie qu'il revendique. |
| 22 | gabhart2025predictive | DOI 10.1016/j.tics.2025.01.012 (TiCS 29(7) 627-640) | OK | Résumé non lu (Crossref n'en a pas) ; usage générique. |
| 23 | ruffini2025comparator | DOI 10.1162/neco.a.1537 (Neural Comput. 38(8) 1299-1343, 2026) | **attribution douteuse** | Le résumé parle de couplage signal-enveloppe et enveloppe-enveloppe dans un modèle laminaire ; **aucun θ**. « realises cross-frequency γ/θ coupling » (`main.tex:83`) n'est pas soutenu par le résumé (texte intégral non lu). Clé « 2025 » pour une publication 2026 (préprint 2025 cité en note : OK). |
| 24 | liu2024hybrid | DOI 10.1093/nsr/nwae066 (NSR 11(5), 2024) | OK (attribution non vérifiée) | Revue HNN conforme. « taxonomie couplage fort/faible » et « co-entraînement sur matériel dédié » (`main.tex:97`) non présents dans le résumé ; texte intégral non lu. |
| 25 | kim2026crossfreqbursts | DOI 10.64898/2026.04.30.721821 (bioRxiv) | OK | Résumé (MFOP, IRP) conforme à `main.tex:85-88`. |
| 26 | shang2026displacement | arXiv:2609.24209 | OK | Conforme au résumé. |
| 27 | you2026structure | arXiv:2609.27252 | OK | Conforme. |
| 28 | xiao2026kope | arXiv:2604.07904 | OK (forme) | ICML 2026 non confirmé (pas de journal_ref). |
| 29 | dai2026wonn | arXiv:2605.20922 | OK | |
| 30 | nunley2026kuramotoattn | arXiv:2606.11585 | OK | |
| 31 | ndri2026pclplus | arXiv:2605.12732 | OK | |
| 32 | karlsson2026diffpc | OpenReview iu9dbz2lB9 (403), aucun hit arXiv titre exact | **introuvable par API** | Existence non établie ; à vérifier à la main avant soumission. |
| 33 | vock2026adaptivesoc | arXiv:2608.28431 | OK | Conforme (`main.tex:1088-1094`). |
| 34 | keshavarzi2026mipolarity | DOI 10.64898/2026.06.05.730524 | OK | Conforme (`main.tex:1096-1100`). |

## Table — supplément CKNNA (`supplementary/cknna-n-dependence-replication/refs.bib`)

| # | clé | résolu | statut | note |
|---|---|---|---|---|
| 35 | huh2024platonic | arXiv:2405.07987 | OK | |
| 36 | platoscave2026 | arXiv:2604.18572 | OK | |
| 37 | aristotelianprh2026 | arXiv:2602.14486 | **auteurs faux** | « Gröger, **Friedrich** », « Wen, **Yiren** » ; les vrais prénoms sont Fabian et Shuo (arXiv, et le bib principal les a justes). Prop. 4.1/4.2 : présentes. |
| 38 | kornblith2019similarity | arXiv:1905.00414 | OK | |
| 39 | song2012featureselection | non résolu (Crossref renvoie Song et al. ICML 2007, pas JMLR 2012) | **introuvable par API** | De plus **jamais cité** dans `supplementary.md` (0 occurrence) ; type `@inproceedings` avec une revue en `booktitle`. À retirer. |
| 40 | royvetterli2007erank | idem #14 | **introuvable par API** | |
| 41 | wei2024differank | idem #15 | **mauvaise attribution** | |

## Comptes

- **41 entrées** : **26 OK** (dont 5 « OK (forme) » ou « citation interne inexacte » : #5, #8, #16, #28 et #24 non vérifié au-delà du résumé) ; **15 KO** :
  - auteurs faux : **5** (#9 saxe→Hosseini, #17 zhao→Meng, #18 NIR, #37 prénoms Gröger/Wen) — #9 compte comme faute de fond car le texte écrit « Saxe et al. » ;
  - mauvaise attribution : **4** (#1 Bastos 2012 inversé, #13 Gröger « training-dependent » et CKNNA, #15 et #41 Diff-eRank hybride) ;
  - attribution douteuse : **3** (#11 Huh « cross-modality DINOv2 vs CLIP », #21 Bastos 2020 usage inversé, #23 Ruffini γ/θ) ;
  - introuvable par API : **4** (#14, #32, #39, #40 ; #14 et #40 = même référence).
- En références distinctes (37 clés uniques) : 25 OK, 12 KO.
- Le README du papier annonce « 24/24 references resolved » (`papers/paper1/README.md:3`) : périmé (34 entrées) et faux sur le fond (résolution LaTeX ≠ vérification).

## Références manquantes évidentes (Paper 1)

- **Groupe de Rome (communication inter-modules discrète par attracteurs)** : arXiv:2609.32605 (Agliari, Alessandrelli, Barra, Fachechi 2026 : jeton = mélange masqué de motifs, décodé par dynamique d'attracteurs, dégradation douce sous corruption du canal) ; arXiv:2501.16789 = DOI 10.1016/j.neunet.2025.108181 (réseaux de réseaux hebbiens, intra hebbien / inter anti-hebbien) ; arXiv:2610.08612 (RBM modulaire entraînée par CD-1, point fixe avec borne de dérive) ; arXiv:2503.06274 (L-directional, reconstruction depuis des mélanges). Placement : `main.tex:95` (paragraphe codebooks discrets), `main.tex:133-149` (délimitation), Test (12) `main.tex:785-823` (canal discret robuste au bruit). Aucune n'est citée (grep sur tout le dépôt : 0 occurrence hors NH-01).
- **Communication émergente** : Foerster et al. 2016 (DIAL — pourtant un bras de N10-C), Lazaridou et al. 2017, Havrylov & Titov 2017, Lowe et al. 2019 (« pitfalls »), Kharitonov et al. 2019 (EGG). Non résolus par API ici (citation de mémoire = candidats, à résoudre avant ajout).
- **Model stitching** antérieur à Moschella : Lenc & Vedaldi 2015, Bansal, Nakkiran & Barak 2021 (candidats non résolus).
- **Rapport alignement ↔ entrée partagée** : Cui et al. 2022 (CKA élevé entre réseaux non entraînés sur mêmes entrées), signalé par la revue du 24/10 (R11) ; toujours absent.

## Dépôt nerve-wml hors Paper 1 (références vérifiées en passant)

| Référence | Où | Résolu | Statut |
|---|---|---|---|
| Lee, Dora, Mejias, Bohte, Pennartz 2024, Front. Comput. Neurosci. 18 | `track_w/bio_field_wml.py:6-7,190-200`, `docs/superpowers/plans/2026-05-19-bio-substrate-wml.md:1864-1880` | DOI 10.3389/fncom.2024.1338280 (Crossref, publié 2024-04-12) | **bonne référence, mécanisme faussement attribué** : le texte intégral (PMC11045951) ne contient ni « variational », ni « message passing », ni « belief », ni « Poisson » (0 occurrence) ; l'« Eq. 5 » de Lee est le courant synaptique I_j(t)=Σ W_ij X_i(t), pas un « résidu de taux de Poisson ». Les deux nouveautés réelles de SNN-PC (balayage gist rapide, neurones d'erreur positifs/négatifs séparés) ne sont pas implémentées. Ce n'est **pas** le survey N'dri et al. (arXiv:2409.05386, Neural Networks, Gebhardt… Ororbia) : la confusion signalée est bien absente. |
| Fachechi, Agliari, Barra 2019, Neural Networks 112, 24-40 ; arXiv:1810.12217 | `docs/milestones/2026-10-25-nh01-hopfield-dream-vs-downscale.md:98` | DOI 10.1016/j.neunet.2019.01.006 | OK |
| Hopfield, Feinstein, Palmer 1983, Nature 304, 158-159 | idem `:99` | DOI 10.1038/304158a0 | OK |
| Amit, Gutfreund, Sompolinsky 1985, PRL 55, 1530 | idem `:100` | DOI 10.1103/PhysRevLett.55.1530 | OK |
| Kanter, Sompolinsky 1987, PRA 35, 380 | idem `:101` | DOI 10.1103/PhysRevA.35.380 | OK |
| Tononi, Cirelli 2014, Neuron 81, 12-34 | idem `:102` | DOI 10.1016/j.neuron.2013.12.025 | OK |
| Crick, Mitchison 1983, Nature 304, 111-114 | **absent** du dépôt | DOI 10.1038/304111a0 | manquant (NH-01) |
| Agliari, Alemanno, Aquaro, Fachechi 2024, Neural Networks 177, 106389 (arXiv:2308.01421) | **absent** | DOI résolu | manquant (NH-01 : rêve = régularisation + arrêt précoce) |
| Albanese et al. 2026, arXiv:2605.10304 ; Barra et al. 2026, arXiv:2605.13721 | 2605.13721 cité « not re-verified » (`…downscale.md:103`) ; 2605.10304 absent | arXiv résolus | manquants / non lus (NH-01) |
