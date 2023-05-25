# The Naive DFT
* $\texttt{DFTnaive(f)}$ finds the DFT of $f$
* $\texttt{IDFTnaive(f)}$ finds the IDFT of $\hat{f}$

## Overview
The naive implementation of the DFT algorithm is simply finding the DFT using the basic mathematics that constitute the DFT. This is 

$$\hat{f}(n)=\sum_{k=0}^{L-1}f(k)\omega^{-nk}_L,$$

for the DFT, and 

$$f(k)=\sum_{n=0}^{L-1}\hat{f}(n)\omega^{nk}_L,$$

for the IDFT.
* First, we fix $n$ loop over $k$ to find $\hat{f}(n)$ for a given $n$
* Next, we loop over $n$ to find all $L$ coefficients

## Choices
* We know that there are $L$ Fourier coefficients, so we allot $L$ spaces in $\texttt{fh}$ (our variable for $\hat{f}$) at the beginning of our code to improve performance

