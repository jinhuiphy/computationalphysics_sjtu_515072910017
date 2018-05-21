function y = RK4System(f, xRange, yInitial, stepSize)
% This function uses RK4 method to solve a system
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
h = stepSize;
halfh = h/2;
for i = 1:length(x)-1
    k1 = f(x(i),y(:,i));
    k2 = f(x(i)+halfh,y(:,i) + halfh*k1);
    k3 = f(x(i)+halfh,y(:,i) + halfh*k2);
    k4 = f(x(i)+h,y(:,i) + h*k3);
    y(:,i+1) = y(:,i)+h* (k1+2*k2+2*k3+k4)/6;
end