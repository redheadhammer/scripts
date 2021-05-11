#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT0/status)
notify-send "UPTIME($STATUS)" " $(uptime |awk '{print $3}' | sed "s/,/ /")(Running)" --icon $HOME/scripts/status/Click/icons/uptime.png

