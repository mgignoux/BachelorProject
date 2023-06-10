function [p1,q1,p2,q2]=getTensorCoef(dim2,i,j)

   p1 = ceil(i/dim2); q1 = ceil(j/dim2);
   p2 = mod(i-1,dim2)+1; q2 = mod(j-1,dim2)+1;