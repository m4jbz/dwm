#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}


keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

##Wallaper
feh --bg-fill ~/Pictures/Wallpapers/003.png

#Los key bindings
run sxhkd -c ~/.local/suckless/dwm/sxhkdrc &

#starting utility applications at boot time
run xfce4-power-manager &
run nm-applet &
run volumeicon &
run cbatticon &
run setxkbmap &
run dwmblocks &
picom --config $HOME/Documents/Picom/picom.conf &
