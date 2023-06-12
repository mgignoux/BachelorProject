function fhdims = findDiProdDims(fdims)
    Ls = fdims(2:2:end);
    fhdims = zeros(1,length(Ls));
    for i = 1:length(Ls)
        if mod(Ls(i),2) == 0
            fhdims(i) = 3 + Ls(i)/2;
        elseif mod(Ls(i),2) == 1
            fhdims(i) = 2 + (Ls(i)-1)/2;
        end
    end
end