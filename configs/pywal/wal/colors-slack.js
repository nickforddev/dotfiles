var css = `
:root {
  --bg: #172024;
  --fg: #c5c7c8;
  --text: #c5c7c8;
  --black: #172024;
  --accent: #c716c3;
  --accentT: #c716c370;
  --cyan: #30a7e8;
  --red: #ed616f;
  --primary: #2ccee7;
  --primaryT: #2ccee770;
  --orange: #ef976f;
  --green: #63edbe;
  --silver: #c5c7c8;
  --gray: #51575a;
  --purple: #c716c3;
  --blue: #30a7e8;
  --red2: #ed616f;
  --color12: #2ccee7;
  --color13: #ef976f;
  --color14: #63edbe;
  --color15: #c5c7c8;
}`;
var element = document.createElement('style');
element.setAttribute('type', 'text/css');

if ('textContent' in element) {
  element.textContent = css;
} else {
  element.styleSheet.cssText = css;
}

document.getElementsByTagName('head')[0].appendChild(element);
