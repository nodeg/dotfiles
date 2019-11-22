# doms .zshrc for GNU/Linux

# Load 4000 lines of history, but save O(∞)
HISTSIZE=4000
HISTFILE=~/.zsh_history
SAVEHIST=1000000

# Print timing statistics for everything which takes longer than 5 seconds of
# user + system time ('sleep 6' does not work because of 0% user/system time!).
REPORTTIME=5

# Do not save duplicate entries
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt COMPLETE_IN_WORD

# long date format in ls(1)
export TIME_STYLE=long-iso

### aliases ###
alias ..='cd ..'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias mc='mc -b'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias home='cd /home/dom'
alias hgit='cd /home/dom/git'
alias valgrind='colour-valgrind -s --leak-check=full --show-reachable=yes --track-origins=yes'
alias sshu='ssh faui0sr0.cs.fau.de'
alias makec='make clean'

# A nicer ps-output. We need to specify user:12 because otherwise usernames
# such as 'sphinxsearch' or 'libvirt-qemu' are displayed as user IDs. According
# to the procps source, this is specified in The Open Group Base Specifications
# Issue 6 (IEEE Std 1003.1, 2004 Edition).
alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'


### exports ###

# editor
export EDITOR='vim'
export TERM='xterm-256color'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export MAN_POSIXLY_CORRECT=true # nicer manpage handling
# temporary for ft project
export LD_LIBRARY_PATH='/home/dom/git/libeconf/lib/.libs'

# colored less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS=-r
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# for pure prompt to work
export FPATH=$HOME/git/pure:$FPATH

# completion and prompt
autoload -U colors && colors
autoload -U compinit
compinit

# pure prompt
autoload -U promptinit && promptinit
prompt pure
# Share history between zsh sessions (multiple Terminals / Tmux panes etc.)
setopt inc_append_history
setopt share_history



### special functions ###

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

# zsh stuff
source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/git/zsh-autosuggestions/zsh-autosuggestions.zsh
