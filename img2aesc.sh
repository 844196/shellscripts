#!/bin/bash
#
#
#    Author:
#        sasairc (@sasairc2)
#
#    License
#        MIT
#

TEMP="/tmp"
FILE="te.png"
COLORS=16
WIDTH=80
HEIGHT=80

RGB=""

function init_color_scheme() {
	### ANSI Compat
	# Normal
	ANSI[0]="\033[48;5;0m  \033[m"		# Black
	ANSI[1]="\033[48;5;1m  \033[m"		# Red
	ANSI[2]="\033[48;5;2m  \033[m"		# Green
	ANSI[3]="\033[48;5;3m  \033[m"  	# Yellow
	ANSI[4]="\033[48;5;4m  \033[m"		# Blue
	ANSI[5]="\033[48;5;5m  \033[m"		# Magenta
	ANSI[6]="\033[48;5;6m  \033[m"		# Cyan
	ANSI[7]="\033[48;5;7m  \033[m"  	# White
	ANSI[8]="\033[48;5;8m  \033[m"		# Dark Gray

	# Bright
	ANSI[9]="\033[48;5;9m  \033[m"		# Red
	ANSI[10]="\033[48;5;10m  \033[m"  	# Green
	ANSI[11]="\033[48;5;11m  \033[m"	# Yellow
	ANSI[12]="\033[48;5;12m  \033[m"	# Blue
	ANSI[13]="\033[48;5;13m  \033[m"	# Magenta
	ANSI[14]="\033[48;5;14m  \033[m"	# Cyan
	ANSI[15]="\033[48;5;15m  \033[m"	# White

	### RGB(HEX)
	HEX[0]='000000'
	HEX[1]='ff0000'
	HEX[2]='00aa00'
	HEX[3]='aa5500'
	HEX[4]='0000aa'
	HEX[5]='aa00aa'
	HEX[6]='007f7f'
	HEX[7]='aaaaaa'
	HEX[8]='555555'
	HEX[9]='ff5555'
	HEX[10]='55ff55'
	HEX[11]='ffff55'
	HEX[12]='5555ff'
	HEX[13]='ff55ff'
	HEX[14]='55ffff'
	HEX[15]='ffffff'
}

#function declease_colors() {
#	convert "${ORIG}" -colors 16 "${TEMP}/img2eseq_temp.jpg"
#	test $? -ne 0 && echo "declease_colors() failed." 1>&2 && exit 1
#	return
#}

function get_rgb() {
local R=$(
printf "%02x" $(
convert ${FILE} -format "\
%[fx:int(255*p{$1,$2}.r)]\
" info:
	)
)

local G=$(
printf "%02x" $(
convert ${FILE} -format "\
%[fx:int(255*p{$1,$2}.g)]\
" info:
	)
)
local B=$(
printf "%02x" $(
convert ${FILE} -format "\
%[fx:int(255*p{$1,$2},b)]\
" info:
	)
)
	RGB=$(
			printf "$R$G$B"
		 )
}


function convert_main() {
	for ((i = 0; i < HEIGHT; i++)); do
		for ((j = 0; j < WIDTH; j++)); do
			get_rgb $j $i
			for ((k = 0; k < $COLORS; k++)); do
				test $RGB = ${HEX[$k]} && echo -ne "${ANSI[$k]}"
			done

		done
		printf "\n"
	done
}

init_color_scheme
convert_main