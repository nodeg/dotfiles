#!/bin/bash

export AURBUILD_ASDEPS=""
function aur-build(){

    if ! [ "${1%-git}" = "$1" ] ; then
        local CLEAN=""
    else
        local CLEAN="-c"
    fi
    mkdir -p "$HOME/tmp.aur/" &&
    cd "$HOME/tmp.aur/" &&
    wget http://aur.archlinux.org/packages/$1/$1.tar.gz -O $1.tar.gz &&
    tar -xvf $1.tar.gz && cd $1 &&
    (
        [ -f PKGBUILD ] && vim PKGBUILD
        source PKGBUILD
        [ -f "$install" ] && vim "$install"
        echo "Überprüfe Abhängigkeiten..."
        missing=$(pacman -T ${depends[@]} ${makedepends[@]}|sort|uniq)
        missingrepo=""
        missingaur=""
        echo "Noch zu installieren: $missing"
        for i in $missing ; do
            if pacman -Siq $i > /dev/null ; then
                # wenn in repos, dann installierbar
                missingrepo="$missingrepo $i"
            else
                # otherwise: aur
                missingaur="$missingaur $i"
            fi
        done
        echo "Davon installierbar: $missingrepo"
        echo "Davon aus dem aur: $missingaur"
        ! [ -z "$missingrepo" ] &&
        echo -n "Pakete aus Repo für $1 installieren: " &&
        su -c "pacman --asdeps -S $(echo $missing)"
        ! [ -z "$missingaur" ] &&
        echo -n "Pakete aus dem AUR für $1 installieren: " &&
        for i in $missingaur ; do
            export AURBUILD_ASDEPS="--asdeps"
            aur-build $i
        done
        echo -n "Mit makepkg für $1 fortfahren? [J/n] "
        read -n 1 answer
        echo
        if [ "$answer" = "J" -o "$answer" = "j" \
             -o "$answer" = "" ] ; then
            exit 0 # return success
        else
            exit 1 # return error
        fi
    ) &&
    makepkg $CLEAN -f &&
    echo  "pacman -U --noconfirm $AURBUILD_ASDEPS $(ls -t *.pkg.tar.xz|head -1)" &&
    su -c "pacman -U --noconfirm $AURBUILD_ASDEPS ""$(ls -t *.pkg.tar.xz|head -1)"
}
