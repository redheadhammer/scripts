#!/bin/bash
if xinput list-props 'ELAN1300:00 04F3:3057 Touchpad' | grep "Device Enabled (...):.*1" >/dev/null
then
  xinput disable 'ELAN1300:00 04F3:3057 Touchpad'
  notify-send "TOUCHPAD" "  DISABLED"
else
  xinput enable 'ELAN1300:00 04F3:3057 Touchpad'
  notify-send "TOUCHPAD" "  ENABLED"
fi
