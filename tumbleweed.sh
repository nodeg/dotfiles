#!/bin/bash
# WIP

### add repositories

# VS code, MS Teams
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper ar https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper ar https://packages.microsoft.com/yumrepos/ms-teams teams

# Google Chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome

# Tools for osc
sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed/openSUSE:Tools.repo

# Tools for SUMA
sudo zypper addrepo http://download.opensuse.org/repositories/systemsmanagement:/sumaform/openSUSE_Tumbleweed/systemsmanagement:sumaform.repo

# refresh repositories
sudo zypper ref

### install packages
sudo zypper install \
    code \
    chromium \
    google-chrome-stable \
    docker \
    docker-zsh-completions \
    emacs \
    fira-code-fonts \
    gdb \
    glibc-debuginfo \
    git \
    git-delta \
    gnome-keyring \
    htop \
    keepassxc \
    libreoffice \
    libreoffice-l10n-de \
    libvirt \
    maven \
    myspell-de_DE \
    nodejs \
    obs-service-tar \
    onefetch \
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

# SUMA related packages
sudo zypper install --from systemsmanagement_sumaform terraform terraform-provider-libvirt

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
gpasswd -a $USER libvirtd qemu
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

# several gems
gem install colorls

