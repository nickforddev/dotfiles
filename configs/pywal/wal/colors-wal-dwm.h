static const char norm_fg[] = "#c5c7c8";
static const char norm_bg[] = "#172024";
static const char norm_border[] = "#51575a";

static const char sel_fg[] = "#c5c7c8";
static const char sel_bg[] = "#30a7e8";
static const char sel_border[] = "#c5c7c8";

static const char urg_fg[] = "#c5c7c8";
static const char urg_bg[] = "#c716c3";
static const char urg_border[] = "#c716c3";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
