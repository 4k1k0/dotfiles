#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# exec wmaker
# exec icewm
# exec blackbox
# exec fluxbox
# exec openbox-session
# ...or the Window Manager of your choice

#Terminal urxvt
xset +fp /usr/share/fonts/local &
xset +fp /usr/share/fonts/misc &
xrdb -merge ~/.Xresources &
setxkbmap -model pc104 -layout latam -option ctrl:nocaps &
#Terminal urxvt

nitrogen --restore &
volumeicon &
mpd &
xbindkeys &
nm-applet --sm-disable &
exec awesome 

