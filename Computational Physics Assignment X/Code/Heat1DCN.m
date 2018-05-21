function u = Heat1DCN(t,x,u,alpha) 
%
% Heat1DCN numerically solves the one-dimensional heat 
% equation, with zero boundary conditions, using the 
% Crank-Nicolson method. 
% 
% 	u = Heat1DCN(t,x,u,alpha) where
%
% 	t is the row vector of times to compute,
% 	x is the column vector of x positions to compute, 
% 	u is the column vector of initial temperatures for each value in x,
% 	alpha is a given parameter of the PDE
% 	u is the solution at the mesh points

u = u(:); % u must be a column vector 
k = t(2)-t(1);  h = x(2)-x(1);  r = (alpha/h)^2*k;

% Compute A 
n = length(x); 
A = diag(2* (1+r)*ones(n-2,1)); 
A = A + diag(diag(A,-1)-r,-1); 
A = A + diag(diag(A,1)-r, 1);

% Compute B 
B = diag(2*(1-r)*ones(n-2,1)); 
B = B + diag(diag(B,-1) +r,-1); 
B = B + diag(diag(B,1) +r,1);

C = A\B;
i = 2:length(x)-1; 
for j = 1:length(t)-1
    u(i,j+1) = C*u(i,j);
end