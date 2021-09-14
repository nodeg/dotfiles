# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Automaticaly wrap TTY with a transparent tmux ('integrated'), or start a
# full-fledged tmux ('system'), or disable features that require tmux ('no').
zstyle ':z4h:' start-tmux       'no'
# Move prompt to the bottom when zsh starts up so that it's always in the
# same position. Has no effect if start-tmux is 'no'.
zstyle ':z4h:' prompt-at-bottom 'yes'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'pc'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# ssh when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
#zstyle  ':z4h:ssh:*'                  ssh-command kitty +kitten ssh
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over ssh to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.zsh-aliases'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
if [[ $(uname) == 'Darwin' ]]; then
    path=(/usr/local/opt/ruby/bin snap/bin ~/.cargo/bin ~/bin ~/.diff-so-fancy ~/.local/bin /usr/local/sbin /Applications/Visual Studio Code.app/Contents/Resources/app/bin ~/.rvm/bin ~/.emacs.d/bin $path)
else
   path=(~/snap/bin ~/bin ~/.diff-so-fancy ~/.local/bin /usr/local/sbin ~/.rvm/bin ~/.emacs.d/bin $path)
fi

fpath=(~/git/lab $fpath)

# Ruby
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# see http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path

# Load 8000 lines of history, but save O(∞)
HISTSIZE=9000
HISTFILE=~/.zsh_history
SAVEHIST=1000000

# Print timing statistics for everything which takes longer than 5 seconds of
# user + system time ('sleep 6' does not work because of 0% user/system time!).
REPORTTIME=5

# Do not save duplicate entries
setopt HIST_IGNORE_DUPS
setopt COMPLETE_IN_WORD
# Share history between zsh sessions (multiple terminals/tmux)
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export GPG_TTY=$(tty)
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# nicer manpage handling
export MAN_POSIXLY_CORRECT=true
export EDITOR='nvim'
export TERM='xterm-256color'
#export TERM='xterm-kitty'
export PAGER='less'
#export MANPAGER='most'
export TERMINAL='kitty'
export BROWSER='chromium'

# long date format in ls(1)
export TIME_STYLE=long-iso

# wayland compatibility
#enable wayland support in Firefox # NOTE: DISABLE IF BROKEN on Firefox >=73
export GDK_BACKEND='wayland,x11'
# use wayland as default for GDK stuff like LibreOffice. # NOTE: put "GDK_BACKEND=x11" before command if it doesn't run (display error)
export MOZ_ENABLE_WAYLAND=1
# fix java stuff in swaywm (especially IntelliJ)
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland-egl
export CLUTTER_BACKEND=wayland
export QT_QPA_PLATFORMTHEME="wayland"
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

# Source additional local files if they exist.
z4h source ~/.env.zsh
z4h source ~/.zsh-aliases

# Use additional Git repositories pulled in with `z4h install`.
#

# Define key bindings.
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey undo Ctrl+/  # undo the last command line change
z4h bindkey redo Alt+/   # redo the last undone command line change

z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# Check if the .zinit directory exists
if [ ! -d $HOME/.zinit ]; then
    mkdir $HOME/.zinit
    git clone https://github.com/zdharma/zinit.git $HOME/.zinit/bin
fi

# zinit plugin manager and plugins
source ~/.zinit/bin/zinit.zsh

# Allow sourcing this file more than once without producing
# warnings about the plugins being re-loaded.
ZINIT[MUTE_WARNINGS]=1

zplugin light hlissner/zsh-autopair

# Provides the 'wdx' function to set warp points to directories
# and quickly jump to them.
zplugin light raxod502/wdx

