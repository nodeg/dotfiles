# Start up an ssh and gpg agent, but don't try to add any keys. There's no way to prompt from here.
# The shell or some other element of the environment should then prompt once it is capable of accepting input.
# See https://github.com/vilhalmer/System/blob/master/dotfiles/profile#L14
# GPG agent
export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
eval $(keychain --quiet --agents ssh,gpg --eval --noask --inherit any)
export GPG_TTY=`tty`
