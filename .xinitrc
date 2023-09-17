#!/bin/sh

# Default found in /etc/X11/xinit/xinitrc

# xrdb -merge $sysresources
# xmodmap $sysmodmap


# start some nice programs
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#   [ -x "$f" ] && . "$f"
#  done
#  unset f
# fi

xset r rate 250 30 # ?similar to tty speed
#maybe getting to 100 100

xrdb ~/.Xresources

exec i3
#exec /home/vlad/repos/steveWM/steveWM
