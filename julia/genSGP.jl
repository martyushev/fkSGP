# generate SGP
function genSGP(sgpType::Int)

    X = [zeros(1,3); 4*rand(5,3).-2]
    x = [zeros(1,3); 4*rand(5,3).-2]

    if sgpType == 1
        L,Rgt,tgt = Xx2L(X,x)
        solver = "solver66"
    elseif sgpType == 2
        X[:,3] .= 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = "solver66"
    elseif sgpType == 3
        X[:,3] .= 0
        x[:,3] .= 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = "solver6p6p"
    elseif sgpType == 4
        x[6,:] = x[5,:]
        L,Rgt,tgt = Xx2L(X,x)
        solver = "solver66"
    elseif sgpType == 5
        x[6,:] = x[5,:]
        X[:,3] .= 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = "solver66"
    elseif sgpType == 6
        x[6,:] = x[5,:]
        X[:,3] .= 0
        x[:,3] .= 0
        L,Rgt,tgt = Xx2L(X,x)
        solver = "solver6p6p"
    elseif sgpType == 100
        X = [0 0 0; 1.107915 0 0; 0.549094 0.756063 0; 0.735077 -0.223935 0.525991; 0.514188 -0.526063 -0.368418; 0.590473 0.094733 -0.205018]
        x = [0 0 0; 0.542805 0 0; 0.956919 -0.528915 0; 0.665885 -0.353482 1.402538; 0.478359 1.158742 0.107672; -0.137087 -0.235121 0.353913]
        L = [1; 0.645275; 1.086284; 1.503439; 1.281933; 0.771071].^2
        Rgt = [-0.040450357031281 -0.932229494397471 0.359599691867884; 0.983337493748685 0.026695523074364 0.179818582009314; -0.177231887661606 0.360881585597300 0.915616371179918]
        tgt = [0.955868038233880; -0.046995628998516; -0.290013283037649]
        solver = "solver66"
    else
        error("Invalid sgpType")
    end

    return (X = X, x = x, L = L, Rgt = Rgt, tgt = tgt, solver = solver)

end



function Xx2L(X,x)

    Rgt = cayley(randn(3,1));
    tgt = randn(3,1);
    A = Rgt*x' + repeat(tgt,1,6) - X'
    L = vec(sum(A.*A, dims=1)) # squared leg lengths

    return L,Rgt,tgt

end