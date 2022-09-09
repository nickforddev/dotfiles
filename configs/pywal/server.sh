WALSERVER_PORT=2121

start_server() {
  local pid=$(get_server_pid)
  if [ -z "$pid" ]
  then
    echo "Starting pywalserver on port $WALSERVER_PORT"
    http-server ~/.dotfiles/configs/pywal -p $WALSERVER_PORT -c-1 -d false > /dev/null 2>&1 &
  else
    echo "pywalserver already running"
  fi
}

get_server_pid() {
  lsof -ti:${WALSERVER_PORT}
}

kill_server() {
  local pid=$(get_server_pid)
  if [ -z "$pid" ]
  then
    echo "pywalserver not running"
  else
    kill -9 $(get_server_pid)
  fi
}

# autostart
# get_server_pid > /dev/null 2>&1 || start_server
# get_server_pid || start_server

alias walstart=start_server
alias walstop=kill_server
