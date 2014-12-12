#!/bin/sh

account=''
domain=''
password=''
workpath=""

if [ ! -e $workpath/current_ip ]; then
    echo '0.0.0.0'>$workpath/current_ip
    current_ip='0.0.0.0'
else
    current_ip=`cat $workpath/current_ip`
fi

new_ip=`curl http://ieserver.net/ipcheck.shtml 2>/dev/null`

if [ $current_ip != $new_ip ]
then
    curl "http://ieserver.net/cgi-bin/dip.cgi?username=$account&domain=$domain&password=$password&updatehost=1"
fi

echo $new_ip>$workpath/current_ip
