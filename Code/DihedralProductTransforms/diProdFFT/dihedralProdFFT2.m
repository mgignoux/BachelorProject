function fh = dihedralProdFFT2(f,n)
    fdims = size(f);
%     disp(1);
    finaldims = getthdims(fdims,length(fdims));

    dims = getDimNew(n,fdims(2:2:end));
    dim = prod(dims);

    fh = zeros(dim,dim);
    for i = 1:dim
        for j = 1:dim
            ndims_transformed = 0;
            thold = f; pold = i; qold = j;

            while ndims_transformed ~= length(fdims)
                ndims_transformed = ndims_transformed + 2;
                [p,q,pold,qold] = getTensorCoefNew(dims(ndims_transformed/2+1:end),pold,qold);
                tholddims = size(thold);
                thdims = tholddims(3:end);
                th = zeros(thdims);
        
                for k_lin_idx = 1:prod(tholddims(3:end))
                    helper = dihedralFFT(thold(:,:,k_lin_idx));
                    helper2 = helper{n(ndims_transformed/2)};
                    th(k_lin_idx) = helper2(p,q);  
                end

                thold = th;
            end

            fh(i,j) = thold;
        end
    end   
end