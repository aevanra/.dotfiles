#! /bin/bash

blur_opacity=${1:-0.9}

focus_opacity=${2:-1}

class_exemptions_regex="Netflix|YouTube|Twitch|Crunchyroll|Prime Video|Disney\+|Hulu|Dropout|BigQuery|Google Sheets|Jira|Meet|Stack|nvim|DBeaver|Arch|Full Squad|General|God|Call|Pull requests|Akame|htop|NVIDIA|Steam|Huddle|kitty"
app_exemptions_regex="tty"


old=0
old_exempt=0
while [ -n "$SWAYSOCK" ]; do
  new_exempt=0
  data=$(swaymsg -t subscribe '["window"]' | jq -c '{change: .change, id: .container.id, name: .container.name, app_id: .container.app_id}')

  change=$(echo $data | jq '.change')
  name=$(echo $data | jq -r '.name' )
  app_id=$(echo $data | jq -r '.app_id')
  new=$(echo $data | jq '.id')

  [[ $change = '"focus"' ]] || continue

  [[ "$old" != 0 && "$old_exempt" != 1 ]] && swaymsg [con_id="$old"] opacity set "$blur_opacity"

  echo "$app_id" | grep -qE "$app_exemptions_regex" && new_exempt=1
  echo "$name"   | grep -qE "$class_exemptions_regex" && new_exempt=1

  old=$new
  old_exempt=$new_exempt

  swaymsg [con_id = $new] opacity set $focus_opacity
done
