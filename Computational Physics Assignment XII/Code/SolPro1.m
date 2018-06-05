% This code is meant to solve problem 1

%% Part (a)
delta_square = 0.001; dx = 5e-4; dt = 5e-7; x0 = 0.4; C = 1;

phi = @(x,t) exp(t*10000)*exp(-(x-x0).^2/delta_square);
x = 0:dx:1;
t = 0:dt:5;
% plot(x,phi(x,1)); hold on;
% plot(x,phi(x,2));
for i=1:length(t)
    plot(x,phi(x,t(i)));
    axis([0 1 0 10]);
    pause(0.1);
    disp(i);
end