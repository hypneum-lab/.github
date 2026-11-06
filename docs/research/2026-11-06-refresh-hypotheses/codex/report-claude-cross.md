# Passe croisée Claude Opus, remplace gpt-6-astra (limite d'usage 19:48 CET, 0 rapport)

Modèle claude-opus-5-5, 2026-11-06, environ 19:50-20:05 CET. Brief : `codex/brief-cross.md`. Le harnais a refusé l'écriture directe par l'agent ; ce fichier est la transcription intégrale de son rapport, recopiée par la session orchestratrice sans modification de fond.

Méthode : sources de `repos/`, branches de PR lues par `git show` sans checkout ; GitHub en lecture seule (`gh`) : issues #72, #74, #80 et PR #66 de bouba_sens, PR #118 de nerve-wml ; références résolues par les API arXiv, Crossref et OpenReview `notes/search` (`notes?id=` répond 403) ; python3 léger seulement ; aucun code des dépôts exécuté, aucun fichier existant modifié. Fichiers de travail : `scratchpad/xcheck/`. Le dossier `critique/` n'a pas été lu.

## Décompte des verdicts
- Tableau principal, 54 éléments : 30 confirmés, 5 réfutés, 17 nuancés, 2 non vérifiables.
- Comptes du rapport, 7 éléments : 6 confirmés, 1 réfuté.
- Total, 61 éléments : 36 confirmés, 6 réfutés, 17 nuancés, 2 non vérifiables. Environ 45 vérifications ponctuelles dans `repos/`.

## Comptes du rapport
- 24 / 48 / 25 / 0 = 97 : confirmé (nerve 1/9/4, dok 3/5/7, bouba 8/9/6, kfr 10/10/4, mk 2/5/3, bb 0/6/1, transversal 0/3/0, veille 0/1/0).
- Motifs 16 + 3 + 3 + 2 = 24 : confirmé, à une nuance : les « 3 négatifs selon préreg » ne sont que 2 négatifs distincts (E1b compté deux fois, C l.41 et A l.120).
- 26 = 12 + 11 + 3, et 31 → 26 : confirmé.
- 15 MAJEUR dont 2 prolongent le 01/11 (N-6, N-14) : confirmé.
- Q6 (a) 17 = 14 + 3 : confirmé.
- « 13 lignes changent de classe » : réfuté, table incomplète. La règle écrite fait aussi changer NWML-PRH (A l.140, non concluant → amendé), BB-01 (A l.193, non concluant → amendé), BS-v07 (A l.190, en attente → amendé), MK-01 (A l.209). Soit 17 lignes : confirmé −5, réfuté −1, nul −1, en attente −3, non testé 0, non concluant +3, amendé +7.

## Tableau des vérifications (élément | source | verdict | preuve)
1. NWML-N10C fermer (non-test) | `nerve-wml:docs/milestones/n10c-…-closure-2026-11-05.md:43-45,53` | confirmé | « No verdict, positive or negative, is drawn » ; motif daté du 30/10, antérieur à la lecture.
2. DOK-H14 fermer | `dok:docs/results/2026-11-06-e1-small-analysis.md:164-235` | nuancé | Chiffres exacts ; mais H14-B attend #92 et H14-A appelle DOK-N1 : la ligne a encore une hypothèse à tester (contredit `delta:10`).
3. DOK-E1 « abandonné, jamais lancé » | `dok:docs/osf-amendment-e1-small-2026-10-30.md:82-90` | nuancé | Abandon confirmé, décidé après exposition aux chiffres ; `cat:93` écrit « 141 seeds 35B in-flight 06-18 » et les tags `e1-35b-cycle3-v1/v2` existent. Écrire « aucun résultat committé ».
4. E-1 / N-12, ordre fixe et RECOMBINE no-op | `dok:scripts/e1_harness.py:214-223`, `e1_profiles.py:54-55,139-140` | confirmé.
5. BS-SF45 fermer | `bouba:docs/paper/main.tex:525-540,572-584` | confirmé | « cannot be reproduced from the repository » ; « the respiratory column is never read » ; « Branch B » et « robustly distinguishable » toujours l. 607 et 611.
6. BS-AMEDI, COMP, TAU, CBF, S14c | erratum `main.tex:620-815` ; ADR-0013:27, 0014:39, 0015:29, 0016:34 | confirmé | tous `data_dir=data/sf_phase2_adapted`.
7. BS-Q3, BS-N12 « sous réserve » | ADR-0019:15, milestone q3plus | nuancé | ADR-0024:36 nomme « N12 and Q3/Q3+ » parmi les résultats du régime qui n'apprend pas : seconde base à la fermeture.
8. BS-B2 reformuler | `main.tex:1062-1076,1110-1124` | confirmé | « B-2 is 0 by construction and the measurement cannot fail » ; `n_seeds_gate_pass 0`.
9. E-7, date d'ADR-0024 | ADR-0024:1-5 | vérifié | « Accepted — PI decision 2026-10-26 » : antérieur au catalogue v2.
10. KFR-H24 | `e1b_peyre_bias.json:124-130` | confirmé | pente 0,600 ; « REFUTED ».
11. M5 | règle de lecture :3,16-19,31-39 ; verdict :9-23 | confirmé | règle fixée avant résultat ; 50/60.
12. NH-58 fermer | `kfr:ERRATUM.md:437-452` | nuancé | §11 ne ferme que la clause 1 ; clause 2 non testée ; clause 3 = KFR-N3.
13. KFR-H2 | ERRATUM §13 :591-601 | nuancé | fermeture confirmée mais « KFR-N5 le rend testable ».
14. KFR-H4 à H7 | ERRATUM :43-58 | confirmé | « withdrawn », « artefact ».
15. KFR-H28 fermer | ERRATUM §12 :485-533 | confirmé | l'erratum donne raison au relecteur.
16. Q2 (b) « effet pervers » : mapper KFR-H28 sur « rétracté » | `delta:148` | réfuté | inverse la direction : compterait comme retirée une critique validée.
17. MK-01 fermer | `mk:docs/ERRATA.md:144-194` | réfuté comme fermeture | « MK-01 … stays "non concluant (provenance)" until then » (l.193-194) ; part 46,4 / 69,6 reste : « reformuler ».
18. MK-09 | `eval_cognitive_ab.json` ; `full_pipeline_server.py:823-824,890` | confirmé | Δ −0,0102, 14/16 ; juge et RBD `None`.
19. MK-02 | `ERRATA.md:186-188` | nuancé | preuve dans M18, pas l'ERRATA.
20. N10-D reformuler | `P100:protocol.md:52-62` | confirmé | « does **not** test whether the message is informationally necessary ».
21. DOK-DR4 | `dr4-profile-inclusion.md:62-82`, `e1_profiles.py:139-140` | confirmé.
22. NH-01 / E-2 | ablation :28-33 ; #147 | confirmé sur le fond, nuancé sur le mot | 3,89 ; 1,90 ; 3,04 : v2 juste en arithmétique mais incomplet.
23. B22 « aggravé » | amendement rescience :10-13,82-89 | nuancé | résultat inter-ISA, borne la portée.
24. NH-20 reformuler | préreg M12 :36-40 ; note :353-422 | nuancé | « nul calibré = Strang exact » est une calibration.
25. N-1 | issues #72, #74 | confirmé.
26. N-2 | `main.tex:1185-1192` | confirmé.
27. N-3 | issue #80 | confirmé.
28. N-4 | `actionsense.py:5-6` ; amendement v0.7 :346-349 | confirmé.
29. N-5 | `RM:160` | nuancé | « TOST seulement si marges justifiées » ; « Q3 » = 22 février-7 mars.
30. N-6 | PR #66 | confirmé.
31. N-7 | `P100:protocol.md:86-89,104-105` ; `nh96-null.md:20-24` | confirmé.
32. N-8 | arXiv:2609.34373 | confirmé, sous-évalué | appris 0,482 « indistinguishable from silence (p = 0.400, n = 25) », ingénié 1,000 ; « self-play 0.980 collapses to 0.144 ».
33. N-9 | `priorites-hypotheses.md:144-210` | confirmé | liste du 30/10 antérieure à la renumérotation.
34. N-10 | `platonic_rh_alignment.py:85,112` ; `paper1/main.tex:104` | confirmé.
35. N-11 | `veille/n10d-tour1.md` | confirmé | 0 occurrence de 2611.01666.
36. N-13 / C-6 / Q4 | `RM:10-12,57` | nuancé | principe 4 interdit toute nouvelle campagne GPU avant S6 ; Q4 (b) invoque une exception qui ne couvre pas la règle.
37. N-14 | ERRATUM :700-702, 885-895 ; papier :33-37 | confirmé.
38. N-15 | #147 | confirmé.
39. §4.1 puissance | recalcul | confirmé | m = 15 ; 0,617 / 0,804 / 0,933 / 0,989 ; k = 33 / 23 / 16.
40. §4.4 coût γ ≤ 5 | recalcul | confirmé | 1,34 à 2,49 h.
41. §4.2 B-3 | ADR-0026:350-355 ; milestone Me6 :46-79 | confirmé.
42. C-3 PEAM | OpenReview QkJkp8E5EA | confirmé et tranché | venue « CoRR 2026 » = miroir arXiv : un seul travail.
43. C-4 condition de VEI-8 « non remplie » | `micro-kiki.tex:50,329` + JSON | réfuté | « +7 pp » = domaine power (0,5543 − 0,4839), maximum de 6 écarts à n = 5 : sélection ; P(max ≥ 0,0703) ≈ 0,42 par inversion de signe.
44. §4.6 S2 H14-B « ne peut pas échouer » | analyse E1-small :196-206 | réfuté | « peut échouer … faiblement … faible pouvoir de falsification ».
45. KFR-N1 antériorité | arXiv:1802.08089 | réfuté, antériorité existe | SLA de Wibisono, consistant pour cible gaussienne ; l'inventaire la citait, la synthèse l'a retirée.
46. VEI-2 | arXiv:2603.09384 | nuancé | Marinari 2026 déjà connu (`seen-arxiv.txt:544`), non cité ; nul trivial.
47. MK-N1 | nouvelles :36-39 | nuancé | n = 30 sans marge d'équivalence ; biais de longueur connu (arXiv:2404.04475).
48. BB-N1 | arXiv:1412.6980 | nuancé | issue prévue par construction : test de harnais.
49. BOUBA-N4 | — | nuancé | précondition descriptive, sans nul.
50. BOUBA-N1 | — | nuancé | zone sans décision entre P95 et P99.
51. T-N2, KFR-N2, KFR-N3, KFR-N5, BOUBA-N3, VEI-1 | — | confirmé | falsifiables ; KFR-N3 = calcul de forme close, « vérification ».
52. Concurrence des campagnes KXKM | `iCS` l.5-6 ; PR #118 | non relevé par le rapport | #92 (GPU) et 8 workers `p8c_nocap --confirmatory` ensemble, ADR-0003 non signé.
53. BOUBA-N2 antériorité | Crossref | non vérifiable.
54. Durée de #92, révision PEAM | — | non vérifiable.

## BLOQUANT
- X-B1 — Q2 (b) et l'« effet pervers » (`delta:148`) inversent une direction : KFR-H28 est « confirmé » parce que la critique du relecteur était juste (ERRATUM :493-495). Seul BS-SF45 relève de « rétracté » ; KFR-H2 relève de « réfuté ».

## MAJEUR
- X-M1 table de correspondance incomplète : 17 lignes (16 si MK-01 passe en reformuler) ; bilan −5 / −1 / −1 / −3 / 0 / +2 / +8.
- X-M2 MK-01 fermé contre sa source (ERRATA :193-194) : reformuler.
- X-M3 NH-58 fermé trop largement : seule la clause 1 est close ; clause 3 = KFR-N3.
- X-M4 DOK-H14 (#92, DOK-N1) et KFR-H2 (KFR-N5) ont un successeur qui teste encore : contredit « fermer ».
- X-M5 E-7 n'est pas conditionnel (ADR-0024 du 26/10) ; étendre à BS-B3, BS-OQ1 ; lever la réserve Q3/N12 par ADR-0024:36.
- X-M6 VEI-8 écarté à tort : sélection avérée (p ≈ 0,42) ; nul primaire de MK-N1.
- X-M7 antériorité manquée de KFR-N1 (Wibisono 2018).
- X-M8 charge de KXKM non signalée : #92 et P8c `--confirmatory` ensemble, contre le principe 4, ADR-0003 non signé ; Q4 à réécrire.
- X-M9 N-8 sous-évalué : Chauhan & Bera couvrent ingénié, appris, silence, 25 graines, effondrement cross-play ; la nouveauté de NWML-N1 se réduit au dérangement ; NH-33 doit citer la source.

## MINEUR
- Libellés : S2/H14-B « faible pouvoir de falsification » ; DOK-E1 « aucun résultat committé » ; N-5 « Q3 de la roadmap » ; E-2 « incomplet », B22 « portée bornée » ; MK-02 citer M18 ; NH-20 « calibration ».
- Règle garder/reformuler non appliquée à BS-OQ1, B1, HB1, LOCK, BS-v08/v09.
- « Sept lignes garder » = 5 garder + 2 reporter.
- Paquet (i) : VEI-2 citer Marinari ; MK-N1 marge d'équivalence + Dubois ; BB-N1 « test de harnais » ; BOUBA-N4 sans nul ; BOUBA-N1 zone sans décision.
- Q3 (b) : pour 0,90 en conjonction il faut ≈ 0,95 par backend.
- N-9 : liste du 30/10 antérieure à la renumérotation.
- KFR-N4 : « 8 configurations » = 4 échecs γ ≤ 30 + 4 de γ ≥ 50.

## Références résolues
arXiv : 1802.08089 (Wibisono) ; 2609.34373 (Chauhan) ; 2410.18806 (Zhang) ; 2611.01666 (Xu) ; 2611.08258 (Lepre) ; 2603.09384 (Marinari) ; 1810.12217 (Fachechi) ; 2611.04338 (Chen) ; 2611.00516 (Kurikawa) ; 2611.05636 (Fang) ; 2611.05577 (Modgil) ; 2610.36109 (Zhao) ; 2605.27762 (PEAM, Guo) ; 2502.12666 (Baradat) ; 2610.38129 (Zhang) ; 2405.07987 (Huh) ; 1412.6980 (Kingma) ; 2404.04475 (Dubois).
OpenReview `notes/search` : 2T0Ja28jY5 ; QkJkp8E5EA (CoRR 2026).
Crossref : 10.7554/elife.112891.1 (Pan … Sompolinsky, 2026-11-04) ; 10.1038/s41586-024-07711-7 (Dohare 2024) ; 10.1038/s41562-019-0556-z (Perl 2019).

## 10 changements au rapport
1. Q2 (b) : retirer KFR-H28 ; « rétracté » = BS-SF45 seul ; KFR-H2 → « réfuté ».
2. Table de correspondance : 16 lignes (+ NWML-PRH, BB-01, BS-v07), bilan −5 / −1 / −1 / −3 / 0 / +2 / +8.
3. Comptes : MK-01 et NH-58 → reformuler : 22 / 50 / 25 / 0 ; Q6 (a) = 15 ; NH-58 renvoie à KFR-N3.
4. DOK-H14 et KFR-H2 : « en attente de #92 » / « transférée » plutôt que « fermer ».
5. E-7 : sans conditionnel ; étendre à BS-B3, BS-OQ1 ; lever la réserve Q3/N12.
6. C-4 / MK-N1 : VEI-8 nul primaire ; marge d'équivalence ; Dubois 2404.04475.
7. KFR-N1 : réintégrer Wibisono, requalifier en calibration ou potentiel non gaussien ; VEI-2 citer Marinari.
8. Nouveau MAJEUR KXKM : #92 et P8c ensemble contre le principe 4 ; réécrire Q4 ; aucune lecture « confirmatory » de P8c avant signature d'ADR-0003.
9. N-8 : portée réelle de Chauhan & Bera ; nouveauté de NWML-N1 = dérangement ; source ajoutée à NH-33.
10. Libellés : S2, DOK-E1, N-5, E-2/B22, MK-02, règle garder/reformuler, « 5 garder + 2 reporter », cible par backend Q3 (b).
