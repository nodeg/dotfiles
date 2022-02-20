# Start up an ssh and gpg agent, but don't try to add any keys. There's no way to prompt from here.
# The shell or some other element of the environment should then prompt once it is capable of accepting input.
# See https://github.com/vilhalmer/System/blob/master/dotfiles/profile#L14

# GPG agent
#eval $(keychain --quiet --agents ssh,gpg --eval --noask --inherit any)

# Configure pinentry to use the correct TTY
export GPG_TTY=$TTY
gpg-connect-agent updatestartuptty /bye >/dev/null
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
