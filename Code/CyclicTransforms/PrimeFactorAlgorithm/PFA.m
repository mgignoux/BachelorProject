function fh = PFA(f,factors)

    if length(factors) == 1
        fh = DFTnaive(f);

    else
        L1 = factors(1);    L2 = prod(factors(2:end));
        f = reinterpretPFA(f,L1,L2);
        fh = zeros(L2,L1);  th = zeros(L1,L2);

        % first FFT over the rows
        for k1 = 0:L1-1                        
            th(k1+1,:) = PFA(f(k1+1,:),factors(2:end));        
        end        
            
        % second FFT over columns
        for n2 = 0:L2-1
            fh(n2+1,:) = DFTnaive(th(:,n2+1));
        end

        % transposition
        fh = uninterpretPFA(fh,L1,L2);
    end
end