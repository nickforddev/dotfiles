#!/usr/bin/env bash

source ~/.cache/wal/colors.sh

cat > $HOME/.cache/wal/colors-slack.js <<- END
var css = \`
:root {
  --bg: $background;
  --fg: $foreground;
  --text: $foreground;
  --black: $color0;
  --accent: $color1;
  --accentT: $(echo $color1)70;
  --cyan: $color2;
  --red: $color3;
  --primary: $color4;
  --primaryT: $(echo $color4)70;
  --orange: $color5;
  --green: $color6;
  --silver: $color7;
  --gray: $color8;
  --purple: $color9;
  --blue: $color10;
  --red2: $color11;
  --color12: $color12;
  --color13: $color13;
  --color14: $color14;
  --color15: $color15;
}\`;
var element = document.createElement('style');
element.setAttribute('type', 'text/css');

if ('textContent' in element) {
  element.textContent = css;
} else {
  element.styleSheet.cssText = css;
}

document.getElementsByTagName('head')[0].appendChild(element);
END
