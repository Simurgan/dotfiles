#!/usr/bin/env bash

current_session="$(tmux display-message -p '#S')"

mapfile -t windows < <(tmux list-windows -t "$current_session" -F '#{window_index}|#{window_name}|#{window_active}')

count="${#windows[@]}"
limit=4
shown=0
out=""

for w in "${windows[@]}"; do
  IFS='|' read -r idx name active <<< "$w"

  if (( shown == 3 && count > 4 )); then
    out+="#[fg=#707a8c] …"
    break
  fi

  if [[ "$active" == "1" ]]; then
    out+="#[fg=#1f2430,bg=#59c2ff,bold] ${idx}:${name} #[default]"
  else
    out+="#[fg=#b3b1ad,bg=default] ${idx}:${name} "
  fi

  shown=$((shown + 1))
done

printf "%s" "$out"
