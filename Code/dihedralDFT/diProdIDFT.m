function f = diProdIDFT(fh)
    fhdims = size(fh);
    fdims = 2*ones(1,2*(length(fhdims)-2));
    fdims(2:2:end) = fhdims(3:end);
    f = zeros(fdims);
    n_idx_cell = cell(1,ndims(fh(3:end)));
    k_idx_cell = cell(1,ndims(f));
    fdims 
    fhdims
    

    for k_lin_idx = 1:numel(f)       
        [k_idx_cell{:}] = ind2sub(size(f),k_lin_idx);
        k_idx = cell2mat(k_idx_cell);

        for n_lin_idx = 1:prod(fhdims(3:end))
            [n_idx_cell{:}] = ind2sub(size(fh(3:end)),n_lin_idx);
            n_idx = cell2mat(n_idx_cell);

            f(k_lin_idx) = f(k_lin_idx) + sum(fh(:,:,n_lin_idx).*diProdRep(n_idx,k_idx,fdims),"all");
        end
    end
end