function fh = dihedralProdFFT(f,n)
    ndims_transformed = 0;
    fdims = size(f);
    thold = f;

    while ndims_transformed ~= length(fdims)
        ndims_transformed = ndims_transformed + 2;
        thdims = getthdims(fdims,ndims_transformed);
        th = zeros(thdims);
        tholddims = size(thold);

        for k_lin_idx = 1:prod(tholddims(3:end))
            p = 1; q = 1;
            helper = dihedralFFT(thold(:,:,k_lin_idx));
            helper2 = helper{n(ndims_transformed/2)};
            th(k_lin_idx) = helper2(1,1);        
        end

        if ndims_transformed < length(fdims)
            thold = permute(th,circshift(1:length(thdims),-ndims_transformed/2));
        else 
            thold = th;
        end
    end

    fh = thold;
end
