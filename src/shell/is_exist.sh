#! /bin/sh

s=$(/opt/vc/bin/vcgencmd get_camera)

sb="supported=1 detected=1"

case $sb in
	$s)
		echo "Camera detected"
		;;
	*)
		echo "Camera not detected $sb not in $"
		;;
esac
