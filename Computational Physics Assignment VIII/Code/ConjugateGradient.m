function res = ConjugateGradient(A, b, x, N)
% % This code use Conjugate Gradient Method 
% % to solve Ax = b
% % % Ax = b
% % % N: the number of iterations
% % % res: the final result
tol = 1e-4;
r = b - A*x;
p = r;
for i=1:N
    alpha1 = (r'*r) / (p'*A*p);
    x = x + alpha1*p;
    tmp = r;
    r = r - alpha1*A*p;
    beta1 = (r'*r) / (tmp'*tmp);
    p = r + beta1*p;
    if norm(r,2) < tol
        break;
    end  
end
res = x;
