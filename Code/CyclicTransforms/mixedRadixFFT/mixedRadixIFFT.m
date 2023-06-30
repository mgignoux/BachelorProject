function f = mixedRadixIFFT(fh,factors)
    if length(factors) == 1
        f = cyclicIDFT(fh);

    else
        L1 = factors(end);            L2 = prod(factors(1:end-1));
        fh = reinterpretMixed(fh,L1,L2);   
        f = zeros(L1,L2);      th = zeros(L1,L2);

        for k1 = 0:L1-1                        
            th(k1+1,:) = mixedRadixIFFT(fh(k1+1,:),factors(1:end-1));        
        end        

        for k1 = 0:L1-1
            for n2 = 0:L2-1
                th(k1+1,n2+1)=th(k1+1,n2+1)*exp(2*pi*1i*k1*n2/(L1*L2));
            end
        end

        for n2 = 0:L2-1
            f(:,n2+1) = cyclicIDFT(th(:,n2+1)); 
        end

        f = uninterpretMixed(f);
    end
end