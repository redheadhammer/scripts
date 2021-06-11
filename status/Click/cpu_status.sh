#!/bin/bash

#monitor -n 2 sensors   

cpu_rpm=$(sensors | grep cpu_fan | awk '{print $2 " " $3}')
temp=$(sensors | grep -E 'Core 0|Core 1|Core 2|Core 3'|awk '{print $1" "$2" "$3" "$4}')

notify-send --icon $HOME/scripts/status/Click/icons/cpu.png "CPU" "$temp\n\nFan RPM: $cpu_rpm"

