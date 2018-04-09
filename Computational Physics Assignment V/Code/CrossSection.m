% % CodeName: CrossSection.m
% % This code is used to predict the f(E) for a given E 
% % and choose a suitable boundary condition.

% ��ʼ������
E = 0:25:200;
f = [10.6 16.0 45 83.5 52.8 19.9 10.8 8.25 4.7];
delta = [9.34 17.9 41.5 85.5 51.5 21.5 10.8 6.29 4.14];
Ei = [10 90 185];
step = 0.1;
% ������������ֵ��Free Boundary Condition
E_spline = 0:step:200;
f_spline = spline(E, f, E_spline);
% Ѱ�����ֵ��Ӧ��λ��
index = find(f_spline == max(max(f_spline1)));
fprintf('Er = %f\n', E_spline(index));
half_max = f_spline(index) ./ 2;
% �ҵ�f(E)Ϊ��߶�Ӧ��E
for i = 1:length(E_spline)
    if abs(f_spline(1, i) - half_max) < step
        fprintf('E = %f\t', E_spline(i));
    end
end
fprintf('\n\n');
% ������������ֵ�õ��Ľ��������
plot(E_spline, f_spline, 'r');
hold on;
plot(E, f, 'bo');
legend('Spline', 'Original');
grid on;
% ����E�õ���ֵ���f(E)
for i = 1:length(Ei)
    fi = spline(E, f, Ei(i));
    fprintf('E = %d, f(E) = %f\n', Ei(i), fi);
end


