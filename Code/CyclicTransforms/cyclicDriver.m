clear all

%% RUNTIME TESTING

Lmin = 1;                                                    
Lmax = 3000;                                                    
naiveTimes = zeros(1,Lmax-Lmin+1);
mixedRadixTimes = zeros(1,Lmax-Lmin+1);
PFATimes = zeros(1,Lmax-Lmin+1);

for i = Lmin:Lmax
    fprintf("Testing Cyclic DFT algorithms for group size: %d \n", i)
    vector = rand(1,i) + 1i.*rand(1,i);
    naiveTimes(i-Lmin+1) = timeit(@() cyclicDFT(vector)); 
    mixedRadixTimes(i-Lmin+1) = timeit(@() mixedRadixFFT(vector,factor(i)));
    PFATimes(i-Lmin+1) = timeit(@() PFA(vector,factor(i))); 
end

%% DISPLAY PLOTS OF RUNTIME RESULTS

figure
plot(Lmin:Lmax,naiveTimes,Lmin:Lmax,mixedRadixTimes,Lmin:Lmax,PFATimes)
legend("naive","mixed","PFA")
title(["Time Analysis of Different Cyclic DFT Algorithms","on Random Data"],"FontSize",15)
xlabel('Group Size (L)',"FontSize",15) 
ylabel('Run Time (s)',"FontSize",15) 

%% RUNNING AVERAGE

kb = 50;                                                   
kf = 50;                                                                    
naiveAve = movmean(naiveTimes,[kb,kf]);                                     
mixedRadixAve = movmean(mixedRadixTimes,[kb,kf]);
PFAAve = movmean(PFATimes,[kb,kf]);

%% DISPLAY PLOTS OF RUNNING AVERAGE RESULTS

figure
plot(Lmin:Lmax,naiveAve,Lmin:Lmax,mixedRadixAve,Lmin:Lmax,PFAAve)
legend("naive","mixed","PFA")
title(["Time Analysis of Different Cyclic DFT Algorithms","on Random Data with Running Average"],"FontSize",15)
xlabel('Group Size (L)',"FontSize",15) 
ylabel('Run Time (s)',"FontSize",15) 


