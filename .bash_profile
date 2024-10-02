# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# startx if the tty is tty1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq "1" ] && ! pidof -s Xorg > /dev/null 2>&1; then
    exec startx $XINITRC
fi

. "/home/sharath/.local/share/cargo/env"
