function [fh,x,thold,helper] = dia(f)
    fdims = size(f);
%     disp(1);
    finaldims = getthdims(fdims,length(fdims))
    ndims_transformed = 0;
 %  dims = getDimNew(n,fdims(2:2:end));
 %   dim = prod(dims);
     thold = f;
     Ldims = fdims(2:2:end);

    while ndims_transformed ~= length(fdims)
        ndims_transformed = ndims_transformed + 2;
        tholddims = size(thold);
        thdims = zeros(1,length(fdims)-ndims_transformed/2);
        thdims(1) = 2*Ldims(ndims_transformed/2);
        thdims(2:end) = tholddims(3:end);
        thdims
        th = zeros(thdims);

        for k_lin_idx = 1:prod(tholddims(3:end))
            helper = dihedralFFT(thold(:,:,k_lin_idx))
            helper2 = cell2mat(cellfun(@(x) x(:).',helper,'UniformOutput',false))
            th(:,k_lin_idx) = helper2;  
        end

        thold = permute(th,circshift(1:length(thdims),-1));
        size(thold)
    end


    d = 1;
    fh = cell(finaldims);
    n_idx = cell(1,length(finaldims));
    for n_lin_idx = 1:prod(finaldims)    
        [n_idx{:}] = ind2sub(finaldims,n_lin_idx);
        n = cell2mat(n_idx);
        dims = getDimNew(n,fdims(2:2:end));
        dim = prod(dims);
        fhh = zeros(dim,dim);

        for i = 1:dim
            for j = 1:dim
                [p,q] = getT(dims,i,j);

                hel = helpy(n,Ldims)+(p-1)+(q-1).*dims;

                lin_hel = helpy2(hel,2*Ldims);
                x(d) = lin_hel;
                d = d+1;
                fhh(i,j) = thold(lin_hel);
            end
        end

        fh{n_lin_idx} = fhh;
    end
end