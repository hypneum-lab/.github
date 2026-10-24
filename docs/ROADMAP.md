# Hypneum Lab — Roadmap 2026-11 → 2027-10

Version 1 du 25 octobre 2026. Chercheur : Clément Saillant (indépendant, ~10 h/semaine). Source : revue complète des hypothèses du 24/10/2026 (PR hypneum-lab/.github #3). Suivi : GitHub Projects « Hypneum — Programme 2026-27 » + ce fichier + page Outline.

## Principes

1. **Vérité avant nouveauté.** On ne lance rien de neuf tant qu'un chiffre faux reste dans un README, un papier ou un fichier Zenodo.
2. **Falsifiable avant testé.** Une hypothèse entre en phase de test seulement si elle a un nul calibré, un critère de réfutation écrit et un verdict informatif en cas de négatif.
3. **Une préreg, un test, un verdict.** Pas de nouvelle préreg tant que la précédente n'a pas rendu son verdict (exception : un addendum de contrôle sur une campagne en cours).
4. **Le calcul suit les machines.** macM1 et KXKM-GPU sont pris par N10-C jusqu'à mi-novembre ; CPU léger sur electron-server, CPU lourd sur KXKM en `nice 19`, jamais sur GrosMac.
5. **Dix heures par semaine.** Deux soirées (arbitrage lundi, écriture jeudi) et un demi-week-end (calcul et analyse samedi). Les agents rédigent et exécutent ; le chercheur décide, lance, valide, signe.

## Les quatre phases des trois premiers mois

| Phase | Semaines | Objectif | Jalon de sortie (GitHub milestone) |
|---|---|---|---|
| **0 — Vérité** | S1–S2 (26 oct → 8 nov) | Rétracter et corriger ce qui est faux ; sécuriser l'antériorité ; geler N10-C-bis avant que KXKM se libère | **M0 Vérité — 8 nov 2026** |
| **1 — Falsifiable** | S3–S5 (9 → 29 nov) | Rendre DR-3, test 6, DR-0 et les préregs bouba_sens mesurables ; évaluer N10-C ; lancer N10-C-bis | **M1 Falsifiable — 29 nov 2026** |
| **2 — Dix hypothèses** | S6–S10 (30 nov → 3 jan) | Exécuter les dix tests qui tranchent le plus pour le moins ; démarrer les pilotes « matière » et WML-JEPA | **M2 Dix hypothèses — 3 jan 2027** |
| **3 — Écrire** | S11–S13 (4 → 24 jan) | Note méthodologique (nuls calibrés + errata) soumise ; rapport N10-C/N10-C-bis ; GO/NO-GO axe matière | **M3 Note méthodo + GO/NO-GO — 24 jan 2027** |

### Phase 0 — Vérité (S1–S2)

| Sem. | Tâches (≈ 10 h) | Dépôt | Hôte | Fait quand |
|---|---|---|---|---|
| S1 (26 oct–1 nov) | Fusionner les 3 PR du 25/10 (avenant N10-C-bis, fix ε kiki-flow, calibration Me6) après lecture · Retirer des README/ROADMAP les « PASS » sans artefact (baby-brain) et les affirmations d'énergie (micro-kiki, BSK) · Retirer la mention « préenregistré OSF » de bouba_sens · Bylines auteur unique dans 5 dépôts · Lot e-Soleau : les préregs locales encore confidentielles (une après-midi) | tous | — | 0 chiffre sans artefact dans un README ; 5 bylines corrigées ; reçus e-Soleau archivés |
| S2 (2–8 nov) | **Geler N10-C-bis** (tag annoté + SWHID) avant le 6 nov · Localiser les checkpoints bouba_sens (Studio / T7) et ré-évaluer Me6 à n ≥ 1024 ; rétracter B-3 sur la magnitude si confirmé ; corriger ADR, .zenodo.json, main.tex §4.4 · Fusionner kiki-flow PR #27 (balayage ε) et référencer Zenodo 23619954 dans ERRATUM (le correctif ε est déjà sur `main`, PR #25) · `loihi_stub.py` (Lava archivé) et main.tex nerve-wml alignés | bouba_sens, kiki-flow, nerve-wml | ES (CPU), Studio si checkpoints | tag `n10c-bis-freeze-*` + SWH ; verdict B-3 écrit ; erratum publié |

### Phase 1 — Falsifiable (S3–S5)

| Sem. | Tâches | Dépôt | Hôte | Fait quand |
|---|---|---|---|---|
| S3 (9–15 nov) | **N10-C-bis démarre sur KXKM** (≈ 7 nov) · Indice RCI pour DR-3 (mKNN calibré / GW / persistance, nul « substrats non entraînés », TOST 0,25) sur les données G5 · Test 6 → profil de treillis Π, décision préenregistrée | dream-of-kiki, nerve-wml | ES | RCI calculé sur ≥ 3 substrats ; amendement DR-3 rédigé |
| S4 (16–22 nov) | **N10-C terminée sur macM1 (≈ 15 nov) : évaluation + archive ES** · Amendement DR-0 (budget en bits effacés + trafic), DR-1 sélective, `downscale` → `rescale` · Invariants N/W : inclusion de traces (Quint/TLA+) + property-based testing + 2 propriétés de vivacité | dream-of-kiki, nerve-wml | KXKM (éval), ES | rapport N10-C descriptif (sans lecture positive) ; spec amendée |
| S5 (23–29 nov) | Préregs bouba_sens v0.7–v0.9 : décodabilité + PID (R/U/S) co-primaires, contrôle positif bouba/kiki (monde physique), seuil Me6 calibré sur le nul · Dépôt OSF ou Octopus de v0.7 · Préparer les dix tests de la phase 2 (scripts, graines, nuls) | bouba_sens, tous | ES | v0.7 déposée ; 10 scripts prêts |

### Phase 2 — Dix hypothèses (S6–S10)

Ordre = rapport « ce que ça tranche » / coût (revue §4.1). macM1 libre à partir du 15 nov ; KXKM-GPU libre à la fin de N10-C-bis (estimation : début décembre, à préciser d'après le débit).

| Sem. | Hypothèse (catalogue) | Dépôt | Hôte | Durée | Verdict attendu |
|---|---|---|---|---|---|
| S6 (30 nov–6 déc) | **NH-01** rêve ≠ downscale : HopfieldDreamWML (unlearning Fachechi-Agliari-Barra) vs shrink · ~~NH-58 ε-température~~ (tranché le 25/10, PR #27 : gap insensible à ε) → remplacer par **NH-63** F monotone / réinjection JKO (cause structurelle de l'écart rapide/rigoureux) | nerve-wml / dream-of-kiki ; kiki-flow | ES, KXKM-CPU | heures ; 1 j | formule du rêve ou SHY reformulé ; flot ou thermostat |
| S7 (7–13 déc) | **NH-59** spinodale (balayage λ_J) · **NH-60** coarsening t^{1/3} sous double puits · **NH-20** splitting Lie O(τ) vs Strang O(τ²) | kiki-flow ; dream-of-kiki | KXKM-CPU | 1 j chacun | « émergent » ou pas ; DR-2 devient une loi d'ordre ou une convention |
| S8 (14–20 déc) | **NH-28** alphabet dimensionné par le jitter (SER par taille, prédiction 16 > 64) · **NH-81** J/token mesurés spiking vs dense (powermetrics, NVML) · **NH-85 (micro-kiki)** baseline RAG brut vs Aeon | nerve-wml ; BSK/micro-kiki | macM1, KXKM-GPU | 1 j ; 2 j ; 2 j | codebook fixé par la physique ; argument énergie fermé ou rouvert ; couche mémoire justifiée ou non |
| S9 (21–27 déc) | **Tampon** (Noël) : rattrapage, relectures, aucune nouvelle hypothèse | — | — | — | — |
| S10 (28 déc–3 jan) | **NH-77** WML-JEPA : LeWorldModel latent comme substrat baby-brain, stades vs bras chronologique (démarré S6 en tâche de fond sur macM1) · **NH-03** TTT comme substrat C+ vs épisodes discrets à budget égal · **NH-07** RECOMBINE inter-domaines avec gate d'admission · **R8-H1** NcaWML budget de retour d'attracteur (pilote « bio ») | baby-brain ; dream-of-kiki ; nerve-wml | macM1 ; KXKM-GPU ; ES | 1–2 sem ; 1 sem ; 1 sem ; 1–2 sem | premier test réel de « WML de zéro » ; survie de DR-0 ; réouverture DR-4 ; premier substrat non neuronal |

Pilotes « matière » (track M) : NH-01 (S6) et NH-59/60 (S7) sont les deux pilotes de l'axe ; horloge GO/NO-GO = 8 semaines → **décision S13**.

### Phase 3 — Écrire (S11–S13)

| Sem. | Tâches | Livrable |
|---|---|---|
| S11 (4–10 jan) | Note méthodologique « Calibrated nulls and errata in a solo preregistered programme » : B-1/B-2 en équivalence (TOST), nul d'extrême Me6, ε Sinkhorn, VQ ×10, N-3 tautologique ; 8–10 pages | brouillon v0.1 (TMLR ou ReScience C) |
| S12 (11–17 jan) | Rapport N10-C + N10-C-bis (descriptif + préenregistré) ; relecture indépendante (critic) ; dépôt arXiv Paper 1 v0.2 + Zenodo dream-of-kiki ; HAL pour les trois papiers | rapport ; DOIs |
| S13 (18–24 jan) | **GO/NO-GO axe matière** (critères A1–A5 de R7) ; **GO/NO-GO R8-lite** ; soumission de la note méthodo ; bilan trimestriel (KPIs) ; roadmap v2 | décisions écrites (ADR) ; soumission ; roadmap v2 |

## Mois 4 à 6 (par quinzaine, février → avril 2027)

| Quinzaine | Objectif | Dépend de |
|---|---|---|
| Q1 (25 jan–7 fév) | Réponses aux relectures de la note méthodo ; préreg des hypothèses survivantes de la phase 2 (niveau L3 : Octopus ou OSF) | verdicts phase 2 |
| Q2 (8–21 fév) | Paper 1 GENIAL reformulé : DR-0 budget, DR-1 sélective, DR-3 avec RCI, DR-4 inter-domaines, prior art Hopfield rêveurs ; retrait des « axiomes » au profit de « hypothèses de cadre » | RCI (S3), NH-01, NH-20 |
| Q3 (22 fév–7 mars) | bouba_sens : publication du nul en équivalence (TOST) + calibration Me6 ; v0.7 exécutée si déposée en S5 | S5 |
| Q4 (8–21 mars) | nerve-wml : papier N10-C/N10-C-bis ; décision sur le GTM (garder comme porteuse physique ou retirer) | N10-C-bis |
| Q5 (22 mars–4 avr) | baby-brain : premier résultat WML-JEPA à 5 graines ; décision Path-B | NH-77 |
| Q6 (5–18 avr) | Si GO matière : deuxième vague (machine d'Ising à oscillateurs simulée comme porteuse du GTM, NH-28/NH-31) ; sinon fermeture documentée | S13 |
| Q7 (19 avr–2 mai) | Bilan semestriel ; roadmap v3 ; décision BSK (relance seulement si J/token favorable) | NH-81 |

## Mois 7 à 12 (trimestres, mai → octobre 2027)

| Trimestre | Jalons |
|---|---|
| T3 2027 (mai–juil.) | Deuxième campagne préenregistrée (une seule, choisie parmi : RECOMBINE inter-domaines à l'échelle, WML-JEPA développemental complet, GTM sur substrat oscillant) ; Paper 1 soumis ; registre public des nuls calibrés (bibliothèque) publié |
| T4 2027 (août–oct.) | Résultats de la deuxième campagne ; Paper 2 (substrats) ou nerve-wml selon verdicts ; revue annuelle des hypothèses (comme le 24/10/2026) ; roadmap 2027-28 |

## Dépendances et calendrier des machines

| Hôte | 26 oct → 7 nov | 7 → 15 nov | 15 nov → début déc | déc → jan |
|---|---|---|---|---|
| KXKM GPU | N10-C (graines 73/101/131) | N10-C-bis | N10-C-bis | NH-81, NH-03, campagnes |
| KXKM CPU (`nice 19`) | libre pour balayages | idem | idem | idem |
| macM1 | N10-C (graines 0/17/42) | N10-C | libre : WML-JEPA, NH-28 | WML-JEPA |
| electron-server | calibrations, RCI, scripts | idem | idem | idem |
| Studio | éteint ; réveil ponctuel pour les checkpoints bouba_sens (S2) | — | — | — |
| GrosMac | rien | rien | rien | rien |

## Ce que l'on ne fait pas en 2026-27

Pas de nouveau dépôt ni de nouveau « lab » ; pas de QPU ; pas de wet-lab ; pas d'achat de matériel ; pas d'axe conscience ; pas de relance BSK avant mesure J/token ; pas de dépôt OSF d'une préreg sans nul calibré ; pas plus d'une campagne lourde à la fois.

## Indicateurs mensuels

| Indicateur | Cible fin janvier 2027 |
|---|---|
| Hypothèses avec verdict rendu (sur les 10 de la phase 2) | 10 |
| Chiffres sans artefact dans README/papiers | 0 |
| Préregs déposées (L3 : OSF/Octopus) | ≥ 2 (v0.7 bouba_sens, N10-C-bis) |
| Préregs sécurisées (L1 gel + L2 e-Soleau/Zenodo) | toutes les locales actives |
| Errata publiés avec cause racine | 100 % des rétractations |
| Soumission | note méthodo soumise |
| Temps chercheur | ≤ 10 h/semaine en moyenne, mesuré |

## Risques et parades

| Risque | Parade |
|---|---|
| Récidive du « jamais testé » (nouvelles préregs sans exécution) | principe 3 ; une seule campagne lourde à la fois ; KPI « verdicts rendus » |
| Quotas API (Claude, OpenAI) en pleine campagne | lancer les agents longs en début de fenêtre ; briefs sauvegardés ; relecture indépendante Claude en secours |
| Machines : Tower mort, Studio éteint, macM1 pris 3 semaines | calendrier ci-dessus ; CPU sur ES/KXKM ; réveil Studio planifié S2 seulement |
| Temps : recherche d'emploi, imprévus | tampon S9 ; phases coupables de glisser d'une semaine chacune sans remettre M3 en cause |
| Re-interprétation post hoc d'un résultat | règle d'interprétation écrite dans chaque préreg (N10-C-bis) ; verdict rendu par script, pas par lecture |
| Artefacts gitignorés | definition of done : JSON commis ou DOI Zenodo, sinon le chiffre n'existe pas |
| Dispersion vers les nouveaux axes | track M et R8-lite limités à 2 pilotes chacun ; GO/NO-GO daté S13 |
