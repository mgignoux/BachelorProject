function fh = FFTunused(f,L1,L2)
    % this is a mixed radix fft with only 1 part sped up... not too
    % interesting, just look instead at FFTmixed1 or FFTmixed2.

    f = reshape(f,L1,L2);
    L1 = length(f(:,1)); 
    L2 = length(f(1,:));
    fh = zeros(L2,L1);                                        
    th = zeros(L1,L2);


    % first FFT over the rows
    for k1 = 0:L1-1                        
        th(k1+1,:) = DFTnaive(f(k1+1,:),1);        
    end        

    for k1 = 0:L1-1
        for n2 = 0:L2-1
            th(k1+1,n2+1)=th(k1+1,n2+1)*exp(-2*pi*1i*k1*n2/(L1*L2));
        end
    end

    % transposition 
    th = th';

    for n2 = 0:L2-1
            fh(n2+1,:) = DFTnaive(th(n2+1,:),1);
    end

    % transposition
     fh = fh';
     fh = unwrapM(fh);
end