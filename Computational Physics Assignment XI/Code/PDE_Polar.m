function [k, u] = PDE_Polar(x, y, f, u)
% % This funciton use Gauss-Seide (GS) method to solve PDE
% % INPUT:
% % % x = x1:h:x2
% % % y = y1:h:y2
% % % f = function handle
% % % u = boundary condition 
% % OUTPUT:
% % % k = iteration times
% % % u = the solution at the mesh points.

% Initial 
hx = x(2) - x(1); hy = y(2) - y(1);
b = f(x,y);
newu = u; flag = false; tol = 1e-4;

% Iteration
for time=1:20000  
    for i=2:length(x)-1
        for j=2:length(y)-1
                newu(i,j) =  (1/hx^2 + 1/(2*x(i)*hx))*u(i+1,j) + (1/hx^2 - 1/(2*x(i)*hx))*newu(i-1,j) +...
                    1/(x(i)^2*hy^2)*u(i,j+1) + 1/(x(i)^2*hy^2)*newu(i,j-1) - b(i,j);
                newu(i,j) = newu(i,j) ./ (2/(hx^2) + 2/(x(i)^2*hy^2));
        end
    end
    if  abs(newu-u) < tol
        k = time; flag = true;
        break;
    end
    u = newu;
end
if (~flag)
    warning('Please change another p value!');
end

