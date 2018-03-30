function y = LagrangeInterp(x_list, y_list, x)
% 初始化空间
n = length(x_list);
L = zeros(1, n);    

% 计算L(x)
for i = 1:n
    L(i) = 1;
    for j = 1:n
        if j ~= i
            L(i) = L(i).*(x - x_list(j))./(x_list(i) - x_list(j));
        end
    end
end

% 计算结果
y = sum(y_list.*L);
end

            