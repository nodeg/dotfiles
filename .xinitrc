# run scripts in /etc/X11/xinit/xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
      [ -x "$f" ] && . "$f"
  done
  unset f
fi &


# display dwm status bar
while true; do
	slstatus
	sleep 2
done &



# set wallpaper
feh --bg-fill /home/dom/wallpaper/tree.jpg &



# auto lock after a minute
xautolock -time 1 -locker slock -corners 0-00 &


# modify keyboard layout
#xmodmap ~/.Xmodmap &


#DWM
exec /home/dom/.dwm-start
