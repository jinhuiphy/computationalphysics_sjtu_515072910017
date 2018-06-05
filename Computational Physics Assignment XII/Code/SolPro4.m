% % This code is meant to solve problem 4
% Numrical result
Res = zeros(8,1000);
meanRes = zeros(size(Res,1),1);
RandTime = zeros(size(Res,1),1);
error = zeros(1,4);
for i = 1:size(Res,1)
    RandTime(i) = 1000*2^(i);
    for time=1:size(Res,2)
        A = rand(RandTime(i),4);
        Ans = sum(A.^2,2);
        Num = sum(Ans<1);
        Res(i,time) = Num/length(Ans);
    end
    meanRes(i) = mean(Res(i,:));
    error(i) = std(Res(i,:));   
end
load('Pro4.mat');
% Compare and plot
yyaxis left
plot(RandTime,error,'-o');
xlabel("The number of random number");
ylabel("Statistical uncertainty");
ExactValue = pi^2/32*ones(size(Res,1),1);
yyaxis right
plot(RandTime, meanRes, '-o',RandTime, ExactValue, '--');
ylabel('Result')
legend("Uncertainty", "Calculated result", "Actual result");
xlim([0 256000]); grid on;
