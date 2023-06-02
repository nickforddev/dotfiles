const baseStyles = /* css */ `
.simple-bar--container {
  position: fixed;
  top: 14px;
  left: 14px;
  /* right: 14px; */
  height: var(--bar-height);
  // overflow: hidden;
}
.simple-bar {
  position: relative;
  height: var(--bar-height);
  width: inherit;
  display: flex;
  align-items: stretch;
  padding: var(--bar-inner-margin);
  box-sizing: border-box;
  color: var(--foreground);
  font-size: var(--font-size);
  font-family: var(--font);
}
.simple-bar--floating {
  top: 5px;
}
.simple-bar--no-bar-background {
  padding: 0;
}
.simple-bar--on-bottom {
  top: unset;
  bottom: 0;
}
.simple-bar--floating.simple-bar--on-bottom {
  bottom: 5px;
}
#simple-bar-spaces-jsx {
  z-index: 9;
}
.simple-bar--spaces {
  box-sizing: border-box;
  left: 0;
  width: 100%;
  /* background-color: var(--background); */
  // box-shadow: var(--light-shadow);
  /* box-shadow: inset 0px 0px 0px 3px #010101; */
  z-index: 0;
}
.simple-bar--floating.simple-bar--spaces {
  left: 5px;
  width: calc(100% - 10px);
  border-radius: var(--bar-radius);
}
.simple-bar--no-bar-background.simple-bar--spaces,
.simple-bar--no-shadow.simple-bar--spaces {
  // box-shadow: none;
}
.simple-bar--focused,
.simple-bar--no-shadow.simple-bar--focused {
  box-shadow: inset 0 0 0 3px #5ffdff;
}
.simple-bar--no-bar-background.simple-bar--spaces {
  background-color: transparent;
}
.simple-bar--data {
  position: fixed;
  top: 14px;
  right: 14px;
  margin-left: auto;
  color: var(--main);
  z-index: 1;
  left: 14px;
  background-color: var(--background);
  box-shadow: inset 0px 0px 0px 3px #010101;
  overflow: hidden;
  justify-content: flex-end;
  border-radius: 14px;
}
.simple-bar--floating.simple-bar--data {
  right: 5px;
}
.simple-bar--no-bar-background.simple-bar--data {
  padding: 4px 5px 4px 0;
  background-color: var(--background);
  box-shadow: var(--light-shadow);
  border-radius: var(--bar-radius);
}
.simple-bar--no-color-in-data.simple-bar--data {
  color: var(--white);
}
.simple-bar--empty {
  height: var(--bar-height);
  display: flex;
  align-items: center;
  left: 18px;
  position: fixed;
  top: 14px;
}
.simple-bar--spaces.simple-bar--empty,
.simple-bar--data.simple-bar--empty {
  z-index: 2;
}
.simple-bar--data.simple-bar--empty {
  justify-content: flex-end;
  color: white;
}
.simple-bar--empty > span {
  position: relative;
  display: flex;
  align-items: center;
  color: var(--foreground);
}
.simple-bar--empty > span::before {
  content: "";
  width: 6px;
  height: 6px;
  margin-right: 7px;
  background-color: var(--red);
  border-radius: 50%;
}
.simple-bar--empty.simple-bar--loading > span::before {
  background-color: var(--green);
}
#simple-bar-click-effect {
  position: absolute;
  border-radius: 50%;
  pointer-events: none;
  touch-action: none;
  background-color: var(--click-effect);
  z-index: 2147483647;
}
`

export { baseStyles as styles }
