function fh = FFTin2subDFT(f,L1,L2)
    f = reinterpretMixed(f,L1,L2);
    fh = zeros(L1,L2);      th = zeros(L1,L2);


    % first FFT over the rows
    for n2=0:L2-1
        for k1 = 0:L1-1
            for k2 = 0:L2-1                        
                th(k1+1,n2+1) = th(k1+1,n2+1) + f(k1+1,k2+1)*exp(-2*pi*1i*n2*k2/L2);        
            end        
        end
    end    

    % twiddles
    for k1 = 0:L1-1
        for n2 = 0:L2-1
            th(k1+1,n2+1)=th(k1+1,n2+1)*exp(-2*pi*1i*k1*n2/(L1*L2));
        end
    end
   
    % second FFT over columns
    for n1 = 0:L1-1
        for n2 = 0:L2-1
            for k1 = 0:L1-1
                fh(n1+1,n2+1) = fh(n1+1,n2+1) + th(k1+1,n2+1)*exp(-2*pi*1i*n1*k1/L1);
            end
        end
    end

   fh = uninterpretMixed(fh);
end