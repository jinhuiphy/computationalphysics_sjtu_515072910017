% % This code is meant to solve problem 2
%% Part (a)
clear;
g = 9.81; l = 1; m = 1;
thetaIni = pi ./ [128,64,32,16,8,4,3,2];
tRange = [0,4*pi]; stepSize = 0.01;
for i=1:length(thetaIni)
    yInitial = [thetaIni(i),0];
    f = @(x,y) [y(2,1);-g * sin(y(1,1)) / l ];
    y = RK4System(f, tRange, yInitial, stepSize);
    theta = y(1,:); omega  = y(2,:); t = 0:stepSize:tRange(2);
    figure(1); plot(t, theta); hold on;
    figure(2); plot(theta, omega); hold on;
end
figure(1)
legend("\pi/128","\pi/64","\pi/32","\pi/16","\pi/8","\pi/4","\pi/3","\pi/2");
xlabel("Time t"); ylabel("Angular position \theta"); 
figure(2)
legend("\pi/128","\pi/64","\pi/32","\pi/16","\pi/8","\pi/4","\pi/3","\pi/2");
xlabel("Angular position \theta"); ylabel("Angular velocity \omega"); 

%% Part (b)
PE = m*g*l*(1-cos(theta));
KE = 0.5*m*(omega*l).^2;
figure(); plot(t, PE, t, KE, t, PE+KE);
legend("PE", "KE", "Total"); xlabel("Time t"); ylabel("Energy");

%% Part (c)
% change tRange = [0,4*pi] into tRange = [0,10*pi] in Part (a)
numPrecision = -log10(abs(PE + KE - PE(1) - KE(1)) / (PE(1) + KE(1)));
figure(); plot(t, numPrecision);
xlabel("Time t"); ylabel("Precision");

%% Part (d)
clear;
g = 9.81; l = 1; m = 1;
thetaIni = pi ./ [128,64,32,16,8,4,3,2];
tRange = [0,10*pi]; stepSize = 0.01;
allT = zeros(1,length(thetaIni));
fprintf("------------------------Part (d)--------------------------\n");
for i=1:length(thetaIni)
    yInitial = [thetaIni(i),0];
    f = @(x,y) [y(2,1);-g * sin(y(1,1)) / l ];
    y = RK4System(f, tRange, yInitial, stepSize);
    theta = y(1,:); omega  = y(2,:); t = 0:stepSize:tRange(2);
    [val,loc] = findpeaks(theta); T = 0;    % sum of every period
    for j=1:length(loc)-1    
        T = T + t(loc(j+1)-loc(j));
    end
    allT(1,i) = T / (length(loc)-1);
    fprintf("Initial theta = %f, Average T = %f, %d Periods\n", ...
            thetaIni(i), allT(1,i), (length(loc)-1));
end
figure(); plot(thetaIni, allT, '-o'); hold on;
xlabel("Initial angle \theta");ylabel("Peroid");

%% Part (e)
T_int = zeros(1,length(thetaIni));  % T by integration
for i=1:length(thetaIni)
    ini = thetaIni(i);
    f = @(x) 1 ./ sqrt(cos(x)-cos(ini));
    T_int(1,i) = 4*sqrt(l/(2*g))*integral(f,0,ini);
end
T_approx = ones(size(T_int))*2*pi*sqrt(l/g);    % T by approximation
plot(thetaIni, T_int, '-o', thetaIni, T_approx, '-o');
legend("Peroid in (d)", "Peroid by integration", "Peroid by approximation");



