function f = uninterpretComplete(fm,L1,L2,PFA)

    if PFA
        fm = fm.';
        f = zeros(1,L1*L2);
        for n1 = 0:L1-1
            for n2 = 0:L2-1
                f(mod(crt([n2,n1],[L2,L1]),L1*L2)+1) = fm(n2+1,n1+1);
            end
        end
    else 
        
        f = reshape(fm.',1,[]);
    end
end