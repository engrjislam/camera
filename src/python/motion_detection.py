from pi_cam_mot_det import is_motion_detected
from picture import take_picture


while True:
    is_mot_det = is_motion_detected()
    print(is_mot_det)
    
    if is_mot_det:
        take_picture()
