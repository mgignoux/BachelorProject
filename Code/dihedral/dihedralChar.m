function char = dihedralChar(k1,k2,n,L)
    if k1 == 0
        char = [[exp(2*pi*1i*n*k2/L),0];[0,exp(-2*pi*1i*n*k2/L)]];
    end

    if k1 == 1
        char = [[0, exp(-2*pi*1i*n*k2/L)];[exp(2*pi*1i*n*k2/L), 0]];
    end

end