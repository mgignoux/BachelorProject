function fh = diProd2(f)
    fdims = size(f);
    fhdims = fdims(2:2:end);
    fh = zeros(fhdims);
    n_idx_cell = cell(1,ndims(fh));
    k_idx_cell = cell(1,ndims(f));

    for n_lin_idx = 1:numel(fh)
        [n_idx_cell{:}] = ind2sub(fhdims,n_lin_idx);
        n_idx = cell2mat(n_idx_cell);

        sum = 0; 

        for k_lin_idx = 1:numel(f)       
            [k_idx_cell{:}] = ind2sub(size(f),k_lin_idx);
            k_idx = cell2mat(k_idx_cell);
            
            sum = sum + f(k_lin_idx).*(conj(diProdRep(n_idx,k_idx,fhdims)));
            fh(n_lin_idx) = sum;
        end
    end
end
