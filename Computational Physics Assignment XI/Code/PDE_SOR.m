function [k, u] = PDE_SOR(x, y, u, p)
% % This funciton use Successive Over-Relaxation method to solve PDE
% % INPUT:
% % % x = x1:h:x2
% % % y = y1:h:y2
% % % u = boundary condition 
% % % p = int between 0 and 2
% % OUTPUT:
% % % k = iteration times
% % % u = the solution at the mesh points.

% Initial 
h = x(2) - x(1);
f = @(x,y) (x>=10 & x <=15 & y>=10 & y<=15)*(1/25) + 0;
rho = f(x,y);
newu = u; flag = false; tol = 1e-3;

% Iteration
for time=1:20000  
    for i=2:length(x)-1
        for j=2:length(y)-1
            tmp = u(i+1,j) + newu(i-1,j) + u(i,j+1) + newu(i,j-1) + 4*pi*h^2*rho(i,j);
            newu(i,j) = (1-p) * u(i,j) + 0.25*p*tmp;
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

