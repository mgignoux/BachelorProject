# The Abelian FFT
* $\texttt{abelianFFT(f)}$ computes the Abelian DFT of $f$ using the algorithm in the thesis
* $\texttt{abelianIFFT(fh)}$ computes the Abelian IDFT of $\hat{f}$ using the algorithm in the thesis

## Overview $\texttt{abelianFFT(f)}$
Compute Cyclic DFTs: $$t_i[n_1,\dots,n_i,k_{i+1},\dots,k_s] = \frac{1}{L_i}\sum_{k_i=0}^{L_i-1}t_{i-1}[n_1,\dots,n_{i-1},k_i,\dots,k_s]\omega_{L_i}^{-n_ik_i}$$
for $1\leq i \leq s$.

## Notes
* To compute the Cyclic DFTs $\texttt{mixedRadixFFT}$ is used
* MATLAB does not support indexing matrices with vectors, we we use linear indexing since we have an variable number of dimensions $s$ 
* $\texttt{abelianIFFT}$ works identically up to normalization and conjugation of the roots of unity, this is not necessary for the thesis
