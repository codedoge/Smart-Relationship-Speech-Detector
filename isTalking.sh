#!/bin/bash

dir=`pwd`
outfile="speech.csv"

if [ -n "$1" ]; then
	dir=$1
fi

if [ "$1" == "-h" ]; then
	echo "Usage: `basename $0` [wav dir] [resultfile]"
	echo "    default wav dir is local directory"
	echo "    default result file is results.csv"
	exit 0
fi

if [ -n "$2" ]; then
	outfile=$2
fi

echo "Checking files in $dir"
rm -f $outfile

for file in $1/*.wav; do
#	echo "Evaluating $file"
	result=`./VAD_test.exe -m 2 $file 2>> /dev/null`
	filename=$(basename $file)
	echo "$filename: $result"
	echo "${filename%.*},$result" >> $outfile
done
