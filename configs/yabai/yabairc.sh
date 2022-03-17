#!/usr/bin/env bash

set -x

# ====== Variables =============================

declare -A gaps
declare -A color

gaps["top"]="14"
gaps["bottom"]="14"
gaps["left"]="14"
gaps["right"]="14"
gaps["inner"]="14"

color["focused"]="0xE0d97e96"
color["normal"]="0x66010101"
color["preselect"]="0xE050a6a8"
# color["preselect"]="0xE02d74da"

# Uncomment to refresh ubersicht widget on workspace change
# Make sure to replace WIDGET NAME for the name of the ubersicht widget
# ubersicht_spaces_refresh_command="osascript -e 'tell application id \"tracesOf.Uebersicht\" to refresh widget id \"WIDGET NAME\"'"

# ===== Loading Scripting Additions ============

# See: https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#macos-big-sur---automatically-load-scripting-addition-on-startup
sudo yabai --load-sa
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

# ===== Tiling setting =========================

yabai -m config layout                      bsp

yabai -m config top_padding                 "${gaps["top"]}"
yabai -m config bottom_padding              "${gaps["bottom"]}"
yabai -m config left_padding                "${gaps["left"]}"
yabai -m config right_padding               "${gaps["right"]}"
yabai -m config window_gap                  "${gaps["inner"]}"

yabai -m config mouse_follows_focus         off
yabai -m config focus_follows_mouse         off

yabai -m config window_topmost              off
yabai -m config window_opacity              on
yabai -m config window_shadow               float

yabai -m config window_border               on
yabai -m config window_border_width         3
yabai -m config active_window_border_color  "${color["focused"]}"
yabai -m config normal_window_border_color  "${color["normal"]}"
yabai -m config insert_feedback_color       "${color["preselect"]}"

yabai -m config active_window_opacity       1.0
yabai -m config normal_window_opacity       0.90
yabai -m config split_ratio                 0.50

yabai -m config auto_balance                on

yabai -m config mouse_modifier              fn
yabai -m config mouse_action1               move
yabai -m config mouse_action2               resize

# ===== Rules ==================================

yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
yabai -m rule --add label="App Store" app="^App Store$" manage=off
yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
yabai -m rule --add label="1Password 7" app="^1Password 7" manage=off
yabai -m rule --add label="Calculator" app="^Calculator$" manage=off
yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
yabai -m rule --add label="Mail" app="^Slack$" space=1
yabai -m rule --add label="Slack" app="^Slack$" space=2
yabai -m rule --add label="Amazon Chime" app="^Amazon Chime$"  space=3
yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off

# ===== Signals ================================

# yabai -m signal --add event=application_front_switched action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=display_changed action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=space_changed action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=window_created action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=window_destroyed action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=window_focused action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=window_title_changed action="${ubersicht_spaces_refresh_command}"

set +x
printf "yabai: configuration loaded...\\n"
