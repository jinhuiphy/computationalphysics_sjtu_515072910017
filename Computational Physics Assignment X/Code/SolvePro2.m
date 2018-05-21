% % This code is meant to solve problem 2
% Initial value
f0 = 200; x0 = 0.25;
Length = 3; Width = 0.2; Thick = 0.03;
Density = 3; Young = 1e9; G = 9.8;
I = Thick^3 *Width / 3;
f1 = @(x) (abs(x - Length/2) <= x0).*(-f0*(exp(-(x-Length/2).^2 / x0.^2) - exp(-1)) - Density * G) ...
    + (abs(x - Length/2) > x0).* (-Density * G);
f = @(x,u) [u(2,1); f1(x) / (Young*I)];
uIni = [0, 0]; boder = [0,Length];
xRange = [0,Length]; h = 0.05;
% By shooting method
[x, y, c] = ShootMethod(f, xRange, uIni, h, boder);
plot(x, y(1,:),'-o'); hold on;
% By finite method
p = @(x) 0; q = @(x) 0; r = @(x) f1(x) / (Young*I);
x = 0:h:Length; ini = [0, 0];
u = FiniteMethod(p,q,r,x,ini);
plot(x, u, '-x'); grid on;
axis([0 3 0 0.035]);
legend('Shoot Method', 'Finite Method');
xlabel('{\it x}'); ylabel('{\it u}');