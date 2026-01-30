import numpy as np
from .cayley import cayley



# generate SGP
def genSGP(sgpType):

    X = np.vstack([np.zeros((1,3)),4*np.random.rand(5, 3)-2])
    x = np.vstack([np.zeros((1,3)),4*np.random.rand(5, 3)-2])

    if sgpType == 1:
        L,Rgt,tgt = Xx2L(X,x)
        solver = 'solver66'
    elif sgpType == 2:
        X[:,2] = 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = 'solver66'
    elif sgpType == 3:
        X[:,2] = 0
        x[:,2] = 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = 'solver6p6p'
    elif sgpType == 4:
        x[5,:] = x[4,:]
        L,Rgt,tgt = Xx2L(X,x)
        solver = 'solver66'
    elif sgpType == 5:
        x[5,:] = x[4,:]
        X[:,2] = 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = 'solver66'
    elif sgpType == 6:
        x[5,:] = x[4,:]
        X[:,2] = 0
        x[:,2] = 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = 'solver6p6p'
    elif sgpType == 100:
        X = np.array([[0, 0, 0], [1.107915, 0, 0], [0.549094, 0.756063, 0], [0.735077, -0.223935, 0.525991], [0.514188, -0.526063, -0.368418], [0.590473, 0.094733, -0.205018]])
        x = np.array([[0, 0, 0], [0.542805, 0, 0], [0.956919, -0.528915, 0], [0.665885, -0.353482, 1.402538], [0.478359, 1.158742, 0.107672], [-0.137087, -0.235121, 0.353913]])
        L = np.array([1, 0.645275, 1.086284, 1.503439, 1.281933, 0.771071])**2
        Rgt = np.array([[-0.040450357031281, -0.932229494397471, 0.359599691867884], [0.983337493748685, 0.026695523074364, 0.179818582009314], [-0.177231887661606, 0.360881585597300, 0.915616371179918]])
        tgt = np.array([0.955868038233880, -0.046995628998516, -0.290013283037649])
        solver = 'solver66';
    else:
        raise ValueError('Invalid sgpType')

    sgp = {
        'X': X,
        'x': x,
        'L': L,
        'Rgt': Rgt,
        'tgt': tgt,
        'solver': solver
    }

    return sgp



def Xx2L(X,x):

    Rgt = cayley(np.random.randn(3))
    tgt = np.random.randn(3)
    A = Rgt@x.T + np.tile(tgt,(6,1)).T - X.T
    L = np.sum(A*A,axis=0) # squared leg lengths

    return L,Rgt,tgt