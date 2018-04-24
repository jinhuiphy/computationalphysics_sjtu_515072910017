function x = BackSub(Ab)
%
% BackSub returns the solution vector of the upper
% triangular augmented matrix Ab using back substitution.
%
%   x = BackSub(Ab) where
%
%     Ab is the n-by-(n+1) augmented matrix,
%
%     x is the n-by-1 solution vector.
n = size(Ab, 1);
for k = n : -1 : 1
    Ab(k,:) = Ab(k,:)./Ab(k, k); % Construct multipliers
    Ab(1:k-1, n+1) = Ab(1:k-1, n+1)-Ab(1:k-1, k)*Ab(k, n+1);
    % Adjust rows
end
x = Ab(:, end);