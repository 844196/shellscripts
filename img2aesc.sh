#!/bin/bash -eu
#
#   @(#) ターミナルで画像表示
#
#   Usage:
#       img2aesc.sh [file]
#       command | img2aesc.sh
#
#   Author:
#       Original sasairc (@sasairc_2)
#       Modified 844196 (@84____)
#
#   License:
#       MIT
#


function _Error() {
    echo "${0##*/}: $@" 1>&2
    echo "Usage: ${0##*/} [file]" 1>&2
    echo "       command | ${0##*/}" 1>&2
    exit 1
}

# ImageMagickがなければエラーを出して終了
if $(type convert >/dev/null 2>&1); then
    :
else
    _Error "Require ImageMagick"
fi

# パイプ or 第一引数の読み取り
#       第一引数優先
#       どちらもなければエラーを出して終了
[ -p /dev/stdin ] && img=$(cat -)
[ -n "${1}" ] && img=${1}
[ -z "${img}" ] && _Error "Invaild argument"
if [[ ${img##*.} =~ JPE?G|jpe?g|GIF|gif|PNG|png ]]; then
    :
else
    _Error "Invaild argument"
fi

# 一時ファイル作成
tmpfile=$(mktemp "/tmp/tmp.$[RANDOM*RANDOM]")
function _DeleteTmp() {
    [[ -n ${tmpfile} ]] && rm -f "${tmpfile}"
}
trap '_DeleteTmp;' EXIT
trap '_DeleteTmp; exit 1;' INT ERR


# 画像を画面の高さ-5のサイズに変換し一時ファイルに格納
convert -resize x$[$(tput lines)-5] "${img}" "${tmpfile}"

# 画像の横幅を取得
img_width=$(identify "${tmpfile}" | sed 's/^.* \([0-9]*\)x[0-9]* .*$/\1/g')

# 1. 画像を1ドットずつ読み取りRGBを取得
#       awkとsedでスペース区切りに加工しwhileで読み取る
# 2. RGBをANSI(6x6x6)に変換
#       rgb[0..5] -> (r*36)+(g*6)+b+16
#       0..5(6階調)なので5を掛け255で割る
# 3. 描画
#       iをインクリメントし、画像の横幅と等しくなったら改行
i=0
convert "${tmpfile}" -crop 1x1+${img_width} txt:- 2>/dev/null |
awk 'NR >= 2 {print $2}' | sed -e 's/[()]//g' -e 's/,/ /g' |
while read R G B _;
do
    color=$[(R*5/255*36)+(G*5/255*6)+(B*5/255)+16]
    echo -en "\033[48;5;${color}m  \033[m"
    i=$(( ${i} + 1 ))
    [ 0 -eq $(( ${i} % ${img_width} )) ] && echo
done