% % CodeName: SolvePro1.m
% % This code is meant to calculate the relative error

% 初始化参数
f = @(x) (1+(cos(x)).^2).^(1./2);
a = 0; b = pi / 4;
N = [2 10 20 40 80 160 320];
exact = Simpson(f, a, b, 1000); % 取1000位为精确值
% 计算相对误差
format long;
err_Tra = zeros(1, length(N));
err_Sim = zeros(1, length(N));
for i = 1:length(N)
    I_sim = Simpson(f, a, b, N(i));
    I_tra = Trapezoid(f, a, b, N(i));
    err_Tra(1, i) = abs(I_tra-exact)/exact;
    err_Sim(1, i) = abs(I_sim-exact)/exact;
    fprintf("N = %d, Et = %e, Es = %e\n", N(i), err_Tra(1, i), err_Sim(1, i));
end
% 画出log-log图
loglog(N, err_Tra, '-s', N, err_Sim, '-s');
% 对数据进行线性拟合
p_Tra_ln = polyfit(log(N), log(err_Tra), 1); p_Sim_ln = polyfit(log(N), log(err_Sim), 1);
p_Tra_log = polyfit(log10(N), log10(err_Tra), 1); p_Sim_log = polyfit(log10(N), log10(err_Sim), 1);
% 标注拟合结果
text(45,1e-7,['logE = ' num2str(p_Tra_ln(1)) 'logN ' num2str(p_Tra_ln(2))],'FontSize',10,'Color',[0 0 1])
text(1.5,1.5e-8,['logE = ' num2str(p_Sim_ln(1)) 'logN' num2str(p_Sim_ln(2))],'FontSize',10,'Color',[1 0 0])
text(45,1e-8,['log10E = ' num2str(p_Tra_log(1)) 'log10N ' num2str(p_Tra_log(2))],'FontSize',10,'Color',[0 0 1])
text(1.5,1.5e-9,['log10E = ' num2str(p_Sim_log(1)) 'log10N' num2str(p_Sim_log(2))],'FontSize',10,'Color',[1 0 0])
legend('Relative error for Trapezoid', 'Relative error for Simpson');
xlabel('N'); ylabel('Relative Error \epsilon');
title('Relative Error vs N Plot');
grid on;