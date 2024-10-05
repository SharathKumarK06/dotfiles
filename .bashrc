# If not running interactively, don't do anything
case $- in
    *i*) ;;
        *) return;;
esac

# environment variables
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"

# add sub directories of ~/.local/bin
if [ -d ~/.local/bin ]; then
    for dir in $(find -L ~/.local/bin -type d 2> /dev/null); do
        PATH="$dir:$PATH"
    done
fi

# rust
source "/home/sharath/.local/share/cargo/env"
# nodejs
PATH="/opt/node-v20.15.0-linux-x64/bin:$PATH"
# java
PATH="/opt/jdk-17.0.11/bin:$PATH"
# go
PATH="/opt/go1.22.5/bin:$PATH"
# cabal haskell
PATH="$HOME/.cabal/bin:$PATH"
# godot
PATH="/opt/Godot_v4.2.2-stable_linux_x86_64:$PATH"

# programs
export EDITOR="vim"
export VISUAL="vim"
export EDITOR_PREFIX="vim"
export BROWSER="qutebrowser"
export IMAGE_VIEWER="nsxiv"
export VIDEO_PLAYER="mpv"
export PDF_VIEWER="zathura"

export DOWNLOADS="$HOME/Downloads"
export DOCUMENTS="HOME/Documents"
export PICTURES="$HOME/Pictures"
export PROJECTS="$HOME/Projects"
export NOTES_DIR="$HOME/Documents/Notes"
export TODO_FILE="$NOTES_DIR/TODO.txt"
export BOOKMARK_FILE="$NOTES_DIR/Bookmarks.txt"

# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$HOME/.local/share:/usr/local/share:/usr/share"
export XDG_STATE_HOME="$HOME/.local/state"

# X11 related
export XINITRC="$HOME/.xinitrc"
export XRESOURCES="$HOME/.Xresources"

# wallpaper image
export WALLPAPER_IMAGE="$PICTURES/Wallpapers/img1.wallspic.com-half_dome-glacier_point-yosemite_valley-mountain-tunnel_view-3840x2400.jpg"

# to remove warning from gvim gtk
export NO_AT_BRIDGE=1

export GTK_THEME="Adwaita:dark"
export QT_STYLE_OVERRIDE="Adwaita-Dark"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
# Have QT use gtk2 theme.
export QT_QPA_PLATFORMTHEME="gtk2"

# bash variables
# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
export HISTSIZE=10000000
export HISTFILESIZE=10000000
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/bash_history"
export HISTIGNORE="rm*: *.*:sudo rm*"

# GnuPG
export GNUPGHOME="${XDG_CONFIG_HOME:-$HOME/.config}/gnupg"
export GPG_TTY=$(tty)

# less options
# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
    export LESSOPEN="| /usr/bin/lesspipe %s";
    export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi
# syntax higlight
export LESS=' -R '
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESSHISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/lesshst"
#export LESS_TERMCAP_mb="$(printf '%b' '\e[1;31m')"
#export LESS_TERMCAP_md="$(printf '%b' '\e[1;36m')"
#export LESS_TERMCAP_me="$(printf '%b' '\e[0m')"
#export LESS_TERMCAP_so="$(printf '%b' '\e[01;44;33m')"
#export LESS_TERMCAP_se="$(printf '%b' '\e[0m')"
#export LESS_TERMCAP_us="$(printf '%b' '\e[1;32m')"
#export LESS_TERMCAP_ue="$(printf '%b' '\e[0m')"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# go variables
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$HOME/.local/bin"
export GOCACHE="$XDG_CACHE_HOME/go/build"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# haskell
export GHCUP_USE_XDG_DIRS="1"

# roswell lisp
export ROSWELL_HOME="$XDG_DATA_HOME/roswell"

# node repl history
export NODE_REPL_HISTORY="${XDG_DATA_HOME:-$HOME/.local/share}/node_repl_history"

# python don't write bytecode (.pyc files)
export PYTHONDONTWRITEBYTECODE=1

# java options
export JAVA_HOME="/opt/jdk-17.0.11"
export JDK_HOME="$JAVA_HOME"
export JRE_HOME="$JAVA_HOME"
export CLASSPATH=".:$JAVA_HOME/lib"
# use UTF-8
export JAVA_TOOL_OPTIONS='-Dfile.encoding="UTF-8"'
# fix for Java applications in dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# stardict sdcv dir
export STARDICT_DATA_DIR="$XDG_DATA_HOME/stardict"
export SDCV_HISTSIZE="5000"
export SDCV_PAGER="less --quit-if-one-screen -RX"

# android sdk variables
# sdk directory
export ANDROID_HOME="/opt/Android_Studio/sdk"
# android user preferences location
export ANDROID_USER_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
# os for sdkmanager
export REPO_OS_OVERRIDE="linux"

# android studio variables
export STUDIO_JDK="$JAVA_HOME"
# studio gradle jdk
export STUDIO_GRADLE_JDK="$JAVA_HOME"
# android emulator
export ANDROID_EMULATOR_HOME="$ANDROID_USER_HOME"
export ANDROID_AVD_HOME="$ANDROID_EMULATOR_HOME/avd"

#export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
#export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
#export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
#export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
#export CARGO_HOME="$XDG_DATA_HOME/cargo"
#export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
#export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
#export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# Mozilla smooth scrolling/touchpads.
#export MOZ_USE_XINPUT2=1

# shell options
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# append to the history file, don't overwrite it
shopt -s histappend
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
shopt -s dotglob
shopt -s extglob

# disable flow control
stty -ixon

# bash prompt and other stuff
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a color prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    [ -n "$debian_chroot" ] &&
        PS1='$debian_chroot\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ ' ||
        PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w \$ '
fi
unset color_prompt


# Alias definitions.
if [ -r ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

