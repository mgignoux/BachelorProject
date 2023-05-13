# The Prime Factorization Algorithm
* $\texttt{PFA(f,factors)}$ finds the DFT of $f$ using the methodology of the Prime Factorization Algorithm (PFA) using coprime factors given in $\texttt{factors}$
* $\texttt{IPFA(fh,factors)}$ finds the DFT of $\hat{f}$ using the same methodology
* $\texttt{reinterpretPFA(f,L1,L2)}$ reinteprets $f$ from a $L$ length vector as a $L_1\times L_2$ matrix
* $\texttt{uninterpretPFA(f,L1,L2)}$ uninteprets $f$ from an $L_1\times L_2$ matrix back to a $L$ length vector 

## Overview
As an algorithm, this requires doing the following steps to find the transform
1. let the product of $L_1$ and $L_2$ be the length of $f$ denoted $L$, reinterpret $f[k_1,k_2] = f[L_2k_1+L_1k_2]$ using the $L$-periodicity of $f$
2. find DFT of the rows of $f$ recurively, and denote $\hat{t}\in\mathbb{C}^{L_2\times L_1}$  
3. find DFT of the columns of $\hat{t}$ recurively and denote $\hat{f}\in \mathbb{C}^{L_1\times L_2}$
4. uninterpret $\hat{f}[x] = \hat{f}[n_2,n_1]$ where $x$ is the solution to the Chinese Remainder Theorem problem
$$\begin{aligned}
x&\equiv n_1 \mod{L_1}\\
x&\equiv n_2 \mod{L_2}
\end{aligned}$$

## Choices
* The sizes of $\hat{f}$ and $\hat{t}$ are pre-allocated at execution
* The Chinese Remainder Theorem problem is solved using the built in MATLAB solver $\texttt{crt}$
