#!/bin/bash
# System Update
# ---------------------------
# Snapshot - Rollback - Btrfs
# ---------------------------

MV=/usr/bin/mv
BTRFS=/usr/bin/btrfs
SED=/usr/bin/sed
PACMAN=/usr/bin/pacman
PACAUR=/usr/bin/pacaur
CP=/usr/bin/cp
REFLECTOR=/usr/bin/reflector

# ---------------------------
#      Snapshot System
# ---------------------------

# -------- OLDSTABLE --------

$BTRFS subvolume delete /.snapshots/OLDSTABLE
$MV /.snapshots/STABLE /.snapshots/OLDSTABLE
$SED -i 's/STABLE/OLDSTABLE/g' /.snapshots/OLDSTABLE/etc/fstab
$CP /boot/vmlinuz-linux-stable /boot/vmlinuz-linux-oldstable
$CP /boot/initramfs-linux-stable.img /boot/initramfs-linux-oldstable.img

# --------- STABLE ----------

$BTRFS subvolume snapshot / /.snapshots/STABLE
$SED -i 's/TESTING/STABLE/g' /.snapshots/STABLE/etc/fstab
$CP /boot/vmlinuz-linux /boot/vmlinuz-linux-stable
$CP /boot/initramfs-linux.img /boot/initramfs-linux-stable.img

# ---------------------------
#      Update System
# ---------------------------

$REFLECTOR --verbose -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist
$PACMAN -Syu

# ---------------------------
#    Balance Filesystem
# --------------------------

$BTRFS balance start -dusage=5 /btrfs
