function I = Trapezoid(f, a, b, N)
% CodeName: Trapezoid.m
% Input
% % f: integrand function
% % a, b: the integral interval
% % N: the number of subintervals
% Output
% % I: the integral reeult
% Method
% % Use the Trapezoid rule

h = (b-a) / N;     % The length of subinterval
x = a:h:b;         % The x
I = 0;
for i = 2:N
    I = I + 2 * f(x(i));
end
I = I + f(a) + f(b);    % The begin and end;
I = I * h/2;
