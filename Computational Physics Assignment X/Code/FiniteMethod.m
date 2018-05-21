function y = FiniteMethod(p, q, r, x, ini)
% This function use Finite method and Thomas Method to find the alpha 
% parameter.
% % INPUT:
% d^2 u / dx^2 = p(x)*du/dx + q(x)*u + r(x)
% x = x range
% ini = initial values, [alpha, beta]
% % OUTPUT£º
% y = matrix whose k-th column is the approximate solution at x1 + (k-1)*h
% % Set up system
alpha = ini(1); beta = ini(2); h = x(2)-x(1); x2=x(2:end-1); 
% Construct A
l = ones(size(x2)) + h/2 * p(x2);        % coe of y_n+1
d = -2*ones(size(x2)) - h.^2 * q(x2);       % coe of y_n
u = ones(size(x2)) - h/2 * p(x2);        % coe of y_n
A = diag(d) + diag(l(1:end-1),-1) + diag(u(2:end),1);
% Construct b
b = zeros(size(x2)) + h^2*r(x2);
b(1) = b(1) - (1 + h/2 * p(x(1))) * alpha;
b(end) = b(end) - (1 - h/2 * p(x(end))) * beta;
% Calculate 
y = ThomasMethod(A, b);
y = [alpha y' beta];