module Example20182

greet() = print("Hello World!")

export Point
struct Point{T}
	x::T
	y::T
end

function Base. +(p::Point, q::Point)
	Point(p.x+q.x, p.y+q.y)
end


export MPoint
mutable struct MPoint{T}
    x::T
    y::T
end


#############################

export Polynomial
struct Polynomial{T}
    coeffs::Vector{T}
end

export evaluate
function evaluate(p::Polynomial,x)
    sum(c * x^(i-1) for (i,c) in enumerate(p.coeffs))
end

function Base. +(p::Polynomial,q::Polynomial)
    l=max(length(p.coeffs),length(q.coeffs))
    k = convert(typeof(p.coeffs),zeros(l))
    for i in 1:l
        k[i]=p.coeffs[i]+q.coeffs[i]
    end

    Polynomial(k)
end

end # module
