toggle_mic() {
  local current_input=$(SwitchAudioSource -c -t input)
  current_input=${current_input//$'\n'/}
  local volume=$(osascript -e 'set ovol to input volume of (get volume settings)')
  local target_volume=0

  if [ "$volume" = "0" ]; then
    say "Unmute"
    target_volume=100
  else
    say "Mute"
  fi

  # switch to mic
  SwitchAudioSource -s "Built-in Microphone" -t input

  # set volume
  osascript -e "set volume input volume $target_volume"

  # swtich back to current_input
  SwitchAudioSource -s "${current_input}" -t input
}

toggle_mic
