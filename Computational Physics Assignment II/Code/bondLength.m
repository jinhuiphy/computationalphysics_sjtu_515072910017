clc;
clear;
% 初始化参数
x1 = 2.5;           % 初始点
e_square = 14.4;    % e^2
v0 = 1.09e3;        % V0
r0 = 0.330;         % r0
v = @(x) -e_square / x + v0 * exp(-x / r0);     % V(r)函数
f = @(x) e_square / x^2 - v0 / r0 * exp(-x / r0);       % V(r)函数的导数形式

% 牛顿法
Newton(f, x1);

% 内置函数结果
res = fminsearch(v, x1);
fprintf("The answer calculated by built-in function is %.10f\n", res);

