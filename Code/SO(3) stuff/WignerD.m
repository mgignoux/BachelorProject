function rep = WignerD(alpha,beta,gamma,n,i,j)

    rep = exp(-1i*i*alpha)*exp(-1i*j*gamma)*Wigner_d(cos(beta),n,i,j);
   
end