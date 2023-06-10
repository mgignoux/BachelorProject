function rep = dihedralRep2(k1,k2,n,L)
    if k1 == 0
        rep = [exp(-2*pi*1i*n*k2/L),0;0,exp(2*pi*1i*n*k2/L)];
    end

    if k1 == 1
        rep = [0, exp(-2*pi*1i*n*k2/L);exp(2*pi*1i*n*k2/L), 0];
    end
end