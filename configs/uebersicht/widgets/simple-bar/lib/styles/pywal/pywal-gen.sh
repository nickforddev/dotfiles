#! /usr/bin/env bash

{
  echo -n 'export const variables = '
  cat "$HOME/.cache/wal/colors-speedcrunch.json"
  echo ';'
} > ~/.dotfiles/configs/uebersicht/plugins/simple-bar-jsx/lib/styles/pywal/pywal.js
