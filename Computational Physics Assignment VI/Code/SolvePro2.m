% % CodeName: SolvePro2.m
% % This code is meant to calculate the error

% ��ʼ������
f = @(x) (1+(cos(x)).^2).^(1./2);
a = 0; b = pi / 4;
N = [1 2 4 8 16 32];
% �������
err_Sim = zeros(1, length(N));
for i = 1:length(N)
    I_sim = Simpson_3_8(f, a, b, 3*N(i));
    h = (b-a) / (3 * N(i));
    err_Sim(1, i) = abs(I_sim-exact);   % ע����������������������
    fprintf("3N = %d, Es = %e, h^4 = %e, h^5 = %e\n", 3*N(i), err_Sim(1, i), h^4, h^5);
end

exact = Simpson(f, a, b, 1000); % ȡ1000λΪ��ȷֵ
begin = 8; ending = 16;
error = zeros(1, ending-begin);
for i = begin:ending
    I_sim = Simpson_3_8(f, a, b, 3*i);
    h = (b-a) / (3 * i);
    error(1, i-begin+1) = abs(I_sim-exact);
    fprintf("3N = %d, Error = %e, h = %e\n", 3*i, error(1, i-begin+1), h);
end



