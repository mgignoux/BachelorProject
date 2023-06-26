function val = subIndex(n,L)

    for i = 1:length(L)
        if mod(L(i),2) == 0 && n(i) > 5 
            val(i) = n(i)+3*(n(i)-5);
        elseif mod(L(i),2) == 1 && n(i) > 3
            val(i) = n(i)+3*(n(i)-3);
        else 
            val(i) = n(i);
        end
    end
end