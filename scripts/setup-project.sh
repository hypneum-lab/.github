#!/usr/bin/env bash
# setup-project.sh — mise en place idempotente du suivi GitHub du programme
# Hypneum Lab 2026-27 (org hypneum-lab) : étiquettes, jalons, issues, projet.
#
# Prérequis : gh ≥ 2.60 authentifié (scopes repo, admin:org, project), jq.
# Usage :
#   ./setup-project.sh                      # toutes les étapes
#   STEPS=labels,milestones ./setup-project.sh
#   STEPS=issues ./setup-project.sh         # ne crée que les issues absentes
#   STEPS=project ./setup-project.sh        # projet + champs + ajout des issues
#   REPOS="nerve-wml" STEPS=labels ./setup-project.sh   # un seul dépôt (ex. nouveau dépôt)
#
# Fichiers lus   : labels.json, milestones.json, issues-manifest.json, issues/<repo>/<slug>.md
# Fichiers écrits: issues-created.json, project.json
#
# Idempotence : labels → `--force` ; jalons → créés si absents, due_on mis à jour ;
# issues → une issue n'est créée que si aucune issue (ouverte ou fermée) du dépôt
# ne porte exactement le même titre ; projet → retrouvé par titre, champs créés
# si absents, items ajoutés si absents, valeurs des champs (ré)écrites.
set -euo pipefail

ORG="${ORG:-hypneum-lab}"
PROJECT_TITLE="${PROJECT_TITLE:-Hypneum — Programme 2026-27}"
STEPS="${STEPS:-labels,milestones,issues,project}"
REPOS_DEFAULT=".github dream-of-kiki nerve-wml kiki-flow-research bouba_sens baby-brain micro-kiki"
REPOS="${REPOS:-$REPOS_DEFAULT}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="$HERE/issues-manifest.json"
CREATED="$HERE/issues-created.json"
PROJECT_JSON="$HERE/project.json"

log()  { printf '%s\n' "$*" >&2; }
has_step() { [[ ",$STEPS," == *",$1,"* ]]; }

# ---------------------------------------------------------------- étape 1 : étiquettes
step_labels() {
  log "== Étiquettes"
  local n; n=$(jq length "$HERE/labels.json")
  for repo in $REPOS; do
    log "-- $ORG/$repo ($n étiquettes)"
    for ((i=0; i<n; i++)); do
      local name color desc
      name=$(jq -r ".[$i].name" "$HERE/labels.json")
      color=$(jq -r ".[$i].color" "$HERE/labels.json")
      desc=$(jq -r ".[$i].description" "$HERE/labels.json")
      gh label create "$name" -R "$ORG/$repo" --color "$color" --description "$desc" --force >/dev/null \
        || log "   ! échec étiquette $name sur $repo"
    done
  done
}

# ---------------------------------------------------------------- étape 2 : jalons
step_milestones() {
  log "== Jalons"
  local n; n=$(jq length "$HERE/milestones.json")
  for repo in $REPOS; do
    local existing
    existing=$(gh api --paginate "repos/$ORG/$repo/milestones?state=all&per_page=100")
    for ((i=0; i<n; i++)); do
      local title due desc num
      title=$(jq -r ".[$i].title" "$HERE/milestones.json")
      due=$(jq -r ".[$i].due_on" "$HERE/milestones.json")
      desc=$(jq -r ".[$i].description" "$HERE/milestones.json")
      num=$(jq -r --arg t "$title" '[.[] | select(.title==$t)][0].number // empty' <<<"$existing")
      if [[ -z "$num" ]]; then
        gh api "repos/$ORG/$repo/milestones" -f title="$title" -f due_on="$due" -f description="$desc" >/dev/null \
          && log "   + $repo : « $title » créé" || log "   ! échec jalon « $title » sur $repo"
      else
        gh api -X PATCH "repos/$ORG/$repo/milestones/$num" -f due_on="$due" -f description="$desc" >/dev/null \
          && log "   = $repo : « $title » (#$num) à jour" || log "   ! échec mise à jour « $title » sur $repo"
      fi
    done
  done
}

# ---------------------------------------------------------------- étape 3 : issues
milestone_due_date() { jq -r --arg t "$1" '.[] | select(.title==$t) | .due_on[0:10]' "$HERE/milestones.json"; }
fr_number() { # 0.5 → 0,5 ; null → « à estimer »
  if [[ "$1" == "null" || -z "$1" ]]; then printf 'à estimer'; else printf '%s' "${1/./,}"; fi
}
host_label_to_name() {
  case "$1" in
    hote:es) echo "ES";; hote:kxkm-cpu) echo "KXKM-CPU";; hote:kxkm-gpu) echo "KXKM-GPU";;
    hote:macm1) echo "macM1";; *) echo "aucun";;
  esac
}
phase_label_to_name() {
  case "$1" in
    phase:0-verite) echo "0 Vérité";; phase:1-falsifiable) echo "1 Falsifiable";;
    phase:2-hypotheses) echo "2 Hypothèses";; phase:3-ecrire) echo "3 Écrire";; *) echo "2027";;
  esac
}
type_label_to_name() {
  case "$1" in
    type:correction) echo "correction";; type:prereg) echo "préreg";; type:hypothese) echo "hypothèse";;
    type:papier) echo "papier";; *) echo "infra";;
  esac
}
axe_label_to_name() {
  case "$1" in
    axe:genial) echo "GENIAL";; axe:nerve-wml) echo "nerve-wml";; axe:kiki-flow) echo "kiki-flow";;
    axe:bouba-sens) echo "bouba_sens";; axe:baby-brain) echo "baby-brain";; axe:micro-kiki) echo "micro-kiki";;
    axe:matiere) echo "matière";; axe:bio) echo "bio";; axe:thermo) echo "thermo";; axe:maths) echo "maths";; *) echo "";;
  esac
}

compose_body() { # $1 = index dans le manifeste
  local i="$1" labels milestone due cost note host src body
  labels=$(jq -r --argjson i "$i" '.issues[$i] | [.phase, .type] + .axes + [.host, "a-valider-pi"] | map("`" + . + "`") | join(" · ")' "$MANIFEST")
  milestone=$(jq -r ".issues[$i].milestone" "$MANIFEST")
  due=$(milestone_due_date "$milestone")
  cost=$(fr_number "$(jq -r ".issues[$i].cost_h" "$MANIFEST")")
  note=$(jq -r ".issues[$i].cost_note" "$MANIFEST")
  host=$(host_label_to_name "$(jq -r ".issues[$i].host" "$MANIFEST")")
  src=$(jq -r ".issues[$i].source" "$MANIFEST")
  body=$(cat "$HERE/issues/$(jq -r ".issues[$i].repo" "$MANIFEST")/$(jq -r ".issues[$i].slug" "$MANIFEST").md")
  printf '> **Étiquettes** : %s\n> **Jalon** : %s (échéance %s) · **Coût estimé (h)** : %s — %s · **Hôte** : %s\n> **Source** : %s\n\n%s\n' \
    "$labels" "$milestone" "$due" "$cost" "$note" "$host" "$src" "$body"
}

step_issues() {
  log "== Issues"
  [[ -f "$CREATED" ]] || echo '[]' > "$CREATED"
  local n; n=$(jq '.issues | length' "$MANIFEST")
  declare -A EXISTING
  for repo in $REPOS; do
    EXISTING[$repo]=$(gh issue list -R "$ORG/$repo" --state all --limit 1000 --json number,title,url,labels,milestone)
  done
  for ((i=0; i<n; i++)); do
    local repo slug title labels_csv milestone found url num
    repo=$(jq -r ".issues[$i].repo" "$MANIFEST")
    [[ " $REPOS " == *" $repo "* ]] || continue
    slug=$(jq -r ".issues[$i].slug" "$MANIFEST")
    title=$(jq -r ".issues[$i].title" "$MANIFEST")
    milestone=$(jq -r ".issues[$i].milestone" "$MANIFEST")
    labels_csv=$(jq -r --argjson i "$i" '.issues[$i] | [.phase, .type] + .axes + [.host, "a-valider-pi"] | join(",")' "$MANIFEST")
    found=$(jq -r --arg t "$title" '[.[] | select(.title==$t)][0] // empty' <<<"${EXISTING[$repo]}")
    if [[ -n "$found" ]]; then
      url=$(jq -r .url <<<"$found"); num=$(jq -r .number <<<"$found")
      log "   = $repo#$num existe déjà : $title"
    else
      url=$(compose_body "$i" | gh issue create -R "$ORG/$repo" --title "$title" --label "$labels_csv" --milestone "$milestone" --body-file -) \
        || { log "   ! échec création : $repo / $title"; continue; }
      num="${url##*/}"
      log "   + $repo#$num : $title"
    fi
    # enregistrer (remplace l'entrée du même slug)
    local entry
    entry=$(jq -n --arg repo "$repo" --arg slug "$slug" --argjson number "$num" --arg url "$url" --arg title "$title" \
      --arg labels "$labels_csv" --arg milestone "$milestone" \
      '{repo:$repo, slug:$slug, number:$number, url:$url, title:$title, labels:($labels|split(",")), milestone:$milestone}')
    jq --argjson e "$entry" '[.[] | select(.slug != $e.slug)] + [$e]' "$CREATED" > "$CREATED.tmp" && mv "$CREATED.tmp" "$CREATED"
  done
  log "   → $(jq length "$CREATED") issues enregistrées dans $CREATED"
}

# ---------------------------------------------------------------- étape 4 : projet
gql() { gh api graphql -f query="$1" "${@:2}"; }

ensure_single_select_field() { # $1 = nom, $2 = options séparées par des virgules
  local name="$1" opts="$2" fid
  fid=$(jq -r --arg n "$name" '.fields[] | select(.name==$n) | .id' <<<"$FIELDS")
  if [[ -z "$fid" ]]; then
    gh project field-create "$PNUM" --owner "$ORG" --name "$name" --data-type SINGLE_SELECT --single-select-options "$opts" >/dev/null \
      && log "   + champ « $name »" || log "   ! échec création champ « $name »"
  else
    log "   = champ « $name » présent"
  fi
}

ensure_status_options() {
  # Le champ natif « Status » ne peut pas être renommé ; on remplace ses options
  # (Todo / In Progress / Done) par celles de PROJECT-MANAGEMENT.md §3 via GraphQL.
  local sid existing want
  sid=$(jq -r '.fields[] | select(.name=="Status") | .id' <<<"$FIELDS")
  [[ -n "$sid" ]] || { log "   ! champ Status introuvable"; return 0; }
  existing=$(jq -r '.fields[] | select(.name=="Status") | [.options[].name] | join(",")' <<<"$FIELDS")
  want="À faire,En cours,Bloqué,À valider,Fait"
  if [[ "$existing" == "$want" ]]; then log "   = options Status déjà : $want"; return 0; fi
  local q
  q='mutation($id:ID!){ updateProjectV2Field(input:{fieldId:$id, singleSelectOptions:[
      {name:"À faire",color:GRAY,description:"Pas commencé"},
      {name:"En cours",color:BLUE,description:"Au plus trois à la fois (règle des trois)"},
      {name:"Bloqué",color:RED,description:"Attend une machine, une décision ou une PR"},
      {name:"À valider",color:YELLOW,description:"Travail livré, à relire et valider le lundi"},
      {name:"Fait",color:GREEN,description:"Verdict écrit, issue fermée"}]}){
      projectV2Field{ ... on ProjectV2SingleSelectField { id name options { id name } } } } }'
  if gql "$q" -f id="$sid" >/dev/null 2>"$HERE/.status-error.log"; then
    log "   + options Status remplacées par : $want"
  else
    log "   ! impossible de modifier les options Status (voir .status-error.log) ; création d'un champ « Statut » séparé"
    ensure_single_select_field "Statut" "$want"
  fi
}

ensure_field() { # $1 nom, $2 type (NUMBER|DATE)
  local fid; fid=$(jq -r --arg n "$1" '.fields[] | select(.name==$n) | .id' <<<"$FIELDS")
  if [[ -z "$fid" ]]; then
    gh project field-create "$PNUM" --owner "$ORG" --name "$1" --data-type "$2" >/dev/null && log "   + champ « $1 »" || log "   ! échec champ « $1 »"
  else log "   = champ « $1 » présent"; fi
}

field_id()  { jq -r --arg n "$1" '.fields[] | select(.name==$n) | .id' <<<"$FIELDS"; }
option_id() { jq -r --arg n "$1" --arg o "$2" '.fields[] | select(.name==$n) | .options[] | select(.name==$o) | .id' <<<"$FIELDS"; }

set_single() { # item, champ, option
  local fid oid; fid=$(field_id "$2"); oid=$(option_id "$2" "$3")
  [[ -n "$fid" && -n "$oid" ]] || { log "   ! option « $3 » du champ « $2 » introuvable"; return 0; }
  gh project item-edit --project-id "$PID" --id "$1" --field-id "$fid" --single-select-option-id "$oid" >/dev/null || log "   ! échec $2=$3"
}

step_project() {
  log "== Projet « $PROJECT_TITLE »"
  local plist
  plist=$(gh project list --owner "$ORG" --format json --limit 100)
  PNUM=$(jq -r --arg t "$PROJECT_TITLE" '.projects[] | select(.title==$t) | .number' <<<"$plist" | head -1)
  if [[ -z "$PNUM" ]]; then
    local created; created=$(gh project create --owner "$ORG" --title "$PROJECT_TITLE" --format json)
    PNUM=$(jq -r .number <<<"$created"); log "   + projet créé #$PNUM"
  else
    log "   = projet #$PNUM existant"
  fi
  local pview; pview=$(gh project view "$PNUM" --owner "$ORG" --format json)
  PID=$(jq -r .id <<<"$pview"); PURL=$(jq -r .url <<<"$pview")

  FIELDS=$(gh project field-list "$PNUM" --owner "$ORG" --format json --limit 100)
  ensure_status_options
  FIELDS=$(gh project field-list "$PNUM" --owner "$ORG" --format json --limit 100)
  ensure_single_select_field "Dépôt" ".github,dream-of-kiki,nerve-wml,kiki-flow-research,bouba_sens,baby-brain,micro-kiki"
  ensure_single_select_field "Axe"   "GENIAL,nerve-wml,kiki-flow,bouba_sens,baby-brain,micro-kiki,matière,bio,thermo,maths"
  ensure_single_select_field "Type de tâche" "correction,préreg,hypothèse,papier,infra"  # « Type » seul est réservé par GitHub (type d'issue)
  ensure_single_select_field "Phase" "0 Vérité,1 Falsifiable,2 Hypothèses,3 Écrire,2027"
  ensure_single_select_field "Hôte"  "ES,KXKM-CPU,KXKM-GPU,macM1,aucun"
  ensure_field "Coût estimé (h)" NUMBER
  ensure_field "Échéance" DATE
  FIELDS=$(gh project field-list "$PNUM" --owner "$ORG" --format json --limit 100)

  # Statut : champ natif « Status » si ses options ont pu être remplacées, sinon « Statut »
  local status_field="Status"
  [[ -n "$(option_id Status "À faire")" ]] || status_field="Statut"
  local status_default; status_default=$(jq -r '.status_default // "À faire"' "$MANIFEST")

  [[ -f "$CREATED" ]] || { log "   ! $CREATED absent : lancer STEPS=issues d'abord"; return 1; }
  local items; items=$(gh project item-list "$PNUM" --owner "$ORG" --format json --limit 500)
  local n; n=$(jq length "$CREATED")
  declare -A ITEM_IDS
  for ((i=0; i<n; i++)); do
    local url repo slug item_id manifest_entry
    url=$(jq -r ".[$i].url" "$CREATED"); repo=$(jq -r ".[$i].repo" "$CREATED"); slug=$(jq -r ".[$i].slug" "$CREATED")
    item_id=$(jq -r --arg u "$url" '.items[] | select(.content.url==$u) | .id' <<<"$items" | head -1)
    if [[ -z "$item_id" ]]; then
      item_id=$(gh project item-add "$PNUM" --owner "$ORG" --url "$url" --format json | jq -r .id) \
        && log "   + item $repo/$slug" || { log "   ! échec item-add $url"; continue; }
    fi
    ITEM_IDS[$slug]="$item_id"
    manifest_entry=$(jq -c --arg s "$slug" '.issues[] | select(.slug==$s)' "$MANIFEST")
    local phase type axe host cost due
    phase=$(phase_label_to_name "$(jq -r .phase <<<"$manifest_entry")")
    type=$(type_label_to_name "$(jq -r .type <<<"$manifest_entry")")
    axe=$(axe_label_to_name "$(jq -r '.axes[0] // ""' <<<"$manifest_entry")")
    host=$(host_label_to_name "$(jq -r .host <<<"$manifest_entry")")
    cost=$(jq -r '.cost_h' <<<"$manifest_entry")
    due=$(milestone_due_date "$(jq -r .milestone <<<"$manifest_entry")")
    set_single "$item_id" "Dépôt" "$repo"
    set_single "$item_id" "Phase" "$phase"
    set_single "$item_id" "Type de tâche" "$type"
    [[ -n "$axe" ]] && set_single "$item_id" "Axe" "$axe"
    set_single "$item_id" "Hôte" "$host"
    set_single "$item_id" "$status_field" "$status_default"
    [[ "$cost" != "null" ]] && gh project item-edit --project-id "$PID" --id "$item_id" --field-id "$(field_id "Coût estimé (h)")" --number "$cost" >/dev/null
    gh project item-edit --project-id "$PID" --id "$item_id" --field-id "$(field_id "Échéance")" --date "$due" >/dev/null
    log "   ✓ $repo/$slug : Dépôt=$repo Phase=$phase Type=$type Axe=${axe:-—} Hôte=$host Coût=${cost} Échéance=$due Statut=$status_default"
  done

  # project.json
  jq -n --argjson number "$PNUM" --arg id "$PID" --arg url "$PURL" --arg title "$PROJECT_TITLE" --arg status_field "$status_field" \
     --argjson fields "$(jq '[.fields[] | {name, id, type: .type, options: ((.options // []) | map({(.name): .id}) | add // {})}]' <<<"$FIELDS")" \
     --argjson items "$(for k in "${!ITEM_IDS[@]}"; do jq -n --arg k "$k" --arg v "${ITEM_IDS[$k]}" '{($k):$v}'; done | jq -s 'add // {}')" \
     '{title:$title, number:$number, id:$id, url:$url, status_field:$status_field, fields:$fields, items:$items,
       views_note:"Les vues (« Cette semaine », « Par phase », « Par hôte », « Verdicts ») ne sont pas créables par gh ni par l API GraphQL publique : à créer dans l interface (Views → New view → group by Phase / Hôte ; filtre label:verdict:* pour « Verdicts »)."}' \
     > "$PROJECT_JSON"
  log "   → $PROJECT_JSON écrit ; projet : $PURL"
}

has_step labels     && step_labels
has_step milestones && step_milestones
has_step issues     && step_issues
has_step project    && step_project
log "Terminé."
