% % CodeName: PlotHand.m
% % This code makes a plot of your hand, and use the spline method 
% % to replot your hand. All you need is using the mouse to select 
% % a few dozen points outlining your hand.

figure('position', get(0, 'screensize'))
axes('position', [0 0 1 1])
[x,y]=ginput;
% 初始化参数
n = length(x);  % 取点的个数
step = 0.1;     % 样条插值间隔
% 三次样条插值
x_spline = spline(1:n, x, 1:step:n);     % 对x做三次样条插值
y_spline = spline(1:n, y, 1:step:n);     % 对y做三次样条插值
% 画出原始的手和三次样条插值后的图
figure
plot(x, y, 'r')
title(['Hand plot--' num2str(n) 'numbers you have chosen'])
hold on;
plot(x_spline, y_spline, 'b')
grid on;
legend('Original', 'Spline');