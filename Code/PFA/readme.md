# The Prime Factorization Algorithm
* $\texttt{PFA(f,L1,L2)}$ finds the DFT of $f$ using the methodology of the Prime Factorization Algorithm (PFA) using coprime $L_1$ and $L_2$
* $\texttt{IPFA(fh,L1,L2)}$ finds the DFT of $\hat{f}$ using the same methodology
* $\texttt{reinterpretPFA(f,L1,L2)}$ reinteprets $f$ from a $L$ length vector as a $L_1\times L_2$ matrix
* $\texttt{uninterpretPFA(f,L1,L2)}$ uninteprets $f$ from an $L_1\times L_2$ matrix back to a $L$ length vector 

## Overview
As an algorithm, this requires doing the following steps to find the transform
1. reinterpret $f[k_1,k_2] = f[L_2k_1+L_1k_2]$ using $L$-periodicity
2. for $k_1=0,\dots ,L_1-1$ and $n_2=0,\dots ,L_2-1$, loop over $k_2=0,\dots ,L_2-1$ to compute 
$$\widehat{t}[k_1,n_2] = \sum_{k_2=0}^{L_2-1}f[k_1,k_2]\omega_{L_2}^{-n_2k_2}$$
3. for $n_1=0,\dots ,L_1-1$ and $n_2=0,\dots ,L_2-1$, loop over $k_1=0,\dots ,L_2-1$ to compute 
$$\widehat{f}[n_1,n_2] = \sum_{k_1=0}^{L_1-1}\widehat{t}[k_1,n_2]\omega_{L_1}^{-n_1k_1}$$
4. uninterpret $f[x] = f[n_2,n_1]$ where $x$ is the solution to the Chinese Remainder Theorem problem
$$\begin{aligned}
x&\equiv n_1 \mod{L_1}\\
x&\equiv n_2 \mod{L_2}
\end{aligned}$$

## Choices
* The sizes of $\hat{f}$ and $\hat{t}$ are pre-allocated at execution
* The Chinese Remainder Theorem problem is solved using the built in MATLAB solver $\texttt{crt}$
