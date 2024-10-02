#!/bin/sh

case "$BLOCK" in
    1)
        notify-send " Time:\n\ttime: $(date +%r)\n\ttimezone: %:::z %Z"
        ;;
    *)
        printf ""
        ;;
esac

printf " $(date "+%I:%M %P")"
