#!/bin/bash
echo "Content-type: text/html"
echo ""

eval $(echo "$QUERY_STRING"|awk -F'&' '{for(i=1;i<=NF;i++){print $i}}')
id=`/bin/busybox httpd -d $id`
qlty=`/bin/busybox httpd -d $qlty`
delay=`/bin/busybox httpd -d $delay`

echo "<pre>"
/usr/local/bin/youplay.sh $id $qlty $delay
echo "</pre>"

