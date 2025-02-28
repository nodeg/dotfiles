if status is-interactive

##### environment variables #####

  set -x -g TERM xterm-256color
  set -x -g PAGER less
  #set -x -g TERM "wezterm"
  set -x -g LC_ALL en_US.UTF-8
  set -x -g LANG en_US.UTF-8
  set -x -g LC_TIME de_DE.utf8
  set -x -g PATH ~/go/bin $PATH
  set -x -g PATH /usr/local/lib/ruby/gems/3.4.0/bin $PATH
  set -x -g PATH ~/.cargo/bin $PATH
  set -x -g PATH ~/bin ~/.local/bin $PATH
  set -x -g BAT_THEME Dracula

  fish_config theme choose "dracula"

  ##### aliases #####
  command -v curlie    &> /dev/null    && alias curl='curlie'
  command -v dfrs      &> /dev/null    && alias df='dfrs'
  command -v git       &> /dev/null    && alias diff='git diff --no-index'
  command -v bat       &> /dev/null    && alias c='bat'                                              || alias c='cat'
  command -v fd        &> /dev/null    && alias fd='fd --hidden --follow'                            || alias fd='find . -name'
  command -v rg        &> /dev/null    && alias rg='rg --hidden --follow --smart-case 2>/dev/null'   || alias rg='grep --color=auto --exclude-dir=.git -R'
  command -v lsd       &> /dev/null    && alias ls='lsd'                                             || alias ls='ls --color=auto --group-directories-first -h'
  command -v lsd       &> /dev/null    && alias ll='ls -l'                                           || alias ll='ls -l'
  command -v lsd       &> /dev/null    && alias la='ll -a'                                           || alias la='ll -A'
  command -v lsd       &> /dev/null    && alias lk='ll -s=size'                                      || alias lk='ll -r --sort=size'
  command -v lsd       &> /dev/null    && alias lm='ll -s=modified'                                  || alias lm='ll -r --sort=time'
  command -v dog       &> /dev/null    && alias d='dog'                                              || alias d='dig +nocmd +multiline +noall +answer'

  alias cp='cp -i'
  alias mv='mv -i'
  alias ln='ln -i'
  alias chown='chown --preserve-root'
  alias chmod='chmod --preserve-root'
  alias chgrp='chgrp --preserve-root'
  alias rm='rm -I'
  alias chown='chown'
  alias chmod='chmod'
  alias chgrp='chgrp'
  alias grep='grep --color=auto'
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
  alias gpf='git push --force-with-lease'
  alias gpl='git pull'
  alias gf='git fetch'
  alias gfu='git fetch --all'
  alias grb='git rebase --interactive'
  alias gr='git remote -v'

  # osc
  alias os='osc status'
  alias ou='osc update'
  alias oa='osc add'
  alias osr='osc rm'
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
  alias sstatus='sys status'
  alias start='sys start'
  alias stop='sys stop'
  alias restart='sys restart'
  alias sen='sys enable'
  alias sdis='sys disable'
  alias reload='sys daemon-reload'
  alias timers='sys list-timers'

  # special
  alias valgrind='colour-valgrind -s --leak-check=full --show-reachable=yes --track-origins=yes'

  # A nicer ps-output. We need to specify user:12 because otherwise usernames
  # such as 'sphinxsearch' or 'libvirt-qemu' are displayed as user IDs. According
  # to the procps source, this is specified in The Open Group Base Specifications
  # Issue 6 (IEEE Std 1003.1, 2004 Edition).
  alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'

end
##### special functions #####

function rc 
    echo "rootconnect to $argv"
    ssh root@"$argv"
end

function md --wraps mkdir -d "Create a directory and cd into it"
  command mkdir -p $argv
  if test $status = 0
    switch $argv[(count $argv)]
      case '-*'
      case '*'
        cd $argv[(count $argv)]
        return
    end
  end
end

function sudo!!
    eval sudo $history[1]
end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

####### initialization #######

# Zoxide 
zoxide init fish | source
# Starship prompt
starship init fish | source
