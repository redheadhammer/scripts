#!/bin/bash
#! This requires ffmpeg package and mediainfo package.
# This is incomplete

echo "enter file path"
read INPUT

echo "$INPUT"

echo "1) To get file information
2) Convert file from one format to another/ extract audio from video
3) List available codecs or formats
4) set bitrate/qscale/crf
5) Trim a part of the video
"

read VALUE

case $VALUE in
    1)
        mediainfo $INPUT
        # ffprobe -v error -show_format -show_streams $INPUT
        ;;
    2)
        echo "1) To convert file"
        echo "2) extract audio."
        read TEST 
        

        case $TEST
            1) 

                echo "Enter output file name: "
                read OUTPUT

                echo "1) auto select codecs"
                echo "2) specify codecs"
                echo "3) copy codecs"
                
                read FOO

                case $FOO
                    1)
                        ffmpeg -i $INPUT $OUTPUT
                        ;;
                    2) 
                        echo "need to enter codecs manually"
                        ffmpeg -i $INPUT -c:v libx264 -c:a libx264 $OUTPUT
                        ;;
                    3)
                        ffmpeg -i $INPUT -c:v copy -c:a copy $OUTPUT
                        ;;
                    *)
                        echo "UNKNOWN VALUE"
                        ;;
                esac
            2)
            echo "Enter output file name(with codec/format): "
                read OUTPUT

                ffmpeg -i $INPUT $OUTPUT
                ;;
        esac
        ;;
    3)
        echo "List of available codecs"
        ffmpeg -codecs
        echo "List of available formats"
        ffmpeg -formats
        ;;
    4)
        echo "1) bitrate"
        echo "2) crf"
        echo "3) qscale"

        echo "Need some work here all commands are listed below and commented"
        #ffmpeg -i $INPUT -c:v copy -c:a copy -b:v 100K $OUTPUT
        #ffmpeg -i $INPUT -c:v copy -c:a copy -crf 23 $OUTPUT  #(crf 0-51:lower better: ideal (17-26))

        #ffmpeg -i $INPUT -c:v copy -c:a copy -qscale:v 3 $OUTPUT    #(qscale 1-31: lower better: ideal (3-5))

        ;;
    5) 
        echo "This part too need some work: commands listed below and commented"

        # Scale down the video from any value to 854x480
        #ffmpeg -i hd-movie.mkv -c:v libx264 -s:v 854x480 -c:a copy out.mp4 

        # to trim a video of 5:30.500 sec from 00:01:30 
        #ffmpeg -ss 00:01:30 -i input.mov -c:v copy -c:a copy -t 00:05:30.500 output.mov 

        # To trim a video from specific value to another specific value
        #ffmpeg -i input.mp4 -ss 00:00:10 -to 00:5:00 -c:v copy -c:a copy output.mp4
        ;;
    *)
        echo "INVALID SELECTION"
        ;;
esac


# Screen Record with ffmpeg
    # without audio
    # ffmpeg -f x11grab -s 1920x1080 -t 00:00:10 -i $DISPLAY output.mp4

    # with audio
    # ffmpeg -f x11grab -s 1920x1080 -t 00:00:10 -r 32 -f alsa -i $DISPLAY output.mp4

# Screen Shot with ffmpeg
# ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -vframes 1 screen.png

