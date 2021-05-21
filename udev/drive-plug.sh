#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export DISPLAY=":0"
export XAUTHORITY=/home/bhavuksharma2202/.Xauthority


su bhavuksharma2202 -c "notify-send \"New device connected\""
su bhavuksharma2202 -c "aplay \"$HOME/scripts/sounds/iphone_notification.wav\""
echo "Working : " $(date "+%I:%M:%S") > /tmp/newone.tmp

