function f = abelianIDFT(fh)
    dims = size(fh);
    f = zeros(dims);
    n_idx_cell = cell(1,ndims(fh));
    k_idx_cell = cell(1,ndims(fh));
    

    for k_lin_idx = 1:numel(f)       
        [k_idx_cell{:}] = ind2sub(size(fh),k_lin_idx);
        k_idx = cell2mat(k_idx_cell);

        for n_lin_idx = 1:numel(f)
            [n_idx_cell{:}] = ind2sub(size(fh),n_lin_idx);
            n_idx = cell2mat(n_idx_cell);

            f(k_lin_idx) = f(k_lin_idx) + fh(n_lin_idx)*abelRep(n_idx,k_idx,dims);
        end
    end
end