#!/bin/bash

status=$(cat /sys/class/power_supply/AC0/online)

if [[ $status -eq 0 ]]; then 
    su bhavuksharma2202 -c "DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1000/bus\" notify-send \"Power\" \"AC Offline\""
else
    su bhavuksharma2202 -c "DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1000/bus\" notify-send \"Power\" \"AC Online\""
fi
