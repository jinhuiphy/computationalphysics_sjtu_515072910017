function Newton(f, x1)
syms x;
% 初始化参数
tol = 1e-10;        % 容许误差
diff_f = diff(f(x));  % f的导数形式
flag = 0;       % 用来判断导数为0的情况
N = 100;    % 默认循环次数
for n = 1:N
    x = x1;
    tmp = eval(diff_f);
    if tmp == 0      % 如果算到某一点的导数值为0，则返回失败信息
        break;
    end
    x2 = x1 - f(x1) / tmp;
    fprintf("N:%d \t x1:%.10f \t x2:%.10f\n", n, x1, x2);
    if abs(x2 - x1) < tol
        r = x2;
        flag = 1;
        break; 
    end
    x1 = x2;
end

if flag == 1
    fprintf("Newton: The root %.10f was found after %d iterations.\n", r, n);
else
    fprintf("Convergence not found!\n");
end

