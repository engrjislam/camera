#!/bin/sh

# create 'pictures' directory if not exists
# https://stackoverflow.com/questions/793858/how-to-mkdir-only-if-a-directory-does-not-already-exist

script=$0
basepath=$1
directory=$2

if [ "$directory" = "pictures" -o "$directory" = "videos" ]; then
    mkdir -p $basepath/$directory
    #echo $directory created under $basepath
else
    echo "$script requires an argument (pictures/videos)"
fi