function [dim,dim2] = getDim(n,m,L1,L2)
    
    dim1 = 1; dim2 = 1;

    if mod(L1,2) == 0 && n > 4 || mod(L1,2) == 1 && n > 2
        dim1 = 2;
    end

    if mod(L2,2) == 0 && m > 4 || mod(L2,2) == 1 && m > 2
        dim2 = 2;
    end
     
   dim = dim1 * dim2;
