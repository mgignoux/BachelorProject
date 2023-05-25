function fh = dihedralFFTOdd(f)
    L = length(f);
    fh = cell(1,2+(L-1)/2);
    f
    FFTsolsRot = DFTnaive(f(1,:));
    FFTsolsRef = DFTnaive(f(2,:));
    IFFTsolsRot = IDFTnaive(f(1,:));
    IFFTsolsRef = IDFTnaive(f(2,:));

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