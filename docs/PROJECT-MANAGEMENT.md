# Hypneum Lab — Gestion de projet

Version 1 du 25 octobre 2026, complétée le 15 novembre 2026 (§0, principes). Complète la roadmap trimestrielle (privée dans hypneum-lab/library depuis le 2026-11-15). Un seul chercheur, dix heures par semaine, des agents pour rédiger et exécuter.

## 0. Principes du programme

Source publique des six principes cités par les préenregistrements, ADR et
amendements des dépôts d'études (par exemple « principe 3 », « principe 6 »).
Texte repris sans changement de la roadmap v2.2 (hypneum-lab/.github
`docs/ROADMAP.md` au commit 12449ff, 2026-11-11, lignes 15-20) le
2026-11-15, jour où la roadmap est devenue privée. Toute révision des
principes se fait ici, par PR publique, et est datée.

1. **Vérité avant nouveauté.** On ne lance rien de neuf tant qu'un chiffre faux reste dans un README, un papier ou un fichier Zenodo.
2. **Falsifiable avant testé.** Une hypothèse entre en phase de test seulement si elle a un nul calibré, un critère de réfutation écrit et un verdict informatif en cas de négatif.
3. **Une campagne, un verdict.** Pas de nouveau **gel** tant que la précédente campagne n'a pas rendu son verdict ; la lecture n'est pas un gel (spec:140). Exception inchangée : un addendum de contrôle sur une campagne en cours.
4. **Le calcul suit les machines.** Une seule campagne lourde à la fois. Aucune nouvelle campagne GPU avant S6 ; depuis le 10/11, aucune campagne lourde avant le dépôt arXiv de la note méthodo. CPU léger sur electron-server, CPU lourd sur KXKM en `nice 19`, jamais sur GrosMac.
5. **Dix heures par semaine, sauf exception datée.** La règle reste 10 h par semaine : deux soirées (arbitrage lundi, écriture jeudi) et un demi-week-end. Le trimestre S1-S13 est une **exception datée** : 185 h (≈ 14 h par semaine), décidée par le PI le 01/11 (rapport:303), mesurée chaque mois et comparée à la règle. La réconciliation avec le plafond de 10 h du plan pro 3 ans appartient au PI (spec:32). Les agents rédigent et exécutent ; le chercheur décide, lance, valide, signe.
6. **Lire avant de geler.** Aucun tag de gel sans note de lecture, contradicteur et trois tests passés (saturation, recoupement, couverture ; spec §4.2). Le verrou s'applique à toute campagne lourde (GPU, ou > 6 h CPU, ou > 1 semaine calendaire) et à toute préreg L3. Les campagnes déjà gelées (E1-small, N10-C run 2, Me6, GB300 g7) ne sont pas re-soumises.

## 1. Outils et où vit quoi

| Besoin | Outil | Règle |
|---|---|---|
| Tâches, hypothèses, jalons | **GitHub Projects** (org hypneum-lab, projet « Hypneum — Programme 2026-27 ») + une issue par tâche dans le dépôt concerné | une issue = un verdict attendu ; jamais d'issue « réfléchir à » |
| Vue d'ensemble, décisions, cadence | `ROADMAP.md` (privée dans hypneum-lab/library depuis le 2026-11-15) et ce fichier dans hypneum-lab/.github ; copie Outline (collection Hypneum Lab) | la version GitHub fait foi ; Outline = lecture |
| Décisions scientifiques | ADR dans chaque dépôt (`docs/adr/`), numérotés sans doublon | une décision = un ADR daté, jamais un commentaire de PR |
| Préenregistrements | niveaux L0–L3 (§4) ; fichiers dans `docs/preregistration/` du dépôt | une préreg sans tag n'existe pas |
| Résultats | JSON commis dans `results/` ou DOI Zenodo ; jamais un chiffre nu dans un README | definition of done (§5) |
| Antériorité | tag annoté + Software Heritage (L1), e-Soleau ou Zenodo restreint (L2), OSF ou Octopus (L3) | voir §4 |
| Veille | revue annuelle complète (octobre) + veille semestrielle ; rapports dans `docs/research/` | la veille ne crée jamais une tâche directement : elle alimente le triage du lundi |

## 2. Cadence hebdomadaire (10 h)

| Créneau | Durée | Contenu | Sortie |
|---|---|---|---|
| **Lundi soir — arbitrage** | 2 h | Lire les PR et rapports d'agents de la semaine passée ; fusionner ou renvoyer ; trier le tableau (colonne « À valider ») ; décider les 3 tâches de la semaine ; mettre à jour les champs du projet | 3 issues « En cours », PR fusionnées ou commentées |
| **Jeudi soir — écriture** | 3 h | Préregs, ADR, errata, sections de papier ; relecture des brouillons d'agents | 1 document avancé ou terminé |
| **Samedi — calcul et analyse** | 5 h | Lancer les runs sur ES/KXKM (jamais GrosMac) ; lire les résultats ; écrire le verdict dans l'issue et la table maîtresse ; fermer | verdicts écrits ; issues fermées |

Règle des trois : au plus trois issues « En cours » à la fois. Une quatrième attend.

## 3. Le tableau GitHub Projects

Champs : **Statut** (À faire · En cours · Bloqué · À valider · Fait) · **Dépôt** · **Axe** (GENIAL, nerve-wml, kiki-flow, bouba_sens, baby-brain, micro-kiki, matière, bio, thermo, maths) · **Type** (correction, préreg, hypothèse, papier, infra) · **Phase** (0 Vérité, 1 Falsifiable, 2 Hypothèses, 3 Écrire, 2027) · **Hôte** (ES, KXKM-CPU, KXKM-GPU, macM1, aucun) · **Coût estimé (h)** · **Échéance**.

Vues : « Cette semaine » (En cours + À valider) · « Par phase » · « Par hôte » (planning machines) · « Verdicts » (issues fermées avec étiquette de verdict).

Étiquettes (toutes les repos) : `phase:0-verite`, `phase:1-falsifiable`, `phase:2-hypotheses`, `phase:3-ecrire`, `phase:2027` ; `type:correction`, `type:prereg`, `type:hypothese`, `type:papier`, `type:infra` ; `axe:*` ; `hote:*` ; `verdict:confirme`, `verdict:refute`, `verdict:nul`, `verdict:non-concluant`, `verdict:retracte`, `verdict:amende` ; `a-valider-pi`.

Jalons (dans chaque dépôt, mêmes dates) : M0 Vérité — 8 nov 2026 · M1 Falsifiable — 29 nov 2026 · M2 Dix hypothèses — 3 jan 2027 · M3 Note méthodo + GO/NO-GO — 24 jan 2027.

### Gabarit d'issue « hypothèse »

```
## Énoncé (verbatim, EN)
## Prédiction quantitative
## Test (script, graines ≥ 5, hôte, durée)
## Nul calibré (comment, seuil)
## Critère de réfutation
## Ce que dit un négatif (nul informatif)
## Références (vérifiées)
## Préreg : niveau L0/L1/L2/L3, lien
## Verdict (rempli à la fermeture) : classe + chiffre + artefact
```

### Gabarit d'issue « correction »

```
## Ce qui est faux (fichier:ligne, chiffre, source qui le contredit)
## Correction
## Où le retirer (README, papier, Zenodo, ADR)
## Erratum : oui/non, lien
```

## 4. Niveaux de préenregistrement

| Niveau | Quoi | Coût | Quand |
|---|---|---|---|
| L0 | brouillon dans `docs/preregistration/`, PR ouverte | 0 | dès l'idée |
| L1 | gel : tag annoté `prereg-<nom>-<date>` + archive Software Heritage (SWHID) | 0 | avant tout run |
| L2 | date opposable : e-Soleau (15 €) ou Zenodo accès restreint (DOI) | 0–15 € | même jour que L1 |
| L3 | public : OSF Registrations (tant que possible) ou Octopus (type « Hypothesis ») | 0 | avant les runs confirmatoires |

Un amendement = nouveau niveau L1 (nouveau tag), daté, avec la liste des runs exclus. Les runs lancés avant le tag ne comptent pas.

## 5. Definition of done

Une hypothèse est **terminée** quand : préreg ≥ L1 · ≥ 5 graines (ou puissance calculée) · nul calibré · artefacts JSON commis ou DOI · verdict écrit dans l'issue, dans la table maîtresse et, si public, dans le README · erratum si un chiffre antérieur change.

Une correction est **terminée** quand : le chiffre faux n'apparaît plus nulle part (grep), l'erratum est publié avec cause racine, la version (DualVer, pyproject, CITATION) est cohérente.

Une préreg est **terminée** quand : L1 au minimum, règle d'interprétation écrite, hôte et durée réservés dans le calendrier des machines.

## 6. Vocabulaire des verdicts (9 classes)

confirmé · réfuté · nul (équivalence TOST) · non concluant · rétracté · amendé · en attente (préreg déposée, pas de run) · non testé · non vérifiable (artefact absent). « Confirmé » exige un nul calibré ; sinon « non concluant ».

## 7. Rituels mensuels et trimestriels

- **Fin de mois (1 h, samedi)** : indicateurs de la roadmap (privée) ; table maîtresse mise à jour ; une ligne dans `docs/research/journal.md`.
- **Fin de phase** : revue de jalon, décision GO/NO-GO des axes concernés (ADR), roadmap révisée.
- **Octobre** : revue complète des hypothèses (format du 24/10/2026) ; veille semestrielle en avril.

## 8. Travail avec les agents

- Brief = objectif, périmètre, fichiers à lire, contraintes machines (jamais GrosMac), format de sortie, « n'invente rien ». Les agents produisent des PR brouillons ; le chercheur fusionne.
- Toute PR scientifique passe par une relecture indépendante à contexte vierge avant fusion (critic).
- Les agents ne déposent jamais sur OSF, Zenodo, e-Soleau, arXiv ni HAL : ce sont des actes du chercheur.
- Chaque session d'agents laisse une note de reprise (mémoire) : état, fichiers, prochaine action.

## 9. Communication

Pas de « lab », pas de « PI », pas d'« axiomes » dans les textes publics tant que ce n'est pas mérité : « chercheur indépendant », « hypothèses de cadre », « invariant » réservé à ce qui a passé un nul. Un fil public (profil GitHub) une fois par phase : ce qui a été testé, ce qui est tombé, ce qui vient.
