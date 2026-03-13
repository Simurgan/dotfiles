#!/usr/bin/env bash

current_session="$(tmux display-message -p '#S')"

# ---------- current session windows (max 4, 4th becomes … if needed) ----------
mapfile -t windows < <(
  tmux list-windows -t "$current_session" -F '#{window_index}|#{window_name}|#{window_active}' 2>/dev/null
)

windows_out=""
windows_count="${#windows[@]}"

for i in "${!windows[@]}"; do
  IFS='|' read -r idx name active <<< "${windows[$i]}"

  if (( windows_count > 4 && i == 3 )); then
    windows_out+="#[fg=#707a8c] …"
    break
  fi

  if [[ "$active" == "1" ]]; then
    windows_out+="#[fg=#1f2430,bg=#59c2ff,bold] ${idx}:${name} #[default]"
  else
    windows_out+="#[fg=#b3b1ad] ${idx}:${name} "
  fi
done

# ---------- other sessions (max 4, 4th becomes … if needed) ----------
mapfile -t sessions < <(
  tmux list-sessions -F '#{session_name}' 2>/dev/null | grep -Fxv "$current_session"
)

sessions_out=""
sessions_count="${#sessions[@]}"

for i in "${!sessions[@]}"; do
  s="${sessions[$i]}"

  if (( sessions_count > 4 && i == 3 )); then
    sessions_out+="#[fg=#707a8c]…"
    break
  fi

  sessions_out+="#[fg=#95e6cb]${s}"
  if (( i < sessions_count - 1 )) && ! (( sessions_count > 4 && i == 2 )); then
    sessions_out+="#[fg=#707a8c] • "
  fi
done

# ---------- battery ----------
battery_out=""

for bat in /sys/class/power_supply/BAT*; do
  if [[ -r "$bat/capacity" ]]; then
    cap="$(cat "$bat/capacity" 2>/dev/null)"
    status="$(cat "$bat/status" 2>/dev/null)"

    icon=""
    if [[ "$cap" -le 80 ]]; then icon=""; fi
    if [[ "$cap" -le 60 ]]; then icon=""; fi
    if [[ "$cap" -le 40 ]]; then icon=""; fi
    if [[ "$cap" -le 20 ]]; then icon=""; fi

    if [[ "$status" == "Charging" ]]; then
      battery_out="#[fg=#aad94c] ${cap}%"
    elif [[ "$cap" -le 20 ]]; then
      battery_out="#[fg=#f28779]${icon} ${cap}%"
    else
      battery_out="#[fg=#ffb454]${icon} ${cap}%"
    fi
    break
  fi
done

if [[ -z "$battery_out" ]]; then
  battery_out="#[fg=#707a8c]battery n/a"
fi

# ---------- date/time ----------
date_out="$(date '+%Y-%m-%d')"
time_out="$(date '+%H:%M')"

# ---------- final line ----------
printf "%s" \
"#[fg=#1f2430,bg=#aad94c,bold]  ${current_session} #[fg=#aad94c,bg=default,nobold] \
#[fg=#95e6cb]${sessions_out} \
#[fg=#707a8c] │ \
${windows_out} \
#[fg=#707a8c] │ \
${battery_out} \
#[fg=#707a8c] │ \
#[fg=#ffd173]${date_out} \
#[fg=#707a8c] │ \
#[fg=#59c2ff]${time_out}"
