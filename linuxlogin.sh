v4front="http://192.168.100.200/drcom/login?callback=dr1003&DDDDD=2020051001"
v4middle1="&upass=051001@cmd"
v4middle2="&0MKKey=123456&R1=0&R2=&R3=0&R6=0&para=00&v6ip=&terminal_type=1&lang=zh-cn&jsVersion=4.1&v="
v4back="&lang=zh"
v4random=$((RANDOM%10000))
v4all=$v4front$v4middle1$v4middle2$v4random$v4back

v6front="http://192.168.100.200/1.htm?mv6="
v6back=$(ip -6 address show | grep inet6 |grep "global temporary dynamic" | awk '{print $2}' | cut -d'/' -f1)
v6all=$v6front$v6back

echo $v4all
echo $v6all

#wget $v4all >> v4login.log 2>&1
#wget $v6all >> v6login.log 2>&1
#curl $v4all >> v4login.log 2>&1
#curl $v6all >> v6login.log 2>&1
