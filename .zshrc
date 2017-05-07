# ~/.zshrc


# editor
export EDITOR="nano"

# aliases
alias ..='cd ..'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias ll='ls -lh'
alias la='ls -lha'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias mc='mc -b'
alias sshu='ssh faui0sr0.cs.fau.de'
alias home='cd /home/dom'
alias gpp='g++ -std=c++11'
alias gcc='gcc -g -std=c99 -pedantic -Wall -Werror -D_XOPEN_SOURCE=700'
alias valgrind='valgrind --leak-check=full --show-reachable=yes --track-origins=yes'


# colors
#BASE16_SHELL="$HOME/.config/base16-shell/base16-bright.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# colored less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS=-r


# completion
autoload -U colors && colors
autoload -U compinit
compinit

#### special functions ####

# colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

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
