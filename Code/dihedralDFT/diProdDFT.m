function fh = diProdDFT(f)
    fdims = size(f);
    fhdims = [prod(fdims(1:2:end)),prod(fdims(1:2:end)), fdims(2:2:end)];
    fh = zeros(fhdims);
    n_idx_cell = cell(1,ndims(fh(3:end)));
    k_idx_cell = cell(1,ndims(f));
    fdims
    fhdims
    for n_lin_idx = 1:prod(fhdims(3:end))
        [n_idx_cell{:}] = ind2sub(size(fh(3:end)),n_lin_idx);
        n_idx = cell2mat(n_idx_cell);

        for k_lin_idx = 1:numel(f)       
            [k_idx_cell{:}] = ind2sub(size(f),k_lin_idx);
            k_idx = cell2mat(k_idx_cell);
            fh(:,:,n_lin_idx) = fh(:,:,n_lin_idx) + f(k_lin_idx).*(conj(diProdRep(n_idx,k_idx,fdims)));
        end
    end
end
