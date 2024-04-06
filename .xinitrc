#!/bin/sh
xrandr -s 1920x1080

amixer set Master unmute
amixer set Headphone unmute
amixer set Speaker unmute
amixer set Capture cap
pulseaudio -k
pulseaudio &

setxkbmap -option caps:ctrl_modifier
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll'

rfkill unblock wifi
ip link set wlan0 up

bash ~/.config/.fehbg

bash ~/.local/bin/auto_brightness

# exec bspwm
# exec awesome

dwmstatus 2>&1 >/dev/null &

while true; do
    dwm 2> ~/.dwm.log
done

#exec dwm
