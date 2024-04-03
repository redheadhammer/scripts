#!/bin/bash

CURR=`pactl -- get-sink-volume 0 | awk '{print $5}' | grep -o -e "[0-9]*"`

if [[ $CURR -lt 160 ]]; then
    pactl -- set-sink-volume 0 +2%
fi
