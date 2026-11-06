# kiki-flow-research — vérification des références (2026-11-01)

SHA `8470e93a41bb82bd77bc26e7a00399b7fadfb0ec`. Résolution : Semantic Scholar batch (`scratchpad/kfr_refs/s2.tsv`, `s2_missing.tsv`, résumés `s2_abs.json`), Crossref pour les DOI de venue, HTML arXiv pour baradat2025 (convention du pas). Aucune référence citée de mémoire.

## A. `paper/references.bib` (22 entrées ; utilisées par `paper/main.tex`)
| clé | DOI/arXiv résolu | statut | note |
|---|---|---|---|
| levelt1989speaking | 10.7551/mitpress/6393.001.0001 | OK | *Speaking*, MIT Press 1989. |
| baddeley2000episodic | 10.1016/S1364-6613(00)01538-2 | OK | Trends Cogn. Sci. 2000. |
| jko1998 | 10.1137/S0036141096303359 | OK | SIAM J. Math. Anal. 1998 (S2 indique 1996 = préprint). |
| meimontanari2018 | 10.1073/pnas.1806579115 | OK | PNAS 2018. |
| feydy2019interpolating | arXiv:1810.08278 | OK | AISTATS 2019. |
| kirkpatrick2017ewc | 10.1073/pnas.1611835114 | OK | PNAS 2017. |
| dell1986 | 10.1037/0033-295X.93.3.283 | OK | Psych. Review 1986. |
| levelt1999 | 10.1017/S0140525X99001776 | OK | BBS 1999. |
| baddeley1992working | 10.1126/science.1736359 | OK | Science 1992. |
| conger2025monotone | arXiv:2506.22947 ; publié 10.1137/25m1780808 | année-venue fausse + attribution douteuse | Désormais SIAM J. Appl. Dyn. Syst. ; le « régime du Thm 3.4 » (main.tex:263-272) suppose un flux W2 continu, pas l'Euler euclidien du script λ. |
| gallouet2017splitting | 10.1137/16M106666X | attribution douteuse | G–M = splitting W2 + Fisher–Rao pour flux KFR ; cité pour l'intégration « exacte » d'un drift non conservatif (main.tex:203-211, 287-297). |
| peyre2015entropic | 10.1137/15M1010087 (arXiv:1502.06216) | attribution douteuse | Existe, DOI correct ; cité pour le plancher stationnaire Var* = (ε/τ)g(τ) (main.tex:836-840), que le papier ne donne pas sous cette forme. |
| baradat2025sinkhorn | arXiv:2502.12666 ; publié 10.1137/25m1736001 | année-venue fausse | Désormais SIAM J. Math. Anal. ; affirmation α/2 Δ correcte dans leur convention (coût |x−y|²/2), mais le code E1b n'est pas dans cette convention (facteur 2). |
| baradat2026rate | arXiv:2604.08283 | OK | Taux de convergence du JKO entropique. |
| caucheteux2026gwf | arXiv:2605.31369 | OK (venue invérifiable) | « ICML 2026 » non confirmé par API. |
| han2026wflow | arXiv:2605.11755 | OK | |
| segal2026jkorag | arXiv:2607.24776 | OK | |
| kim2026allomorph | arXiv:2609.04708 | OK (venue invérifiable) | « EMNLP 2026, to appear » non confirmé. |
| bazhenov2026sleep | arXiv:2606.08447 | OK | |
| zhang2026silent | arXiv:2609.31630 | OK (venue invérifiable) | atelier NeurIPS 2026 non confirmé. |
| mordant2026sinkhornmetric | arXiv:2609.14651 | OK | le titre bib omet « horizontal perturbations » ; à aligner. |
| dus2026crossdiffusion | arXiv:2604.01819 | OK | |

Comptes A : 15 OK ; 3 OK à venue invérifiable ; 2 année-venue fausse (dont conger aussi douteux) ; 2 attribution douteuse ; 0 introuvable.

## B. `paper/workshop/references.bib` (12 entrées)
| clé | DOI/arXiv résolu | statut | note |
|---|---|---|---|
| friston2010 | 10.1038/nrn2787 | OK | |
| parr2017 | 10.1038/s41598-017-15249-0 | attribution douteuse | Papier sur mémoire de travail/salience ; cité pour « variational message passing » (s2:10) → Parr et al. 2019, 10.1038/s41598-018-38246-3. |
| daCosta2020 | 10.1016/j.jmp.2020.102447 | OK | |
| lecun2022 | OpenReview (non résolu par API) | introuvable (API) | position paper OpenReview 2022, existence probable mais non vérifiée par API. |
| assran2023ijepa | arXiv:2301.08243 | OK | |
| bardes2024vjepa | arXiv:2404.08471 | OK | |
| jko1998 | 10.1137/S0036141096303359 | OK | doublon main. |
| bunne2022wgf | arXiv:2106.06345 | OK | |
| newboucard2004lexique | 10.3758/BF03195598 | attribution douteuse | Lexique 2 cité pour « Lexique.org 3.83 » (s4:68, s5:151) → New et al. 2007, 10.1017/S014271640707035X (ou doc. Lexique 3). |
| honnibal2020spacy | logiciel (non résolu) | introuvable (API) | DOI Zenodo non vérifié. |
| phonemizer | 10.21105/joss.03958 | OK | JOSS 2021. |
| levelt1989speaking | 10.7551/mitpress/6393.001.0001 | mauvaise attribution | « Levelt's working-memory architecture » (s2:65) : le livre traite de la production de parole, la mémoire de travail est Baddeley. |

Comptes B : 7 OK ; 1 mauvaise attribution ; 2 attribution douteuse ; 2 introuvables par API.

## C. Citations du workshop sans entrée bib (7, rendues « ? » à la compilation)
| clé | DOI/arXiv résolu | statut | note |
|---|---|---|---|
| baddeley1974 | 10.1016/S0079-7421(08)60452-1 | OK (bib manquante) | |
| reimers2019sbert | arXiv:1908.10084 | OK (bib manquante) | |
| rezende2015variational | arXiv:1505.05770 | mauvaise attribution (bib manquante) | Normalizing flows ; cité pour « affine flows parameterized by text » (s2:40). |
| vandenoord2017neural | arXiv:1711.00937 | OK (bib manquante) | |
| chen2018neural | arXiv:1806.07366 | OK (bib manquante) | `\citealp` s1:17. |
| saillant2026nervewml | — | introuvable | auto-citation sans DOI. |
| saillant2026kikiflow | — | introuvable | auto-citation sans DOI (le Zenodo existant publie le pas non-JKO). |

Comptes C : 4 OK ; 1 mauvaise attribution ; 2 introuvables ; 7/7 sans entrée bib.

## D. `paper/arxiv_bundle` (6 entrées)
levelt1989speaking, baddeley2000episodic, jko1998, meimontanari2018, feydy2019interpolating, kirkpatrick2017ewc : identiques aux 53 premières lignes de `paper/references.bib`, toutes **OK** (voir A).

## E. Références manquantes (résolues)
| référence | DOI/arXiv | où l'ajouter |
|---|---|---|
| Turing 1952, *The chemical basis of morphogenesis* | 10.1098/rstb.1952.0012 | main.tex:165 (terme de Turing nommé sans réf.) |
| Carlier, Duval, Peyré, Schmitzer 2017 | 10.1137/15M1050264 | §2 et §5.7 (convergence des schémas entropiques) |
| Hraivoronska & Santambrogio 2025, JKO entièrement discret | arXiv:2504.13513 | §5 / ERRATUM (épinglage de grille, convergence en h et n) |
| Di Francesco & Fagioli 2013, interaction non locale à deux espèces | 10.1088/0951-7715/26/10/2777 | §2 (antériorité multi-espèces) |
| McClelland & Rumelhart 1981 | 10.1037/0033-295X.88.5.375 | §3.1 (activation interactive) |
| Parr et al. 2019 | 10.1038/s41598-018-38246-3 | workshop s2:10 (remplace parr2017) |
| New et al. 2007 (SUBTLEX/Lexique 3) | 10.1017/S014271640707035X | workshop s4:68, s5:151 |
| Agliari et al., *Networks of Hebbian networks* | arXiv:2501.16789 ; 10.1016/j.neunet.2025.108181 | main.tex l.142-159 et Discussion l.869-885 |
| Agliari, Lepre, Roscani 2026, RBM modulaires | arXiv:2610.08612 | main.tex Discussion l.869-885 |
| Agliari et al. 2024, régularisation/early-stopping/rêve | 10.1016/j.neunet.2024.106389 | main.tex §5.9 l.696-799 (optionnel) |
| Agliari et al. 2025, L-directional associative memories | arXiv:2503.06274 | non nécessaire ici |
| Agliari et al. 2026, dense auto-hétéro | arXiv:2609.32605 | non nécessaire ici |
| Albanese et al. 2026, recuit partiel | arXiv:2605.10304 | sans lien direct avec kiki-flow |
| Fachechi, Agliari, Barra 2019, dreaming NN | 10.1016/j.neunet.2019.01.006 | non nécessaire ici (dream-of-kiki) |

Aucun papier du groupe de Rome n'est cité dans les trois manuscrits (`git grep -niE "agliari|barra|fachechi|hopfield"` sur `paper/ docs/ README.md` : 0 résultat).

## Comptes globaux
- 32 entrées bib uniques (22 main + 10 propres au workshop ; arxiv_bundle = sous-ensemble) + 7 citations pendantes = 39 références contrôlées.
- Entrées uniques : **24 OK** (18 main dont 3 à venue invérifiable ; 6 workshop) ; **8 non OK** : 2 année-venue fausse, 4 attribution douteuse (gallouet2017, peyre2015, parr2017, newboucard2004 ; conger2025 compté en venue), 2 introuvables par API (lecun2022, spaCy).
- Mauvaises attributions d'usage : 2 (levelt1989 dans le workshop s2:65, entrée OK par ailleurs ; rezende2015 pendante s2:40).
- Citations pendantes : 7/7 sans entrée bib ; 4 existent, 1 mauvaise attribution, 2 introuvables.
- Introuvables au sens strict (aucune trace) : 2 (auto-citations saillant2026*).
