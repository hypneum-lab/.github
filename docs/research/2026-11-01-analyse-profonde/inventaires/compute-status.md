# Compute status, 2026-11-01 18:10 CET (lecture seule, aucun score)

| Hôte | Uptime | Job / progression | Ressources | Anomalie |
|---|---|---|---|---|
| KXKM | 58 j | E1-small confirmatoire (tmux e1s-conf, PID 3352583, démarré 30/10 00:05) : 1227 lignes/1410 cellules (87 %), fichier modifié 18:09. Pas de driver.log (fichier absent, pas de ligne rc=). N10-C run2 : dossier /ai/saisail/n10c-run2/campaign existe (pas lancé par moi ; état à confirmer). | GPU 21,9/24,6 Go : E1-small 20,6 Go + ComfyUI2 (PID 712018) 0,65 Go ; RAM 26/62 Go ; disque 678 Go libres | ComfyUI sur le GPU pendant la confirmatoire (VRAM 22/24,5 Go, marge faible) |
| macM1 | 5 j 19 h | N10-C run2 : checkpoints 50M présents pour registered-gtm, closed-gtm, registered-nocomm, closed-nocomm ; registered-dial-s0 en cours (ckpt 29,0M/50M), PID 75468 (depuis jeu.) | swap 40,7/42 Go (1,3 Go libre), free pages ~4000 ; load 6 ; disque interne 65 Go (93 %) ; T7 172 Go libres (91 %) | swap quasi plein (risque Gitea/OOM) ; console.log figé depuis 29/10 ; cron GB300 : rsync erreurs 12 et "Operation not permitted" sur /Volumes/T7/gb300-20261101/hypneum-20261101 (dernier passage 18:00, size vide) ; ~/gb300-archive 12 Go ; sync.log 17:47 "synced 0 run" |
| electron-server | 97 j | Me6 confirmatoire : TERMINÉ (confirm exit 0 + analyse exit 0 le 31/10 22:46Z), archive jko-splitting-confirm-20261031 avec summary.json + SHA256SUMS ; aucun process me6 actif. Cron pull n10c-run2 OK (22:03 : 0 run complet) ; archive gb300-20261101 mise à jour 18:01 | RAM 18/63 Go ; /home 726 Go libres (64 %) ; load 1,2 | aucune |
| macM3 | 7 h 40 | PID 19298 et 30165 absents, aucun python actif : reboot (~10:30) ou fins. scratch/m5-macm3/results : certify*.jsonl, summary_pooled.txt ; pas de table_final.md vu dans results (non cherché plus loin) | disque 175/460 Go ; load 1,7 | jobs attendus non vivants : à confirmer par PI s'ils ont fini ou été tués par le reboot |
| Studio | 7 j | m5-secondary : aucun process ailiance, dossier avec SHA256SUMS + results (dernier 31/10 18:42) : fini | disque 262 Go libres ; monsieurb actif (python, ne pas toucher) | aucune |

GB300 : non contacté.

## Anomalies
1. macM1 swap 97 % plein.
2. Cron GB300 macM1 échoue depuis ~17:00 (permission T7 sur hypneum-20261101 : probablement droit Full Disk Access/cron) ; 2 passages d'affilée.
3. macM3 : PID 19298/30165 morts, uptime 7 h 40.
4. KXKM : ComfyUI co-résident sur GPU ; pas de driver.log.

## Décision PI
- Corriger/relancer le cron GB300 (permission T7) ; vider le swap macM1.
- macM3 : relancer ou acter la fin (39e config M5, surcouche).
- KXKM : fin E1-small attendue (~220 cellules restantes) ; ensuite N10-C KXKM et NH-81 r4 sur go.
