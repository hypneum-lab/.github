# baby-brain — vérification des références (2026-11-01)

Source : `clones/baby-brain/docs/paper/references.bib` (30 entrées) et `2026-05-22-ontogenetic-wml-draft.md` (SHA 376fe83).
Les 30 clés du .bib sont toutes citées dans le brouillon, et le brouillon ne cite aucune clé absente du .bib (`comm` entre les clés `@…{` et les `[@…]`).
Il n'y a pas de référence inline hors .bib, sauf la « pluralité théorique » (§1, l.91-96) laissée volontairement sans source (l.671-676).

Résolution : `s2.py lookup` en un lot (30 identifiants, 2 réponses 429 puis succès, repli OpenAlex), plus l'API arXiv `id_list` (15 résumés lus en entier), plus Crossref pour Vong 2024 (volume, numéro, pages).
OpenReview (`api2.openreview.net` et `api.openreview.net`) a répondu `ChallengeRequiredError` 403 pour EaGbKYSNTf et QFw0sg52VV : ces deux identifiants ne sont **pas vérifiables** aujourd'hui.

## Comptes
- **OK : 24**
- **Année ou clé incohérente : 2** (jaegle2022perceiverio, oquab2024dinov2)
- **Attribution douteuse : 3** (bengio2009curriculum, feng2026childvox pour la venue, choshen2026babylm4 pour « EMNLP 2026 » dans le texte)
- **Non vérifiable : 1** (babycl2027openreview)
- **Introuvable : 0. Mauvaise attribution franche : 0.**

## Tableau

| clé | DOI/arXiv résolu | statut | note courte |
|---|---|---|---|
| orhan2024video | arXiv:2402.00300 (S2 : CogSci 2024) | OK | Le résumé dit : modèles vidéo SSL sur un enfant (6-31 mois), concepts d'action en few-shot, objets plus robustes qu'en image. Texte l.121-124 conforme. |
| vong2024grounded | 10.1126/science.adi1374 | OK | Crossref : Science 383(6682) 504-511, Vong, Wang, Orhan, Lake. Conforme. |
| aw2026zwm | arXiv:2604.10333 (9 auteurs) | OK | Résumé : prédicteur épars factorisé dans le temps, appris sur un seul enfant, « progressive, staged emergence ». Texte l.127-131 conforme. |
| lin2026egobabyvlm | arXiv:2605.19130 (22 auteurs) | OK | Machine-DevBench construit sur le vocabulaire d'entraînement ; les VLM dépendent de l'alignement serré. Conforme (l.140-147). |
| jiang2026babycl | arXiv:2606.05115 | OK | Passe chronologique unique sur SAYCam, double tampon de rejeu, budget apparié. Conforme (l.233-238). |
| bunzeck2026cds | arXiv:2606.01045 (S2 : CoNLL) | OK | Dissociation production/compréhension. Conforme (l.148-153). |
| feng2026childvox | arXiv:2605.29257 | attribution douteuse (venue) | Le contenu est conforme (plus de 20 sous-tâches, 17 jeux). Le `booktitle = Proceedings of EMNLP 2026` n'est confirmé ni par S2 (venue arXiv.org) ni par le résumé. |
| fukushima2026tutoring | arXiv:2606.19728 | OK | Fin du résumé : « stage-wise generalization, while the robot gradually required less tutor guidance ». Conforme (l.187-191). |
| vaculinova2026mimo | arXiv:2610.05997 | OK | Extension soignant de MIMo, contacts et vision à la première personne. Conforme. Nom : « Vaculínová » (diacritique absente, mineur). |
| zhang2026playful | arXiv:2606.19419 (20 auteurs) | OK | Jeu auto-dirigé > sans jeu et jeu aléatoire, en Code-as-Policy. Le texte signale bien la réserve (l.198-199). |
| achille2017critical | arXiv:1711.08856 | OK | Déficit précoce, information de Fisher qui monte puis baisse. Conforme (l.215-218). |
| bengio2009curriculum | 10.1145/1553374.1553380 | attribution douteuse | Entrée exacte. Le texte l.137-139 lui attribue un ordonnancement « par jalon développemental » : Bengio et al. ordonnent par difficulté (motivation par analogie humaine). À reformuler. |
| oudeyer2007intrinsic | 10.3389/neuro.12.006.2007 | OK | Typologie de la motivation intrinsèque. Le tracker de progrès d'apprentissage de §3.4 vient plutôt d'Oudeyer, Kaplan & Hafner 2007 (IEEE TEC, non cité, voir « manquantes »). |
| friston2017active | 10.1162/NECO_a_00912 | OK | Conforme. |
| rao1999predictive | 10.1038/4580 | OK | Conforme. |
| bastos2012canonical | 10.1016/j.neuron.2012.10.038 | OK | Conforme (coordination par fréquence). |
| assran2023ijepa | arXiv:2301.08243 (CVPR 2023) | OK | Conforme. Le .bib met « arXiv preprint » alors que la version publiée est CVPR 2023 (mineur). |
| hensch2005critical | 10.1038/nrn1787 | OK | Conforme. |
| pawlak2025critical | arXiv:2510.09687 | OK | Résumé : le déficit peut être évité par un taux d'apprentissage cyclique. Conforme (l.218-221). |
| mashour2020workspace | 10.1016/j.neuron.2020.01.026 | OK | Conforme. |
| kirkpatrick2017overcoming | 10.1073/pnas.1611835114 | OK | PNAS 114(13), 2017 (S2 met 2016, date de mise en ligne). Utilisé pour définir l'oubli catastrophique : l'antériorité est McCloskey & Cohen 1989 (manquante). |
| yang2026dataefficient | arXiv:2609.10702 (16 auteurs) | OK | 10 M mots, 100 M présentations cumulées, « compact restatements, budget reinvestment ». Conforme (l.162-166). Le résumé dit que le programme a été conduit par un agent autonome (« Qiushi Engine ») : à signaler au lecteur. |
| choshen2026babylm4 | arXiv:2602.20092 | OK (entrée) ; attribution douteuse (texte) | Le résumé ne nomme pas EMNLP ; « fourth round at EMNLP 2026 » (l.173) n'est pas soutenu par la source citée. |
| shah2026foundation | arXiv:2608.07812 | OK | Cadre en quatre étapes, contraste entre modèles. Conforme (l.176-181). |
| babycl2027openreview | OpenReview EaGbKYSNTf | non vérifiable | API OpenReview : défi anti-robot 403. Le texte (l.240-249) reconnaît déjà ne connaître que le titre. |
| jaegle2022perceiverio | arXiv:2107.14795 (S2 : ICLR) | année/clé incohérente | Clé « 2022 », champ `year = 2021`, publié ICLR 2022. Harmoniser. |
| hsu2021hubert | arXiv:2106.07447 (IEEE/ACM TASLP) | OK | Conforme. |
| oquab2024dinov2 | arXiv:2304.07193 (S2 : TMLR) | année/clé incohérente | Clé « 2024 », `year = 2023`, publié TMLR 2024. Harmoniser. |
| defossez2024moshi | arXiv:2410.00037 | OK | Mimi introduit avec Moshi : conforme. |
| efron1979bootstrap | 10.1214/aos/1176344552 | OK | Conforme. |

## Références manquantes (résolues par API aujourd'hui)

| référence | identifiant résolu | où et pourquoi |
|---|---|---|
| Wu, Dyer & Neyshabur, *When Do Curricula Work?* (ICLR 2021) | arXiv:2012.03107 (S2 : ICLR, 156 citations) | §2 « Curriculum », l.137-139 : antériorité directe de la question « un ordonnancement aide-t-il à budget égal ? ». Contenu non relu ici (l'API arXiv a renvoyé une réponse vide au second appel). |
| Elman 1993, *Learning and development in neural networks: the importance of starting small* | 10.1016/0010-0277(93)90058-4 | §1 l.82-86 et §2 « Critical periods » : antériorité historique de la thèse « structurer par stades aide ». |
| Rohde & Plaut 1999, *Language acquisition in the absence of explicit negative evidence: how important is starting small?* | 10.1016/S0010-0277(99)00031-1 | Même endroit : contre-résultat classique à Elman 1993 ; à citer à côté. |
| Dohare et al. 2024, *Loss of plasticity in deep continual learning* (Nature) | 10.1038/s41586-024-07711-7 | §2 « Critical periods and regulated plasticity » l.212-224 : la perte de plasticité est la littérature ML de référence pour « réguler la plasticité ». |
| Oudeyer, Kaplan & Hafner 2007, *Intrinsic Motivation Systems for Autonomous Mental Development* (IEEE TEC) | 10.1109/TEVC.2006.890271 | §3.4 l.410-414 : le tracker de progrès d'apprentissage (réduction d'erreur, insensible au bruit irréductible) est leur mécanisme. |
| McCloskey & Cohen 1989, *Catastrophic interference in connectionist networks* | 10.1016/S0079-7421(08)60536-8 | §2 l.230-232 : définition de l'oubli catastrophique. |
| Dupoux, LeCun & Malik 2026 | arXiv:2603.15381 | Signalé par la revue du 24/10 (§2.5) ; résolu ; non cité dans le brouillon. |
| Zhang et al. 2026, *Frozen in a Frame: The Velocity Blind Spot in JEPA World Models* | arXiv:2610.04585 | §2 « JEPA » l.207-210 ; résolu ; non cité. |
| Frank et al. 2026, *Scaling cross-situational word learning on children's naturalistic experiences* | arXiv:2610.31842 (12 auteurs, résumé lu) | §3.1 « Path-A vs Path-B » l.303-308 : représentations visuelles pré-entraînées sur Internet bien meilleures que l'apprentissage sur la seule vidéo développementale. Pèse contre Path-B ; **ne teste pas de stades**. |
| OpenReview QFw0sg52VV, *Rethinking Developmental Curricula for Contrastive Visual Learning* | non vérifiable (OpenReview 403 ; aucune version arXiv trouvée) | Si son contenu est celui qu'en rapporte la veille du 30/10, c'est l'antériorité la plus directe de Claim A. À vérifier depuis un navigateur. |

## Groupe de Rome (veille du 01/11)

Aucun des 21 identifiants de la veille n'est cité dans baby-brain (`grep -rniE "agliari|barra|fachechi|hopfield|crick|mitchison|alemanno"` sur docs/, README, ROADMAP, baby_brain/ : 0 occurrence).
Pour Claims A et B (gating de plasticité, perception active d'un transformeur), aucun papier de Rome n'est une antériorité ni un contre-résultat : ce sont des réseaux de Hopfield à couplages fixés.
Pour Claim C et E4 (rejeu onirique contre l'oubli), trois sont à citer, vérifiés aujourd'hui par S2 :
- Fachechi, Agliari & Barra, Neural Networks 112 (2019), 10.1016/j.neunet.2019.01.006 : origine du noyau de rêve ; à citer en §2 « Continual learning and replay » (l.230-239) et en §3.5 (l.435-437).
- Agliari, Alemanno, Aquaro & Fachechi, Neural Networks 177 (2024), 10.1016/j.neunet.2024.106389 : rêve = régularisation + early-stopping. D'après la veille, cela impose à E4 (l.554-565) un **contrôle ridge / early-stopping à budget égal** : sinon un effet de E4 ne distingue pas « rêve » de « régularisation ».
- Alemanno 2026, arXiv:2610.22191 (attention softmax = Hopfield exponentiel, généralisation contre mémorisation) : utile comme repère pour la mémoire épisodique top-K lue par cross-attention (§3.1 l.294-299). Impact faible.
