% % This code is meant to solve problem 4
h = 0.5; x = 0:h:25; y = 0:h:25; y = y';
u = zeros(length(x), length(y));
% Boundary condition
u(1,:) = 10; u(end,:) = 10; u(:,1) = 10; u(:, end) = 10;
p = 1.7:0.01:1.95; times = zeros(size(p));
% Iteration
for i=1:length(p)
    [k, ] = PDE_SOR(x, y, u, p(i));
    times(i) = k;
end
plot(p,times); xlabel('p'); ylabel('Iteration time'); grid on;
% Find the optimized p
[row, col] = find(min(min(times)) == times);
optimized_p = p(row,col);
% Plot 
[k, U1] = PDE_SOR(x, y, u, optimized_p);
[X, Y] = meshgrid(x, y(end:-1:1)); figure();
surfc(X,Y,U1); 
xlabel("X"); ylabel("Y"); zlabel("V"); colorbar;
% Compare with problem 3
x = 0:0.5:25;
y = 0:0.5:25; y = y';
f = @(x,y) (x>=10 & x <=15 & y>=10 & y<=15)*(-4*pi/25) + 0;
ubottom = @(x) 10; utop = @(x) 10; 
uright = @(y) 10; uleft = @(y) 10;
[A, U2] = DirichletPDE(x,y,f,uleft,uright,ubottom,utop);
[X, Y] = meshgrid(x, y(end:-1:1)); figure();
surfc(X, Y, abs(U2-U1));
xlabel("X"); ylabel("Y"); zlabel("Error"); colorbar;


