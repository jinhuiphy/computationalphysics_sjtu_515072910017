function [X] = MultiNewton(SymFunction, SymVariable, Tolerance, IniValue)
% CodeName: MultiNewton.m
% This code is meant to search root for multiply suitation, 
% using N-dimensional Newton-Raphson method
% Input:
% % SymFunction: the equation you'd like to solve, a list form
% % SymVariable: the variable you'd like to search for, a list form
% % Tolerance: the accurancy
% % IniValue: the initial value, a list form 
% Output:
% % X: the root, a list form
% Example:
% % Sol = MultiNewton([F1;F2;F3], [a1, a2, a3], 1e-5, [10, 1, 1]);

Jacob = jacobian(SymFunction, SymVariable);
X = IniValue;
while 1
    F = subs(SymFunction, SymVariable, X);
    J = subs(Jacob, SymVariable, X);
    if ~isnumeric(J)
        J = eval(J);
    end
    fprintf("F:\n");
    disp(vpa(F'));
%     fprintf("J:\n");
%     disp(vpa(J));
    d_X = J \ F;
%     fprintf("d_X:\n");
%     disp(vpa(d_X.'));
    X = X - d_X.';
%     fprintf("X:\n");
%     disp(vpa(X));
    if (sqrt(sum(d_X.^2)) < Tolerance)
        break;     
    end
end
end