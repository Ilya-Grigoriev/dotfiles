xrandr -s 1920x1080

sh ~/.config/.fehbg &

# exec bspwm
# exec awesome

dwmstatus 2>&1 >/dev/null &
# slstatus &

while true; do
   dwm 2> ~/.dwm.log
done

#exec dwm
