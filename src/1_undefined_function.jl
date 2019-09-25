import Base.+, Base.-, Base./, Base.*, Base.^
import SchumakerSpline.evaluate
function evaluate(f::Undefined_Function, point::Real)
    missing
end
function (s::Undefined_Function)(x::Union{Real,Date})
    return evaluate(s, x)
end

function derivative(f::Undefined_Function)
    return f
end
function indefinite_integral(f::Undefined_Function)
    return f
end

function +(f::Undefined_Function, number::Real)
    return f
end
function -(f::Undefined_Function, number::Real)
    return f
end
function *(f::Undefined_Function, number::Real)
    return f
end
function /(f::Undefined_Function, number::Real)
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
