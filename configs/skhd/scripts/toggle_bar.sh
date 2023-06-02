#!/bin/zsh

toggle_bar() {
  local current=$(yabai -m config external_bar | cut -d ":" -f 2)
  if [ "$current" = "0" ]; then
    yabai -m config external_bar all:44:0
    open /Applications/Übersicht.app
  else
    pkill -x "Übersicht";
    yabai -m config external_bar all:0:0
  fi
}

toggle_bar
