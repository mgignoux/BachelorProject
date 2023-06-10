function fh = dihedralDFTOdd(f)
    L = length(f);
    fh = cell(1,2+(L-1)/2);

    for n = -1:(L-1)/2
        sum = 0;
        for k1 = 0:1
            for k2 = 0:L-1
                sum = sum + f(k1+1,k2+1).*(conj(dihedralRepOdd(k1,k2,n,L)));
                fh{n+2} = sum;
            end
        end
    end
end