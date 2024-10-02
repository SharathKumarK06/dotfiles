#!/bin/bash

touchpad_id="$(xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | \
    grep -Eo '[0-9]{1,2}')"
touchpad_state="$(xinput list-props $touchpad_id | grep 'Device Enabled' | \
    awk '{print $4}')"

if [ $touchpad_state -eq 1 ]; then
    # echo "Touchpad disabled."
    xinput disable $touchpad_id
    notify-send -a 'Touchpad' 'Disabled'
else
    # echo "Touchpad enabled."
    xinput enable $touchpad_id
    notify-send -a 'Touchpad' 'Enabled'
fi
