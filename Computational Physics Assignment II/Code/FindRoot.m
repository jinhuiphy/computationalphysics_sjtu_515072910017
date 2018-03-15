clc;
clear;
% 初始化参数
init = [-4 -3];   % 初始点
g1 = @(x) -3 * log2(2.2 - exp(x));      % 函数g1(x)
g2 = @(x) log(2.2 - 2.^(-x/3));         % 函数g2(x)

for i = 1:2     % 有两个函数，所以加两个循环
    if i == 1 
        f  = g1;
    else
        f = g2;
    end
    for j = 1:2     % 有两个初始点，所以加两次循环
        x1 = init(1, j);
        fprintf("Function: g%d(x) Initial Value: %d\n", i, x1);
        FixedPoint(f, x1);      % 为了便于显示，这里将FixedPoint函数中的详细输出注释掉了
    end
end