#!/usr/bin/env bash

meetingWin=$(yabai -m query --windows --space 3 | jq -c '.[] | select( .title | contains("Amazon Chime:")) | .id')

if [[ meetingWin != "" ]]; then
  # echo $meetingWin
  isFullscreen=$(yabai -m query --windows --space 3 | jq -c '.[] | select( .title | contains("Amazon Chime:")) | ."has-fullscreen-zoom"')
  # echo $isFullscreen
  if [[ $isFullscreen != true ]]; then
    yabai -m window --focus meetingWin;
    yabai -m window --toggle zoom-fullscreen;
  fi
fi
