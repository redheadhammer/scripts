#!/bin/bash

status=$(cat /sys/class/power_supply/AC0/online)

#echo $(date) >> /tmp/attested

#if ! [[ -f /tmp/check ]]; then
#    touch /tmp/check

#else
    if [[ $status -eq 0 ]]; then 
        su bhavuksharma2202 -c "DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1000/bus\" notify-send \"Power\" \"AC Offline\""
#        /usr/bin/sudo -u bhavuksharma2202 /usr/bin/aplay /home/bhavuksharma2202/scripts/sounds/disconnected.wav > /dev/null 2>&1
        rm /tmp/check
    else
        su bhavuksharma2202 -c "DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1000/bus\" notify-send \"Power\" \"AC Online\""
#        /usr/bin/sudo -u bhavuksharma2202 /usr/bin/aplay /home/bhavuksharma2202/scripts/sounds/charging_activated.wav > /dev/null 2>&1
#        rm /tmp/check
    fi

#fi
