#!/bin/bash

DIR="$HOME/.config/nitrogen/walls"
INTERVAL=120
INDEX_FILE="/tmp/count"

IMAGES=("$DIR"/*)


if [ ! -f "$INDEX_FILE" ]
then
    echo "0" > "$INDEX_FILE"
fi

COUNTER=$(cat "$INDEX_FILE")

while true
do 
    current_img="${IMAGES[COUNTER % ${#IMAGES[@]}]}"

    nitrogen --set-zoom-fill "$current_img"

    echo "$(( $(cat /tmp/count) + 1)) > /tmp/count && ~/scripts/autostart/wallpaper.sh"

    sleep "$INTERVAL"
done
