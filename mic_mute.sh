#!/bin/bash

amixer set Capture toggle > null

LINE=$(pacmd list-sources | grep -n "* index" | cut -d ":" -f 1)

STATUS=$(pacmd list-sources | sed -n "$LINE,$(($LINE + 20))p" | grep muted | awk '{print $2}')

echo $STATUS
if [[ $STATUS == "yes" ]]
then
    printf "_"
    notify-send "MIC" "MUTED"
else
    printf "."
    notify-send "MIC" "UNMUTED"
fi
