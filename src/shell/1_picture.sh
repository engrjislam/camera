#!/bin/sh

PWD=$(pwd)

basepath=$(cd .. && cd .. && pwd)
directory=pictures 

$PWD/create_dir.sh $basepath $directory

format=$(date +'%Y.%m.%d-%H:%M:%S')
image=$format.jpg

raspistill -o $basepath/$directory/$image

$PWD/add_timestamp.sh $basepath/$directory/$image $format