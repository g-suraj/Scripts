#!/bin/sh
case $1 in
 period-changed)
  case $3 in
   night)
    dunstify -i /usr/share/icons/hicolor/scalable/apps/redshift-status-on.svg "Redshift" "Night Mode"
    ;;
   daytime)
    dunstify -i /usr/share/icons/hicolor/scalable/apps/redshift-status-on.svg "Redshift" "Day Mode"
    ;;
  transition)
    dunstify -i /usr/share/icons/hicolor/scalable/apps/redshift-status-on.svg "Redshift" "Transitioning"
    ;;
  esac
  ;;
esac

