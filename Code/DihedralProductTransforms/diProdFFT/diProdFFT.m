function fh = diProdFFT(f)
    fdims = size(f);
    finaldims = getFinalDims(fdims,length(fdims));
    ndims_transformed = 0;
    thold = f;
    Ldims = fdims(2:2:end);

    while ndims_transformed ~= length(fdims)
        ndims_transformed = ndims_transformed + 2;
        tholddims = size(thold);
        thdims = zeros(1,length(fdims)-ndims_transformed/2);
        thdims(1) = 2*Ldims(ndims_transformed/2);
        thdims(2:end) = tholddims(3:end);
        th = zeros(thdims);

        for k_lin_idx = 1:prod(tholddims(3:end))
            helper = dihedralFFT(thold(:,:,k_lin_idx));
            helper2 = cell2mat(cellfun(@(x) x(:).',helper,'UniformOutput',false));
            th(:,k_lin_idx) = helper2;  
        end

        thold = permute(th,circshift(1:length(fdims)-ndims_transformed/2,-1));
    end

    fh = cell(finaldims);
    n_idx = cell(1,length(finaldims));

    for n_lin_idx = 1:prod(finaldims)    
        [n_idx{:}] = ind2sub(finaldims,n_lin_idx);
        n = cell2mat(n_idx);
        dims = getNextDims(n,fdims(2:2:end));
        dim = prod(dims);
        fhMatrix = zeros(dim,dim);

        for i = 1:dim
            for j = 1:dim
                [p,q] = getTensorCoefficients(dims,i,j);
                subHelper = subIndex(n,Ldims)+p-1+(q-1).*dims;
                linHelper = linearIndex(subHelper,2*Ldims);

                fhMatrix(i,j) = thold(linHelper);
            end
        end

        fh{n_lin_idx} = fhMatrix;
    end
end