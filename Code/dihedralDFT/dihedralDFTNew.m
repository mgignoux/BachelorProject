function fh = dihedralFFT(f)
    fh = [DFTnaive(f(1,:)), IDFTnaive(f(2,:)) ; DFTnaive(f(2,:)), IDFTnaive(f(1,:))];