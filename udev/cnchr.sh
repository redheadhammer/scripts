#!/bin/bash
#export XDG_RUNTIME_DIR=/run/user/1000
#export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
#export DISPLAY=":0"
#export XAUTHORITY=~/.Xauthority

sudo -E -u bhavuksharma2202 /usr/bin/aplay /home/bhavuksharma2202/scripts/sounds/charging_activated.wav >& /dev/null
