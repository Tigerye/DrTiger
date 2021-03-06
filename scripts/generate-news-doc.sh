#!/bin/bash

#usage: ./generate-news-doc.sh /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list /data/yechen/bert/news-2020-zh.txt

#outfile=/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.txt
outfile=$2
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
	year=${array[10]}
	source=${array[11]}
	content=`cat $filename | sed 's/\xC2\xA0//g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | sed 's/[\r\n]//g' |awk '{if(length($0)!=0){print}}' ORS=''`
	echo "【$year，$source】$content" >> $outfile
fi

if [ `expr $numfile % 1000` -eq 0 ]
then
    echo "processed $numfile files with $numgood big enough."
fi

#done < /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list
done < $1

echo "done process $numfile files with $numgood big enough."
