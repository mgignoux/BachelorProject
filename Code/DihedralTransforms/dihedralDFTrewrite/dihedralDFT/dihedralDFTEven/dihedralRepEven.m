function rep = dihedralRepEven(k1,k2,n,L)
    if n == -3
        rep = 1;
    elseif n == -2
        rep = (-1)^k1;
    elseif n == -1
        rep = (-1)^k2;
    elseif n == 0
        rep = (-1)^k1*(-1)^k2;
    elseif n > 0
        if k1 == 0
            rep = [exp(2*pi*1i*n*k2/L),0;0,exp(-2*pi*1i*n*k2/L)];
        end
        if k1 == 1
            rep = [0, exp(-2*pi*1i*n*k2/L);exp(2*pi*1i*n*k2/L), 0];
        end
    else
        disp(n)
        print("Error, n value incorrect")
    end
end