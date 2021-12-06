abstract type AbstractBlockHankel{T<:Number} <: AbstractMatrix{T} end

struct BlockHankel{T<:Number} <: AbstractBlockHankel{T}
    w::Vector{Vector{T}}
    N = length(w)                                                       # The length of the discrete-time vector signal
    m = length(w[1])                                                    # The dimension of the (discrete-time )signal
    function BlockHankel{T}(w::Vector{Vector{T}},L::S) where {T<:Number,S<:Int}
        if first(vc) != first(vr)
            error("First element of the vectors must be the same")
        end
        return new{T}(w)
    end
end

