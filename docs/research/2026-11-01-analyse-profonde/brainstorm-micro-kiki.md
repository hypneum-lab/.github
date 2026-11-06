# Brainstorm — micro-kiki après lecture (v0, 2026-11-01)

*Task 7 du plan « verrou de lecture ». Aucun calcul lancé, aucune préreg modifiée. Chemins `synthese/`, `veille/`, `inventory/` : dossier de l'analyse du 01/11 ; `mk/` : clone `hypneum-lab/micro-kiki` au SHA 61056d9d9e34. Statuts de lecture comme dans `brainstorm-dream-of-kiki.md`. Identifiants résolus par API le 01/11.*

**Question ouverte rappelée.** Le routage d'adaptateurs LoRA par domaine, la borne C5 et la mesure J/token contiennent-ils une question scientifique que la littérature n'a pas tranchée ? Réponse de la veille : non pour le routage et la borne ; la seule matière propre est un rapport d'ingénierie, un négatif honnête (Paper A) et la mesure J/token sur Apple Silicon (`veille/veille-2026-11-01.md:176` ; `synthese/rapport.md:222`). La lecture de ce soir réduit encore ce dernier point.

## (a) Ce que la lecture a changé

| Affirmation du dépôt | Après lecture | Sources (statut) | Recoupement |
|---|---|---|---|
| Système : routeur 46,4 % top-1, couche cognitive « +7 pp », latence 4-6 s (`mk/paper/micro-kiki.tex:50`) | **Rapport technique** : A/B nul, Δ = −0,0102 (t −0,44, n = 30) sur un composite lexical ; latence mesurée 12,0-12,6 s (`synthese/rapport.md:101`) ; random top-3 = top-1, baseline mots-clés réduite au nom de domaine (`:103`) ; juge qui renvoie l'index 0 (`:65`) | Arrow, arXiv:2405.11157 ; PHATGOOSE, arXiv:2402.05859 [lus en entier, veille 01/11 : `veille/veille-2026-11-01.md:144-147`] ; DEMix, arXiv:2108.05036 [résumé moteur] | deux articles revus ICML 2024 + JSON du dépôt : oui |
| Null-space « superflue sur MoE », « novel finding » (`mk/paper/micro-kiki.tex:273-274`) | Contredit : chez Chowdhury et al., des gradients de domaines **quasi orthogonaux** (cos = −0,002 ± 0,003 sur 20 essais) coexistent avec un transfert négatif mesuré, par contention dans le même sous-espace d'adaptateur ; l'orthogonalité ne prouve donc pas l'absence d'interférence. Le code mesure en outre l'angle principal minimal entre sous-espaces de gradients, pas le « pairwise cosine » du texte, sans contrôle aléatoire (`mk/src/eval/forgetting.py:65-93` ; `synthese/rapport.md:104`) | Chowdhury et al. 2026, arXiv:2609.03150 [lu en partie ici : résumé, §diagnostic gradients, annexe cosinus] | prépublication + code du dépôt (constat code ≠ texte) : **à recouper** pour la partie « déjà publié » (une seule prépublication) |
| C5 : I(M;Y) ≤ S(ρ_Y) ≤ N (`mk/docs/paper-a/c5-info-bound.tex:22-30`) | Seule la **DPI I(M;Y) ≤ I(X;Y) ≤ H(Y)** s'applique : le simulateur donne des espérances exactes, le plafond N ne vaut pas ; E-02 garde N (`mk/docs/ERRATA.md:127-130` ; `synthese/rapport.md:64`) | Banchi, Pereira, Pirandola 2021, arXiv:2102.08991 [lu en entier, revue 01/11 : `veille/revue-de-fond-2026-11-01.md:703`] ; Huang, Kueng, Preskill 2021, arXiv:2101.02464 [résumé moteur] | article revu + contre-exemple Codex K9 (`synthese/rapport.md:64`) : oui |
| NH-81 J/token, négatif « le plus vendable » | **Clos par erratum** (décision Q7, `synthese/rapport.md:300`) : R ≤ 1 par construction de la voie fused (`mk/docs/prereg/2026-10-25-nh81-joules-per-token.md:22,97-100`) ; macM1 R̂ = 0,91 [0,83 ; 1,01] (`mk/docs/results/2026-10-25-nh81-joules.md:63`), M3 Pro 0,670 [0,662 ; 0,677], IC disjoints (`synthese/rapport.md:106`) ; erreur de la revue du 30/10 (`:184`, E12) | prérégistration et résultats du dépôt ; Codex K12 | oui |
| « Mesure J/token sur Apple Silicon » comme niche (`synthese/rapport.md:222`, revue R9 `veille/revue-de-fond-2026-11-01.md:465-472`) | **Niche en partie prise depuis** : GreenBench mesure l'énergie d'inférence de cinq LLM 3-9B sur M4 Pro via `powermetrics` ; Alfarizy et al. comparent MoE et dense sur M2 Pro (énergie par jeton) ; un article IEEE 2026 porte sur l'échelle de l'énergie par jeton sur Apple Silicon. Aucun ne mesure un modèle impulsionnel | arXiv:2608.28667 [résumé moteur] ; arXiv:2606.21428 [résumé moteur] ; DOI 10.1109/cando-epe71091.2026.11569440 [titre seul, Crossref] | trois sources de nature différente (2 prépublications, 1 acte IEEE) : oui pour « mesure Apple Silicon déjà publiée » ; « aucun spiking » **à recouper** |
| Aeon présenté comme apport propre (draft-v1) | Aeon est d'Arslan, adopté tel quel selon la spec du dépôt (`synthese/rapport.md:63`) | Arslan 2026, arXiv:2601.15311 [titre résolu ; résumé moteur] | spec du dépôt + prépublication : oui |

## (b) Ce qui reste ouvert, avec la preuve de l'absence

1. **Rien de scientifique sur le routage** : saturé depuis 2021 (DEMix, BTM, BTX, LoraHub, Arrow, PHATGOOSE, quatre soumissions ICLR 2027, `veille/veille-2026-11-01.md:176`). Pas de question ouverte à défendre ; la note ne cherche pas à en créer une.
2. **Écart entre plateformes Apple (0,67 contre 0,91)** pour un même dispositif impulsionnel fused : propriété de l'implémentation, pas de la neuromorphie (`inventory/micro-kiki.md:276`). Requêtes ce soir : arXiv `abs:"energy per token" AND (spiking OR Apple OR "unified memory")` → 2 résultats (GreenBench, Alfarizy et al.), aucun impulsionnel ; Crossref `query.bibliographic="energy per token spiking language model Apple Silicon"` → 10 lus, 1 gardé (acte IEEE ci-dessus), aucun impulsionnel. OSF : 1 préreg énergie-SNN en biosignaux (`2s4xp`, `veille/revue-de-fond-2026-11-01.md:670`), hors LLM. Couverture : bioRxiv sans objet ; GitHub/HF non interrogés ce soir.
3. **Borne de Holevo de l'ensemble d'états du plongement** (Banchi) pour le circuit à 4 qubits : calculable, jamais calculée dans le dépôt (`synthese/rapport.md:64`). Zéro hit OpenReview/Zenodo sur « Holevo classification » (`veille/revue-de-fond-2026-11-01.md:655`).

## (c) Idées, classées par « ce que ça tranche / coût »

| # | Dessin | Nul calibré | Critère de réfutation | Coût machine / humain | Ce que ça tranche | Antériorité la plus proche |
|---|---|---|---|---|---|---|
| 1 | **Erratum NH-81** : statut unique (main, PR #19, préreg GB300), « R ≤ 1 par construction de la voie fused », écart 0,67 / 0,91 publié comme observation d'ingénierie, conventions de mesure citées (régime stationnaire, prefill/decode séparés) | sans objet | — | 0 h / 2 h | ferme NH-81 sans run KXKM (décision Q7) | ML.ENERGY, arXiv:2505.06371 ; TokenPowerBench, arXiv:2512.03024 ; GreenBench |
| 2 | **Rapport technique + § null-space contrôlé** : retirer « +7 pp » et la table des latences (retraits décidés, spec §5.2) ; C5 → DPI I ≤ H(Y) ; au § null-space, discuter arXiv:2609.03150 et ajouter un contrôle : angles entre sous-espaces aléatoires de même rang (r = 16) et même dimension, et entre LoRA d'un modèle dense | sous-espaces aléatoires de même rang | si |angle observé − angle aléatoire| < 0,5°, « MoE novel finding » est retiré (géométrie de la grande dimension) | CPU < 1 h (electron-server, numpy) / 4 h | dit si 88,6° est une propriété MoE ou de la dimension | arXiv:2609.03150 |
| 3 | **Holevo de l'ensemble** pour le plongement à 4 qubits, en remplacement du plafond N | borne triviale H(Y) | si χ ≥ H(Y), la borne est vide et on s'en tient à la DPI | CPU < 1 h / 4 h ; option | donne une borne non triviale ou montre qu'il n'y en a pas | Banchi 2021 |
| 4 | **Baselines honnêtes du routeur** : BM25 sur le texte de requête, null d'Aeon en distribution (M18) | permutation des étiquettes de domaine | si BM25 ≥ 46,4 % top-1 sur n = 5 377, la phrase « 2,2× » est retirée | CPU ≈ 2 h / 4 h | position réelle du routeur | Arrow ; PHATGOOSE |

Classement : 1 > 2 > 4 > 3. Les quatre relèvent de la correction ou du rapport, pas d'une hypothèse.

**Ce qu'on ne fait pas, et pourquoi.** **NH-85 (RAG contre Aeon) reporté après M3** (décision PI du 01/11 21:00, spec §5.3 l.83 et §9 l.143) : le routage de LoRA est saturé et Aeon est d'Arslan ; aucun dessin n'est proposé ici. Pas de run NH-81 sur KXKM le 04/11 ni de r5. Pas de nouvelle mesure J/token avant d'avoir lu GreenBench en entier. micro-kiki-quantum reste dormant (une phrase dans `ARCHIVED.md`, `synthese/rapport.md:108`).

## (d) Aucune de ces idées ne part avant un verrou

**Aucun de ces dessins ne part avant que le verrou soit passé.** Les idées 1 et 2 (partie texte) sont des corrections ; les contrôles numériques des idées 2 à 4 sont des pilotes CPU courts, non citables comme résultats tant qu'ils n'ont pas leur note de lecture.

## Journal (01/11/2026, soir)

- Résolution : `scripts/resolve_ids.py` sur ce fichier (arXiv `abs/`, Crossref `works/`).
- Lu en partie ici : arXiv:2609.03150 (PDF : résumé, diagnostic par cosinus des gradients, annexe). Résumé seul : arXiv:2608.28667, arXiv:2606.21428, arXiv:2601.15311.
- Requêtes nouvelles : 1 arXiv API (2 résultats, 2 gardés), 1 Crossref (10 lus, 1 gardé). Ce tour a changé une ligne : la niche « J/token sur Apple Silicon » est en partie publiée.
