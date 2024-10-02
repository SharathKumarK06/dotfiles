#!/bin/sh

left="$(pactl get-sink-volume 0 | grep "front" | sed "s/Volume:\s*\|,.*//g")"
left=${left%/*}
left=${left#*/}
right="$(pactl get-sink-volume 0 | grep "front" | sed "s/.*,\s*\|\s*$//g")"
right=${right%/*}
right=${right#*/}
delta="5"
min="0"
max="100"

[ "$#" -ne 1 ] && exit 0

[ "$left" != "$right" ] && exit 0

volume="$(echo $left | cut -d'%' -f1)"

case "$1" in
    "inc")
        if [ "$volume" -lt "$max" ]; then
            pactl set-sink-volume 0 "$(( $volume + $delta ))%"
        fi
        ;;
    "dec")
        if [ "$volume" -gt "$min" ]; then
            pactl set-sink-volume 0 "$(( $volume - $delta ))%"
        fi
        ;;
    "mute")
        pactl set-sink-mute 0 toggle
        ;;
    "get")
        if [ "$(pactl get-sink-mute 0)" = "Mute: yes" ]; then
                icon=""
        else
            if [ "$volume" -gt "50" ]; then
                icon=""
            elif [ "$volume" -gt "1" ]; then
                icon=""
            else
                icon=""
            fi
        fi
        printf "$icon  ${volume}%%"
        ;;
    *)
        exit 1
        ;;
esac

