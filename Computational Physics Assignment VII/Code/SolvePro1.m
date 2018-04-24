% % CodeName: SolvePro1.m
% % This code is meant to solve problem 1

% Calculate A in (a)
p = 0.85; n = 4;
G = [0, 0, 0, 0;1, 0, 1, 0;1, 0, 0, 1;0, 0, 1, 0];
c = full(sum(G));
delta = (1 - p )./n;
A = zeros(n, n);
for i = 1:n
    for j = 1:n    
        if c(1, j) == 0
            A(i, j) = 1./n;
        else
            A(i, j) = p .* G(i, j) ./ c(1, j) + delta;
        end
    end 
end
format short; disp(c) ;disp (A);

% Get the equilibrium state in (b)
tolerance = 1e-6;   
x = ones(n, 1) / n;
for i = 1:1000
    old = x(1, 1);
    x = A * x;
    if abs(x(1, 1) - old) < tolerance
        disp(x);
        break;  
    end
end

% Calculate the rank
k = find(c~=0);
D = sparse(k, k, 1./c(k), n, n);
e = ones(n, 1);
I = speye(n, n);
x = GaussPivotScale(I - p*G*D, e);
disp(x);


