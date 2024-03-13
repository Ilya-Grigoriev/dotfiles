#!/bin/sh
xrandr -s 1920x1080


setxkbmap -option caps:ctrl_modifier

sh ~/.config/.fehbg &

bash ~/.local/share/scripts/set_brightness

copyq &

# exec bspwm
# exec awesome

dwmstatus 2>&1 >/dev/null &

while true; do
    dwm 2> ~/.dwm.log
done

#exec dwm
