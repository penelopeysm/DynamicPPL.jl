using Accessors
using ADTypes
using DynamicPPL
using AbstractMCMC
using AbstractPPL
using Bijectors
using DifferentiationInterface
using Distributions
using DistributionsAD
using Documenter
using ForwardDiff
using LogDensityProblems, LogDensityProblemsAD
using MacroTools
using MCMCChains
using Mooncake: Mooncake
using StableRNGs
using Tracker
using ReverseDiff
using Zygote
using Compat

using Distributed
using LinearAlgebra
using Pkg
using Random
using Serialization
using Test
using Distributions
using LinearAlgebra # Diagonal

using JET: JET

using Combinatorics: combinations
using OrderedCollections: OrderedSet

using DynamicPPL: getargs_dottilde, getargs_tilde, Selector

Random.seed!(100)

include("test_util.jl")

@testset "DynamicPPL.jl" begin
    include("sampler.jl")
end
