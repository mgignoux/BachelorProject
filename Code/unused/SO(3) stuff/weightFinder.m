
e = eye(5);
e = e(:,1);

A = 

w = optimvar('w',5);
prob = optimproblem;
prob.Objective = A*w-e;
prob.Constraints.cons1 = w>=0;

sol = solve(prob)