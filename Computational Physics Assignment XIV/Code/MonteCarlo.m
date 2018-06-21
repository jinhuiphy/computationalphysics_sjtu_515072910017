%% Initial parameter
N = 10;     % Lattice size
H = 1;      % Magnetic field
step = 1000;    % Total steps
Tc = 2*J / log(1+sqrt(2));      % Curie temperature
Ts = linspace(0, 5, step);      % Temperature
Ms = zeros(step,1);
Es = zeros(step,1);
%% Monte Carlo Loop
for i=1:step
    T = Ts(i);
    [Ms(i), Es(i)] = IsingModel(N, T, H);
end
%% Plot Mean Energy Per Spin vs Temperature
plot(Ts, Es, '.');
hold on;
window = (2^-3)*step - 1;
plot(Ts, movmean(Es, window));
plot(Ts, movmedian(Es, window));
hold off;
title('Mean Energy Per Spin vs Temperature');
xlabel('kT'); ylabel('<E>'); grid on;
legend('Raw','Moving mean','Moving median', 'Location','NorthWest')
%% Plot Magnetization vs Temperature
figure();
plot(Ts, abs(Ms), '.');
hold on;
plot(Ts, movmean(abs(Ms), window));
plot(Ts, movmedian(abs(Ms), window));
hold off;
title('Magnetization vs Temperature');
xlabel('kT'); ylabel('|M|'); grid on;
legend('Raw','Moving mean','Moving median', 'Location','NorthEast')