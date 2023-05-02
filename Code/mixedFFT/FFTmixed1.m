function fh = FFTmixed1(f,p)
    if length(p) == 1
        fh = DFTnaive(f);

    else
        L1 = p(end);            L2 = prod(p(1:end-1));
        f = reinterpretMixed(f,L1,L2);   
        fh = zeros(L1,L2);      th = zeros(L1,L2);


        % first FFT over the rows
        for k1 = 0:L1-1                        
            th(k1+1,:) = FFTmixed1(f(k1+1,:),p(1:end-1));        
        end        

        % twiddles
        for k1 = 0:L1-1
            for n2 = 0:L2-1
                th(k1+1,n2+1)=th(k1+1,n2+1)*exp(-2*pi*1i*k1*n2/(L1*L2));
            end
        end

        % second FFT over the columns
        for n2 = 0:L2-1
            fh(:,n2+1) = FFTmixed1(th(:,n2+1),1);
        end

        fh = uninterpretMixed(fh);
    end
end