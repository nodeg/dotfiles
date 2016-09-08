

# mount samba share
  sudo mount -t cifs //name/share /mnt -o username=username
  sudo mount -t smbfs //name/share /mnt -o username=username

# test samba configuration
  testparm
  
# Put the drive into idle (low-power) mode, and also set the standby (spindown) timeout for the drive.
  hdparm -S 60 /dev/sdc
