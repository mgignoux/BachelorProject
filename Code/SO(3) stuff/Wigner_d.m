function rep = Wigner_d(x,n,i,j)
    if j >= i
        epsilon = 1;
    elseif j < i
        epsilon = (-1)^(j-i);
    end

    u = abs(i-j);
    v = abs(i+j);

    factorial1 = factorial(n-(u+v)/2);
    factorial2 = factorial(n+(u+v)/2);
    factorial3 = factorial(n-(u-v)/2);
    factorial4 = factorial(n+(u-v)/2);
    rep = epsilon*sqrt(factorial1*factorial2/factorial3*factorial4)*2^(-(u+v)/2)*(1-x)^(u/2)*(1+x)^(v/2)*jacobiP(n-(u+v)/2,u,v,x);
