using LinearAlgebra
using SparseArrays
using Random
using Printf
include("solver_fkSGP.jl")



function test_fkSGP()

    # 6-6 SGP
    X = [zeros(1,3); 4*rand(5,3).-2]
    x = [zeros(1,3); 4*rand(5,3).-2]

    p = randn(3,1)
    T = [0 -p[3] p[2]; p[3] 0 -p[1]; -p[2] p[1] 0]
    Rgt = (I - T)/(I + T)
    tgt = randn(3,1)
    A = Rgt*x' + repeat(tgt,1,6) - X'
    L = vec(sum(A.*A, dims=1)) # squared leg lengths

    realOnly = 1

    tm = @elapsed Rt,err = solver_fkSGP(X,x,L,realOnly)

    return Rt,[Rgt tgt],err,tm

end

Rt,Rtgt,err,tm = test_fkSGP()

for i in axes(Rt,1)
    @printf "\nSolution #%d:\n" i
    display(Rt[i,:,:])
    @printf "\nError: %.6g\n" err[i]
end
@printf "\nGround truth:\n"
display(Rtgt)
@printf "\nTime: %.2f ms\n" 1e3*tm