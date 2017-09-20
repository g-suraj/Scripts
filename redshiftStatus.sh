#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi


function send_status {
  icon=""
  # OPTIONAL: Append ' ${temp}K' after $icon
  if [[ -z $temp ]]; then
      echo "%{F#65737E}$icon"       # Greyed out (not running)
  elif [[ $temp -ge 5000 ]]; then
      echo "%{F#8FA1B3}$icon"       # Blue
  elif [[ $temp -ge 4000 ]]; then
      echo "%{F#EBCB8B}$icon"       # Yellow
  else
      echo "%{F#D08770}$icon"       # Orange
  fi
  exit 0
}

function notify {
  if [[ -z $temp ]]; then
    dunstify -i /usr/share/icons/hicolor/scalable/apps/redshift-status-off.svg "Redshift" "Redshift is not yet enabled"
  else
    dunstify -i /usr/share/icons/hicolor/scalable/apps/redshift-status-on.svg "Redshift" "Redshift running at "${temp}K" "
  fi
  exit 0
}

case $1 in
    status)
 send_status
 ;;
    notif)
  notify
 ;;
esac

