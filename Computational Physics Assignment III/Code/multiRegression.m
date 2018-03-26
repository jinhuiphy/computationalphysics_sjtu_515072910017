clc;
clear;

% 输入数据
x1 = [110 130 180 125 150 165 120 145 175 155];
x2 = [105 125 85 145 200 160 240 260 290 270];
y = [102 99 115 75 55 95 36 78 82 90];

% 利用内置函数进行线性回归
X = [ones(10,1) x1' x2' (x1.*x2)' (x1.^2)' (x2.^2)'];
[b, bint, r, rint, stats] = regress(y', X);

% 输出结果
fprintf("Fit function: y = a0 + a1*x_1 +a2*x_2 + a3*x_1*x_2 + a4*x_1^2 + a5*x_2^2\n");
fprintf("The fit coefficient: %f %f %f %f %f %f\n", b(1), b(2), b(3), b(4), b(5), b(6));
fprintf("R-square statistic: %f\n", stats(1)); 
fprintf("F statistic: %f\n", stats(2));
fprintf("P value: %f\n", stats(3));
fprintf("Estimate of the error variance: %f\n", stats(4));

% 绘制散点图
scatter3(x1,x2,y,'filled', 'r');  

% 画出拟合好的图像
hold on;    
x1fit = min(x1):5:max(x1);   %设置x1的数据间隔  
x2fit = min(x2):5:max(x2);   %设置x2的数据间隔  
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);    %生成一个二维网格平面 
YFIT=b(1)+b(2)*X1FIT+b(3)*X2FIT+b(4)*X1FIT.*X2FIT + b(5)*X1FIT.^2 + b(6)*X2FIT.^2;    
mesh(X1FIT,X2FIT,YFIT)    %X1FIT，X2FIT是网格坐标矩阵，YFIT是网格点上的高度矩阵
view(51,38)  
xlabel('x_1') %设置X轴的名称  
ylabel('x_2') %设置y轴的名称  
zlabel('y')   %设置z轴的名称
legend('Actual', 'Predicted')   % 标注