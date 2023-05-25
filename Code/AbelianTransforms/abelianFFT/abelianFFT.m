function fh = abelianFFT(f,ndims_transformed)
    dims = size(f);

    if ndims_transformed == length(dims)
        fh = f;

    else 
        th = zeros(dims);
    
        for k_lin_idx = 1:prod(dims(2:end))
            th(:,k_lin_idx) = DFTnaive(f(:,k_lin_idx));
            
        end

        fh = abelianFFT(permute(th,circshift(1:length(dims),-1)),ndims_transformed+1);
    end
end
