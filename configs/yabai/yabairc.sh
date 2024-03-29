#!/usr/bin/env bash

gap="14"

~/.dotfiles/configs/yabai/scripts/colors.sh

# Uncomment to refresh ubersicht widget on workspace change
# Make sure to replace WIDGET NAME for the name of the ubersicht widget
# ubersicht_spaces_refresh_command="osascript -e 'tell application id \"tracesOf.Uebersicht\" to refresh widget id \"simple-bar-spaces-jsx\"'"

# ===== Loading Scripting Additions ============

# See: https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#macos-big-sur---automatically-load-scripting-addition-on-startup
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa

# ===== Tiling setting =========================

yabai -m config layout                      bsp

yabai -m config external_bar                all:44:0

yabai -m config top_padding                 $gap
yabai -m config bottom_padding              $gap
yabai -m config left_padding                $gap
yabai -m config right_padding               $gap
yabai -m config window_gap                  $gap

yabai -m config mouse_follows_focus         off
yabai -m config focus_follows_mouse         off

yabai -m config window_topmost              off
yabai -m config window_opacity              on
yabai -m config window_shadow               float

yabai -m config active_window_opacity       1.0
yabai -m config normal_window_opacity       0.90
yabai -m config split_ratio                 0.50

yabai -m config auto_balance                on

yabai -m config mouse_modifier              fn
yabai -m config mouse_action1               move
yabai -m config mouse_action2               resize

yabai -m config window_border               on
yabai -m config window_border_width         3
yabai -m config window_border_blur          off

# ===== Rules ==================================

yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
yabai -m rule --add label="Firefox" app="^Firefox$" title="^(Opening|Extension:) (.*)$" manage=off
yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
yabai -m rule --add label="App Store" app="^App Store$" manage=off
yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
yabai -m rule --add label="Archive Utility" app="^Archive Utility$" manage=off
yabai -m rule --add label="Installer" app="^Installer$" manage=off
# yabai -m rule --add label="1Password 7" app="^1Password 7" manage=off
yabai -m rule --add label="Calculator" app="^Calculator$" manage=off
yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
yabai -m rule --add label="Calendar" app="^Calendar$" space=1
yabai -m rule --add app="^Mail$" title="^New Message*" sticky=on
yabai -m rule --add app="^Mail$" title="^Re:*" manage=off
yabai -m rule --add app="^Mail$" title="^Re:*" sticky=on
yabai -m rule --add app="^Mail$" title="^Fwd:*" manage=off
yabai -m rule --add app="^Mail$" title="^Fwd:*" sticky=on
yabai -m rule --add app="^Mail$" space=2
yabai -m rule --add app="^Mail$" title="^General$" manage=off
yabai -m rule --add label="Amazon Chime" app="^Amazon Chime$" title="^Amazon Chime[^\:]$" space=3
yabai -m rule --add label="Amazon Chime Mute box" app="^Amazon Chime$" title="^Mute box$" space=3
yabai -m rule --add label="Amazon Connections" app="^Amazon Connections$" space=3
yabai -m rule --add label="Slack" app="^Slack$" space=4
yabai -m rule --add label="Cisco AnyConnect" app="^Cisco AnyConnect Secure Mobility Client$" manage=off
yabai -m rule --add label="IntelliJ IDEA" app="^IntelliJ IDEA$" title="(Licenses)" manage=off
yabai -m rule --add label="IntelliJ IDEA" app="^IntelliJ IDEA$" title="Rollback Changes" manage=off
yabai -m rule --add label="Übersicht" app="^Übersicht$" title="Preferences" manage=off
yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off

# ===== Signals ================================

yabai -m signal --add event=application_activated app="^Amazon Chime$" action="${HOME}"/.config/skhd/scripts/chime.sh;

# yabai -m signal --add event=application_front_switched action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=display_changed action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=space_changed action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=space_changed action="sketchybar --update"
# # yabai -m signal --add event=window_created action="${ubersicht_spaces_refresh_command}"
# # yabai -m signal --add event=window_destroyed action="${ubersicht_spaces_refresh_command}"
# yabai -m signal --add event=window_focused action="sketchybar --update"
# yabai -m signal --add event=window_title_changed action="sketchybar --update"

# yabai -m signal --add event=window_created action="sketchybar -m --trigger yabai_window &> /dev/null"
# yabai -m signal --add event=window_destroyed action="sketchybar -m --trigger yabai_window &> /dev/null"
# yabai -m signal --add event=window_focused action="sketchybar -m --trigger yabai_window &> /dev/null"
# yabai -m signal --add event=space_changed action="sketchybar -m --trigger yabai_window &> /dev/null"
# yabai -m signal --add event=window_title_changed action="sketchybar -m --trigger yabai_window &> /dev/null"

set +x
printf "yabai: configuration loaded...\\n"
