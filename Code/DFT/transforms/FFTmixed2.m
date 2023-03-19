function fh = FFTmixed2(f,p)

    if length(p) == 1
        fh = DFTnaive(f);

    else
        [p1,p2,L1,L2] = niceFactors(p);
        f = reinterpretMixed(f,L1,L2);       
        fh = zeros(L1,L2);      th = zeros(L1,L2);

        % first FFT over the rows
        for k1 = 0:L1-1                        
            th(k1+1,:) = FFTmixed2(f(k1+1,:),p2);        
        end        

        % twiddles
        for k1 = 0:L1-1
            for n2 = 0:L2-1
                th(k1+1,n2+1)=th(k1+1,n2+1)*exp(-2*pi*1i*k1*n2/(L1*L2));
            end
        end
        
        % second FFT over columns
        for n2 = 0:L2-1
            fh(:,n2+1) = FFTmixed2(th(:,n2+1),p1);
        end

        % transposition
        fh = uninterpretMixed(fh);
    end
end