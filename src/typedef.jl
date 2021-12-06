abstract type AbstractBlockHankel{T<:Number} <: AbstractMatrix{T} end

struct BlockHankel{T<:Number} <: AbstractBlockHankel{T}
    w::Vector{Vector{T}}
    N = length(w)                                                                   # The length of the discrete-time vector signal
    m = length(w[1])                                                                # The dimension of the (discrete-time) signal
    function BlockHankel{T}(w::Vector{Vector{T}},L::S) where {T<:Number,S<:Int}
        if first(vc) != first(vr)
            error("First element of the vectors must be the same")
        end
        return new{T}(w)
    end
end

function Matrix(A::AbstractBlockHankel{T}) where T
    m, n = size(A)
    Af = Matrix{T}(undef, m, n)
    for j = 1:n
        for i = 1:m
            Af[i,j] = A[i,j]
        end
    end
    return Af
end

convert(::Type{Matrix}, A::AbstractBlockHankel) = Matrix(A)
