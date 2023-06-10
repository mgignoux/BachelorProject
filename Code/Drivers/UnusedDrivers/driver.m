% DRIVER

x = rand(16);

DFTnaivex = DFTnaive(x);
IDFTnaivex = IDFTnaive(x);

FFTr2x = FFTr2(x);
IFFTr2x = IFFTr2(x);

FFTrNx = FFTrN(x,2);
IFFTrNx = IFFTrN(x,2);

naiveId = IDFTnaive(DFTnaive(x));
r2Id = IFFTr2(FFTr2(x));
rNId = IFFTrN(FFTrN(x,4),4);

if min(abs(DFTnaivex-FFTr2x) < 1e-15) && min(abs(FFTrNx-FFTr2x) < 1e-15)
    fprintf("Check 1 (same transforms): passed \n")
end

if min(abs(IDFTnaivex-IFFTr2x) < 1e-14) && min(abs(IFFTrNx-IFFTr2x) < 1e-14)
    fprintf("Check 2 (same inverse transforms): passed \n")
end

if min(abs(naiveId-x) < 1e4*eps(min(abs(naiveId),abs(x)))) && min(abs(r2Id-x) < 1e4*eps(min(abs(r2Id),abs(x)))) && min(abs(rNId-x) < 1e4*eps(min(abs(rNId),abs(x))))
    fprintf("Check 3 (cancellation): passed \n")
end