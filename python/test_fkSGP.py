import numpy as np
from python import *



def test_fkSGP():
    
    # 6-6 SGP
    X = np.concatenate((np.zeros((1,3)),4*np.random.rand(5,3)-2),axis=0)
    x = np.concatenate((np.zeros((1,3)),4*np.random.rand(5,3)-2),axis=0)
    L = 2.5*np.random.rand(6)+0.5

    # 6-5 SGP
    #x[5,:] = x[4,:]

    # 6P-6 SGP
    #X[:,2] = 0

    # 40 real roots by P. Dietmaier
    #X = np.array([[0, 0, 0], [1.107915, 0, 0], [0.549094, 0.756063, 0], [0.735077, -0.223935, 0.525991], [0.514188, -0.526063, -0.368418], [0.590473, 0.094733, -0.205018]])
    #x = np.array([[0, 0, 0], [0.542805, 0, 0], [0.956919, -0.528915, 0], [0.665885, -0.353482, 1.402538], [0.478359, 1.158742, 0.107672], [-0.137087, -0.235121, 0.353913]])
    #L = np.array([1, 0.645275, 1.086284, 1.503439, 1.281933, 0.771071])**2

    Rt,err = solver_fkSGP(X,x,L)

    for i in range(Rt.shape[0]):
        print(Rt[i,:,:],'\n')
    print(err)