function I = Simpson(f, a, b, N)
% CodeName: Simpson.m
% Input
% % f: integrand function
% % a, b: the integral interval
% % N: the number of subintervals
% Output
% % I: the integral reeult
% Method
% % Use the Simpson rule

h = (b-a) / N;     % The length of subinterval
x = a:h:b;         % The x
I = 0;
for i = 1:2:N
    I = I + f(x(i)) + 4 * f(x(i+1)) + f(x(i+2));
end
I = I * h/3;
