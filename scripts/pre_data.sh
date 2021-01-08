#!/bin/bash
inputfile = $1
i=0
p=0
outputfile="${inputfile}.pre.part${p}"
echo "writing part %p."

while read line
do
let i++
if [ `expr $i % 300000` -eq 0 ]
then
	let p++
    outputfile="${inputfile}.pre.part${p}"
    echo "writing part %p."
fi
echo $line | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' | sed 's/\xef\xbb\xbf/ /g' | sed 's/^【[0-9]\{8\}，[^【】]\+】//g' | sed 's/[^。！？!?]$/\0\n/g' | sed 's/[。！？!?]/\0\n/g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' > $outputfile

if [ `expr $i % 10000` -eq 0 ]
then
    echo "processed $i input lines."
fi

done < $inputfile

echo "done pre data from $inputfile."

