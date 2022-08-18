WALSERVER_PORT=2121

start_server() {
  http-server ~/.dotfiles/configs/pywal -p $WALSERVER_PORT -c-1 -d false > /dev/null 2>&1 &
}

get_server_pid() {
  lsof -ti:${WALSERVER_PORT}
}

kill_server() {
  kill -9 $(get_server_pid)
}

# autostart
get_server_pid > /dev/null 2>&1 || start_server

alias walstart=start_server
alias walstop=kill_server
