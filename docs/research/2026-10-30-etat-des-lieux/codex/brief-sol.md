# Brief — état des lieux indépendant Hypneum Lab (30 octobre 2026)

Tu es un relecteur scientifique indépendant (statistiques, apprentissage automatique, neurosciences computationnelles). Tu travailles en aveugle : tu n'as PAS accès aux conclusions de l'équipe, seulement aux dépôts.

## Contexte

Hypneum Lab est un laboratoire de recherche solo (un chercheur, « PI ») en IA cognitive, open source, pré-enregistré sur OSF. Cadre : « GENIAL » (G.E.N.I.A.L., acronyme descriptif). Les dépôts clonés dans le répertoire courant `./` sont :

- `nerve-wml/` — communication inter-modules, N10-C (émergence d'un code entre agents, campagne en cours sur KXKM/macM1), NH-01 (capacité de réseaux de Hopfield « rêveurs »), BioField/SNN-PC.
- `dream-of-kiki/` — rêve/sommeil et consolidation, hypothèses H12–H14, DR-3, E1/E1-small (mélange d'experts, oubli, Qwen 4B), NH-03.
- `bouba_sens/` — plasticité cross-modale, B-1/B-2/B-3, Me6, v0.7–v0.9 (ActionSense, Studyforrest), nul calibré/apparié.
- `kiki-flow-research/` — flots de Wasserstein / JKO, spécialisation, M5 certify, pas « rigoureux » vs rapide, ε de Sinkhorn, Lie/Strang.
- `micro-kiki/`, `micro-kiki-quantum/` — petits modèles, adaptateurs LoRA, NH-81 (mesure énergie/NVML), bornes C5.
- `baby-brain/` — développemental, WML incarné.
- `github/` — profil de l'organisation ; contient `docs/ROADMAP.md`, `docs/PROJECT-MANAGEMENT.md` et `docs/research/` (revue du 24/10/2026, inventaires, revues, veille arXiv). Tu PEUX lire `docs/research/` mais seulement APRÈS avoir formé ton propre avis sur chaque dépôt, et tu dois signaler explicitement les points où tu es en désaccord avec cette revue.

Date du jour : 2026-10-30. Beaucoup de choses ont changé depuis le 24/10 (76 commits nerve-wml, 40 dream-of-kiki, 57 bouba_sens, 72 kiki-flow-research). Concentre-toi sur `git log --since=2026-10-24` dans chaque dépôt, les PR brouillons (`gh pr list` si disponible, sinon les branches et `docs/`), les ADR, les notes dans `docs/notes/`, les préregs dans `docs/osf*/` ou `docs/prereg*/`, et les résultats (JSON/CSV/MD) commités.

## Ce que j'attends (en français, Markdown, 2 000 à 4 000 mots)

1. **État des lieux par dépôt** : ce qui est fait, en cours, bloqué ; quelles décisions attendent le PI ; quel calcul tourne où.
2. **Relecture critique** : pour chaque résultat affiché depuis le 24/10 (NH-01 ratio 3,43 ; B-3 nul ; pas JKO non-JKO ; N10-C trunk collapse et correctif C ; E1-small ; bouba rev C échecs ; M5 certify ; NH-81), dis si la preuve dans le dépôt soutient la lecture. Cherche les bugs, fuites, nuls mal calibrés, tests tautologiques, préregs modifiées après coup, divergences entre code et texte. Cite chemin:ligne.
3. **Analyses** : ordres de grandeur, puissance statistique, ce qui est décidable avec les N prévus.
4. **Suppositions** : hypothèses implicites non testées ; hypothèses alternatives plus simples qui expliqueraient les mêmes données.
5. **Pistes d'utilité** : qu'est-ce qui, dans ces dépôts, a une valeur pratique hors du labo (outils, méthodes, jeux de données, notes méthodologiques publiables, transferts vers produits ou formation) ? Qu'est-ce qui n'en a aucune et devrait être arrêté ?
6. **Littérature** : avec la recherche web, cite 10 à 20 publications 2025-2026 (arXiv, bioRxiv, NeurIPS/ICLR/ICML 2026, Nature/Science/PLOS) directement pertinentes, avec identifiants vérifiés, et dis en quoi elles confirment, infirment ou dépassent les hypothèses Hypneum.

Classe les constats : BLOQUANT / MAJEUR / MINEUR / OK. Pas de flatterie. Si tu ne peux pas vérifier, dis-le.

Écris le rapport final dans `../codex/report-sol-2026-10-30.md` (chemin relatif au répertoire courant), et ne modifie rien dans les dépôts.
