# Réutilisation non créditée ou plagiat des travaux d'Hypneum Lab : enquête du 2026-10-30

*Lecture seule, sans SSH, rien n'a été modifié. Toutes les requêtes ont été faites le 30/10/2026 : `gh api`, recherche de code GitHub, API Hugging Face, Zenodo, DataCite, OpenAlex, Software Heritage, PyPI/pypistats, export arXiv, texte intégral arXiv (HTML/PDF + grep), WebSearch et Exa. Les traces brutes sont dans `research/plag/` (`gh_code.txt`, `gh_code_excl.txt`, `arx/`, `omni_micro_kiki_lora_router.py`).*

Vocabulaire employé : **convergence** (même idée, trouvée indépendamment, sans emprunt démontré), **antériorité Hypneum** ou **antériorité du tiers** (selon les dates publiques), **réutilisation de code ou de texte** (le seul cas qui constitue une preuve forte), **indécidable**.

## Verdict en 5 lignes

1. **Aucune preuve de plagiat.** Les recherches de code (20 identifiants) et de texte (6 phrases distinctives) ne trouvent aucun passage d'Hypneum copié chez un tiers.
2. **Une seule réutilisation identifiée, et elle est créditée.** `Cukurikik/Omni` contient `micro_kiki_lora_router.py` (09/05/2026), dont l'en-tête dit « Inspired by the 'micro-kiki' architecture ». C'est un module PyTorch générique écrit à neuf, pas une copie. Il ne donne ni URL ni nom d'auteur.
3. **Les travaux tiers proches relèvent de la convergence ou sont antérieurs.** Aucun ne cite Hypneum : le grep du texte intégral de 9 papiers arXiv donne 0 occurrence. Avec si peu d'exposition, c'est le cas attendu.
4. **Probabilité qualitative d'une réutilisation non créditée : faible.** Les 5 dépôts publics du programme totalisent 5 étoiles, 1 fork (copie conforme, 0 commit) et 0 citation dans DataCite ou OpenAlex. micro-kiki fait exception : il a été posté sur r/LocalLLaMA en avril.
5. **Le risque symétrique est plus concret.** Hypneum ne cite pas plusieurs antériorités directes : Crick et Mitchison 1983, la littérature de communication émergente dans le papier nerve-wml, Fachechi et al. absent du Paper 1, Tadros/Bazhenov sur le replay de type sommeil, et Cook et al. qui est tout récent.

## 1. Chronologie : les idées d'Hypneum face aux travaux tiers

Les dates Hypneum sont la création du dépôt public (`gh api repos/...` → `created_at`), les DOI Zenodo (l'intégration GitHub→Zenodo exige un dépôt public, ce qui prouve la publicité à la date du DOI) et la préreg OSF. Les dates tierces sont celles de la v1 arXiv (`export.arxiv.org`).

| Idée | Hypneum (date, preuve) | Tiers (date, preuve) | Antériorité |
|---|---|---|---|
| Sommeil/rêve comme consolidation pour les LLM (cadre général) | dream-of-kiki créé le 18/04/2026 ; OSF [q6jyn](https://osf.io/q6jyn) le 19/04 ; Zenodo [10.5281/zenodo.19701356](https://doi.org/10.5281/zenodo.19701356) le 23/04 | SleepGate [2603.14517](https://arxiv.org/abs/2603.14517) le 15/03/2026 ; Behrouz et al. (Google) [2606.03979](https://arxiv.org/abs/2606.03979) v1 le 02/06/2026, avec une version OpenReview ICLR 2026 de l'automne 2025 d'après la note du `references.bib` d'Hypneum (non revérifiée sur OpenReview) ; CMU « *Do* Language Models Need Sleep? » [2605.26099](https://arxiv.org/abs/2605.26099) le 25/05/2026 | **Tiers** pour SleepGate et Behrouz. **Hypneum** face à CMU, mais les mécanismes diffèrent (récurrence hors ligne pour CMU) : **convergence** |
| Recombinaison créative entre domaines comme opération de consolidation (`recombine`) | Zenodo dreamOfkiki le 23/04/2026 (« replay, downscale, restructure, recombine ») | Zahn, Evans, Eagleman, « Discovery by Dreaming », [2607.16256](https://arxiv.org/abs/2607.16256) v1 le 28/06/2026 | **Hypneum** par la date. L'idée de fond remonte à Hobson, cité par Hypneum. Zahn et al. ne citent pas Hypneum (grep 0). **Convergence**. Hypneum les cite déjà |
| Rêve comme relaxation libre d'un réseau à énergie / rejeu génératif Hopfield | NH-01 : préreg du 25/10/2026 (tag `prereg-nh01-hopfield-dream-20261025`), noyau de Fachechi et al., donc un autre mécanisme | Cook et al. (LIRMM / CEA List), [2610.37139](https://arxiv.org/abs/2610.37139) le 27/10/2026 ; ils citent Kubo et al. 2025 (wake-sleep EqProp) ; Fachechi, Agliari, Barra 2019 ; Hopfield, Feinstein, Palmer 1983 | **Tiers**. Hypneum n'a rien publié de ce mécanisme avant eux. **Convergence** thématique, sans emprunt |
| Communication discrète entre modules hétérogènes, indépendante du substrat (`neuroletters`) | nerve-wml créé le 18/04 ; v1.0.0 le 19/04 ; Zenodo [19656342](https://doi.org/10.5281/zenodo.19656342) ; PyPI 1.x le 21/04 | Foerster et al. 2016 et DVNC (Liu et al. 2021, cité), antérieurs ; RecursiveMAS [2604.25917](https://arxiv.org/abs/2604.25917) le 28/04/2026 ; Seol, « The Giant Hippocampus », [2607.19973](https://arxiv.org/abs/2607.19973) le 22/07/2026 | **Tiers** pour l'idée générale. **Hypneum** face à RecursiveMAS et Seol : **convergence**, sans citation et sans texte commun |
| Flot de Wasserstein / JKO appliqué à la consolidation de LLM (Levelt–Baddeley) | kiki-flow créé le 17/04 ; Zenodo [19666755](https://doi.org/10.5281/zenodo.19666755) le 20/04 | JKO 1998 (cité) ; aucun concurrent direct trouvé pour cette application | **Hypneum** pour l'application ; la méthode est due aux tiers |
| Benchmark bouba/kiki et plasticité cross-modale (B-1/B-2/B-3) | bouba_sens créé le 20/04 ; spécification datée par git au 20/04 ; Zenodo [19701353](https://doi.org/10.5281/zenodo.19701353) le 23/04 | Alper et Averbuch-Elor 2023 (cité) ; Verhoef et al. [2407.17974](https://arxiv.org/abs/2407.17974) ; Kouwenhoven et al. [2507.10013](https://arxiv.org/abs/2507.10013) | **Tiers** pour « bouba/kiki dans les modèles ». Le cadrage en invariants B-1/B-2/B-3 semble propre à Hypneum (rien trouvé) |
| 35 LoRA de domaine sur un MoE Qwen-A3B, Apple Silicon | HF `clemsail/micro-kiki-v3` le 17/04 ; post r/LocalLLaMA vers le 17-18/04 ; Zenodo [19666760](https://doi.org/10.5281/zenodo.19666760) le 20/04 | `Cukurikik/Omni` le 09/05/2026 (crédit par le nom) ; MoE²-LoRA 2607.21978 (juillet, autre problème) | **Hypneum** face à Omni. MoE²-LoRA relève de la **convergence** sur la famille de modèles |

## 2. Citations, forks, téléchargements

- **Citations : zéro partout.** DataCite `citationCount` = 0 et OpenAlex `cited_by_count` = 0 pour les 11 DOI (5 concept DOI, leurs versions, et OSF Q6JYN). OpenAlex connaît deux profils auteur « Clément Saillant » (A5134086924 et A5133972864), tous deux à 0 citation. Semantic Scholar : DOI dreamOfkiki « not found », recherche par titre bloquée en 429. **Non vérifié** : Google Scholar (pas d'API) et Crossref Event Data (aucune réponse exploitable).
- **Forks** : un seul, `lguddeti/micro-kiki` (26/04), avec 0 commit d'avance et 42 de retard. C'est une copie conforme. Le compte a 1 124 dépôts publics, profil typique d'un forkeur en masse. Aucun fork pour les autres dépôts.
- **Étoiles** : micro-kiki en a 5 (acivilis et nightscape le 24/04, mike7seven le 28/04, geoyakup3k le 10/06, jessefrye le 26/06), nerve-wml 1, les autres 0.
- **Trafic GitHub sur 14 jours** (endpoint traffic, accessible) : vues uniques nerve-wml 15, micro-kiki 11, dream-of-kiki 13, bouba_sens 6, kiki-flow 1. Les clones sont nombreux (de 270 à 1 413 sur 14 jours, de 95 à 363 uniques). C'est probablement du CI, des miroirs ou des robots, qui ne signalent pas un intérêt humain. Le seul référent externe est `aocr.org`, de 5 à 15 visites par dépôt. Ce site n'a pas pu être identifié : il est derrière un challenge Cloudflare et la recherche web ne renvoie rien.
- **Zenodo** (vues et téléchargements uniques) : nerve-wml v1.8.0 177/57, kiki-flow 32/8, micro-kiki 19/3, bouba_sens 12/5, dreamOfkiki 7/4.
- **PyPI** : `nerve-wml` 1.8.1, 10 téléchargements le mois dernier (pypistats, robots compris). Aucun dépendant public trouvé, à part un index automatique (`szabgab/pydigger-data`).
- **Hugging Face** : 6 modèles `hypneum-lab/*` à 0 téléchargement. `clemsail/micro-kiki-v3` totalise 76 téléchargements et 4 likes ; il est référencé dans un catalogue automatique de GGUF (`eitanporat/fleetsim`). **Aucun modèle dérivé** : le filtre `base_model:{,adapter:,quantized:,finetune:,merge:}` renvoie 0 sur micro-kiki-v3, micro-kiki-v35b et spikingkiki-v4. Contrôle positif : le même filtre sur Qwen3.5-35B-A3B renvoie bien des résultats.
- **Mentions externes** (toutes automatiques ou neutres) : digest r/LocalLLaMA du 18-19/04 (`guzus/ai-research-arm`, `AustinWp/ai-daily-digest`) ; liste « not verified » dans `1h0lde4/ocbrain-v4.1` ; un crawler (`Nuel-code/Defi-discovery-`) ; le miroir automatique `github.laiyagushi.com` (copie de README non éditée, pas de l'appropriation).

## 3. Recherche de code

Recherche GitHub avec exclusion des orgs `hypneum-lab`, `electron-rare`, `L-electron-Rare` et `ailiance` (même auteur) :

| Identifiant | Résultat hors des orgs de l'auteur |
|---|---|
| `GammaThetaMultiplexer`, `BioFieldWML`, `kiki_oniric`, `DreamOfKikiNerve`, `MLXFullJKOSolver`, `KikiFlowBridge`, `NerveWmlAdvisor`, `AsymRecombineEmpty`, `HardFlowProxyTask`, `CrossModalTransducer`, `CCFilmWorld` | **0** |
| `dreamOfkiki`, `dream-of-kiki`, `bouba_sens`, « Hypneum Lab » | **0** |
| `nerve-wml` | 1 (index PyPI automatique) |
| `neuroletter(s)` | du bruit uniquement (domaines expirés, composant React « NeuroLetter » sans lien) |
| `hypneum` | du bruit (genre de mousse *Hypnum*, listes de domaines), plus la liste ocbrain citée en §2 |
| `kiki-flow` | du bruit (`KIKI-flower`, `BroKarim/qoma`) |
| `micro-kiki` | `Cukurikik/Omni` (voir ci-dessous), digests, un catalogue GGUF, du bruit CSS « zing-mp3 » |
| « GENIAL framework » | homonymes sans lien (`huawei-csl/GENIAL`, `genial-framework/Parser`) : risque de confusion de nom, pas de réutilisation |

**Cas `Cukurikik/Omni`** : 5 étoiles, licence NOASSERTION, fichier ajouté le 09/05/2026 par le commit `f360354` « manifest production framework zero-mock ». Le dépôt ressemble à un « framework » généré à la chaîne (des centaines de modules `moe_*.py`). Le fichier reprend la description du dépôt micro-kiki (« 35 domain-expert LoRAs on Qwen ») et implémente un routeur top-k jeton par jeton en PyTorch. micro-kiki, lui, route par un classifieur MiniLM au niveau de la requête et tourne sous MLX. **Aucun code commun.** Qualification : **réutilisation d'idée, créditée par le nom, sans copie de code**, avec une attribution incomplète (pas d'URL, pas d'auteur). Comme la licence Apache-2.0 de micro-kiki ne s'applique qu'au code copié, rien n'est exigible ici.

## 4. Recherche de texte

Phrases recherchées entre guillemets (WebSearch) :

1. « heterogeneous neural modules … exchange information without sharing a substrate » (nerve-wml) : pas de correspondance. Le plus proche est Seol 2607.19973 (« standardized interface »), qui relève de la convergence.
2. « four-species Levelt–Baddeley … Wasserstein gradient flow » (kiki-flow) : rien.
3. « three invariants of cross-modal plasticity » (bouba_sens) : rien.
4. « orthogonalization is superfluous on native MoE » (micro-kiki) : rien.
5. « four pillars … substrate-agnostic … DR-0 » (dreamOfkiki) : rien. Le plus proche est Zahn et al., en convergence.
6. « neuroletters … γ/θ multiplexing » : rien.

S'y ajoute un grep du texte intégral de 9 papiers arXiv proches (2607.16256, 2607.19973, 2610.37139, 2606.03979, 2605.26099, 2603.14517, 2606.08447, 2605.13721, 2604.25917) sur hypneum, saillant, dreamofkiki, nerve-wml, kiki-flow, micro-kiki, bouba_sens, neuroletter et les DOI Zenodo : **0 occurrence**. Limite : Google Scholar n'a pas été consulté en texte intégral, et les moteurs indexent mal les PDF Zenodo.

## 5. Risques symétriques : ce qu'Hypneum ne cite pas

Hypneum cite bien Behrouz 2606.03979, Zahn 2607.16256, RecursiveMAS (Paper 2), « Not Just After One », JKO, Feydy/Peyré, Ramachandran/Köhler, Alper 2023, DVNC et Shin 2017 (generative replay). Il manque :

- **Crick et Mitchison 1983** et **Hopfield, Feinstein, Palmer 1983** (unlearning). Le second n'apparaît que dans un fichier de nerve-wml, et aucun des deux n'est dans le Paper 1. Or ce sont les références fondatrices de l'idée « le rêve désapprend ».
- **Fachechi, Agliari, Barra 2019** : cité dans la préreg NH-01, mais **absent de la bibliographie du Paper 1** de dreamOfkiki (81 entrées, grep 0).
- **Tadros, Krishnan, Bazhenov 2022 (SRC)** et **Kubo et al. 2025** : absents. Cook et al. s'appuient sur les deux.
- **Cook et al. 2610.37139** (Montpellier, 27/10) : à ajouter, c'est le concurrent le plus direct de NH-01 et de DR-4.
- **Communication émergente** : Foerster 2016 apparaît dans `docs/positioning.md` mais **pas dans `papers/paper1/refs.bib`**. Lazaridou 2017, Havrylov et Titov 2017 et EGG sont absents. Un relecteur lirait les « neuroletters » comme un jeu de signalement de Lewis non cité.
- **Bouba/kiki dans les VLM** : Verhoef 2024 et Kouwenhoven 2025 sont absents (seul Alper 2023 est cité).
- **Métadonnées** : l'enregistrement Zenodo de nerve-wml v1.8.0 liste toujours « nerve-wml project contributors » comme second auteur, ce qui contredit la règle « auteur unique ». Le `.zenodo.json` du dépôt est déjà corrigé ; c'est la version Zenodo publiée qui reste fausse.

## 6. Exposition et plausibilité

L'exposition humaine est de l'ordre de quelques dizaines de personnes. Le seul pic est le post r/LocalLLaMA sur micro-kiki (avril). Les papiers d'Hypneum ne sont pas sur arXiv, sont absents de Semantic Scholar et n'ont aucune citation. Un tiers qui publie la même idée l'a presque sûrement trouvée seul. C'est la conclusion attendue, et les données la confirment. Le vrai risque est d'être **devancé** (Behrouz, Cook, Zahn), pas copié. Les dépôts `baby-brain`, `BabyBrain`, `whisperx-server` et `micro-kiki-quantum` sont **privés** et n'ont donc pas été exposés.

## 7. Cinq mesures peu coûteuses de protection et de preuve d'antériorité

1. **Archiver tous les dépôts dans Software Heritage** (« Save code now ») : seul nerve-wml l'est (visite du 29/10). dream-of-kiki, bouba_sens, kiki-flow-research et micro-kiki renvoient `NotFoundExc`. L'opération est gratuite et donne un horodatage SWHID indépendant de GitHub.
2. **Une release Zenodo avant chaque dépôt arXiv ou annonce publique**, puis **arXiv tôt**, y compris pour les résultats négatifs (NH-01, erratum kiki-flow). Seul arXiv rend le travail visible aux auteurs concurrents et les oblige à le citer. Zenodo seul ne suffit pas : 0 citation.
3. **Horodater les préregs** : tag git signé, dépôt OSF, ou `prereg freeze` qui lie la préreg à un commit et à un hash. Pour une idée non publiable, une **e-Soleau INPI** (environ 15 €) ou un horodatage RFC 3161 / OpenTimestamps du hash d'archive.
4. **Licence et attribution explicites** : `CITATION.cff` et bloc « How to cite » dans chaque README (déjà presque partout), plus une demande d'URL dans le NOTICE Apache de micro-kiki. Corriger la métadonnée « contributors » de Zenodo v1.8.0 par une nouvelle version.
5. **Surveillance mensuelle automatique** : un script cron qui interroge la recherche de code GitHub (identifiants de §3 avec exclusion des orgs), HF `base_model:` des modèles, OpenAlex `cited_by` des DOI et le référent `aocr.org`, plus des alertes Google Scholar sur « Hypneum Lab », « dreamOfkiki » et « neuroletters ». Ajouter au même rythme une veille arXiv sur « sleep consolidation LLM » et « Hopfield dreaming », pour citer les concurrents à temps, ce qui couvre aussi le risque symétrique.

## Limites

Pas d'accès à Google Scholar, ni à Crossref Event Data, ni à Semantic Scholar (429). La recherche de code GitHub n'indexe que les branches par défaut et plafonne à 100 résultats par requête ; les requêtes avec exclusion restaient sous ce plafond. Le texte intégral n'a été vérifié que pour 9 papiers. Les dépôts locaux clonés sont superficiels (shallow), si bien que les dates de première publication viennent de `created_at`, des releases et de Zenodo, pas du premier commit.
