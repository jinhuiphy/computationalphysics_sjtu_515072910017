function [x, y] = ShootNewtonMethod(f, xRange, yInitial, stepSize, alpha)
% This function use RK4 method and bisection method to find the alpha 
% parameter.
% % INPUT:
% f = function handle for a function with signature f = @(x,y)
% xRange = [x1, x2] where x1 <= x <= x2
% yInitial = column vector of initial values for y at x1 and x2
% stepSize = the step size 
% boder = [a, b] the initial guass range
% % OUTPUT£º
% x = xRange(1) : stepSize : xRange(2)
% y = matrix whose k-th column is the approximate solution at x1 + (k-1)*h
x = xRange(1):stepSize:xRange(2);
for i=1:40
    y = RK4System(f, xRange, [yInitial(1), alpha], stepSize);
    del1 = y(1,end) - yInitial(2);
    if abs(del1) < 1e-8
        break;
    end
    y = RK4System(f, xRange, [yInitial(1), alpha+0.01], stepSize);
    del2 = y(1,end) - yInitial(2);  
    alpha = alpha - del1*0.01/(del2-del1);
end

