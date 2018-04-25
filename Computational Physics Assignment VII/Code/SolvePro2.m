% % CodeName: SolvePro2.m
% % This code is meant to solve problem 2

clear;
% ��ʼ������
E = 0:25:200;
f = [10.6 16 45 83.5 52.8 19.9 10.8 8.25 4.7];
delta = [9.34 17.9 41.5 85.5 51.5 21.5 10.8 6.29 4.14];
% ����F1��F2��F3�ķ��ű��ʽ
syms a1 a2 a3 x;
g(x) = a1/((x - a2)^2 + a3);
F1 = 0; F2 = 0; F3 = 0;
for i=1:9
    x = E(i); y = f(i);
    F1 = F1 + (y-g(x)) / (((x-a2)^2+a3) * (delta(i))^2);
    F2 = F2 + (y-g(x)) * (x-a2) / (((x-a2)^2+a3)^2 * (delta(i))^2);
    F3 = F3 + (y-g(x)) / (((x-a2)^2+a3)^2 * (delta(i))^2);
end
% �õ��ſɱȾ���ķ��ű��ʽ
Jacob = jacobian([F1, F2, F3], [a1;a2;a3]);

% ���þ��Ⱥͳ�ʼֵ���Լ�����������
Tolerance = 1e-6;
X(:,1) = [7.1e4; 70; 850];
N = 200;
cnt = 0;
% ʹ��Newton-Raphson�������е���
for i = 1:N
    J = subs(Jacob, [a1,a2,a3], [X(1,i), X(2,i), X(3,i)]);  % �ſɱȾ������ֵ
    F = subs([F1;F2;F3], [a1,a2,a3], [X(1,i), X(2,i), X(3,i)]); % ����ֵ����ֵ
    d_X = J \ F;    
    X(:,i+1) = X(:,i) - d_X;
    if norm(d_X, inf) < Tolerance
        cnt = i+1;
        break;
    end
end
fprintf("After %d interation, a1=%.2f, a2=%.2f, a3=%.2f\n", cnt, X(1, cnt), X(2, cnt), X(3, cnt));