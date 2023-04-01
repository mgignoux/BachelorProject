function f = dihedralIDFT(fh)
    L = length(fh);
    f = zeros(2,L/2);

    for k1 = 0:1
        for k2 = 0:L/2-1
            for n = 0:L-1
                f(k1+1,k2+1) = f(k1+1,k2+1) + trace(fh(:,:,n+1)*(dihedralChar(k1,k2,n,L)'));
            end
        end
    end
end