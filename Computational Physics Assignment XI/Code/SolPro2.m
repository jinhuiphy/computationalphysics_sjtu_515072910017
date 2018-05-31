% Initial value
N = 50; % Number of points
r = linspace(2,4,N);
theta = linspace(0,2*pi,N);
exactU = (3*r/2)' * cos(theta);
U = zeros(N);
% Boundary condition
U(1,:) = 3*cos(theta); U(end,:) = 6*cos(theta);
U(:,1) = exactU(:,1); U(:,end) = exactU(:,end);
% Charge density
f = @(r,theta) r*0 + theta*0;
% Solve the problem
[k, U] = PDE_Polar(r, theta' , f, U);
[X, Y] = meshgrid(r, theta(end:-1:1));
% Compare
subplot(2,1,1); surfc(X,Y,U); colorbar;
xlabel("Radius"); ylabel("Theta"); zlabel("U"); title("Numrical Result");
subplot(2,1,2); surfc(X,Y,exactU); colorbar;
xlabel("Radius"); ylabel("Theta"); zlabel("U"); title("Analytical Result"); 
figure(); surfc(X,Y,abs(exactU-U)./exactU); colorbar;
xlabel("Radius"); ylabel("Theta"); zlabel("Relative Eoor");
