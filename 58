#!/bin/sh

pipe() {
    if [ -p /dev/stdin ]; then
        cat -
        exit 0
    else
        echo 
        exit 1
    fi
}
str=`pipe`

if [ -z $str ]; then
    str=$1
fi

echo "
                    ,.r-=
                 ((  -――-.(ｿ
               ／:::::::::::::ﾟ丶
              /::/ﾚﾍ::::;ヘ::i::|
            〈|::l  ┃   ┃  -!:j      $str
             ji〈 \"   ヮ   \"::/
               Ｖ\`ゥrr-.rｭｲ人人
                 ,/          i
          （￣）￣ ￣￣￣￣￣i.ﾉ￣￣＞＜
            ￣￣￣￣￣￣￣￣￣￣￣￣"
