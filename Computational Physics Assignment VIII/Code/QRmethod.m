function [e_val, e_vec, k] = QRmethod(A, x0, tol, N)
%
% QRmethod approximates the dominant eigenvalue and
% corresponding eigenvector of a square matrix.
%
% [e_val, e_vec, k]=QRmethod(A, x0, tol, N) where
%
%  A is an n-by-n matrix,
%  x0 is the n-by-1 initial guess (default ones) ,
%  tol is the tolerance (default 1e?4),
%  N is the maximum number of iterations (default 50),
%
%  e_val is the approximated dominant eigenvalue,
%  e_vec is the corresponding eigenvector,
%  k is the number of iterations required for convergence.
% 
T = A;
T(:,:,1) = T;
x(:,1) = x0./norm(x0,2);
for k=1:N
    x(:,k+1) = A*x(:,k);
    x(:,k+1) = x(:,k+1)./norm(x(:,k+1),2);
    [Q, R] = qr(T(:,:,k));      % use QR method
    T(:,:,k+1) = R*Q;
    if norm(diag(T(:,:,k+1)) - diag(T(:,:,k))) < tol
        break;
    end
end
e_val = max(diag(T(:,:,end)));e_vec = x(:, end);
