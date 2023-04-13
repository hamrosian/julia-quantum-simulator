struct register
	state::Array{ComplexF64}
end

function zeroregister(n::Int64)
	#creates a register of n qubits in the 0 state
	x = zeros(ComplexF64, 2^n)
	x[1] = ComplexF64(1,0)
	return register(transpose(x))
end

function onesregister(n::Int64)
	#creates a register of n qubits in the 1 state
	x = zeros(ComplexF64, 2^n)
	x[2^n] = ComplexF64(1,0)
	return register(transpose(x))
end