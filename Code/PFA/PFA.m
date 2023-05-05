function fh = PFA(f,L1,L2)
    f = reinterpretPFA(f,L1,L2);
    fh = zeros(L2,L1);                                        
    th = zeros(L1,L2);

    % first FFT over the rows
    for k1 = 0:L1-1                        
        th(k1+1,:) = fft(f(k1+1,:));        
    end        
        
    % second FFT over columns
    for n2 = 0:L2-1
        fh(n2+1,:) = fft(th(:,n2+1));
    end

    % transposition
    fh = uninterpretPFA(fh,L1,L2);
end