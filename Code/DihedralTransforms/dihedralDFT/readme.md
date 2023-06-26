# The Dihedral DFT
* $\texttt{dihedralDFT(f)}$ computes the Dihedral DFT of $f$
* $\texttt{dihedralIDFT(fh)}$ computes the Dihedral IDFT of $\hat{f}$

## Overview $\texttt{DihedralDFT(f)}$
The naive implementation of the DFT algorithm is simply finding the DFT using the basic mathematics that constitute the DFT. In the dihedral case where $L$ is even this means computing
$$
\widehat{f}_{ij}\left(\phi^{n}\right)=
\begin{cases}
\frac{1}{2L}\sum\limits_{s^lr^k\in D_{2L}}f\left(s^lr^k\right)\overline{(\phi^{n}s^lr^k)} &\text{for } -3\leq n\leq 0,\\
\frac{1}{2L}\left[\sum\limits_{r^k\in D_{2L}}f\left(r^k\right)\overline{\begin{pmatrix}\omega_L^{nk} & 0 \\ 0 & \omega_L^{-nk}\end{pmatrix}_{ij}} + \sum\limits_{sr^k\in D_{2L}}f\left(sr^k\right)\overline{\begin{pmatrix}0 & \omega_L^{-nk} \\ \omega_L^{nk} & 0\end{pmatrix}_{ij}}\right] &\text{for } 0<n<L/2, 
\end{cases}
$$
where 
$$\phi^{-3}(s^lr^k)=1,\quad \phi^{-2}(s^lr^k)=(-1)^l,\quad \phi^{-1}(s^lr^k)=(-1)^k,\quad \phi^{0}(s^lr^k)=(-1)^{l+k}.$$
## Helpers
* $\texttt{dihedralDFTEven}$ computes the above equation if $L$ even
* $\texttt{dihedralDFTOdd}$ computes the odd variant of this equation if $L$ odd (in this case, in the first equation $n=-1, n=0$ are not computed and in the second equation $0<n<(L-1)/2$)
* $\texttt{dihedralRepEven}$ computes the even representations
* $\texttt{dihedralRepOdd}$ computes the odd representations

## Notes
* Unlike the Cyclic and Abelian case, we now have Fourier matrices, and thus to return them in a sequence we use MATLABs $\texttt{cell}$ structure since MATLAB does not support vectors of different sized matrices
* We begin by alotting $L/2-3$ empty cells where we will store the Fourier matrices ($(L-1)/2-1$ empty cells if $L$ is odd)
* $\texttt{dihedralIDFT}$ naively computes the Dihedral IDFT (this is not covered in my thesis) using helper functions $\texttt{dihedralIDFTEven}$, $\texttt{dihedralIDFTOdd}$, and $\texttt{dihedralPad}$    
