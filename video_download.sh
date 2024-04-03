#!/bin/bash
#
# As name suggest this was created to download video files from internet long back in time.
# Feels like it is another script which is not complete as it isn't using ffmpeg and it is in requirement  
#
# ######################## #
#                          #
# requires yt-dlp, ffmpeg  #
#                          #
# ######################## #

read -e -p "Enter file path with name: " OUTPUT

echo "Enter URL: "
read URL

# --sponsorblock-remove all
# --sponsorblock-mark all
# -u username -p password
# --geo-bypass

META="bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/bestaudio+bestvideo"
USERNAME="bhavuksharma2202@gmail.com"
POSSWORD="Learn@364"

yt-dlp -o "$OUTPUT" -f $META -u $USERNAME -p $PASSWORD --write-subs --merge-output-format mkv $URL

# Download only a part of the video

# yt-dlp -o "$OUTPUT" -f "$META" --downloader ffmpeg --downloader-args "ffmpeg_i:-ss $START -to $END"
