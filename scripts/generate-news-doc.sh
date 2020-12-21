#!/bin/bash

while read line
do
filename=$(echo $line | sed 's/.*\s//g');
filesize=$(echo $line | sed 's/\s.*//g');
echo filename: $filename
echo filesize: $filesize
done < /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list
