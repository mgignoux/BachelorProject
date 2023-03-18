function [p1,p2,L1,L2] = niceFactors(p)
    p1 = getEvensOrOdds(p,"even");
    p2 = getEvensOrOdds(p,"odd");
    L1 = prod(p1);
    L2 = prod(p2);
end