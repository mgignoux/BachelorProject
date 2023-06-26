function dims = getNextDims(n,L)
    
    dims = ones(1,length(L));

    for i = 1:length(L)
        if mod(L(i),2) == 0 && n(i) > 4 || mod(L(i),2) == 1 && n(i) > 2
            dims(i) = 2;

        end
    end
end

     