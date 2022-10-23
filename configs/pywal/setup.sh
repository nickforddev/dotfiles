wal -i ~/.dotfiles/wallpaper/${1} --backend $2 --saturate $3 && \
  pywalfox update && \
  ~/.config/yabai/scripts/colors.sh && \
  ~/.dotfiles/configs/uebersicht/widgets/simple-bar/lib/styles/pywal/pywal-gen.sh && \
  ~/.dotfiles/configs/alfred/alfred-pywal.sh && \
  ([ -e /Applications/IntelliJ\ IDEA.app ] && ~/.dotfiles/configs/jetbrains/intellijPywalGenMac.sh ~/Library/Preferences/IntelliJIdea2019.3) && \
  pkill -USR1 cava || true && \
  ~/.dotfiles/configs/pywal/slack.sh || true && \
  ~/.dotfiles/configs/vis/scripts/pywal.sh || true
