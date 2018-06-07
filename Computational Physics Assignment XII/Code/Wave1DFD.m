function y = Wave1DFD(t,x,y,yt,c)
%
% Wave1DFD numerically solves the one-dimensional wave
% equation, with zero boundary conditions, using the
% finite-difference method.
%
% u = Wave1DFD(t,x,y,yt,c) where
%
% t is the row vector of times to compute,
% x is the column vector of x positions to compute,
% y is the column vector of initial displacements
% for each value in x,
% yt is the column vector of initial velocities for
% each value in x,
% alpha is a given parameter of the PDE,
% Esfandiari, Numerical methods for engineers and scientists
% Section 10.4.1, p. 494-497
%
% u is the solution at the mesh points.
y = y(:); % u must be a column vector
yt = yt(:); % ut must be a column vector
dt = t(2)-t(1);
dx = x(2)-x(1);
r = (dt*c/dx)^2;
if r > 1
   warning('Method is unstable and divergent. Results will be inaccurate.')
end
% the 2. initial position for interior points
m = 2:length(x)-1;
y(m,2) = (1-r)*y(m,1) + r/2*(y(m-1,1) + y(m+1,1)) + dt*yt(m);

% time stepping 
for n = 2:length(t)-1
    y(m,n+1) = -y(m,n-1) + 2*(1-r)*y(m,n) + r*(y(m-1,n) + y(m+1,n));
end 