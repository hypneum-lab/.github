# Références — rescience-nh01 et paper-methodo-2026 (vérifiées le 2026-11-01)

Sources de résolution : Semantic Scholar via `s2.py lookup --tsv` (un lot de 35 identifiants, S2 + repli OpenAlex), Crossref `works/<doi>` (11 DOI, auteurs/volume/pages) et `works?query.bibliographic=` (8 requêtes), arXiv export API `id_list` (7 identifiants ; un second appel est revenu vide, voir « non vérifié »), texte intégral arXiv lu en PDF (`pdftotext`) pour 1810.12217, 2605.10304, 2308.01421, 2605.13721. Fichiers bruts : `scratchpad/work_rm/s2_batch1.tsv`, `arx1.xml`, `dl/*/p.txt`.

Statuts : OK / introuvable / mauvaise attribution / attribution douteuse / année-venue fausse / erreur d'auteur.

## A. rescience-nh01 — `article/bibliography.bib` (8 entrées, toutes citées dans `content.tex`)

| clé | DOI / arXiv résolu | statut | note |
|---|---|---|---|
| fachechi2019dreaming | 10.1016/j.neunet.2019.01.006 ; arXiv:1810.12217v1 | OK | Crossref : Neural Networks 112, 24–40, avril 2019, Fachechi/Agliari/Barra. Titre exact « forgetting spurious memories » (le brief écrit « forget »). Affirmations de `content.tex:3-41` vérifiées dans le texte intégral : noyau Éq. 2.1 (O:413-418), α_c ≈ 0,138 → ≈ 1,07 RS (O:802-806), Fig. 7 N = 5 000, M = 10, P/N ∈ {0,02 ; 0,08 ; 0,32}, t ∈ {0 ; 0,1 ; 1 ; 10 ; 100 ; 1 000} (O:964-968), Fig. 8 N ∈ {500 ; 1 000 ; 5 000} à α = 0,08 (O:990-993), champs Éq. 2.16 avec somme j = 1…N et mise à jour **parallèle** Éq. 2.17 (O:1065-1075), bassins N = 1 000, P = 50, flips de probabilité p, critère Mattis maximal, 200 × 200 (O:1099-1104, 1163-1164). |
| hopfield1983unlearning | 10.1038/304158a0 | OK | Nature 304(5922), 158–159, juil. 1983. |
| amit1985storing | 10.1103/PhysRevLett.55.1530 | OK | PRL 55(14), 1530–1533. α_c ≈ 0,138. |
| kanter1987projector | 10.1103/PhysRevA.35.380 | OK | PRA 35(1), 380–392. Règle du projecteur ; limite t → ∞ confirmée par O:432-434. |
| tononi2014shy | 10.1016/j.neuron.2013.12.025 | OK | Neuron 81(1), 12–34. SHY. |
| benedetti2024eigenvector | 10.1088/1742-5468/ad138e ; arXiv:2308.13445 | OK | JSTAT 2024(1) 013302. Résumé : désapprentissage hebbien décrit par l'évolution du spectre et des vecteurs propres — conforme à `content.tex:566-569`. Porte sur le désapprentissage itératif HFP, pas sur le noyau fermé. |
| serricchio2025daydreaming | 10.1016/j.neunet.2025.107216 ; arXiv:2405.08777 | **erreur d'auteur (MINEUR)** | Crossref et arXiv : **Ludovica** Serricchio ; le .bib écrit « Ludovico » (`bibliography.bib:65`). Affirmation (`content.tex:570-573`, random-features model) conforme au résumé. |
| lucibello2024exponential | 10.1103/PhysRevLett.132.077301 ; arXiv:2304.14964 | OK | PRL 132(7) 077301, 13 févr. 2024. Résumé : seuils α_1 (motif typique), α_c (tous les motifs), tailles de bassins — conforme à `content.tex:573-578`. |

**Comptes A : 8 entrées ; 8 existent ; 7 OK ; 1 erreur de prénom ; 0 mauvaise attribution.**

## B. Références manquantes pour rescience-nh01 (toutes résolues par API)

| référence | identifiant résolu | où la citer (`content.tex`) | rapport au résultat |
|---|---|---|---|
| Agliari, Alemanno, Barra, Fachechi, *Dreaming neural networks: rigorous results*, JSTAT 2019, 083503 | 10.1088/1742-5468/ab371d | Intro, l. 3-41 | même noyau, version rigoureuse ; attendue par tout rapporteur |
| Dotsenko, Yarunin, Dorotheyev, *Statistical mechanics of Hopfield-like neural networks with modified interactions*, J. Phys. A 24 (1991) 2419–2429 | 10.1088/0305-4470/24/10/026 | Intro / Original model, l. 69-79 | l'original dit que son modèle « strongly resembles » [27] = Dotsenko (O:510) ; antériorité de la famille (1 + tC)⁻¹ |
| Personnaz, Guyon, Dreyfus, J. Phys. Lett. 46 (1985) L359 | 10.1051/jphyslet:01985004608035900 | Original model | règle pseudo-inverse, citée par l'original (O:408) |
| Agliari, Alemanno, Aquaro, Fachechi, *Regularization, early-stopping and dreaming*, Neural Networks 177 (2024) 106389 ; arXiv:2308.01421 | 10.1016/j.neunet.2024.106389 | Original model l. 69-79 et contrôle l. 131-148 | **devance l'interprétation** : le noyau rêvé est exactement l'estimateur ridge/Tikhonov avec t_d = 1/ε_J (2308.01421 Éq. 3.4-3.5, l. 285-340 du texte) ; « capacité croissante de façon monotone en t_d » (l. 333) |
| Agliari et al., *Hebbian dreaming for small datasets*, Neural Networks 173 (2024) 106174 ; arXiv:2204.07954 | 10.1016/j.neunet.2024.106174 | Conclusion (perspective) | rêve = économie de données ; facultatif |
| Barra, Durante, Ladiana, Marra Solazzo, *Do Hopfield networks dream of stored patterns? (DLAM)*, arXiv:2605.13721 ; Neural Networks 206, 109729 | 10.1016/j.neunet.2026.109729 | Conclusion l. 551-552 et 566-569 | **devance** la phrase « spectral change, not a global downscaling » : « differentially attenuating high-eigenvalue interference modes » (résumé) et lien explicite à SHY (texte, l. 38-45 de la colonne droite) |
| Albanese, Alessandrelli, Barra, Franz, Ricci-Tersenghi, *Partial annealing and pattern decorrelation*, arXiv:2605.10304 | arXiv:2605.10304 | Conclusion l. 566-578 et corrélés l. 542-544 | second mécanisme vers α_c = 1 (les motifs évoluent, le noyau reste hebbien) ; sur motifs biaisés, bassins plus grands que le pseudo-inverse (texte, l. 994-1012) : nuance la phrase « projector limit's insensitivity to pattern correlations » |
| Marinari, Rossi, Zamponi, *Dreaming improves memorization in a Hopfield model with bounded synaptic strength*, arXiv:2603.09384 | arXiv:2603.09384 | contrôle l. 131-148 | rêve sous contrainte de force synaptique bornée : la question du « budget » déjà posée autrement ; cité dans la préreg pilote sans vérification (`prereg/…downscale.md:103`) |
| Crick, Mitchison, *The function of dream sleep*, Nature 304 (1983) 111–114 | 10.1038/304111a0 | Intro l. 3-6 | origine de « rêver = désapprendre » ; facultatif |
| Agliari et al., *Infinite volume limit … replica-symmetric regime*, arXiv:2409.10145 | arXiv:2409.10145 | Intro l. 37-39 | la théorie RS est une borne ; facultatif |
| Benedetti, Ventura, Marinari, Ruocco, Zamponi, J. Chem. Phys. 156 (2022) 104107 | 10.1063/5.0084219 | Conclusion | désapprentissage hebbien proche de l'optimum de rappel ; antériorité numérique |
| Plakhov, Semenov 1992 (RNNS/IEEE) | 10.1109/rnns.1992.268563 | Intro | désapprentissage modifié pour la capacité ; facultatif |

Candidat écarté : `arXiv:2112.06694` (que je croyais être Benedetti 2022) résout vers un article sans rapport (S2 : Cui et al., apprentissage fédéré) — **ne pas citer** ; la bonne référence est le DOI 10.1063/5.0084219 ci-dessus.

## C. paper-methodo-2026 — `paper/manuscript.md:79-88` (références inline)

| référence (texte) | identifiant résolu | statut | note |
|---|---|---|---|
| M. Vaccaro, *Preregistration for Experiments with AI Agents*, arXiv:2606.11217, ICML 2026 spotlight | arXiv:2606.11217v1 | OK | arXiv : commentaire « Accepted at ICML 2026 as a Spotlight (Top 5%) Position Paper » ; S2 indique la venue SSRN. Le résumé porte sur les expériences *avec* agents comme sujets : la distinction de `manuscript.md:18` est juste. Anomalie de métadonnée : date de publication arXiv 2026-05-03 pour un identifiant 2606 (non expliquée). |
| Fachechi, Agliari, Barra, arXiv:1810.12217, « journal reference à vérifier » | 10.1016/j.neunet.2019.01.006 | OK (à compléter) | Neural Networks 112, 24–40 (2019). |
| Kanter, Sompolinsky (1987), « exact citation à vérifier » | 10.1103/PhysRevA.35.380 | OK (à compléter) | PRA 35, 380–392. |
| Simmons, Nelson, Simonsohn (2011) | 10.1177/0956797611417632 | OK | Psychological Science. |
| Gelman, Loken (2013), *garden of forking paths* | pas d'identifiant (manuscrit) | à remplacer | citer Gelman & Loken, *The statistical crisis in science*, American Scientist 102 (2014), 10.1511/2014.111.460 (résolu S2/OpenAlex). |
| ReScience C, https://rescience.github.io/write/ | URL | non revérifiée ici | pas d'appel web hors API ; à citer avec Rougier et al. 2017 (10.7717/peerj-cs.142). |
| Journal of Trial and Error, appel général | URL | non revérifiée ici | aucun DOI d'éditorial trouvé (cf. plan v2:208). |
| OSF 10.17605/OSF.IO/Q6JYN, TPM5S ; Zenodo 23619954, 23636477, 19666755 ; 3 SWHID | DOI DataCite / SWHID | non revérifiés ici | identifiants internes du laboratoire ; à vérifier par l'API DataCite et SWH avant soumission. |
| MLRC 2026 (blog NeurIPS) | URL | non revérifiée ici | « à revérifier » dans le texte. |

**Comptes C : 9 lignes ; 4 résolues OK (dont 2 à compléter), 1 à remplacer (Gelman–Loken 2013 → 2014), 4 non revérifiées (URL/identifiants internes, hors périmètre API).**

## D. Références manquantes pour paper-methodo-2026 (résolues par API)

| référence | identifiant | section | pourquoi |
|---|---|---|---|
| Nosek et al., *The preregistration revolution*, PNAS 2018 | 10.1073/pnas.1708274114 | §2 | base |
| Chambers, *Registered reports* (Cortex 2013) | 10.1016/j.cortex.2012.12.016 | §2 | modèle à éditeur absent chez un solo |
| Scheel, Schijen, Lakens, AMPPS 2021 | 10.1177/25152459211007467 | §4/§7 | nuls au même rang |
| Pineau et al., JMLR 2021 (NeurIPS 2019 reproducibility) | arXiv:2003.12206 | §2 | checklist ML |
| van Miltenburg et al., *Preregistering NLP research*, NAACL 2021 | arXiv:2103.06944 | §2 | préreg computationnelle la plus proche |
| Rougier et al., *ReScience initiative*, PeerJ CS 2017 | 10.7717/peerj-cs.142 | §2 | réplication |
| Kapoor, Narayanan, *Leakage…*, Patterns 2023 | 10.1016/j.patter.2023.100804 | §7 | erreurs que la chaîne n'attrape pas |
| Lipton, Steinhardt, *Troubling trends*, 2018 | arXiv:1807.03341 | §1 | |
| Sandve et al., *Ten simple rules*, PLoS CB 2013 | 10.1371/journal.pcbi.1003285 | §3 | règles transférables |
| Peng, *Reproducible research in computational science*, Science 2011 | 10.1126/science.1213847 | §2 | |
| Forde, Paganini, *The scientific method in the science of ML*, 2019 | arXiv:1904.10922 | §2 | |
| Lu et al., *The AI Scientist*, 2024 | arXiv:2408.06292 | §1 | agents exécutants de recherche, même menace |
| Di Cosmo, Gruenpeter, Zacchiroli, MCSE 2020 | 10.1109/mcse.2019.2963148 | §3.1 | rev vs rel vs snp (l'erreur de SWHID typé tag) |

Le plan v2 (`docs/plan-2026-10-31-v2.md:181-204`) contient déjà 20 références résolues dont la plupart des lignes ci-dessus ; aucune n'est passée dans `manuscript.md`.

## Non vérifié / inaccessible

- Un second appel arXiv `id_list=2610.37139` (Cook et al., signalé par la revue du 30/10) est revenu vide deux fois (limitation de débit probable) : **existence non vérifiée par moi** ; ne pas citer sans résolution.
- URL ReScience, JOTE, MLRC et identifiants internes (OSF, Zenodo, SWHID du laboratoire) : non appelés.
- Texte intégral lu pour 4 papiers seulement (1810.12217, 2605.10304, 2308.01421, 2605.13721) ; les autres sur résumé.
