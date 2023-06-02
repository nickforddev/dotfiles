const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a1d21", /* black   */
  [1] = "#ff1969", /* red     */
  [2] = "#0cfef7", /* green   */
  [3] = "#08ffe5", /* yellow  */
  [4] = "#00f3d4", /* blue    */
  [5] = "#45ffdb", /* magenta */
  [6] = "#5bffe3", /* cyan    */
  [7] = "#cde3e2", /* white   */

  /* 8 bright colors */
  [8]  = "#8f9e9e",  /* black   */
  [9]  = "#ff1969",  /* red     */
  [10] = "#0cfef7", /* green   */
  [11] = "#08ffe5", /* yellow  */
  [12] = "#00f3d4", /* blue    */
  [13] = "#45ffdb", /* magenta */
  [14] = "#5bffe3", /* cyan    */
  [15] = "#cde3e2", /* white   */

  /* special colors */
  [256] = "#0a1d21", /* background */
  [257] = "#cde3e2", /* foreground */
  [258] = "#cde3e2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
