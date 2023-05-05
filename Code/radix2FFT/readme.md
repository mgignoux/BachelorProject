# The Radix-2 FFT
* $\texttt{FFTr2(f)}$ finds the DFT of $f$ using the methodoloy of the radix-2 Cooley-Tukey algorithm
* $\texttt{IFFTr2(fh)}$ finds the IDFT of $\hat{f}$ using the same methodology

## Overview
The Radix-2 FFT requires splitting $f$ into $f_e$ and $f_o$ and finding their respective Fourier coefficients, and exploiting 

$$\begin{aligned}
\widehat{f}[n] &= \widehat{f}_e[n]+e^{-\frac{2\pi in}{L}}\widehat{f}_o[n]\\
\widehat{f}[n+L/2]&=\widehat{f}_e[n] - e^{-\frac{2\pi in}{L}}\widehat{f}_o[n]
\end{aligned}$$

To break this down step-by-step, for the radix-2 FFT this is doing 
1. let $f_e=\{f_m\}_{m \text{ even}}$ and $f_o=\{f_m\}_{m \text{ odd}}$
2. find $\hat{f}_e$ and $\hat{f}_o$ recursively 
3. loop over $n$ to find $\hat{f}[n]$ and $\hat{f}[n+L/2]$ for $n=0,\dots,L/2-1$

and for the radix-2 IFFT this is doing
1. let $\hat{f}_e=\{\hat{f}_m\}_{m \text{ even}}$ and $\hat{f}_o=\{\hat{f}_m\}_{m \text{ odd}}$
2. find $f_e$ and $f_o$ recursively
3. loop over $k$ to find $f[k]$ and $f[k+L/2]$ for $n=0,\dots,L/2-1$

## Choices
* We will assume the user knowingly uses inputs of length $L=2^m$, if this is not inputted, the program will still execute until failure, instead of checking at execution