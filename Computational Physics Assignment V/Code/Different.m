% % CodeName: Different.m
% % This Code calculate the y1,y_1, e1, e_1, E_round, E_approx and E
h = [0.1 0.01 0.001 0.0001];
original = -sin(1);
for i = 1:4
    y1 = roundn(cos(1+ h(i)),-8);
    y_1 = roundn(cos(1-h(i)),-8);
    digits(16);
    actu_y1 = vpa(cos(1+ h(i)));
    actu_y_1 = vpa(cos(1-h(i)));
    e1 = actu_y1 - vpa(y1, 8);
    e_1 = actu_y_1 - vpa(y_1, 8);
    % 得到计算值和误差值
    y = vpa((y1- y_1)./(2.*h(i)), 8);
    error = y - original;
    fprintf('%d: y1 = %.8f, y_1 = %.8f, y = %.8f, error = %e\n', i, y1, y_1, y, error);
    % 计算round off 误差和approximation 误差
    round = (e1 - e_1)./(2.*h(i));
    approx = h(i).^2 .* sin(1) ./ 6;
    fprintf('   e1 = %e, e_1 = %e, round = %e, approx = %e\n', e1, e_1, round, approx);
end