function fh = dihedralFFTEven(f)
    L = length(f);
    fh = cell(1,3+L/2);

    FFTsolsRot = mixedRadixFFT(f(1,:),factor(L));
    FFTsolsRef = mixedRadixFFT(f(2,:),factor(L));
    IFFTsolsRot = mixedRadixIFFT(f(1,:),factor(L));
    IFFTsolsRef = mixedRadixIFFT(f(2,:),factor(L));

    for n = 1:L/2-1
        fh{n+4} = [FFTsolsRot(n+1), IFFTsolsRef(n+1); FFTsolsRef(n+1), IFFTsolsRot(n+1)];
    end

    for n = -3:0
        sum = 0;
        for k1 = 0:1
            for k2 = 0:L-1
                sum = sum + f(k1+1,k2+1).*(conj(dihedralRepEven(k1,k2,n,L)));
                fh{n+4} = sum;
            end
        end
    end
end