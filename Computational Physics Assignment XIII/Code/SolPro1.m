% % This code is meant to solve problem 1
% Estimate value
y = rand(1e5,1);
x = 1/pi * acos(1-2*y);
histogram(x,'Normalization','pdf'); hold on;
% Theoretical value
x = linspace(0,1,100);
exact = pi/2 * sin(pi*x);
plot(x,exact); grid on;
legend("Estimate", "Theoretical");
xlabel("x"); ylabel("p(x)");
title("$p(x) = \frac{\pi}{2}sin(\pi x)$",'interpreter','latex');
