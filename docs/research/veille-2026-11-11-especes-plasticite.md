# Veille 2026-11-11 — comparaison entre espèces, plasticité, antériorité des candidates

Passe ponctuelle faite en séance le 11/11 (phase de relecture et de planification, aucune décision). Elle part d'une comparaison pieuvre / humain, l'étend à d'autres lignées, en tire des hypothèses candidates, puis cherche ce qui est déjà publié. Aucun calcul lancé, aucune préreg touchée, aucune hypothèse inscrite au catalogue.

## En-tête

- **Canal** : recherche web généraliste, environ 45 requêtes, puis ouverture des pages. Pas d'API arXiv ni Crossref pendant la passe ; les identifiants de ce fichier sont à passer par `scripts/resolve_ids.py` (résultat en fin de fichier).
- **Niveaux de lecture**, à lire strictement :
  - `résumé` : notice ou page de résumé seulement ;
  - `extraction` : le texte de l'article a été passé à un extracteur automatique avec des questions ciblées, sur la portion indiquée. Ce n'est **pas** une lecture ligne à ligne et cela ne vaut pas « texte intégral lu » au sens du verrou ;
  - `presse` : communiqué ou article de vulgarisation, l'article n'a pas été ouvert ;
  - `titre` : vu dans une liste de résultats, non ouvert.
- **Tout est « à recouper »** avant d'entrer dans une note de lecture. Aucune ligne ne vaut pièce du verrou.
- **Dédup** : non faite contre les veilles précédentes. Déjà présents dans les dépôts (vérifié par recherche de texte le 11/11) : Serricchio et al., Fachechi et al., Lowe et al. 2019, IC3Net, Dohare et al., Lyle et al., Behrouz et al. 2026. Absents : van Laarhoven 2017, Shomrat et al. 2011, Guo et al. 2017, Hou et al. (arXiv:2511.02192).

## 1. Biologie comparée

| Référence | Ce que la source établit | Niveau |
|---|---|---|
| Sumbre et al. 2001, Science 293:1845 | bras de pieuvre sectionné du cerveau : extension à cinématique normale sur stimulation ; programme moteur dans le bras | résumé |
| Zullo et al. 2009, Curr. Biol. 19:1632 | microstimulation des lobes basaux : aucun site ne bouge un seul bras ; pas de carte somatotopique | résumé |
| Gutnick et al. 2011, Curr. Biol. 21:460 | la pieuvre guide un bras seul vers une cible vue (labyrinthe à 3 choix) | résumé |
| Gutnick et al. 2020, Curr. Biol. 30:4322 | apprentissage qui dépend du toucher et de la proprioception d'un seul bras | résumé |
| 10.7554/eLife.84257, Bidel et al. 2023 | lobe vertical : 1,8 M d'axones entrants, 22,3 M d'interneurones simples (divergence 1:12, une entrée chacun), 65 000 neurones de sortie ; LTP à la première synapse ; réseau à sens unique | extraction, 0–100 000 caractères sur 280 765 |
| Olson, Schulz, Ragsdale 2025, Nat. Commun. (PMC11736069) | cordon nerveux du bras segmenté, environ 7,5 segments par ventouse, carte de chaque ventouse | extraction, 0–100 000 sur 101 916 |
| Shomrat et al. 2011, Curr. Biol. 21:1773 (PMID 22018541) | pieuvre et seiche : même réseau divergent puis convergent, plasticité à deux couches différentes, même calcul parce que la couche intermédiaire est linéaire | résumé |
| 10.1038/s41586-023-06203-4, Pophale et al. 2023 | pieuvre : sommeil actif d'environ 1 min toutes les heures, seuil d'éveil relevé, rebond ; ondes de type fuseau en sommeil calme | presse (article bloqué) |
| Birk et al. 2023, Cell | édition d'ARN selon la température : environ un tiers de plus de 60 000 sites, en moins d'un jour | presse |
| Nath et al. 2017, Curr. Biol. | méduse Cassiopea sans cerveau : 58 → 39 pulsations/min la nuit, réponse retardée, rebond | presse |
| Suppermpool et al. 2024, Nature 629:639 (PMID 38693264) | poisson-zèbre : synapses gagnées à l'éveil, perdues au sommeil, surtout sous forte pression de sommeil, peu en seconde moitié de nuit | résumé |
| Zwaka et al. 2015, Curr. Biol. (PMID 26592345) | abeille : odeur de contexte représentée en sommeil profond améliore la mémoire ; ni à l'éveil ni avec une odeur nouvelle | résumé |
| 10.1038/nature03275, Derégnaucourt et al. 2005 | diamant mandarin : chant dégradé après la nuit, et plus il se dégrade meilleure est l'imitation finale | résumé |
| Dave, Margoliash 2000, Science | neurones moteurs du chant : rejeu en sommeil | résumé |
| Olkowicz et al. 2016, PNAS (PMID 27298365) | perroquets et oiseaux chanteurs : deux fois plus de neurones que les primates à masse égale | résumé |
| 10.1038/s41586-024-07126-4, Bridges et al. 2024 | bourdon : tâche à deux étapes jamais résolue seul en 24 jours, apprise par environ un tiers des observateurs | résumé |
| 10.1038/26216, Clayton, Dickinson 1998 ; 10.1038/nature05575, Raby et al. 2007 | geai : mémoire du quoi, où, quand ; caches en prévision de la faim du lendemain | notice tierce ; presse |
| Perry, Barron 2013, PNAS (PMID 24191024) | abeille : quitte les essais difficiles, transfère à une tâche nouvelle ; explication associative non exclue | résumé |
| Dong et al. 2023, Science | abeille : sans danseuses expérimentées, erreurs d'angle corrigibles et erreur de distance à vie | presse |
| 10.1038/s41467-024-47221-8, Sharma et al. 2024 | cachalot : 8 719 codas, rythme × tempo × rubato × ornement, au moins 143 combinaisons ; rien sur le sens | extraction, 0–100 000 |
| Bell, Han, Sawtell 2008, Annu. Rev. Neurosci. | poisson électrique : « image négative » de l'entrée auto-produite, par plasticité anti-hebbienne | extraction |
| 10.1038/nature14045, Mischiati et al. 2015 | libellule : interception par modèles internes, vision pour l'imprévu | résumé |
| Litwin-Kumar et al. 2017, Neuron (PMC5379477) | connectivité clairsemée optimale pour la dimension d'une expansion, sauf si les synapses d'entrée sont plastiques | résumé |
| Rößler et al. 2022, PNAS ; Mascetti 2016, Nat. Sci. Sleep | araignée sauteuse (sommeil de type paradoxal) ; sommeil d'un seul hémisphère | titre |

## 2. Antériorité des candidates

Les candidates (C1 à C8 du 10/11 ; P1 à P4, A1 à A5, K1 à K5 du 11/11) ne sont pas inscrites. Verdict provisoire, au niveau de lecture indiqué.

| Référence | Candidate | Ce que la source établit | Niveau |
|---|---|---|---|
| arXiv:2407.01800, Lyle et al. 2024 | C1, A1 | une normalisation rend invariant à l'échelle le sous-réseau qui la précède : f(cθ) = f(θ), pas effectif en 1/‖θ‖² ; projection **continue** à norme fixe (NaP) ; essais langage sur un transformeur de 400 M ; pas de remise à l'échelle ponctuelle testée | extraction, 0–200 000 sur 223 147 |
| arXiv:1706.05350, van Laarhoven 2017 | C1 | invariance d'échelle et pas effectif (référence habituelle) | titre |
| arXiv:1910.08475, Ash, Adams 2020 | A1 | « rétrécir et perturber » : θ ← λθ + bruit avant de reprendre l'entraînement ; ferme l'écart de généralisation du redémarrage à chaud | résumé |
| arXiv:2507.04683, Oh et al. | A1, P3 | remise à l'échelle douce par couche, fonction préservée ; MLP, CNN, VGG-16 ; bat rétrécir-et-perturber ; aucun modèle de langage | extraction |
| arXiv:2306.13812, Dohare et al. | A1 | perte de plasticité en apprentissage continu ; rétropropagation continue | résumé |
| arXiv:2606.24752, Hernandez-Garcia, Figliolia, Millidge 2026 | A1 | perte de plasticité sur transformeurs de 5 M à 314 M, la taille la retarde (loi de puissance) sans l'empêcher ; **remèdes non testés** ; la magnitude des poids croît mais « ne suit pas exactement » la perte de plasticité | extraction, 0–164 588 |
| arXiv:2602.11137, Han et al. 2026 | A1 | décroissance de poids plus forte au pré-entraînement → meilleur ajustement ensuite ; Llama-2 0,5 à 4 B, OLMo-2 1 B ; aucune remise à l'échelle après coup | extraction, 0–100 000 sur 102 994 |
| arXiv:1706.04599, Guo et al. 2017 | C2 | la température change la confiance sans changer la classe prédite ; moins de décroissance de poids, moins bonne calibration | extraction |
| arXiv:2405.08777, Serricchio et al. (aussi 10.1016/j.neunet.2025.107216) | K1, C3 | Daydreaming : renforce le motif et retire l'état retrouvé, en continu, sans moment d'arrêt ; motifs stables jusqu'à α = 1 ; N = 10³ | extraction |
| arXiv:1810.12217, Fachechi, Agliari, Barra | C3, NH-01 | noyau rêveur : α = 1, converge vers la matrice de projection | résumé |
| arXiv:2201.00032, Benedetti et al. 2022 | C3 | désapprentissage hebbien et perceptron symétrique : bassins comparables | résumé |
| arXiv:2601.08447, Massey et al. 2026 | P3 | phases de sommeil à décroissance des poids : stabilisent un réseau récurrent à STDP qui sature (≈ 95 % contre 43 %, tâche jouet), rien sur un réseau entraîné par gradient | résumé étendu |
| 10.1038/s41467-022-34938-7, Tadros et al. 2022 | A3 | rejeu de type sommeil, hebbien local, réduit l'oubli | résumé |
| 10.1073/pnas.2123432119, Singh, Norman, Schapiro 2022 | A2 | alternance de deux phases de sommeil, du récent vers l'ancien | résumé |
| arXiv:2502.04313, Goel et al. 2025 | C4, C6 | mesure CAPA de ressemblance par recouvrement d'erreurs ; les juges favorisent les modèles qui leur ressemblent ; erreurs de plus en plus corrélées | résumé |
| arXiv:2404.13076, Panickssery, Bowman, Feng 2024 | C4 | auto-préférence liée à l'auto-reconnaissance | résumé |
| 10.1177/25152459211007467, Scheel, Schijen, Lakens 2021 | C5 | 44 % de résultats positifs en rapports enregistrés (n = 71) contre 96 % (n = 152) | résumé |
| 10.1098/rsos.211037, Claesen et al. 2021 | C5, note méthodo | 25 études préenregistrées sur 27 dévient ; 1 déclare toutes ses déviations | extraction |
| arXiv:2411.03923, Singh et al. | C7 | contamination mesurée par recouvrement de n-grammes, gains estimés jusqu'à +18 et +25 points ; **rien sur la calibration** des items contaminés | extraction, 0–100 000 sur 110 367 |
| arXiv:2511.02192, Hou et al. | P1 | bras souple simulé : contrôle distribué meilleur pour 4 < n < 12 sections (100 % contre 0 % à n = 6), centralisé meilleur à n ≤ 2 | extraction |
| arXiv:1903.05168, Lowe et al. 2019 | K2, N10 | émettre un message corrélé ne prouve pas qu'il est utilisé ; mesure causale CIC | extraction (déjà au dépôt) |
| arXiv:1812.09755, Singh, Jain, Sukhbaatar | K3 | IC3Net : apprendre quand communiquer | résumé (déjà au dépôt) |
| Knoblauch, Palm, Sommer 2010, Neural Comput. (PMID 19925281) | P2 | capacités des mémoires associatives de type Willshaw | titre (page bloquée) |

### Verdicts provisoires

- **K1** (anti-hebbien en ligne à la place du rêve) : déjà publié (Daydreaming).
- **A4** (une entrée par neurone d'expansion) : contredite en régime linéaire (Shomrat 2011).
- **C1** (DOWNSCALE quasi-symétrie) : publié pour le sous-réseau normalisé ; reste le cas « tous les paramètres » d'un modèle de langage. Contrôle d'instrument.
- **C2** (température) : attendu pour la tête de sortie ; mesure du même passage plutôt qu'hypothèse.
- **A1** (la remise à l'échelle sert l'apprentissage suivant) : mécanisme publié ; remise à l'échelle ponctuelle sur modèle de langage non trouvée ; mais sur transformeurs le lien entre norme et plasticité est décrit comme lâche (Hernandez-Garcia 2026). Créneau étroit, terrain actif.
- **P3** : partiellement publié (Massey 2026).
- **P1** : la comparaison centralisé / distribué sur bras souple existe (Hou et al.) ; reste la contrainte de débit.
- **K2, K3** : la mesure causale de l'usage du message et la communication à la demande sont publiées et déjà au dépôt.
- **C4, C5, C6** : prémisses ou repères publiés ; le terrain du labo reste propre.
- **C7** : rien trouvé sur la calibration des items vus à l'entraînement.
- **P2** : non vérifié.
- Non cherchées : A5, K4, K5, P4.

## 3. Constats pour la planification (non décidés)

1. **Le nul d'E1-small sur DOWNSCALE était lisible avant le calcul.** L'invariance d'échelle d'un réseau normalisé est publiée ; une note de lecture l'aurait signalée. Étude de cas possible pour la note méthodo.
2. **Le noyau rêveur n'a pas été comparé à Daydreaming.** Les préregs P8c et P1bis le rangent dans « ce que cette étude ne teste pas » ; le fichier de références du 07/11 le marquait déjà « à recouper » comme comparateur de NH-112.
3. **L'axe rêve sur modèle de langage se rétrécit** à un contrôle d'instrument (C1) et, au plus, un test court (A1).
4. **Vingt-deux candidates en deux jours** : un tri est nécessaire avant toute inscription.

## 4. Incidents

- Pages bloquées (contrôle de navigateur) : PMC10322707 (Pophale), PMC10445230 (Birk), PMC9388130 (Rößler), PubMed 27471418 et 19925281.
- Dates absentes des pages lues pour Serricchio et al., Oh et al., Hou et al.
- Les extractions sont produites par un modèle auxiliaire : un chiffre de ce fichier peut être faux sans que la passe l'ait vu. À recouper sur l'article avant toute citation.

## 5. Résolution des identifiants

`python3 scripts/resolve_ids.py docs/research/veille-2026-11-11-especes-plasticite.md`, le 11/11 vers 17:30 CET : 31 identifiants (18 arXiv, 13 DOI), 31 `ok`, 0 `ko`. Les références sans identifiant dans ce fichier (PMID, PMC ou revue seule) ne sont pas couvertes par le script. arXiv:2306.13812 se résout sous le titre « Maintaining Plasticity in Deep Continual Learning » (la version Nature de 2024 porte un autre titre).
