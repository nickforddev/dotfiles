theme() {
  local backend="${2:-wal}"
  local saturation="${3:-1}"
  ~/.dotfiles/configs/pywal/setup.sh $1 $backend $saturation
}

source ~/.config/zsh/scripts/theme/autocomplete.sh
