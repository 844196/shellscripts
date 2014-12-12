#!/bin/sh


str=$1

top_s="＿人"
top_e="＿"

mid="＞ ${str} ＜"

bottom_s="￣Ｙ"
bottom_e="￣"

printf "$top_s"
for t in `seq ${#str}`; do printf "人"; done
printf "$top_e\n"

echo $mid

printf "$bottom_s"
for b in `seq ${#str}`; do printf "Ｙ"; done
printf "$bottom_e"
