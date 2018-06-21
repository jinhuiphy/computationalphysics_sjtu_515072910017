% % This code is meant to solve problem 3
%% Initial parameter
N = 10;     % Lattice size
H = 0;      % Magnetic field
step = 100;    % Total steps
Ts = linspace(0.5, 5, step);      % Temperature
Ms = zeros(step,1);
Es = zeros(step,1);
%% Monte Carlo Loop
for i=1:step
    T = Ts(i);
    [Ms(i), Es(i)] = IsingModel(N, T, H);
end
%% Calculate susceptibility and plot
chi = zeros(step,1); chi(1) = 0;    
window = (2^-3)*step - 1;       % Calculate the mean value of M
Mmean = movmedian(abs(Ms), window);
for i=2:step        % Calculate chi
    chi(i) = (Mmean(i) - Mmean(i-1)).^2 ./ Ts(i);
end
plot(Ts, chi);
title('Susceptibility vs Temperature');
xlabel('kT'); ylabel('\chi'); grid on;