function f = dihedralIDFT(fh)
    L = length(fh);
    f = zeros(2,L);

    for k1 = 0:1
        for k2 = 0:L-1
            for n = 1:L/2-1
                f(k1+1,k2+1) = f(k1+1,k2+1) + sum((fh(:,:,n+1).*dihedralRep(k1,k2,n,L)),"all");
            end
        end
    end
end