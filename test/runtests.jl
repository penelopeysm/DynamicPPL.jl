using AbstractMCMC
using AbstractPPL
using Distributions
using DynamicPPL
using Random
using Test
using Turing

Random.seed!(100)

# no-op

@testset verbose = true "DynamicPPL.jl" begin
    @testset "$(model.f)" for model in DynamicPPL.TestUtils.DEMO_MODELS
        N = 1000
        chain_init = sample(model, NUTS(), N; progress=false)
    end
end
