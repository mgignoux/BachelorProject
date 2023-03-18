function M = reinterpret(f,N)
    L = length(f);

    if mod(L/N,1) ~=0
        fprintf("error")

    else 
        M = zeros(N,L/N);

        helper = 1;

        for i = 1:L
            M(mod(i-1,N)+1,helper) = f(i);

            if mod(i/N,1)==0
                helper = helper + 1;
                
            end
        end
    end 
end