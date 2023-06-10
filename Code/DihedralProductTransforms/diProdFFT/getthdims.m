function thdims = getthdims(fdims,ndims_transformed)
    s = length(fdims)/2;
    L = fdims(2:2:end);
    thdims = zeros(1, 2*s-ndims_transformed/2);

    for i = 1:length(thdims)
        if i < ndims_transformed/2+1
            if mod(L(i),2)==0
                thdims(i) = L(i)/2 + 3;
            else 
                thdims(i) = (L(i)-1)/2 + 2;
            end

        else
            thdims(ndims_transformed/2+1:end) = fdims(ndims_transformed+1:end);

        end


    end

end