function [p,q,pold,qold]=getTensorCoefNew(dims,i,j)

   dim = prod(dims);
   p = ceil(i/dim); q = ceil(j/dim);
   pold = mod(i-1,dim)+1; qold = mod(j-1,dim)+1;
end