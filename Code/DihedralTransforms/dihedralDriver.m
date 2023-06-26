clear all

%% RUNTIME TESTING

Lmin = 2;                                                                   
Lmax = 500;                                                                
dihedralDFTTimes = zeros(1,Lmax-Lmin+1);
dihedralFFTTimes = zeros(1,Lmax-Lmin+1);

for i = Lmin:Lmax
    fprintf("Testing Dihedral DFT algorithms for group size: %d \n", 2*i)
    vector = rand(2,i) + 1i.*rand(2,i);
    dihedralDFTTimes(i-Lmin+1) = timeit(@() dihedralDFT(vector)); 
    dihedralFFTTimes(i-Lmin+1) = timeit(@() dihedralFFT(vector));
end

%% DISPLAY PLOTS OF RUNTIME RESULTS

figure
plot(2*(Lmin:Lmax),dihedralDFTTimes,2*(Lmin:Lmax),dihedralFFTTimes)
legend("naive","fast")
title(["Time Analysis of Different Dihedral DFT Algorithms","on Random Data"],"FontSize",15)
xlabel('Group Size',"FontSize",15) 
ylabel('Run Time (s)',"FontSize",15) 

%% RUNNING AVERAGE

kb = 50;                                                                    
kf = 50;                                                                    
dihedralDFTAve = movmean(dihedralDFTTimes,[kb,kf]);                                     
dihedralFFTAve = movmean(dihedralFFTTimes,[kb,kf]);

%% DISPLAY PLOTS OF RUNNING AVERAGE RESULTS

figure
plot(Lmin:Lmax,dihedralDFTAve,Lmin:Lmax,dihedralFFTAve)
legend("naive","fast")
title(["Time Analysis of Different Dihedral DFT Algorithms","on Random Data with Running Average"],"FontSize",15)
xlabel('Group Size',"FontSize",15) 
ylabel('Run Time (s)',"FontSize",15) 


