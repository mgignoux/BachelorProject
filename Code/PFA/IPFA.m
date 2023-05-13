function f = IPFA(fh,factors)

    if length(factors) == 1
        f = IDFTnaive(fh);

    else
        L1 = factors(1);    L2 = prod(factors(2:end));
        fh = reinterpretPFA(fh,L1,L2);
        f = zeros(L2,L1);                                        
        t = zeros(L1,L2);

        % first FFT over the rows
        for k1 = 0:L1-1                        
            t(k1+1,:) = IPFA(fh(k1+1,:),factors(2:end));        
        end        
            
        % second FFT over columns
        for n2 = 0:L2-1
            f(n2+1,:) = IDFTnaive(t(:,n2+1));
        end

        % transposition
        f = uninterpretPFA(f,L1,L2);
    end
end