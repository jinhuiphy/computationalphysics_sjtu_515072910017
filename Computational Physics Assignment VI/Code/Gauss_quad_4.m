function I = Gauss_quad_4(f, a, b)
% CodeName: Trapezoid.m
% Input
% % f: integrand function
% % a, b: the integral interval
% Output
% % I: the integral reeult
% Method
% % Use the Gaussian quadrature

% ��ʼ������
x_mar = [-0.86113631, -0.33998104, 0.33998104, 0.86113631];
w_mar = [0.34785485, 0.65214515, 0.65214515, 0.34785485];
% ����
I = f((b-a)/2*(x_mar+1) + a)*(b-a)/2 * w_mar';




