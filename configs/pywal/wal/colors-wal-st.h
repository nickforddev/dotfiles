const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#172024", /* black   */
  [1] = "#c716c3", /* red     */
  [2] = "#30a7e8", /* green   */
  [3] = "#ed616f", /* yellow  */
  [4] = "#2ccee7", /* blue    */
  [5] = "#ef976f", /* magenta */
  [6] = "#63edbe", /* cyan    */
  [7] = "#c5c7c8", /* white   */

  /* 8 bright colors */
  [8]  = "#51575a",  /* black   */
  [9]  = "#c716c3",  /* red     */
  [10] = "#30a7e8", /* green   */
  [11] = "#ed616f", /* yellow  */
  [12] = "#2ccee7", /* blue    */
  [13] = "#ef976f", /* magenta */
  [14] = "#63edbe", /* cyan    */
  [15] = "#c5c7c8", /* white   */

  /* special colors */
  [256] = "#172024", /* background */
  [257] = "#c5c7c8", /* foreground */
  [258] = "#c5c7c8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
