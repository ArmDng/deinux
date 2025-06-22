#!/usr/bin/env bash

LAYOUT="$HOME/.config/waybar/scripts/wlogout/layout"
STYLE="$HOME/.config/waybar/scripts/wlogout/style.css"

if [[ ! `pidof wlogout` ]]; then
    wlogout --no-span \
        --protocol xdg \
        --layout ${LAYOUT} \
        --css ${STYLE} \
        --buttons-per-row 3 \
        --column-spacing 50 \
        --row-spacing 50 \
        --margin-top 290 \
        --margin-bottom 290 \
        --margin-left 300 \
        --margin-right 300
else
    pkill wlogout
fi
