function f = dihedralIFFT2(fh)
    f(1,:) = DFTnaive(fh(1,1,:)) + IDFTnaive(fh(2,2,:));
    f(2,:) = DFTnaive(fh(1,2,:)) + IDFTnaive(fh(2,1,:));
end