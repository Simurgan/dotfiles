#!/usr/bin/env bash
current_session="$(tmux display-message -p '#S')"

mapfile -t sessions < <(
  tmux list-sessions -F '#{session_name}' 2>/dev/null | grep -Fxv "$current_session"
)

# count="${#sessions[@]}"
out=""
shown=0

for s in "${sessions[@]}"; do
  if (( shown == 2 )); then
    out+=" #[fg=#707a8c]• #[fg=#bfbdb6]..."
    break
  fi

  out+=" #[fg=#707a8c]• #[fg=#bfbdb6]${s}"
  shown=$((shown + 1))
done

# remove trailing bullet if present
# out="${out% #[fg=#707a8c]• }"

printf "%s" "$out"
