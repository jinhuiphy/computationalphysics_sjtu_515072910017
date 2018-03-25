function [a1, a0] = linearRegression(x, y)

n = length(x);
% 求和
sum_x = sum(x);
sum_y = sum(y);
sum_xx = sum(x.*x);
sum_xy = sum(x.*y);
delta = n.*sum_xx - sum_x^2;
a1= (n*sum_xy - sum_x*sum_y) / delta;
a0 = (sum_xx*sum_y - sum_xy*sum_x) / delta;

% 计算拟合的点
l = zeros(n,1);
for i = 1:n
    l(i) = a1.*x(i) + a0;
end

% 把数据和拟合直线画出来
plot(x, y, 'b*');
hold on;
plot(x, l, 'r');
legend('Actual', 'Predicted');
end