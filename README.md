# julia-quantum-simulator

A quantum computer simulator made using the Julia programming langauge.

Currently supported features
- native Hadamard gate
- native Pauli gates
- native controlled Pauli gates

Expected supported features
- non-sparse Hadamard gate for increased memory performance
- preset Hadamard register i.e. starting with all qubits entangled
- grover's and shor's algorithms
- GUI similar to QUIRK simulator (https://github.com/Strilanc/Quirk)

Other comments/design justifications
- i know julia uses multiple dispatch but im still calling the files containing the structs and functions a class, because it feels like a class when using it in practice
- only gates that are computationally efficient of necessary for a universal set/CSCO are going to be implemented. Ideally this would be just the clifford gates and one non-clifford gate. Maybe later I could try adding native support for the other more popular sets like the $\sqrt{X}$, $\sqrt{Y}$ and $\sqrt{W}$ set that Google uses or the $CNOT$, $ID$, $R_z$, $\sqrt{X}$ and $X$ set used by IBM
