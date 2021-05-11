#!/bin/bash

LCR="/"
LCH="/home"

STR=$(df -h $LCR | tail -n 1)
STRUSED=$(echo $STR | awk '{print $3}')
STRTOT=$(echo $STR | awk '{print $2}')
STRPER=$(echo $STR | awk '{print $5}')
		
STRH=$(df -h $LCH | tail -n 1)
STRUSEDH=$(echo $STRH | awk '{print $3}')
STRTOTH=$(echo $STRH | awk '{print $2}')
STRPERH=$(echo $STRH | awk '{print $5}')

notify-send "STORAGE" "Root:$STRUSED/$STRTOT:$STRPER\n Home:$STRUSEDH/$STRTOTH:$STRPERH" --icon $HOME/scripts/status/Click/icons/storage.png



