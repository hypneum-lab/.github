# État du calcul (lecture seule, 2026-11-06 18:57 CET)

| hôte | ce qui tourne | depuis | remarque |
|---|---|---|---|
| KXKM-AI (RTX 4090) | `pilot_cycle3_cuda.py` (contrôles addendum E1-small, dream-of-kiki PR #92) | 4 h 31 | GPU 58 %, 21,8 / 24,6 Go ; fin attendue 07-08/11 |
| KXKM-AI (CPU) | 8 workers `p8c_nocap --confirmatory` (Hopfield P8c relance, préreg gelée sans verrou → ADR-0003, PR #118) | 25 min à 1 h par worker (vague en cours) | load 9,2 ; plafond de mur 10/11 19:34Z ; `cells.jsonl` n16384 vide à 17:20 |
| macM1 | OrbStack srv + Gitea sains (16:50) ; aucune campagne | — | tests N10-D et MC k = 20 joués dans des worktrees jetables, supprimés |
| electron-server | aucune campagne | — | — |

Aucune campagne lancée ni arrêtée par cette revue. Rien lu dans les résultats.
