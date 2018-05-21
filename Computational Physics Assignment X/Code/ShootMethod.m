function [x, y, c] = ShootMethod(f, xRange, yInitial, stepSize, boder)
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
% c = the alpha parameter
a = boder(1); b = boder(2); x = xRange(1):stepSize:xRange(2);
y1 = RK4System(f, xRange, [yInitial(1), a], stepSize);
y2 = RK4System(f, xRange, [yInitial(1), b], stepSize);
del1 = y1(1,end) - yInitial(2); del2 = y2(1,end) - yInitial(2);
if del1 * del2 > 0
    error('Root does not exist, please try another interval!');
end
del3 = del1;
while(abs(del3) > 1e-6)
    c = (a+b)/2;
    y3 = RK4System(f, xRange, [yInitial(1), c], stepSize);
    y = y3; del3 = y3(1,end) - yInitial(2);    
    if (del1*del3 < 0)
        b = c;
    elseif (del2*del3 < 0)
        a = c;
    end
end

