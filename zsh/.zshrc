# vim: foldmethod=marker
# Oh-My-Zsh {{{1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true" # Use case-sensitive completion
DISABLE_MAGIC_FUNCTIONS=true # Fix slow paste

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aliases
         colored-man-pages
         evalcache
         fast-syntax-highlighting
         fzf
         gh
         git
         ruby
         salt
         sudo
         terraform
         tmux
         zsh-autosuggestions
         zsh-peco-history
)
source $ZSH/oh-my-zsh.sh

# PATH {{{1

# If you come from bash you might have to change your $PATH.
if [[ $(uname) == 'Darwin' ]]; then
    path=(/usr/local/opt/ruby/bin /snap/bin ~/.cargo/bin ~/bin ~/.diff-so-fancy ~/.local/bin /usr/local/sbin /Applications/Visual Studio Code.app/Contents/Resources/app/bin ~/.emacs.d/bin /usr/local/lib/ruby/gems/3.2.0/bin $path)
export JAVA_HOME="$(/usr/libexec/java_home)"
else
   path=(~/snap/bin ~/bin ~/.diff-so-fancy ~/.local/bin /usr/local/sbin ~/.emacs.d/bin $GOPATH/bin ~/.cargo/bin $path)
fi

fpath=(~/git/lab $fpath)

# Ruby
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH {{{1

# Workaround for https://github.com/zsh-users/zsh-completions/issues/603
if [[ -d "${ZSH_CUSTOM}/plugins/zsh-completions/src" ]]; then
  fpath+="${ZSH_CUSTOM}/plugins/zsh-completions/src"
fi

if [[ -n "${HOMEBREW_PREFIX+1}" ]]; then
    fpath+="${HOMEBREW_PREFIX}/share/zsh/site-functions"
fi

autoload -Uz zcalc
zmodload zsh/zprof

# User configuration

# Load 10000000 lines of history, but save O(∞)
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history


# Print timing statistics for everything which takes longer than 5 seconds of
# user + system time ('sleep 6' does not work because of 0% user/system time!).
REPORTTIME=5

# Apply sensisble zsh settings
setopt ALWAYS_TO_END        # full completions move cursor to the end
setopt AUTO_CD              # `dirname` is equivalent to `cd dirname`
setopt AUTO_PARAM_SLASH     # if completed parameter is a directory, add a trailing slash
setopt AUTO_PUSHD           # `cd` pushes directories to the directory stack
setopt CHASE_LINKS          # Resolve symbolic links to their true values when changing directory
setopt COMPLETE_IN_WORD     # complete from the cursor rather than from the end of the word
setopt C_BASES              # print hex/oct numbers as 0xFF/077 instead of 16#FF/8#77
setopt EXTENDED_GLOB        # more powerful globbing
setopt INTERACTIVE_COMMENTS # allow comments in command line
setopt MULTIOS              # allow multiple redirections for the same fd
setopt NO_BG_NICE           # don't nice background jobs
setopt PATH_DIRS            # perform path search even on command names with slashes
setopt correct              # Correct typos

# ignore duplicated commands history list
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt COMPLETE_IN_WORD
# Share history between zsh sessions (multiple terminals/tmux)
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY


# Exports {{{1

export GPG_TTY=$(tty)
export LC_ALL='en_US.UTF-8'
export LC_TIME='de_DE.utf8'
export LANG='en_US.UTF-8'

export MAN_POSIXLY_CORRECT=true # nicer manpage handling
export EDITOR='nvim'
export TERM='xterm-256color'
export PAGER='less'
export MANPAGER='less'
export TERMINAL='kitty'
export BROWSER='google-chrome'
export GOPATH=$HOME/go
#export DISPLAY=:1.0
export LIBVIRT_DEFAULT_URI=qemu:///system
export TIME_STYLE=long-iso # long date format in ls(1)

# wayland compatibility
#export GDK_BACKEND='wayland,x11'
# fix java stuff in swaywm (especially IntelliJ)
#export _JAVA_AWT_WM_NONREPARENTING=1
#export QT_QPA_PLATFORM=wayland-egl
#export CLUTTER_BACKEND=wayland
#export QT_QPA_PLATFORMTHEME="wayland"
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

# Aliases {{{1

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

command -v curlie    &> /dev/null    && alias curl='curlie'
command -v dfrs      &> /dev/null    && alias df='dfrs'
command -v git       &> /dev/null    && alias diff='git diff --no-index'
command -v rmtrash   &> /dev/null    && alias rm='rmtrash -rf'
command -v bat       &> /dev/null    && alias c='bat'                                             || alias c='cat'
command -v fd        &> /dev/null    && alias fd='fd --hidden --follow'                           || alias fd='find . -name'
command -v rg        &> /dev/null    && alias rg='rg --hidden --follow --smart-case 2>/dev/null'  || alias rg='grep --color=auto --exclude-dir=.git -R'
#command -v exa      &> /dev/null    && alias ls='exa --group --git --group-directories-first'    || alias ls='ls --color=auto --group-directories-first -h'
#command -v exa      &> /dev/null    && alias ll='ls -l'                                          || alias ll='ls -l'
#command -v exa      &> /dev/null    && alias la='ll -a'                                          || alias la='ll -A'
#command -v exa      &> /dev/null    && alias lk='ll -s=size'                                     || alias lk='ll -r --sort=size'
#command -v exa      &> /dev/null    && alias lm='ll -s=modified'                                 || alias lm='ll -r --sort=time'
command -v lsd   &> /dev/null        && alias ls='lsd --color auto'                               || alias ls='ls --color=auto -h'
command -v lsd   &> /dev/null        && alias ll='ls -l'                                          || alias ll='ls -l'
command -v lsd   &> /dev/null        && alias la='ll -a'                                          || alias la='ll -A'
command -v lsd   &> /dev/null        && alias lk='ll -s=size'                                     || alias lk='ll -r --sort=size'
command -v lsd   &> /dev/null        && alias lm='ll -s=modified'                                 || alias lm='ll -r --sort=time'
command -v dog   &> /dev/null        && alias d='dog'                                             || alias d='dig +nocmd +multiline +noall +answer'

alias k='k -h'
alias ka='k -ha'
alias ..='cd ..'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
if [[ $(uname) == 'Linux' ]]; then
    alias rm='rm -I --preserve-root'
    alias chown='chown --preserve-root'
    alias chmod='chmod --preserve-root'
    alias chgrp='chgrp --preserve-root'
    alias grep='grep --color=auto'
elif [[ $(uname) == 'Darwin' ]]; then
fi

alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h -d 2'
alias diff='diff --color=auto'
alias lsg='ll | grep' # show me files matching "ls grep"
alias vi='nvim'
alias v='nvim'
alias ip='ip --color=auto'
alias weather='clear && curl wttr.in'
alias ct='cht.sh'

# Homebrew
alias hbrew='cd /usr/local/Homebrew'
alias hbrewk=' cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask'

# git
alias gs='git status'
alias gc='git commit -v --signoff'
alias ga='git add'
alias gca='git commit -v -a --signoff'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log --show-signature'
alias glo='git log --oneline'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gfu='git fetch --all'
alias grb='git rebase --interactive'
alias gr='git remote -v'

# osc
alias os='osc status'
alias ou='osc update'
alias oa='osc add'
alias or='osc rm'
alias oc='osc ci'
alias od='osc diff'
alias ob='osc build --no-init'
alias obc='osc build --clean'
alias iosc="osc -A https://api.suse.de"

# docker
alias dp='docker ps'
alias dpa='docker ps -a'
alias dcp='docker container prune'
alias di='docker image list'
alias dip='docker image prune'
alias dirm='docker image rm'

# terraform
alias tf='terraform'
alias tfi='tf init'
alias tfv='tf validate'
alias tfa='tf apply -parallelism=40'

# zypper
alias z='zypper'
alias zup='sudo zypper dup'
alias zin='sudo zypper install'
alias zs='z search'
alias zps='z ps -s'

## systemctl
alias sys='systemctl'
alias status='sys status'
alias start='sys start'
alias stop='sys stop'
alias restart='sys restart'
alias sen='sys enable'
alias sdis='sys disable'
alias reload='sys daemon-reload'
alias timers='sys list-timers'

# special
alias valgrind='colour-valgrind -s --leak-check=full --show-reachable=yes --track-origins=yes'
#alias mpv='mpv --hwdec=vaapi --hwdec-codecs=all --ytdl-format=bestvideo[height<=?1080]+bestaudio/best'
alias mpv='mpv --hwdec=vaapi --hwdec-codecs=all --ytdl-format=bestvideo+bestaudio/best'
alias emacs='emacs -nw'

# A nicer ps-output. We need to specify user:12 because otherwise usernames
# such as 'sphinxsearch' or 'libvirt-qemu' are displayed as user IDs. According
# to the procps source, this is specified in The Open Group Base Specifications
# Issue 6 (IEEE Std 1003.1, 2004 Edition).
alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'

# Functions {{{1

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

rc() {
    echo "rootconnect to $1"
    ssh root@"$1"
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
