function [Mmean, Emean] = IsingModel(N, T, H)
% % Input:
% N: Lattice size
% T: Temperature
% H: Magnetic field
% % Output:
% Mmean: Mean spin of each lattice
% Emean: Mean energy of each lattice
%% Initial parameter
J = 1;      % Exchange constant
k = 1;      % Boltzman constant
mu = 1;  % Magnetic moment o f atom
spin = (rand(N) > 0.5)*2 - 1;   % Initial spin 
%% Metropolis Algorithm
Mmean = 0;
for i=1:1000
    % Calculate the number of neighbors of each cell
    neighbors = circshift(spin, [0 1]) + ...
    circshift(spin, [0 -1]) + ...
    circshift(spin, [1 0]) + ...
    circshift(spin, [-1 0]);
    % Calculate the change in energy of flipping a spin
    dE = 2 * J * (spin .* neighbors) + 2* mu*H .* spin;
    % Calculate the transition probabilities
    pTran = exp(-dE / (k * T));
%     pTran = min(1,exp(-dE/k/T));
    % Decide which transitions will occur
    transitions = (rand(N) < pTran ).*(rand(N) < 0.1) * -2 + 1;
    % Perform the transitions
    spin = spin .* transitions;
    Mmean = Mmean + mean(spin(:));
end
%% Calculate the mean value
E = -sum(dE(:))/2; 
Emean = E / numel(spin);
Mmean = Mmean ./ 1000;