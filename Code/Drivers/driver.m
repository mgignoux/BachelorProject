% Cyclic DFT {L}
% Cyclic Cooley Tukey
% Cyclic PFA
% Cyclic Bluenstein

clear all;

Lmin = 3000;
Lmax = 5000;
naiveTimes = gpuArray(zeros(1,Lmax-Lmin+1));
mixedFFTTimes = gpuArray(zeros(1,Lmax-Lmin+1));
PFATimes = gpuArray(zeros(1,Lmax-Lmin+1));
FFTWTTimes = gpuArray(zeros(1,Lmax-Lmin+1));

for i = Lmin:Lmax
    i
    vector = gpuArray(rand(1,i));
    naiveTimes(i) = timeit(@() DFTnaive(vector)); 
    mixedFFTTimes(i) = timeit(@() FFTmixed(vector,factor(i)));
    PFATimes(i) = timeit(@() PFA(vector,factor(i))); 
    FFTWTTimes(i) = timeit(@() fft(vector));
end

%%
figure
plot(1:Lmax,naiveTimes,1:Lmax,mixedFFTTimes,1:Lmax,PFATimes,1:Lmax,FFTWTTimes)
legend("naive","mixed","PFA","FFTW")

%%
kb = 50;
kf = 50;
naiveTimesmov = movmean(naiveTimes,[kb,kf]);
mixedFFTmov = movmean(mixedFFTTimes,[kb,kf]);
PFATimesmov = movmean(PFATimes,[kb,kf]);

%%
figure
plot(Lmin:Lmax,naiveTimesmov,Lmin:Lmax,mixedFFTmov,Lmin:Lmax,PFATimesmov,Lmin:Lmax,FFTWTTimes)
legend("naive","mixed","PFA","FFTW")

%%
Pmax = 3000;
figure
plot(1:Pmax,naiveTimes(1:Pmax),1:Pmax,mixedFFTTimes(1:Pmax),1:Pmax,PFATimes(1:Pmax))
title('Time Analysis of Different Cyclic DFT Algorithms on Random Data')
xlabel('Group Size') 
ylabel('Run Time (s)') 
legend("naive","mixed","PFA")

%%
Pmax = 3000;
figure
plot(1:Pmax,naiveTimesmov(1:Pmax),1:Pmax,mixedFFTmov(1:Pmax),1:Pmax,PFATimesmov(1:Pmax))
title(["Time Analysis of Different Cyclic DFT Algorithms","on Random Data with Running Average"])
xlabel('Group Size') 
ylabel('Run Time (s)') 
legend("naive","mixed","PFA")



%%
% Abelian Naive {s,L}
% Abelian Fast

Cnaive = zeros(6,6);
Cfast = zeros(6,6);
L = 1:6;
s = 1:6;
for i = 1:6
    for s = 1:6  
        vector = rand(L(i)*ones(1,s));
        size(vector)
        max_time = max(max(Cnaive));

        if max_time <= 100 
            Cnaive(i,s) = timeit(@() abelianDFT(vector));
        else 
            Cnaive(i,s) = 500;
        end
        Cfast(i,s) = timeit(@() abelianFFT(vector,0));
    end
end

%%
X= [1,2,3,4,5,6];
Y= [1,2,3,4,5,6];
%%
k = 1;
for s = 1:6
    for i = 1:6
    
        totalL(k) = L(i).^s;
        AbelNaiveTimes(k) = Cnaive(i,s)
        AbelFastTimes(k) = Cfast(i,s)
        k = k + 1;
    end
end

%%
figure
plot(totalL,AbelNaiveTimes,totalL,AbelFastTimes)
legend("naive","fast")

%%

colormap(parula)
pcolor(X,X,log(Cfast));shading flat
FaceColor = 'interp';
xticks(1:6)
xticklabels({'1','2','3','4','5','6'})
yticks(1:6)
yticklabels({'1','2','3','4','5','6'})
colorbar
clim([-12,6])
title('Log Scaled Time Analysis of Abelian FFT Algorithm on Random Data','fontsize', 16)
%subtitle('The smallest error obtained throughout the iterations.','fontsize', 12)%add titles 
xlabel('Size of Composing Cyclic Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

%%
colormap(parula)
pcolor(X,X,log(Cnaive));shading flat
FaceColor = 'interp';
xticks(1:6)
xticklabels({'1','2','3','4','5','6'})
yticks(1:6)
yticklabels({'1','2','3','4','5','6'})
colorbar
clim([-12,6])
title('Log Scaled Time Analysis of Naive Abelian DFT Algorithm on Random Data','fontsize', 16)
%subtitle('The smallest error obtained throughout the iterations.','fontsize', 12)%add titles 
xlabel('Size of Composing Cyclic Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

%%
% Dihedral Naive {L}
% Dihedral Fast
clear all;

Lmin = 4;
Lmax = 1000;
dihedralNaiveTimes = zeros(1,Lmax-Lmin+1);
dihedralFFTTimes = zeros(1,Lmax-Lmin+1);

for i = Lmin:Lmax
    i
    vector = rand(2,i);
    dihedralNaiveTimes(i-Lmin+1) = timeit(@() dihedralDFT(vector)); 
    dihedralFFTTimes(i-Lmin+1) = timeit(@() dihedralFFT(vector));
end

%%
figure
plot(2*(Lmin:Lmax),dihedralNaiveTimes,2*(Lmin:Lmax),dihedralFFTTimes)
legend("naive","fast")
title(["Time Analysis of Different Dihedral DFT Algorithms","on Random Data"])
xlabel('Group Size') 
ylabel('Run Time (s)') 

%%
kb = 50;
kf = 50;
dihedralNaiveTimesmov = movmean(dihedralNaiveTimes,[kb,kf]);
dihedralFFTTimesmov = movmean(dihedralFFTTimes,[kb,kf]);

%%
figure
plot(2*(Lmin:Lmax),dihedralNaiveTimesmov,2*(Lmin:Lmax),dihedralFFTTimesmov)
title(["Time Analysis of Different Dihedral DFT Algorithms","on Random Data with Running Average"])
xlabel('Group Size') 
ylabel('Run Time (s)') 
legend("naive","fast")


%%

% DiProd Naive {s,L}
% DiProd Fast

Dnaive = zeros(6,6);
Dfast = zeros(6,6);
L = 2:6;

for i = 2:6
    for s = 2:6
        fdims = zeros(1,2*s);
        fdims(1:2:end) = 2*ones(1,s);
        fdims(2:2:end) = L(i)*ones(1,s);
        fdims
        vector = rand(fdims);
        size(vector);
        max_time = max(max(Dnaive));

        if max_time <= 100 
            Dnaive(i,s) = timeit(@() diProdDFT(vector));
        else 
            Dnaive(i,s) = 500;
        end
        Dfast(i,s) = timeit(@() diProdFFT(vector));
    end
end

%%
X= [1,2,3,4,5,6];
Y= [1,2,3,4,5,6];
%%
k = 1;
for s = 1:6
    for i = 1:6
    
        totalL(k) = L(i).^s;
        DiProdNaiveTimes(k) = Dnaive(i,s)
        DiProdFastTimes(k) = Dfast(i,s)
        k = k + 1;
    end
end

%%
figure
plot(totalL,AbelNaiveTimes,totalL,AbelFastTimes)
legend("naive","fast")

%%

colormap(parula)
pcolor(X,X,log(Dfast));shading flat
FaceColor = 'interp';
xticks(1:6)
xticklabels({'1','2','3','4','5','6'})
yticks(1:6)
yticklabels({'1','2','3','4','5','6'})
colorbar
clim([-12,6])
title('Log Scaled Time Analysis of Dihedral Product FFT Algorithm on Random Data','fontsize', 16)
%subtitle('The smallest error obtained throughout the iterations.','fontsize', 12)%add titles 
xlabel('Size of Composing Cyclic Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

%%
colormap(parula)
pcolor(X,X,log(Dnaive));shading flat
FaceColor = 'interp';
xticks(1:6)
xticklabels({'1','2','3','4','5','6'})
yticks(1:6)
yticklabels({'1','2','3','4','5','6'})
colorbar
clim([-12,6])
title('Log Scaled Time Analysis of Naive Dihedral Product DFT Algorithm on Random Data','fontsize', 16)
%subtitle('The smallest error obtained throughout the iterations.','fontsize', 12)%add titles 
xlabel('Size of Composing Cyclic Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

