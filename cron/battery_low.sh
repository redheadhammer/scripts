#!/bin/sh

low_battery() {
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)
	
	if [[ $STATUS = Discharging ]]; then
		if [[ $CHARGE -le 15 && $CHARGE -ge 10 ]]; then
			notify-send -u critical -t 10000 "Battery" "Critically low ($CHARGE)"
#			aplay /home/$USER/scripts/sounds/iphone_notification.wav
		elif [[ $CHARGE -lt 10 ]]; then
			notify-send -u critical -t 5000 "Battery($CHARGE)" "Suspending in 60 sec"
#			aplay /home/$USER/scripts/sounds/battery_low_damping.wav
			sleep 56
			CHECK=$(cat /sys/class/power_supply/BAT0/status)
			if [[ "$CHECK" = "Charging" ]]; then
				notify-send -t 5000 "Battery" "$CHECK (Suspend Canceled)"
				exit
			fi
			notify-send -t 5000 "PowerOff" 
			sleep 5
			suspend
			
		fi        
	fi
}

low_battery
