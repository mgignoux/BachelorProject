function fh = IFFTrN(f,N)
    L = length(f);  

    if L==1 
        fh = f(1);
    
    elseif mod(L/N,1) ~= 0
        fprintf('Error: input vector has incorrect dimensions \n \n')

    else 
        f = reinterpret(f,N);
        ffh = zeros(N,L/N);                              
        fh = zeros(1,L);

        for i = 1:N
            ffh(i,:) = IFFTrN(f(i,:),N);
        end
           
        ffh = repeatMatrix(ffh,N);
        ffhp = specialMatrix(N,L,"inv").*ffh;

        for i = 1:L
            fh(i) = sum(ffhp(:,i));
        end
    end 
end