function I = Gauss_quad_4(f, a, b)
% CodeName: Trapezoid.m
% Input
% % f: integrand function
% % a, b: the integral interval
% Output
% % I: the integral reeult
% Method
% % Use the Gaussian quadrature

% 初始化参数
x_mar = [-0.86113631, -0.33998104, 0.33998104, 0.86113631];
w_mar = [0.34785485, 0.65214515, 0.65214515, 0.34785485];
% 计算
I = f((b-a)/2*(x_mar+1) + a)*(b-a)/2 * w_mar';




