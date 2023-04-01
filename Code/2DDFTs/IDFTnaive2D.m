function f = IDFTnaive2D(fh)
    L1 = length(fh(:,1)); 
    L2 = length(fh(1,:));
    f = zeros(L1,L2);                                        

    for n1=0:L1-1
        for n2 = 0:L2-1
            for k1 = 0:L1-1
                for k2 = 0:L2-1                        
                    f(n1+1,n2+1) = f(n1+1,n2+1) + fh(k1+1,k2+1)*exp(2*pi*1i*n1*k1/L1)*exp(2*pi*1i*n2*k2/L2);        
                end        
            end
        end
    end                                  
end