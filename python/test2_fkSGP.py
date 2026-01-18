import numpy as np
from time import time
from python import *



def test2_fkSGP():
    
    # 6-6 SGP
    X = np.concatenate((np.zeros((1,3)),4*np.random.rand(5,3)-2),axis=0)
    x = np.concatenate((np.zeros((1,3)),4*np.random.rand(5,3)-2),axis=0)

    p = np.random.randn(3)
    id = np.eye(3)
    T = np.array([[0, -p[2], p[1]], [p[2], 0, -p[0]], [-p[1], p[0], 0]])
    Rgt = np.linalg.solve(id - T, id + T)
    tgt = np.random.randn(3)
    A = Rgt@x.T + np.tile(tgt,(6,1)).T - X.T
    L = np.sum(A*A, axis=0) # squared leg lengths

    realOnly = 1

    tic = time()
    Rt,err = solver_fkSGP(X,x,L,realOnly)
    tm = time()-tic

    for i in range(Rt.shape[0]):
        print(f"{'Solution #':s}{i+1:d}:")
        print(Rt[i,:,:],'\n')
        print(f"{'Error:':s} {err[i]:.6g}",'\n')
    print(f"{'Ground truth:':s}")
    print(np.hstack((Rgt,tgt.reshape(3,1))),'\n')
    print(f"{'Time:':s} {10**3*tm:.2f} {'ms':s}")