#!/bin/bash
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
DISPLAY=":0"
XAUTHORITY=/home/bhavuksharma2202/.Xauthority

sudo -E -u bhavuksharma2202 /usr/bin/aplay /home/bhavuksharma2202/scripts/sounds/charging_activated.wav >& /dev/null
echo $(date "+%H:%M:%S") : executed charge >> /tmp/charge.log
