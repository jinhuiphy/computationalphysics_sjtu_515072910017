% E = 0:25:200;
% f = [10.6 16.0 45 83.5 52.8 19.9 10.8 8.25 4.7];
% Ei = [10 90 185];
% 
% for i = 1:length(Ei)

h = [0.1 0.01 0.001 0.0001];

for i = 1:4
    digits(8);
    y1 = vpa(cos(1+ h(i)));
    y_1 = vpa(cos(1-h(i)));
    y = vpa((y1- y_1)./(2.*h(i)));
    fprintf('y1 = %.8f, y_1 = %.8f, y = %.8f\n', y1, y_1, y);
end