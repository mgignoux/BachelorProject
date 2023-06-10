function rep = diProdRep(n,k,Ldims)
    rep = 1;
    
    for l = 1:length(Ldims)
        ktemp = k(2 * l);
        ntemp = n(l);
        
        if mod(Ldims(l),2) == 0
            rep = kron(rep,dihedralRepEven(k(2*l-1)-1,ktemp-1,ntemp-4,Ldims(l)));
        elseif mod(Ldims(l),2) == 1
            rep = kron(rep,dihedralRepOdd(k(2*l-1)-1,ktemp-1,ntemp-2,Ldims(l)));
        end
    end
end
