#!/bin/bash
TEMPLATES_DIR=places

colors=(black blue brown cyan green grey magenta orange red teal violet yellow)
color1_new=('#383c4a' '#367bf0' '#aa7a50' '#23bac2' '#17917a' '#737680' '#b8174c' '#fd7d00' '#d41919' '#20a8af' '#8c42ab' '#ffd86e')
color2_new=('#191919' '#2b62c0' '#775e49' '#20a8af' '#12715f' '#4c4c4c' '#93123d' '#b25800' '#b22525' '#198388' '#622e78' '#ffc730')
color3_new=('#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#fff'    '#000')


# ******************************
# * GENERATE ALL COLORS
# ******************************
for i in $(seq 0 $[${#colors[*]}-1])
do
  color=${colors[$i]}
  color1=${color1_new[$i]}
  color2=${color2_new[$i]}
  color3=${color3_new[$i]}
  dir=$TEMPLATES_DIR-$color
  rm -rf $dir
  mkdir $dir
  cp -d $TEMPLATES_DIR/* $TEMPLATES_DIR-$color/
  echo -e " [\e[32m+\e[0m] $color"
  sed -i "s/\(color1\|color2\|color3\)=.*/\1=$color$1/g" $dir/TEMPLATE_*
  (cd $dir \
    && find * -name 'TEMPLATE_*' -exec sh -c 'mv $1 ${1#TEMPLATE_}' _ {} \;)
done
