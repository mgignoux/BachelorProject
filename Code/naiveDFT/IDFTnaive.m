function f = IDFTnaive(fh)
    L = length(fh);
    f = zeros(1,L);

    for n=0:L-1
        for k=0:L-1
            f(n+1) = f(n+1) + fh(k+1)*exp(2*pi*1i*n*k/L);
        end
    end
end