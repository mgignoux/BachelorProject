function f = SO3IFFT(fh,R,L)
[~,Q] = size(R);
f = zeros(1,Q);

for q = 1:Q
    for n = 0:L
        for i = -n:n
            for j = -n:n
                alpha = R(1,q);
                beta = R(2,q);
                gamma = R(3,q);
                f(q) = f(q) + fh(n+1,i+n+1,j+n+1).*WignerD(alpha,beta,gamma,n,i,j);
            end
        end
    end
end
