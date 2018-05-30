% % This code is meant to solve problem 5
clear;
ht = 0.05; t = 0:ht:10;
hx = 0.05; x = 0:hx:1; x = x';
D = 0.025; gamma = D * ht / hx^2;
u = x.^2;  % Initial condition
ht = t(2)-t(1); hx = x(2)-x(1); 
tau = 0.8; S0 = 1;
SFunc = @(t) S0*exp(-t/tau);

% Compute A
n = length(x);
A = diag(2* (1+gamma)*ones(n-2,1));
A = A + diag(diag(A,-1)-gamma,-1);
A = A + diag(diag(A,1)-gamma, 1);
% Compute B
B = diag(2*(1-gamma)*ones(n-2,1));
B = B + diag(diag(B,-1) +gamma,-1);
B = B + diag(diag(B,1) +gamma,1);
% Iterator
m = 2:length(x)-1;
for j = 1:length(t)-1
    tmp = B*u(m,j) + ht * (SFunc(t(j)) + SFunc(t(j+1)));
    u(m,j+1) = A\tmp;
end
u = u'; [X,T] = meshgrid(x,t);
surfc(X(1:10:end,:),T(1:10:end,:),u(1:10:end,:));
xlabel('Position x'); ylabel('Time t'); zlabel('Density n'); colorbar;
title(['Initial Condition: $n(x,0)=x^2$, D = ', num2str(D), ' $\tau=$', ...
     num2str(tau), ' $S_0=$', num2str(S0)], 'interpreter','latex');