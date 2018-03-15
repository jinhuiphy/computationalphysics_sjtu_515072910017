function Helley(f, x1)
syms x;
tol = 1e-10;                % 容许误差
diff_f_1 = diff(f(x));      % f函数的一阶导数
diff_f_2 = diff(f(x), 2);   % f函数的二阶导数
N = 100;                    % 默认循环次数
for n = 1:N
    x = x1;
    tmp_f_1 = eval(diff_f_1);% 一阶导数的具体数值
    tmp_f_2 = eval(diff_f_2);% 二阶导数的具体数值
    x2 = x1 - 2*f(x1)*tmp_f_1/(2*(tmp_f_1).^2 - f(x1)*tmp_f_2);
    fprintf("N:%d \t x1:%.10f \t x2:%.10f\n", n, x1, x2);
    if abs(x2 - x1) < tol
        r = x2;
        fprintf("Helley: The root %.10f was found after %d iterations\n", r, n);
        break; 
    end
    x1 = x2;
end

        
        
        
        
        
        
        