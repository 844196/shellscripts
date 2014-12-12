#!/bin/bash
#
#   @(#) Vim!Vim!Vim!
#
#   Author:
#       844196 (@84____)
#
#   License:
#       Vim License (http://vimdoc.sourceforge.net/htmldoc/uganda.html#license)
#


A="\033[48;5;232m  \033[m"
B="\033[48;5;238m  \033[m"
C="\033[48;5;244m  \033[m"
D="\033[48;5;254m  \033[m"
E="\033[48;5;22m  \033[m"
F="\033[48;5;34m  \033[m"
G="\033[48;5;17m  \033[m"

function _CursorInvisible() {
    trap "tput cnorm;" EXIT
    trap "tput cnorm; exit 1" SIGINT
    tput civis
}

function _Sleep() {
    local t="${@}"
    if $(which sleepenh >/dev/null 2>&1); then
        local sleep='sleepenh'
    else
        local sleep='sleep'
    fi
    ${sleep} ${t} >/dev/null
}

function _MarginHeight() {
    local height=$(tput lines)
    local m=$(expr \( ${height} - ${1} \) / 2)
    for i in $(seq 1 ${m}); do
        echo " "
    done
}

function _MarginWidth() {
    local cols=$(tput cols)
    local w=$(expr \( ${cols} - ${1} \) / 2)
    MARGIN_W=$(for i in `seq 1 ${w}`; do printf " "; done)
}

function _VimIcon() {
_MarginHeight 32; _MarginWidth 64;
local VIM="
${MARGIN_W}                              $A$A
${MARGIN_W}                            $A$F$F$A
${MARGIN_W}        $A$A$A$A$A$A$A$A$A$A$F$E$E$F$A  $A$A$A$A$A$A$A$A
${MARGIN_W}      $A$D$D$D$D$D$D$D$D$D$D$A$E$E$E$F$A$D$D$D$D$D$D$D$D$A
${MARGIN_W}      $A$D$C$C$C$C$C$C$C$C$C$C$A$E$E$E$A$C$C$C$C$C$C$C$C$C$A
${MARGIN_W}        $A$C$C$C$C$C$C$C$C$C$B$B$A$E$E$E$A$C$C$C$C$C$C$C$B$B$A
${MARGIN_W}          $A$B$C$C$C$C$C$C$B$B$A$E$E$E$E$A$D$B$C$C$C$C$B$B$A
${MARGIN_W}          $A$D$C$C$C$C$C$C$B$A$E$E$E$E$E$A$D$C$C$C$C$B$B$A
${MARGIN_W}          $A$D$C$C$C$C$C$C$B$A$E$E$E$E$A$D$D$C$C$C$B$B$A
${MARGIN_W}          $A$D$C$C$C$C$C$C$B$A$E$E$E$A$D$D$C$C$C$B$B$A
${MARGIN_W}          $A$D$C$C$C$C$C$C$B$A$E$E$A$D$D$C$C$C$B$B$A$A
${MARGIN_W}        $A$A$D$C$C$C$C$C$B$A$E$E$A$D$D$C$C$C$B$B$A$E$G$A
${MARGIN_W}      $A$F$A$D$C$C$C$C$C$B$A$E$A$D$D$C$C$C$C$B$A$E$E$E$E$A
${MARGIN_W}    $A$F$E$A$D$C$C$C$C$C$B$A$A$D$D$C$C$C$C$B$A$E$E$E$E$E$G$A
${MARGIN_W}  $A$F$E$E$A$D$C$C$C$C$C$B$A$D$D$C$C$C$C$C$B$A$E$E$E$E$E$E$G$A
${MARGIN_W}$A$F$E$E$E$A$D$C$C$C$C$C$B$D$D$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}$A$F$E$E$E$A$D$C$C$C$C$C$B$D$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}  $A$F$E$A$D$C$C$C$C$C$C$B$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}    $A$F$A$D$C$C$C$C$C$C$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}      $A$A$D$C$C$C$C$C$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$C$C$C$C$C$C$B$A$E$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$C$C$C$C$C$B$A$E$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$C$B$B$A$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$B$B$A$E$E$E$E$E$E$E$E$G$A
${MARGIN_W}        $A$D$C$C$C$B$A$A$E$E$E$E$E$E$E$G$A
${MARGIN_W}          $A$C$C$B$B$A  $A$G$E$E$E$E$G$A
${MARGIN_W}            $A$B$B$A      $A$G$E$E$G$A
${MARGIN_W}              $A$A          $A$G$G$A
${MARGIN_W}                              $A$A
"
echo -en "${VIM}"
}

_CursorInvisible; clear; _VimIcon; sleep 1; exit 0