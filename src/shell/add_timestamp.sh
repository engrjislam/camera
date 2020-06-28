#!/bin/sh

image=$1
shift;
message=$1

# adding timestamp to the image
w=$(identify -format '%w' $image)
h=$(identify -format '%h' $image)

# timestamp looks like 2020.06.26-12:12:12.jpg
# timestamp has 17 chars ([0-9a-zA-Z]) and 6 ([.-:]) symbols
# let, pixels required by 2 symbols is equal to pixels required by a char
# so, total of 20 (17+6/3) chars require to place on the image.
# now, let us assume that each chars require 16 pixels to fit on the image 

# so, half of the chars start half of image - total pixels require by half of timestamp
w=$(( w/2 - 20*16/2 ))
h=$(( h - h/10 ))

convert $image -pointsize 32 -fill red -annotate +$w+$h $message $image