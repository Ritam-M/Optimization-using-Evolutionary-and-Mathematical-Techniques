function [H,NFE] = hes(fun,R,X,h,NFE)
H = zeros(length(X));
% for each dimension of objective function
for i=1:length(X)
    % derivative at left point
    x1 = X;               
    x1(i) = X(i) - h;
    [df1,NFE] = grad(fun,R,x1, h,NFE);
    
    % derivative at right point
    x2 = X;
    x2(i) = X(i) + h;
    [df2,NFE] = grad(fun,R,x2, h,NFE);
    
    % differentiate between the two derivatives
    d2f = (df2-df1) / (2*h);
    
    % assign as row i of Hessian
    H(i,:) = d2f';
end

%Jacobian of gradient is hessian