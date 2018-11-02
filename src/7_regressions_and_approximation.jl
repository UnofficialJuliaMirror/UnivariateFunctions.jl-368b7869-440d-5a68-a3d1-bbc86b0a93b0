function create_ols_approximation(y::Array{Float64}, x::Array{Float64}, base_x::Float64 = 0.0, degree::Int = 1, intercept::Bool = true)
    obs = length(x)
    if length(y) != obs
        error("The number of observations is different in y and x")
    end
    if degree < 0
        error("Cannot approximate with OLS with a degree that is negative")
    end
    x = x .- base_x
    X = deepcopy(x)
    for i in 2:degree
        X = hcat(X, (x .^ i))
    end
    if intercept
        X = hcat(ones(obs), X)
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
