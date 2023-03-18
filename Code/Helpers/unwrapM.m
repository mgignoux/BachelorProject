function u = unwrapM(f)
    u = f;

    u([2,end],:) = flip(f([2,end],:));
    u = u';
    u = u(:);
    u = u';
end