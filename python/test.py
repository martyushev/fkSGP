import numpy as np
from time import time
from python import *



def test():
    
    sgpType = 1
    # 1:   general 6-6 (|^6) SGP
    # 2:   semi-planar 6P-6 (|^6) SGP
    # 3:   fully planar 6P-6P (|^6) SGP
    # 4:   general 6-5 (/\ |^4) SGP
    # 5:   semi-planar 6P-5 (/\ |^4) SGP
    # 6:   fully planar 6P-5P (/\ |^4) SGP
    # 100: general 6-6 (|^6) SGP with 40 real postures (by P. Dietmaier)

    motionType = 1
    # 1:   generic motion
    # 2:   pure translation
    # 3:   pure z-translation

    realOnly = 1
    # 0: return all complex postures
    # 1: return real postures only

    sgp = genSGP(sgpType,motionType)

    tic = time()
    solver_func = globals().get(sgp['solver'])
    Rt,err = solver_func(sgp['X'],sgp['x'],sgp['L'],realOnly)
    tm = time()-tic

    for i in range(Rt.shape[0]):
        print(f"{'\nSolution #':s}{i+1:d}:")
        print(Rt[i,:,:])
        print(f"{'Error:':s} {err[i]:.6g}")
    print(f"{'\nGround truth:':s}")
    print(np.hstack((sgp['Rgt'],sgp['tgt'].reshape(3,1))))
    print(f"{'\nTime:':s} {10**3*tm:.2f} {'ms':s}")