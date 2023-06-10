function f = IFFTmixed(fh,p)
    if length(p) == 1
        f = IDFTnaive(fh);

    else
        L1 = p(end);            L2 = prod(p(1:end-1));
        fh = reinterpretMixed(fh,L1,L2);   
        f = zeros(L1,L2);      th = zeros(L1,L2);


        % first FFT over the rows
        for k1 = 0:L1-1                        
            th(k1+1,:) = IFFTmixed(fh(k1+1,:),p(1:end-1));        
        end        

        % twiddles
        for k1 = 0:L1-1
            for n2 = 0:L2-1
                th(k1+1,n2+1)=th(k1+1,n2+1)*exp(2*pi*1i*k1*n2/(L1*L2));
            end
        end

        % second FFT over the columns
        for n2 = 0:L2-1
            f(:,n2+1) = IDFTnaive(th(:,n2+1)); 
        end

        f = uninterpretMixed(f);
    end
end