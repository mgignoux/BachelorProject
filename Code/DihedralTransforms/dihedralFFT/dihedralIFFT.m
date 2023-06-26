function f = dihedralIFFT(fh)
    L = length(cell2mat(cellfun(@(x) x(:).',fh,'UniformOutput',false)));

    if mod(L,2) == 0
        f = dihedralIFFTEven(fh);
    elseif mod(L,2) == 1
        f = dihedralIFFTOdd(fh);
    end
end
