function f = dihedralIFFTEven(fh)
    L = 2*(length(fh)-3);
    f = zeros(2,L);

    [pad11, pad12, pad21, pad22] = dihedralPad(fh,L);

    for k1 = 0:1
        for k2 = 0:L-1
            for n = 1:4
                f(k1+1,k2+1) = f(k1+1,k2+1) + fh{n}.*dihedralRepEven(k1,k2,n-4,L);
            end
        end
    end

    f(1,:) = f(1,:) + 2*(IDFTnaive(pad11) + DFTnaive(pad22));
    f(2,:) = f(2,:) + 2*(DFTnaive(pad12) + IDFTnaive(pad21));
end
