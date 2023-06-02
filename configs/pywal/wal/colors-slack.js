var css = `
:root {
  --bg: #0a1d21;
  --fg: #cde3e2;
  --text: #cde3e2;
  --black: #0a1d21;
  --accent: #ff1969;
  --accentT: #ff196970;
  --cyan: #0cfef7;
  --red: #08ffe5;
  --primary: #00f3d4;
  --primaryT: #00f3d470;
  --orange: #45ffdb;
  --green: #5bffe3;
  --silver: #cde3e2;
  --gray: #8f9e9e;
  --purple: #ff1969;
  --blue: #0cfef7;
  --red2: #08ffe5;
  --color12: #00f3d4;
  --color13: #45ffdb;
  --color14: #5bffe3;
  --color15: #cde3e2;
}`;
var element = document.createElement('style');
element.setAttribute('type', 'text/css');

if ('textContent' in element) {
  element.textContent = css;
} else {
  element.styleSheet.cssText = css;
}

document.getElementsByTagName('head')[0].appendChild(element);
