function fh = dihedralProdCoefFFT(f,n,i,j,ndims_transformed)
    fdims = size(f);
%     fhdims = findDiProdDims(fdims); we need to think about how to put in
%     cells
%     fh = cell(fhdims);

    if ndims_transformed == length(fdims)
        fh = f;
        % put in cell here?

    else 
        thdims = getthdims(L);
        th = zeros(thdims);
    
        for k_lin_idx = 1:prod(dims(3:end))
            helper = dihedralFFT(f(:,:,k_lin_idx))
            helper2 = helper{n}
            th(:,k_lin_idx) = helper2(p1,q1);
            
        end

        fh = dihedralProdFFT(permute(th,circshift(1:length(dims),-1)),ndims_transformed+2);
    end
end
