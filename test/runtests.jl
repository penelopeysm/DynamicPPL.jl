using AbstractMCMC
using AbstractPPL
using Distributions
using DynamicPPL
using Random
using Test
using Turing

Random.seed!(100)

include("models.jl")

samplers = {
    "SampleFromUniform" => SampleFromUniform(),
    "NUTS" => NUTS()
}

@testset verbose = true "DynamicPPL.jl" begin
    @testset verbose = true "$(model.f)" for model in MODELS
        @testset "$(k)" for (k, v) in samplers
            chain_init = sample(model, v, 100; progress=false)
        end
    end
end
