function E = specialMatrix(M,N,setting)
    E = zeros(M,N);
    key = -1;

    if setting == "inv"
        key = 1;
    end

    for i = 0:M-1
        for j = 0:N-1
            E(i+1,j+1) = exp(key*2*pi*1i*i*j/N);
        end
    end

end