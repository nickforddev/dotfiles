#/usr/bin/env bash

_theme_completions()
{
  local cur
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}

  if [ "$COMP_CWORD" == "1" ]; then
    COMPREPLY=$(ls ~/.dotfiles/wallpaper)
  fi

  if [ "$COMP_CWORD" == "2" ]; then
    COMPREPLY=($(compgen -W "haishoku colorz wal colorthief" "${COMP_WORDS[COMP_CWORD]}"))
  fi

  if [ "$COMP_CWORD" == "3" ]; then
    COMPREPLY=( $(compgen -W "1.0 0.8 0.6 0.5" -- $cur) )
  fi
}

complete -F _theme_completions theme
