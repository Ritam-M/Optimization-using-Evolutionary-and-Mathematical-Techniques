function [G,NFE] = grad(fun,R,X,h,NFE)
G = zeros(length(X), 1);
% for each dimension
for i=1:length(X)
    % vary variable i by a small amount (left and right)
    x1 = X;
    x2 = X;
    x1(i) = X(i) - h;
    x2(i) = X(i) + h;
    
    % evaluate the objective function at the left and right points
    [y1,NFE] = fun(x1,R,NFE);
    [y2,NFE] = fun(x2,R,NFE);
    G(i) = (y2 - y1) / (2*h);
end