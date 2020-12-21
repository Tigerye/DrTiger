#!/bin/bash

outfile=/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.txt
while read line
do

filename=$(echo $line | sed 's/.*\s//g')
filesize=$(echo $line | sed 's/\s.*//g')

if [ $filesize -gt 5 ]
then
	IFS='/' read -r -a array <<< "$line"
	year=${array[9]}
	source=${array[10]}
	line1=`head -1 $filename`
	content=`echo $line1 ｜ sed 's/^\s*//g' | sed 's/\s*$//g'`
	echo "【$year，$source】$content" >> $outfile
fi

done < /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list
