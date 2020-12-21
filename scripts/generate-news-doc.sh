#!/bin/bash

outfile=/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news.txt
while read line
do

filename=$(echo $line | sed 's/.*\s//g')
filesize=$(echo $line | sed 's/\s.*//g')

if [[ $filesize -gt 5 ]]
then
	head -1 $filename >> $outfile
fi

done < /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list
