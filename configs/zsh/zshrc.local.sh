# ==================================================================================================
# Zsh config local
# ==================================================================================================

alias chrome_nocors='open -a Google\ Chrome --args --disable-web-security'
alias arestart='sudo apachectl restart'
alias python='python3'

source ~/.iterm2_shell_integration.zsh

unsetopt inc_append_history
unsetopt share_history

export PATH=$PATH:/usr/local/go/bin
