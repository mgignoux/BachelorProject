function f = IPFA(fh,factors)
    
    if length(factors) == 1 || not(iscoprime(factors)) 
        f = cyclicIDFT(fh);

    else
        try
            L1 = factors(1);    L2 = prod(factors(2:end));
            fh = reinterpretPFA(fh,L1,L2);
            f = zeros(L2,L1);  th = zeros(L1,L2);
    
            for k1 = 0:L1-1                        
                th(k1+1,:) = IPFA(fh(k1+1,:),factors(2:end));        
            end        
                
            for n2 = 0:L2-1
                f(n2+1,:) = cyclicIDFT(th(:,n2+1));
            end
    
            f = uninterpretPFA(f,L1,L2);

        catch
            f = cyclicIDFT(fh);
            
        end
    end
end