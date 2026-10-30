# Etat du calcul Hypneum - releve LECTURE SEULE du 2026-10-30

Horodatages : chaque hote a ete interroge entre 14:22:19 et 14:23:25 CET (rondes 14:22:30, 14:23:00, 14:23:25). Aucune commande d'ecriture, aucun arret/relance.

## 1. kxkm-ai (electron@<kxkm-lan>) - releve 14:22:30 / 14:23:00
Charge 1,13 / 1,48 / 1,62 ; RAM 26 Gi utilises / 62 (36 Gi dispo) ; disque `/` 1,8T, 678G libres (60 %) ; GPU RTX 4090 : 70 % util, 21 872 / 24 564 MiB, 41 C.

| Job | Chemin | PID / tmux | Demarre | Progression | ETA | Ressources | Dernier log |
|---|---|---|---|---|---|---|---|
| E1-small confirmatoire (Qwen3.5-4B, `pilot_cycle3_cuda.py --mode confirmatory`) | `/ai/saisail/e1-small/out/run-2026-10-29/confirmatory{,.log}` | PID 3352583 ; tmux `e1s-conf` | 2026-10-30 00:05:29 (etime 14h16) | **290 / 1410 cellules** (20,6 %) ; wall 176-178 s/cellule (conforme aux notes) | 1120 x ~177 s = ~55 h -> **~2026-11-01 21:30** | GPU 20,5 Go VRAM (quasi plein : 3 Go libres) ; CPU 124 % | 14:20, `p_max\|7 pre=0.290 post=0.383 wall=177.6s` (log vivant) |
| ComfyUI (hors Hypneum) | `/ai/ComfyUI2` | PID 712018 | 21 j | - | - | 652 MiB VRAM, 27 % RAM | - |
| M5 analyse secondaire (26 workers nice 19) | `/ai/saisail/m5-secondary/` | **aucun worker reel** | - | Seuls 2 workers `m5sec-dummy-worker.py` (nice 19) d'un `guardtest.3Fha` vieux de ~1 min au moment du releve : test de garde, pas le vrai job. `results/` vide ; logs `val_*` (6) du 30/10 14:10 | non lance | - | `code`/`logs` mtime 14:10-14:12 (prepa en cours) |
| Nuls calibres Me6 bouba | introuvable sur kxkm | - | - | Aucun process ni dossier `*null*`/`*me6*` dans `/ai/saisail/` | non lances sur kxkm | - | - |
| N10-C KXKM (`n10c-run2`) | `/ai/saisail/n10c-run2/{campaign,repo}` | aucun process | cree 29/10 06:31-06:43 | `campaign/status/` vide, `trunks/` seed-0 et seed-101 (squelette) | en attente (E1-small tient le GPU) | - | - |

Note : le GPU est sature par E1-small (21,9 Go / 24,5) ; un N10-C GPU concurrent n'a pas la place.

## 2. macm1 (<macm1-tailnet>) - releve 14:22:30 / 14:23:00 / 14:23:25
Uptime 3 j 15 h ; **load 15,7 / 19,0 / 20,0** ; disque interne `/` 59 Gi libres (18 % utilise) ; T7 `/Volumes/T7` 1,8 Ti, **303 Gi libres (84 % utilise)**.

| Job | Chemin | PID | Demarre | Progression | ETA | Dernier log |
|---|---|---|---|---|---|---|
| N10-C run2 `closed-gtm-s0` (via `run_campaign`, launcher) | `~/scratch/n10c-run2/campaign/runs/closed-gtm-s0` | launcher PID 75468 (etime 1 j 07:30) | run : 2026-10-30 00:57:41 | **ckpt 36 003 840 / 50 000 000** (72 %), ~1,0 M pas / 21-22 min | 14 M restants = ~5 h -> **~19:00-19:30** (+ eval) | ckpt 13:50 (frais, ~33 min au releve) ; statut `running`, 0 echec infra |
| N10-C run2 `registered-gtm-s0` | `.../runs/registered-gtm-s0` | termine | 29/10 06:52 | statut `trained`, 50 M pas en 65 087 s (18,1 h) a 00:57 ; `eval_done=false`, `archived=false`, `synced=false` | - | - |
| Autres graines | `.../campaign/trunks/` : seed-0, seed-101-{registered-dial,closed-gtm,registered-nocomm,closed-dial} (squelettes 29/10 06:32) | - | - | **aucune autre graine en cours** (une seule run a la fois ; `cross_status` vide) | - | - |
| Telechargement ActionSense S02-S05 | `~/hypneum-lab/actionsense/bouba_sens`, `data/actionsense_raw` -> symlink `/Volumes/T7/hypneum-lab/actionsense/actionsense_raw` | `fetch_actionsense.py` PID 95329 (etime 17:32, nice 10, caffeinate) | ~14:05 | **en cours** : 44 G sur T7, S02 cree (MANIFEST 14:12) ; S03-S05 pas encore | non determinable (pas de log) ; puis `--verify` | MANIFEST.json 14:12 |
| bouba pilote v0.9 | - | aucun process correspondant | - | non detecte | - | - |

Etats annexes : heavy lock `~/scratch/.heavy.lock` (vide, 29/10 06:37) = **legitime** (campagne vivante) ; `~/.mtplx/paused` (29/10 06:52) = modele de jour en pause, coherent (launcher: `day_model_paused`) ; cron `47 * * * *` present (n10c-sync) ; `~/scratch/n10c-run/sync.log` : dernier passage **13:47** "synced 0 run(s)" (11:47, 12:47 idem), prochain 14:47, rien d'anormal.
Cause probable du load eleve (non agressif pour le job) : Spotlight `mds_stores` 69 % CPU et `StorageManagementService` 66 % (indexation du T7 / volume apres gros transfert) ; le fetch ne consomme que 8 %.

## 3. electron-server (<es-tailnet>) - releve 14:22:30 / 14:23:00
Uptime 94 j ; **load 20,1 / 17,5 / 16,1** ; RAM 20 Gi utilises / 63 (42 Gi dispo) ; `/` 206 G libres (13 %) ; `/home` 746 G libres (63 % utilise).

| Job | Chemin | PID | Demarre | Progression | ETA | Dernier log |
|---|---|---|---|---|---|---|
| NH-01 rerun provenance `confirmatory` (2 workers, nice 19) | `~/scratch/merge-1030/rerun/out-confirmatory` | wrapper 1433865, python 1434069 + workers 1434070/1434072 | 13:10:32 (etime ~1h12) | 9 fichiers ; pas de compteur de cellules lisible | notes : fin ~16:30 (non verifiable) | fichier modifie 14:19 |
| NH-01 rerun provenance `correlated` (2 workers, nice 19) | `.../out-correlated` | wrapper 1434000, python 1434233?/1434234/1434235 | 13:10:33 | 10 fichiers, `cells.jsonl` ecrit | notes : fin ~19:40 (non verifiable) | fichier modifie 14:21 |
| bouba-sens tests (pytest, `bs-me6n`, `bs-52`) | `~/scratch/as-h5py-2026-10-28/` | 1743227 / 1745454 / 1753627 (renouveles a chaque lecture) | 14:17+ | suite de tests en cours (CPU 150-220 %) | - | - |
| Archive N10-C | `~/archives/n10c/` | cron `17 * * * *` (flock) | - | **2 runs archives** : registered-eng-s73, registered-gtm-s0 (+ `_campaign`, `cross_status`) ; source kxkm `/ai/saisail/n10c-run/campaign` | - | `pull.log` : dernier pull **14:17:01-14:17:04**, "2 completed, 0 failed" |
| M5 certify | `~/scratch/m5-rule`, `m5-macm3-bench`, `m5-20260429` | **aucun process certify** | - | **arrete** (coherent avec arret 13:58 ; dernier mtime dossiers 13:26-13:27) ; reste M3 : 37 configs | - | - |
| kfr-* | `kfr-nh60`, `kfr-eps` | aucun process | - | inactifs (derniere modif 27/10) | - | - |
| bouba-null | `~/scratch/bouba-null/repo` | aucun | dernier mtime 25/10 | **inactif**, simple squelette `reports/` + `scripts/` | - | - |

Note : les PID 1434069/1434192 des notes sont devenus 1434069-1434072 / 1434234-1434235 (plusieurs workers) - les jobs sont bien ceux annonces, lances 13:10.

## 4. macM3 (alias SSH `macM3` -> macm3.tail78ae15.ts.net) - releve 14:22:30 / 14:23:00
**Uptime 40 min (la machine a redemarre vers 13:42)** ; load 1,7 ; disque `/` 460 Gi, **265 Gi libres (5 % utilise)** (attendu ~261).

| Job | Chemin | PID | Demarre | Progression | ETA | Dernier log |
|---|---|---|---|---|---|---|
| NH-81 replique M3 Pro (`measure.py`, mesure energie) | `~/scratch/nh81-m3/` | PID 1647 (etime 25:46 au releve) ; 1649 `m3_wait.sh`, 1808 caffeinate | lancement 13:57:00 | `measure.jsonl` **61 lignes**, en cours workload W2 / chemin `fused`, pair 7 (cycles rest/run) ; total de paires non lisible | notes : ~15:30 (non verifiable) | 14:22 (frais) |
| M5 grille certify v2 (37 configs gamma 20-100) | `~/scratch/m5-macm3/` | `run_shard_v2.sh` PID 2039 en attente (boucle `pgrep nh81-m3`) | arme 13:00:49Z | **pas demarre** : attend la fin de NH-81 + 2 x 60 s + 120 s | demarre vers ~15:35 si NH-81 finit 15:30 ; duree grille inconnue | `logs/wait_nh81.log` |

## 5. studio (<studio-tailnet>) - releve 14:22:31 / 14:23:00
Uptime 2 j 21 h ; load 2,1 ; disque `/` 4,1 Ti libres (1 %).
**Aucun calcul Hypneum** : processus dominants = mactop, oMLX.app, server diarisation (`./server.py --allow-ip ... .diar_api_key`, hors Hypneum). Residus : `~/hypneum-e1` (634 Mo : smoke-30cell 28/10, dok, timing), `~/scratch` (logs de nettoyage HF), `~/hypneum_lab`, `~/scratch/n10c-bench`. Poids E1 35B bien absents.

## Anomalies et points d'attention
1. **kxkm : ETA E1-small ~55 h (fin ~01/11 21:30)** ; GPU quasi plein, tout N10-C GPU/Me6 sur kxkm attend. Pas d'anomalie de vitalite (log a 14:20).
2. **kxkm : `guardtest.3Fha/m5sec-dummy-worker.py`** : 2 workers factices nice 19 lances pendant le releve (14:21) - pas un vrai M5 secondaire. Le vrai job M5 secondaire n'est pas lance.
3. **macm1 : load 15-20** a cause de Spotlight (`mds_stores`) et `StorageManagementService` ; surveiller que le training closed-gtm-s0 ne ralentit pas (cadence ckpt ~21-22 min, normale a 13:50 ; prochain ckpt attendu ~14:12 - **non confirme au releve 14:23 : le dernier ckpt listé etait 13:50, soit 33 min**, a surveiller, possible leger ralentissement).
4. **macm1 : T7 84 % utilise (303 Gi libres)** ; seuil 10 % non atteint, mais S03-S05 d'ActionSense vont consommer (S02 seul deja ~44 G cumul avec S00).
5. **macm1 : `registered-gtm-s0` `trained` mais `eval_done=false`, `archived=false`, `synced=false`**. Le cron sync tourne sur `~/scratch/n10c-run/` (pas `n10c-run2`) et rapporte "synced 0" : le run2 n'est donc pas synchronise vers kxkm/ES ; a confirmer que c'est voulu (le pull ES lit `/ai/saisail/n10c-run/campaign` de kxkm, c'est l'ancien run).
6. **macM3 a redemarre ~13:42** (uptime 40 min) : NH-81 a ete lance 13:57 apres ; pas de perte de run apparente.
7. Aucun lock orphelin, aucun process mort constate, aucun log fige > 1 h sur les jobs actifs (NH-01 : fichiers 14:19-14:21).

## Non verifie, et pourquoi
- Progression exacte (cellules faites/restantes) des NH-01 rerun sur ES : pas de compteur lisible sans ouvrir `cells.jsonl` en detail ; ETA 16:30 / 19:40 non confirmes.
- Total de paires NH-81 (donc ETA 15:30) : pas de total dans `measure.jsonl`.
- ETA du fetch ActionSense S02-S05 : pas de log de progression (taille T7 seule).
- bouba pilote v0.9, nuls calibres Me6 : aucun process ni dossier correspondant trouve sur kxkm/macm1 ; non localisables par `ps`/`ls` sans connaitre le chemin.
- Pas de `powermetrics`/sudo ; pas d'utilisation CPU/GPU fine par job sur macm1/M3/studio.
- Duree de la grille M5 v2 sur macM3 (37 configs) inconnue.
