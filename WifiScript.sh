#!/bin/bash
STATUS="$(echo `nmcli g` | cut -d " " -f 7 | sed -e "s/\b\(.\)/\u\1/g")"
if [[ $STATUS == *"Connected"* ]]; then
  STATUS="$(echo `nmcli d` | cut -d " " -f 8)"
  if [[ $STATUS == *"Imperial-WPA"*  ]]; 
  then
    STATUS=Imperial
  else
    STATUS=Home
  fi
fi
echo "  $STATUS"
