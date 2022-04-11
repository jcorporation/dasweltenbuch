#!/bin/bash

resize_image() {
    TO_WIDTH="$1"
    RESIZE_FILE="$2"
    [ -s "$RESIZE_FILE" ] || return 1
    #get actual size
    CUR_SIZE=$(identify "$RESIZE_FILE" | cut -d' ' -f3)
    CUR_WIDTH=$(cut -dx -f1 <<< "$CUR_SIZE")
    CUR_HEIGHT=$(cut -dx -f2 <<< "$CUR_SIZE")

    if [ $CUR_WIDTH -gt $TO_WIDTH ]
    then
        echo "Resizing $RESIZE_FILE from $CUR_SIZE to $TO_WIDTH width"
        if convert "$RESIZE_FILE" -resize "$TO_WIDTH" "$RESIZE_FILE.resize"
        then
            mv "$RESIZE_FILE.resize" "$RESIZE_FILE"
        else
            echo "Error resizing $RESIZE_FILE"
            rm -f "$RESIZE_FILE.resize"
            return 1
        fi
        CUR_SIZE=$(identify "$RESIZE_FILE" | cut -d' ' -f3)
        echo "New size is $CUR_SIZE"
    fi
    return 0
}

resize_image $1 $2
