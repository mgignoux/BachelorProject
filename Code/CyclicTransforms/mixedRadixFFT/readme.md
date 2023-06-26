# The Mixed-Radix FFT
* $\texttt{mixedRadixFFT(f,factors)}$ computes the Cyclic DFT of $f$
* $\texttt{mixedRadixIFFT(fh,factors)}$ computes the Cyclic IDFT of $\hat{f}$

## Overview $\texttt{mixedRadixFFT(f,factors)}$
Given factors $L_1$ and $L_2$ where $L=L_1L_2$.

1. Compute Cyclic DFTs: $\widehat{t}[k_1,n_2] = \frac{1}{L_2}\sum_{k_2=0}^{L_2-1}f[k_1,k_2]\omega_{L_2}^{-n_2k_2}$
2. Multiply by twiddle factors: $\widetilde{t}[k_1,n_2]=\widehat{t}[k_1,n_2]\omega_{L}^{-n_2k_1}$
3. Compute Cyclic DFTs: $\widehat{f}[n_1,n_2] = \frac{1}{L_1}\sum_{k_1=0}^{L_1-1}\widetilde{t}[k_1,n_2]\omega_{L_1}^{-n_1k_1}$

for $n_1=0,\dots,L_1-1$ and $n_2=0,\dots,L_2-1$.
## Helpers
* $\texttt{reinterpretMixed(f)}$ rewrites $f[k]$ as $f[k_1,k_2]$
* $\texttt{uninterprentMixed(M)}$ rewrites $\hat{f}[n]$ as $\hat{f}[n_1,n_2]$

## Notes
* We know that there are $L$ Fourier coefficients, so we allot $L$ spaces in $\texttt{fh}$ to improve performance
* $\texttt{mixedRadixIFFT}$ works identically up to normalization and conjugation of the roots of unity
* In my testing, the fastest way of recursing was not spliting the factors in half, but instead given a prime factorization $L=L_1'\dots L_s'$ letting $L_1=L_1'$ and $L_2=L_2'\dots L_s'$