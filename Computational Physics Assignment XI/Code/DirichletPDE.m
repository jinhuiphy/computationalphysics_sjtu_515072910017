function [A,U] = DirichletPDE(x,y,f,uleft,uright,ubottom,utop)
%
% DirichletPDE numerically solves an elliptic PDE with
% Dirichlet boundary conditions over a rectangular
% region.
%
% [A,U] = DirichletPDE(x,y,f,uleft,uright,ubottom,utop) where
%
% x is the 1-by-m vector of mesh points in the x
% direction,
% y is the n-by-1 vector of mesh points in the y
% direction,
% f is the inline function defining the forcing
% function which is in terms of x and y, namely,
% f(x,y),
% ubottom(x),utop(x),uright(y),uleft(y) are the
% functions defining the boundary conditions,
% Esfandiari, Ramin S, Numerical Methods for Engineers and Scientists
% Example 10.1, p. 466-469
%
% U is the solution at the interior mesh points.
m = size(x,2); n = size(y,1); N = (m-2)*(n-2);
A = diag(-4*ones(N,1)); % Create diagonal matrix
A = A + diag(diag(A,n-2)+1,n-2); % Add n-2 diagonal
A = A + diag(diag(A,2-n)+1,2-n); % Add 2-n diagonal
d1 = ones(N-1,1); % Create vector of ones
d1(n-2:n-2:end) = 0; % Insert zeros
A = A + diag(d1,1); % Add upper diagonal
A = A + diag(d1,-1); % Add lower diagonal
[X,Y] = meshgrid(x(2:end-1),y(end-1:-1:2)); % Create mesh
h = x(2)-x(1);
% Define boundary conditions
utopv = zeros(m-2,1);
ubottomv = zeros(m-2,1);
for i = 2:m-1
    utopv(i-1) = utop(x(i));
    ubottomv(i-1) = ubottom(x(i));
end

uleftv = zeros(n,1);
urightv = zeros(n,1);
for i = 1:n
    uleftv(i) = uleft(y(n+1-i));
    urightv(i) = uright(y(n+1-i));
end

% Build vector b
b = zeros(N,1); % Initialize vector b
for i = 1:N
    b(i) = h^2*f(X(i),Y(i));
end
b(1:n-2:N) = b(1:n-2:N)-utopv;
b(n-2:n-2:N) = b(n-2:n-2:N)-ubottomv;
b(1:n-2) = b(1:n-2)-uleftv(2:n-1);
b(N-(n-3):N) = b(N-n+3:N)-urightv(2:n-1);

u = A\b; % Solve the system
U = reshape(u,n-2,m-2);
U = [utopv';U;ubottomv'];
U = [uleftv U urightv];