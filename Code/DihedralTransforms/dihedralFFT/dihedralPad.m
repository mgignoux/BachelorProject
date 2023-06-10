function [pad11, pad12, pad21, pad22] = dihedralPad(fh,L)
    
    if mod(L,2) == 0
        helper1 = 5;
        helper2 = L/2;
    elseif mod(L,2) == 1
        helper1 = 3;
        helper2 = (L-1)/2;
    end

    dim2Coef = fh(helper1:end);
    dim2Coef = [cat(3,dim2Coef{:})];

    dim2Coef11 = dim2Coef(1,1,:);
    dim2Coef12 = dim2Coef(1,2,:);
    dim2Coef21 = dim2Coef(2,1,:);
    dim2Coef22 = dim2Coef(2,2,:);

    pad11 = padarray(dim2Coef11(:),helper2,0,"post");
    pad12 = padarray(dim2Coef12(:),helper2,0,"post");
    pad21 = padarray(dim2Coef21(:),helper2,0,"post");
    pad22 = padarray(dim2Coef22(:),helper2,0,"post");

    pad11 = padarray(pad11,1,0,"pre");
    pad12 = padarray(pad12,1,0,"pre");
    pad21 = padarray(pad21,1,0,"pre");
    pad22 = padarray(pad22,1,0,"pre");

end