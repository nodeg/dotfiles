#!/bin/bash
# WIP

# add repositories TODO

# refresh repositories
zypper ref


# install packages
zypper install \
    git \
    opi \
    htop \
    ShellCheck \
    libreoffice-l10n-de \
    myspell-de_DE \

# git repositories
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
