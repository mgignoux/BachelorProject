function f = diProdIDFT(fh,fdims)
    f = zeros(fdims);
    Ldims = fdims(2:2:end);
    fhdims = findDiProdDims(fdims);
    n_idx_cell = cell(1,ndims(fh));
    k_idx_cell = cell(1,ndims(f));

    for k_lin_idx = 1:numel(f)       
        [k_idx_cell{:}] = ind2sub(fdims,k_lin_idx);
        k_idx = cell2mat(k_idx_cell);

        for n_lin_idx = 1:numel(fh)
            [n_idx_cell{:}] = ind2sub(fhdims,n_lin_idx);
            n_idx = cell2mat(n_idx_cell);
            dim = size(fh{n_lin_idx});

            f(k_lin_idx) = f(k_lin_idx) + sum(dim(1)*fh{n_lin_idx}.*diProdRep(n_idx,k_idx,Ldims),"all");
        end
    end
end