function fh = FFTr2(f)
    tic
    L = length(f);                                                  

    if L==1 % base case (x->x)                                      
        fh = f(1);
    
    elseif mod(L/2,1) ~= 0 % incorrect input check               
        fh = DFTnaive(f);

    else % recursion                                        
        fh = zeros(1,L);                                            
        fe = f(1:2:end); fo = f(2:2:end);      
        fhe = FFTr2(fe); fho = FFTr2(fo);               % called m times

        for n = 0:L/2-1                                             % runs L/2 times
            fh(n+1) = fhe(n+1) + exp(-2*pi*1i*n/L)*fho(n+1);        % O(2)
            fh(n+1+L/2) = fhe(n+1) - exp(-2*pi*1i*n/L)*fho(n+1);    % O(2)
        end
    end 
    toc
end