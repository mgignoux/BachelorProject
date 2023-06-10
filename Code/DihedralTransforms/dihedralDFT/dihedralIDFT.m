function f = dihedralIDFT(fh)
    L = length(fh);
    
    if mod(L,2) == 0
        f = dihedralIDFTEven(fh);
    elseif mod(L,2) == 1
        f = dihedralIDFTOdd(fh);
    end
end
