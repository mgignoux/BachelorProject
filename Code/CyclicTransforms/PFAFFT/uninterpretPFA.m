function f = uninterpretPFA(M,L1,L2)
    f = zeros(1,L1*L2);
    [~,a,b]=gcd(L1,L2);

    for n1 = 0:L1-1
        for n2 = 0:L2-1
            f(mod(n2*a*L1+n1*b*L2,L1*L2)+1) = M(n2+1,n1+1);
        end
    end
end