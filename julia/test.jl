using LinearAlgebra
using SparseArrays
using Random
using Printf
include("cayley.jl")
include("genSGP.jl")
include("solver66.jl")
include("solver6p6p.jl")



function test()

    sgpType = 1
    # 1:   general 6-6 SGP
    # 2:   semi-planar 6P-6 SGP
    # 3:   fully planar 6P-6P SGP
    # 4:   general 6-5 SGP
    # 5:   semi-planar 6P-5 SGP
    # 6:   fully planar 6P-5P SGP
    # 100: general 6-6 SGP with 40 real postures (by P. Dietmaier)

    realOnly = 1
    # 0: return all complex postures
    # 1: return real postures only

    sgp = genSGP(sgpType)

    tm = @elapsed Rt,err = eval(Meta.parse(sgp.solver))(sgp.X,sgp.x,sgp.L,realOnly)

    return Rt,[sgp.Rgt sgp.tgt],err,tm

end

Rt,Rtgt,err,tm = test()

for i in axes(Rt,1)
    @printf "\nSolution #%d:\n" i
    display(Rt[i,:,:])
    @printf "Error: %.6g\n" err[i]
end
@printf "\nGround truth:\n"
display(Rtgt)
@printf "\nTime: %.2f ms\n" 1e3*tm