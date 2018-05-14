% % This code is meant to solve Problem 4
%% Part (a)
% Initial 
clear;
g = 9.81; m = 80; c = 0.72; s = 0.5;
thetaIni = pi/8; vIni = 10; rho = 0.94;
stepSize = 0.001; tRange = [0,1];

% Solve by using Euler's Method
uInitial = [vIni,thetaIni];
f_ode = @(t,u) [-c*rho*s*(u(1,1)^2)/(2*m) - g*sin(u(2,1)); -g*cos(u(2,1))/u(1,1)];
u = EulerSystem(f_ode, tRange, uInitial, stepSize);

% Find when y(t) = 0
v = u(1,:); theta = u(2,:);
xPrime = v.*cos(theta); yPrime = v.*sin(theta);
x = zeros(size(v)); y = zeros(size(v));
for i=1:length(x)
    x(i+1) = x(i) + xPrime(i)*stepSize;
    y(i+1) = y(i) + yPrime(i)*stepSize;
end
[yMin,index] = min(abs(y(2:end)));
fprintf("Part (a): Tf = %f, x(Tf) = %f\n", index*stepSize, x(index));
%% Part (b)
% The same as Part (a), simply change:
% % vIni = 10; rho = 1.29;
% % fprintf("Part (b): Tf = %f, x(Tf) = %f\n", index*stepSize, x(index));
%% Part (c)
% Simply add a for iteration in Part (a)
clear;
for vIni=11:0.001:11.5
    g = 9.81; m = 80; c = 0.72; s = 0.5;
    thetaIni = pi/8; rho = 0.94; tol = 1e-3;
    stepSize = 0.001; tRange = [0,1];

    % Solve by using Euler's Method
    uInitial = [vIni,thetaIni];
    f_ode = @(t,u) [-c*rho*s*(u(1,1)^2)/(2*m) - g*sin(u(2,1)); -g*cos(u(2,1))/u(1,1)];
    u = EulerSystem(f_ode, tRange, uInitial, stepSize);

    % Find when y(t) = 0
    v = u(1,:); theta = u(2,:);
    xPrime = v.*cos(theta); yPrime = v.*sin(theta);
    x = zeros(size(v)); y = zeros(size(v));
    for i=1:length(x)
        x(i+1) = x(i) + xPrime(i)*stepSize;
        y(i+1) = y(i) + yPrime(i)*stepSize;
    end
    [yMin,index] = min(abs(y(2:end)));
    if abs(x(index) - 8.90) < tol
        fprintf("Part (c): V0 = %f\n", vIni);
        return;
    end
end
%% Part (d)
% The same as Part (a), simply change:
% % vIni = 11.182, rho = 1.29;
% % fprintf("Part (d): Tf = %f, x(Tf) = %f\n", index*stepSize, x(index));

    
