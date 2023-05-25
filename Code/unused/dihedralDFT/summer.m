function out = summer(in)

out1 = 0;
out2 = 0;
out3 = 0;
out4 = 0;

for j3 = 1:3
%     for j4 = 1:6
        out1 = in(1,1,j3);
        out2 = in(1,2,j3);
        out3 = in(2,1,j3);
        out4 = in(2,2,j3);
    end

out = [out1 out2 out3 out4];
