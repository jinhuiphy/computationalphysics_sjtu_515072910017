% % This code is meant to solve problem 6
%% (a)
ht = 0.1; t = 0:ht:10;
hx = 0.25; x = 0:hx:3; x = x';
u = 3*x - x.^2; alpha2 = 0.2;
u = Heat1DFD(t, x, u, alpha2); u = u';
[X,T] = meshgrid(x,t);
surfc(X(1:10:end,:),T(1:10:end,:),u(1:10:end,:));
xlabel('Position x'); ylabel('Time t'); zlabel('Temperature T'); colorbar;
title('$u(0,t) = u(3,t) = 0$','interpreter','latex');
%% (b)
ht = 0.1; t = 0:ht:10;
hx = 0.25; x = 0:hx:3; x = x';
u = 3*x - x.^2; alpha2 = 1/5;
u = Heat1DFD_NE(t, x, u, alpha2); u = u';
[X,T] = meshgrid(x,t); figure();
surfc(X(1:10:end,:),T(1:10:end,:),u(1:10:end,:));
xlabel('Position x'); ylabel('Time t'); zlabel('Temperature T'); colorbar;
title('$u_{x}(0,t) = u_{x}(3,t) = 0$','interpreter','latex');
%% (c)
ht = 0.1; t = 0:ht:10;
hx = 0.25; x = 0:hx:3; x = x';
u = 3*x - x.^2; alpha2 = 1/5;
u = Heat1DFD_MIX_1(t, x, u, alpha2); u = u';
[X,T] = meshgrid(x,t); figure();
surfc(X(1:10:end,:),T(1:10:end,:),u(1:10:end,:));
xlabel('Position x'); ylabel('Time t'); zlabel('Temperature T'); colorbar;
title('$u_{x}(0,t) = u(3,t) = 0$','interpreter','latex');
%% (d)
ht = 0.1; t = 0:ht:10;
hx = 0.25; x = 0:hx:3; x = x';
u = 3*x - x.^2; alpha2 = 1/5;
u = Heat1DFD_MIX_2(t, x, u, alpha2); u = u';
[X,T] = meshgrid(x,t); figure();
surfc(X(1:10:end,:),T(1:10:end,:),u(1:10:end,:));
xlabel('Position x'); ylabel('Time t'); zlabel('Temperature T'); colorbar;
title('$u(0,t) = u_{x}(3,t) = 0$','interpreter','latex');
%% (e)
ht = 0.1; t = 0:ht:10;
hx = 0.25; x = 0:hx:3; x = x';
u = 3*x - x.^2; alpha2 = 1/5;
u = Heat1DFD_MIX_3(t, x, u, alpha2); u = u';
[X,T] = meshgrid(x,t); figure();
surfc(X(1:10:end,:),T(1:10:end,:),u(1:10:end,:));
xlabel('Position x'); ylabel('Time t'); zlabel('Temperature T'); colorbar;
title('$u(0,t) = 0, u_{x}(3,t) + u(3,t) = 0$','interpreter','latex');
