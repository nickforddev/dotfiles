# user path
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# pip
export PATH=~/Library/Python/3.7/bin:$PATH

# go
export PATH=$PATH:/usr/local/go/bin

# ruby gems
# export PATH=$PATH:$HOME/Software/ruby/bin

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

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