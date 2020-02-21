@testset "Sixth order" begin
    @testset "Bits $i" for i in 13:14
        x = 0:1 << i
        y_approx = fpcos.(Int32.(x), Val(i))
        y = cos.(x / 1 << i * π / 2) .* 1 << i
        @test all(abs.(y_approx .- y) .< 2.5) # Check why not < 2.0
    end
end
