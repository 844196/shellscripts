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


PALETTE_a="48;5;232m";
PALETTE_b="48;5;238m";
PALETTE_c="48;5;244m";
PALETTE_d="48;5;254m";
PALETTE_e="48;5;22m";
PALETTE_f="48;5;34m";
PALETTE_g="48;5;17m";
PALETTE_N="m";
PALETTE_Z="m\n";

VIM_ICON="NNNNNNNNNNNNNNNNaaZNNNNNNNNNNNNNNaffaZNNNNaaaaaaaaaafeefaNaaaaaaaaZNNNaddddddddddaeeefaddddddddaZNNNadccccccccccaeeeacccccccccaZNNNNacccccccccbbaeeeacccccccbbaZNNNNNabccccccbbaeeeeadbccccbbaZNNNNNadccccccbaeeeeeadccccbbaZNNNNNadccccccbaeeeeaddcccbbaZNNNNNadccccccbaeeeaddcccbbaZNNNNNadccccccbaeeaddcccbbaaZNNNNaadcccccbaeeaddcccbbaegaZNNNafadcccccbaeaddccccbaeeeeaZNNafeadcccccbaaddccccbaeeeeegaZNafeeadcccccbaddcccccbaeeeeeegaZafeeeadcccccbddccccbbaeeeeeeeegaZafeeeadcccccbdccccbbaeeeeeeeeegaZNafeadccccccbccccbbaeeeeeeeeegaZNNafadccccccccccbbaeeeeeeeeegaZNNNaadcccccccccbbaeeeeeeeeegaZNNNNadcccccccccbaeeeeeeeeegaZNNNNadccccccccbaeeeeeeeeegaZNNNNadcccccccbbaeeeeeeeegaZNNNNadccccccbbaeeeeeeeegaZNNNNadcccccbbaeeeeeeeegaZNNNNadccccbbaeeeeeeeegaZNNNNadcccbbaeeeeeeeegaZNNNNadcccbaaeeeeeeegaZNNNNNaccbbaNageeeegaZNNNNNNabbaNNNageegaZNNNNNNNaaNNNNNaggaZNNNNNNNNNNNNNNNaaNZN";

for i in {0..870}; do
    echo -en "\033[$(eval 'echo $PALETTE_'${VIM_ICON:$i:1})  ";
    [ "$i" = "870" ] && echo '';
done;