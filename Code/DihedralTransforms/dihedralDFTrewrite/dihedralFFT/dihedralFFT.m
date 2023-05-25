function fh = dihedralFFT(f)
    L = length(f);
    
    if mod(L,2) == 0
        fh = dihedralFFTEven(f);
    elseif mod(L,2) == 1
        fh = dihedralFFTOdd(f);
    end
end