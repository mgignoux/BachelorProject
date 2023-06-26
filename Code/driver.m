% Enter your own functions f and test the algorithms!

%% Cyclic DFT

f = 1i*(1:512)+(1:512);
factors = (factor(length(f)));

cyclicDFTError = norm(max(f - cyclicIDFT(cyclicDFT(f)),[],"all"));
fprintf("Naive cyclic DFT computed with %d machine error \n", cyclicDFTError)
mixedFFTError = norm(max(f - mixedRadixIFFT(mixedRadixFFT(f,factor(length(f))),factor(length(f))),[],"all"));
fprintf("Mixed-Radix FFT computed with %d machine error \n", mixedFFTError)
PFAError = norm(max(f - IPFA(PFA(f,factor(length(f))),factor(length(f))),[],"all"));
fprintf("PFA computed with %d machine error \n", PFAError)

%% Abelian DFT

f = reshape(1i*(1:512)+(1:512),[8,8,8]);

abelianDFTError = norm(max(f - abelianIDFT(abelianDFT(f)),[],"all"));
fprintf("Naive Abelian DFT computed with %d machine error \n", abelianDFTError)
abelianFFTError = norm(max(f - abelianIFFT(abelianFFT(f)),[],"all"));
fprintf("Abelian FFT computed with %d machine error \n", abelianFFTError)

%% Dihedral DFT

f = reshape(1i*(1:512)+(1:512),[2,256]);

dihedralDFTError = norm(max(f - dihedralIDFT(dihedralDFT(f)),[],"all"));
fprintf("Naive Dihedral DFT computed with %d machine error \n", dihedralDFTError)
dihedralFFTError = norm(max(f - dihedralIFFT(dihedralFFT(f)),[],"all"));
fprintf("Dihedral FFT computed with %d machine error \n", dihedralFFTError)


%% Dihedral Product DFT

f = reshape(1i*(1:512)+(1:512),[2,4,2,4,2,4]);

diProdDFTError = norm(max(f - diProdIDFT(diProdDFT(f),size(f)),[],"all"));
fprintf("Naive Dihedral Product DFT computed with %d machine error \n", diProdDFTError)
diProdFFTError = norm(max(f - diProdIDFT(diProdFFT(f),size(f)),[],"all"));
fprintf("Dihedral Product FFT computed with %d machine error \n", diProdFFTError)

