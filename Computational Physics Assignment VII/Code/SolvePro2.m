% % CodeName: SolvePro2.m
% % This code is meant to solve problem 2

clear;
E = 0:25:200;
f = [10.6 16 45 83.5 52.8 19.9 10.8 8.25 4.7];
delta = [9.34 17.9 41.5 85.5 51.5 21.5 10.8 6.29 4.14];

syms a1 a2 a3 x;
g(x) = a1 ./ ((x-a2).^2 + a3);
F1 = 0; F2 = 0; F3 = 0;
for j = 1:9
    x = E(j); y = f(j);
    F1 = F1 + (y - g(x))./((x-a2).^2 + a3);
    F2 = F2 + (y - g(x)) .* (x-a2) ./ (((x-a2).^2 + a3).^2);
    F3 = F3 + (y - g(x))./(((x-a2).^2 + a3).^2);
end
% disp(F1);
% disp(F2);
% disp(F3);
Tolerance = 1e-2;
IniValue = [70900, 76.2, 852];
Sol = MultiNewton([F1;F2;F3], [a1,a2,a3], Tolerance, IniValue);
% Sol = newton_n_dim(Tolerance,IniValue,[a1, a2, a3],[F1;F2;F3]);
disp(Sol);



