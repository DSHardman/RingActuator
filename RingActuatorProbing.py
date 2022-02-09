import kg_robot as kgr
import time
import numpy as np

urnie = kgr.kg_robot(port=30010, db_host="169.254.150.50")

# Ring Actuator Probing
surface = [0.384663, -0.131029, 0.080446, 2.87706, 1.1823, -0.0543273]
up = np.add(surface, [0, 0, 0.02, 0, 0, 0])
down = np.add(surface, [0, 0, -0.01, 0, 0, 0])
down2 = np.add(surface, [0, 0, -0.015, 0, 0, 0])
urnie.movel(up, acc=0.1, vel=0.05)
urnie.movel(surface, acc=0.1, vel=0.05)
time.sleep(2)
urnie.movel(down, acc=0.1, vel=0.05)
time.sleep(2)
urnie.movel(down2, acc=0.1, vel=0.05)
time.sleep(2)
urnie.movel(down, acc=0.1, vel=0.05)
time.sleep(2)
urnie.movej_rel([0, 0, 0, 0, 0.1, 0], acc=0.1, vel=0.05)
time.sleep(2)
urnie.movel(down, acc=0.1, vel=0.05)
time.sleep(2)
urnie.movej_rel([0, 0, 0, 0, -0.1, 0], acc=0.1, vel=0.05)
time.sleep(2)
urnie.movel(down, acc=0.1, vel=0.05)
time.sleep(2)
urnie.movel(up, acc=0.1, vel=0.05)

urnie.close()