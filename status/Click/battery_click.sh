#!/bin/bash
# This will script needs acpi to be installed. 

STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [[ $STATUS == "Not charging" ]]; then
    STATUS="Connected"
fi

COUNT=$(cat /sys/class/power_supply/BAT0/cycle_count)
REMT=$(acpi -b | grep "Battery 0" | awk '{print $5}')
FULL=$(cat /sys/class/power_supply/BAT0/energy_full)
MANFT=$(cat /sys/class/power_supply/BAT0/energy_full_design)

HEALTH=$((FULL * 100 /MANFT ))

notify-send "($STATUS)    Remaining: $REMT" "uptime: $(uptime |awk '{print $3}') ($COUNT cycles)\n HEALTH : $HEALTH%" --icon $HOME/scripts/status/Click/icons/uptime.png

