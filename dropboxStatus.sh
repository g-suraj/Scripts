#!/bin/bash
#Dropbox Status outputs
#Dropbox isn't enabled : "Dropbox"
#Dropbox is startin: "Starting..."
#Dropbox is Syncing: "Syncing ..."
#Dropbox is running: "Up to date..."
STATUS="$(echo `dropbox status` | awk '{print $1;}')"
I=1
if [[ $STATUS == *"Dropbox"* ]]; then
  I=1
elif [[ $STATUS == *"Starting"* ]]; then
  #statements
  I=1
elif [[ $STATUS == *"Syncing"* ]]; then
  #statements
  I=1
else
  I=1
fi
echo " $ICON"
