#!/bin/sh

[ "$#" -ne 1 ] && exit 0

maim_cmd="maim -f png $PICTURES/Screenshots/Screenshot-$(date "+%Y%m%d-%H%M%S%3N").png -u" 

case "$1" in
    "full")
        $maim_cmd
        ;;
    "select")
        $maim_cmd -B -s
        ;;
    "window")
        $maim_cmd -B -i $(xdotool getactivewindow)
        ;;
    *)
        exit 1
esac
