#! /usr/bin/env bash
#source ~/scripts/dwm-bar/bar-functions/dwm_backlight.sh
source ~/scripts/dwm-bar/bar-functions/dwm_battery.sh
source ~/scripts/dwm-bar/bar-functions/dwm_date.sh
source ~/scripts/dwm-bar/bar-functions/dwm_alsa.sh 
source ~/scripts/dwm-bar/bar-functions/dwm_resources.sh
#source ~/scripts/dwm-bar/bar-functions/dwm_weather.sh
source ~/scripts/speed_wlan0.sh

while true
	do
		xsetroot -name "|$(speed_wlan0)|$(dwm_resources)|$(dwm_alsa)|$(dwm_date)|$(dwm_battery)|"
	sleep 0.5 
done
