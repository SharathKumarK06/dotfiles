alias ls="ls -hN --group-directories-first --quoting-style=shell"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto' \
        dir='dir --color=auto' \
        vdir='vdir --color=auto'

    alias grep='grep --color=auto' \
        fgrep='fgrep --color=auto' \
        egrep='egrep --color=auto'

    alias diff='diff --color=auto' \
        ip="ip -color=auto"
fi

alias l='ls -CF' \
    la='ls -A' \
    ll='ls -l'

alias cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vi" \
    bc="bc -ql" \
    rsync="rsync -vrPlu" \
    mkd="mkdir -pv"

alias free='free -h' \
    df='df -h' \
    chmox='chmod +x' \
    temp='cd $(mktemp -d)' \
    clear='printf "\e[H\e[2J"' \
    ka='killall' \
    g='git' \
    e="$EDITOR" \
    v="$EDITOR"

alias note="$EDITOR -n -c ':enew' $NOTES_DIR"
alias todo="$EDITOR $TODO_FILE"
alias bookmark="$EDITOR $BOOKMARK_FILE"

# My aliases
