#!/usr/bin/env bash

# Récupère la liste des sorties audio (sinks)
choices=$(wpctl status | awk '/Sinks:/,/Sources:/' | grep -E '^[[:space:]]+[0-9]+\.' | sed 's/^[[:space:]]*//')

# Quitte si aucune sortie détectée
[ -z "$choices" ] && exit 1

# Menu avec rofi
selection=$(echo "$choices" | rofi -dmenu -p "Sortie audio" -i)

# Quitte si rien sélectionné
[ -z "$selection" ] && exit 0

# Récupère l’ID numérique de la sortie
sink_id=$(echo "$selection" | cut -d. -f1)

# Applique la sortie sélectionnée
wpctl set-default "$sink_id"

# Optionnel : notification
notify-send "Sortie audio changée" "Nouvelle sortie : $selection"
