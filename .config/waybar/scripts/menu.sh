#!/bin/sh

[ ! "$(pgrep eww)" ] && notify-send "eww daemon is not started" && exit

toggled=$(eww windows | grep -E "\*control_center" | cut -c 2-)

if [ "$1" = "--toggle" ]; then
  if [ "$toggled" = "control_center" ]; then
    eww close control_center
  else
    eww open control_center
  fi
fi
