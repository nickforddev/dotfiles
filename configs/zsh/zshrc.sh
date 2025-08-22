# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

# set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# command auto-correction
ENABLE_CORRECTION="true"

# fix slow paste
DISABLE_MAGIC_FUNCTIONS="true"

# plugins
# https://github.com/robbyrussell/oh-my-zsh/wiki/plugins
plugins=(
  macos
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
  fzf
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# setup zshell
source $ZSH/oh-my-zsh.sh

# fh - search history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --height 20% +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fh - search history full
fhf() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

alias fcd=fzf-cd-widget

grepo() {
  local name=$(git remote get-url origin | sed 's/git@github.com://' | sed 's/\.git//')
  open "https://github.com/${name}"
}

# commit spamming for debugging CI
gppls() {
  cat /dev/urandom | base64 | tr -dc '0-9a-zA-Z' | head -c28 | read -d '' name
  gaa && gc -m $name && gp
}

assume-role() {
  export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
  $(aws sts assume-role \
  --role-arn $1 \
  --role-session-name $2 \
  --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
  --output text $3)) 
}

reset-role() {
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
}

# youtube album downloader
source ~/.config/zsh/scripts/ytsplit.sh

# theme cli
source ~/.config/zsh/scripts/theme/theme.sh

theme1() {
  theme hexfade.jpeg haishoku 0.8
}

theme2() {
  theme ghostmeadow.webp haishoku 0.8
}

theme3() {
  theme springtrain.png 0.8
}

# walserver
source ~/.dotfiles/configs/pywal/server.sh
# open dotfiles project in VSCode
alias dotfiles='code ~/.dotfiles'

# open current project readme in VSCode
alias readme='code ./README.md'

alias getip='curl http://checkip.amazonaws.com'

# zsh rec files alises
alias zrc='vim ~/.zshrc'
alias zrcl='vim ~/.zshrc.local'
alias sz='source ~/.zshrc'

# vim rec file aliases
alias vrc='vim ~/.vimrc'
alias vrcl='vim ~/.vimrc.local'
alias vrcb='vim ~/.vimrc.bundles'
alias vrcbl='vim ~/.vimrc.bundles.local'

# git
alias gs='git stash'
alias gsp='git stash pop'
alias glb='gco @{-1}'
alias gmlm='gco master; gl; glb; gm master'
alias gmld='gco develop; gl; glb; gm develop'
alias glra='gl --rebase --autostash'

# yarn
alias yi='yarn install'

# get ip
alias wmip="curl checkip.amazonaws.com"

# misc
alias cputmp='sudo powermetrics -n 1 --samplers smc | grep -i "CPU die temperature"'
alias chrome="open -a 'Google Chrome'"
alias awsconfig="code ~/.aws"
alias dvd="python ~/.dotfiles/scripts/dvd_screensaver.py"

slackwal() {
  echo "$(<$HOME/.cache/wal/colors-slack.js)" | pbcopy
  echo "Slack colors copied to clipboard"
}

eval $(thefuck --alias)

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/etc/bash_completion" ] && . "$NVM_DIR/etc/bash_completion"

[[ -f /usr/local/opt/postgresql@11 ]] && export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f ~/sites/consumer-web-app/node_modules/tabtab/.completions/serverless.zsh ]] && . ~/sites/consumer-web-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f ~/sites/consumer-web-app/node_modules/tabtab/.completions/sls.zsh ]] && . ~/sites/consumer-web-app/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f ~/sites/consumer-web-app/node_modules/tabtab/.completions/slss.zsh ]] && . ~/sites/consumer-web-app/node_modules/tabtab/.completions/slss.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export DENO_INSTALL="/Users/nichford/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

# decode jwt
jwtp() {
  jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
}

walstart

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
complete -C 'usr/local/bin/aws_completer'

cleanup() {
  local apps=(
    "Microsoft Outlook:1"
    "zoom.us:2"
    "Amazon Chime:3"
    "Slack:4"
    "iTerm2:5"
    "Code:6"
    "JetBrains Gateway:7"
    "IntelliJ IDEA:7"
    "Firefox:8"
    "Google Chrome:8"
    "Music:9"
    "Obsidian:10"
  )
  
  for app_space in "${apps[@]}"; do
    local app="${app_space%:*}"
    local space="${app_space#*:}"
    echo "Moving $app windows..."
    yabai -m query --windows | jq -r ".[] | select(.app == \"$app\") | .id" | xargs -I {} yabai -m window {} --space $space
  done
  echo "Done"
}
export PATH="/Applications/Fortify/Fortify_SCA_24.4.0/bin:$PATH"

export PATH="/Applications/Fortify/Fortify_Apps_and_Tools_24.4.0/bin:$PATH"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
