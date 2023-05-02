x = @timeOperation;
op=timeit(x);


%%
rad2times = zeros(1,10);
naivetimes = zeros(1,10);

for i = 1:10
    vector = rand(1,2^i);
    rad2times(i) = timeit(@() FFTr2(vector)); 
    naivetimes(i) = timeit(@() DFTnaive(vector));
end

%%
figure
plot(2.^(1:10),rad2times,2.^(1:10),naivetimes)
legend("radix-2","naive")


%% 
clear all
FFTmixed1times = zeros(1,10);
naivetimes = zeros(1,10);

for i = 1:10
    vector = rand(1,i*100);
    FFTmixed1times(i) = timeit(@() FFTmixed1(vector,factor(length(vector)))); 
    naivetimes(i) = timeit(@() DFTnaive(vector));
end

%%
figure
plot(1:10,FFTmixed1times,1:10,naivetimes)
legend("radix-mixed","naive")

%% 
clear all
FFTmixed1times = zeros(1,10);
FFTmixed2times = zeros(1,10);

for i = 1:10
    vector = rand(1,i*100);
    FFTmixed1times(i) = timeit(@() FFTmixed1(vector,factor(length(vector)))); 
    FFTmixed2times(i) = timeit(@() FFTmixed2(vector,factor(length(vector))));
end

%%
figure
plot(1:10,FFTmixed1times,1:10,FFTmixed2times)
legend("radix-mixed1","radix-mixed2")

%% 

clear all
lnum = 1;
num = 128;
% FFTmixed1times = zeros(1,num);
% FFTmixed2times = zeros(1,num);
% DFTnaivetimes = zeros(1,num);
% FFTr2times = zeros(1,num);
% FFTcompletetimes = zeros(1,num);

for i = 1:num
    vector = rand(1,i);
    FFTcompletetimes(i) = timeit(@() FFTcomplete(vector,factor(length(vector))));
    DFTnaivetimes(i) = timeit(@() DFTnaive(vector)); 
    ffttimes(i) = timeit(@() fft(vector));
end

for i = 1:nextpow2(num)
    vector = rand(1,2.^i);
    FFTr2times(i) = timeit(@() FFTr2(vector)); 
end

k = 1;
for i = 1:num
    if not(isprime(i))
        j(k) = i;
        k = k + 1;
    end
end

for i = 1:k-1
    vector = rand(1,j(i));
    FFTmixed1times(i) = timeit(@() FFTmixed1(vector,factor(length(vector)))); 
    FFTmixed2times(i) = timeit(@() FFTmixed2(vector,factor(length(vector))));    
end
%%
% figure
% plot(j,FFTmixed1times,j,FFTmixed2times,1:num,DFTnaivetimes,2.^(1:nextpow2(num)),FFTr2times,1:num,FFTcompletetimes)
% legend("radix-mixed1","radix-mixed2","DFTnaive","FFTr2","FFTcomplete")

figure()

plot(1:num,DFTnaivetimes,'DisplayName','naive')

hold on 
plot(1:num,FFTcompletetimes,'DisplayName','complete')
plot(1:num,ffttimes,'DisplayName','matlab')
plot(j,FFTmixed1times,'DisplayName','mixed1')
plot(j,FFTmixed2times,'DisplayName','mixed2')
plot(2.^(1:nextpow2(num)),FFTr2times,'DisplayName','radix-2')
hold off

legend

%%
figure()
plot(1:938,DFTnaivetimes,'DisplayName','naive')

hold on 
plot(1:938,FFTcompletetimes,'DisplayName','complete')
plot(1:938,ffttimes,'DisplayName','matlab')

hold off

legend
