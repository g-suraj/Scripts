#!/bin/bash
#Output Format:  Connected/Disconnected to Home/School
N=7
C=#fb4934
STATUS="$(echo `nmcli g` | cut -d " " -f $N | sed -e "s/\b\(.\)/\u\1/g")"
if [[ $STATUS == *"Connected"* ]]; then
  STATUS="$(echo `nmcli d` | cut -d " " -f 8)"
  C=#ebdbb2
  if [[ $STATUS == *"Imperial-WPA"*  ]]; 
  then
    STATUS=Imperial
    #statements
  else
    STATUS=Home
  fi
fi
echo "%{F$C}  $STATUS"
