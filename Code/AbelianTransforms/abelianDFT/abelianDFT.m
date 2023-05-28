function fh = abelianDFT(f)
    dims = size(f)
    i = 0;
    fh = zeros(dims);
    n_idx_cell = cell(1,ndims(f));
    k_idx_cell = cell(1,ndims(f));
    
    for n_lin_idx = 1:numel(f)
        [n_idx_cell{:}] = ind2sub(size(f),n_lin_idx);
        n_idx = cell2mat(n_idx_cell);

        for k_lin_idx = 1:numel(fh)       
            [k_idx_cell{:}] = ind2sub(size(f),k_lin_idx);
            k_idx = cell2mat(k_idx_cell);
            
            fh(n_lin_idx) = fh(n_lin_idx) + f(k_lin_idx)*conj(abelRep(n_idx,k_idx,dims));
        end
    end
end