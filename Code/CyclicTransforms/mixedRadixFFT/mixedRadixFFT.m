function fh = mixedRadixFFT(f,factors)
    if length(factors) == 1
        fh = cyclicDFT(f);

    else
        L1 = factors(end);            L2 = prod(factors(1:end-1));
        f = reinterpretMixed(f,L1,L2);   
        fh = zeros(L1,L2);      th = zeros(L1,L2);

        for k1 = 0:L1-1                        
            th(k1+1,:) = mixedRadixFFT(f(k1+1,:),factors(1:end-1));        
        end        

        for k1 = 0:L1-1
            for n2 = 0:L2-1
                th(k1+1,n2+1)=th(k1+1,n2+1)*exp(-2*pi*1i*k1*n2/(L1*L2));
            end
        end

        for n2 = 0:L2-1
            fh(:,n2+1) = cyclicDFT(th(:,n2+1)); 
        end

        fh = uninterpretMixed(fh);
    end
end