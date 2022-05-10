#!/usr/bin/env bash

# source ~/.cache/wal/colors.sh

# number=$1
# declare color$number
# varname=color$number
# color=${!varname}

[ -f $HOME/.config/vis/colors/pywal ] && cat > $HOME/.config/vis/colors/pywal <<- END
gradient=false
cyan
END

killall -USR1 vis
