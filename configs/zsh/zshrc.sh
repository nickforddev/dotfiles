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
export PATH="/usr/local/opt/ruby/bin:$PATH"

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

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# android sdk
export ANDROID_HOME=/Users/nick/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

[[ -s "$HOME/.rvm/scripts/rvm"  ]] && . "$HOME/.rvm/scripts/rvm"

unsetopt correct_all
bindkey "^X\x7f" backward-kill-line

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
