% % CodeName: SolvePro4.m
% % This code is meant to evaluate a given 
% % funtion and compare differet ways

% 初始化参数
f = @(x) exp(-x).*sin(x)./(x.^(3) + 1);
a = 1; b = 2;
exact = 0.062204682443299;
% 分别使用Simpson's Rule 和 Gaussian Rule 
% 以及 Romberg Rule 来计算积分结果和误差
I_Sim = Simpson(f, a, b, 4);
E_Sim = abs(I_Sim - exact) / exact;
I_Gau = Gauss_quad_4(f, a, b);
E_Gau = abs(I_Gau - exact) / exact;
I_Rom = Romberg(f, a, b, 2, 3);
E_Rom = abs(I_Rom(1, 3) - exact) / exact;
% 显示结果
fprintf("I_Sim = %.15f, E_Sim = %e\n", I_Sim, E_Sim);
fprintf("I_Gau = %.15f, E_Gau = %e\n", I_Gau, E_Gau);
fprintf("I_Rom = %.15f, E_Rom = %e\n", I_Rom(1, 3), E_Rom);