# opens iTerm2
# alt - return : "${HOME}"/.config/yabai/scripts/open_iterm2.sh

# Show system statistics
# fn + lalt - 1 : "${HOME}"/.config/yabai/scripts/show_cpu.sh
# fn + lalt - 2 : "${HOME}"/.config/yabai/scripts/show_mem.sh
# fn + lalt - 3 : "${HOME}"/.config/yabai/scripts/show_bat.sh
# fn + lalt - 4 : "${HOME}"/.config/yabai/scripts/show_disk.sh
# fn + lalt - 5 : "${HOME}"/.config/yabai/scripts/show_song.sh

# Navigation
lctrl + alt - left : yabai -m window --focus west    # h
lctrl + alt - down : yabai -m window --focus south   # j
lctrl + alt - up : yabai -m window --focus north     # k
lctrl + alt - right : yabai -m window --focus east   # l

# Spaces
# Navigate
lctrl - left : yabai -m space --focus prev
lctrl - right : yabai -m space --focus next

# Create/destroy
shift + alt - n : yabai -m space --create;\
    id="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')";\
    yabai -m window --space $id;\
    yabai -m space --focus $id;
shift + alt - d : yabai -m space --destroy

# Moving windows to spaces
shift + ctrl + alt - left : yabai -m window --space prev
shift + ctrl + alt - right : yabai -m window --space next

shift + ctrl + alt - 1 : yabai -m window --space 1
shift + ctrl + alt - 2 : yabai -m window --space 2
shift + ctrl + alt - 3 : yabai -m window --space 3
shift + ctrl + alt - 4 : yabai -m window --space 4
shift + ctrl + alt - 5 : yabai -m window --space 5

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
ctrl + alt + cmd - right : yabai -m window --display next; yabai -m display --focus 2; yabai -m window --toggle border; yabai -m window --toggle border;
ctrl + alt + cmd - left : yabai -m window --display prev; yabai -m display --focus 1; yabai -m window --toggle border; yabai -m window --toggle border;

# Maximize window
lctrl + alt + cmd - up : yabai -m window --toggle zoom-fullscreen

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
shift + alt - 5 : yabai -m window --space 4; yabai -m space --focus 5
shift + alt - 6 : yabai -m window --space 4; yabai -m space --focus 6
shift + alt - 7 : yabai -m window --space 4; yabai -m space --focus 7
shift + alt - 8 : yabai -m window --space 4; yabai -m space --focus 8
shift + alt - 9 : yabai -m window --space 4; yabai -m space --focus 9

# Resize windows
lctrl + alt - h : yabai -m window --resize left:-50:0; \
                  yabai -m window --resize right:-50:0
lctrl + alt - j : yabai -m window --resize bottom:0:50; \
                  yabai -m window --resize top:0:50
lctrl + alt - k : yabai -m window --resize top:0:-50; \
                  yabai -m window --resize bottom:0:-50
lctrl + alt - l : yabai -m window --resize right:50:0; \
                  yabai -m window --resize left:50:0

# Equalize size of windows
lctrl + alt - e : yabai -m space --balance

# Enable / Disable gaps in current workspace
lctrl + alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

# Rotate windows clockwise and counterclockwise
alt - r         : yabai -m space --rotate 270
shift + alt - r : yabai -m space --rotate 90

# Rotate on X and Y Axis
shift + alt - x : yabai -m space --mirror x-axis
shift + alt - y : yabai -m space --mirror y-axis

# Set insertion point for focused container
shift + lctrl + alt - h : yabai -m window --insert west
shift + lctrl + alt - j : yabai -m window --insert south
shift + lctrl + alt - k : yabai -m window --insert north
shift + lctrl + alt - l : yabai -m window --insert east

# Float / Unfloat window
shift + alt - space : \
    yabai -m window --toggle float; #\
    # yabai -m window --toggle border

# Restart Yabai
shift + lctrl + alt - r : \
    /usr/bin/env osascript <<< \
        "display notification \"Restarting Yabai\" with title \"Yabai\""; \
    launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"

# Make window native fullscreen
alt - f         : yabai -m window --toggle zoom-fullscreen
shift + alt - f : yabai -m window --toggle native-fullscreen