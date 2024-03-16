#!/bin/sh
xrandr -s 1920x1080

amixer set Capture cap

setxkbmap -option caps:ctrl_modifier

bash ~/.config/.fehbg

bash ~/.local/bin/set_brightness

copyq &

# exec bspwm
# exec awesome

dwmstatus 2>&1 >/dev/null &

while true; do
    dwm 2> ~/.dwm.log
done

#exec dwm
