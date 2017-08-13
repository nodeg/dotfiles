#!/bin/bash

if [ -z "$1" ] || [ "$1" = h ] ; then
    echo "usage: $0 PKGNAME"
    echo "  Fetches the aur tarball from the ArchLinux User Repository"
    echo "  It also extracts the source tarball"
    exit
fi

echo ""
echo "==> fetching source tarball for $1 from aur"
echo ""

wget -c "http://aur.archlinux.org/packages/dm/$1/$1.tar.gz" && tar -xvf "$1.tar.gz"

echo ""
echo "==> extracted $1. now it can be build."
echo ""

