function fh = DFTnaive2D(f)
    L1 = length(f(:,1)); 
    L2 = length(f(1,:));
    fh = zeros(L1,L2);                                        

    for n1=0:L1-1
        for n2 = 0:L2-1
            for k1 = 0:L1-1
                for k2 = 0:L2-1                        
                    fh(n1+1,n2+1) = fh(n1+1,n2+1) + f(k1+1,k2+1)*exp(-2*pi*1i*n1*k1/L1)*exp(-2*pi*1i*n2*k2/L2);        
                end        
            end
        end
    end                                  
end