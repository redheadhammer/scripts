#!/bin/sh

Device_ID=$(kdeconnect-cli --id-only -a)

if [[ $Device_ID == "" ]]
then
    Battery=""
else 
    Battery="($(gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$Device_ID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery charge | grep -o -e "[0-9]*"))"
fi


dwm_battery () {
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
	if [[ $STATUS = "Discharging" ]]; then
			if [[ $CHARGE -lt 16 ]]; then
                printf "⛽$CHARGE$Battery"
				$HOME/scripts/cron/battery_low.sh	
			elif [[ $CHARGE -ge 16 && $CHARGE -lt 44 ]]; then
                printf "  $CHARGE$Battery"
			elif [[ $CHARGE -ge 44 && $CHARGE -lt 66 ]]; then
                printf "  $CHARGE$Battery"
			elif [[ $CHARGE -ge 66 && $CHARGE -lt 90 ]]; then
                printf "  $CHARGE$Battery"
			else 
                printf "  $CHARGE$Battery"
			fi
	else 
			if [[ $CHARGE -ge 90 ]]; then
                printf "  $CHARGE$Battery"
			elif [[ $CHARGE -ge 66 && $CHARGE -lt 90 ]]; then
                printf "  $CHARGE$Battery"
			elif [[ $CHARGE -ge 44 && $CHARGE -lt 66 ]]; then
                printf "  $CHARGE$Battery"
			elif [[ $CHARGE -ge 16 && $CHARGE -lt 44 ]]; then
                printf "  $CHARGE$Battery"
			else
                printf "⛽$CHARGE$Battery"
			fi
	fi
}

dwm_battery


