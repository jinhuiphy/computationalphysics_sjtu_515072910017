function x = ThomasMethod(A,b)
%
% ThomasMethod uses Thomas method to find the solution
% vector x of a tridiagonal system Ax = b.
%
% x = ThomasMethod(A,b) where
%
% A is a tridiagonal n-by-n coefficient matrix,
% b is the n-by-1 vector of the right-hand sides,
%
% x is the n-by-1 solution vector.
%
% ERamin S. Esfandiari, Numerical Methods for Engineers and Scientists Using
% Matlab,
% Section 4.3.4.1 p.111

n = size(A,1);
d = diag(A); % Vector of diagonal entries of A
l = [0;diag(A, -1)]; % Vector of lower diagonal elements
u = [diag(A,1);0]; % Vector of upper diagonal elements
u(1) = u(1)/d(1); b(1) = b(1)/d(1); % First equation
for k = 2:n-1, % The next n?2 equations
    den = d(k) - u(k-1)*l(k);
    if den == 0
        x = 'failure, division by zero';
        return
    end
    u(k)= u(k)/den; b(k) = (b(k)-b(k-1)*l(k))/den;
end
b(n) = (b(n)-b(n-1)*l(n))/(d(n)-u(n-1)*l(n));

% Last equation
x(n) = b(n);
for k = n-1: -1:1,
    x(k) = b(k) - u(k)*x(k+1);
end
x = x';