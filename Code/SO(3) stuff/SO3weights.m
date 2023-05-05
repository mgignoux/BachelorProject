function w = SO3weights(L, G, Q)
    A = ProbMatrix(L,G,Q);
    [Q, Dn] = size(A);
    e = eye(Dn);
    e = e(:,1);

    w = optimvar('w', Q);
    prob = optimproblem;
    prob.Objective = A'*w-e;
    prob.Constraints.cons1 = w>=0;

    sol = solve(prob);
    w = sol.w;
    w = w(:, end);
end