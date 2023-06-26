function fh = PFA(f,factors)
    
    if length(factors) == 1 || not(iscoprime(factors)) 
        fh = cyclicDFT(f);

    else
        try
            L1 = factors(1);    L2 = prod(factors(2:end));
            f = reinterpretPFA(f,L1,L2);
            fh = zeros(L2,L1);  th = zeros(L1,L2);
    
            for k1 = 0:L1-1                        
                th(k1+1,:) = PFA(f(k1+1,:),factors(2:end));        
            end        
                
            for n2 = 0:L2-1
                fh(n2+1,:) = cyclicDFT(th(:,n2+1));
            end
    
            fh = uninterpretPFA(fh,L1,L2);

        catch
            fh = cyclicDFT(f);
        end
    end
end