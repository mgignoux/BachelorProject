rad2times = zeros(1,10);
naivetimes = zeros(1,10);

for i = 1:10
    vector = rand(1,2^i);
    rad2times(i) = timeit(@() FFTr2(vector)); 
    naivetimes(i) = timeit(@() DFTnaive(vector));
end

hold on
plot(i,rad2times)
plot(i,naivetimes)