% % This code is meant to solve problem 1
%% Part (a)
clear;
yInitial = [0,0]; xRange = [0,1]; stepSize = 0.1;
f = @(x,y) [y(2,1);-3*y(2,1) - 2*y(1,1) + x + 1];
g = @(x) x+1;
Coe = [1,3,2];
y0 = 0.5 + 0.25 * ( exp(-2) - 1);   % Exact solution
y1 = EulerSystem(f, xRange, yInitial, stepSize); y1 = y1(1,end);
y2 = HeunSystem(f, xRange, yInitial, stepSize); y2 = y2(1,end);
y3 = FiniteSystem(f, xRange, yInitial, stepSize, g, Coe); y3 = y3(1,end);
rE = abs([y1,y2,y3] - y0) ./ y0;   % Relative error
fprintf("-------------------------Part (a)-------------------------\n");
fprintf("Euler : %f, Exact: %f, RelativeError: %f%%\n", y1, y0, 100*rE(1));
fprintf("Henu  : %f, Exact: %f, RelativeError: %f%%\n", y2, y0, 100*rE(2));
fprintf("Finite: %f, Exact: %f, RelativeError: %f%%\n", y3, y0, 100*rE(3));
%% Part (b)
clear;
yInitial = [0,1]; xRange = [0,1]; stepSize = 0.1;
f = @(x,y) [y(2,1);y(1,1) + 2*x];
g = @(x) 2*x;
Coe = [1,0,-1];
y0 = 3*sinh(1) - 2;   % Exact solution
y1 = EulerSystem(f, xRange, yInitial, stepSize); 
y1 = y1(1,end);
y2 = HeunSystem(f, xRange, yInitial, stepSize); y2 = y2(1,end);
y3 = FiniteSystem(f, xRange, yInitial, stepSize, g, Coe); 
y3 = y3(1,end);
rE = abs([y1,y2,y3] - y0) ./ y0;   % Relative error
fprintf("-------------------------Part (b)-------------------------\n");
fprintf("Euler : %f, Exact: %f, RelativeError: %f%%\n", y1, y0, 100*rE(1));
fprintf("Henu  : %f, Exact: %f, RelativeError: %f%%\n", y2, y0, 100*rE(2));
fprintf("Finite: %f, Exact: %f, RelativeError: %f%%\n", y3, y0, 100*rE(3));
%% Part (c)
clear;
yInitial = [1,0]; xRange = [0,1]; stepSize = 0.1;
f = @(x,y) [y(2,1);-2*y(2,1) - 2*y(1,1)];
g = @(x) 0;
Coe = [1,2,2];
y0 = exp(-1)*(cos(1)+sin(1));   % Exact solution
y1 = EulerSystem(f, xRange, yInitial, stepSize); y1 = y1(1,end);
y2 = HeunSystem(f, xRange, yInitial, stepSize); y2 = y2(1,end);
y3 = FiniteSystem(f, xRange, yInitial, stepSize, g, Coe); y3 = y3(1,end);
rE = abs([y1,y2,y3] - y0) ./ y0;   % Relative error
fprintf("-------------------------Part (c)-------------------------\n");
fprintf("Euler : %f, Exact: %f, RelativeError: %f%%\n", y1, y0, 100*rE(1));
fprintf("Henu  : %f, Exact: %f, RelativeError: %f%%\n", y2, y0, 100*rE(2));
fprintf("Finite: %f, Exact: %f, RelativeError: %f%%\n", y3, y0, 100*rE(3));