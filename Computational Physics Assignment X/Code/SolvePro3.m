% This code is meant to solve problem 3
% Initial value
K = 237; C = 900; L = 1; Density = 2700; Num = 50;
t = linspace(0,1,Num); x = linspace(0,L,Num);
u0 = sin(pi.*x./L); alpha = sqrt(K/(C*Density));
uApprox = Heat1DCN(t, x, u0, alpha);
T = @(x,t) sin(pi.*x./L).*exp(-pi.^2.*K.*t./(L.^2.*C.*Density));
uExact = zeros(size(uApprox));
for i=1:Num
    uExact(i,:) = T(x(i), t);
end

subplot(2,1,1);
surfc(x,t,uApprox); xlabel('x'); ylabel('t'), zlabel('T'); 
title(['Approxmite value with ', num2str(Num), ' steps']); 
subplot(2,1,2);
surfc(x,t,uExact); xlabel('x'); ylabel('t'), zlabel('T'); 
title(['Exact value with ', num2str(Num), ' steps']); 
