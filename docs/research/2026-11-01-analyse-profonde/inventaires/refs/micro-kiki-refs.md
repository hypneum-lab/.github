# Références — micro-kiki + micro-kiki-quantum (vérif. 01/11/2026)

Méthode :
- API arXiv export (lot 1, 35 identifiants) ; Semantic Scholar `s2.py lookup` en lot (41 identifiants et DOI ; repli après des HTTP 429 sur le lot arXiv 2).
- Attributions confrontées aux résumés (`scratchpad/work/api/abstracts.txt`, `abs-sel.txt`).
- Sources des identifiants : `scratchpad/work/ids.tsv` (69 arXiv + 2 DOI, avec emplacements).
- Fichiers concernés : MK = `paper/micro-kiki.tex` ; PA = `docs/paper-a/paper-a-v2.tex` et `c5-references.bib` ; D1 = `docs/papers/paper-a-draft-v1{,-fr}.md` ; RF = `docs/papers/paper-a-reframe-aeon-ami{,-fr}.md` ; OT = `docs/paper-outline-triple-hybrid.md` ; Q = micro-kiki-quantum.

## Problèmes (KO et douteux)

| clé | DOI/arXiv résolu | statut | note |
|---|---|---|---|
| LeCun 2022 « A Path Towards Autonomous Machine Intelligence » (D1 l.12,26,62,271,[10] l.374 ; RF ; FR) | arXiv:2206.15331 résout vers Dakhel et al., « GitHub Copilot AI pair programmer: Asset or Liability? » | mauvaise attribution | Le texte de LeCun est sur OpenReview (pas d'arXiv). Le « seven modules » est probablement six (mémoire, non vérifié par API). BLOQUANT. |
| Aeon (Arslan) (absent de D1) | arXiv:2601.15311 « Aeon: High-Performance Neuro-Symbolic Memory Management… » | attribution manquante | Cité dans MK l.101/286, mais pas dans D1, qui présente Aeon comme un apport propre. BLOQUANT. |
| TD-MPC2 (RF l.45) | arXiv:2410.16662 = « Visual Question Answering in Ophthalmology… » | mauvaise attribution (ID faux) | Le bon identifiant est 2310.16828 (utilisé correctement dans D1). |
| gao2024mola (MK, bib) | arXiv:2403.03432 = Feng et al. « Mixture-of-LoRAs » | mauvaise attribution (ID faux) | Le MoLA de Gao est arXiv:2402.08562 « Higher Layers Need More LoRA Experts » (résolu S2). |
| caro2022 (PA l.171) | 10.1038/s41467-022-32550-3 (Nat. Commun. 2022 ; S2 indique 2021, année du préprint) | attribution douteuse | La borne attribuée, √(log d_eff / n), n'est pas celle de Caro (√(T/N), T = nombre de portes entraînables). |
| du2020 « Theorem 4 bounds SEL » (c5 l.102-104) | 10.1103/PhysRevResearch.2.033125 (PRR 2, 033125, 2020) | attribution douteuse | L'article existe. Le « Théorème 4 » visant SEL n'a pas été vérifié dans le texte intégral. |
| abbas2021effective (c5-references.bib) | 10.1038/s43588-021-00084-1 (S2 : 2020) | année/venue fausse | Typé `inproceedings` alors que c'est un article de Nature Comput. Sci. 1, 403–409 (2021). |
| fano1961 (c5-references.bib) | — (livre, MIT Press) | année/venue fausse | Typé journal « MIT Press » au lieu de `book`. |
| Quantum-PEFT (Q README) | arXiv:2503.05431, Koike-Akino et al. | attribution douteuse | Le résumé décrit une paramétrisation unitaire de Pauli efficace, d'inspiration quantique. Le « QPU required » et le code (fit ⟨Z…Z⟩ sur un scalaire) ne correspondent pas. |
| song2020mpnet (MK bib) | non vérifié | OK mais non utilisé | Entrée bib jamais citée dans le texte. |
| Rubinstein 1997 (D1 ref [20]) | non résolu | introuvable (pas d'ID) | Référence jamais citée dans le texte. |
| Spall 1998 SPSA (Q) | non résolu | introuvable (pas d'ID) | Référence classique, probablement correcte (non vérifiée). |
| holevo1973, nielsen2010 (bib C5) | pas d'ID | OK (non résolu par API) | Références canoniques, métadonnées plausibles. |
| Noms seuls dans OT : MixLoRA, MoLA NAACL 2025, HMoRA, FAS, IonQ, Quantum-Train, QPA, MAGMA, A-Mem | — | introuvable (sans ID) | Plan non soumis : à compléter avant toute rédaction. |
| Cartes de modèles Qwen3.6 / Qwen3.8 (MK) | — | non vérifié | Aucun appel à l'API HF. |

## Références vérifiées OK

| clé | ID résolu | statut | note |
|---|---|---|---|
| LayerNorm | 1607.06450 | OK | |
| HyperNetworks | 1609.09106 | OK | |
| Sparsely-Gated MoE | 1701.06538 | OK | |
| Attention Is All You Need | 1706.03762 | OK | |
| DINO | 2104.14294 | OK | |
| LoRA | 2106.09685 | OK | |
| Codex/HumanEval | 2107.03374 | OK | |
| RETRO | 2112.04426 | OK | |
| DreamerV3 | 2301.04104 | OK | |
| I-JEPA | 2301.08243 | OK | |
| SigLIP | 2303.15343 | OK | |
| DINOv2 | 2304.07193 | OK | |
| MemGPT | 2310.08560 | OK | |
| TD-MPC2 (D1) | 2310.16828 | OK | |
| Larimar | 2403.11901 | OK | |
| V-JEPA | 2404.08471 | OK | |
| SigLIP 2 | 2502.14786 | OK | |
| Qwen3 Tech Report | 2505.09388 | OK | |
| LAS ANN-SNN | 2505.09659 | OK | |
| RBD (reasoning-based debiasing) | 2505.17100 | OK | |
| Catfish | 2505.21503 | OK | |
| V-JEPA 2 | 2506.09985 | OK | |
| QMoE (Nguyen et al.) | 2507.05190 | OK | Q |
| DINOv3 | 2508.10104 | OK | |
| SpikingBrain | 2509.05276 | OK | |
| LeJEPA | 2511.08544 | OK | |
| HyQuT (Kong et al.) | 2511.10653 | OK | Q |
| Activated LoRA KV reuse | 2512.17910 | OK | daté 2025-11-26 |
| Heddad & Bouanane hybrid QMoE | 2512.22296 | OK | Q |
| Recursive LMs | 2512.24601 | OK | |
| KnowBias (Pan) | 2601.21864 | OK | |
| Lee « LR matters » | 2602.04998 | OK | « within 1–2 % » conforme |
| Steele subspace geometry | 2603.02224 | OK | angle principal minimal |
| CAMP (Lu) | 2604.00085 | OK | |
| Brainstacks | 2604.01152 | OK | TinyLlama, Gemma 3 12B ; rSVD |
| PermDoRA | 2606.11262 | OK | |
| Zhang scaling factor | 2606.12883 | OK | loi en racine carrée |
| HYPIC | 2607.01299 | OK | |
| MoE2-LoRA | 2607.21978 | OK | |
| Xie intruder threshold | 2607.23711 | OK | prénom abrégé (« Peng ») |
| Latent-LoRA | 2607.23837 | OK | GMM |
| Saliencro VoI routing | 2608.02528 | OK | |
| Janati router sensitivity | 2608.07890 | OK | |
| Faryad input problem | 2608.08433 | OK | Q |
| Gu route flip | 2608.11212 | OK | RMF ~0,31 OLMoE 4-bit |
| LinearKV | 2608.11231 | OK | |
| Gillani fair benchmark | 2608.18155 | OK | Q |
| Tail-Replay | 2608.30310 | OK | |
| DASC | 2608.30386 | OK | |
| Chowdhury subspace contention | 2609.03150 | OK | contredit la « MoE novel finding » (MK l.274) |
| Zhao calibrated ties | 2609.12439 | OK | |
| Li GLM-5.3 cache | 2609.15030 | OK | |
| DolphinBench | 2609.24971 | OK | |
| Xu episodic financial | 2609.28771 | OK | |
| SuffixReplay | 2609.33477 | OK | |
| PReCache | 2609.34054 | OK | |
| SPACE-LoRA (Yoo) | 2609.34453 | OK | |
| Nair descent-aligned | 2610.00493 | OK | |
| CoDe-LoRA | 2610.08312 | OK | |
| Saunders spiking scaling | 2610.15146 | OK | 0,34 → 0,23 nats conforme |
| Barbera CaLLM judge | 2610.18108 | OK | |
| Yin self-debiasing | 2610.24320 | OK | |
| LoRASpace (Sathiyalogeswaran) | 2610.27444 | OK | Le texte dit 46–62 %, l'original 46–57 % (diffusion) et 62 % (FLAN-T5) : arrondi acceptable. |
| Bao naive RAG | 2610.30755 | OK | « 6 of 7 » conforme |
| ross2014 | 10.1371/journal.pone.0087357 | OK | |
| MobiLoRA | 10.18653/v1/2025.acl-long.1140 | OK | ACL 2025 |
| kraskov2004 | 10.1103/PhysRevE.69.066138 | OK | S2 indique 2003 (préprint), PRE 2004 correct |

## Comptes

- Identifiants résolus par API : 71 sur 71 (69 arXiv + 2 DOI de `ids.tsv`), plus 4 DOI de la bib C5.
- **OK : 66** (dont song2020mpnet existant mais non cité, et holevo/nielsen canoniques non résolus).
- **Mauvaise attribution : 4** (LeCun 2206.15331 dans 4 fichiers ; TD-MPC2 2410.16662 ; gao2024mola 2403.03432 ; Aeon/Arslan non cité dans D1).
- **Attribution douteuse : 3** (Caro ; Du « Théorème 4 » ; Quantum-PEFT « QPU required »).
- **Année/venue fausse : 2** (abbas2021 ; fano1961).
- **Introuvables (sans ID) : 12** (Rubinstein 1997 ; Spall 1998 ; 9 noms seuls dans OT ; cartes Qwen non vérifiées).
- **Groupe de Rome : 0 cité.** 7 papiers pertinents à ajouter (voir `inventory/micro-kiki.md`, partie C).
