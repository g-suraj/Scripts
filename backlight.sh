#!/bin/bash

# You can call this script like this:
# $./backlight.sh up
# $./backlight.sh down

function get_brightness {
  xbacklight
}

function send_notification {
    brightness=`get_brightness`
    bar=$(seq -s "──" $((${brightness%.*} / 6)) | sed 's/[0-9]//g')
    dunstify -i /usr/share/icons/Numix/48/notifications/notification-display-brightness-full.svg -t 8 -r 2593 -u normal "  $bar"
}

case $1 in
    up)
 # Up the volume (+ 5%)
 xbacklight -inc 10
 send_notification
 ;;
    down)
 xbacklight -dec 10
 send_notification
 ;;
esac
