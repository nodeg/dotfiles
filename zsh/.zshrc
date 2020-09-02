# aliases
if [[ $(uname) == 'Linux' ]]; then
    alias ll='ls -lh --color=auto'
    alias la='ls -lah --color=auto'
elif [[ $(uname) == 'Darwin' ]]; then
    alias ll='ls -lGh'
    alias la='ls -alGh'
fi
alias k='k -h'
alias ka='k -ha'
alias ..='cd ..'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
if [[ $(uname) == 'Linux' ]]; then
    alias rm='rm -I --preserve-root'
fi
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h -d 2'
alias mc='mc -b'
alias diff='diff --color=auto'
alias lsg='ll | grep' # show me files matching "ls grep"
alias vi='nvim'
alias v='nvim'
alias ip='ip --color=auto'
alias weather='clear && curl wttr.in'

# git
alias gs='git status'
alias gc='git commit -v'
alias ga='git add'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
alias gp='git push'
alias gpl='git pull'

# osc
alias os='osc status'
alias ou='osc update'
alias oa='osc add'
alias or='osc rm'
alias oc='osc ci'
alias od='osc diff'
alias ob='osc build --no-init'
alias obc='osc build --clean'

# special
alias valgrind='colour-valgrind -s --leak-check=full --show-reachable=yes --track-origins=yes'
alias faush='ssh faui0sr0.cs.fau.de'
alias mpv='mpv --hwdec=vaapi --hwdec-codecs=all --ytdl-format=bestvideo[height<=?1080]+bestaudio/best'

# A nicer ps-output. We need to specify user:12 because otherwise usernames
# such as 'sphinxsearch' or 'libvirt-qemu' are displayed as user IDs. According
# to the procps source, this is specified in The Open Group Base Specifications
# Issue 6 (IEEE Std 1003.1, 2004 Edition).
alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'

# special functions

# extract any compressed file
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1 ;;
            *.tar.gz)    tar xzf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       rar x $1 ;;
            *.gz)        gunzip $1 ;;
            *.tar)       tar xf $1 ;;
            *.tbz2)      tar xjf $1 ;;
            *.tgz)       tar xzf $1 ;;
            *.zip)       unzip $1 ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1 ;;
            *)           echo "extract() cannot extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# mkdir and cd
mcd() {
    mkdir -p "$@" && cd "$@"
}

# completion and prompt
autoload -U colors && colors
autoload -Uz compinit
compinit
autoload -U promptinit; promptinit
prompt pure
kitty + complete setup zsh | source /dev/stdin

# load zplug
source ~/.zplug/init.zsh

# zplug plugins
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# zsh plugins
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# see https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[reserved-word]='bold,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=bold
