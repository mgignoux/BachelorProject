# Algorithms for Computing Fourier Transforms on Finite Groups

Here you can find some general information about the programming side of my project. 

## General Information
* Everything coded in MATLAB release 2023a

## Necessary Toolboxes
* Signal Processing Toolbox
* Phased Array System Toolbox
* DSP Systen Toolbox

## Computer Specifications
* AMD Ryzen 5 3600 Processor
* GeForce RTX 3070 Graphics Card
* 32 GB DDR4 Ram
* 1 TB Solid State Drive
* Windows 10 64-bit

## Testers and Drivers

## Variable Names
* $\texttt{f}$ denotes the matrix storing the function outputs
* $\texttt{fh}$ ("f hat") denotes the matrix storing the Fourier coefficents
* $\texttt{t}$ denotes a helper matrix storing values used to calculate the Fourier coefficients
* $\texttt{th}$ ("t hat") denotes a helper matrix storing values used to calculate the Fourier coefficients that has undergone a Fourier transform

## Functions in MATLAB
MATLAB uses 1-based indexing. Thus the 0th Fourier coefficient has to be stored in the 1st entry of the matrix.
*  The outputs of a function $f:C_L\rightarrow \mathbb{C}$ are written in a $1\times L$ array $\texttt{f}$ where
$$f[k+1]=f(r^{k})$$
*  The outputs of a function $f:C_{L_1}\times\dots\times C_{L_s}\rightarrow \mathbb{C}$ are written in a $L_1\times\dots\times L_s$ array $\texttt{f}$ where
$$f[k_1+1,...,k_s+1]=f(r^{k_1},\dots r^{k_s})$$
*  The outputs of a function $f:D_{2L}\rightarrow \mathbb{C}$ are written in a $2\times L$ array $\texttt{f}$ where
$$f[l+1,k+1]=f(s^lr^{k})$$
*  The outputs of a function $f:D_{2L_1}\times\dots\times D_{2L_s}\rightarrow \mathbb{C}$ are written in a $2\times L_1\times\dots\times 2\times L_s$ array $\texttt{f}$ where
$$f[l_1+1,k_1+1,...,l_s+1,k_s+1]=f(s^{l_1}r^{k_1},\dots,s^{l_s}r^{k_s})$$