function fh = dim2DiProdFFT(f)
    fdims = size(f);
    L1 = fdims(2); L2 = fdims(4); 
    th = zeros(2,L2);
    fhdims = findDiProdDims(fdims);
    fh = cell(fhdims);

    for n = 1:fhdims(1)
        for m = 1:fhdims(2)
            [dim,dim2] = getDim(n,m,L1,L2);
            fhe = zeros(dim);
            for i = 1:dim
                for j = 1:dim
                    [p1,q1,p2,q2] = getTensorCoef(dim2,i,j);
                    % first FFT over the rows
                    for k1_2 = 0:1
                        for k2_2 = 0:L2-1
                            helper = dihedralFFT(f(:,:,k1_2+1,k2_2+1));
                            helper2 = helper{n};
                            th(k1_2+1,k2_2+1) = helper2(p1,q1); 
                        end
                    end        
            
                % second FFT over the columns 
                    helper = dihedralFFT(th(:,:));
                    helper2 = helper{m};
                    fhe(i,j) = helper2(p2,q2); 
                end
            end

            fh{n,m} = fhe;
        end
    end
end