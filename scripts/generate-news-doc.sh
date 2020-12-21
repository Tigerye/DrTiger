#!/bin/bash

outfile=/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.txt
numfile=0
numgood=0
while read line
do
numfile=`expr $numfile + 1`

filename=$(echo $line | sed 's/.*\s//g')
filesize=$(echo $line | sed 's/\s.*//g')

if [ $filesize -gt 5 ]
then
	numgood=`expr $numgood + 1`
	IFS='/' read -r -a array <<< "$line"
	year=${array[9]}
	source=${array[10]}
	content=`cat $filename | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | awk '{print}' ORS=''`
	echo "【$year，$source】$content" >> $outfile
fi

if [ `expr $numfile % 1000` -eq 0 ]
then
    echo "processed $numfile files with $numgood big enough."
fi

done < /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list

echo "done process $numfile files with $numgood big enough."
