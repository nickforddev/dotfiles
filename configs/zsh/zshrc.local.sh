# ==================================================================================================
# Zsh config local
# ==================================================================================================

alias chrome_nocors='open -a Google\ Chrome --args --disable-web-security'
alias arestart='sudo apachectl restart'

source ~/.iterm2_shell_integration.zsh

unsetopt inc_append_history
unsetopt share_history

ghpr() {
  git remote get-url origin | sed 's/git@github.com://' | sed 's/\.git//' | read -d '' name;
  git branch --show-current | read -d '' branch;
  open "https://github.com/${name}/compare/${branch}?expand=1"
}

gppr() {
  gp -u origin HEAD && ghpr
}