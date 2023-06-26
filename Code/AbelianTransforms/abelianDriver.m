clear all

%% RUNTIME TESTING

LMin = 2;
LMax = 6;
sMin = 2;
sMax = 6;
abelianDFTTimes = zeros(LMax-LMin+1,sMax-sMin+1);
abelianFFTTimes = zeros(LMax-LMin+1,sMax-sMin+1);

for s = sMin:sMax
    for L = LMin:LMax
        vector = rand(L*ones(1,s)) + 1i.*rand(L*ones(1,s));
        fprintf("Testing Abelian DFT algorithms for group size: %d \n", L^s)

        abelianDFTTimes(L-LMin+1,s-sMin+1) = timeit(@() abelianDFT(vector));
        abelianFFTTimes(L-LMin+1,s-sMin+1) = timeit(@() abelianFFT(vector));
    end
end

%% DISPLAY PLOTS OF NAIVE RUNTIME RESULTS

colormap(parula)
s = pcolor(LMin:LMax,sMin:sMax,log(abelianDFTTimes));
shading flat
s.FaceColor = 'interp';
s.EdgeColor = [0 0 0];
s.LineWidth = 1;
xticks(LMin:LMax)
xticklabels(string(LMin:LMax))
yticks(sMin:sMax)
yticklabels(string(sMin:sMax))
colorbar
clim([floor(log(min(min(abelianFFTTimes)))),ceil(log(max(max(abelianDFTTimes))))])
title(["Time Analysis of Naive Abelian DFT","on Random Data"],"FontSize",15)
xlabel('Size of Composing Cyclic Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)

%% DISPLAY PLOTS OF FAST RUNTIME RESULTS

colormap(parula)
s = pcolor(LMin:LMax,sMin:sMax,log(abelianFFTTimes));
shading flat
s.FaceColor = 'interp';
s.EdgeColor = [0 0 0];
s.LineWidth = 1;
xticks(LMin:LMax)
xticklabels(string(LMin:LMax))
yticks(sMin:sMax)
yticklabels(string(sMin:sMax))
colorbar
clim([floor(log(min(min(abelianFFTTimes)))),ceil(log(max(max(abelianDFTTimes))))])
title(["Time Analysis of Abelian FFT","on Random Data"],"FontSize",15)
xlabel('Size of Composing Cyclic Groups','fontsize', 14)
ylabel('Number of Composing Groups','fontsize', 14)






















