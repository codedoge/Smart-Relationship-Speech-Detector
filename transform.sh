#!/bin/bash

mp3dir=`pwd`
outdir="./wav"

if [ -n "$1" ]; then
	mp3dir=$1
fi

if [ "$1" == "-h" ]; then
	echo "Usage: `basename $0` [mp3 dir]"
	echo "    default mp3 dir is the local directory"
	exit 0
fi

if [ -n "$2" ]; then
	outdir=$2
fi

echo "Creating output wav dir $outdir"
mkdir -p $outdir

for file in $mp3dir/*.mp3; do
    filename=$(basename "$file")
    filenameNoExt="${filename%.*}"
    echo "Converting file $filename to $outdir/${filenameNoExt}.wav"
    ffmpeg -y -v 0 -i $file "$outdir/$filenameNoExt.wav"
done
