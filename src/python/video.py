from picamera import PiCamera
from time import sleep
from subprocess import call
import os


pwd = os.getcwd()
videos = os.path.join(pwd, '../../', 'videos')
video = os.path.join(videos, 'video.h264')

with PiCamera() as camera:
    camera.start_recording(video)
    sleep(5)
    camera.stop_recording()

converted_video = os.path.join(videos, 'converted_video.mp4')
command = "MP4Box -add %s %s" % (video, converted_video)

call([command], shell=True)

# remove original file
#call(["rm %s" % video], shell=True)

if os.path.exists(video):
    os.remove(video)