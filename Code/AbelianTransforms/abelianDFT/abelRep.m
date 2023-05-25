function rep = abelRep(n_idx,k_idx,dims)
rep = 1;

for i = 1:length(dims)
    rep = rep.*exp((2*pi*1i*(n_idx(i)-1)*(k_idx(i)-1))/dims(i));
end


end