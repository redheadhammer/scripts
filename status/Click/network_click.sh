#!/bin/bash

WNAME=$(iwgetid -r)
WCHANNEL=$(iwgetid -rc)
WFREQUENCY=$(iwgetid -rf | grep -o "[2,5][.][0-9]")
WINTR=$(iwgetid | awk '{print $1}')

if [[ $(iwgetid) ]]; then
	notify-send "$WINTR" " Name:$WNAME\nChannel:$WCHANNEL\nFreq:$WFREQUENCY" --icon $HOME/scripts/status/Click/icons/wifi-connected.png
else
	notify-send "Wifi" " Not Connected" --icon $HOME/scripts/status/Click/icons/no_wifi.png
fi

