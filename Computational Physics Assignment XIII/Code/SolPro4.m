% % This code is meant to solve problem 4
%% Part (b)
% Set up
pp = linspace(0.5,0.7,200); L = 0:1:50;
pOpen = zeros(size(pp)); ave = zeros(size(L));
for k=1:length(L)
    Li = L(k); 
    pro = zeros(10,1);
    for j=1:10   
        for i=1:length(pp)
            [isPerco, ~, pOpen(i)] = percolation(Li,pp(i));
            if isPerco
                pro(j) = pOpen(i);
                break
            end
        end
    end
    ave(k) = mean(pro);
end
% Plot 
plot(L, ave); grid on;
xlabel("L"); ylabel("p_{c}");
title(["Average p_{c} = ", num2str(mean(ave(20:end)))]);
%% Part(c)
pp = linspace(0.5,1,20);
FF = zeros(size(pp));
L = 25;
for i=1:length(pp)
    p = pp(i);
    [~, F, ~] = percolation(L,p);
    FF(i) = F;
end
plot(pp,FF, '-o');
grid on; xlabel("{\it p}"); ylabel("\it F");

