#!/bin/sh

dwm_alsa () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    
	if [ "$STATUS" = "off" ]; then
	            printf " " 
    	else
	        if [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
	            printf " $VOL"
	        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 55 ]; then
	            printf " $VOL"
	        else
	            printf " $VOL"
	        fi
		fi
}

dwm_alsa
