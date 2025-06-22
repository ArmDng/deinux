#!/usr/bin/env bash
swww init &

swww img Wallpaper &

swww img Wallpaper --outputs eDP-1 &

nm-applet --indicator &

waybar &

dunst 
