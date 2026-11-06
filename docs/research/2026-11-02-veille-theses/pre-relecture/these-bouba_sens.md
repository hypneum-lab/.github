# bouba_sens — thèse, veille et relecture (2026-11-02)

Dépôt `hypneum-lab/bouba_sens`, clone `clones/bouba_sens`, branche `docs/v071-reading-note` (17dd4f5, arbre propre). Fenêtre principale : soumissions et versions du 2026-10-24 au 2026-11-02. Axes : R4 (plasticité intermodale, privation sensorielle, bouba/kiki dans les modèles) et R11 (nuls appariés, B-3).

Ce document ne rend aucun verdict sur E1-small, N10-C run 2 ou Me6. Il ne modifie ni la note de lecture v0.2, ni l'amendement v0.7, ni la PR #68, ni aucune préreg. Il ne pose aucun tag. Aucun calcul n'a été lancé ; les seuls scripts ont interrogé des API publiques depuis GrosMac.

Lectures préalables, en entier : `docs/prereg/actionsense-v0.7/reading-note.md` (v0.2, 364 l.), `veille-journal.md` (226 l.), `brainstorm-2026-11-01.md` (198 l.), `snowball-tour2.annot.tsv` (293 lignes de données : 7 directes, 20 de contexte, 266 hors sujet) ; `inventory/bouba_sens.md`, `inventory/refs/bouba_sens-refs.md` ; catalogue v2, lignes bouba_sens (47, 48, 180, 190, 265, 298, 308-318) ; spec du verrou §4 et §6.

Bilan de la veille (détail au §8) :
- Bruts : arXiv 646 lignes sur 15 requêtes réussies (2 en échec 429), dont 19 dans la fenêtre ; OpenReview ICLR 2027 9 requêtes, 298 notes uniques ; bioRxiv 2 034 versions balayées, 11 avec un mot-clé ; Crossref 13 requêtes ; OpenAlex 9 requêtes (repli de Semantic Scholar en 429) ; HAL 8 requêtes ; GitHub 12 requêtes ; Hugging Face 12 ; Zenodo 11 ; OSF 7.
- Après dédoublonnage contre `seen-arxiv.txt` / `seen-doi.txt` et filtrage par titre et résumé : 31 candidates.
- Gardées : 11 entrées (§3), dont 4 dans la fenêtre ou révisées dans la fenêtre, 6 « ancien, non vu » qui touchent une ligne, 1 « déjà vu, rappelé ».
- Lues en entier : 0. Lues en résumé : 11 (« [résumé moteur] » ou résumé de l'éditeur).

## 1. La thèse en une phrase, telle que le dépôt la formule

`README.md:5-9` : « A benchmark for cross-modal plasticity in artificial neural systems. […] `bouba_sens` studies how a 5-modality agent (audio, vision, tactile, gravity, force) reorganises itself when one sensory channel is lost or degraded — inspired by the cross-modal cortical recruitment observed in congenital and late blindness ».

Trois invariants testables (`README.md:13-21`) : B-1 écart congénital/tardif, B-2 migration d'information, B-3 asymétrie perceptive/proprioceptive.

Question de la campagne v0.7.1, telle que la pose la note (`reading-note.md:12-16`) : une lésion tardive d'une seule modalité, sur capteurs réels (ActionSense), laisse-t-elle une trace asymétrique (Me6, B-3) distincte d'une lésion congénitale, au-delà des seuls effets principaux de requête ?

## 2. État de la thèse au 02/11

| affirmation | statut 24/10 | requalification 01/11 (catalogue v2) | ce que la veille du 02/11 change | source résolue |
|---|---|---|---|---|
| B-3 « invariant architectural » (`docs/paper/main.tex:566`, `:755`) | rétracté (« empirically dead », ADR-0014) | **non-test**, retiré (table C l. 47 ; table B l. 180, BS-B3arch) | **rien** sur le fond. Méthode : la soumission ICLR 2027 « Phantom Gains » montre, sur un autre domaine, qu'un seuil fixe lu sans contrôle gelé passé par le même pipeline fabrique des effets ; même mécanisme que la règle 0,02 qui « tire » sous H0 (`inventory/bouba_sens.md:106`) | OpenReview `ts0kgHyBfr` |
| B-3 « no lesion effect » (`docs/paper/main.tex:1233`, `README.md:60`) | « final » (PI 27/10) | **non-test** : lésion arrêtée à 19,21 / 19,41 / 19,80 dB (`docs/adr/0020-snr-floors-nearly-identical-under-default-settings.md:34-36`, cité par `reading-note.md:21-23`) ; `--k-steps` jamais passé (`scripts/run_grid.sh:15,166-174`) | **rien** côté littérature. Un argument de dessin : arXiv:2602.09234 relie la perte de plasticité à la brusquerie des transitions ; la forme du calendrier de lésion (rampe contre marche) devient un facteur à déclarer dans v0.7.1 (inférence, §6) | arXiv:2602.09234 ; OpenReview `hip2PfZSRg` |
| v0.7 ActionSense « gelée » | hyp. brouillon (catalogue l. 190) | v0.7.1 à taguer après verrou (table C l. 48 ; table B l. 190) | **rien**. Fait : au 02/11 19:30, seuls les tags `bouba_sens/v0.7-actionsense-prereg`, `prereg-b3-lesion-interaction-20261027`, `prereg-b3-probe-v2-20261025`, `prereg-me6-large-n-20261031` existent (API GitHub) ; aucun tag v0.7.1. PR #68 en brouillon (maj 2026-11-01 21:26Z) | API GitHub `git/matching-refs/tags`, `pulls/68` |
| Privation précoce/tardive déjà publiée en réseau | à citer | déjà publiée, arXiv:2210.04643 (table C l. 48) | **confirme** (déjà vu, rappelé) : aucune réplication multisensorielle indépendante trouvée dans la fenêtre sur 6 canaux | arXiv:2210.04643 |
| … mais le code ne reproduit pas la Fig. 8 | — | marque « à recouper » (`reading-note.md:96-109`) | **rien** : `mjkleinman/CriticalPeriodMultiView` toujours inchangé (dernier push 2023-12-17T22:03Z, API GitHub au 02/11) ; la marque reste | API GitHub `repos/mjkleinman/CriticalPeriodMultiView` |
| Fukase 2025 = réplication indépendante | citée au tour 1 | **non indépendant** (`reading-note.md:75-82`) | **rien** | arXiv:2506.15954 |
| Les VLM montrent l'effet bouba/kiki | « montrent » | « contesté » (`reading-note.md:120-131`) | **rien** dans la fenêtre : arXiv `all:bouba OR all:kiki` donne 0 entrée après le 2026-10-21 ; OpenReview ICLR 2027 `bouba kiki` = 1 note, déjà connue (= arXiv:2609.36475) | arXiv:2310.16781 ; arXiv:2507.10013 ; arXiv:2609.36475 |
| Modèles audio : association son-forme | — | « hétérogène » (`reading-note.md:132-148`) | **rien** sur l'audio. EMNLP 2026 (Sharma et al.) porte sur le symbolisme de taille en transcriptions phonémiques, pas sur des modèles audio | DOI:10.18653/2026.emnlp-main.1297 |
| Accord transculturel « ≥ 95 % » (`docs/paper/main.tex:118`, `:1111`) | à sourcer | 72 % [56-82] (Ćwiek, table C l. 48) | **nuance** (Info) : un signal de symbolisme de taille survit au contrôle généalogique sur 27 langues, « petit mais cohérent ». Fait : il s'agit de taille, pas de forme. Inférence : rien ne remonte vers 95 % | DOI:10.18653/2026.emnlp-main.1297 ; DOI:10.1098/rstb.2020.0390 |
| Sourav 2019 non préenregistrée | — | confirmé par OSF (`reading-note.md:200-206`) | **rien** : OSF `bouba`, `sound-shape`, `cataract` : aucun nouvel enregistrement depuis le 24/10 | DOI:10.1177/0956797619866625 ; DOI:10.17605/OSF.IO/SQ2PY |
| Délai opération-test : aucune source publiée | — | observation unique, « à recouper » (`reading-note.md:192-200`) | **rien** : bioRxiv (2 034 versions), Crossref `sight restoration cataract`, Europe PMC non repris : aucune source dans la fenêtre. La marque reste | — |
| Me6 grand n, piste C (unité échangeable = réseau), nul réseau #66 | gelé, exécuté 31/10 | « utile, sous verrou » ; #66 non gelable (contrôle 2 tautologique, `inventory/bouba_sens.md:135-140`) | **aucun verdict**. Fait : #66 reste un brouillon ouvert (maj 2026-11-01 09:31Z). Outils à lire : arXiv:2608.06621 (les unités d'une même portée servent de nuls les unes aux autres), « Phantom Gains » (nul mesuré par un contrôle gelé) | arXiv:2608.06621 ; OpenReview `ts0kgHyBfr` |
| Asymétrie entre modalités (prémisse de B-3) | — | effet principal de requête construit par le monde (`inventory/bouba_sens.md:115`) | **contexte** (Info) : chez la souris, transfert appris vision → audition mais pas l'inverse. Inférence : une asymétrie entre modalités peut naître de l'ordre et du sens du transfert, sans lésion | DOI:10.1038/s41467-026-78921-y |
| NH-70 : réorganisation locale, hiérarchie globale conservée (catalogue l. 312) | PRÊT | inchangé | **contexte** (Info) : deux études chez la souris privée tôt de la vue décrivent une réorganisation régionale (aires dorsales latérales) et des réseaux inhibiteurs qui gardent leur efficacité globale | DOI:10.1101/2024.08.31.610645 ; DOI:10.1093/cercor/bhag154 |
| NH-72 : contrôle positif bouba/kiki non humain (catalogue l. 314) | PRÊT | inchangé | **déjà vu, rappelé** : Biffi et al. (chiens adultes) est maintenant résolu par Crossref (publié 2026-10-07, enregistré 2026-10-14) ; la fiche refs du 01/11 le donnait « non re-résolu » (`inventory/refs/bouba_sens-refs.md:87`) | DOI:10.1098/rspb.2026.1209 ; DOI:10.1037/xan0000435 |

## 3. Veille 02/11 par axe R

### R4 — plasticité intermodale, privation, bouba/kiki dans les modèles

- DOI:10.1101/2024.08.31.610645 (v3 postée le 2026-10-28) — *Region-specific auditory and visual plasticity in mouse visual cortex after early visual deprivation*, Terra et al. Imagerie calcique à deux photons chez des souris élevées dans le noir : hausse des réponses auditoires dans les aires dorsales latérales et baisse de l'entraînement visuel, plus diffuse. [résumé moteur]
  → Hypneum : confirme (contexte biologique, version révisée dans la fenêtre) — R4/NH-70 (réorganisation locale). Impact : Info.
- DOI:10.1093/cercor/bhag154 (2026-09-01, ancien, non vu) — *Excitatory and inhibitory networks diverge following early blindness*, Laliberté et Boire. Énucléation néonatale chez la souris : les aires visuelles médianes se couplent aux aires somatosensorielles et motrices ; les réseaux inhibiteurs gardent leur efficacité globale et se réorganisent localement. [résumé moteur]
  → Hypneum : confirme la forme « local oui, global conservé » de NH-70 chez l'animal, sans la tester en réseau artificiel. Impact : Info.
- DOI:10.1038/s41467-026-78921-y (2026-10-23, ancien, non vu, un jour avant la fenêtre) — *Prefrontal cortex and striatum dissociate modality and learning order in cross-modal sensorimotor learning in mice*, Song et Peters. Les souris transfèrent une tâche apprise de la vision vers l'audition, pas l'inverse ; l'ordre d'entraînement ne change pas les réponses préfrontales. [résumé moteur]
  → Hypneum : contexte pour la prémisse « asymétrie entre modalités » de B-3 ; une asymétrie comportementale peut venir du sens du transfert. Impact : Info.
- DOI:10.18653/2026.emnlp-main.1297 (EMNLP 2026, enregistré le 2026-10-29) — *Size Sound Symbolism Survives Genealogy Across 27 Languages*, Sharma et al. 810 adjectifs de taille transcrits, 27 langues, 13 familles ; prédiction au-dessus du hasard après entraînement adverse contre la généalogie, signal résiduel « petit mais cohérent ». Résumé lu sur la page ACL Anthology.
  → Hypneum : nuance la ligne « accord transculturel » (`reading-note.md:110-119`) ; taille et non forme, donc ni confirme ni infirme 72 %. Impact : Info.
- DOI:10.1037/xan0000435 (2026, numéro d'octobre, ancien, non vu) — *Bouba–kiki, baby chicks, and the structure of experience*, Vallortigara. Commentaire : l'effet chez le poussin naïf suggère des principes perceptifs plutôt que des conventions linguistiques. [résumé moteur]
  → Hypneum : contexte pour NH-72 (contrôle positif non humain). Impact : Info.
- DOI:10.1098/rspb.2026.1209 (publié 2026-10-07 ; déjà vu, rappelé) — *Hearing shapes: the Bouba–Kiki effect in adult domestic dogs*, Biffi et al. Identifiant désormais résolu par Crossref, ce que la fiche refs du 01/11 n'avait pas fait. [titre et métadonnées seulement]
  → Hypneum : outil de citation pour NH-72. Impact : Info.

### R4 — plasticité des réseaux et forme de la lésion

- **arXiv:2602.09234** (2026-02-09, ancien, non vu ; soumission ICLR 2027 OpenReview `hip2PfZSRg`) — *Do Neural Networks Lose Plasticity in a Gradually Changing World?* Analyse théorique et empirique : la gravité de la perte de plasticité est liée à la brusquerie des transitions de tâche et baisse quand l'environnement change graduellement. [résumé moteur, via l'API OpenReview]
  → Hypneum : pilote possible (dessin) — B-1/v0.7.1 : la rampe linéaire du bruit (`k_steps`) et une marche au plancher ne sont pas équivalentes a priori ; D1 variantes a et b (`brainstorm-2026-11-01.md:52-55`) changent aussi la brusquerie. Impact : Moyen.
- **arXiv:2610.42100** (2026-10-30) — *Towards Understanding the Impact of Plasticity Loss on Reinforcement Learning in Stochastic Environments*, Bordne et al. Agents SAC avec bruit d'observation et d'action contrôlé ; le bruit peut accélérer la perte de plasticité sur les tâches difficiles. [résumé moteur]
  → Hypneum : Info — la lésion de bouba_sens est un bruit d'observation relatif ; à citer si v0.7.1 parle de plasticité après lésion.

### R11 — nuls appariés, seuils, unité échangeable

- **OpenReview `ts0kgHyBfr`** (soumission ICLR 2027, OpenAlex date 2026-08-20 ; ancien, non vu) — *Phantom Gains: Auditing Self-Improvement Against a Measured Null*. Un contrôle gelé, passé par le même pipeline, révèle sept défauts de mesure qui inversent chacun un résultat publié ; la correction par seuil naturel garde un nul non nul. [résumé moteur, via l'API OpenReview ; PDF non ouvert]
  → Hypneum : dépasse en partie la piste « note méthodologique nul calibré d'un max de différences d'exactitude » (`inventory/bouba_sens.md:156`) sur un autre domaine ; à citer avec OpenReview `7l8JCIgUi8` (déjà vu le 01/11). Impact : Moyen.
- **arXiv:2608.06621** (v1 2026-08-06, révisé le 2026-10-26) — *NxN E-valuation: Hypothesis Certification via a Conformal CRT Null*, Wang. Les unités d'une même portée servent de nuls les unes aux autres ; des e-valeurs bornent la probabilité d'un faux certificat pour des unités tirées indépendamment. [résumé moteur]
  → Hypneum : outil réutilisable à lire — Me6 piste C et nul réseau #66 (le réseau comme unité échangeable). Aucune lecture sur Me6 n'en découle ici. Impact : Info.
- DOI:10.1111/anzs.70064 (2026-09, ancien, non vu) — *Distance-Ordered Sign Scan and Run Tests for Symmetry: Exact Known-Median Calibration and Bootstrap*, Baklizi. Tests de symétrie par signes, calibration exacte. [titre et métadonnées seulement]
  → Hypneum : Info — candidat de lecture pour le nul par inversion de signe (D2, `brainstorm-2026-11-01.md:80-97`).

Écartées après lecture du résumé (hors sujet ou trop lointaines) : arXiv:2610.39237, arXiv:2610.33965 (TOST appliqué, sans apport méthodologique), arXiv:2610.36309, arXiv:2608.30563 ; les notes OpenReview `8k3HVSKemN`, `1FfEPJumUV`, `oHU9M5i2Xr` (déséquilibre de modalités, sans lésion ni calendrier) ; bioRxiv DOI:10.1101/2025.05.29.656149 (modèle de temps de réaction audiovisuel) et DOI:10.64898/2026.10.28.762438 (période sensible du chant, pinson).

### 5 papiers à lire cette semaine

1. OpenReview `ts0kgHyBfr` (Phantom Gains), PDF si accessible, sinon version arXiv à chercher.
2. arXiv:2602.09234 (brusquerie et perte de plasticité), pour la forme du calendrier de lésion.
3. arXiv:2608.06621 (nul conformal CRT), pour l'unité échangeable.
4. DOI:10.1093/cercor/bhag154 (réseaux après cécité précoce), pour NH-70.
5. Ramachandran et Hubbard 2001 (non résolu ici : pas de DOI), toujours en attente pour l'origine du « 95 % » (`reading-note.md:113-119`).

## 4. Hypothèses déjà faites ailleurs (risque de scoop)

- **Contraste précoce/tardif multisensoriel en réseau** (catalogue v2, table B l. 190 BS-v07 ; table A l. 310 NH-68 ; l. 318 NH-76) : déjà publié par arXiv:2210.04643. La veille du 02/11 n'ajoute aucun travail qui ferait la lésion asymétrique d'une seule modalité sur capteurs réels. Preuve de l'absence dans la fenêtre : arXiv `abs:"critical period" AND (multimodal OR multisensory OR "cross-modal")` = 2 résultats, aucun dans la fenêtre ; OpenReview ICLR 2027 `critical period multimodal`, `modality deprivation`, `cross-modal plasticity` : aucun titre pertinent sur 120 notes ; GitHub `critical period multisensory`, `sensory deprivation neural network` : 0 dépôt. À recouper par le contradicteur (une seule passe, recherche OpenReview non déterministe).
- **Note méthodologique « seuil sans nul »** (inventaire §6 piste 1 ; catalogue l. 180) : devancée en partie sur d'autres domaines par OpenReview `ts0kgHyBfr` et `7l8JCIgUi8`. Inférence : l'apport propre de bouba_sens reste le plafond 1/128, la sur-dispersion du nul par blocs sous prédicteur constant et la tautologie du contrôle par dérangement (`inventory/bouba_sens.md:156`), qu'aucune de ces deux sources ne traite d'après leur résumé.
- **NH-72, contrôle positif bouba/kiki non humain** (catalogue l. 314) : l'effet animal est publié (poussins, chiens, macaques) ; NH-72 reste un agent simulé. Antériorité computationnelle la plus proche : Fort et Schwartz, DOI:10.1038/s41598-022-23623-w (déjà au catalogue). Pas de scoop trouvé dans la fenêtre.
- **NH-70** (catalogue l. 312) : la forme « local oui, global conservé » est décrite chez l'animal (DOI:10.1093/cercor/bhag154, DOI:10.1101/2024.08.31.610645) ; pas en réseau artificiel. Pas de scoop.

## 5. Outils ou jeux de données à adopter

- Rien à adopter dans la fenêtre côté code. GitHub : `yvettege728/kiki-bouba-pilot` (poussé le 2026-10-29, tâche oculométrique HTML, sans licence) et `howells/boubakikid` (générateur d'identifiants) : hors sujet pour un réseau.
- Jeu de 810 adjectifs de taille avec audio (EMNLP 2026, DOI:10.18653/2026.emnlp-main.1297) : diffusion des données non vérifiée.
- Méthode du contrôle gelé passé par le pipeline (OpenReview `ts0kgHyBfr`) : à reprendre comme contrôle négatif de v0.7.1 (réseau non lésé, même pipeline lésion → Me6), proposition et non décision.
- Hugging Face (`bouba`, `kiki`, `sound symbolism`, `critical period`, `sensory deprivation`, `actionsense`) : aucun jeu pertinent mis à jour dans la fenêtre. Zenodo et OSF : rien de pertinent.

## 6. Ce qui reste ouvert et le prochain pas sous le verrou

Ouvert, inchangé par la veille du 02/11 :
1. Les trois marques « à recouper » de la note v0.2 (`reading-note.md:329`) : Fig. 8 sans code ; comptage OSF des délais sans second témoin ; causes de l'écart Sourav/Piller.
2. Le trou interne : aucune grille n'a tourné avec une lésion qui atteint −20 dB (`reading-note.md:271-275`).
3. Le nul par blocs sous prédicteur quasi constant, non calibré (`reading-note.md:284-290`).
4. La saturation : définition de « pertinent » non préenregistrée et profondeur 2 non faite (`reading-note.md:328`).

Prochain pas, sans run :
- **Dessin** : ajouter à la liste de v0.7.1 (`brainstorm-2026-11-01.md:175-198`) un point « forme du calendrier » : déclarer si la lésion est en rampe (`k_steps = STEPS_LESION`) ou en marche puis maintien, et ne pas comparer les deux sans le dire. Inférence tirée d'arXiv:2602.09234, non testée. Coût : environ 0,5 h humaine.
- **Dessin** : un contrôle négatif « réseau non lésé passé par le même pipeline » à côté de D4 (`brainstorm-2026-11-01.md:118-136`). Coût de rédaction : environ 1 h ; aucun calcul avant le verrou.
- **Lectures** : les cinq papiers du §3 (environ 4 h) ; Ramachandran et Hubbard 2001 ; les 7 entrées directes du snowball du tour 2, toujours non ouvertes (`reading-note.md:328`).
- **Contacts** (PI) : données non randomisées de Sourav (laboratoire Röder) et de Piller ; environ 1 h de rédaction.

Aucun de ces pas ne lance de grille ; le verrou n'est pas déclaré passé.

## 7. Non vérifié / inaccessible

- arXiv : nombreuses réponses 429 (jusqu'à six essais espacés de 45 s par requête). Les requêtes `abs:"sensory deprivation" OR …` et `abs:lesion AND abs:"neural network" AND …` ont échoué au premier passage. Au second passage (19:30-19:40), la seconde a abouti (60 bruts, 0 dans la fenêtre) ; la première et la vérification `id:2210.04643` ont encore échoué après six essais. La requête « privation sensorielle » n'a donc pas été interrogée sur arXiv à ce tour ; bioRxiv, Crossref et OpenAlex la couvrent en partie.
- Semantic Scholar `search` : 429 à chaque requête, repli automatique du script sur OpenAlex. Le snowball S2 n'a pas été refait à ce tour.
- OpenReview : PDF non ouverts (403 connus au tour 2). Les résumés viennent de l'API `notes/search`. La recherche plein texte n'est pas déterministe.
- Résumés seulement pour les 11 entrées ; aucun PDF lu en entier à ce tour.
- Données du jeu EMNLP 2026 : disponibilité non vérifiée.
- Ramachandran et Hubbard 2001 : sans DOI, non résolu, non lu.
- Lieu « ICLR 2027 » de `ts0kgHyBfr`, `hip2PfZSRg` : soumissions, non acceptées.

## 8. Journal

Toutes les heures sont celles de GrosMac, le 2026-11-02. User-Agent : `hypneum-lab reading-gate`. Aucune adresse e-mail envoyée. Scripts dans `veille-0211/scripts-bouba/`, sorties dans `veille-0211/dl-bouba_sens/`.

**arXiv** (API export, `sortBy=submittedDate`, `max_results=60`, filtre local `published` ou `updated` ≥ 2026-10-24 ; 3,5 puis 6 s entre appels, 45 s après un 429) :

| heure | requête | brut | dans la fenêtre |
|---|---|---|---|
| 19:10:50 / 19:13:01 | `all:bouba OR all:kiki` | 57 | 0 (le plus récent : 2026-10-21) |
| 19:10:53 | `abs:"sound symbolism" OR abs:"sound-shape"` | 27 | 0 |
| 19:10:59 | `abs:"critical period" AND (abs:multimodal OR abs:multisensory OR abs:"cross-modal")` | 2 | 0 |
| 19:11:03 | `abs:"critical learning period" OR abs:"critical learning periods"` | 10 | 0 |
| 19:11:08 | `abs:"cross-modal plasticity" OR abs:"crossmodal plasticity"` | 2 | 0 |
| 19:19:22 | `abs:"missing modality" AND abs:robustness` | 60 | 1 |
| 19:22:30 | `abs:"modality dropout" OR abs:"modality imbalance"` | 60 | 2 |
| 19:22:36 | `abs:"loss of plasticity"` | 60 | 2 |
| 19:22:43 | `abs:"crossmodal correspondence" OR abs:"cross-modal correspondence" OR abs:"crossmodal correspondences"` | 60 | 2 (déjà vus) |
| 19:22:50 | `abs:"equivalence test" OR abs:"equivalence testing" OR abs:TOST` | 60 | 5 |
| 19:22:57 | `abs:"permutation test" AND (abs:block OR abs:"time series" OR abs:dependent)` | 60 | 1 |
| 19:29:05 | `abs:"sensitive period" OR abs:"critical window"` | 60 | 1 |
| 19:29:1x | `abs:"iconicity" AND (abs:"language model" OR abs:"vision-language")` | 60 | 2 |
| 19:29:18 | `abs:"multisensory integration" AND (abs:"deep network" OR abs:"neural network")` | 8 | 0 |
| 19:35:16 | `abs:lesion AND abs:"neural network" AND (abs:modality OR abs:multimodal)` | 60 | 0 (le plus récent : 2026-10-20) |
| échec | `abs:"sensory deprivation" OR abs:"visual deprivation" OR abs:"congenitally blind"` ; `id:2210.04643` | 429 × 12 essais | — |

Total : 646 lignes brutes sur 15 requêtes réussies, 19 dans la fenêtre, 16 identifiants uniques, 3 déjà vus, 2 gardés (arXiv:2610.42100, arXiv:2608.06621). arXiv:2602.09234 a été trouvé par OpenAlex à partir du titre OpenReview.

**OpenReview** (`https://api2.openreview.net/notes/search?term=<terme>&group=ICLR.cc/2027/Conference&limit=40`, 19:15:16-19:15:31, toutes en 200) : `bouba kiki` (1) ; `sound symbolism` (40) ; `critical learning period` (40) ; `critical period multimodal` (40) ; `modality deprivation` (40) ; `cross-modal plasticity` (40) ; `missing modality lesion` (40) ; `equivalence test null calibration` (40) ; `block permutation test` (40). 321 lignes → 298 notes uniques → environ 110 titres avec un mot-clé (surtout « permutation », « null », « cross-modal », « plasticity » au sens générique) → 7 résumés lus → 2 gardées (`ts0kgHyBfr`, `hip2PfZSRg`), 1 déjà vue (`2FaHRono5T`), 1 déjà vue le 01/11 (`7l8JCIgUi8`).

**bioRxiv** (`https://api.biorxiv.org/details/biorxiv/2026-10-24/2026-11-02/<curseur>`, toutes catégories, 68 appels, lancé 19:14) : 2 034 versions ; filtre local `bouba|kiki|sound[- ]symbolism|sound[- ]shape|crossmodal correspondence|cross-modal correspondence|cross-?modal plasticity|critical period|sensitive period|sight restoration|cataract|congenital(ly)? blind|early[- ]blind|late[- ]blind|visual deprivation|sensory deprivation|deafness|cochlear implant|multisensory` sur titre + résumé → 11 → 1 gardé (DOI:10.1101/2024.08.31.610645), 2 écartés après résumé, 8 hors sujet au titre.

**Crossref** (`https://api.crossref.org/works?query=<terme>&filter=from-created-date:2026-10-24,until-created-date:2026-11-02&rows=20`, 19:22:52-19:23:03) : `bouba kiki` (56) ; `sound symbolism` (367) ; `critical period multisensory` (3 849) ; `cross-modal plasticity blindness` (5 054) ; `sight restoration cataract` (512) ; `critical learning period neural network` (22 080) ; `sensory deprivation deep neural network` (8 196) ; `crossmodal correspondence` (247). Puis `query.bibliographic=<terme>&filter=prefix:10.18653,from-created-date:2026-10-20&rows=8` (19:23:18-19:23:24) : `sound symbolism` (6) ; `iconicity` (0) ; `bouba kiki` (0) ; `cross-modal association vision language` (6 431) ; `critical period language model` (4 409). 20 premiers résultats lus par requête : 1 gardé (DOI:10.18653/2026.emnlp-main.1297), plus un enregistrement de séminaire sur l'étude des chiens (DOI:10.52843/cassyni.gjfyc0, même auteurs, non compté). Vérification `works/<doi>` de 21 DOI (19:21-19:24).

**OpenAlex** (repli de `s2.py search … --year 2026-`, 19:19:23-19:21:16 ; Semantic Scholar en 429 à chaque appel) : `bouba kiki` ; `sound symbolism multimodal model` ; `critical learning period multimodal` ; `sensory deprivation deep network` ; `cross-modal plasticity computational model` ; `early late deprivation neural network` ; `missing modality robustness lesion` ; `block permutation test calibration` ; `equivalence testing machine learning`. 135 lignes → 17 DOI vérifiés → 4 gardés « ancien, non vu » (Song, Laliberté, Vallortigara, Baklizi), 1 « déjà vu, rappelé » (Biffi). Puis 2 recherches par titre (`Phantom Gains…`, `Do Neural Networks Lose Plasticity…`) pour trouver un identifiant : arXiv:2602.09234 trouvé, aucun identifiant arXiv ou DOI pour « Phantom Gains » (OpenAlex W7204216742).

**Thèses-HAL** (`https://api.archives-ouvertes.fr/search/?q=<terme>&fq=submittedDate_tdate:[2026-10-24T00:00:00Z TO 2026-11-02T23:59:59Z]`, 19:24:11-19:24:12) : `bouba kiki`, `symbolisme sonore`, `période critique réseau de neurones`, `plasticité intermodale`, `privation sensorielle`, `sound symbolism`, `critical period deep learning` : 0 chacun. Contrôle `multisensory` sur 10 jours : 8 dépôts, dont 2 thèses, aucune sur le sujet. theses.fr non repris à ce tour.

**Code et données** :
- GitHub (`gh search repos "<terme>" --sort updated --limit 20 --json fullName,pushedAt,stargazersCount,license,description`, 19:16:40-19:17:10) : `bouba kiki` ; `sound symbolism` ; `critical learning period` ; `critical period multisensory` ; `sensory deprivation neural network` ; `missing modality robustness` ; `permutation test block` ; `equivalence test TOST` ; `critical period multiview` ; `multimodal critical period` ; `kiki bouba`. 99 dépôts, 6 poussés dans la fenêtre, 0 gardé. État de 5 dépôts suivis (API `repos/<o>/<r>`) : aucun poussé depuis le 24/10.
- Hugging Face (`/api/{models,datasets}?search=<terme>&sort=lastModified&direction=-1&limit=20`, 19:17:32-19:17:38) : `bouba`, `kiki`, `sound symbolism`, `critical period`, `sensory deprivation`, `actionsense` : 60 entrées, 17 modifiées dans la fenêtre (homonymes « kiki » et dépôts hypneum-lab/micro-kiki), 0 gardée.
- Zenodo (`/api/records?q=<terme>&sort=mostrecent&size=15`, 19:17:50-19:18:57) : 6 requêtes sans guillemets (bruit) puis 5 requêtes entre guillemets (`"bouba" AND "kiki"`, `"sound symbolism"`, `"critical learning period"`, `"cross-modal plasticity" OR "crossmodal plasticity"`, `"sound-shape"`) : 0 dans la fenêtre.
- OSF (`/v2/registrations/?filter[title][icontains]=<terme>&page[size]=15&sort=-date_created`, 19:18:05-19:18:30) : `bouba`, `sound symbolism`, `critical period`, `sound-shape`, `cataract`, `crossmodal`, `deprivation` : 0 pertinent dans la fenêtre.
- État du dépôt (API GitHub, 19:25-19:27) : tags de préreg, PR #66 et #68.

**Bilan des comptes** : bruts ≈ 3 900 lignes tous canaux (bioRxiv 2 034, arXiv 646, OpenReview 321, Crossref 160 lus sur ~45 000 annoncés, OpenAlex 135, GitHub 99, Hugging Face 60, Zenodo 165, OSF 105, HAL 8) → 31 candidates après dédoublonnage et filtrage par titre → 11 gardées.

**Identifiants** : tous les DOI et arXiv de ce fichier passent par `clones/.github/scripts/resolve_ids.py` (sortie `veille-0211/resolve-these-bouba_sens.tsv`, 26 ok, 0 ko au 02/11 vers 19:45 ; un premier passage avait 7 ko dus au gras Markdown collé aux DOI, corrigé). Les identifiants OpenReview ont été lus dans les réponses de l'API ; ils ne sont pas couverts par le script.

**Fichiers téléchargés** (`veille-0211/dl-bouba_sens/`) : `arxiv{1,2,3,4}.json`, `arxiv3.log`, `or_*.json` (9), `biorxiv.json`, `biorxiv.log`, `cr_*.json` (8), `hf_*.json` (12), `zen_*.json`, `zq_*.json`, `osf_*.json`, `s2search.txt`, `emnlp1297.html`.
