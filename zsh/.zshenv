# see http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path
path=(/usr/local/opt/ruby/bin $HOME/.rvm/bin /snap/bin ~/.cargo/bin ~/bin ~/git/private/diff-so-fancy ~/.local/bin /Applications/Visual Studio Code.app/Contents/Resources/app/bin $path)
fpath=(~/git/lab ~/.local/share/zsh/pure $fpath)


# Ruby
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

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
export MAN_POSIXLY_CORRECT=true # nicer manpage handling
export EDITOR='nvim'
export TERM='xterm-256color'
#export TERM='xterm-kitty'
export PAGER='less'
export MANPAGER='most'
export TERMINAL='kitty'
export BROWSER='firefox'

# long date format in ls(1)
export TIME_STYLE=long-iso

# wayland compatibility
#enable wayland support in Firefox # NOTE: DISABLE IF BROKEN on Firefox >=73
#export GDK_BACKEND='wayland'
# use wayland as default for GDK stuff like LibreOffice. # NOTE: put "GDK_BACKEND=x11" before command if it doesn't run (display error)
#export MOZ_ENABLE_WAYLAND=1
# fix java stuff in swaywm (especially IntelliJ)
#export _JAVA_AWT_WM_NONREPARENTING=1
#export QT_QPA_PLATFORM=wayland-egl
#export CLUTTER_BACKEND=wayland
#export QT_QPA_PLATFORMTHEME="wayland"
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
