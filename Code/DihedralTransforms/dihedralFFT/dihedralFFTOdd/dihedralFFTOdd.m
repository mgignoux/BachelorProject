function fh = dihedralFFTOdd(f)
    L = length(f);
    fh = cell(1,2+(L-1)/2);

    FFTsolsRot = FFTmixed(f(1,:),factor(L));
    FFTsolsRef = FFTmixed(f(2,:),factor(L));
    IFFTsolsRot = IFFTmixed(f(1,:),factor(L));
    IFFTsolsRef = IFFTmixed(f(2,:),factor(L));

    for n = 1:(L-1)/2
        fh{n+2} = [FFTsolsRot(n+1), IFFTsolsRef(n+1); FFTsolsRef(n+1), IFFTsolsRot(n+1)];
    end

    for n = -1:0
        sum = 0;
        for k1 = 0:1
            for k2 = 0:L-1
                sum = sum + f(k1+1,k2+1).*(conj(dihedralRepOdd(k1,k2,n,L)));
                fh{n+2} = sum;
            end
        end
    end
end