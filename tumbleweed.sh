#!/bin/bash

### add repositories

# Tools for osc
sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed/openSUSE:Tools.repo

# Tools for SUMA
sudo zypper addrepo http://download.opensuse.org/repositories/systemsmanagement:/sumaform/openSUSE_Tumbleweed/systemsmanagement:sumaform.repo

# refresh repositories
sudo zypper ref

### install packages
sudo zypper install \
    bat \
    docker \
    docker-zsh-completions \
    emacs \
    fira-code-fonts \
    fish \
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
    lsd \
    mc \
    mpv \
    myspell-de_DE \
    neovim \
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
    starship \
    valgrind \
    virt-manager \
    yarn \
    wezterm \
    zoxide \

# packages via OPI
opi vscode
opi vscodium
opi slack
opi google-chrome

# SUMA related packages
sudo zypper install --from systemsmanagement_sumaform terraform terraform-provider-libvirt

### git repositories
git clone https://github.com/so-fancy/diff-so-fancy.git $HOME/.diff-so-fancy
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

### Python packages
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install virtualenv bpytop colour-valgrind pwntools

### Docker
gpasswd -a $USER docker

### libvirt
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
gem install rubocop
