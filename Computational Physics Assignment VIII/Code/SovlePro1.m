% % CodeName:SolvePro1.m
% % This code is meant to solve problem 1
%% Part (a)
% Initial data
x = [1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
y = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';

% Least square
b = -ones(size(x));
A = [x.^2, x.*y, y.^2, x, y];
sol = A\b;
disp(sol)
% Plot
plot(x,y,'b*'); hold on
Z = sol(1)*X.^2 + sol(2)*X.*Y + sol(3)*Y.^2 + sol(4)*X + sol(5)*Y + 1;
[X,Y] = meshgrid(-1:0.1:2,0:0.1:1.5);
contour(X,Y,Z,[0,0]);hold on;
xlabel('X'); ylabel('Y')
axis([-1,1.5,0,1.5]);
%% Part (b)
x = x + 0.005*(2*rand(10,1)-1);
y = y + 0.005*(2*rand(10,1)-1);
b = -ones(size(x));
A = [x.^2, x.*y, y.^2, x, y];
sol = A\b;
Z = sol(1)*X.^2 + sol(2)*X.*Y + sol(3)*Y.^2 + sol(4)*X + sol(5)*Y + 1;
[X,Y] = meshgrid(-1:0.1:2,0:0.1:1.5);
contour(X,Y,Z,[0,0]);