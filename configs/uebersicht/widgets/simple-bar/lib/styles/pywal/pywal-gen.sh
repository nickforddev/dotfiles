#! /usr/bin/env bash

{
  echo -n 'export const variables = '
  cat "$HOME/.cache/wal/colors-speedcrunch.json"
  echo ';'
} > ~/.dotfiles/configs/uebersicht/widgets/simple-bar/lib/styles/pywal/pywal.js

{
  echo -n 'export const variables = '
  cat "$HOME/.cache/wal/colors.json"
  echo ';'
} > ~/.dotfiles/configs/uebersicht/widgets/simple-bar/lib/styles/pywal/pywal-full.js
