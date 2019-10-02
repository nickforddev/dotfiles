# ==================================================================================================
# Zsh config
# ==================================================================================================

# path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# set name of the theme to load
ZSH_THEME="powerlevel9k/powerlevel9k"

# Power Level 9K settings
# https://github.com/bhilburn/powerlevel9k#available-prompt-segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs virtualenv)

# command auto-correction
ENABLE_CORRECTION="true"

# plugins 
# https://github.com/robbyrussell/oh-my-zsh/wiki/plugins
plugins=(osx sudo brew git github docker virtualenv npm node pip python jsontools)

# user path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# setup zshell
source $ZSH/oh-my-zsh.sh

# zsh rec files alises
alias zrc='vim ~/.zshrc'
alias zrcl='vim ~/.zshrc.local'

# vim rec file aliases
alias vrc='vim ~/.vimrc'
alias vrcl='vim ~/.vimrc.local'
alias vrcb='vim ~/.vimrc.bundles'
alias vrcbl='vim ~/.vimrc.bundles.local'

# get aliases and stuff from local
source ~/.zshrc.local
[[ -L ~/.zshrc.untracked ]] && source ~/.zshrc.untracked

# android sdk
export ANDROID_HOME=/Users/nick/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

unsetopt correct_all
bindkey "^X\x7f" backward-kill-line

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# pip
export PATH=~/Library/Python/3.7/bin:$PATH

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
