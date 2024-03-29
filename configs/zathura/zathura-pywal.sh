#!/bin/sh
#
# zathura-pywal

NEWLINE='
'
ZATHURA_DIR="${XDG_CONFIG_HOME:-${HOME}/.config/}/zathura/"
ZATHURARC="${ZATHURA_DIR}/zathurarc"
SETTINGS="${HOME}/.dotfiles/configs/zathura/settings"
COLORS="${XDG_CACHE_HOME:-${HOME}/.cache/}/wal/colors.sh"

usage() {
    printf '%s\n' "Usage: $(basename "${0}") [options]" 1>&2;
    printf 'Options:\n'
    printf '%s%-6sAlpha transparency of the background (default: 1)\n' '-a' ''
    printf '%s%-6sDisplay this prompt\n' '-h' ''
}

zathura_pywal() {
    printf 'Checking for zathurarc...\n'
    if [ -f "${ZATHURARC}" ]; then
        printf 'Backing up zathurarc...\n'
        [ ! -f "${SETTINGS}" ] && printf 'Settings not found.\n' && return 1
        settings="$(grep -f "${SETTINGS}" -v "${ZATHURARC}" | sed '/^$/d' )"
        cp "${ZATHURARC}" "${ZATHURARC}.bak"
    else
        printf 'Creating zathurarc...\n'
        mkdir -p "${ZATHURARC%/*}"
        touch "${ZATHURARC}"
    fi

    printf 'Checking for pywal color scheme...\n'
    if [ -f "${COLORS}" ]; then . "${COLORS}"
    else
        printf 'Pywal color scheme not found.\nPlease make sure you run pywal in order to generate a color scheme.\n'
        return 1
    fi

    cat /dev/null > "${ZATHURARC}"

    if [ -n "${settings}" ]; then
        printf 'Copying old settings into zathurarc...\n'
        printf '%s\n\n' "### Settings from original zathurarc ###${NEWLINE}${settings}" >> "${ZATHURARC}"
    fi

    printf 'Changing zathura color scheme...\n'

    hex="$(printf '%s' "${color0}" | tr '[:lower:]' '[:upper:]' | tr -d '[:punct:]')"

    a=$(printf '%s' "${hex}" | cut -c 1-2)
    b=$(printf '%s' "${hex}" | cut -c 3-4)
    c=$(printf '%s' "${hex}" | cut -c 5-6)

    r=$(printf '%d' 0x${a})
    g=$(printf '%d' 0x${b})
    b=$(printf '%d' 0x${c})

    [ -z "${alpha}" ] && alpha=1

    [ "${alpha%"${alpha#?}"}" = '.' ] && alpha="0.${alpha#?}"

    [ ${#alpha} -ge 4 ] && alpha="${alpha%${alpha#????}}"

    printf '%s' "### zathura-pywal ###
# Allow recolor
set recolor 'true'

# Don't allow original hue when recoloring
set recolor-keephue 'false'

# Don't keep original image colors while recoloring
set recolor-reverse-video 'false'

# Command line completion entries
set completion-fg '${color7}'
set completion-bg '${color0}'

# Command line completion group elements
set completion-group-fg '${color2}'
set completion-group-bg '${color0}'

# Current command line completion element
set completion-highlight-fg '${color0}'
set completion-highlight-bg '${color7}'

# Default foreground/background color
set default-bg rgba(${r},${g},${b},${alpha})

# Input bar
set inputbar-fg '${color7}'
set inputbar-bg '${color0}'

# Notification
set notification-fg '${color7}'
set notification-bg '${color0}'

# Error notification
set notification-error-fg '${color7}'
set notification-error-bg '${color1}'

# Warning notification
set notification-warning-fg '${color7}'
set notification-warning-bg '${color1}'

# Tab - TODO
# set tabbar-fg
# set tabbar-bg

# Focused tab - TODO
# set tabbar-focus-fg
# set tabbar-focus-bg

# Status bar
set statusbar-fg '${color7}'
set statusbar-bg '${color0}'

# Highlighting parts of the document (e.g. show search results)
set highlight-color '${color2}'
set highlight-active-color '${color2}'

# Represent light/dark colors in recoloring mode
set recolor-lightcolor rgba(0,0,0,0)
set recolor-darkcolor '${color7}'

# 'Loading...' text
set render-loading-fg '${color7}'
set render-loading-bg '${color0}'

# Index mode
set index-fg '${color7}'
set index-bg '${color0}'

# clipboard
set selection-clipboard clipboard

# Selected element in index mode
set index-active-fg '${color0}'
set index-active-bg '${color7}'" >> "${ZATHURARC}"

    printf "All done.\nPress 'Ctrl' + 'R' (or whatever 'recolor' is mapped to) with zathura open to toggle the color scheme.\n"
}

main() {
    [ ${#} -eq 0 ] && zathura_pywal

    while getopts "a:h" o; do
        case "${o}" in
            a)
                alpha="${OPTARG}"
                if ! printf '%s' "${alpha}" | grep -q '^0*\.[0-9][0-9]*$\|^[0-1]$'; then
                    printf 'Alpha must be a decimal value between 0 and 1.\n'
                    usage
                    return 1
                fi
                zathura_pywal "${alpha}"
                ;;
            h|*)
                usage
                ;;
        esac
    done
}

main "${@}"
