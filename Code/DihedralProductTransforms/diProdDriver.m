clear all

%% RUNTIME TESTING

LMin = 2;
LMax = 6;
sMin = 2;
sMax = 6;
diProdDFTTimes = zeros(LMax-LMin+1,sMax-sMin+1);
diProdFFTTimes = zeros(LMax-LMin+1,sMax-sMin+1);

for s = sMin:sMax
    for L = LMin:LMax
        fdims = zeros(1,2*s);
        fdims(1:2:end) = 2*ones(1,s);
        fdims(2:2:end) = L*ones(1,s);
        vector = rand(fdims) + 1i.*rand(fdims);
        fprintf("Testing Dihedral Product DFT algorithms for group size: %d \n", (2*L)^s)

        diProdDFTTimes(L-LMin+1,s-sMin+1) = timeit(@() diProdDFT(vector));
        diProdFFTTimes(L-LMin+1,s-sMin+1) = timeit(@() diProdFFT(vector));
    end
end


%% DISPLAY PLOTS OF NAIVE RUNTIME RESULTS

colormap(parula)
s = pcolor(LMin:LMax,sMin:sMax,log(diProdDFTTimes));
shading flat
s.FaceColor = 'interp';
s.EdgeColor = [0 0 0];
s.LineWidth = 1;
xticks(LMin:LMax)
xticklabels(string(LMin:LMax))
yticks(sMin:sMax)
yticklabels(string(sMin:sMax))
colorbar
clim([floor(log(min(min(diProdFFTTimes)))),ceil(log(max(max(diProdDFTTimes))))])
title(["Time Analysis of Naive Dihedral Product DFT","on Random Data"],"FontSize",15)
xlabel('Size of Composing Dihedral Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

%% DISPLAY PLOTS OF FAST RUNTIME RESULTS

colormap(parula)
s = pcolor(LMin:LMax,sMin:sMax,log(diProdFFTTimes));
shading flat
s.FaceColor = 'interp';
s.EdgeColor = [0 0 0];
s.LineWidth = 1;
xticks(LMin:LMax)
xticklabels(string(LMin:LMax))
yticks(sMin:sMax)
yticklabels(string(sMin:sMax))
colorbar
clim([floor(log(min(min(diProdFFTTimes)))),ceil(log(max(max(diProdDFTTimes))))])
title(["Time Analysis of Dihedral Product FFT","on Random Data"],"FontSize",15)
xlabel('Size of Composing Dihedral Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

















