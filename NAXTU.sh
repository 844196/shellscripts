#!/bin/bash
#
#   @(#) ターミナルが256色使えるかどうか確認するスクリプトです
#
#   Author:
#       844196 (@84____)
#
#   License:
#       WTFPL 2.0
#


Y="\033[48;5;236m  \033[m"
J="\033[48;5;137m  \033[m"
U="\033[48;5;180m  \033[m"

function _CursorInvisible() {
    trap "clear; tput cnorm;" EXIT
    trap "clear; tput cnorm; exit 1" SIGINT
    tput sc; tput cup 0 0; tput civis
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
    local m=$(expr ${height} - ${1})
    for i in $(seq 1 ${m}); do
        echo " "
    done
}

function NAXTU() {
_MarginHeight 31;
local NAXTU="
                                    $Y$Y$Y$Y$Y$Y$Y
                                $J$J$U$U$Y$Y$Y$Y$Y$Y
                            $J$J$U$U$U$U$U$U$Y$Y$Y$Y$Y
                          $J$U$Y$Y$U$U$U$U$U$U$U$Y$Y$Y$Y
                        $J$U$U$U$Y$Y$U$U$U$U$U$U$U$Y$Y$Y$Y
                      $J$U$U$Y$Y$U$Y$Y$U$U$U$U$U$U$U$Y$Y$Y$Y
                  $J$J$U$U$U$U$U$Y$Y$Y$U$U$U$U$U$U$U$J$Y$Y$Y
                $J$J$U$U$U$U$U$U$U$U$U$Y$Y$Y$U$U$U$U$J$Y$Y$Y$Y
              $J$J$U$U$U$J$J$J$J$J$U$Y$Y$Y$Y$Y$U$U$J$U$J$Y$Y$Y
            $J$J$U$U$U$U$J$Y$J$U$U$U$U$Y$U$U$U$Y$U$U$J$J$Y$Y$Y$Y
            $J$U$U$U$J$J$U$U$Y$J$J$U$U$U$U$U$U$U$U$J$U$J$J$Y$Y$Y
          $J$U$U$U$J$J$J$J$U$J$J$J$U$U$U$U$U$U$U$J$U$J$J$J$Y$Y$Y
          $J$U$U$J$U$U$U$J$U$U$J$U$U$U$U$U$U$U$U$U$J$J$Y$Y$Y$Y$Y
        $J$U$U$J$Y$Y$Y$U$U$J$U$J$U$U$U$U$U$U$U$U$J$J$Y$Y$Y$Y$Y$Y
        $J$U$J$Y$Y$Y$Y$Y$U$J$U$J$U$U$U$U$U$U$U$J$J$Y$Y$Y$Y$Y$Y$Y
      $J$U$U$J$Y$Y$Y$Y$Y$Y$J$U$U$U$U$U$U$U$U$U$J$J$Y$Y$Y$Y$Y$Y$Y
      $J$U$U$J$U$Y$Y$Y$Y$J$U$U$U$U$U$U$U$U$U$U$J$Y$Y$Y$Y$Y$Y$Y
    $J$J$U$U$J$J$U$Y$Y$J$U$U$U$U$U$U$U$U$U$U$U$J$Y$Y$Y$Y$Y$Y$J
    $J$J$J$U$U$J$J$J$J$U$U$U$U$U$U$U$U$U$U$J$U$Y$Y$Y$Y$Y$Y$Y$J
    $J$J$J$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$Y$U$Y$Y$Y$Y$Y$J
    $J$J$J$J$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$Y$J
  $J$J$J$J$J$J$J$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$J$J$U$U$J
$J$J$J$J$J$J$J$J$J$J$J$J$J$J$U$U$U$U$U$U$U$U$U$J$J$U$U$J
$J$U$J$U$J$J$J$J$J$J$J$J$J$J$J$J$J$J$U$U$U$J$U$U$U$U$J
$U$J$U$J$U$J$U$J$J$J$J$J$J$J$U$U$U$U$U$U$U$J$J$U$J$J
$J$U$J$U$J$U$J$U$J$U$J$U$U$U$U$U$U$U$U$U$U$Y$Y$J
$U$U$U$J$U$J$U$J$U$J$U$U$U$U$U$U$U$J$J$J$Y$Y
$U$U$U$U$U$U$J$U$U$U$U$U$U$U$U$U$J
$U$U$U$U$U$U$U$U$U$U$U$U$U$U$U$J
$U$U$U$U$U$U$U$U$U$U$U$U$U$U$J
$U$U$U$U$U$U$U$U$U$U$U$U$J$J$J$J"
echo -en "${NAXTU}"
}

_CursorInvisible; clear;
while :; do NAXTU; _Sleep 11.4514; clear; done