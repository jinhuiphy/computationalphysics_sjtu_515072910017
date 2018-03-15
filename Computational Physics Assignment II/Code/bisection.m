function bisection(f, a, b)
if f(a)*f(b) > 0
    fprintf("There is no root between %f and %f\n", a, b);
    return 
end

% 初始化参数
tol = 1e-10;
N = 100;
% 开始循环
for n = 1:N
    c  = (a + b)/2;     % 取中点
    if f(c) == 0        % 如果为0，说明这个点就是要找的根
        break;
    end
    if (b-a)/2 < tol    % 如果小于所要求的精度就停止
        break;      
    end
    if f(b)*f(c) > 0    % 判断符号是否改变
        b = c;
    else
        a = c;
    end     
end  
fprintf("Bisec: The root %.10f was found after %d iterations\n", c, n);

