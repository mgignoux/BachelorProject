function f = IFFTr2(fh)
    L = length(fh); 
        
    if L==1 
        f = fh(1);
    
    elseif mod(L/2,1) ~= 0
        fprintf('Error: input vector has incorrect dimensions \n \n')

    else 
        f = zeros(1,L);
        fhe = fh(1:2:end);
        fho = fh(2:2:end);
        fe = IFFTr2(fhe);
        fo = IFFTr2(fho);

        for n = 0:L/2-1
            f(n+1) = fe(n+1) + exp(2*pi*1i*n/L)*fo(n+1);
            f(n+1+L/2) = fe(n+1) - exp(2*pi*1i*n/L)*fo(n+1);
        end
    end 
end