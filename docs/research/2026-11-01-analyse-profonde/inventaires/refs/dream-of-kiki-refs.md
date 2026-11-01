# Tableau des références — dream-of-kiki (Paper 1 : 84 entrées, Paper 2 : 25 entrées)

Clone `8a7e8468d2e81119646cf12179355b8cf9e1dc1c`. Fichiers : `docs/papers/paper1/references.bib` (84 `@`), `docs/papers/paper2/references.bib` (25 `@`).
Résolution 2026-11-01 : arXiv export API (`id_list`, 1 appel groupé, 32 identifiants ; + 2 appels à 3 s d'intervalle), Semantic Scholar via `s2.py lookup` (49 identifiants en 5 lots de 12 : le lot unique de 49 renvoyait HTTP 400), Crossref (`works/<doi>` et `query.bibliographic`, ~70 appels, quelques 429 rejoués), Europe PMC (13 requêtes), DataCite (2 DOI Zenodo). OpenAlex a répondu 429 et n'a pas servi.
Statuts : OK / introuvable / mauvaise attribution (auteur, titre ou venue faux sur un papier existant) / attribution douteuse (papier probablement identifié mais métadonnées divergentes, ou affirmation du texte non retrouvée dans la source) / année-venue fausse. « Orphelin » = entrée du .bib citée nulle part dans les manuscrits (`full-draft.md` et fichiers de section).

Note : la bibliographie effectivement rendue dans `build/full-draft.tex` (Paper 1) ne contient que **16** entrées (lignes 1413-1494) ; celle de Paper 2 en contient 15 (lignes 816-889). Les 84/25 entrées ne sont donc pas toutes dans les PDF.

## Paper 1 (84 entrées)

| # | clé | ligne .bib | identifiant résolu | statut | note |
|---|---|---|---|---|---|
| 1 | `crick1983function` | 5 | DOI 10.1038/304111a0 | OK | Crossref : Crick, Mitchison, Nature 304:111-114, 1983. Affirmation « reverse learning retire les attracteurs parasites » (full-draft.md:104-110) conforme. Ajout PR #87. |
| 2 | `diekelmann2010memory` | 15 | DOI 10.1038/nrn2762 | OK | NRN 11:114-126. Pas de DOI dans le .bib (MINEUR). |
| 3 | `fachechi2019dreaming` | 26 | DOI 10.1016/j.neunet.2019.01.006 ; arXiv:1810.12217 | OK | Neural Networks 112:24-40 (arXiv oct. 2018). « Noyau de rêve, capacité → α = 1 » conforme au résumé. La réplication « hypneum-lab/rescience-nh01 » citée (full-draft.md:110) n'est pas vérifiable ici. |
| 4 | `french1999catastrophic` | 37 | DOI 10.1016/s1364-6613(99)01294-2 | OK | TiCS 3:128-135. |
| 5 | `friston2010free` | 48 | DOI 10.1038/nrn2787 | OK | NRN 11:127-138. Le « sommeil = restructuration du modèle génératif » (full-draft.md:262-264) n'est pas dans ce papier (il vient de Hobson & Friston 2012) : attribution large. |
| 6 | `hobson2009rem` | 59 | DOI 10.1038/nrn2716 | OK | NRN 10:803-813. |
| 7 | `hopfield1983unlearning` | 71 | DOI 10.1038/304158a0 | OK | Crossref : Hopfield, Feinstein, Palmer, Nature 304:158-159. Conforme. Ajout PR #87. |
| 8 | `kirkpatrick2017overcoming` | 82 | DOI 10.1073/pnas.1611835114 ; arXiv:1612.00796 | OK | PNAS 114:3521-3526. Qualifier EWC de « SHY-adjacent » (full-draft.md:130) est une interprétation des auteurs, pas du papier. |
| 9 | `mccloskey1989catastrophic` | 96 | DOI 10.1016/s0079-7421(08)60536-8 | OK | Psychol. Learn. Motiv. 24:109-165. |
| 10 | `mcclelland1995complementary` | 108 | DOI 10.1037/0033-295x.102.3.419 | OK | Psychol. Rev. 102:419-457. |
| 11 | `rao1999predictive` | 123 | DOI 10.1038/4580 | OK | Nat. Neurosci. 2:79-87. |
| 12 | `rebuffi2017icarl` | 135 | DOI 10.1109/cvpr.2017.587 | OK | CVPR 2017 ; pages 2001-2010 (CVF) vs 5533-5542 (IEEE Xplore), les deux existent. |
| 13 | `shin2017continual` | 146 | arXiv:1705.08690 | OK | NeurIPS 2017 (pas de DOI). |
| 14 | `solms2021revising` | 156 | livre, sans DOI ; précis JCS 28(11):153 DOI 10.53765/20512201.28.11.153 | OK | Livre existant (Norton 2021) ; clé « revising » trompeuse. |
| 15 | `stickgold2005sleep` | 164 | DOI 10.1038/nature04286 | OK | Nature 437:1272-1278. |
| 16 | `tononi2014sleep` | 175 | DOI 10.1016/j.neuron.2013.12.025 | OK | Neuron 81:12-34. |
| 17 | `vandeven2020brain` | 188 | DOI 10.1038/s41467-020-17866-2 | mauvaise attribution | Co-auteur faux : le .bib et la bibliographie rendue (full-draft.tex:1480) donnent « Tuytelaars » ; Crossref : van de Ven, **Siegelmann**, Tolias. |
| 18 | `walker2004sleep` | 201 | DOI 10.1016/j.neuron.2004.08.031 | OK | Neuron 44:121-133. |
| 19 | `whittington2017approximation` | 212 | DOI 10.1162/neco_a_00949 | OK | Neural Comput. 29:1229-1262. |
| 20 | `phillips2010categorial` | 228 | DOI 10.1371/journal.pcbi.1000858 | OK | PLoS CB 6:e1000858. |
| 21 | `klinzing2019mechanisms` | 240 | DOI 10.1038/s41593-019-0467-3 | OK | Nat. Neurosci. 22:1598-1610. |
| 22 | `rasch2025sleep` | 252 | DOI 10.1152/physrev.00054.2024 | mauvaise attribution | Le papier existe mais par **Lutz, Harkotte, Born**, Physiol. Rev. **106:363-483 (2026)** ; le .bib dit Rasch & Born, 105:521-576, 2025 : auteurs, volume, pages et année faux. |
| 23 | `gavranovic2024fundamental` | 263 | arXiv:2403.13001 | OK | Thèse Strathclyde, S2 confirme. |
| 24 | `howie1995semigroup` | 274 | DOI 10.1093/oso/9780198511946.001.0001 | OK | Livre OUP 1995. **Orphelin** (cité nulle part dans les manuscrits ; seulement dans docs/proofs). |
| 25 | `lothaire1997combinatorics` | 283 | DOI 10.1017/cbo9780511566097 | OK | CUP 1997. **Orphelin**. |
| 26 | `pierce2002types` | 292 | livre MIT Press 2002, non résolu par API | OK | Non vérifié par API (pas de DOI) ; **orphelin**. |
| 27 | `huh2024platonic` | 299 | arXiv:2405.07987 | OK | ICML 2024 (S2). Résumé conforme à full-draft.md:1059,1084-1086. |
| 28 | `saillant2026nervewml` | 311 | DOI 10.5281/zenodo.19656342 (DataCite) | attribution douteuse | DOI concept ; DataCite le résout aujourd'hui vers **v1.10.0** (titre « nerve-wml v1.10.0 : Substrate-Agnostic Nerve Protocol… »), pas v1.9.0 ni le titre du .bib (« Working Memory Layer for predictive cognitive architectures »). Les chiffres v1.9.0 (full-draft.md:809-861) doivent citer le DOI de version. La .tex cite 19656354 comme « v1.1.2 » ; DataCite : v1.1.3. Auto-citation. |
| 29 | `pmc2025systems` | 331 | aucun identifiant | introuvable | Auteur « Anonymous », venue « PubMed Central (integrative review) », pas de DOI/PMID ; aucune correspondance Crossref ni Europe PMC. Cité background.md:17. |
| 30 | `trends2024coupled` | 343 | DOI 10.1016/j.tics.2024.02.002 | OK | Staresina 2024, TiCS 28:339-351 ; .bib met « Anonymous » (MINEUR). |
| 31 | `elife2025bayesian` | 353 | DOI 10.7554/elife.101992 | OK | Ng, Noh, Spencer 2025 ; titre .bib paraphrasé, auteur « Anonymous ». Chiffres de la note (23 études, 0.33) non vérifiés. |
| 32 | `neuron2025largeswr` | 365 | DOI 10.1016/j.neuron.2025.10.003 | OK | Robinson et al., Neuron 114 (en ligne 2025) ; titre .bib tronqué (« hippocampo-cortical … and consolidation » manquant), auteur « Anonymous ». |
| 33 | `npjscilearn2025clas` | 376 | DOI 10.1038/s41539-025-00383-6 | attribution douteuse | Jourde et al., npj Sci. Learn. 11 (**2026**) ; titre .bib différent (« heterogeneous … » non retrouvé). « Hétérogène et atténué par l'âge » (discussion.md:177-178) non vérifié au-delà du titre. |
| 34 | `commsbio2025emotional` | 386 | DOI 10.1038/s42003-025-07868-5 (probable) | attribution douteuse | Europe PMC : Yuksel et al. 2025, *Both slow wave and REM sleep contribute to emotional memory consolidation* ; titre .bib différent, auteur « Anonymous ». Correspondance par sujet/venue/année seulement. Note : ce papier trouve que la TMR en REM **dégrade** la mémoire émotionnelle. |
| 35 | `annurev2025replay` | 397 | DOI 10.1146/annurev-neuro-112723-024516 | attribution douteuse | Zhang, Ou, Liu 2025, ARN 48:65-84. Le chiffre « seuls ~10-30 % des ripples portent un contenu de rejeu » (discussion.md:170-171) n'est pas dans le résumé ; non vérifié. |
| 36 | `biorxiv2025rempfc` | 409 | DOI 10.1101/2025.09.15.676366 → eLife 10.7554/elife.110795 (probable) | attribution douteuse | Shin, Satchell, Miller, Jadhav ; titre .bib paraphrasé, « Anonymous ». **Orphelin**. |
| 37 | `kumaran2016cls` | 421 | DOI 10.1016/j.tics.2016.05.004 | OK | TiCS 20:512-534. **Orphelin**. |
| 38 | `spens2024generative` | 435 | DOI 10.1038/s41562-023-01799-z | OK | NHB 8:526-543. |
| 39 | `pnas2022dualstage` | 446 | aucun | introuvable | « Anonymous », PNAS 2022, titre *Hippocampus-cortex autonomous interaction…* : aucune correspondance Crossref ni Europe PMC (filtre PNAS 2021-2023). Cité background.md:119. |
| 40 | `vandeven2024clmonograph` | 459 | arXiv:2403.05175 | OK | Chapitre de *Learning and Memory: A Comprehensive Reference* (journal_ref arXiv). |
| 41 | `berkeley2025sleeptimecompute` | 472 | arXiv:2504.13171 | mauvaise attribution | Titre réel *Sleep-time Compute: Beyond Inference Scaling at Test-time*, Lin, Snell et al. ; .bib : autre titre, « Anonymous ». Chiffres 13-18 % et 5× conformes au résumé. |
| 42 | `alfarano2024wakesleep` | 486 | arXiv:2401.08623 | OK | Sorrenti et al. (clé « alfarano » sans rapport avec les auteurs) ; IEEE TNNLS selon S2. Année .bib 2023 (arXiv) vs 2024 (TNNLS) : MINEUR. |
| 43 | `robinson2022continual` | 499 | arXiv:2209.05245 | OK | Résumé conforme (NREM + REM + downscaling). |
| 44 | `arxiv2025statefulreplay` | 511 | arXiv:2511.17936 | mauvaise attribution | Titre réel *Mitigating Catastrophic Forgetting in Streaming Generative and Predictive Learning…*, auteur Wenzhang Du ; .bib : titre inventé, « Anonymous ». **Orphelin**. |
| 45 | `shenfeld2026selfdistil` | 523 | arXiv:2601.19897 | OK |  |
| 46 | `iclr2026lmsleep` | 539 | arXiv:2606.03979 | attribution douteuse | Existe (Behrouz et al.). Clé et note « ICLR 2026 » : non vérifié (lien OpenReview non résolu). « RL-based upward distillation with intentional forgetting » (introduction.md:96-98) : le résumé parle de distillation on-policy + RL et de « Dreaming », pas d'oubli intentionnel. |
| 47 | `hajizada2025clpsnn` | 554 | arXiv:2511.01553 | mauvaise attribution | Prénom faux (« Eldar » → Elvin) ; titre réel *Online Continual Learning on Intel Loihi 2 via a Co-designed SNN*. |
| 48 | `biorxiv2025thalamocortical` | 569 | DOI 10.1101/2025.06.25.661579 (probable) | attribution douteuse | Golden et al. 2025, *Interleaved Replay of Novel and Familiar Memory Traces During Slow-Wave Sleep…* ; titre .bib différent, « Anonymous ». |
| 49 | `seslr2025snnreplay` | 580 | arXiv:2507.02901 | mauvaise attribution | Titre réel *Online Continual Learning via SNNs with Sleep Enhanced Latent Replay*, Lin et al. ; .bib : titre reformulé, « Anonymous ». **Orphelin**. |
| 50 | `behrouz2024titans` | 592 | arXiv:2501.00663 | OK | « Google Research … 2 M tokens » conforme. |
| 51 | `mlxsnn2026` | 605 | arXiv:2603.03529 | mauvaise attribution | Titre réel *mlx-snn: Spiking Neural Networks on Apple Silicon via MLX*, Qin ; .bib « Anonymous ». **Orphelin**. |
| 52 | `braintransformers2024` | 619 | arXiv:2410.14687 | mauvaise attribution | Titre réel *BrainTransformers: SNN-LLM*, Tang & Zhu ; sous-titre .bib inventé. **Orphelin**. |
| 53 | `spinnaker2024` | 632 | arXiv:2401.04491 | mauvaise attribution | Titre réel *SpiNNaker2: A Large-Scale Neuromorphic System…*, Gonzalez et al. ; .bib « hybrid SNN/DNN platform », « Anonymous ». **Orphelin**. |
| 54 | `hu2020tmr` | 646 | DOI 10.1037/bul0000223 | OK | g = 0.29, NREM2 0.32, SWS 0.27 (methodology.md:22-24) conformes au résumé. Utiliser un g humain comme « plancher » d'un effet sur MLP est une transposition non justifiée. |
| 55 | `npjscilearn2024tmrupdate` | 659 | DOI 10.1038/s41539-024-00244-8 (probable) | attribution douteuse | Carbone & Diekelmann 2024 *An update on recent advances in TMR during sleep* ; titre .bib paraphrasé. **Orphelin**. |
| 56 | `medrxiv2025clasinsomnia` | 669 | DOI 10.1101/2025.03.04.25321710 | OK | Perrault et al. 2025 ; N = 27, crossover, SO accru sans bénéfice (discussion.md:157-162) conforme. .bib sans auteur ni ID (MINEUR). |
| 57 | `sharon2025alzdementia` | 680 | DOI 10.1002/alz.70247 | OK | Titre .bib abrégé. |
| 58 | `ajgp2024clashome` | 692 | aucun | introuvable | « Anonymous », AJGP 2024 : aucune correspondance Crossref ni Europe PMC. L'affirmation d'effet plancher (discussion.md:163-167) est donc sans source vérifiable. |
| 59 | `javadi2024sleeprestriction` | 703 | DOI 10.1016/j.neubiorev.2024.105929 | mauvaise attribution | Premier auteur **Crowley** (Crowley, Alderman, Javadi, Tamminen) ; g = 0.29 [0.13, 0.44] conforme. Utiliser l'effet d'une restriction de sommeil humaine comme « décrément attendu de P_min » (methodology.md:30-33) est une transposition sans fondement. |
| 60 | `robertson2025nrn` | 716 | DOI 10.1038/s41583-025-00973-8 | mauvaise attribution | Titre réel *Going offline to enhance memory during sleep*, NRN 26:660 (1 page) ; sous-titre .bib (« an active sleep state with diverse mechanisms ») inventé. |
| 61 | `cordi2021robust` | 727 | DOI 10.1016/j.conb.2020.06.002 | année-venue fausse | Venue fausse : **Current Opinion in Neurobiology 67:1-7**, pas *European Journal of Neuroscience*. |
| 62 | `natrevpsych2023methodology` | 739 | DOI 10.1038/s44159-023-00262-0 | OK | Németh et al. ; vol. 3 (2024), en ligne 2023 ; « Anonymous ». |
| 63 | `schreiner2024jneurosci` | 751 | DOI 10.1523/jneurosci.0022-24.2024 | mauvaise attribution | Premier auteur **Siefert** (Siefert, Uppuluri, Mu…), pas Schreiner (discussion.md:173 écrit « Schreiner et al. »). |
| 64 | `manoach2024schizophrenia` | 764 | DOI 10.1016/j.schres.2024.10.026 | mauvaise attribution | Auteurs Denis, Baran, Mylonas… (pas « {Manoach lab} ») ; titre légèrement différent. **Orphelin**. |
| 65 | `wamsley2020eszopiclone` | 776 | PMID 32919407 → Mylonas et al. 2020, Neuropsychopharmacology | mauvaise attribution | Le PMID cité désigne **Mylonas** et al. 2020 ; « Wamsley et al. 2020 » n'existe pas sous ce titre (Wamsley 2013 Sleep 36:1369 est l'essai pilote). **Orphelin**. |
| 66 | `aimeetsbrain2025` | 788 | arXiv:2512.23343 | mauvaise attribution | Titre réel *AI Meets Brain: Memory Systems from Cognitive Neuroscience to Autonomous Agents*, Liang et al. ; .bib : titre reformulé. **Orphelin**. |
| 67 | `liu2021dvnc` | 805 | arXiv:2107.02367 | OK | NeurIPS 2021 (S2). |
| 68 | `pedersen2024nir` | 817 | DOI 10.1038/s41467-024-52259-9 | OK | Nat. Commun. 15:8122. |
| 69 | `aer2025biohybrid` | 835 | arXiv:2501.09128 | OK | Mayr et al. ; coquille « Adress » d'origine. |
| 70 | `aristotelianprh2026` | 849 | arXiv:2602.14486 | OK | Résumé conforme à full-draft.md:1101-1105. |
| 71 | `platoscave2026` | 860 | arXiv:2604.18572 | OK | Résumé conforme à full-draft.md:1098-1101. |
| 72 | `bastos2020routing` | 872 | DOI 10.1073/pnas.2014868117 | OK | **Orphelin**. |
| 73 | `liu2024hybrid` | 884 | DOI 10.1093/nsr/nwae066 | OK |  |
| 74 | `zahn2026discoverydreaming` | 904 | arXiv:2607.16256 | OK | Existe ; résumé arXiv (version servie) conforme au +5.64 pp. Le contenu « v2 rétracte le titre jugé » (full-draft.md:1066) n'a pas été lu dans le texte v2 : non vérifié. |
| 75 | `bazhenov2026notjustafterone` | 921 | arXiv:2606.08447 | attribution douteuse | Le résumé dit « **partially** restore performance » ; full-draft.md:232-234 écrit « restores all of them, with most synapses weakened » — surinterprétation du résumé (le détail synaptique n'y figure pas). |
| 76 | `dey2026sharp` | 932 | arXiv:2606.00732 | OK |  |
| 77 | `zhang2026silentreplay` | 944 | arXiv:2609.31630 | OK | « matches offline rehearsal on split-MNIST » conforme (« matches or exceeds »). |
| 78 | `you2026prhstructure` | 954 | arXiv:2609.27252 | OK |  |
| 79 | `shi2026platotoaristotle` | 965 | arXiv:2610.20286 | OK |  |
| 80 | `shang2026displacement` | 977 | arXiv:2609.24209 | OK |  |
| 81 | `bangachev2026alignmentlinear` | 989 | arXiv:2605.28870 | OK |  |
| 82 | `zhang2026nremremreactivation` | 998 | DOI 10.64898/2026.08.04.742295 | OK | bioRxiv 2026 (Crossref + S2). |
| 83 | `chen2026onpolicyreplay` | 1011 | arXiv:2605.29495 | OK |  |
| 84 | `wang2026denserneqbetter` | 1022 | arXiv:2607.01763 | OK |  |

**Comptes Paper 1** : OK 56 ; mauvaise attribution 15 ; attribution douteuse 9 ; introuvable 3 ; année-venue fausse 1 ; orphelines 15.

## Paper 2 (25 entrées)

| # | clé | ligne .bib | identifiant résolu | statut | note |
|---|---|---|---|---|---|
| 1 | `alfarano2024wakesleep` | 7 | arXiv:2401.08623 | OK | Sorrenti et al. (clé « alfarano » sans rapport avec les auteurs) ; IEEE TNNLS selon S2. Année .bib 2023 (arXiv) vs 2024 (TNNLS) : MINEUR. |
| 2 | `calcagno2026dream2learn` | 21 | arXiv:2603.01935 | OK | S2 indique IJCV. |
| 3 | `diekelmann2010memory` | 41 | DOI 10.1038/nrn2762 | OK | NRN 11:114-126. Pas de DOI dans le .bib (MINEUR). **Orphelin**. |
| 4 | `french1999catastrophic` | 52 | DOI 10.1016/s1364-6613(99)01294-2 | OK | TiCS 3:128-135. **Orphelin**. |
| 5 | `friston2010free` | 63 | DOI 10.1038/nrn2787 | OK | NRN 11:127-138. Le « sommeil = restructuration du modèle génératif » (full-draft.md:262-264) n'est pas dans ce papier (il vient de Hobson & Friston 2012) : attribution large. |
| 6 | `hobson2009rem` | 74 | DOI 10.1038/nrn2716 | OK | NRN 10:803-813. |
| 7 | `kirkpatrick2017overcoming` | 86 | DOI 10.1073/pnas.1611835114 ; arXiv:1612.00796 | OK | PNAS 114:3521-3526. Qualifier EWC de « SHY-adjacent » (full-draft.md:130) est une interprétation des auteurs, pas du papier. |
| 8 | `mccloskey1989catastrophic` | 100 | DOI 10.1016/s0079-7421(08)60536-8 | OK | Psychol. Learn. Motiv. 24:109-165. **Orphelin**. |
| 9 | `mcclelland1995complementary` | 112 | DOI 10.1037/0033-295x.102.3.419 | OK | Psychol. Rev. 102:419-457. **Orphelin**. |
| 10 | `rebuffi2017icarl` | 127 | DOI 10.1109/cvpr.2017.587 | OK | CVPR 2017 ; pages 2001-2010 (CVF) vs 5533-5542 (IEEE Xplore), les deux existent. |
| 11 | `shin2017continual` | 138 | arXiv:1705.08690 | OK | NeurIPS 2017 (pas de DOI). |
| 12 | `solms2021revising` | 148 | livre, sans DOI ; précis JCS 28(11):153 DOI 10.53765/20512201.28.11.153 | OK | Livre existant (Norton 2021) ; clé « revising » trompeuse. |
| 13 | `stickgold2005sleep` | 156 | DOI 10.1038/nature04286 | OK | Nature 437:1272-1278. |
| 14 | `tononi2014sleep` | 167 | DOI 10.1016/j.neuron.2013.12.025 | OK | Neuron 81:12-34. |
| 15 | `vandeven2020brain` | 180 | DOI 10.1038/s41467-020-17866-2 | mauvaise attribution | Co-auteur faux : le .bib et la bibliographie rendue (full-draft.tex:1480) donnent « Tuytelaars » ; Crossref : van de Ven, **Siegelmann**, Tolias. |
| 16 | `walker2004sleep` | 193 | DOI 10.1016/j.neuron.2004.08.031 | OK | Neuron 44:121-133. |
| 17 | `mlx2023` | 206 | logiciel (github.com/ml-explore/mlx) | OK | Pas un article ; citation logicielle acceptable. |
| 18 | `virtanen2020scipy` | 213 | DOI 10.1038/s41592-019-0686-2 | OK | Nat. Methods 17:261-272. |
| 19 | `davies2018loihi` | 224 | DOI 10.1109/mm.2018.112130359 | OK | IEEE Micro 38:82-99. |
| 20 | `furber2014spinnaker` | 237 | DOI 10.1109/jproc.2014.2304638 | OK | Proc. IEEE 102:652-665. |
| 21 | `osf` | 248 | site web osf.io | OK | Pas un article. Paper 2 écrit « DOI pending » alors que Q6JYN existe (incohérence, pas d'erreur bib). |
| 22 | `recursivemas2026` | 255 | arXiv:2604.25917 | attribution douteuse | arXiv liste 11 auteurs, premier **Jiaru Zou**, sans « Xiyuan Yang » ; le .bib et S2 placent Yang en premier. Citer l'ordre arXiv. **Orphelin** dans Paper 2. |
| 23 | `zahn2026discoverydreaming` | 272 | arXiv:2607.16256 | OK | Existe ; résumé arXiv (version servie) conforme au +5.64 pp. Le contenu « v2 rétracte le titre jugé » (full-draft.md:1066) n'a pas été lu dans le texte v2 : non vérifié. |
| 24 | `hou2026cltransition` | 289 | arXiv:2608.06216 | OK |  |
| 25 | `zhang2026domainshortcut` | 302 | arXiv:2607.22994 | OK |  |

**Comptes Paper 2** : OK 23 ; mauvaise attribution 1 ; attribution douteuse 1 ; orphelines 5.
