% % This code is meant to solve problem 
%% Initial parameter
N = 10;     % Lattice size
step = 100;
Hs = linspace(-5,5,step);      % Magnetic field
Ts = [3,5];      % Temperature
Ms = zeros(step,length(Ts));
%% Monte Carlo Loop
for i=1:step
    H = Hs(i);
    for j=1:length(Ts)
        T = Ts(j);
        [Ms(i,j), ~] = IsingModel(N, T, H);
    end
end
%% Make plot
window = (2^-3)*step - 1;
for i=1:length(Ts)
    figure(i)
    hold on
    plot(Hs, Ms(:,i), '.');
    plot(Hs,movmean(Ms(:,i), window));
    hold off
    title(['|M| vs H —— T = ',num2str(Ts(i))]);
    xlabel('H'); ylabel('|M|'); grid on;
    legend('Raw','Moving mean','Location','NorthWest')
end
