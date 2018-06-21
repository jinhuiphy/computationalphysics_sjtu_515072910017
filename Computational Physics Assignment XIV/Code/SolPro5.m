% % This code is meant to solve problem 5
%% Initial parameter
N = 10;     % Lattice size
step = 300; % Step number
Hs = linspace(0,step,step);      % Magnetic field
Ts = [10,30,100,200];      % Temperature
Ms = zeros(step,length(Ts));
%% Monte Carlo Loop
for i=1:step
    H = Hs(i);
    for j=1:length(Ts)
        T = Ts(j);
        [Ms(i,j), ~] = IsingModel(N, T, H);
    end
end
%% Plot and compare
Exact = @(H,T) tanh(H./T);
window = (2^-3)*step - 1;
hold on;
for i=1:length(Ts)
    plot(Hs,Ms(:,i),'.','DisplayName',['T = ', num2str(Ts(i))]);
    plot(Hs,Exact(Hs,Ts(i)),'DisplayName',['T = ', num2str(Ts(i))]);
end
hold off
legend('show'); axis([0 step 0 1]);
xlabel('H'); ylabel('<M>'); grid on;
title('Average M vs H');