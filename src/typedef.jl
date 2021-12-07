abstract type AbstractBlockHankel{T<:Number} <: AbstractMatrix{T} end

function size(A::AbstractBlockHankel)
    (size(A, 1), size(A, 2))
end

function getindex(A::AbstractBlockHankel, i::Integer)
    return A[mod(i - 1, size(A, 1)) + 1, div(i - 1, size(A, 1)) + 1]
end
struct BlockHankel{T<:Number} <: AbstractBlockHankel{T}
    w::Vector{Vector{T}}
    N = length(w)                                                                       # Length of the discrete-time vector signal
    m = length(w[1])                                                                    # Dimension of the (discrete-time) signal
    function BlockHankel{T}(w::Vector{Vector{T}},l::S) where {T<:Number,S<:Unsigned}    # w ... vector of vectors, l ... # of block rows  
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
