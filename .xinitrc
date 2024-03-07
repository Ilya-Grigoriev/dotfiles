#!/bin/sh
xrandr -s 1920x1080

bash ~/.local/share/scripts/set_brightness

setxkbmap -option caps:ctrl_modifier

copyq &

sh ~/.config/.fehbg &

# exec bspwm
# exec awesome

dwmstatus 2>&1 >/dev/null &

while true; do
    dwm 2> ~/.dwm.log
done

#exec dwm
