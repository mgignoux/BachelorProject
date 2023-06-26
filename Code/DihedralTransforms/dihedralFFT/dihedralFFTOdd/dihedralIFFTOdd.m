function f = dihedralIFFTOdd(fh)
    L = 2*length(fh)-3;
    f = zeros(2,L);

    [pad11, pad12, pad21, pad22] = dihedralPad(fh,L);

    for k1 = 0:1
        for k2 = 0:L-1
            for n = 1:2
                f(k1+1,k2+1) = f(k1+1,k2+1) + fh{n}.*dihedralRepOdd(k1,k2,n-2,L);
            end
        end
    end

    f(1,:) = f(1,:) + 2*(mixedRadixIFFT(pad11,factor(length(pad11))) + length(pad22)*mixedRadixFFT(pad22,factor(length(pad22))));
    f(2,:) = f(2,:) + 2*(length(pad12)*mixedRadixFFT(pad12,factor(length(pad12))) + mixedRadixIFFT(pad21,factor(length(pad21))));
end