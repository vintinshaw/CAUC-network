#!/bin/bash

read -p "学号:" ID
read -p "密码:" -s password

v4front="http://192.168.100.200/drcom/login?callback=dr1003&DDDDD="
v4middle1="&upass="
v4middle2="&0MKKey=123456&R1=0&R2=&R3=0&R6=0&para=00&v6ip=&terminal_type=1&lang=zh-cn&jsVersion=4.1&v="
v4back="&lang=zh"
v4random=$((RANDOM%10000))
v4all=$v4front$ID$v4middle1$password$v4middle2$v4random$v4back

v6front="http://192.168.100.200/1.htm?mv6="
v6back=$(ifconfig | grep inet6 | grep temporary | head -n 1 | cut -d ' ' -f2)
v6all=$v6front$v6back

curl $v4all >> login.log 2>&1
read -r -p "是否同时认证IPv6 [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		curl $v6all >> login.log 2>&1
		;;

    [nN][oO]|[nN])
		echo "No"
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac
