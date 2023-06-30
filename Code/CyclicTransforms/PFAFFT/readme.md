# The Prime Factor Algorithm
* $\texttt{PFA(f,factors)}$ computes the Cyclic DFT of $f$ using the PFA
* $\texttt{IPFA(fh,factors)}$ computes the Cyclic IDFT of $\hat{f}$ using the PFA

## Overview $\texttt{mixedRadixFFT(f,factors)}$
Given factors $L_1$ and $L_2$ where $L=L_1L_2$ and $L_1$,$L_2$ coprime

1. Compute Cyclic DFTs: $\widehat{t}[k_1,n_2] = \frac{1}{L_2}\sum_{k_2=0}^{L_2-1}f[k_1,k_2]\omega_{L_2}^{-n_2k_2}$
3. Compute Cyclic DFTs: $\widehat{f}[n_1,n_2] = \frac{1}{L_1}\sum_{k_1=0}^{L_1-1}\widehat{t}[k_1,n_2]\omega_{L_1}^{-n_1k_1}$

for $n_1=0,\dots,L_1-1$ and $n_2=0,\dots,L_2-1$.
## Helpers
* $\texttt{reinterpretPFA(f,L1,L2)}$ rewrites $f[k]$ as $f[k_1,k_2]$
* $\texttt{uninterprentPFA(M,L1,L2)}$ rewrites $\hat{f}[n_1,n_2]$ as $\hat{f}[n]$ 

## Notes
* We know that there are $L$ Fourier coefficients, so we alot $L$ spaces in $\texttt{fh}$ to improve performance
* $\texttt{IPFA}$ works identically up to normalization and conjugation of the roots of unity
* MATLABs $\texttt{iscoprime}$ fails to recognize that $\texttt{[2,2,3]}$ contains coprime numbers, and thus can not verify that $\texttt{factors}$ are coprime
* To remedy this we can check for this case using a statement like $\texttt{length(unique(factors))==length(factors)}$
* In my testing, this previous method was extremely computationally expensive, and thus the $\texttt{try}$ statement is used instead, which performed best