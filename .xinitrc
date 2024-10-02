#autostart="dunst dwmblocks picom pulseaudio sxhkd"
autostart="dunst dwmblocks sxhkd"

kill_if_running() {
    progpid=$(pidof -sx "$1")
    [ -n "$progpid" ] && kill $progpid
}

# swap control, caps lock keys
setxkbmap -option "ctrl:swapcaps" -option "altwin:swap_lalt_lwin" &

# set wallpaper
feh --bg-fill --no-fehbg $WALLPAPER_IMAGE &

# set dpi
xrandr --dpi 96

# source xrdb
xrdb $XRESOURCES & xrdbpid="$!"

# audio service
pulseaudio --start -D "true" &

# autostart programs
for program in $autostart; do
    kill_if_running "$program"
    "$program" &
done

# key autorepeat and keypress delay
xset r rate 250 55 &

# turn of bell
xset b off &

# ponter acceleration
xset mouse 2 3 &

# dim screen and lock after idle for a while
xset dpms 600 600 600 &

# autolock after inactivity
xss-lock -q -- slock &

dbus-update-activation-environment --all
eval $(gpg-agent --daemon --enable-ssh-support) &

# wait for xrdb to finish before launching dwm
[ -n "$xrdbpid" ] && wait "$xrdbpid"

dwm
