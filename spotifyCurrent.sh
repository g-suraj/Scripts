#!/bin/env bash
player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
  artist=$(playerctl metadata artist | awk -v len=15 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')
  song_title=$(playerctl metadata title | awk -v len=20 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')
    if [[ $player_status == "Playing" ]]; then
      metadata="$song_title by $artist"
      controls="%{A1:playerctl play-pause:} %{A}"
    else
      metadata="$song_title by $artist"
      controls="%{A1:playerctl play-pause:} %{A}"
    fi
fi
printf "%-5s%-35s" "$controls " "$metadata"
exit 0
