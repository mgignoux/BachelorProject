function fh = FFFT(f,len,transform,norm,factors,pad)
    
    if (len>1) && (len < length(f))
        L = len;
        f = f(1:L);
    else
        L = length(f);
    end

    if prod(factors) == L
        factorization = factors;
    else 
        factorization = factor(L);
    end

    if pad == true
        f = determinePad(f);
    elseif L < pad
        f(end+1:pad) = 0;
    end

    if transform == "inv"
        fh = IDFTnaive(f);
    else
        if isprime(L)
            fh = DFTnaive(f);
        elseif 
            
        end
    end

    if isstring(norm)
        if norm == "sqrt"
            fh = 1/(sqrt(L)) * fh;
        elseif ((norm == "inv") && (transform == "inv")) || (norm == "reg")
            fh = 1/L * fh;
        end
    else 
        fh = 1/norm * fh;
    end
end


% inverse
% factorization 
% normalization
% length
% zero padding
