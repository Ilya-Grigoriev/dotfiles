xrandr -s 1920x1080

# if dwm exits 0, restart -- this allows hot reloading of config.h
# while type dwm >/dev/null ; do dwm && continue || break ; done

sh ~/.fehbg &
exec dwm
