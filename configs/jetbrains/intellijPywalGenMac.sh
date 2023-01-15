#!/usr/bin/env bash
# value=\"(\K[a-f0-9]{6})
# (?sm)(^[^\r\n]+$)(?!.*^\1$)

# Attempts to retrieve wals colors
cache_dir="${HOME}/.cache/wal"
# Import colors
c=($(< "${cache_dir}/colors"))
c=("${c[@]//\#}")

# Read input param
ijConfigPath=$1

# Set colors based on pywal
color0=${c[0]}
color1=${c[1]}
color2=${c[2]}
color3=${c[3]}
color4=${c[4]}
color5=${c[5]}
color6=${c[6]}
color7=${c[7]}
color8=${c[8]}
color9=${c[9]}
color10=${c[10]}
color11=${c[11]}
color12=${c[12]}
color13=${c[13]}
color14=${c[14]}
color15=${c[15]}

txtColor=${c[15]}
bgColor=${c[0]}
sbgColor=${c[1]}
sfgColor=${c[0]}
caretRowColor=${sfgColor}
lnColor=${c[1]}
fgColor=${c[15]}
bg2Color=${c[1]}
contrastColor=${c[1]}
sbColor=${c[1]}
treeColor=${c[15]}
disabledColor=${c[15]}
activeColor=${c[2]}

selectionBgColor="${c[8]}77"
selectionFgColor=${c[2]}

reDarkGrey="${c[8]}B0"
reErrorColor=${c[4]}

caretColor=${c[8]}

# Get current Directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Paths to templates
templatePath=$DIR\/material_scheme_template.xml
materialTPath=$DIR\/material_template.xml

# Paths to IDE
ijCfPath=$ijConfigPath/colors/material-pywal.icls
ijMPath=$ijConfigPath/options/material_custom_theme.xml

# Override existing config
cp -f $templatePath $ijCfPath
cp -f $materialTPath $ijMPath

# Replace placeholders for colors
exp=s/leTXT/$txtColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leBG/$bgColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

# Selection/Highlight colors
exp=s/leSFG/$sfgColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leSBG/$sbgColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leCROW/$caretRowColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leLN/$lnColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leFG/$fgColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leBG2/$bg2Color/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leContrast/$contrastColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leSBC/$sbColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leTree/$treeColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leDisabled/$disabledColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/leActive/$activeColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor15/$color15/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor14/$color14/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor13/$color13/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor12/$color12/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor11/$color11/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor10/$color10/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor9/$color9/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor8/$color8/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor7/$color7/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor6/$color6/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor5/$color5/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor4/$color4/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor3/$color3/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor2/$color2/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor1/$color1/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reColor0/$color0/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reSelectBgColor/$selectionBgColor/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

exp=s/reDarkGrey/$reDarkGrey/g
sed -i '' $exp $ijCfPath
sed -i '' $exp $ijMPath

echo "updated $ijCfPath"

cp -f $ijCfPath $DIR\/gen/pywal_editor_scheme.icls
cp -f $ijMPath $DIR\/gen/pywal_theme.icls