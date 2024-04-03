#!/bin/bash
#
# This script will contain various settings for x-11 display
# xrandr can only change gamma settings which looks horible so i need to try something else

RED=1.0
GREEN=1.0
BLUE=1.0

OUTPUT_DISP=''
get_connect_disp() {
    OUTPUT_DISP=$(xrandr --current | grep -w "connected" | awk '{print $1}')
    # one can also use xrandr --listactivemonitors
}

set_display() {
    get_connect_disp

    if [[ ${#OUTPUT_DISP} -gt 0 ]] 
    then
        xrandr --output "$OUTPUT_DISP" --gamma "$RED:$GREEN:$BLUE"
    else
        printf "No connected display was found. Make sure you are using X11 not wayland"
    fi
}

set_display

