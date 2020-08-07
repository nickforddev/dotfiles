# ==================================================================================================
# Zsh config
# ==================================================================================================

# path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Set fzf installation directory path
export FZF_BASE=/path/to/fzf/install/dir

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --height 20% +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

fhf() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Power Level 9K settings
# https://github.com/bhilburn/powerlevel9k#available-prompt-segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs virtualenv)

# command auto-correction
ENABLE_CORRECTION="true"

# plugins
# https://github.com/robbyrussell/oh-my-zsh/wiki/plugins
plugins=(
  osx
  sudo
  brew
  aws
  git
  github
  docker
  virtualenv
  npm
  node
  pip
  python
  jsontools
  history-substring-search
  zsh-syntax-highlighting
  fzf
  z
)

# setup zshell
source $ZSH/oh-my-zsh.sh

# open dotfiles project in VSCode
alias dotfiles='code ~/Sites/dotfiles'

# open current project readme in VSCode
alias readme='code ./README.md'

# zsh rec files alises
alias zrc='vim ~/.zshrc'
alias zrcl='vim ~/.zshrc.local'
alias sz='source ~/.zshrc'

# vim rec file aliases
alias vrc='vim ~/.vimrc'
alias vrcl='vim ~/.vimrc.local'
alias vrcb='vim ~/.vimrc.bundles'
alias vrcbl='vim ~/.vimrc.bundles.local'

alias gmlm='gco master; gl; gco @{-1}; gm master'
alias gmld='gco develop; gl; gco @{-1}; gm develop'

# yarn
alias yi='yarn install'

# get aliases and stuff from local
source ~/.zprofile
source ~/.zshrc.local
[[ -L ~/.zshrc.untracked ]] && source ~/.zshrc.untracked

unsetopt correct_all
bindkey "^X\x7f" backward-kill-line
# bindkey "^[[A" history-search-backward
# bindkey "^[[B" history-search-forward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/nicholas.ford/Sites/consumer-web-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/nicholas.ford/Sites/consumer-web-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/nicholas.ford/Sites/consumer-web-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/nicholas.ford/Sites/consumer-web-app/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/nicholas.ford/Sites/consumer-web-app/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/nicholas.ford/Sites/consumer-web-app/node_modules/tabtab/.completions/slss.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
