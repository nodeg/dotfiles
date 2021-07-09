#!/bin/bash

# refresh repositories
echo "Refresh zypper repos"
zypper ref

# install packages
echo "Install packages"
zypper install -y \
    git \
    htop \
    ShellCheck \
    neovim \
    vim \
    zsh \
    kitty \
    stow

# clone diff-so-fancy
echo "Clone diff-so-fancy"
git clone https://github.com/so-fancy/diff-so-fancy.git ~/diff-so-fancy

# change shell
echo "Change bash to zsh"
chsh -s /usr/bin/zsh

# install Fira Code fonts
echo "Install fira code"
fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    if [ ! -e "${file_path}" ]; then
        echo "wget -O $file_path $file_url"
        wget -O "${file_path}" "${file_url}"
    else
        echo "Found existing file $file_path"
    fi;
done

echo "fc-cache -f"
fc-cache -f

# stow config files
echo "Stow config files"
cd .. && stow vm

echo "Installation finished!"
