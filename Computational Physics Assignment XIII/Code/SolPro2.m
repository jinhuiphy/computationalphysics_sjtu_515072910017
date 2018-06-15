% % This code is meant to solve problem 2
% Set up
aa = linspace(-1,1,100);
N = 1e2; n = 100;
I_pi = zeros(size(aa));
I_var = zeros(size(aa));
% Exact value
syms x;
f = 1./(x.^2 + (cos(x)).^2);
I_exact = vpa(int(f,x,0,pi));
% Importance method
for i=1:length(aa)
    a = aa(i);
    I = zeros(1,n);
    for j = 1:n
        rng('shuffle'); % Different seed
        Y = rand(1,N);
        X = -log(Y) ./ a;
        FF = 1./(X.^2 + (cos(X)).^2);
        I(j) = pi*mean(FF);
    end
    I_pi(i) = mean(I);  % Estimate intergral
    I_var(i) = abs(I_pi(i)-I_exact);    % Variance with exact value
end
load('Pro2.mat');
% Plot
index = find(I_var == min(min(I_var)));
plot(aa,I_pi); hold on; 
plot(aa,abs(I_var)); grid on;
xlabel('a'); ylabel('Value'); title(['a = ', num2str(aa(index))]);
legend('Estimate Integral', 'Variance');