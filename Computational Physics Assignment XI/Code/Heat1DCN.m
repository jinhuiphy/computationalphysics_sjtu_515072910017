function u = Heat1DCN(t,x,u,alpha2)
%
% Heat1DCN numerically solves the one-dimensional heat
% equation, with zero boundary conditions, using the
% Crank-Nicolson method.
%
% u = Heat1DCN(t,x,u,alpha) where
%
% t is the row vector of times to compute,
% x is the column vector of x positions to compute,
% u is the column vector of initial temperatures for
% each value in x,
% alpha is a given parameter of the PDE,
% % Esfandiari, Ramin S, Numerical Methods for Engineers and Scientists
% Section 10.3.2, p.487-481  

% u is the solution at the mesh points.
u = u(:); % u must be a column vector
ht = t(2)-t(1); hx = x(2)-x(1); 
eta = alpha2*ht/(hx^2);

% Compute A
n = length(x);
A = diag(2* (1+eta)*ones(n-2,1));
A = A + diag(diag(A,-1)-eta,-1);
A = A + diag(diag(A,1)-eta, 1);
% Compute B
B = diag(2*(1-eta)*ones(n-2,1));
B = B + diag(diag(B,-1) +eta,-1);
B = B + diag(diag(B,1) +eta,1);
C = A\B;

m = 2:length(x)-1;
for j = 1:length(t)-1
    u(m,j+1) = C*u(m,j);
end