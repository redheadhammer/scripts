#!/bin/bash
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
DISPLAY=":0"
XAUTHORITY="/home/bhavuksharma2202/.Xauthority"

su bhavuksharma2202 -c "DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1000/bus\" notify-send \"Disks\" \"New Device Connected\""

