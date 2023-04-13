using LinearAlgebra
using SparseArrays

struct Gate
	name::String
	matrix::SparseMatrixCSC{ComplexF64, Int64}
end

function xgate()
	return Gate("X", sparse([0 1; 1 0]))
end

function ygate()
	return Gate("Y", sparse([0 -im; im 0]))
end

function zgate()
	return Gate("Z", sparse([1 0; 0 -1]))
end

function hadamardgate()
	return Gate("H", sparse([1 1; 1 -1]/sqrt(2)))
end

function cxgate(n::Int, control::Int, target::Int)
	matrices = []

	if control == target
		throw(ArgumentError("Control and target cannot be the same"))
	end
	if control > n || target > n
		throw(ArgumentError("Control and target must be in range of qubits"))
	end
	if control < 1 || target < 1
		throw(ArgumentError("Control and target must be in range of qubits"))
	end

	for i in 1:n
		if i == control
			push!(matrices, sparse([1.0; 0.0]) * transpose(sparse([1.0; 0.0])))
		elseif i == target
			push!(matrices, sparse(Matrix{Float64}(I, 2, 2)))
		else
			push!(matrices, sparse(Matrix{Float64}(I, 2, 2)))
		end
	end

	first = kron(matrices...)

	matrices[control] = sparse([0.0; 1.0]) * transpose(sparse([0.0; 1.0]))
	matrices[target] = sparse([0.0 1.0; 1.0 0.0])

	second = kron(matrices...)
	return Gate("CX", first + second)
end

function cygate(n::Int, control::Int, target::Int)
	matrices = []

	if control == target
		throw(ArgumentError("Control and target cannot be the same"))
	end
	if control > n || target > n
		throw(ArgumentError("Control and target must be in range of qubits"))
	end
	if control < 1 || target < 1
		throw(ArgumentError("Control and target must be in range of qubits"))
	end

	for i in 1:n
		if i == control
			push!(matrices, sparse([1.0; 0.0]) * transpose(sparse([1.0; 0.0])))
		elseif i == target
			push!(matrices, sparse(Matrix{Float64}(I, 2, 2)))
		else
			push!(matrices, sparse(Matrix{Float64}(I, 2, 2)))
		end
	end
	first = kron(matrices...)

	matrices[control] = sparse([0.0; 1.0]) * transpose(sparse([0.0; 1.0]))
	matrices[target] = sparse([0.0 -im; im 0.0])

	second = kron(matrices...)
	return Gate("CY", first + second)
end

function czgate(n::Int, control::Int, target::Int)
	matrices = []
	if control == target
		throw(ArgumentError("Control and target cannot be the same"))
	end
	if control > n || target > n
		throw(ArgumentError("Control and target must be in range of qubits"))
	end
	if control < 1 || target < 1
		throw(ArgumentError("Control and target must be in range of qubits"))
	end
	for i in 1:n
		if i == control
			push!(matrices, sparse([1.0; 0.0]) * transpose(sparse([1.0; 0.0])))
		elseif i == target
			push!(matrices, sparse(Matrix{Float64}(I, 2, 2)))
		else
			push!(matrices, sparse(Matrix{Float64}(I, 2, 2)))
		end
	end
	first = kron(matrices...)

	matrices[control] = sparse([0.0; 1.0]) * transpose(sparse([0.0; 1.0]))
	matrices[target] = sparse([1.0 0.0; 0.0 -1.0])

	second = kron(matrices...)
	return Gate("CZ", first + second)
end