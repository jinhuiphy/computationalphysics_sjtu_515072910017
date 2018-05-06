% % CodeName:SolvePro4.m
% % This code is meant to solve problem 4
%% Part (a)
fprintf("Part (a)\n");
A = [3,1,0;1,2,1;0,1,1];
x0 = [1,1,1]';
x1 = x0/norm(x0,2);disp(x1)
x2 = A*x1;disp(x2)
alpha2 = x1'*x2;disp(alpha2)
x2 = x2/norm(x2,2);disp(x2)
%% Part (b)
fprintf("Part (b)\n");
[e_val, e_vec, k] = PowerMethod(A, x0, 1e-4, 50);
fprintf("Eigenvalue:\n");disp(e_val)
fprintf("Eigenvector:\n");disp(e_vec)
fprintf("Iterations:\n");disp(k)
%% Part (c)
fprintf("Part (c)\n");
[e_val, e_vec, k] = QRmethod(A, x0, 1e-4, 50);
fprintf("Eigenvalue:\n");disp(e_val)
fprintf("Eigenvector:\n");disp(e_vec)
fprintf("Iterations:\n");disp(k)
