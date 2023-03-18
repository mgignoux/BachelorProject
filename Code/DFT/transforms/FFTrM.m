function fh = FFTrM(f,L1,L2)
    f = reshape(f,L1,L2);
    L1 = length(f(:,1)); 
    L2 = length(f(1,:));
    fh = zeros(L2,L1);                                        
    th = zeros(L1,L2);


    % first FFT over the rows
    for n2=0:L2-1
        for k2 = 0:L2-1
            for k1 = 0:L1-1                        
                th(k1+1,n2+1) = th(k1+1,n2+1) + f(k1+1,k2+1)*exp(-2*pi*1i*k1*n2/(L1*L2))*exp(-2*pi*1i*n2*k2/L2);        
            end        
        end
    end    

    % transposition 
    th = th';

    % second FFT over columns, i think this can be sped up
    for n1 = 0:L1-1
        for n2 = 0:L2-1
            for k1 = 0:L1-1
                fh(n2+1,n1+1) = fh(n2+1,n1+1) + th(n2+1,k1+1)*exp(-2*pi*1i*n1*k1/L1);
            end
        end
    end

    % transposition
    fh = fh';
end