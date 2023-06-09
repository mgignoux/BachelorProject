% Cyclic DFT {L}
% Cyclic Cooley Tukey
% Cyclic PFA
% Cyclic Bluenstein

clear all;

Lmin = 1;
Lmax = 100;
naiveTimes = zeros(1,Lmax);
mixedFFTTimes = zeros(1,Lmax);
PFATimes = zeros(1,Lmax);
FFTWTTimes = zeros(1,Lmax);

for i = Lmin:Lmax
    vector = rand(1,i);
    naiveTimes(i) = timeit(@() DFTnaive(vector)); 
    mixedFFTTimes(i) = timeit(@() FFTmixed(vector,factor(i)));
    PFATimes(i) = timeit(@() PFA(vector,factor(i))); 
    FFTWTTimes(i) = timeit(@() fft(vector));
end

%%
figure
plot(Lmin:Lmax,naiveTimes,Lmin:Lmax,mixedFFTTimes,Lmin:Lmax,PFATimes,Lmin:Lmax,FFTWTTimes)
legend("naive","mixed","PFA","FFTW")

%%
% Abelian Naive {s,L}
% Abelian Fast

%%
% Dihedral Naive {L}
% Dihedral Fast
clear all;

Lmin = 4;
Lmax = 100;
dihedralNaiveTimes = zeros(1,Lmax-Lmin+1);
dihedralFFTTimes = zeros(1,Lmax-Lmin+1);

for i = Lmin:Lmax
    vector = rand(2,i);
    dihedralNaiveTimes(i-Lmin+1) = timeit(@() dihedralDFT(vector)); 
    dihedralFFTTimes(i-Lmin+1) = timeit(@() dihedralFFT(vector));
end

%%
figure
plot(Lmin:Lmax,dihedralNaiveTimes,Lmin:Lmax,dihedralFFTTimes)
legend("naive","fast")

%%

% DiProd Naive {s,L}
% DiProd Fast


