# see http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path
path=(/snap/bin ~/.cargo/bin ~/bin ~/git/diff-so-fancy ~/.local/bin $path)
fpath=(~/git/lab $fpath)

# Ruby
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Load 8000 lines of history, but save O(∞)
HISTSIZE=8000
HISTFILE=~/.zsh_history
SAVEHIST=1000000

# Print timing statistics for everything which takes longer than 5 seconds of
# user + system time ('sleep 6' does not work because of 0% user/system time!).
REPORTTIME=5

# Do not save duplicate entries
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt COMPLETE_IN_WORD
# Share history between zsh sessions (multiple terminals/tmux)
setopt inc_append_history
setopt share_history

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export MAN_POSIXLY_CORRECT=true # nicer manpage handling
export EDITOR='nvim'
export TERM='xterm-256color'
export PAGER='less'
export MANPAGER='most'
export TERMINAL='kitty'
export BROWSER='firefox'

# long date format in ls(1)
export TIME_STYLE=long-iso
