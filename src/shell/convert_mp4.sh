#!/bin/sh

# convert to mp4
# https://www.youtube.com/watch?v=3DH_SryMwzs&list=PLNnwglGGYoTvy37TSGFlv-aFkpg7owWrE&index=16

old_video=$1
shift;
new_video=$1

MP4Box -add $old_video $new_video
