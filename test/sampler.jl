@testset "$(model.f)" for model in DynamicPPL.TestUtils.DEMO_MODELS
    N = 1000
    chain_init = sample(model, SampleFromUniform(), N; progress=false)

    for vn in keys(first(chain_init))
        if AbstractPPL.subsumes(@varname(s), vn)
            # `s ~ InverseGamma(2, 3)` and its unconstrained value will be sampled from Unif[-2,2].
            dist = InverseGamma(2, 3)
            b = DynamicPPL.link_transform(dist)
            @test mean(mean(b(vi[vn])) for vi in chain_init) ≈ 0 atol = 0.11
        elseif AbstractPPL.subsumes(@varname(m), vn)
            # `m ~ Normal(0, sqrt(s))` and its constrained value is the same.
            @test mean(mean(vi[vn]) for vi in chain_init) ≈ 0 atol = 0.11
        else
            error("Unknown variable name: $vn")
        end
    end
end
