v4front="http://192.168.100.200/drcom/logout?callback=dr1002&jsVersion=4.1&v="
v4back="&lang=zh"
v4random=$((RANDOM%10000))
v4all=$v4front$v4random$v4back
#echo $v4all
curl $v4all >> logout.log 2>&1

