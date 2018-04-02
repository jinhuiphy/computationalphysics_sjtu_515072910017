function Search(error, step, target)
% error是要求的精度，step是alpha的间隔，target是I的值
% 初始化数据
alpha_list = 0:5:25;
I_list = [1.57080 1.57379 1.58284 1.59814 1.62003 1.64900];
% 通过拉格朗日插值得到的结果
fprintf("The value of alpha by LagrangeInterp could be:\n");
index_Lag = 1;
for alpha = 5:step:10
    res_Lag = LagrangeInterp(alpha_list, I_list, alpha);
    if abs(res_Lag-target) <= error
        fprintf("%d\t%f\n", index_Lag, alpha);
        index_Lag = index_Lag + 1;
    end
end
% 通过牛顿插值得到的结果
fprintf("The value of alpha by NewtonInterp could be:\n");
index_New = 1;
for alpha = 5:step:10
    res_New = NewtonInterp(alpha_list, I_list, alpha);
    if abs(res_New-target) <= error
        fprintf("%d\t%f\n", index_New, alpha);
        index_New = index_New + 1;
    end
end