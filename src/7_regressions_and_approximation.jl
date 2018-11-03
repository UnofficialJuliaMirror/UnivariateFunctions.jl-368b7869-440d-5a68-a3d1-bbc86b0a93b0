function create_ols_approximation(y::Array{Float64}, x::Array{Float64}, base_x::Float64 = 0.0, degree::Int = 1, intercept::Bool = true)
    obs = length(y)
    if degree < 0
        error("Cannot approximate with OLS with a degree that is negative")
    end
    x = x .- base_x
    if intercept
        X = ones(obs)
        for i in 1:degree
            X = hcat(X, (x .^ i))
        end
    else
        X = x
        for i in 2:degree
            X = hcat(X, (x .^ i))
        end
    end

    lm1 = fit(LinearModel,  hcat(X), y)
    beta = lm1.pp.beta0
    func_array = Array{PE_Function}(undef,convert(Int, intercept) + degree)
    if intercept
        func_array[1] = PE_Function(beta[1], 0.0, base_x, 0)
    end
    for d in 1:degree
        func_array[d+convert(Int, intercept)] = PE_Function(beta[d+convert(Int, intercept)], 0.0, base_x, d)
    end
    return Sum_Of_Functions(func_array)
end

function create_ols_approximation(y::Array{Float64}, x::Array{Date}, base_x::Date = global_base_date, degree::Int = 1, intercept::Bool = true)
    base = years_from_global_base.(base_x)
    xx   = years_from_global_base.(x)
    return create_ols_approximation(y, xx, base, degree, intercept)
end


func = tan
nodes = 3
left = 2.9
right = 3.8

function get_cholesky_coefficients(chebyshev::Sum_Of_Functions, y::Array{Float64}, normalised_nodes::Array{Float64})
    chebyshev_on_nodes = evaluate.(Ref(chebyshev), normalised_nodes)
    a = sum(y .* chebyshev_on_nodes) ./ sum(chebyshev_on_nodes .^2)
end


function create_chebyshev_approximation(func::Function, nodes::Int, degree::Int, left::Float64, right::Float64)
    # This is all after Algorithm 6.2 from Judd (1998) Numerical Methods in Economics.
    k = 1:nodes
    unnormalised_nodes = -cos.( (((2 .* k) .- 1) ./ (2 * nodes)) .* pi    )
    normalised_nodes = (unnormalised_nodes .+ 1) .* ((right-left)/2) .+ left
    y = func.(normalised_nodes)
    chebyshevs = get_chevyshevs_up_to(degree, true)
    a = get_cholesky_coefficients.(chebyshevs, Ref(y), Ref(normalised_nodes))

end
