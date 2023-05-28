function fh = FFTcomplete(f,factors)

    if length(factors) == 1
        fh = DFTnaive(f);

    else
        L1 = factors(1);    L2 = prod(factors(2:end)); 
        fh = zeros(L1,L2);      th = zeros(L1,L2);
        PFA = false;

        if iscoprime([L1,L2])
            PFA = true;
        end

        f = reinterpretComplete(f,L1,L2,PFA==true);  

        parfor k1 = 0:L1-1                        
            th(k1+1,:) = FFTcomplete(f(k1+1,:),factors(2:end));        
        end        

        if not(PFA)
            for k1 = 0:L1-1
                for n2 = 0:L2-1
                    th(k1+1,n2+1)=th(k1+1,n2+1)*exp(-2*pi*1i*k1*n2/(L1*L2));
                end
            end
        end

        parfor n2 = 0:L2-1
            fh(:,n2+1) = DFTnaive(th(:,n2+1)); 
        end
    
        fh = uninterpretComplete(fh,L1,L2,PFA);
    end
end