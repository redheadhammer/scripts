#!/bin/bash

adb shell input keyevent 26 # power-button

sleep 1

adb shell input swipe 500 2300 500 100 800  # swipe

sleep 2
adb shell input text "1737"

adb shell input keyevent 66 # enter
