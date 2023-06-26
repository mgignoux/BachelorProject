function [p,q]=getTensorCoefficients(dims,i,j)

    for k = 1:length(dims)

       dim = prod(dims(k+1:end));
       p(k) = ceil(i/dim); q(k) = ceil(j/dim);
       i = mod(i-1,dim)+1; j = mod(j-1,dim)+1;
    end

end