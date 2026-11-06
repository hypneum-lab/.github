# Relecture scientifique indépendante — micro-kiki + micro-kiki-quantum (01/11/2026)

> Lecture seule. Aucun modèle exécuté. Chiffres relus à la source ; recalculs faits à la main ou en Python léger sur les JSON de `results/`.
> Les chemins sont relatifs à chaque clone (`scratchpad/clones/micro-kiki`, `scratchpad/clones/micro-kiki-quantum`).
> Faits et inférences sont dans des phrases séparées ; les inférences sont marquées « (inférence) ».

---

# PARTIE A — micro-kiki

## 0. En-tête

- Dépôt : `hypneum-lab/micro-kiki`, SHA `61056d9d9e34089187ffe0fb0672debf4ecd2c91`.
- Manuscrits lus en entier :
  - `docs/paper-a/paper-a-v2.tex` (179 l.)
  - `docs/paper-a/c5-info-bound.tex` (108 l.)
  - `docs/paper-a/c5-references.bib`
  - `paper/micro-kiki.tex` (766 l.)
  - `docs/papers/paper-a-draft-v1.md` (468 l.) et sa version FR (470 l.)
  - `docs/papers/paper-a-reframe-aeon-ami.md` (175 l.) et sa version FR (177 l.)
  - `docs/paper-outline-triple-hybrid.md` (403 l.)
- Autres fichiers lus :
  - `docs/ERRATA.md`
  - préreg NH-81 (`docs/prereg/2026-10-25-nh81-joules-per-token.md`, `2026-10-28-nh81-amendment-1.md`)
  - préregs GB300 (`docs/prereg/nh81-gb300/*`, `docs/prereg/demo-35b-lora-gb300/*`)
  - `docs/results/2026-10-25-nh81-joules.md`, `results/nh81/summary.json`
  - JSON : `results/c2-downstream.json`, `results/nullspace_ablation.json`, `results/eval_cognitive_ab.json`, `results/2026-04-19-aeon-poc-L2-layernorm-long.json`, `results/text-jepa-vqc.json`, `results/text-jepa-dim64-full-budget.json`, `results/aeon-realdata-soft-interleaved.json`
  - code : `src/eval/forgetting.py`, `src/serving/full_pipeline_server.py`, `src/cognitive/{judge,rbd}.py`, `src/cognitive/CLAUDE.md`, `scripts/eval_cognitive_ab.py`, `scripts/eval_router_ablation.py`, `scripts/eval_text_jepa_vqc.py`
  - `docs/specs/2026-04-15-cognitive-layer-design.md`, `docs/SESSION-2026-04-19-INDEX.md`
  - PR #19 (brouillon, branche `exp/nh81-kxkm-nvml`)
- Références : 69 identifiants arXiv et 2 DOI résolus (API arXiv, Semantic Scholar en lot). Détail dans `inventory/refs/micro-kiki-refs.md`.
- Durée : environ 3 h 30.

## 1. État des lieux (≤ 15 lignes)

1. Le dépôt contient quatre familles de manuscrits :
   - Paper A « VQC negative results » (LaTeX, avec un erratum C5) ;
   - le papier système micro-kiki (35 LoRA sur Qwen3.6-35B-A3B, routeur, couche cognitive) ;
   - un brouillon « Aeon-as-AMI-Memory » (NeurIPS 2026 workshop, EN+FR) et sa version recadrée ;
   - un plan « triple hybride ».
2. Les résultats chiffrés existent en JSON pour C2, la null-space, l'A/B cognitif, Aeon L1–L3, Text-JEPA et NH-81.
3. ERRATA retire E-01 (énergie), E-02 (borne C5 et MK-23) et E-03 (routeur 70,7 %).
4. NH-81 (J/token LIF vs dense) est mesuré sur macM1. Il est noté « withdraw » sur main, et « provisional » sur la PR #19 et dans la préreg GB300.
5. Deux préregs GB300 ont été gelées le 31/10 (tags `*-freeze-20261031b`).
6. Le 35B a été abandonné par le PI le 30/10 (brief), mais une préreg demo-35b a été gelée le 31/10.
7. Aucun papier du groupe de Rome n'est cité.
8. Verdict global : les résultats négatifs (Paper A, NH-81) sont les éléments les plus solides.
9. Le papier système et le brouillon Aeon contiennent des surinterprétations et des erreurs d'attribution, dont deux bloquantes.

## 2. Lecture des papiers

### 2.1 `docs/paper-a/paper-a-v2.tex` — « Benchmarking VQC… Negative Results »

**Lecture section par section**
- **Résumé** (l.17) : retire la borne 0,911 et la présente comme non contraignante.
- **Intro, contributions C1–C3** (l.25–46) :
  - C1 : un VQC 6 qubits / 6 SEL atteint 0,246 en 10 classes, ce qui est inférieur à LogReg et au MLP.
  - C2 : le routage VQC dégrade la qualité aval.
  - C3 : la séparation des sources de variance.
- **Méthodes** (l.46–80) :
  - corpus `data/final`, 50 exemples par domaine ;
  - embeddings MiniLM 384 projetés en PCA ;
  - simulateur PennyLane comparé à un simulateur torch « 3000× ».
- **Table 1** (l.87–91) : baselines (stratifié aléatoire, LogReg, MLP, PCA-4) en C1 et C3.
- **C2 aval** (l.116–144) : routage sur 100 questions ; un modèle juge note de 1 à 5.
- **Discussion et travaux liés** (l.150–171) : Caro, Du, Abbas, la borne d'information.
- **Conclusion** (l.175).

**Équations, tables et figures**

| Élément | Lignes | Verdict | Justification |
|---|---|---|---|
| Comptes de paramètres | Table l.87–91 | vérifié | VQC 1662 = 1540 + 72 + 50 ; PCA-4 1586 ; brut 3850 ; MLP 25 290, recalculés à la main. |
| Ligne « stratified random » | l.87–91 | plausible mais suspecte | La ligne vaut 0,118 ± 0,024 en C1 et en C3, ce qui ressemble à une copie (inférence). |
| Speedup « ~99 s » | l.46 vs l.54 | faux (incohérent) | l.46 donne 99 s pour 400 exemples × 10 époques ; l.54 donne 99 s pour 120 × 3. La comparaison oppose parameter-shift à autograd, sans le mode backprop de PennyLane. Le test n'affirme que ≥ 20× (l.57). |
| C2 : moyennes VQC 2,65 / aléatoire 3,19 / oracle 3,48 | l.116–144 | vérifié | Recalculées depuis `results/c2-downstream.json`. |
| C2 : « oracle > random » | l.116–144 | invérifiable au seuil | Différence appariée +0,29 (SE 0,213, t 1,36, IC bootstrap 95 % [−0,12 ; 0,71]), donc non significative. |
| C2 : « VQC < random » | l.116–144 | vérifié | Différence appariée −0,54 (t −2,22, IC [−1,02 ; −0,05]). |
| C2 : pathologie « confidently wrong » | l.130–144 | faux dans sa formulation | 72 % des requêtes vont à stm32 (38) et kicad-dsl (34) : c'est un effondrement sur deux personas. Aucune confiance n'est mesurée. Seules 90 questions sur 100 sont uniques. Le juge est le même modèle (Qwen3.5-35B-A3B Q3_K_XL, auto-jugé). `vqc_train_acc` vaut 0,3. |
| « rank-ordering preserved » | l.109 | plausible mais lâche | Sur données synthétiques, MLP 0,546 = LogReg 0,546 (ex æquo). |
| Conclusion « upper bound gives 0.91, loose but consistent » | l.175 et l.171 | faux | Contredit le retrait annoncé au résumé l.17 et dans ERRATA E-02. |
| « full Holevo capacity » | l.161 et l.111 | faux | Voir 2.2. |
| URL `github.com/genial-lab/micro-kiki` | l.30 | MINEUR | Ancien nom d'organisation. |

### 2.2 `docs/paper-a/c5-info-bound.tex` — borne d'information (erratum E-02)

**Lecture section par section**
- §1 : motivation.
- §2 : Éq. 1 (l.24), I(M;Y) ≤ S(ρ_Y) ≤ N, appliquée aux espérances ⟨Z⟩ mono-qubit (l.27–30).
- §3 : Fano faible, Éq. 2 (l.37) et Éq. 3 (l.46), avec l'application numérique I = 2,04 bits et K = 10, qui donne une précision ≤ 0,911.
- §4 : erratum (l.68–70) et figure retirée mais toujours incluse (l.81–92).
- §5 : conclusion (l.102–108), qui cite le « Théorème 4 » de Du et al.

**Équations**

| Éq. | Verdict | Justification |
|---|---|---|
| Éq. 1, Holevo (l.24) | faux dans l'application | Holevo borne l'information accessible par une mesure sur une seule copie. Le simulateur fournit des espérances exactes, qui sont des sorties continues équivalant à une infinité de copies, donc le plafond N ne s'applique pas. La seule borne valide est la DPI, I(M;Y) ≤ I(X;Y) ≤ H(Y). La notation est aussi fautive : c'est χ ≤ S(ρ̄) qui borne, non S(ρ_Y). |
| Éq. 2, Fano faible (l.37) | vérifié | Pe ≥ (H(Y) − I − 1)/log2(K − 1) est correct. |
| Éq. 3 (l.46) | vérifié arithmétiquement | 3,3219 − 2,04 − 1 = 0,2819 ; 0,2819 / 3,1699 = 0,0889 ; d'où 1 − 0,0889 = 0,911. |
| Erratum « vacuous for N ≥ log2 K » (l.68–70) | imprécis | Le plafond Holevo est déjà inactif dès N ≥ log2 K − 1 = 2,32, soit N ≥ 3. |
| Figure retirée (l.81–92) | MINEUR | Elle est encore incluse dans le source. |
| « Théorème 4 de Du et al. bounds SEL » (l.102–104) | attribution douteuse | Du et al. (PRR 2, 033125) traitent de l'expressivité des PQC. L'existence d'un « Théorème 4 » visant SEL n'a pas été vérifiée dans le texte (inférence). |

ERRATA E-02 conserve la formule min(I, N, H(Y)) (`docs/ERRATA.md:129-130`). Le principe fautif (Holevo appliqué à des espérances) n'est donc pas corrigé.

### 2.3 `paper/micro-kiki.tex` — papier système (35 LoRA, routeur, couche cognitive)

**Lecture section par section**
- **Résumé** (l.40–55) :
  - 35 adaptateurs ;
  - routeur à 46,4 % top-1 et 69,6 % top-3 (n = 5 377, 34 classes) ;
  - « 2,2× » mieux que mots-clés ;
  - ΔPPL −3,44 ;
  - couche cognitive « +7 pp » (l.50).
- **§2 Architecture** (l.95–135) :
  - Aeon d'Arslan cité (l.101 et l.286) ;
  - juge CAMP, KnowBias appliqué deux fois (l.116–117).
- **§3 Entraînement** (l.140–210) :
  - correctif word-boundary attribué au classifieur MLP (l.149), ce qui est incohérent ;
  - 32 vs 40 couches confondu avec V3 vs V4 (l.199) ;
  - « Qwen3-Coder-480B 4-bit 1.1 TB » sur une machine de 512 Go (l.205), ce qui est impossible tel quel.
- **§4 Oubli et null-space** (l.240–280) : porte AND (l.248–250) ; Table l.258–271 ; « novel finding… MoE » (l.274).
- **§5 Couche cognitive** (l.290–390) : A/B en Table l.309–327 ; latences en Table l.369–388.
- **§6 Évaluations** (l.430–470) :
  - HumanEval +7,3, MBPP −10 (n = 50) ;
  - MBPP V2 « fundamental » (l.445) ;
  - « correlates with domain distance » (l.454) ;
  - stress test 10/10 (l.462) ;
  - angles « pairwise cosine » (l.474).
- **§7 Déploiement** (l.523) : « deployed in production ».

**Tables et équations clés**

| Élément | Verdict | Justification |
|---|---|---|
| ΔPPL −3,44 (6 domaines) | vérifié | Moyenne base 6,07 et adapté 2,63 ; gains de 71,8 / 61,3 / 48,5 / 47,3 / 55,2 / 46,2 %. L'écart avec −7,30 (35 domaines) n'est pas expliqué. |
| HumanEval +7,3 / MBPP −10 (n = 50) | plausible, dans le bruit | SE ≈ 6,6 pp par mesure. |
| MBPP V2 « structural/fundamental » (l.445) | faux (surinterprétation) | Repose sur 73 / 66 / 67 à n = 100. |
| Null-space, Table l.258–271 | plausible pour les chiffres, faux pour l'interprétation | Angles 88,58–88,63°, Δ ≤ 0,02, 100 itérations, scale 20 (`results/nullspace_ablation.json`). Le code calcule l'angle principal minimal entre sous-espaces (`src/eval/forgetting.py:65-93`, QR + SVD). Le texte l.474 parle de « pairwise cosine angles between flattened weight deltas » : code ≠ texte. Les gros modules donnent ~89,9° et `mlp.shared_expert_gate` 77° : l'angle suit la dimension. La « découverte MoE » (l.274) n'a aucun contrôle dense ni aléatoire. |
| Porte d'oubli AND (l.248–250) | faux (porte inerte) | `src/eval/forgetting.py:286-291` ne fait un rollback que si l'angle est < 30 **et** que `winrate_drop` est non nul et > 0,03. Sans win-rate mesuré (`gate_status=angle_only_partial`), la porte ne peut jamais se déclencher. |
| A/B cognitif, Table l.309–327 | faux (« +7 pp », l.50 ; « clear benefit », l.329) | `results/eval_cognitive_ab.json` : n = 30, différence appariée du composite −0,0102 (sd 0,126, t −0,44), donc nulle. Le composite vaut 0,5·recouvrement de tokens + 0,3·mots-clés + 0,2·longueur (`scripts/eval_cognitive_ab.py:241-250`), ce qui n'est pas une mesure de qualité. |
| Latences, Table l.369–388 | faux (contradiction) | La table annonce 4–6 s au total, < 50 ms pour le négociateur et < 20 ms pour l'anti-biais. Le JSON de l'A/B mesure 12,04 s (full) contre 12,62 s (raw). |
| Juge CAMP et KnowBias ×2 (l.116–117, l.297, l.303) | faux par rapport au code déployé | `src/serving/full_pipeline_server.py:823` instancie `AdaptiveJudge(fast_client=None, deep_client=None)`, qui renvoie toujours `winner_idx 0` (`src/cognitive/judge.py:53-54`). `CatfishModule(generate_fn=None)` est à l.824. `ReasoningBiasDetector(generate_fn=None)` à l.890 ne détecte jamais de biais (`src/cognitive/rbd.py:39-41`). KnowBias n'est pas dans le chemin chaud (`src/cognitive/CLAUDE.md:13`). |
| Ablation du routeur, « 2,2× » | faux | `scripts/eval_router_ablation.py` : la stratégie random renvoie un seul domaine, donc top-3 = top-1 = 2,76 %. La baseline mots-clés n'utilise que le nom du domaine (`domain_keywords = {d: [d.replace("-", " "), d]}`), ce qui en fait un homme de paille. Le « 2,2× » correspond à 29,4 vs 13,2 sur 14 423 exemples et 35 domaines, alors que le résumé parle de n = 5 377 et 34 classes. Le routeur MiniLM (seuil 0,12, plafond 4) ne couvre que 49,7 % des cas. |
| « deployed in production » (l.523) | périmé | Le README indique le Studio éteint (PR #15), et le 35B a été abandonné le 30/10. |

### 2.4 `docs/papers/paper-a-draft-v1.md` (+ `-fr.md`) — « Aeon-as-AMI-Memory », v1 du 19/04

**Lecture section par section**
- **Résumé et §1** (l.12–62) :
  - Aeon (Atlas + Trace + LatentMLP) est présenté comme l'implémentation de la mémoire du cadre AMI de LeCun ;
  - LeCun est cité sous arXiv:2206.15331 (l.12, 26, 62, 271 ; réf. [10] l.374) ;
  - le texte parle de « sept modules ».
- **§2** : architecture (l.100–130). « ~3,4M params for dense 384×35 » (l.117) est faux : 384 × 35 = 13 440. « ~180 params » est également incohérent.
- **§3** : conditions A–D, stream synthétique, prédicteur h_t → h_{t+1}.
- **§4** : résultats L1/L2/L3, Text-JEPA, Task 15.5, données réelles (§4.5).
- **§5–7** : tripwire 0,3–1,5 % (l.211, placeholder VERIFY), travaux liés (l.301 LeJEPA « no ad-hoc centering » se contredit), conditionnement (l.311–315).
- **Limitations** (l.323) : la version FR (l.325) n'est pas mise à jour, ce qui contredit la FR §4.5.

**Résultats clés**

| Élément | Verdict | Justification |
|---|---|---|
| Condition D | vérifié | MRR prédictif = null = 0,498 ; win_stack 0 % ; recall@5 baseline = 1,0 (saturation). |
| L2 LayerNorm(delta) « +397 % vs null » | faux (null homme de paille) | `results/2026-04-19-aeon-poc-L2-layernorm-long.json` : MRR prédictif 0,447 < D 0,498. Le null est un one-hot mis à zéro, hors distribution. Recall@5 prédictif 0,67 contre baseline 1,0. |
| L1 0,012 / L3 0,005 | vérifié | Très inférieurs à la baseline. |
| Text-JEPA 0,925 vs 0,900 | plausible, non significatif | `results/text-jepa-vqc.json` : n_test = 80, donc 74/80 contre 72/80 (deux exemples d'écart). n_params = 20 est incompatible avec « 6 qubits / 6 SEL / 10 classes ». Le script utilise n_qubits = 4 (`scripts/eval_text_jepa_vqc.py:76`). Le score est incompatible avec Paper A (VQC 0,246 sur le même corpus `data/final`). |
| Task 15.5 | vérifié (nul) | `text-jepa-dim64-full-budget.json` : 0,19 contre 0,18, n = 100 ; baseline d'ablation 0,095 (hasard). |
| Données réelles entrelacées (§4.5) | faux dans l'interprétation | `results/aeon-realdata-soft-interleaved.json` : baseline 0,11 → 0,31 et null 0,29. Le MRR null (0,1765) dépasse le MRR prédictif (0,163). L'entrelacement round-robin rend le domaine suivant déterministe ; le modèle apprend probablement le cycle (inférence). Sur le flux intra-sujet, le score chute de 0,99 à 0,47. |

### 2.5 `docs/papers/paper-a-reframe-aeon-ami.md` (+ FR)

- Recadrage du brouillon : Aeon devient une « mémoire épisodique AMI », et le VQC passe en annexe.
- TD-MPC2 est cité sous arXiv:2410.16662 (l.45), qui résout vers un papier de VQA en ophtalmologie. Le brouillon v1 utilise le bon identifiant, 2310.16828.
- « VQC 86,8 % déséquilibré, 53 % équilibré » (l.29) : la source n'est pas trouvée dans `results/`, donc invérifiable.
- « LeCun §3.6 » (l.113) : invérifiable sans le texte OpenReview.
- Les chiffres FR et EN sont cohérents.

### 2.6 `docs/paper-outline-triple-hybrid.md` (plan, non soumis)

- « 47× (72 vs 3,4M) » (l.167) : le rapport réel est 47 222×. La l.338 donne 31 000×. Le chiffre 3,4M n'a pas de source.
- « 3072-dim embeddings » (l.292) contredit les 384 dimensions utilisées partout ailleurs.
- Forgetting « 4/10 PASS » (l.178–185, l.247) : 6 adaptateurs sont entre 25° et 29°, et passent uniquement parce que la porte AND est inerte.
- Énergie retirée (l.193–196), ce qui est cohérent avec E-01.
- « first quantum-neuromorphic-classical » : revendication de priorité non étayée.
- Plusieurs références sont citées par leur seul nom et non résolues : MixLoRA, MoLA NAACL 2025, HMoRA, FAS, IonQ, Quantum-Train, QPA, MAGMA, A-Mem.

### 2.7 NH-81 (préreg + résultats) et préregs GB300

**NH-81**
- Le chemin « fused » applique `down` au taux de spikes (préreg l.97–100). C'est un matmul dense suivi d'une boucle LIF, donc R ≤ 1 par construction.
- Résultat : R̂ 0,9095, IC [0,833 ; 1,007], 12/12 paires.
- Effet d'ordre : 0,82 contre 1,01 (résultats l.75–77).
- L'entraînement spiking a commencé avant le gel (A4).
- L'amendement A1, postérieur à la mesure, lève le label « provisional ». ERRATA (10-28) dit « withdrawn ». La PR #19 dit « withdraw, provisional (IOReport), definitive only if KXKM confirms ». La préreg GB300 l.321 dit « provisional ». Le statut n'est donc pas cohérent d'un document à l'autre.
- PR #19, réplication sur M3 Pro : R̂ 0,670 [0,662 ; 0,677], contre 0,91 [0,83 ; 1,01] sur macM1. Les IC sont disjoints, mais la PR écrit « agrees ».
- KXKM : 3 tentatives refusées ; waiter avec échéance au 2026-11-04 12:00.
- Taux de décharge mesuré 13,8 %, et non 1–3 %.

**Préregs GB300**
- Les tags `nh81-gb300-freeze-20261031b` et `demo-35b-gb300-freeze-20261031b` pointent sur le commit 185c5d4 (23:09:53). Les amendements sont antérieurs aux données.
- L'en-tête affiche toujours « L0 (draft… not frozen) » (nh81 l.3 ; demo l.9).
- La préreg demo saute le §6 mais y renvoie.
- La préreg NH-81 GB300 hérite des préregs KXKM r2/r3/r4 et M3 Pro, qui n'existent que sur la branche non fusionnée de la PR #19.
- L'adaptateur `hypneum-lab/micro-kiki-v4-sota` contient 34 adaptateurs (`reasoning` manque), et non 35.

## 3. Vérification des références

Le détail est dans `inventory/refs/micro-kiki-refs.md`.

**Problèmes principaux**
- **arXiv:2206.15331 attribué à LeCun** dans 4 fichiers (draft-v1 EN/FR, reframe EN/FR). L'identifiant résout vers Dakhel et al., « GitHub Copilot AI pair programmer: Asset or Liability? ». Le texte de LeCun (2022) est sur OpenReview, pas sur arXiv. BLOQUANT.
- **Aeon (Arslan, arXiv:2601.15311)** : non cité dans draft-v1, où Aeon est présenté comme un apport propre. Le dépôt dit pourtant l'adopter tel quel (`docs/specs/2026-04-15-cognitive-layer-design.md:28`), et `paper/micro-kiki.tex` l.101 le cite. BLOQUANT.
- **TD-MPC2** cité sous 2410.16662 (faux identifiant) dans le reframe.
- **gao2024mola** cité sous 2403.03432, qui est Feng et al., « Mixture-of-LoRAs ». Le MoLA de Gao est 2402.08562.
- **Caro et al.** : le texte leur attribue une borne en √(log d_eff / n). La borne de Caro est en √(T/N), avec T le nombre de portes entraînables.
- **Du et al., « Théorème 4 »** : attribution douteuse.
- **Quantum-PEFT (2503.05431)**, voir la partie B.
- **c5-references.bib** :
  - abbas2021 est typé inproceedings alors que c'est un article de Nature Comput. Sci. 1, 403–409 (2021) ;
  - fano1961 est typé journal « MIT Press » alors que c'est un livre.
- **Fiabilité de l'ensemble** : les autres identifiants (Brainstacks, Chowdhury, Steele, Sathiyalogeswaran, Gu, CAMP, Catfish, RBD, KnowBias, LAS 2505.09659, SpikingBrain 2509.05276, Activated LoRA 2512.17910, etc.) résolvent et correspondent à l'attribution, à des abréviations d'auteurs près.

## 4. Analyses

### Trois points de relecteur (micro-kiki)

1. **Ce qui est revendiqué ne correspond pas à ce qui est implémenté.** La couche cognitive décrite (juge CAMP, KnowBias ×2, RBD) est neutralisée dans le serveur déployé :
   - le juge choisit toujours l'index 0 ;
   - RBD ne détecte jamais de biais ;
   - l'A/B qui la justifie est nul (t = −0,44) ;
   - les latences de la Table l.369–388 contredisent celles du même A/B.

   Un relecteur demanderait de retirer la section 5 ou de la refaire avec une évaluation à l'aveugle.
2. **Les baselines sont des hommes de paille.** Dans le papier système :
   - mots-clés = nom du domaine ;
   - random top-3 = top-1.

   Dans Aeon :
   - le null est un one-hot nul hors distribution ;
   - l'entrelacement round-robin rend la cible prédictible.

   Dans les deux cas, les gains annoncés (2,2× et +397 %) disparaissent face à une baseline raisonnable : une baseline BM25 ou TF-IDF pour le routeur, et un null mélangé dans la distribution pour Aeon.
3. **Les erreurs théoriques et d'attribution ne sont pas corrigées.**
   - Holevo est appliqué à des espérances, et l'erratum garde N dans la formule.
   - La conclusion de paper-a-v2 revendique encore 0,91.
   - LeCun est cité sous un identifiant faux.
   - Aeon est approprié dans draft-v1.

   Le relecteur demanderait donc un erratum complet avant toute diffusion.

### Positionnement

- Paper A, version négative, est publiable comme résultat négatif honnête (type workshop « I Can't Believe It's Not Better »), à trois conditions :
  - retirer la borne Holevo partout ;
  - corriger la vitesse ;
  - rapporter les IC de C2.
- Le papier système relève plus du rapport d'ingénierie que de la contribution scientifique. La revendication « MoE null-space novel » est contredite par Chowdhury (gradients quasi orthogonaux) et expliquée par la géométrie en grande dimension.
- Aeon-AMI n'a pas de résultat positif robuste sur données réelles.

## 5. Suppositions

- **S1 (inférence)** : la ligne stratifiée identique en C1/C3 de la Table 1 est une copie. Aucun JSON séparé n'a été trouvé pour le vérifier.
- **S2 (inférence)** : le gain sur données réelles entrelacées vient de l'apprentissage du cycle round-robin. La vérification demanderait un ordre aléatoire, non exécuté (aucun calcul autorisé).
- **S3** : l'absence de « Théorème 4 » visant SEL chez Du et al. n'est pas vérifiée dans le texte intégral.
- **S4** : « six modules » chez LeCun (et non sept) vient de ma mémoire du texte OpenReview, non vérifiée par API.
- **S5** : les cartes de modèle Qwen3.6 et Qwen3.8 n'ont pas été vérifiées (aucun appel à l'API HF).

## 6. Pistes d'utilité

- Fusionner Paper A et C5 en une note « negative results » unique, en remplaçant Holevo par la DPI I ≤ H(Y) et en supprimant toute borne chiffrée. La matière la plus réutilisable est C2, « un routeur faible dégrade l'aval », avec IC appariés.
- Rejouer l'ablation du routeur avec une baseline BM25 ou TF-IDF et une baseline random top-k correcte. C'est un calcul CPU léger.
- Contrôle de la null-space : angles entre LoRA d'un modèle dense de même dimension, et entre matrices aléatoires de même rang. Cela tranche la revendication « MoE » (l.274).
- Aeon : null mélangé dans la distribution, flux à ordre aléatoire, recall@k sans saturation.
- NH-81 : documenter que R ≤ 1 par construction est une **propriété de l'implémentation fused**, pas de la neuromorphie. Le résultat utile est l'écart entre plateformes (0,67 contre 0,91, IC disjoints).
- Rome : 2610.08612 (RBM modulaire, multi-label) fournit une baseline de routeur multi-étiquette à énergie, comparable au routeur sigmoïde (voir la section Rome).

## 7. Constats classés (micro-kiki)

### BLOQUANT

| # | Constat | Source | Statut vs baseline |
|---|---|---|---|
| MK-B1 | LeCun AMI cité sous arXiv:2206.15331, qui est un papier Copilot (Dakhel et al.). | `docs/papers/paper-a-draft-v1.md:12,26,62,271,374` ; `-fr.md` ; `paper-a-reframe-aeon-ami.md` | nouveau |
| MK-B2 | Aeon présenté comme un apport propre sans citer Arslan (2601.15311), que le dépôt dit adopter tel quel. | `docs/papers/paper-a-draft-v1.md:12,107,281` ; `docs/specs/2026-04-15-cognitive-layer-design.md:28` | nouveau |
| MK-B3 | Holevo appliqué à des espérances exactes. L'erratum garde N dans min(I, N, H(Y)) et la conclusion revendique encore 0,91. | `docs/paper-a/c5-info-bound.tex:24-30` ; `docs/ERRATA.md:129-130` ; `docs/paper-a/paper-a-v2.tex:111,161,171,175` | confirme le constat Codex « Holevo mal appliquée » (baseline 30/10 l.92, item #21) mais **infirme sa localisation** : la baseline l'attribue à micro-kiki-quantum alors que le fichier est dans micro-kiki ; ajoute « non corrigé par E-02 » et « conclusion contradictoire » |
| MK-B4 | Couche cognitive déployée neutralisée : juge toujours à 0, RBD jamais biaisé, KnowBias hors chemin chaud. Le papier décrit le contraire. | `src/serving/full_pipeline_server.py:823,824,890` ; `src/cognitive/judge.py:53-54` ; `src/cognitive/rbd.py:39-41` ; `paper/micro-kiki.tex:116-117,297,303` | nouveau |

### MAJEUR

| # | Constat | Source | Statut vs baseline |
|---|---|---|---|
| MK-M1 | A/B cognitif nul (t −0,44, n = 30, composite lexical) présenté comme « +7 pp » et « clear benefit ». | `paper/micro-kiki.tex:50,309-329` ; `results/eval_cognitive_ab.json` ; `scripts/eval_cognitive_ab.py:241-250` | nouveau |
| MK-M2 | Latences contradictoires : Table 4–6 s contre 12,0–12,6 s mesurées. | `paper/micro-kiki.tex:369-388` ; `results/eval_cognitive_ab.json` | nouveau |
| MK-M3 | Porte d'oubli AND inerte sans win-rate. Les 6 adaptateurs entre 25° et 29° « passent ». | `src/eval/forgetting.py:286-291` ; `paper/micro-kiki.tex:248-250` ; `docs/paper-outline-triple-hybrid.md:178-185` | confirme Codex « porte LoRA en AND » (baseline 30/10 l.92) |
| MK-M4 | Ablation du routeur : random top-3 = top-1, mots-clés = nom de domaine, n incohérent (14 423 / 35 contre 5 377 / 34). | `scripts/eval_router_ablation.py` ; `paper/micro-kiki.tex:40-55` | nouveau ; complète la baseline #5 (routeur 70,7 retiré) |
| MK-M5 | Null-space : le code (angle principal minimal) diffère du texte (« pairwise cosine »). Pas de contrôle dense ou aléatoire pour la « MoE novel finding ». | `src/eval/forgetting.py:65-93` ; `paper/micro-kiki.tex:258-274,474` ; `results/nullspace_ablation.json` | confirme la baseline 24/10 l.122 (null-space contredit par Chowdhury) ; ajoute code ≠ texte |
| MK-M6 | Aeon L2 « +397 % » contre un null hors distribution. Prédictif < condition D. Gain sur données réelles ≤ null. | `results/2026-04-19-aeon-poc-L2-layernorm-long.json` ; `results/aeon-realdata-soft-interleaved.json` ; `docs/papers/paper-a-draft-v1.md` §4 | nouveau |
| MK-M7 | Text-JEPA : 0,925 contre 0,900 tient à 2 exemples sur 80. n_params = 20 et n_qubits = 4, contre 6 annoncés. Incompatible avec Paper A (0,246). Task 14 non rétractée dans le dépôt. | `results/text-jepa-vqc.json` ; `scripts/eval_text_jepa_vqc.py:76` ; `docs/SESSION-2026-04-19-INDEX.md:86,96` | **infirme la baseline 24/10 l.122** (« Task 14 rétracté ») |
| MK-M8 | NH-81 : R ≤ 1 par construction (fused). Statut incohérent (withdrawn sur main, provisional sur PR #19 et GB300). M3 Pro 0,67 contre macM1 0,91, IC disjoints, qualifiés de « agrees ». | préreg NH-81 l.97-100 ; `docs/ERRATA.md` (MAJ 10-28) ; PR #19 ; `docs/prereg/nh81-gb300/` l.321 | confirme la baseline 30/10 #12 ; nouveau : la divergence des IC et du statut |
| MK-M9 | Speedup incohérent (99 s pour deux charges différentes) ; comparaison parameter-shift contre autograd. | `docs/paper-a/paper-a-v2.tex:46,54,57` | nouveau |
| MK-M10 | C2 : « confidently wrong » = effondrement sur 2 personas, sans mesure de confiance ; juge = même modèle ; oracle > random non significatif. | `docs/paper-a/paper-a-v2.tex:116-144` ; `results/c2-downstream.json` | nouveau |
| MK-M11 | Faux identifiants : TD-MPC2 2410.16662 ; gao2024mola 2403.03432. Caro mal attribué. | `docs/papers/paper-a-reframe-aeon-ami.md:45` ; `paper/micro-kiki.tex` (bib) ; `docs/paper-a/paper-a-v2.tex:171` | nouveau |

### MINEUR

| # | Constat | Source |
|---|---|---|
| MK-m1 | Table 1 : ligne stratifiée identique en C1 et C3. | `paper-a-v2.tex:87-91` |
| MK-m2 | Figure C5 retirée mais incluse ; notation S(ρ_Y) au lieu de χ ; seuil de vacuité N ≥ 3 et non N ≥ log2 K. | `c5-info-bound.tex:24,68-70,81-92` |
| MK-m3 | Erreurs de comptage : « 3,4M params » pour 384×35 = 13 440 ; « 47× » au lieu de 47 222× ; 31 000× ailleurs ; « 3072-dim ». | `paper-a-draft-v1.md:117` ; `paper-outline-triple-hybrid.md:167,292,338` |
| MK-m4 | « 1,1 TB » sur une machine de 512 Go ; 32/40 couches confondu avec V3/V4 ; word-boundary attribué au MLP. | `paper/micro-kiki.tex:149,199,205` |
| MK-m5 | Surinterprétations : MBPP « structural » (n = 100) ; « correlates with domain distance » sur 3 points ; HumanEval/MBPP dans le bruit. | `paper/micro-kiki.tex:445,454` |
| MK-m6 | Version FR désynchronisée (Limitations l.325 contre §4.5), titre non traduit ; tripwire placeholder VERIFY ; LeJEPA auto-contradictoire. | `paper-a-draft-v1-fr.md:325` ; `paper-a-draft-v1.md:211,301` |
| MK-m7 | Préregs GB300 : en-tête « L0 not frozen » sur des préregs gelées ; renvoi à un §6 absent ; héritage de préregs non fusionnées (PR #19) ; 34 adaptateurs et non 35. | `docs/prereg/nh81-gb300/` l.3 ; `docs/prereg/demo-35b-lora-gb300/` l.9 |
| MK-m8 | Bib : abbas2021 mal typé, fano1961 en « journal », song2020mpnet non utilisé, Rubinstein 1997 non cité ; URL genial-lab ; « deployed in production » périmé. | `c5-references.bib` ; `paper-a-v2.tex:30` ; `paper/micro-kiki.tex:523` |
| MK-m9 | Préreg demo-35b gelée le 31/10 alors que le 35B a été abandonné le 30/10. Elle est déclarée « not a scientific claim », ce qui rend la tension acceptable. | `docs/prereg/demo-35b-lora-gb300/` |

### OK

- Paper A, C1 : chiffres et comptes de paramètres vérifiés ; le résultat négatif est solide.
- C2 : moyennes et VQC < random vérifiés (IC [−1,02 ; −0,05]).
- ΔPPL −3,44 sur 6 domaines recalculé.
- Fano faible (Éq. 2) et arithmétique de l'Éq. 3 corrects.
- ERRATA E-01 et E-03 cohérents avec les fichiers.
- Préregs GB300 gelées avant données (tags vérifiés).
- 0 papier de Rome cité ; aucun ne contredit Paper A.

---

# PARTIE B — micro-kiki-quantum

## 0. En-tête

- Dépôt : `hypneum-lab/micro-kiki-quantum`, SHA `236239fe1e587d6bc6c9d55baef0004325fafcbf`.
- Fichiers lus : `README.md`, `ARCHIVED.md`, specs (`docs/specs/*`), `src/experiments/qmoe_3domain.py`, journaux et résultats associés.
- Le dépôt ne contient aucun manuscrit .tex.
- Durée : environ 30 min.

## 1. État des lieux

- Le dépôt est dormant depuis le 2026-05-10 (`ARCHIVED.md`).
- Contenu : un prototype QMoE à 3 domaines (VQC ZZ-Ry contre un MLP classique) et un prototype « Quantum-PEFT ».
- Aucune borne Holevo ni Fano dans tout le dépôt (grep vide).
- La baseline 30/10 (l.281) recommande l'abandon, ce qui est confirmé.

## 2. Lecture (code et spec en tenant lieu de papier)

| Élément | Verdict | Justification |
|---|---|---|
| QMoE 3 domaines | faux méthodologiquement | Les deux modèles sont entraînés **et** évalués sur les mêmes 15 exemples (`src/experiments/qmoe_3domain.py:58-74`), et la PCA est ajustée sur toutes les données. |
| Run « fair » | réglage post hoc | Le run « fair » (n_qubits = 3, 400 pas) est lancé 48 s après le run « real » (6 qubits, 300 pas ; QMoE 0,333 contre classique 1,0). |
| Ansatz ZZ-Ry | défaut de conception | La dernière couche RZZ est diagonale, donc sans effet sur ⟨Z⟩. Un softmax sur des logits dans [−1, 1] plafonne la confiance. |
| Quantum-PEFT | code ≠ méthode citée | Koike-Akino et al. (2503.05431) proposent une paramétrisation unitaire de Pauli, d'inspiration quantique et exécutable classiquement (résumé arXiv). Le README affirme « QPU required ». Le code ajuste ⟨Z…Z⟩ à une cible scalaire (spec l.10–13), ce qui n'est pas la méthode. |

## 3. Références

- QMoE 2507.05190 (Nguyen et al.) : OK.
- 2512.22296 (Heddad & Bouanane) : OK.
- HyQuT 2511.10653 (Kong et al.) : OK.
- Gillani 2608.18155 : OK.
- Faryad 2608.08433 : OK.
- Quantum-PEFT 2503.05431 : existe, mais « QPU required » est une attribution douteuse.
- Spall 1998 (SPSA) : non résolu par API (pas de DOI dans le dépôt).

## 4. Analyses

1. **Fuite train = test.** Avec 15 exemples, aucune conclusion n'est possible, ni pour ni contre le quantique.
2. **Réglage post hoc** des hyperparamètres après un échec.
3. **Méthode citée ≠ méthode implémentée** (Quantum-PEFT).

Positionnement : le dépôt est sans valeur publiable en l'état. L'archivage est justifié.

## 5. Suppositions

- L'intervalle de 48 s entre les runs « real » et « fair » est lu dans les horodatages des journaux. L'intention de réglage post hoc est une inférence.

## 6. Pistes d'utilité

- Si le dépôt est réactivé : séparation train/test, n ≥ 100 par domaine, hyperparamètres fixés avant les données, et suppression de la couche RZZ finale.
- Sinon, garder l'archivage tel quel, en ajoutant à `ARCHIVED.md` une phrase sur la fuite train = test.

## 7. Constats classés (micro-kiki-quantum)

| Sév. | # | Constat | Source | Statut vs baseline |
|---|---|---|---|---|
| MAJEUR | MKQ-M1 | Train = test sur 15 exemples ; PCA ajustée sur tout. | `src/experiments/qmoe_3domain.py:58-74` | confirme Codex « quantum train=eval » (baseline 30/10 l.92) |
| MAJEUR | MKQ-M2 | Run « fair » post hoc 48 s après l'échec du run « real ». | journaux de résultats QMoE | nouveau |
| MAJEUR | MKQ-M3 | Quantum-PEFT : code ≠ méthode ; « QPU required » faux pour une paramétrisation exécutable classiquement. | `README.md` ; spec l.10–13 | nouveau |
| MINEUR | MKQ-m1 | Couche RZZ finale sans effet sur ⟨Z⟩ ; softmax sur [−1, 1]. | `src/experiments/qmoe_3domain.py` | nouveau |
| MINEUR | MKQ-m2 | La baseline 30/10 (l.21 et l.92) attribue la « Holevo mal appliquée » à ce dépôt, mais il n'y a aucun Holevo ici. Le fichier fautif est dans micro-kiki. | grep vide ; `micro-kiki/docs/paper-a/c5-info-bound.tex:27-30` | **infirme la localisation de la baseline 30/10** |
| OK | — | Archivage justifié ; références arXiv citées toutes existantes. | `ARCHIVED.md` | confirme la baseline 30/10 l.281 (abandon) |

---

# PARTIE C — Groupe de Rome (exigence PI b)

**Déjà cités** : aucun papier du groupe dans les deux dépôts (`git grep` vide pour Agliari, Barra, Fachechi, Alemanno, Aquaro, Albanese, Alessandrelli et Lepre).

**À citer, et où**

| Réf. (veille `scratchpad/veille/rome-2026-11-01.md`) | Contenu (résumé API) | Où citer | Relation |
|---|---|---|---|
| arXiv:2607.29554 | Capacité hétéro-associative exponentielle ; données d'intention en langage naturel ; « stockage ≠ généralisation ». | `paper/micro-kiki.tex` §routeur (l.138) et §6 (écart HumanEval/MBPP) | Éclaire la limite du routeur et l'écart mémorisation/généralisation. Ne contredit pas. |
| arXiv:2610.08612 | RBM modulaire qui classe une requête en L-uplet d'étiquettes par CD-1. | `paper/micro-kiki.tex` §4 routeur multi-label sigmoïde (l.138) | **Anticipe en partie** le routage multi-étiquette par un modèle à énergie. C'est une baseline naturelle. |
| arXiv:2610.22191 | Hopfield exponentiel = une étape d'attention softmax ; fenêtre mémorisation/généralisation. | `docs/papers/paper-a-draft-v1.md` §2.3 (Atlas/retrieval) et §7 | Cadre théorique pour la récupération Aeon/Atlas. |
| arXiv:2501.16789, 2609.32605 | Démêlage modulaire dans des réseaux hebbiens. | draft-v1 §7 « Conditioning mechanisms » (l.315) | Antériorité pour le conditionnement par pile. |
| arXiv:2505.18796, 2503.04454 | TAM hétéro-associatif. | draft-v1 §3 (prédicteur h_t → h_{t+1}) et l.311 | **Anticipe** l'idée d'apprendre une association h_t → h_{t+1}. La phrase « no prior work learns expert-selection… » (l.311) devrait être nuancée. |

**Contradictions** : aucun papier de Rome ne contredit directement Paper A ou NH-81.

**Non pertinents ici** : Crick–Mitchison, HFP et Fachechi « dreaming ». Leur absence est correcte.

---

# Synthèse des comptes

- micro-kiki : 4 BLOQUANT, 11 MAJEUR, 9 MINEUR, 7 OK.
- micro-kiki-quantum : 0 BLOQUANT, 3 MAJEUR, 2 MINEUR, 1 OK.
- Deltas par rapport à la baseline :
  - 4 confirmations (#12 NH-81 ; Codex Holevo dans son principe ; porte AND ; quantum train=eval) ;
  - 1 complément (#5) ;
  - 2 infirmations (localisation de Holevo dans micro-kiki-quantum ; « Task 14 rétracté » de la revue 24/10 l.122) ;
  - le reste est nouveau.
