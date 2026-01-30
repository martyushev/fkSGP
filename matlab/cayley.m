% rotation matrix by Cayley transform
function R = cayley(p)
    T = [0 -p(3) p(2); p(3) 0 -p(1); -p(2) p(1) 0];
    R = (eye(3) - T)/(eye(3) + T);
end