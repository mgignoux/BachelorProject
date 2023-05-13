function rep = diProdRep(n,k,dims)
    rep = 1;

    for l = 1:length(dims)/2
        ktemp = k(2 * l);
        ntemp = n(l);

        if k(2*l-1) == 1
            rep = kron(rep,dihedralRep(0,ktemp-1,ntemp-1,dims(2*l)));
    
        elseif k(2*l-1) == 2
            rep = kron(rep,dihedralRep(1,ktemp-1,ntemp-1,dims(2*l)));
            
        else
            disp("error")
        end
    end
end
