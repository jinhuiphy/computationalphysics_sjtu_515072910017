function y = Euler2ed(f, x, y0, diff_y0)

y = 0*x; diff_y = 0*x;
y(1) = y0; diff_y(1) = diff_y0; h = x(2)-x(1);
for n = 1:length(x)-1
    y(n+1) = y(n) + h*diff_y(n);
    diff_y(n+1) = diff_y(n) + h*f(x(n), y(n), diff_y(n));
end
