function I = Romberg(f,a,b,n,n_levels)
%
% Romberg uses the Romberg integration scheme to find
% integral estimates at different levels of accuracy.
%
% I = Romberg(f,a,b,n,n_levels) where
%
% f is an inline function representing the integrand,
% a and b are the limits of integration,
% n is the initial number of equal-length
% subintervals in [a,b],
% n_levels is the number of accuracy levels,
%
% I is the matrix of integral estimates.
%
% Ramin S. Esfandiari, Numerical Methods for Engineers and Scientists Using
% Matlab,
% Section 6.4.1, p.305
%
I = zeros(n_levels,n_levels); % Pre-allocate
% Calculate the first-column entries by using the
% composite trapezoidal rule, where the number of
% subintervals is doubled going from one element
% to the next.
for j = 1:n_levels,
    n_intervals = 2^(j-1)*n;
    I(j,1) = Trapezoid(f,a,b,n_intervals);
end
% Starting with the second level, use Romberg scheme to
% generate the remaining entries of the table.
for k = 2:n_levels,
    for j = 1:n_levels - k+1,
        I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1);
    end
end