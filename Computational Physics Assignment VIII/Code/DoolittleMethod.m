function x = DoolittleMethod(A,b)
%
% DoolittleMethod uses the Doolittle factorization of
% matrix A and solves the ensuing triangular systems to
% find the solution vector x.
%
% x = DoolittleMethod(A,b) where
%
% A is the n-by-n coefficient matrix,
% b is the n-by-1 vector of the right-hand sides,
%
% x is the n-by-1 solution vector.
%
% Ramin S. Esfandiari, Numerical Methods for Engineers and Scientists Using
% Matlab,
% Section 4.4.1, p.115

[L, U] = DoolittleFactor(A);
% Find Doolittle factorization of A

n = size(A,1);
% Solve the lower triangular system Ly = b (forward
% substitution)

y = zeros(n,1);
y(1) = b(1);
for i = 2:n,
    y(i) = b(i)-L(i,1:i-1)*y(1:i-1);
end

% Solve the upper triangular system Ux = y (back
% substitution)
x = zeros(n,1);
x(n) = y(n)/U(n,n);
for i = n-1: -1:1,
    x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
end