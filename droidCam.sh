#!/bin/bash

# 640×480, 960×720, 1280×720 (720p), 1920×1080 (1080p).

WIDTH=480
HEIGHT=640

# unload the driver
sudo modprobe -r v4l2loopback

# load the driver with new settings
sudo modprobe /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=WIDTH height=HEIGHT
