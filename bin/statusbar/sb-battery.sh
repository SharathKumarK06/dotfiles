#!/bin/sh

battery_path="/sys/class/power_supply"

#print_battery_info () {
#    for b in $battery_path/BAT*; do
#        echo "$b"
#        cat "$battery_path/$b/uevent"
#        echo ""
#    done
#}
#
#case "$BLOCK" in
#    1)
#        info=$(print_battery_info)
#        notify-send " Battery:\n${info}"
#        ;;
#    *)
#        ;;
#esac

for battery in $battery_path/BAT*; do
    case "$(cat "$battery/status" 2>&1)" in
        "Full")
            status=""
            ;;
        "Charging")
            status=""
            ;;
        "Not charging")
            status=""
            ;;
        "Discharging")
            status=""
            ;;
        "Unknown")
            status=""
            ;;
        *)
            exit 0
            ;;
    esac
    
    battery_status="$status $(cat $battery/capacity)%% $battery_status"
done

printf "$battery_status"
