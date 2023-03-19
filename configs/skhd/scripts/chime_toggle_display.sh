#!/usr/bin/env bash

# toggles chime meeting window between space 3 and the first space on display 2

muteBoxWinId=$(yabai -m query --windows | jq -c '.[] | select( .title | contains("Mute box")) | .id')
muteBoxDisplay=$(yabai -m query --windows | jq -c '.[] | select( .title | contains("Mute box")) | .display')
meetingWinId=$(yabai -m query --windows | jq -c '.[] | select( .title | contains("Amazon Chime:")) | .id')
meetingWinDisplay=$(yabai -m query --windows | jq -c '.[] | select( .title | contains("Amazon Chime:")) | .display')

# echo "muteBoxWinId: $muteBoxWinId, muteBoxDisplay: $muteBoxDisplay, meetingWinId: $meetingWinId, meetingWinDisplay: $meetingWinDisplay"

if [[ $meetingWinDisplay -eq 1 ]]; then
  targetWinDisplay=2;
  targetMuteBoxDisplay=2;
else
  targetWinDisplay=1;
  targetMuteBoxDisplay=1;
fi

if [[ $targetWinDisplay -eq 1 ]]; then
  targetSpaceId=3
else
  targetSpaceId=$(yabai -m query --spaces --display 2 | jq '.[] | .index')
fi

# echo "targetWinDisplay: $targetWinDisplay"
# echo "targetSpaceId: $targetSpaceId"

if [[ $muteBoxWinId ]]; then
  yabai -m window --focus $muteBoxWinId
  yabai -m window --space $targetSpaceId
fi

if [[ $meetingWinId ]]; then
  yabai -m display --focus $meetingWinDisplay
  yabai -m window --display $targetWinDisplay
  yabai -m display --focus $targetWinDisplay
  yabai -m window --focus $meetingWinId
  yabai -m window --space $targetSpaceId
  yabai -m space --focus $targetSpaceId
fi

sleep 0.4

~/.config/skhd/scripts/fix_border.sh
