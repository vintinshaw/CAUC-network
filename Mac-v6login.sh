v6front="http://192.168.100.200/1.htm?mv6="
v6back=$(ifconfig | grep "autoconf temporary"|awk 'END{print}'|awk '{print $2}')
v6all=$v6front$v6back
#echo $v6all
curl --interface en13 $v6all >> v6login.log 2>&1
