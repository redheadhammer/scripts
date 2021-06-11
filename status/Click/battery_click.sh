#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT0/status)
COUNT=$(cat /sys/class/power_supply/BAT0/cycle_count)

FULL=$(cat /sys/class/power_supply/BAT0/energy_full)
MANFT=$(cat /sys/class/power_supply/BAT0/energy_full_design)

HEALTH=$((FULL * 100 /MANFT ))

notify-send "($STATUS)" "uptime: $(uptime |awk '{print $3}') ($COUNT cycles)\n HEALTH : $HEALTH%" --icon $HOME/scripts/status/Click/icons/uptime.png

