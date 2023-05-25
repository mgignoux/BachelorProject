function rep = dihedralRepNew(k,n,L)
% n is the number representation, k is the kth element of G if G is written
% G = {e,r,r^2,...,s,sr,sr^2,...}
    if k <= L/2
        rep = [[exp(2*pi*1i*n*k/(L/2)),0];[0,exp(-2*pi*1i*n*k/(L/2))]];
    end

    if (k <= L) && (k > L/2)
        rep = [[0, exp(-2*pi*1i*n*k/(L/2))];[exp(2*pi*1i*n*k/(L/2)), 0]];
    end

end