function w = SO3weights(L)
    e = eye(L);
    e = e(:,1);

    w = optimvar('w',L);
    prob = optimproblem;
    prob.Objective = A*w-e;
    prob.Constraints.cons1 = w>=0;

w = solve(prob)
end