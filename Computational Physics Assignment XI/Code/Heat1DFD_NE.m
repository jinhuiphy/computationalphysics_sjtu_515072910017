function u = Heat1DFD_NE(t,x,u,alpha2)
%
% Heat1DFD_NE numerically solves the one-dimensional heat
% equation, with Neumann Boundary Conditions, using the
% finite-difference method.
%
% u = Heat1DFD_NE(t,x,u,alpha2) where
%
% t is the row vector of times to compute,
% x is the column vector of x positions to compute,
% u is the column vector of initial temperatures for
% each value in x,
% alpha2 is a given parameter of the PDE,
% Esfandiari, Ramin S, Numerical Methods for Engineers and Scientists
% Example 10.6, p. 485-487
%
% u is the solution at the mesh points.
u = u(:); % u must be a column vector
ht = t(2)-t(1);
hx = x(2)-x(1);
eta = alpha2*ht/(hx)^2;
if eta > 0.5
    warning('Method is unstable and divergent. Results will be inaccurate.')
end
m = 2:length(x)-1;

for n = 1:length(t)-1
    u(1,n+1) = (1-2*eta)*u(1,n) + 2*eta*(u(2,n));   % For j = 0
    u(m,n+1) = (1-2*eta)*u(m,n) + eta*(u(m-1,n)+u(m+1,n));
    u(end,n+1) = (1-2*eta)*u(end,n) + 2*eta*(u(end-1,n));   % For j = M
end