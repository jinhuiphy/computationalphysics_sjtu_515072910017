% % This code is meant to solve problem 1
clear;
u0 = 5; u1 = 10; h = 0.05; 
alpha = 5; beta = 10; xRange = [0,1];
% Shoot Method
f = @(x,u) [u(2,1); 2*u(2,1) - u(1,1) + x.^2 - 1];
yInitial = [u0,u1]; boder = [0,10];
[x, y, c] = ShootMethod(f, xRange, yInitial, h, boder);
plot(x,y(1,:),'+'); hold on;
% Finite Method 
p = @(x) 2; q = @(x) -1; r = @(x) x.^2 - 1;
x = 0:h:1; ini = [alpha, beta];
u = FiniteMethod(p,q,r,x,ini);
plot(x,u, '-x'); hold on;
% Exact Value
exactF = @(x) x.^2 + 4.*x + 5;
plot(x, exactF(x), '-o'); grid on
legend('Shoot Method', 'Finite Method', 'Exact Value');
xlabel('{\it x}'); ylabel('{\it u}');

