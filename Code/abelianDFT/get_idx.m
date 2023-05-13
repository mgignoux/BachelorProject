function idx = get_idx(lin_idx,dims)
    i = length(dims);
    idx = ones(1,length(dims));
    
    while i > 0
        if lin_idx < prod(dims)/dims(i)
            dims = dims(1:end-1);
            idx(i) = dims(i)
            lin_idx = mod(lin_idx,dims(i));
        else 
            dims = dims(2:end);
            lin_idx = mod(lin_idx,dims(i));
        end
    end
