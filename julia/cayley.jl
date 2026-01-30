# rotation matrix by Cayley transform
function cayley(p)
    T = [0 -p[3] p[2]; p[3] 0 -p[1]; -p[2] p[1] 0]
    return (I - T)/(I + T)
end