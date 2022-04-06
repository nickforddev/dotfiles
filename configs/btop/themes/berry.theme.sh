# Bashtop berry theme
# by Nick Ford

# Colors should be in 6 or 2 character hexadecimal or single spaced rgb decimal: "#RRGGBB", "#BW" or "0-255 0-255 0-255"
# example for white: "#FFFFFF", "#ff" or "255 255 255".

# All graphs and meters can be gradients
# For single color graphs leave "mid" and "end" variable empty.
# Use "start" and "end" variables for two color gradient
# Use "start", "mid" and "end" for three color gradient

# Main background, empty for terminal default, need to be empty if you want transparent background
theme[main_bg]=""

# Main text color
theme[main_fg]="#eeeeee"

# Title color for boxes
theme[title]="#eeeeee"

# Higlight color for keyboard shortcuts
theme[hi_fg]="#d97e96"

# Background color of selected items
theme[selected_bg]="#282828"

# Foreground color of selected items
theme[selected_fg]="#d97e96"

# Color of inactive/disabled text
theme[inactive_fg]="#282828"

# Color of text appearing on top of graphs, i.e uptime and current network graph scaling
theme[graph_text]="#585858"

# Misc colors for processes box including mini cpu graphs, details memory graph and details status text
theme[proc_misc]="#98971a"

# Cpu box outline color
theme[cpu_box]="#eeeeee"

# Memory/disks box outline color
theme[mem_box]="#eeeeee"

# Net up/down box outline color
theme[net_box]="#eeeeee"

# Processes box outline color
theme[proc_box]="#eeeeee"

# Box divider line and small boxes line color
theme[div_line]="#eeeeee"

# Temperature graph colors
theme[temp_start]="#458588"
theme[temp_mid]="#d3869b"
theme[temp_end]="#fb4394"

# CPU graph colors
theme[cpu_start]="#50a6a8"
theme[cpu_mid]=""
theme[cpu_end]="5ffdff"

# Mem/Disk free meter
theme[free_start]="#4e5900"
theme[free_mid]=""
theme[free_end]="#98971a"

# Mem/Disk cached meter
theme[cached_start]="#458588"
theme[cached_mid]=""
theme[cached_end]="#83a598"

# Mem/Disk available meter
theme[available_start]="#d79921"
theme[available_mid]=""
theme[available_end]="#fabd2f"

# Mem/Disk used meter
theme[used_start]="#cc241d"
theme[used_mid]=""
theme[used_end]="#fb4934"

# Download graph colors
theme[download_start]="#3d4070"
theme[download_mid]="#6c71c4"
theme[download_end]="#a3a8f7"

# Upload graph colors
theme[upload_start]="#701c45"
theme[upload_mid]="#b16286"
theme[upload_end]="#d3869b"