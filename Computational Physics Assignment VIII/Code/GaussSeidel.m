function [x, k, GSnorm] = GaussSeidel(A, b, x0, tol, kmax)
%
% Jacobi uses the Gauss-Seidel iteration method to approximate
% the solution of Ax = b.
%
% [x, k, GSnorm] = GaussSeidel(A, b, x0, tol, kmax) where
%
% A is the n-by-n coefficient matrix,
% b is the n-by-1 right-hand side vector,
% x0 is the n-by-1 initial vector (default zeros),
% tol is the scalar tolerance for convergence (default 1e-4),
% kmax is the maximum number of iterations (default 100),
%
% x is the n-by-1 solution vector,
% k is the number of iterations required for convergence,
% GSnorm is the infinite norm of the Gauss-Seidel iteration
% matrix.
% Esfandiari Ramin, Numerical Methods for Engineers and Scientists using
% Matlab
% Section 4.5, p.132

if nargin < 3 || isempty(x0)
    x0 = zeros(size(b));
end
if nargin < 4 || isempty(tol)
    tol = 1e-4;
end
if nargin < 5 || isempty(kmax)
    kmax = 100;
end

x(:, 1) = x0;
D = diag(diag(A)); At = A - D;
L = tril(At);
U = triu(At);

% Norm of Jacobi iteration matrix
P = (D+L)\b;
Q = -(D+L)\U ; GSnorm = norm(Q, inf);


% Perform iterations up to kmax
for k = 1:kmax
    x(:, k+1) = P+Q*x(:, k) ; % Compute next approximation
    if norm(x(:, k+1) - x(:, k)) < tol, break; end    % Check convergence
end
disp("The result does't converge in iterations!");
x = x(:, end);