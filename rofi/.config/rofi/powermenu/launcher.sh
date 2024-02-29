#! /bin/bash

shutdown="󰐥";
sleep="󰤄";
restart="󰜉";
hibernate="󰜗";
uptime=$(uptime -p | sed 's/up //');

function get_entries {
  echo "${shutdown}\n${sleep}\n${restart}\n${hibernate}\n"
}

function run_rofi {
 echo -en "$@" | rofi -dmenu -no-custom -theme $HOME/.config/rofi/powermenu/powermenu.rasi -p "$uptime"
}

selection=$(run_rofi $(get_entries));

case ${selection} in
  $shutdown)
    systemctl poweroff;
    ;;
  $restart)
    systemctl reboot;
    ;;
  $sleep)
    systemctl suspend;
    ;;
  $hibernate)
    systemctl hibernate;
    ;;
  *)
    echo "$selection";
    ;;
esac

