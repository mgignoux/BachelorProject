function fh = diProdDFT(f)
    fdims = size(f);
    Ldims = fdims(2:2:end);
    fhdims = findDiProdDims(fdims);
    fh = cell(fhdims);
    n_idx_cell = cell(1,ndims(fh));
    k_idx_cell = cell(1,ndims(f));

    for n_lin_idx = 1:prod(fhdims)
        [n_idx_cell{:}] = ind2sub(fhdims,n_lin_idx);
        n_idx = cell2mat(n_idx_cell);

        sum = 0; 

        for k_lin_idx = 1:numel(f)       
            [k_idx_cell{:}] = ind2sub(size(f),k_lin_idx);
            k_idx = cell2mat(k_idx_cell);
            
            sum = sum + f(k_lin_idx).*(conj(diProdRep(n_idx,k_idx,Ldims)));
            fh{n_lin_idx} = sum;
        end
    end

    fh = cellfun(@(x) x/numel(f),fh,'UniformOutput',false);
end
