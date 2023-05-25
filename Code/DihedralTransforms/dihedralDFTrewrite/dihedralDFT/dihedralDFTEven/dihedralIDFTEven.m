function f = dihedralIDFTEven(fh)
    L = 2*(length(fh)-3);
    f = zeros(2,L);

    for k1 = 0:1
        for k2 = 0:L-1
            for n = 1:L/2+3
                dn = size(fh{n});
                f(k1+1,k2+1) = f(k1+1,k2+1) + sum(dn(1)*fh{n}.*dihedralRepEven(k1,k2,n-4,L),"all");
            end
        end
    end
end
