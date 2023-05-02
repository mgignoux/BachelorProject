% make orthogonal codes

for a = -1:2:1
    for b = -1:2:1
        for c = -1:2:1
            for d = -1:2:1
                for e = -1:2:1
                    for f = -1:2:1
                        for g = -1:2:1
                            for h = -1:2:1
                                if  (-a-b-c+d+e-h+f+g == 0) && (-a-b+c-d+e+f+g-h==0) && (-a+b-c+d+e+f-g-h==0) && (-a+b-c-d-e-f+g-h==0)
                                    ans = [a,b,c,d,e,f,g,h]
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end