function FixedPoint(f, x1)
% 初始化参数
tol = 1e-10; % 容许误差
N = 4;
% 开始循环
for n = 1:N
    x2 = f(x1);
    fprintf("N:%d \t x1:%.10f \t x2:%.10f\n", n, x1, x2);
    if abs(x2 - x1) < tol
        r = x2;
        fprintf("FixedPoint: The root %.10f was found after %d iterations.\n", r, n);
        return
    end
    x1 = x2;
end