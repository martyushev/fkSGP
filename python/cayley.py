import numpy as np



# rotation matrix by Cayley transform
def cayley(p):
    id = np.eye(3)
    T = np.array([[0, -p[2], p[1]], [p[2], 0, -p[0]], [-p[1], p[0], 0]])
    R = np.linalg.solve(id - T, id + T)
    return R.T