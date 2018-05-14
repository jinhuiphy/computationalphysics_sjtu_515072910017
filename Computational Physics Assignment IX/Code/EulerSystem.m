function y = EulerSystem(f, xRange, yInitial, stepSize)
% This function uses Euler's method to solve a system
% of first-order ODEs
% % f = function handle for a function with signature 
% %     f = @(x,y)
% % xRange = [x1, x2] where x1 <= x <= x2
% % yInitial = column vector of initial values for y at x1
% % stepSize = the step size 
% % y = matrix whose k-th column is the approximate solution 
% %     at x1 + (k-1)*h

x = xRange(1):stepSize:xRange(2);
y(:,1) = yInitial;
for i=1:length(x)-1
    y(:,i+1) = y(:,i) + stepSize * f(x(i), y(:,i));
end
