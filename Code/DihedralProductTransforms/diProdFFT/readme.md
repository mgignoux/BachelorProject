# The Dihedral Product FFT
* $\texttt{diProd(f)}$ computes the Dihedral Product DFT of $f$ using the algorithm in the thesis

## Overview $\texttt{diProdFFT(f)}$
Compute Dihedral DFTs: 
$$\hat{t}_{a_ib_i}(\phi^{n_1}_1,\dots,\phi^{n_i}_i,g_{i+1},\dots,g_s)=\frac{1}{2L_i}\sum_{g_i\in D_{2L_i}}\hat{t}_{a_{i-1}b_{i-1}}(\phi^{n_1},\dots,\phi^{n_{i-1}},g_i,\dots,g_s)\overline{(\phi_i^{n_i})_{a_ib_i}(g_i)}$$
for $1\leq i \leq s$.
## The Code
* The code works in two processes: (1) finding all the Fourier coefficients and storing in a large array and (2) sorting these Fourier coefficients into the Fourier matrices using a cell array
* All of the other codes do these two things at once, but with how MATLAB works with $s$-dimensional cell array and linear indexing, this was necessary
## Helpers
* $\texttt{getFinalDims([n1,...,ns],[k1,...,ks],[L1,...,Ls])}$ computes the $\overline{\left(\bigotimes_{i=1}^s\phi_i^{n_i}(g_i)\right)}$ term
* $\texttt{getNextDims(fdims)}$ finds the dimensions of the Fourier coefficients given the dimensions of $\texttt{f}$
* $\texttt{getTensorCoefficients(dims,i,j)}$ given the $ij$-th Fourier matrix and the dimesnions of the representations, finds the sequence of $a_ib_i$ coefficients of the Kronecker product 
* $\texttt{subIndex([n1,...,ns],[L1,...,Ls])}$ gets the index of the element we are putting in the Fourier matrices
* $\texttt{linearIndex(idx, size)}$ gets the linear index of the element we are putting in the Fourier matrices(see notes below)
## Notes
* To compute the Dihedral DFTs $\texttt{dihedralFFT}$ is used
* MATLAB does not support indexing matrices with vectors, we we use linear indexing since we have an variable number of dimensions $s$ 

