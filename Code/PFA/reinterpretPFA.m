function fm = reinterpretPFA(f,L1,L2)
    fm = zeros(L1,L2);
    f
    L1
    L2
    for k1 = 0:L1-1
        for k2 = 0:L2-1
            fm(k1+1,k2+1) = f(mod(L2*k1+L1*k2,L1*L2)+1);
        end
    end
end