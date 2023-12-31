#!/bin/sh

case $1 in

# Increase volume
    -i)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;

# Decrease volume.
    -d)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
esac
$(~/dwm/scripts/restart_dwmstatus.sh)
