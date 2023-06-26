function f = abelianIFFT(fh)
    dims = size(fh);
    th_old = fh;
    ndims_transformed = 0;    

    while not(ndims_transformed == length(dims))
        thdims = size(th_old); 
        th = zeros(thdims);

        for k_lin_idx = 1:prod(thdims(2:end))
            th(:,k_lin_idx) = mixedRadixIFFT(th_old(:,k_lin_idx),factor(length(th_old(:,k_lin_idx))));
            
        end
        
        ndims_transformed = ndims_transformed + 1;
        th_old = permute(th,circshift(1:length(thdims),-1));
    end

    f = th_old;
end
