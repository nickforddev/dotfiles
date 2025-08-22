# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
# user path
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:"
export PATH="/Users/nichford/.local/bin:$PATH"

# pip
# export PATH=~/Library/Python/3.7/bin:$PATH

# go
export PATH=$PATH:/usr/local/go/bin

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# pgsql
if [ -d "/usr/local/Cellar/libpq" ] ; then
  for dir in /usr/local/Cellar/libpq/* ; do
    PATH="${dir}/bin/:${PATH}"
  done
fi

# toolbox
if [ -d "$HOME/.toolbox" ] ; then
  export PATH=$HOME/.toolbox/bin:$PATH
fi

# android sdk
# export ANDROID_HOME=/Users/nick/Library/Android/sdk
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source /Users/nichford/bash_extensions/.bash_extensions

export PATH="/Applications/Fortify/Fortify_SCA_24.4.0/bin:$PATH"

export PATH="/Applications/Fortify/Fortify_Apps_and_Tools_24.4.0/bin:$PATH"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
