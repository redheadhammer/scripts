pgrep -i brave	--> to list all processes from brave
cat /proc/process_id/comm   --> to get the name of the process using camera
lsmod | grep uvcvideo --> number of processes using camera (uvcvideo is camera here)
fuser /dev/video0   --> will give process id of the camera using package
fuser /dev/snd/pcmC0D0c  --> will give process id of the mic using package
lsof | grep "/dev/video0"  --> for video device in use
lsof | grep "/dev/snd/pcmC0D0c"  --> for audio device in use

