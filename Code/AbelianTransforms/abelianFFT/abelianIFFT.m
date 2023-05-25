function f = abelianIFFT(fh,ndims_transformed)
    dims = size(fh);

    if ndims_transformed == length(dims)
        f = fh;

    else 
        th = zeros(dims);
    %     k_idx_cell = cell(1,length(dims(2:end-ndims_transformed)));
    
        for n_lin_idx = 1:prod(dims(2:end))
    %         [k_idx_cell{:}] = ind2sub(dims(2:end-ndims_transformed),k_lin_idx);
    %         k_idx = cell2mat(k_idx_cell);
    
            th(:,n_lin_idx) = IDFTnaive(fh(:,n_lin_idx));
        end

        f = abelianIFFT(permute(th,circshift(1:length(dims),1)),ndims_transformed+1);
    end
end