function fh = DFTnaive(f)
    L = length(f);                                                                    
    fh = zeros(1,L);                                            
    
    if iscell(f)
        f = cell2mat(f);
    end

    for n=0:L-1                                                                      
        for k=0:L-1                                           
            fh(n+1) = fh(n+1) + f(k+1)*exp(-2*pi*1i*n*k/L);          
        end                                    
    end  
end