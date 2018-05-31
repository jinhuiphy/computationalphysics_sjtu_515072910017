% % This code is meant to solve problem 3
x = 0:0.5:25;
y = 0:0.5:25; y = y';
f = @(x,y) (x>=10 & x <=15 & y>=10 & y<=15)*(-4*pi/25) + 0;
ubottom = @(x) 10; utop = @(x) 10; 
uright = @(y) 10; uleft = @(y) 10;
[A, U] = DirichletPDE(x,y,f,uleft,uright,ubottom,utop);
[X, Y] = meshgrid(x, y(end:-1:1));
surfc(X,Y,U);
xlabel("X"); ylabel("Y"); zlabel("V"); colorbar;

