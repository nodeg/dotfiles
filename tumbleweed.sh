#!/bin/bash
# WIP

### add repositories

# code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
zypper ar https://packages.microsoft.com/yumrepos/vscode vscode

# Google Chrome
zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
rpm --import https://dl.google.com/linux/linux_signing_key.pub

# Tools for osc
zypper addrepo https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed/openSUSE:Tools.repo

# refresh repositories
zypper ref

### install packages
zypper install \
    code \
    google-chrome-stable \
    chromium \
    docker \
    docker-zsh-completions \
    emacs \
    gdb \
    glibc-debuginfo \
    git \
    git-delta \
    htop \
    keepassxc \
    libreoffice \
    libreoffice-l10n-de \
    libvirt \
    maven \
    myspell-de_DE \
    nodejs \
    opi \
    podman \
    ripgrep \
    rlwrap \
    rpmlint \
    secret-tool \
    ShellCheck \
    spec-cleaner \
    valgrind \
    virt-manager \
    yarn \

### git repositories
git clone https://github.com/tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm
git clone https://github.com/so-fancy/diff-so-fancy.git $HOME/.diff-so-fancy
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

# pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install virtualenv bpytop colour-valgrind pwntools

# docker
gpasswd -a $USER docker

# virt-manager stuff
gpasswd -a $USER libvirtd
systemctl enable libvirtd
systemctl start libvirtd

cat > /etc/polkit-1/rules.d/80-libvirt.rules << EOF
polkit.addRule(function(action, subject) {
    if (action.id == "org.libvirt.unix.manage" && subject.local && subject.active && subject.isInGroup("libvirt")) {
        return polkit.Result.YES;
    }
});
EOF

### yarn/npm files

# Font Awesome
yarn add @fortawesome/fontawesome-free


