# Références — bouba_sens (vérification 2026-11-01)

Dépôt `hypneum-lab/bouba_sens`, SHA `6f224d1725787d03c7bc52cdb7e228570412d3cf`.
Source principale : `docs/paper/refs.bib` (32 entrées, 409+ lignes).
Résolution : `s2.py lookup` (Semantic Scholar), Crossref `api.crossref.org/works/<doi>`,
doi.org (code de handle), DataCite, arXiv export API (3 s entre appels ; un 429
arXiv a été contourné par les pages HTML arXiv et S2). Pas de PDF lu sauf mention.

Légende du statut : **OK** (existe, métadonnées et attribution cohérentes avec le
résumé) · **OK-v** (existe sur arXiv, lieu de publication annoncé non vérifié) ·
**DOUTEUSE** (existe, attribution non soutenue par le résumé) · **ATTRIB-KO**
(existe, attribution contredite) · **META-KO** (existe, métadonnées fausses) ·
**DOI-KO** (DOI non enregistré ou pointant ailleurs) · **INTROUVABLE**.

## 1. refs.bib (32 entrées)

| # | clé (refs.bib:ligne) | DOI / arXiv résolu | statut | note |
|---|---|---|---|---|
| 1 | amedi2007 (:9) | 10.1038/nn1912 (Nat Neurosci 2007) | DOUTEUSE | Existe (Crossref). Courte étude LOC / substitution sensorielle ; le résumé n'établit pas un écart quantitatif congénital vs tardif. main.tex:111-114 et 1061 lui attribuent « a quantitative T1/T2 gap ». La note de la bib le signale elle-même ; README:238-242 corrige la confusion avec Amedi 2003 (baseline 24/10 §2.4 « pointe vers Amedi 2003 » : corrigé). Sources réelles de l'écart : Cohen 1999, Sadato 2002, Collignon 2013 (§3). |
| 2 | bavelier2002cross (:29) | 10.1038/nrn848 | OK | |
| 3 | merabet2010neural (:40) | 10.1038/nrn2758 | OK | S2 date 2009 (en ligne), numéro 2010. |
| 4 | kohler1947gestalt (:56) | livre, pas de DOI | OK | Existence attestée indirectement (citations Crossref). |
| 5 | ramachandran2001synaesthesia (:65) | J. Consciousness Studies 8(12), pas de DOI | OK | Non résoluble par API. Attribution « bouba/kiki » cohérente. |
| 6 | sidhu2018five (:75) | 10.3758/s13423-017-1361-1 | ATTRIB-KO | Le résumé liste cinq mécanismes dont des mécanismes appris (co-occurrence statistique, motifs de langue) et conclut qu'aucune explication ne fait consensus. main.tex:118-120 lui attribue « ≥ 95 % cross-cultural agreement » et « hard-wired asymmetric mapping » ; main.tex:1112-1114 « structural, not learned ». Le chiffre transculturel relève de Ćwiek et al. 2021 (25 langues ; taux exact absent du résumé) ou de Ramachandran & Hubbard 2001 (deux populations). |
| 7 | lisman1995storage (:90) | 10.1126/science.7878473 | OK | |
| 8 | tort2010measuring (:101) | 10.1152/jn.00106.2010 | OK | |
| 9 | colgin2016rhythms (:114) | 10.1038/nrn.2016.21 | OK | |
| 10 | saillant2026nervewml (:129) | 10.5281/zenodo.19666405 (DataCite) | DOI-KO | Le DOI résout vers « nerve-wml v1.1.1 », pas v1.5.3 annoncé (main.tex:1208, cover-letter-tmlr.md:15-16, 163-164) ; le run Me6 utilise nerve-wml v1.8.1 (milestone Me6 :28). Citer le DOI concept 19656342 (README) ou le DOI de version exacte. |
| 11 | vanschoren2021neurips (:146) | aucun | INTROUVABLE | Aucun article correspondant (S2, Crossref). De plus le track D&B n'a pas « poussé vers la préinscription OSF » (main.tex:1145-1147). |
| 12 | gebru2021datasheets (:154) | 10.1145/3458723 | ATTRIB-KO + META-KO | Existe. Auteur « Iii, Hal Daumé » mal formé. Datasheets ≠ préinscription : l'attribution main.tex:1146-1147 est fausse. |
| 13 | kraskov2004estimating (:172) | 10.1103/PhysRevE.69.066138 | OK | |
| 14 | belghazi2018mine (:183) | arXiv:1801.04062 (ICML 2018) | OK | |
| 15 | oord2018representation (:194) | arXiv:1807.03748 | OK | Non cité dans main.tex (entrée orpheline). |
| 16 | moody2001physionet (:205) | 10.1109/51.932728 | DOUTEUSE | Existe (PhysioNet, IEEE EMB Mag 2001). Pour la base MIT-BIH la citation attendue est Moody & Mark 2001, 10.1109/51.932724. Licence « CC0 » (main.tex:213) non vérifiée. Le « monde ECG » est une seule trace scipy (ADR-0009), pas MIT-BIH. |
| 17 | hanke2016studyforrest (:219) | 10.18112/openneuro.ds000113.v2.0.1 | DOI-KO | DOI non enregistré (v1.3.0 existe). Article : 10.1038/sdata.2016.92 ; localizer : Sengupta et al. 2016, 10.1038/sdata.2016.93. |
| 18 | lubba2019pypns (:236) | 10.1007/s12021-018-9383-z | META-KO | DOI correct ; 5 auteurs sur 7 faux. Auteurs réels (Crossref) : Lubba, Le Guen, Jarvis, Jones, Cork, Eftekhar, Schultz. |
| 19 | hines2001neuron (:251) | 10.1177/107385840100700207 | OK | |
| 20 | mcnaughton1971counter (:262) | livre MIT Press, pas de DOI | ATTRIB-KO | *Counter-Free Automata* traite des langages sans étoile. main.tex:1184-1185 en fait l'ancêtre des formalismes « nerve net » ; ceux-ci descendent de McCulloch & Pitts 1943 et Kleene 1956. |
| 21 | heimler2020critical (:276) | 10.1016/j.neubiorev.2020.06.034 | OK | Le DOI de la bib est correct (le DOI de la spec est faux, §2). Le résumé défend une plasticité réactivable à l'âge adulte, ce qui affaiblit la prémisse de verrou (main.tex:1069). |
| 22 | alper2023kiki (:288) | 10.52202/075280-3425 (NeurIPS 36) | OK | |
| 23 | kleinman2023critical (:306) | arXiv:2210.04643 (CVPR 2023) | OK | |
| 24 | ma2022missing (:318) | arXiv:2204.05454 (CVPR 2022) | OK | |
| 25 | girdhar2023imagebind (:329) | arXiv:2305.05665 (CVPR 2023) | OK | |
| 26 | liang2021multibench (:341) | arXiv:2107.07502 (NeurIPS D&B 2021) | OK | |
| 27 | sui2026modalities (:355) | arXiv:2610.04792 | OK-v | « NeurIPS 2026, to appear » non vérifié. |
| 28 | groger2026aristotelian (:366) | arXiv:2602.14486 | OK-v | ICML 2026 non vérifié. |
| 29 | abdelaleem2025accurate (:375) | arXiv:2506.00330 | OK | |
| 30 | foresti2026mibench (:386) | arXiv:2607.03487 | OK | |
| 31 | tsai2026hearing (:398) | arXiv:2607.10162 | OK-v | Lieu (SLT) non vérifié. |
| 32 | keles2026iconicity (:409) | 10.18653/v1/2026.acl-long.1907 | OK | Crossref OK. |

**Comptes (32).** OK 20 · OK-v 3 · avec défaut 9 : DOUTEUSE 2 (amedi2007,
moody2001) ; ATTRIB-KO 3 (sidhu2018, gebru2021, mcnaughton1971) ; DOI-KO 2
(saillant2026, hanke2016) ; META-KO 1 (lubba2019 ; gebru2021 porte aussi un
défaut de métadonnée) ; INTROUVABLE 1 (vanschoren2021). Existence : 31/32.
Les attributions des travaux ML récents (22-32) concordent avec leurs résumés.

## 2. Références inline (spec, README, ADR, amendements, lettre TMLR)

| source:ligne | référence | résolu | statut | note |
|---|---|---|---|---|
| spec 2026-04-20:508 | Heimler 2020, DOI 10.1016/j.neuroscience.2019.12.048 | Crossref → article sur le prurit | DOI-KO | Le bon DOI est dans refs.bib:276. |
| spec :509 | Röder 2021, DOI 10.1073/pnas.2004321118 | doi.org code 100 (non enregistré) | DOI-KO | Probablement Röder, Kekunnaya & Guerreiro 2021, Neurosci Biobehav Rev, 10.1016/j.neubiorev.2020.10.030. |
| README:309-317 | Röder 2021 PNAS | idem | DOI-KO | même défaut que la spec. |
| spec :514 / README:316 | Keller & Mrsic-Flogel 2018, 10.1016/j.neuron.2018.10.003 | Crossref | OK | |
| ADR-0019:59 | Facco et al. 2017 (two-NN), 10.1038/s41598-017-11873-y | Crossref | OK | |
| amendment-v0.7:67-72 | DelPreto et al. 2022, ActionSense | Crossref 10.52202/068431-1003 (NeurIPS 35) | OK | Titre exact. |
| cover-letter-tmlr.md:113-115 | Maimon-Mor … Dekker 2024, bioRxiv 10.1101/2024.07.04.602138 | Crossref | OK | Dekker est dernière autrice (« corresponding » non vérifié). |
| cover-letter :121-123 | Hofman … Hullman, arXiv:2311.18807 | arXiv | OK | |
| cover-letter :130-132 | « Achille, first author » de *Critical Learning Periods Emerge Even in Deep Linear Networks* | arXiv:2308.12221 | META-KO | Premier auteur : Michael Kleinman (Kleinman, Achille, Soatto). |
| cover-letter :103-104 | Zhang, Doughty, Snoek, NeurIPS 2023 | — | non vérifié | |
| cover-letter :178 | RecursiveMAS, arXiv:2604.25917 | — | non vérifié | |

Inline : 11 recensées, 6 OK, 4 KO (3 DOI-KO, 1 META-KO), 2 non vérifiées.

## 3. Références manquantes (vérifiées par API)

| besoin (où) | référence | DOI |
|---|---|---|
| écart congénital vs tardif, B-1 (main.tex:111-114, 1061) | Cohen et al. 1999, Ann Neurol | 10.1002/1531-8249(199904)45:4<451::aid-ana6>3.0.co;2-b |
| idem | Sadato et al. 2002, NeuroImage | 10.1006/nimg.2002.1111 |
| idem | Collignon et al. 2013, Brain | 10.1093/brain/awt176 |
| bouba/kiki transculturel (main.tex:118-120) | Ćwiek et al. 2021, Phil Trans R Soc B | 10.1098/rstb.2020.0390 |
| jeu MIT-BIH (main.tex:213, 358) | Moody & Mark 2001, IEEE EMB Mag | 10.1109/51.932724 |
| Studyforrest (main.tex:527) | Hanke et al. 2016 Sci Data ; Sengupta et al. 2016 Sci Data | 10.1038/sdata.2016.92 ; 10.1038/sdata.2016.93 |
| plasticité adulte / verrou (main.tex:1069) | Röder, Kekunnaya, Guerreiro 2021, NBR | 10.1016/j.neubiorev.2020.10.030 |
| contrôle positif bouba/kiki non humain | Loconsole 2026 (Science 391:836) ; Biffi 2026 (Proc B) — signalés baseline 24/10 §2.4, absents du dépôt, non re-résolus ici | — |

## 4. Groupe de Rome (exigence PI b)

Source : `scratchpad/veille/rome-2026-11-01.md`. Résumés S2 ; texte HTML arXiv lu
pour 2605.13721, 2503.04454, 2503.15353. **Aucun papier du groupe n'est cité dans
bouba_sens** (grep `Agliari|Barra|Fachechi|Alessandrelli|Lepre` sur docs/ et
refs.bib : 0 occurrence).

| arXiv / DOI | titre court, auteurs | à citer ? | où | contredit / devance ? |
|---|---|---|---|---|
| 2605.13721 / 10.1016/j.neunet.2026.109729 | DLAM, Barra, Durante, Ladiana, Marra Solazzo | oui | main.tex Related work (1077-1106, § « Missing-modality robustness ») | Couches = modalités sensorielles, complétion inter-modale ; contrôle analytique à couplages fixés. Pas de section lésion ni modalité manquante (HTML lu). Devance le cadrage « mémoire associative multimodale », ne contredit pas. |
| 2503.04454 | Cooperativeness in multidirectional AM, Alessandrelli, Barra, Ladiana, Lepre, Ricci-Tersenghi | oui, prioritaire | Related work + limites B-3 (main.tex:365-400) | Couches d'entropies hétérogènes → amplitudes de rappel égales (HTML lu). Contre-prédiction théorique de « l'amplitude suit l'entropie par modalité » et de l'effet principal de requête. Ne réfute aucune affirmation survivante (B-3 est déjà « compatible avec le nul »). |
| 2503.15353 | The importance of being empty, Agliari, Fachechi, Luongo | oui | limites B-2/B-3 (lésion = entrées vides) | Entrées blanches ≈ données manquantes ; Hebb avec dropout comme point fixe. Analogue analytique de la lésion. |
| 2505.18796 / 10.1016/j.physa.2025.130871 | TAM supervisé/non supervisé, Alessandrelli et al. | facultatif | Méthode, puissance | Seuils de taille d'échantillon par couche : référence pour n de la sonde. |
| 2501.16789 / 10.1016/j.neunet.2025.108181 ; 2503.06274 | Networks of Hebbian networks ; L-directional AM | facultatif | Related work | Désenchevêtrement multicanal ; couplages anti-hebbiens posés, pas appris. |
| 2610.08612 | Modular RBM, Agliari, Lepre, Roscani | non (nerve-wml/N10-D) | — | — |

Où ajouter : un paragraphe « Associative-memory models of multimodal binding »
dans Related work, et une phrase dans les limites B-3 : sous couplages hebbiens
fixés, la théorie prédit des amplitudes égales entre couches, donc un écart
d'exactitude par requête ne se lit pas comme une asymétrie structurelle.
