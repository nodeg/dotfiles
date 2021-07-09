# see http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path

# PATH
path=(~/bin ~/diff-so-fancy ~/.local/bin /usr/local/sbin ~/.emacs.d/bin $path)

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

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export MAN_POSIXLY_CORRECT=true # nicer manpage handling
export EDITOR='nvim'
export TERM='xterm-256color'
export PAGER='less'

# long date format in ls(1)
export TIME_STYLE=long-iso
