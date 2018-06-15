% % This code is meant to solve problem 3
Set up
n = 1:100; step = zeros(size(n)); 
for j=1:length(n)
    disp(j)
    tmpstep = zeros(1000,1);    % Run for 1000 tiems and average
    for i=1:length(tmpstep)
        tmpstep(i) = Absorb(j);
    end
    step(j) = mean(tmpstep);
end
plot(n, step); hold on; plot(n, n.^2);
grid on; xlabel("n"); ylabel("Number of steps");
legend("Estimate result", "Analytic result");

% Funciton which return steps it need to be absorbed
function step = Absorb(n)
current = 0; direct = -1; step = 0;
while(current ~= n)
    r = rand();
    if current ==0      % Reflect and change direction
        direct = -direct;
        current = 1;
    else
        if r < 0.5      % go left
            current = current-direct;
        else            % go right
            current = current+direct;   
        end
    end
    step = step+1;  
end
end
