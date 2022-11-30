v6front="http://192.168.100.200/1.htm?mv6="
v6back=$(ip -6 address show | grep inet6 |grep "mngtmpaddr" | awk '{print $2}' | cut -d'/' -f1)
v6all=$v6front$v6back
echo $v6all
curl $v6all >> v6login.log 2>&1
