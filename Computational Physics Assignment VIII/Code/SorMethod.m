function [x, k] = SorMethod(A, b, x0, w, tol, kmax)
%
% SorMethod uses the successive over-relaxation method to approximate
% the solution of Ax = b.
%
% [x, k] = SorMethod(A, b, x0, w, tol, kmax) where
%
% A is the n-by-n coefficient matrix,
% b is the n-by-1 right-hand side vector,
% w is the coefficient of relaxation less or equal 1
% x0 is the n-by-1 initial vector (default zeros),
% tol is the scalar tolerance for convergence (default 1e-4),
% kmax is the maximum number of iterations (default 100),
%
% x is the n-by-1 solution vector,
% k is the number of iterations required for convergence,

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

% Norm of iteration matrix
P = w*(D+w*L)\b;
Q = (D+L)\((1-w)*D-w*U);

% Perform iterations up to kmax
for k = 1:kmax
    x(:, k+1) = P+Q*x(:, k) ; % Compute next approximation
    if norm(x(:, k+1) - x(:, k)) < tol, break; end    % Check convergence
end
disp("The result does't converge in iterations!");
x = x(:, end);