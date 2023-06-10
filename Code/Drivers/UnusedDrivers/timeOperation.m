function timeOperation()
    tic
        rand(1)*exp(-2*pi*1i*randi(100,1)*randi(100,1)/randi(100,1));
    toc
end