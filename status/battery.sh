#!/bin/sh

dwm_battery () {
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
	if [[ $STATUS = "Discharging" ]]; then
			if [[ $CHARGE -lt 16 ]]; then
				printf "⛽$CHARGE"
				$HOME/scripts/cron/battery_low.sh	
			elif [[ $CHARGE -ge 16 && $CHARGE -lt 44 ]]; then
				printf " $CHARGE"
			elif [[ $CHARGE -ge 44 && $CHARGE -lt 66 ]]; then
				printf " $CHARGE"
			elif [[ $CHARGE -ge 66 && $CHARGE -lt 90 ]]; then
				printf " $CHARGE"
			else 
				printf " $CHARGE"
			fi
	else 
			if [[ $CHARGE -ge 90 ]]; then
				printf " $CHARGE "
			elif [[ $CHARGE -ge 66 && $CHARGE -lt 90 ]]; then
				printf " $CHARGE "
			elif [[ $CHARGE -ge 44 && $CHARGE -lt 66 ]]; then
				printf " $CHARGE "
			elif [[ $CHARGE -ge 16 && $CHARGE -lt 44 ]]; then
				printf " $CHARGE "
			else
				printf "⛽$CHARGE "
			fi
	fi
}

dwm_battery


