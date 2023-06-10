function fh = FFTrN(f,N)
    L = length(f);                                          

    if L==1 % base case (x->x)                                  
        fh = f(1);                                         
    
    elseif mod(L/N,1) ~= 0 % incorrect input check                 
        fprintf('input vector has incorrect dimensions \n\n')

    else % recursion
        f = reinterpret(f,N);                                    
        ffh = zeros(N,L/N);                                
        fh = zeros(1,L);                                   

        for i = 1:N                                                 
            ffh(i,:) = FFTrN(f(i,:),N);                            
        end
           
        ffh = repeatMatrix(ffh,N);                                
        ffhp = specialMatrix(N,L,"reg").*ffh;                       

        for i = 1:L                                                
            fh(i) = sum(ffhp(:,i));                               
        end
    end 
end