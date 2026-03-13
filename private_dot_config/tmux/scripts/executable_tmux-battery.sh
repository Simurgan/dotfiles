#!/usr/bin/env bash

# Linux
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
            printf "#[fg=#aad94c]%s %s%%" "" "$cap"
        elif [[ "$status" == "Not charging" ]]; then
            printf "#[fg=#ffb454]%s %s%%" "" "$cap"
        elif [[ "$cap" -le 20 ]]; then
            printf "#[fg=#f28779]%s %s%%" "$icon" "$cap"
        else
            printf "#[fg=#ffb454]%s %s%%" "$icon" "$cap"
        fi
        exit 0
    fi
done

# macOS fallback
if command -v pmset >/dev/null 2>&1; then
    info="$(pmset -g batt | grep -Eo '[0-9]+%' | head -n1 | tr -d '%')"
    if [[ -n "$info" ]]; then
        printf "#[fg=#ffb454] %s%%" "$info"
        exit 0
    fi
fi

printf "#[fg=#707a8c]battery n/a"
