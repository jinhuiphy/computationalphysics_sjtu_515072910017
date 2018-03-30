function y = NewtonInterp(x_list, y_list, x)
% 初始化空间
n = length(x_list);
a = zeros(1,n);
a(1) = y_list(1);
diff = zeros(1, n-1);
% 计算一阶导数
for i = 1:n-1
    diff(i, 1) = (y_list(i+1) - y_list(i)) / (x_list(i+1) - x_list(i));
end
% 计算高阶导数
for j = 2:n-1
    for i = 1:n-j
        diff(i, j) = (diff(i+1, j-1) - diff(i, j-1)) / (x_list(j+i) - x_list(i));
    end
end
% 输出导数结果
fprintf("\tDivided difference:\n");
disp(diff);
% 取高阶导数最前面一行
for i = 2:n
    a(i) = diff(1, i-1);
end
% 计算在某给定点的值
x_poly = 1;
y = a(1);
for i = 2:n
    x_poly = x_poly * (x - x_list(i-1));
    y = y + a(i)*x_poly;
end