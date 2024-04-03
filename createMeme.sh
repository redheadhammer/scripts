#!/bin/bash

# #### DEPENDENCIES #### #
#  ffmpeg                #
#  medianinfo            #
# ###################### #

fileinfo() {
    mediainfo --output=file://$(pwd)/media $1
}

sizeReduce() {
    # redusing constant rate factor to reduce file size
    printf "\n######### SPECIFY A CRF(constant rate factor) VALUE #########\n"

    printf "# Enter crf value(0-51, ideal value 17-26) #\n# NOTE: LOWER VALUE MEANS BETTER QUALITY BUT HIGH SIZE        #\n"

    printf "###############################################################\n"

    mkdir -p outputs

    read CRF
    OUTPUT="$CRF-$1"

    ffmpeg -i $1 -c:v libx265 -c:a copy -filter:v fps=fps=30 -crf $CRF ./outputs/$OUTPUT
    rm -f $1
    exit
}

trim() {
    printf "\n######## START TIME ########\n"
    echo "Enter start time stamp(hh:mm:ss): "
    read START

    echo "End time stamp(hh:mm:ss): "
    read END
    printf "\n############################\n"

    OUTPUT="extracted_$(date +%d-%m-%Y_%X).mkv"
    echo $OUTPUT

    mkdir -p outputs
    ffmpeg -ss $START -to $END -i $FILE -c:v libx265 ./outputs/$OUTPUT 

    printf "\n######## SIZE PROMPT ########\n"
    printf "# Want to reduce size(y/n) #\n"
    read REDUCE
    printf "\n############################\n"

    if [[ $REDUCE == "y" ]]; 
    then
        sizeReduce $OUTPUT
    else
        exit
    fi
}

main() {

    read -e -p "Enter File name: " FILE

    if [[ -f $FILE ]]
    then
        printf "########## FILE INFO ##########\n";
        fileinfo $FILE
        printf "###############################\n\n";
    else
        echo "$FILE doesn't exists. Exiting!! "
        exit
    fi

    printf "1) Reduce Size of the file\n2) Trim the file\n"

    read VAR

    case $VAR in
        1) 
            sizeReduce $FILE
            ;;
        2)
            trim $FILE
            ;;
        *)
            echo "Invalid value"
            ;;
    esac
}

main
