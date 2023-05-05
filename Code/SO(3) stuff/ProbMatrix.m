function A1 = ProbMatrix(L, G, Q)
    
for q = 1:Q
    alpha = G(1,q); beta = G(2,q); gamma = G(3,q);
    next1 = 1; next2 = 1;
    for l = 1:L
        for m = -l:l
            for n = -l:l
                if ((m <= 0) && (0 <= n)) || ((m > 0) && (0 > n))
                    A1(q,next1) = real(WignerD(alpha, beta, gamma, l, m, n)); 
                    next1 = next1 + 1;
                end

                if ((m <= 0) && (0 < -n)) || ((m > 0) && (0 >= -n))
                    A2(q,next2) = imag(WignerD(alpha, beta, gamma, l, m, n));
                    next2 = next2 + 1;
                end
            end
        end
    end

end

A = [A1'; A2'];
