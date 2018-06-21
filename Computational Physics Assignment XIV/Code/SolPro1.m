% % This code is meant to solve problem 1
%% Initial parameter
N = 10;     % Lattice size
H = 0;      % Magnetic field
% trial = 20;
% trialTc = linspace(2.2, 2.4, trial);
Tc = 2*J / log(1+sqrt(2));      % Curie temperature
for j=1:1
%     Tc = trialTc(j);
    Tc = 2*J / log(1+sqrt(2));      % Curie temperature
    step = 100;    % Total steps
    Ts = linspace(2, Tc, step);      % Temperature
    Ms = zeros(step,1);
    Es = zeros(step,1);
    %% Monte Carlo Loop
    for i=1:step
        T = Ts(i);
        [Ms(i), Es(i)] = IsingModel(N, T, H);
    end
    %% 
    window = (2^-3)*step - 1;
    Mmean = movmean(Ms, window);

    plot(log(Tc-Ts),log(Mmean),'DisplayName',num2str(Tc));
    hold on;
end
% legend(num2str(trialTc));
legend('show')
