function rep = diProdRep2(n,k,Ldims)
    rep = 1;

    for l = 1:length(Ldims)
        ktemp = k(2 * l);
        ntemp = n(l);
        
        rep = kron(rep,dihedralRep2(k(2*l-1)-1,ktemp-1,ntemp-2,Ldims(l)));
    end   
end
