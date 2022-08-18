#!/bin/bash

. ~/.cache/wal/colors.sh

# Specify your alfred config path
ALFRED_CONFIG="$HOME/.dotfiles/configs/alfred"

THEME_PATH="$ALFRED_CONFIG/Alfred.alfredpreferences/themes/pywaltheme"

mkdir -p $THEME_PATH

foreground="${foreground}FF"
background="${background}66"
accent="${color11}FF"
subtext="${color5}FF"

echo "Alfred theme generated at $THEME_PATH"

cat > "$THEME_PATH/theme.json" << EOF
{
  "alfredtheme" : {
    "result" : {
      "textSpacing" : 10,
      "subtext" : {
        "size" : 11,
        "colorSelected" : "$background",
        "font" : "System Light",
        "color" : "$subtext"
      },
      "shortcut" : {
        "size" : 13,
        "colorSelected" : "$accent",
        "font" : "System Light",
        "color" : "$background"
      },
      "backgroundSelected" : "$accent",
      "text" : {
        "size" : 22,
        "colorSelected" : "$foreground",
        "font" : "System Light",
        "color" : "$foreground"
      },
      "iconPaddingHorizontal" : 10,
      "roundness" : 0,
      "paddingVertical" : 8,
      "iconSize" : 46
    },
    "search" : {
      "backgroundSelected" : "$accent",
      "paddingHorizontal" : 8,
      "spacing" : 10,
      "text" : {
        "size" : 36,
        "colorSelected" : "$foreground",
        "font" : "System Light",
        "color" : "$foreground"
      },
      "background" : "$background",
      "roundness" : 0,
      "paddingVertical" : 2
    },
    "window" : {
      "color" : "$background",
      "paddingHorizontal" : 10,
      "width" : 620,
      "borderPadding" : 0,
      "borderColor" : "$accent",
      "blur" : 10,
      "roundness" : 0,
      "paddingVertical" : 10
    },
    "credit" : "metafates",
    "visualEffectMode" : 2,
    "separator" : {
      "color" : "#00000005",
      "thickness" : 1
    },
    "scrollbar" : {
      "color" : "$accent",
      "thickness" : 2
    },
    "name" : "Pywal"
  }
}
EOF
