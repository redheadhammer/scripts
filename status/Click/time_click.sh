#!/bin/bash

DATE=$(date "+%A %b %d %Y %Uth Week")
notify-send "$(echo $DATE)" --icon $HOME/scripts/status/Click/icons/clock.jpg
