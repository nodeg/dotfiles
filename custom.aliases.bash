alias ..='cd ..'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias ll='ls -lh --color=auto'
alias la='ls -lha --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias mc='mc -b'
alias sshu='ssh mi94ramy@faui0sr0.cs.fau.de'
alias home='cd /home/dom'
alias gpp='g++ -std=c++11'
alias gcc='gcc -g -std=c99 -pedantic -Wall -Werror -D_XOPEN_SOURCE=700'
alias valgrind='valgrind --leak-check=full --show-reachable=yes --track-origins=yes'

#alias mpv='mpv --hwdec=vaapi --hwdec-codecs=all --ytdl-format=bestvideo[height<=?1080]+bestaudio/best'


function yt() {
    mpv --hwdec=vaapi --hwdec-codecs=all  ytdl://"$@"
}
