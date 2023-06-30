# The Dihedral Product DFT
* $\texttt{diProdDFT(f)}$ computes the Dihedral Product DFT of $f$ naively
* $\texttt{diProdIDFT(fh)}$ computes the Dihedral Product IDFT of $\hat{f}$ naively

## Overview $\texttt{diProdDFT(f)}$
The naive implementation of the DFT algorithm is simply finding the DFT using the basic mathematics that constitute the DFT. In the dihedral product case this means computing 

$$ \hat{f}_{ij}(\phi^{n_1,\dots,n_s})=\frac{1}{2^sL_1\dots L_s}\sum_{(g_1,\dots,g_s)\in D_{2L_1}\times \dots \times D_{2L_s}}f(g_1,\dots,g_s)\overline{\left(\bigotimes _{i=1}^s\phi_i^{n_i}(g_i)\right)_{ij}}. $$

## Helpers
* $\texttt{diProdRep([n1,...,ns],[k1,...,ks],[L1,...,Ls])}$ computes the $\overline{\left(\bigotimes _{i=1}^s\phi_i^{n_i}(g_i)\right)}$ term
* $\texttt{findDiProdDims(fdims)}$ finds the dimensions of the Fourier coefficients given the dimensions of $\texttt{f}$
## Notes
* Unlike the Cyclic and Abelian case, we now have Fourier matrices, and thus to return them in a sequence we use MATLABs $\texttt{cell}$ structure since MATLAB does not support vectors of different sized matrices
* We begin by alotting an empty cell array of dimensions given by the helper function $\texttt{findDiProdDims}$ 
* MATLAB does not support indexing matrices with vectors, we we use linear indexing since we have an variable number of dimensions $s$ 
* $\texttt{dihedralIDFT}$ naively computes the Dihedral IDFT (this is not covered in my thesis) using helper functions $\texttt{dihedralIDFTEven}$, $\texttt{dihedralIDFTOdd}$, and $\texttt{dihedralPad}$    
