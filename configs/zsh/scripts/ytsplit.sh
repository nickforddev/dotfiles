#!/usr/bin/env bash

ytsplit() {
  local OUTPUT_DIR="downloaded" &&
  pushd ~/Sites/album-splitter > /dev/null &&
  source ./venv/bin/activate > /dev/null &&
  code ./tracks.txt --wait &&
  python -m album_splitter -yt "$1" --artist "$2" --album "$3" --output "$OUTPUT_DIR" &&
  rm ./*.wav
  rm ./*.mp3
  echo "Successfully downloaded $1, album $3 by $2" &&
  open "./$OUTPUT_DIR" &&
  popd > /dev/null
}
