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

xset r rate 200 50
#maybe getting to 100 100

exec i3
#exec /home/vlad/repos/steveWM/steveWM
