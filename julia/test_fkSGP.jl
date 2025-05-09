using LinearAlgebra
using SparseArrays
using Random
using Printf
include("solver_fkSGP.jl")



function test_fkSGP()

    # 6-6 SGP
    X = [zeros(1,3); 4*rand(5,3).-2]
    x = [zeros(1,3); 4*rand(5,3).-2]
    L = 2.5*rand(6).+0.5

    # 6-5 SGP
    #x[6,:] = x[5,:]

    # 6P-6 SGP
    #X[:,3] .= 0

    # 40 real roots by P. Dietmaier
    #X = [0 0 0; 1.107915 0 0; 0.549094 0.756063 0; 0.735077 -0.223935 0.525991; 0.514188 -0.526063 -0.368418; 0.590473 0.094733 -0.205018]
    #x = [0 0 0; 0.542805 0 0; 0.956919 -0.528915 0; 0.665885 -0.353482 1.402538; 0.478359 1.158742 0.107672; -0.137087 -0.235121 0.353913]
    #L = [1; 0.645275; 1.086284; 1.503439; 1.281933; 0.771071].^2

    Rt,err = solver_fkSGP(X,x,L)

    return Rt,err

end

Rt,err = test_fkSGP();

for i in 1:size(Rt,1)
    @printf "\n%s%d:\n" "Solution #" i
    display(Rt[i,:,:])
end
@printf "\n%s%g\n" "Error: " err