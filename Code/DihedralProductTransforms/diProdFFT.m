function fh = diProdFFT(f)
    fdims = size(f);
    fhdims = findDiProdDims(fdims);
    helper = 0;
    fh = cell(fhdims);
    fhdims
    rep = 1;

    tempFFT1 = dihedralFFT(f(:,:,1));
    for k_lin_idx = 2:prod(fdims(3:end))
        tempFFT1 = cellfun(@plus, tempFFT1, dihedralFFT(f(:,:,k_lin_idx)), 'Uni', 0);
    end

    fperm = permute(f,circshift(1:length(fdims),-2));
    fpermdims = size(fperm)
    tempFFT2 = dihedralFFT(fperm(:,:,1));

    for k_lin_idx = 2:prod(fpermdims(3:end))
        tempFFT2 = cellfun(@plus, tempFFT2, dihedralFFT(fperm(:,:,k_lin_idx)), 'Uni', 0);
    end
    
    out = cell(length(tempFFT1),length(tempFFT2));
    for j = 1:length(tempFFT1)
        for k = 1:length(tempFFT2)
            kron(tempFFT1{j},tempFFT2{k})
            out{j,k}=kron(tempFFT1{j},tempFFT2{k});
        end
    end 
    fh = out
end
