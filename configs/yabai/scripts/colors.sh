#!/usr/bin/env bash

source ~/.cache/wal/colors.sh # pywal scheme

color_normal=$(echo $background | sed 's/#//')
color_focused=$(echo $color6 | sed 's/#//')
color_preselect=$(echo $color1 | sed 's/#//')

yabai -m config active_window_border_color  "0xff$color_focused"
yabai -m config normal_window_border_color  "0xff$color_normal"
yabai -m config insert_feedback_color       "0xff$color_preselect"
