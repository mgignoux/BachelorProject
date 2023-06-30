# The Abelian DFT
* $\texttt{abelianDFT(f)}$ computes the Abelian DFT of $f$ naively
* $\texttt{abelianIDFT(fh)}$ computes the Abelian IDFT of $\hat{f}$ naively

## Overview $\texttt{abelianDFT(f)}$
The naive implementation of the DFT algorithm is simply finding the DFT using the basic mathematics that constitute the DFT. In the abelian case this means computing 

$$\widehat{f}[n_1,\dots,n_s]=\frac{1}{L_1\dots L_s}\sum_{k_1=0}^{L_1-1}\dots\sum_{k_s=0}^{L_s-1}f[k_1,\dots,k_s]\overline{\omega_{L_1}^{n_1k_1}\dots \omega_{L_s}^{n_sk_s}},$$

for $n_i=0,\dots,L_i-1$.
## Helpers
* $\texttt{abelianRep([n1,...,ns],[k1,...,ks],[L1,...,Ls])}$ computes the $\overline{\omega_{L_1}^{n_1k_1}\dots \omega_{L_s}^{n_sk_s}}$ term
## Notes
* We know that there are $L_1\dots L_s$ Fourier coefficients, so we allot $L_1\dots L_s$ in a $s$ dimensional matrix with dimensions $L_1,\dots, L_s$ for $\texttt{fh}$ to improve performance
* MATLAB does not support indexing matrices with vectors, we we use linear indexing since we have an variable number of dimensions $s$ 
* $\texttt{abelianIDFT}$ works identically up to normalization and conjugation of the roots of unity, this is not necessary for the thesis
