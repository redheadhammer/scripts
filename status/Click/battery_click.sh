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

Device_ID=$(kdeconnect-cli --id-only -a)

if [[ $Device_ID == "" ]]
then
    Battery="Not Connected"
else 
    Battery=$(gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$Device_ID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery charge | grep -o -e "[0-9]*")
fi

notify-send "($STATUS)" "Battery(kde):$Battery\n uptime: $(uptime |awk '{print $3}') ($COUNT cycles)\n HEALTH : $HEALTH%" --icon $HOME/scripts/status/Click/icons/uptime.png

