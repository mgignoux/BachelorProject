function fh = dihedralDFTEven(f)
    L = length(f);
    fh = cell(1,3+L/2);

    for n = -3:L/2-1
        sum = 0;
        for k1 = 0:1
            for k2 = 0:L-1
                sum = sum + f(k1+1,k2+1).*(conj(dihedralRepEven(k1,k2,n,L)));
                fh{n+4} = sum;
            end
        end
    end
end