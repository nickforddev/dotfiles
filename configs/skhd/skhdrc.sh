# opens iTerm2
# alt - return : "${HOME}"/.config/yabai/scripts/open_iterm2.sh

# Show system statistics
# fn + lalt - 1 : "${HOME}"/.config/yabai/scripts/show_cpu.sh
# fn + lalt - 2 : "${HOME}"/.config/yabai/scripts/show_mem.sh
# fn + lalt - 3 : "${HOME}"/.config/yabai/scripts/show_bat.sh
# fn + lalt - 4 : "${HOME}"/.config/yabai/scripts/show_disk.sh
# fn + lalt - 5 : "${HOME}"/.config/yabai/scripts/show_song.sh

# space_1='Calendar';

# Navigation
ctrl + alt + cmd - left : yabai -m window --focus west    # h
ctrl + alt + cmd - down : yabai -m window --focus south   # j
ctrl + alt + cmd - up : yabai -m window --focus north     # k
ctrl + alt + cmd - right : yabai -m window --focus east   # l

# Spaces
# Navigate
ctrl - left : yabai -m space --focus prev
ctrl - right : yabai -m space --focus next

ctrl - 1 : yabai -m space --focus 1
ctrl - 2 : yabai -m space --focus 2
ctrl - 3 : yabai -m space --focus 3
ctrl - 4 : yabai -m space --focus 4
ctrl - 5 : yabai -m space --focus 5
ctrl - 6 : yabai -m space --focus 6
ctrl - 7 : yabai -m space --focus 7
ctrl - 8 : yabai -m space --focus 8
ctrl - 9 : yabai -m space --focus 9
ctrl - 0 : yabai -m space --focus 10

:: default     : "${HOME}"/.config/skhd/scripts/listen.sh 0
:: listening @ : "${HOME}"/.config/skhd/scripts/listen.sh 1

# Press ctrl - ` and then a number to move a space with index > 10
default < ctrl - 0x32 ; listening

listening < 1 : yabai -m window --space 11; yabai -m space --focus 11; skhd -k 'escape'; "${HOME}"/.config/skhd/scripts/fix_border.sh;
listening < 2 : yabai -m window --space 12; yabai -m space --focus 12; skhd -k 'escape'; "${HOME}"/.config/skhd/scripts/fix_border.sh;
listening < 3 : yabai -m window --space 13; yabai -m space --focus 13; skhd -k 'escape'; "${HOME}"/.config/skhd/scripts/fix_border.sh;
listening < 4 : yabai -m window --space 14; yabai -m space --focus 14; skhd -k 'escape'; "${HOME}"/.config/skhd/scripts/fix_border.sh;
listening < 5 : yabai -m window --space 15; yabai -m space --focus 15; skhd -k 'escape'; "${HOME}"/.config/skhd/scripts/fix_border.sh;
listening < 6 : yabai -m window --space 16; yabai -m space --focus 16; skhd -k 'escape'; "${HOME}"/.config/skhd/scripts/fix_border.sh;

listening < 0x35 ; default

# toggle mic
ctrl + alt + cmd - m : "${HOME}"/.config/skhd/scripts/mic.sh

# toggle bar
ctrl + alt + cmd - b : "${HOME}"/.config/skhd/scripts/toggle_bar.sh

# Create new space
shift + alt - n : yabai -m space --create;\
    id="$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')";\
    yabai -m space --focus $id;

# Create new space and move current window to it
shift + ctrl + alt + cmd - n : yabai -m space --create;\
    id="$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')";\
    yabai -m window --space $id;\
    yabai -m space --focus $id;

# Destroy space
shift + alt - d : id="$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index'-1)";\
    # [ "$id" == -1 ] && id=0;\
    yabai -m space --destroy;\
    yabai -m space --focus $id;

# Moving windows to spaces
shift + ctrl + alt + cmd - left : yabai -m window --space prev; yabai -m space --focus prev; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt + cmd - right : yabai -m window --space next; "${HOME}"/.config/skhd/scripts/fix_border.sh

shift + ctrl + alt - 1 : yabai -m window --space 1; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 2 : yabai -m window --space 2; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 3 : yabai -m window --space 3; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 4 : yabai -m window --space 4; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 5 : yabai -m window --space 5; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 6 : yabai -m window --space 6; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 7 : yabai -m window --space 7; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 8 : yabai -m window --space 8; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 9 : yabai -m window --space 9; "${HOME}"/.config/skhd/scripts/fix_border.sh
shift + ctrl + alt - 0 : yabai -m window --space 10; "${HOME}"/.config/skhd/scripts/fix_border.sh

# Displays
# Focus previous display by arrangement index
shift + alt - w : yabai -m display --focus prev

# Focus next display by arrangement index
shift + alt - e : yabai -m display --focus next

# Moving windows
ctrl + cmd - left : yabai -m window --warp west
ctrl + cmd - down : yabai -m window --warp south
ctrl + cmd - up : yabai -m window --warp north
ctrl + cmd - right : yabai -m window --warp east

# Swap windows
shift + ctrl - left : yabai -m window --swap west
shift + ctrl - down : yabai -m window --swap south
shift + ctrl - up : yabai -m window --swap north
shift + ctrl - right : yabai -m window --swap east

# Move window to next display
shift + ctrl + alt - right : yabai -m window --display next; yabai -m display --focus 2; "${HOME}"/.config/skhd/scripts/fix_border.sh;
shift + ctrl + alt - left : yabai -m window --display prev; yabai -m display --focus 1; "${HOME}"/.config/skhd/scripts/fix_border.sh;

# Fix border
shift + ctrl - b : "${HOME}"/.config/skhd/scripts/fix_border.sh

# Maximize window
ctrl + alt + cmd - f : yabai -m window --toggle zoom-parent
alt - f         : yabai -m window --toggle zoom-fullscreen
shift + alt - f : yabai -m window --toggle native-fullscreen

# Float window to center
shift + alt - t : yabai -m window --toggle float; yabai -m window --grid 4:4:1:1:2:2
# alt - t : yabai -m window --toggle float;

# Toggle split mode
shift + alt - s : yabai -m window --toggle split

# Move focus container to workspace
shift + alt - m : yabai -m window --space last; yabai -m space --focus last
shift + alt - p : yabai -m window --space prev; yabai -m space --focus prev
shift + alt - n : yabai -m window --space next; yabai -m space --focus next
shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2
shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3
shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4
shift + alt - 5 : yabai -m window --space 5; yabai -m space --focus 5
shift + alt - 6 : yabai -m window --space 6; yabai -m space --focus 6
shift + alt - 7 : yabai -m window --space 7; yabai -m space --focus 7
shift + alt - 8 : yabai -m window --space 8; yabai -m space --focus 8
shift + alt - 9 : yabai -m window --space 9; yabai -m space --focus 9
shift + alt - 0 : yabai -m window --space 10; yabai -m space --focus 10

# Resize windows
ctrl + alt - h : yabai -m window --resize left:-50:0; \
                 yabai -m window --resize right:-50:0
ctrl + alt - j : yabai -m window --resize bottom:0:50; \
                 yabai -m window --resize top:0:50
ctrl + alt - k : yabai -m window --resize top:0:-50; \
                 yabai -m window --resize bottom:0:-50
ctrl + alt - l : yabai -m window --resize right:50:0; \
                 yabai -m window --resize left:50:0

# Equalize size of windows
ctrl + alt - e : yabai -m space --balance

# Enable / Disable gaps in current workspace
ctrl + alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

# Rotate windows clockwise and counterclockwise
alt - r         : yabai -m space --rotate 270
shift + alt - r : yabai -m space --rotate 90

# Rotate on X and Y Axis
shift + alt - x : yabai -m space --mirror x-axis
shift + alt - y : yabai -m space --mirror y-axis

# Set insertion point for focused container
shift + ctrl + alt - h : yabai -m window --insert west
shift + ctrl + alt - j : yabai -m window --insert south
shift + ctrl + alt - k : yabai -m window --insert north
shift + ctrl + alt - l : yabai -m window --insert east

# Float / Unfloat window
shift + alt - space : \
    yabai -m window --toggle float; #\
    # yabai -m window --toggle border

# Roggle sticky, float and resize to picture-in-picture size
shift + alt + ctrl - space : yabai -m window --toggle sticky;\
    yabai -m window --grid 5:5:4:0:1:1

# Switch applications

shift + ctrl - 0x29 : open -a /Applications/Visual\ Studio\ Code.app # ;
shift + ctrl - 0x27 : "${HOME}"/.config/skhd/scripts/open_browser.sh # '
shift + ctrl - a : open -a /System/Applications/Calendar.app
shift + ctrl - s : open -a /System/Applications/Mail.app
shift + ctrl - l : open /Applications/iTerm.app
shift + ctrl - k : open /Applications/Slack.app
shift + ctrl - j : open /Applications/Amazon\ Chime.app
shift + ctrl - h : open /Applications/IntelliJ\ IDEA.app

# Like current song

ctrl - f8 : "${HOME}"/.config/skhd/scripts/like_current_song.sh # f4
# ctrl - f4 : say "test"

# toggle chime meeting window between space 3 and first space on display 2
ctrl + alt + cmd - t : "${HOME}"/.config/skhd/scripts/chime_toggle_display.sh

# Restart Yabai
shift + ctrl + alt - r : osascript \
    "display notification \"Restarting Yabai\" with title \"Yabai\""; \
    launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"

