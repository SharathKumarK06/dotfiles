#!/bin/sh

[ "$#" -ne 1 ] && exit 0

delta="300"
max="$(brightnessctl -qe -d "intel_backlight" -c "backlight" max)"
min="300"

current_brightness () {
    brightnessctl -q -d "intel_backlight" -c "backlight" get
}

case "$1" in
    "inc")
        if [ "$(current_brightness)" -lt "$max" ]; then
            brightnessctl -d "intel_backlight" -c "backlight" \
                set "+${delta}"
        fi
        ;;
    "dec")
        if [ "$(current_brightness)" -gt "$min" ]; then
            brightnessctl -d "intel_backlight" -c "backlight" \
                -e set "${delta}-"
        fi
        ;;
    "get")
        brightness_perc="$(brightnessctl -d "intel_backlight" -c "backlight" info | \
            grep "Current brightness" | sed "s/.*(\|).*//g")"
        printf " $brightness_perc%"
        ;;
    "dim")
        brightnessctl -d "intel_backlight" -c "backlight" \
            -e set "${min}"
        ;;
    *)
        exit 1
esac
