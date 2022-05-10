wal -i ~/.dotfiles/wallpaper/${1} --backend $2 --saturate $3 && \
  pywalfox update && \
  ~/.config/yabai/scripts/colors.sh && \
  ~/.dotfiles/configs/uebersicht/widgets/simple-bar/lib/styles/pywal/pywal-gen.sh && \
  ~/.dotfiles/configs/jetbrains/intellijPywalGenMac.sh ~/Library/Preferences/IntelliJIdea2019.3 && \
  pkill -USR1 cava && \
  ~/.dotfiles/configs/vis/scripts/pywal.sh || true
