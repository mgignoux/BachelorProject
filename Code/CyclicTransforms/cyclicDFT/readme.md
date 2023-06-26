# The Cyclic DFT
* $\texttt{cyclicDFT(f)}$ computes the Cyclic DFT of $f$
* $\texttt{cyclicIDFT(fh)}$ computes the Cyclic IDFT of $\hat{f}$

## Overview $\texttt{cyclicDFT(f)}$
The naive implementation of the DFT algorithm is simply finding the DFT using the basic mathematics that constitute the DFT. In the cyclic case this means computing
$$\hat{f}[n]=\sum_{k=0}^{L-1}f[k]\omega^{-nk}_L,$$
for $n=0,\dots,L-1$.
## Notes
* We know that there are $L$ Fourier coefficients, so we allot $L$ spaces in $\texttt{fh}$ to improve performance
* $\texttt{cyclicIDFT}$ works identically up to normalization and conjugation of the roots of unity
