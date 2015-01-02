#!/bin/bash
echo "Content-type: text/html"
echo ""

#eval $(echo "$QUERY_STRING"|awk -F'&' '{for(i=1;i<=NF;i++){print $i}}')
#tmp=`/system/bin/busybox httpd -d $id`
id="$(echo "$QUERY_STRING"|cut -d\= -f2)"

echo "<pre>"
echo "$id"
/usr/local/bin/youplay.sh $id
echo "</pre>"

