import Base.+, Base.-, Base./, Base.*, Base.^

function evaluate(f::Undefined_Function, point::Float64)
    error("Evaluation of an undefined function is not permitted.")
end
function derivative(f::Undefined_Function)
    return f
end
function indefinite_integral(f::Undefined_Function)
    return f
end

function max(f::UnivariateFunction, f2::Undefined_Function)
    return f2
end
function min(f::Undefined_Function, f2::UnivariateFunction)
    return f
end
function min(f::UnivariateFunction, f2::Undefined_Function)
    return f2
end

function +(f::Undefined_Function, number::Float64)
    return f
end
function -(f::Undefined_Function, number::Float64)
    return f
end
function *(f::Undefined_Function, number::Float64)
    return f
end
function /(f::Undefined_Function, number::Float64)
    return f
end
function +(f::Undefined_Function, number::Integer)
    return f
end
function -(f::Undefined_Function, number::Integer)
    return f
end
function *(f::Undefined_Function, number::Integer)
    return f
end
function /(f::Undefined_Function, number::Integer)
    return f
end
function ^(f::Undefined_Function, number::Integer)
    return f
end

function +(f1::Undefined_Function, f2::Undefined_Function)
    return f1
end
function +(f1::Undefined_Function, f2::PE_Function)
    return f1
end
function +(f1::Undefined_Function, f2::Sum_Of_Functions)
    return f1
end
function +(f1::Undefined_Function, f2::Piecewise_Function)
    return f1
end

function +(f1::PE_Function, f2::Undefined_Function)
    return +(f2,f1)
end
function +(f1::Sum_Of_Functions, f2::Undefined_Function)
    return +(f2,f1)
end
function +(f1::Piecewise_Function, f2::Undefined_Function)
    return +(f2,f1)
end

function -(f1::Undefined_Function, f2::Undefined_Function)
    return f1
end
function -(f1::Undefined_Function, f2::PE_Function)
    return f1
end
function -(f1::Undefined_Function, f2::Sum_Of_Functions)
    return f1
end
function -(f1::Undefined_Function, f2::Piecewise_Function)
    return f1
end

function -(f1::PE_Function, f2::Undefined_Function)
    return -(f2,f1)
end
function -(f1::Sum_Of_Functions, f2::Undefined_Function)
    return -(f2,f1)
end
function -(f1::Piecewise_Function, f2::Undefined_Function)
    return -(f2,f1)
end

function *(f1::Undefined_Function, f2::Undefined_Function)
    return f1
end
function *(f1::Undefined_Function, f2::PE_Function)
    return f1
end
function *(f1::Undefined_Function, f2::Sum_Of_Functions)
    return f1
end
function *(f1::Undefined_Function, f2::Piecewise_Function)
    return f1
end

function *(f1::PE_Function, f2::Undefined_Function)
    return *(f2,f1)
end
function *(f1::Sum_Of_Functions, f2::Undefined_Function)
    return *(f2,f1)
end
function *(f1::Piecewise_Function, f2::Undefined_Function)
    return *(f2,f1)
end

function /(f1::Undefined_Function, f2::Undefined_Function)
    return f1
end
function /(f1::Undefined_Function, f2::PE_Function)
    return f1
end
function /(f1::Undefined_Function, f2::Sum_Of_Functions)
    return f1
end
function /(f1::Undefined_Function, f2::Piecewise_Function)
    return f1
end

function /(f1::PE_Function, f2::Undefined_Function)
    return /(f2,f1)
end
function /(f1::Sum_Of_Functions, f2::Undefined_Function)
    return /(f2,f1)
end
function /(f1::Piecewise_Function, f2::Undefined_Function)
    return /(f2,f1)
end