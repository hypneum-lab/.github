# Relecture aveugle — Hypneum Lab (2026-11-01)

Rôle : relecteur indépendant (statistiques, ML, neurosciences computationnelles, physique statistique). Tu ne connais pas les conclusions de l'équipe. Tu lis les dépôts clonés dans ce répertoire (`clones/`), **y compris le texte intégral des manuscrits** :
- `dream-of-kiki/docs/papers/paper1/build/full-draft.tex`, `paper2/build/full-draft.tex`, prérégistrations `docs/osf-filing/*`, `docs/prereg/*`
- `nerve-wml/papers/paper1/main.tex` (+ refs.bib), ADR et prereg N10-C
- `kiki-flow-research/paper/main.tex`, `paper/workshop/*.tex`, résultats M5 / Lie-Strang (`results/`)
- `micro-kiki/docs/paper-a/paper-a-v2.tex`, `c5-info-bound.tex`, `paper/micro-kiki.tex`
- `micro-kiki-quantum/` (borne de Holevo, QPEFT)
- `bouba_sens/docs/paper/main.tex`, ADR-0025/0026/0027, prereg ActionSense v0.7
- `baby-brain/docs/paper/`, `BabyBrain/`
- `rescience-nh01/article/article.tex` + `content.tex` (réplication Fachechi-Agliari-Barra 2019)
- `paper-methodo-2026/paper/manuscript.md` + `docs/`
Tu peux lire `.github/docs/research/` SEULEMENT après avoir écrit tes sections 1–4.

Période : `git log --since=2026-10-24` dans chaque dépôt, PR brouillons, ADR, dossiers prereg, résultats.

Livrables numérotés, en français, dans `../codex/report-sol.md` (ne modifie rien dans `clones/`) :
1. État des lieux par dépôt (≤ 10 lignes chacun).
2. Lecture des papiers : pour chaque manuscrit, condensé section par section, équations/théorèmes vérifiés à la main, résultats revendiqués vs ce que le code et les fichiers de résultats supportent (code≠texte, prereg modifiée après coup, fuites, nuls non calibrés, contrôles tautologiques, inversions de signe), avec `path:line`.
3. Vérification des références : pour chaque .bib, entrées introuvables, mal attribuées, affirmation non présente dans la source ; antériorités manquantes. Utilise la recherche web (arXiv, Crossref, Semantic Scholar). Compte OK/KO par papier.
4. Analyses : ordres de grandeur, puissance, ce qu'un rapporteur dirait ; contribution réellement neuve.
5. Suppositions implicites.
6. Utilité : publiable tel quel, à arrêter, manquant pour soumission.
7. 10–20 références 2025–2026 vérifiées (id résolu) qui confirment, infirment ou devancent ces travaux.
Échelle : BLOQUANT / MAJEUR / MINEUR / OK. Si invérifiable, dis-le.
