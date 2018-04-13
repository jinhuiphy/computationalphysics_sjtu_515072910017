function I = Simpson_3_8(f, a, b, N)
% CodeName: Simpson_3_8.m
% Input
% % f: integrand function
% % a, b: the integral interval
% % N: the number of subintervals
% Output
% % I: the integral reeult
% Method
% % Use the Simpson's 3/8 rule

h = (b-a) / N;     % The length of subinterval
x = a:h:b;         % The x
I = 0;
for i = 1:3:N
    I = I + f(x(i)) + 3 * f(x(i+1)) + 3 * f(x(i+2)) + f(x(i+3));
end
I = I * 3*h/8;