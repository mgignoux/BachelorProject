# The Dihedral FFT
* $\texttt{dihedralFFT(f)}$ computes the Dihedral DFT of $f$ using the algorithm in the thesis
* $\texttt{dihedralIFFT(fh)}$ computes the Dihedral IDFT of $\hat{f}$ using the algorithm in the thesis

## Overview $\texttt{dihedralFFT(f)}$
In the case where $L$ is even, this algorithm is given by
1. Compute 
$$\widehat{f}_{ij}\left(\phi^{n}\right)=\frac{1}{2L}\sum\limits_{s^lr^k\in D_{2L}}f\left(s^lr^k\right)\overline{(\phi^{n}s^lr^k)}$$

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; where 
$$\phi^{-3}(s^lr^k)=1,\quad \phi^{-2}(s^lr^k)=(-1)^l,\quad \phi^{-1}(s^lr^k)=(-1)^k,\quad \phi^{0}(s^lr^k)=(-1)^{l+k},$$
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for $-3\leq n \leq 0$.

2. Compute Cyclic DFTs:
$$\widehat{f}_{ij}\left(\phi^{n}\right)=\frac{1}{2}\begin{pmatrix}\frac{1}{L}\sum\limits_{k=0}^{L-1}f\left(r^k\right)\omega_L^{-nk} & \frac{1}{L}\sum\limits_{k=0}^{L-1}f\left(sr^k\right)\omega_L^{nk} \\ \frac{1}{L}\sum\limits_{k=0}^{L-1}f\left(sr^k\right)\omega_L^{-nk} & \frac{1}{L}\sum\limits_{k=0}^{L-1}f\left(r^k\right)\omega_L^{nk}\end{pmatrix}_{ij}$$
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for $0<n<L/2$

## Notes
* To compute the Cyclic DFTs $\texttt{mixedRadixFFT}$ is used
* MATLAB does not support indexing matrices with vectors, we we use linear indexing since we have an variable number of dimensions $s$ 
* $\texttt{dihedralIFFT}$ works identically up to normalization and conjugation of the roots of unity, this is not necessary for the thesis
* Unlike the Cyclic and Abelian case, we now have Fourier matrices, and thus to return them in a sequence we use MATLABs $\texttt{cell}$ structure since MATLAB does not support vectors of different sized matrices
* We begin by alotting $L/2-3$ empty cells where we will store the Fourier matrices ($(L-1)/2-1$ empty cells if $L$ is odd)
* $\texttt{dihedralIFFT}$ quickly computes the Dihedral IDFT (this is not covered in my thesis) using helper function $\texttt{dihedralPad}$   
