#!/bin/bash
#Dropbox Status outputs
#Dropbox isn't enabled : "Dropbox"
#Dropbox is startin: "Starting..."
#Dropbox is Syncing: "Syncing ..."
#Dropbox is running: "Up to date..."
STATUS="$(echo `dropbox status` | awk '{print $1;}')"
C_status=#fbf1c7
DROPBOX_ICON=""
if [[ $STATUS == *"Dropbox"* ]]; then
  C_status=#ec644b
elif [[ $STATUS == *"Starting"* ]]; then
  #statements
  DROPBOX_ICON=""
elif [[ $STATUS == *"Syncing"* ]]; then
  DROPBOX_ICON=
else
  DROPBOX_ICON=""
fi
echo "%{F$C_status}$DROPBOX_ICON%{-F}"
#echo "%{A:dropbox star:}$DROPBOX_ICON $ICON%{A}"
