function fh = dihedralDFT(f)
    L = length(f);
    fh = zeros(2,2,L);

    for n = 1:L/2-1
        for k1 = 0:1
            for k2 = 0:L-1
                fh(:,:,n+1) = fh(:,:,n+1) + f(k1+1,k2+1).*(conj(dihedralRep(k1,k2,n,L)));
            end
        end
    end
end