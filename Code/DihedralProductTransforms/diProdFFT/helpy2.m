function val = helpy2(idx, size)
    val = idx(1);
    mul_term = 1;
    for i = 2:length(size)
        mul_term = mul_term*size(i-1);
        val = val + (idx(i)-1)*mul_term;
    end 

end