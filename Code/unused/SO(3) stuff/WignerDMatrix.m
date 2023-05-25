function dfinal = WignerDMatrix(L, G, Q)
    
for q = 1:Q
    d = [];
    alpha = G(1,q); beta = G(2,q); gamma = G(3,q);
    for l = 0:L-1
        dl = zeros(2*l+1,2*l+1);
        for m = -l:l
            for n = -l:l
                dl(m+l+1,n+l+1)=WignerD(alpha,beta,gamma,l,m,n);
            end
        end
        d = blkdiag(d, dl);
    end
    dfinal(q,:) = d(:);
end
