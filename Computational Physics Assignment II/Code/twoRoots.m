clc;
clear;
% 初始化参数
x = -6:0.001:4;
g1 = -3 * log2(2.2 - exp(x));
g2 = log(2.2 - 2.^(-x/3));
g3 = x;

plot(x, g1,'color','r');    % 画出第一条线，颜色为红
hold on;
plot(x, g2,'color','g');    % 画出第二条线，颜色为绿
hold on;
plot(x, g3, 'color', 'b');  % 画出第三条线，颜色为蓝

xlabel('x');        % 横坐标为x
ylabel('g(x)');     % 纵坐标为g(x)
axis([-6 4 -16 20]);    % 设定横坐标范围为-6到4，纵坐标范围为-16到20
set(gca, 'XTick', -6:0.5:4);    % 横坐标间隔为0.5
set(gca, 'YTick', -16:2:20);    % 纵坐标间隔为2
legend("g1", "g2", "g3");       % 给三条线标注
grid on;    % 显示网格线