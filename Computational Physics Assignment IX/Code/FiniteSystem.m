function y = FiniteSystem(f, xRange, yInitial, stepSize, g, Coe)
% This function uses Finite difference method to solve a system
% of first-order ODEs
% % f = function handle for a function with signature 
% %     f = @(x,y)
% % xRange = [x1, x2] where x1 <= x <= x2
% % yInitial = column vector of initial values for y at x1
% % stepSize = the step size 
% % y = matrix whose k-th column is the approximate solution 
% %     at x1 + (k-1)*h
% % g = function handle for f's x part
% %     g = @(x)
% % Coe = column vactor of coefficient of y (y', y'', y''' ...)
% %     here only consider y''(y',y), so Coe = [A,B,C]

x = xRange(1):stepSize:xRange(2);
h = stepSize;
y(:,1) = yInitial(:,1);
resEuler = EulerSystem(f, xRange, yInitial, stepSize);
y(:,2) = resEuler(1,2);   % Get y2 by Euler's Method
k1 = Coe(1) / (h^2) + Coe(2) / (2*h);
k2 = -Coe(1) / (h^2) + Coe(2) / (2*h);
k3 = 2*Coe(1) / (h^2) - Coe(3);
for i=2:length(x)-1
    y(:,i+1) = (k2 * y(:,i-1) + k3 * y(:,i) + g(x(i))) / k1;
end