from picamera import PiCamera
from datetime import datetime
from subprocess import call, check_output
import os


pwd = os.getcwd()
pictures = os.path.join(pwd, '../../', 'pictures')


def take_picture():
    current_time = datetime.now()
    filename= current_time.strftime("%Y.%m.%d-%H:%M:%S")

    image = os.path.join(pictures, filename+'.jpg')

    with PiCamera() as camera:
        camera.capture(image)

    font = 32
    color = "red"

    width = check_output(["w=$(identify -format %s %s); echo $w" % ("'%w'", image)], shell=True).decode('utf-8')
    height = check_output(["h=$(identify -format %s %s); echo $h" % ("'%h'", image)], shell=True).decode('utf-8')

    width, height = int(width), int(height)
    width, height = width/2 - 20*16/2, height - height/10

    command = "convert %s -pointsize %i -fill %s -annotate +%i+%i %s %s" % (image, font, color, width, height, filename, image)
    call([command], shell=True)
