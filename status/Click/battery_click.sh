#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT0/status)
COUNT=$(cat /sys/class/power_supply/BAT0/cycle_count)
notify-send "($STATUS)" " $(uptime |awk '{print $3}' | sed "s/,/ /") ($COUNT cycles)" --icon $HOME/scripts/status/Click/icons/uptime.png

