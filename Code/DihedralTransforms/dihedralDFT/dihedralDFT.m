function fh = dihedralDFT(f)
    L = length(f);
    
    if mod(L,2) == 0
        fh = dihedralDFTEven(f);
    elseif mod(L,2) == 1
        fh = dihedralDFTOdd(f);
    end
end
