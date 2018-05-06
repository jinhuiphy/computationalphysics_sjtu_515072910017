% % CodeName:SolvePro2.m
% % This code is meant to solve problem 2
% Initial data
x = [1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
y = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';
b = -ones(size(x));
A = [x.^2, x.*y, y.^2, x, y];
ini = [2,0.01,5.5,-1.2,-7.3]';      % Gauss value
sol = ConjugateGradient(A'*A,A'*b,ini,100);

% Plot
plot(x,y,'b*'); hold on
Z = sol(1)*X.^2 + sol(2)*X.*Y + sol(3)*Y.^2 + sol(4)*X + sol(5)*Y + 1;
[X,Y] = meshgrid(-1:0.1:2,0:0.1:1.5);
contour(X,Y,Z,[0,0]);hold on;
xlabel('X'); ylabel('Y')
axis([-1,1.5,0,1.5]);