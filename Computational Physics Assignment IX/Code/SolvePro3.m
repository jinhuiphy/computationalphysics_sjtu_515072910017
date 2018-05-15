% % This code is meant to solve problem 3
%% Part (a)
clear;
% rIni = 300; fIni = 150; alpha = 0.01;
rIni = 102; fIni = 198; alpha = 0.01;
stepSize = 0.001; tRange = [0,10]; tol = 0.001;

% Solve by using Heun's Method
uInitial = [rIni,fIni];
f_ode = @(t,u) [2*u(1,1) - alpha*u(1,1)*u(2,1); -u(2,1) + alpha*u(1,1)*u(2,1)];
u = HeunSystem(f_ode, tRange, uInitial, stepSize);
r = u(1,:); f = u(2,:); t = 0:stepSize:tRange(2);

% Find t(p)
[val,loc] = findpeaks(r);
fprintf("T(p) = %f\n", t(loc(2)-loc(1)));

% Plot
figure();plot(t, r, t, f);
legend("Number of rabbit","Number of fox"); xlabel("Time"); ylabel("Number")
figure();plot(r,f);
xlabel("Number of rabbit"); ylabel("Number of fox");

%% Part (b)
% Simply change:
% rIni = 300; fIni = 150; alpha = 0.01; into 
% rIni = 15; fIni = 22; alpha = 0.01;

%% Part (c)
% Simply change:
% rIni = 300; fIni = 150; alpha = 0.01; into 
% rIni = 102; fIni = 198; alpha = 0.01;