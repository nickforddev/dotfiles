PORT=2121

start_server() {
  http-server ~/.cache/wal -p $PORT -c-1 -d false > /dev/null 2>&1 &
}

kill_server() {
  kill -9 $(lsof -ti:${PORT})
}
