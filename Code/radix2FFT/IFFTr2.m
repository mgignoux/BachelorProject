function fh = IFFTr2(f)
    L = length(f); 
        
    if L==1 
        fh = f(1);
    
    elseif mod(L/2,1) ~= 0
        fprintf('Error: input vector has incorrect dimensions \n \n')

    else 
        fh = zeros(1,L);
        fe = getEvensOrOdds(f,"even");
        fo = getEvensOrOdds(f,"odd");
        fhe = IFFTr2(fe);
        fho = IFFTr2(fo);

        for n = 0:L/2-1
            fh(n+1) = fhe(n+1) + exp(2*pi*1i*n/L)*fho(n+1);
            fh(n+1+L/2) = fhe(n+1) - exp(2*pi*1i*n/L)*fho(n+1);
        end
    end 
end