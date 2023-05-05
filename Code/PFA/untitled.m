function f = IPFA(fh,L1,L2)
    fh = reinterpretPFA(fh,L1,L2);
    f = zeros(L2,L1);                                        
    t = zeros(L1,L2);

    % first FFT over the rows
    for k1 = 0:L1-1                        
        t(k1+1,:) = fft(fh(k1+1,:));        
    end        
        
    % second FFT over columns
    for n2 = 0:L2-1
        f(n2+1,:) = fft(t(:,n2+1));
    end

    % transposition
    f = uninterpretPFA(f,L1,L2);
end