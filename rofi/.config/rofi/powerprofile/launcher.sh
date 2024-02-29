#! /usr/bin/bash

performance=" Performance"
balanced=" Balanced"
powersave=" Powersave"

function get_entries {
  echo "${performance}\n${balanced}\n${powersave}"
}

function run_rofi {
  echo -en "$@" | rofi -dmenu -no-custom -theme $HOME/.config/rofi/powerprofile/powerprofile.rasi 
}

function set_governor {
  sudo cpupower frequency-set -g "$1"
}

selection=$(run_rofi $(get_entries));

case "$selection" in
  "$performance")
    set_governor performance;
    ;;
  "$balanced")
    set_governor ondemand;
    ;;
  "$powersave")
    set_governor powersave;
    ;;
esac
