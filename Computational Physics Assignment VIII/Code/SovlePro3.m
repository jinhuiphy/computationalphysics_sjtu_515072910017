% % CodeName:SolvePro3.m
% % This code is meant to solve problem 3
% Initial data
epsilon = [-2 -1.5 -1.4343 -1.4128 -1.14031]';
x = [2, 4, 6, 8, 10]';
A = [x.^(0) 1./x.^(1) 1./x.^(2) 1./x.^(3) 1./x.^(4)];
b = epsilon;
ini = ones(size(x));tol=1e-4;kmax=50;
% Solve the linear equation
disp("SOR Method")
[res1, k1] = SorMethod(A, b, ini, 0.5, tol, kmax);
disp(res1)
disp("GS Method")
[res2, k2, GSnorm] = GaussSeidel(A, b, ini, tol, kmax);
disp(res2)
disp("Jacobi Method")
[res3, k3, Jnorm] = Jacobi(A, b, ini, tol, kmax);
disp(res3)
disp("LU Method")
res4 = DoolittleMethod(A, b);
disp(res4);
disp("Built-in")
res5 = A\b;
disp(res5);


