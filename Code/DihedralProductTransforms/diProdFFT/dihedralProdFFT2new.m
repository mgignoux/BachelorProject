function fh = dihedralProdFFT2new(f)
    fdims = size(f);
    finaldims = getthdims(fdims,length(fdims));
    n_idx = cell(1,length(finaldims));% 
%     n_idx = [n_idx{:}];
    fh = cell(finaldims);

    for n_lin_idx = 1:prod(finaldims)
        [n_idx{:}] = ind2sub(finaldims,n_lin_idx);
        fh{n_lin_idx} = dihedralProdFFT2(f,cell2mat(n_idx));
    end

end