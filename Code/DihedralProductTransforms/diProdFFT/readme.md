# The Dihedral Product FFT
* $\texttt{diProd(f)}$ computes the Dihedral Product DFT of $f$

## Overview $\texttt{diProdFFT(f)}$
Compute Dihedral DFTs: 
$$\hat{t}_{p_iq_i}(\phi^n_1,\dots,\phi^n_i,g_{i+1},\dots,g_s)=\frac{1}{2L_i}\sum_{g_i\in D_{2L_i}}\hat{t}_{p_{i-1}q_{i-1}}(\phi^{n_1},\dots,\phi^{n_{i-1}},g_i,\dots,g_s)\overline{(\phi_i^{n_i})_{a_ib_i}(g_i)}$$
for $1\leq i \leq s$.

## Notes
* To compute the Dihedral DFTs $\texttt{dihedralFFT}$ is used
* MATLAB does not support indexing matrices with vectors, we we use linear indexing since we have an variable number of dimensions $s$ 
