function fh = dihedralFFT2(f)
    fh(1,1,:) = IDFTnaive(f(1,:));
    fh(2,1,:) = DFTnaive(f(2,:));
    fh(1,2,:) = IDFTnaive(f(2,:));
    fh(2,2,:) = DFTnaive(f(1,:));
end