function [L,U] = DoolittleFactor(A)
%
% DoolittleFactor returns the Doolittle factorization of
% matrix A.
%
% [L,U] = DoolittleFactor(A) where
%
% A is an n-by-n matrix,
%
% L is the lower triangular matrix with 1¡¯s along the
% diagonal,
% U is an upper triangular matrix.
%
% Ramin S. Esfandiari, Numerical Methods for Engineers and Scientists Using
% Matlab,
% Section 4.4.1, p.113

n = size(A,1);
L = eye(n); U = zeros(n,n); % Initialize

for i = 1:n,
    U(i,i) = A(i,i)-L(i,1:i-1)*U(1:i-1,i);
    for j = i+1:n,
        U(i,j) = A(i,j)-L(i,1:i-1)*U(1:i-1,j);
        L(j,i) = (A(j,i)-L(j,1:i-1)*U(1:i-1,i))/U(i,i);
    end
end