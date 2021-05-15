#!/bin/bash

HK=$(xinput list | grep 'WMI hotkeys' | awk '{print $5}' | sed s/id=//)
LWK=$(xinput list | grep 'Logitech Wireless Key' | sed -n 2p | awk '{print $6}' | sed s/id=//)
IK=$(xinput list | grep 'Set 2 keyboard' | awk '{print $7}' | sed s/id=//)
LWM=$(xinput list | grep 'Logitech Wireless Mouse' | awk '{print $7}' | sed s/id=//)

echo "Which device you want to toggle:
        HOTKEYS = HK
        Logitech Wireless Keyboard = LWK
        Inbuilt Keyboard = IK
        Logitech Wireless Mouse = LWM
        "
read device
echo "device id is ${!device}"

if xinput list-props ${!device} | grep "Device Enabled (177):.*1" >/dev/null
then
  xinput disable ${!device}
  echo 'device disabled'
else
  xinput enable ${!device}
  echo 'device enabled'
fi



