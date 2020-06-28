#!/bin/sh

PWD=$(pwd)

basepath=$(cd .. && cd .. && pwd)
directory=videos 

$PWD/create_dir.sh $basepath $directory

now=$(date +'%Y.%m.%d-%H:%M:%S')
format=$(date +'%Y%m%d%H%M%S')
file=$format

raspivid -o $basepath/$directory/$file.h264

$PWD/convert_mp4.sh $basepath/$directory/$file.h264 \
$basepath/$directory/$now.mp4

rm $basepath/$directory/$file.h264
