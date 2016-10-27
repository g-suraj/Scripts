#!/bin/bash
#Output Format:  Connected/Disconnected to Home/School
N=7
STATUS="$(echo `nmcli g` | cut -d " " -f $N | sed -e "s/\b\(.\)/\u\1/g")"
echo "  $STATUS"
