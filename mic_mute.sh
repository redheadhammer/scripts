#!/bin/bash

amixer set Capture toggle > null

STATUS=$(pacmd list-sources | grep muted | sed -n 2p | awk '{print $2}')

if [[ $STATUS == "yes" ]]
then
    printf "_"
    notify-send "MIC" "MUTED"
else
    printf "."
    notify-send "MIC" "UNMUTED"
fi
