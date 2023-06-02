static const char norm_fg[] = "#cde3e2";
static const char norm_bg[] = "#0a1d21";
static const char norm_border[] = "#8f9e9e";

static const char sel_fg[] = "#cde3e2";
static const char sel_bg[] = "#0cfef7";
static const char sel_border[] = "#cde3e2";

static const char urg_fg[] = "#cde3e2";
static const char urg_bg[] = "#ff1969";
static const char urg_border[] = "#ff1969";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
