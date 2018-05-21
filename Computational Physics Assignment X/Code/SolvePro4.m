% This code is meant to solve problem 4
%% Part (a)
% Initial value
GMs = 4*pi^2; alpha = 0.01; dt = 0.0001;
Fg = @(r) -GMs / r.^3 *(1+alpha./r.^2);    
x=0.47; y=0; v_x=0; v_y=8.2; 
yIni = [x; v_x; y; v_y]; tRange = [0, 1];
Radius = @(x,y) sqrt(x.^2 + y.^2);  % To calculate the radius r
f = @(t,y) [y(2,1); Fg(Radius(y(1,1),y(3,1)))*y(1,1); y(4,1); Fg(Radius(y(1,1),y(3,1)))*y(3,1)];
% Calculate by RK4's method
y = RK4System(f, tRange, yIni, dt);
% plot(y(1,:), y(3,:)); xlabel("x (AU)"); ylabel("y (AU)"); grid on;
%% Part (b)
% Simply change the alpha = 0.0008 and dt = 0.0001 in Part (a)
GMs = 4*pi^2; alpha = 0.0032; dt = 0.0001;
Fg = @(r) -GMs / r.^3 *(1+alpha./r.^2);    
x=0.47; y=0; v_x=0; v_y=8.2; 
yIni = [x; v_x; y; v_y]; tRange = [0, 5];
Radius = @(x,y) sqrt(x.^2 + y.^2);  % To calculate the radius r
f = @(t,y) [y(2,1); Fg(Radius(y(1,1),y(3,1)))*y(1,1); y(4,1); Fg(Radius(y(1,1),y(3,1)))*y(3,1)];
% Calculate by RK4's method
y = RK4System(f, tRange, yIni, dt); figure();
% plot(y(1,:), y(3,:)); xlabel("x (AU)"); ylabel("y (AU)"); grid on; figure();
% Identifying the long axis of the orbit
t = tRange(1):dt:tRange(2); Angle = zeros(size(t)); 
for i=1:length(t)-1
    oldR = Radius(y(1,i), y(3,i));
    newR = Radius(y(1,i+1), y(3,i+1));
    tDer = (newR-oldR)/dt;
    if abs(tDer) <0.0025
        [theta, rho] = cart2pol(y(1,i+1), y(3,i+1));
        Angle(i)= 180*(theta/pi);
    end
end
t = tRange(1):dt:tRange(2); I = find(Angle < 0.01); t(I) = NaN; Angle(I)=NaN;

% Remove all NaN values from the array to reduce dataset size
t(isnan(t)) = []; Angle(isnan(Angle)) = [];

% Fit data
p = polyfit(t, Angle, 1); slope = p(1);
plot(t, Angle, 'o', t, polyval(p, t));
xlabel("Time (yr)"); ylabel("\theta (бу)"); figure();
title(['\theta vs Time for alpha=',num2str(alpha), ' and slope = ', num2str(slope)]);
%% Part (c)
alphaset = [0.0004, 0.0008, 0.001, 0.0016, 0.002, 0.0025, 0.003, 0.0032];
slopeset = [4.1807, 8.4385, 10.5976, 17.1796, 21.6667, 27.3956, 33.2522, 35.6311];
p = polyfit(alphaset, slopeset, 1); slope = p(1);
alphaExact = 1.1e-8; speed = slope * alphaExact; speedForCen = speed * 100 * 3600;
plot(alphaset, slopeset, 'o', alphaset, polyval(p, alphaset)); grid on;
xlabel('alpha'); ylabel('Speed of precession (бу/yr)');
title(["Speed of precession is ", num2str(speedForCen), "бу/s per century", ...
    "with alpha = ", num2str(alphaExact), "AU^{2}"]);



