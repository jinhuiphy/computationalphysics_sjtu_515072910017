% % CodeName: SolvePro3.m
% % This code is meant to calculate the nodes and weights

% ����Ľ����õ¶���ʽ�ĸ�
syms x
roots = vpasolve(legendreP(4, x) == 0);
fprintf("Roots of Legendre polynomial of degree four:\n");
for i = 1:length(roots)
    fprintf("x%d = %.8f\n", i, roots(i));
end
% ���ݸ������ĸ��������Ȩ��weight
x_mar = zeros(4, 4);
for i = 1:4
    x_mar(i, :) = (roots').^(i-1);
end
res = [2; 0; 2/3; 0];
w_mar = x_mar \ res;
fprintf("The value of weights:\n");
for i = 1:length(w_mar)
    fprintf("w%d = %.8f\n", i, w_mar(i));
end