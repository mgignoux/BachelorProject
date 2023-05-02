function fh = SO3FFT(f,R,L)
[~,Q] = size(R);
fh = zeros(L+1,2*L+1,2*L+1);

for n = 0:L
    for i = -n:n
        for j = -n:n
            for q = 1:Q
                alpha = R(1,q);
                beta = R(2,q);
                gamma = R(3,q);
                fh(n+1,i+n+1,j+n+1) = fh(n+1,i+n+1,j+n+1) + (2*n+1)/(2*pi^2)*f(q).*(WignerD(alpha,beta,gamma,n,i,j));
            end
        end
    end
end
