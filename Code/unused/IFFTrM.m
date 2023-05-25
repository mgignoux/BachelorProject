function fh = FFTrM(f, L1, L2)
    L = length(f);
    f = reinterpret(f,L2)
    fh = zeros(L1,L2)
    th = zeros(L1,L2)

    % calculate intermediate th
    
    for n1 = 0:(L1-1)
        sum = zeros(L2,1);
        for k1 = 0:(L1-1)
            sum = sum + f(k1,:)*exp(-2*pi*1i*n1*k1/L1);
        end
        th(:,n1) = sum;
    end

    % transpose
    th = th';

    % second fft fh


    % transpose
    fh = th;
end