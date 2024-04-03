#!/bin/bash
                            # ##################### #
                            # # FIGHT FLASH FRAUD # #
                            # ##################### #
                            #                       #
                            # Tool to check Health  #
                            # of a USB Drive        #
                            #                       #
                            # ##################### #
                            #      DEPENDENCIES     #
                            #      f3 (f3write)     #
                            #      f3fix etc.       #
                            # ##################### #


probe_test() {
    OUTPUT="/tmp/usb_probe_result.log"
    printf "\e[31mf3probe version: %s\e[0m\n" "$(f3probe --version)"
    f3probe "$1" | tee $OUTPUT >> /dev/null
}

# f3read not working from sometime now.
read_test() {
    printf "\e[32mf3read version %s\n\e[0m" "$(f3read --version)"
    local START=1
    local OUTPUT="/tmp/usb_read_error.log"
    local MAX_READ_RATE=20M
    echo "End point is: $2"
    # f3read --start-at=$START --end-at=$2 $1 --show-progress=1 | tee $OUTPUT >> /dev/null
    f3read "$1" --show-progress=1

    printf "\e[32mResult of Read test available at %s \e[0m\n" "$OUTPUT"
}

# f3write not working from sometime now.
write_test() {
    local OUTPUT="/tmp/usb_write_error.log"

    local MAX_WRITE_RATE=10M
    # can be used using --max-write-rate=10M
    
    f3write --end-at="$2" "$1" --show-progress=1 2>&1 | tee "$OUTPUT"
}

# This method is not required as f3read/f3write not working anyways
get_mount() {
    MOUNT=$(lsblk "$1" -o MOUNTPOINTS | sed -n '2p')
}

# This function is not required
usb_size() {
    SIZE=$(lsblk "$1" -b -o SIZE | sed -n '2p')
}

run_test() {
    printf "Select the test to run:\n"
    printf "1. badblocks\n2. f3probe\n"

    read -r TEST
    OUTPUT="/tmp/badblocks_error.log"

    if [[ $TEST -eq 1 ]]
    then
        printf "\e[32mStarting badblocks scan\e[0m\n\n"
        badblocks -w -s -o "$OUTPUT" "$1"
    elif [[ $TEST -eq 2 ]]
    then
        probe_test "$1"
    fi
}

main () {
    echo "Select One of the device from below list: "
    lsblk
    printf "\n\n"
    read -p "Enter device path: " DEV

    # Check if device exist or not
    EXIST=$(lsblk "$DEV" >> /dev/null 2>&1 && echo 1 || echo 0)
    if [[ $EXIST -eq 1 ]]
    then
        run_test "$DEV"
    else
        printf "\e[31mDevice \e[1m%s doesn't exist!\e[0m\e[31m Please enter the corrent device name\e[0m\n" "$DEV"
    fi
}

main
